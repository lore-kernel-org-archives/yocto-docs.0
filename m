Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.3437.1621062777677677720
 for <docs@lists.yoctoproject.org>;
 Sat, 15 May 2021 00:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7DF1120002;
	Sat, 15 May 2021 07:12:55 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 1/3] Makefile: allow epub and latexpdf outputs to use diagrams from SVG sources
Date: Sat, 15 May 2021 09:12:17 +0200
Message-Id: <20210515071219.307241-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

html output is great when directly using SVG
epub output has to use exported PNG because of issues using SVG directly
latexpdf output cannot use SVG, it needs exported PDF instead

This adds rules to generate PNG and PDF formats from new SVG sources.

Newly added diagrams have be stored in svg/ subdirectories
so that PNG and PDF files generated from SVG can be "gitignored"
without ignoring the original PNG diagrams that have no SVG source.

Note: had to remove the dependency to "Makefile" in the final "catch-all" target,
otherwise it was also catching my SVG to PNG and SVG to PDF targets.
Any suggest to avoid having to do this?

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/.gitignore |  2 ++
 documentation/Makefile   | 29 ++++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/documentation/.gitignore b/documentation/.gitignore
index c44580b088..35ead8af66 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -1,3 +1,5 @@
 _build/
 Pipfile.lock
 .vscode/
+*/svg/*.png
+*/svg/*.pdf
diff --git a/documentation/Makefile b/documentation/Makefile
index d40f390e2b..acb09726cd 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -6,8 +6,11 @@
 SPHINXOPTS    ?= -j auto
 SPHINXBUILD   ?= sphinx-build
 SOURCEDIR     = .
+IMAGEDIRS     = */svg
 BUILDDIR      = _build
 DESTDIR       = final
+SVG2PNG       = inkscape
+SVG2PDF       = inkscape
 
 ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
 $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
@@ -17,7 +20,7 @@ endif
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-.PHONY: help Makefile clean publish
+.PHONY: help Makefile clean publish epub latexpdf
 
 publish: Makefile html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
@@ -26,10 +29,30 @@ publish: Makefile html singlehtml
 	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
 	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
 
+# Build a list of SVG files to convert to PDFs
+PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
+
+# Build a list of SVG files to convert to PNGs
+PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
+
+# Pattern rule for converting SVG to PDF
+%.pdf : %.svg
+	$(SVG2PDF) --export-filename=$@ $<
+
+# Pattern rule for converting SVG to PNG
+%.png : %.svg
+	$(SVG2PNG) --export-filename=$@ $<
+
 clean:
-	@rm -rf $(BUILDDIR)
+	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs)
+
+epub: $(PNGs)
+	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+
+latexpdf: $(PDFs)
+	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
 # Catch-all target: route all unknown targets to Sphinx using the new
 # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
-%: Makefile
+%:
 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
-- 
2.25.1

