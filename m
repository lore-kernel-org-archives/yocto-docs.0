Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015FCC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 12:22:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.10981.1633522967092992189
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 05:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7EDB41C0012;
	Wed,  6 Oct 2021 12:22:44 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/4] Makefile: allow epub and latexpdf outputs to use diagrams
 from SVG sources
Date: Wed,  6 Oct 2021 14:22:35 +0200
Message-Id: <20211006122238.959343-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16834414503E8A25.21857@lists.yoctoproject.org>
References: <16834414503E8A25.21857@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 12:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1926

html output is great when directly using SVG
epub output has to use exported PNG because of issues using SVG directly
latexpdf output cannot use SVG, it needs exported PDF instead

This adds rules to generate PNG and PDF formats from new SVG sources.

Newly added diagrams have be stored in svg/ subdirectories
so that PNG and PDF files generated from SVG can be "gitignored"
without ignoring the original PNG diagrams that have no SVG source.

Note: had to remove the dependency to "Makefile" in the final "catch-all" target,
otherwise it was also catching the SVG to PNG and SVG to PDF targets.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/.gitignore |  2 ++
 documentation/Makefile   | 29 ++++++++++++++++++++++++++---
 documentation/README     |  2 ++
 3 files changed, 30 insertions(+), 3 deletions(-)

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
index 996f01b7d5..f015026562 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -6,8 +6,11 @@
 SPHINXOPTS    ?= -W --keep-going -j auto
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
diff --git a/documentation/README b/documentation/README
index 1e7b4f0e65..6b72f82441 100644
--- a/documentation/README
+++ b/documentation/README
@@ -113,6 +113,8 @@ To install all required packages run:
 
  $ pip3 install sphinx sphinx_rtd_theme pyyaml
 
+Also install the "inkscape" package from your distribution.
+
 To build the documentation locally, run:
 
  $ cd documentation
-- 
2.25.1


