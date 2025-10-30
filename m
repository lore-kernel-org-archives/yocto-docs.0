Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB7ACCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:18:07 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web11.214.1761837483795096605
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 08:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cy7621gVJzl3K;
	Thu, 30 Oct 2025 16:18:02 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cy7615lyNz2sF;
	Thu, 30 Oct 2025 16:18:01 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 30 Oct 2025 16:17:48 +0100
Subject: [PATCH RFC 3/3] convert SVGs to PDF and PNG using rsvgconverter
 plugin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-fix-make-multi-target-v1-3-213616ed1f0a@cherry.de>
References: <20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de>
In-Reply-To: <20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 15:18:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7923

From: Quentin Schulz <quentin.schulz@cherry.de>

The rsvgconverter plugin allows to generate a PDF or PNG from an SVG.
This is what we already do manually via Make targets but it isn't good
enough.

Sphinx generates a cache upon first parsing and stores it in a doctrees
directory. Sphinx claims that it can be shared between all builders[1].
For glob patterns in image or figure directives, Sphinx will look for
all possible matches in the source tree and store those in a
"candidates" map for each file, along with the associated mimetype. When
building, Sphinx will then look in this map to try to find a match in
the current builder's supported_image_types. If none is found, the build
will fail.

The latexpdf (using the LaTeXBuilder) target does not support SVGs by
default[2]. We used Make to generate PDFs from them before generating
the doc PDF though (see PDFs variable and %.pdf in Makefile) and that
type is supported by default[2].

The epub (via the Epub3Builder) target does support SVGs by default[3]
but we disabled their support in commit ff3876ca4910 ("conf.py: use PNG
first in EPUB output"). We used Make to generate PNGs from them before
generating the doc epub though (see PNGs variable and %.png in Makefile)
and that type is supported (c.f. Epub3Builder.supported_image_types in
our conf.py).

The issue is that this is done transparently from Sphinx. When we
generate the PDFs or PNGs variants of the SVGs, we put them in-tree
directly along their source file. Then, when caching, Sphinx will find
both the source file and the appropriate variant. However, the cache
isn't updated if there are new files in the tree and the source rST
files aren't modified. So, the cache will not have its map updated and
we won't be able to find the new variant when building for a
non-SVG-compatible builder. Take the following scenario:

- start from a clean source file (fresh clone or git clean -ffdx)
- build the html target (which supports SVGs by default[4])
- sphinx will find all the files in the source tree matching the glob
  pattern in ".. image:: test.*", in our case only an SVG since the PDFs
  and PNGs are only generated for the latexpdf and epub targets
  respectively. The cache will only store the path to the SVG file
  because it is the only source file that matches the glob,
- attempt to build the epub target (which doesn't support SVGs, only
  PNGs)
- Sphinx checks for the file to include for '.. image:: test.*' and
  finds an SVG in the cache map and then check the list of supported
  image types for the Epub3Builder and find that it doesn't support
  that. It cannot find anything satisfying the dependency and thus fails
  to build.

This scenario can easily be reproduced by running the `make all` command
since the html builder will be used first, then epub and finally
latexpdf.

The `make publish` target works by chance, because the epub builder is
built first and will cache SVG + PNG for each glob, then the latexpdf
builder is built and supports PNGs so that's fine and then html, which
supports SVG as well.

To fix this issue, we could simply always generate PDFs and PNGs of all
SVGs in the source tree, but this isn't ideal.

Instead, let's use an ImageConverter from a Sphinx plugin. This allows
to map a plugin as being able to generate a file of type Y from a file
of type X. When Sphinx wants to build an image, it'll try to find the
image with the type the current builder supports in the cache. If it
cannot, it's going to try to find an ImageConverter plugin that is able
to convert one of the image types in cache with one of the image types
the current builder supports. Then Sphinx will call this plugin to
generate the file and put it into the build directory (not in the
source!).

This allows to simplify the Makefile as well and is a much cleaner
approach.

The epub target is removed as the catch-all target contains the same
instructions as the epub target we remove in this commit.

Ideally, we shouldn't use our in-tree fork but the upstream project
sphinxcontrib.rsvgconverter, though it currently only supports
generating PDFs from SVGs and we also need PNGs. A merge request to add
support for this is pending[5].

[1] https://www.sphinx-doc.org/en/master/man/sphinx-build.html#cmdoption-sphinx-build-d
[2] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.latex.LaTeXBuilder.supported_image_types
[3] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.epub3.Epub3Builder.supported_image_types
[4] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.html.StandaloneHTMLBuilder
[5] https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/pull/31

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/Makefile | 26 +++-----------------------
 documentation/conf.py  |  5 +++++
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index bade78fe8..2d6baed65 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -13,8 +13,6 @@ SPHINXLINTDOCS ?= $(SOURCEDIR)
 IMAGEDIRS      = */svg
 BUILDDIR       = _build
 DESTDIR        = final
-SVG2PNG        = rsvg-convert
-SVG2PDF        = rsvg-convert
 
 ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
 $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
@@ -24,7 +22,7 @@ endif
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf
+.PHONY: all checks help Makefile clean stylecheck publish latexpdf
 
 publish: Makefile checks epub latexpdf html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
@@ -35,22 +33,8 @@ publish: Makefile checks epub latexpdf html singlehtml
 	cp $(BUILDDIR)/singlehtml/index.html $(BUILDDIR)/$(DESTDIR)/singleindex.html
 	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
 
-# Build a list of SVG files to convert to PDFs
-PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
-
-# Build a list of SVG files to convert to PNGs
-PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))
-
-# Pattern rule for converting SVG to PDF
-%.pdf : %.svg
-	$(SVG2PDF) --format=Pdf --output=$@ $<
-
-# Pattern rule for converting SVG to PNG
-%.png : %.svg
-	$(SVG2PNG) --format=Png --output=$@ $<
-
 clean:
-	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst
+	@rm -rf $(BUILDDIR) poky.yaml sphinx-static/switchers.js releases.rst
 
 checks:
 	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
@@ -62,14 +46,10 @@ stylecheck:
 sphinx-lint:
 	sphinx-lint $(SPHINXLINTDOCS)
 
-epub: $(PNGs)
-	$(SOURCEDIR)/set_versions.py
-	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
-
 # Note: we need to pass buf_size here (which is also configurable from
 # texmf.cnf), to avoid following error:
 #   Unable to read an entire line---bufsize=200000. Please increase buf_size in texmf.cnf.
-latexpdf: $(PDFs)
+latexpdf:
 	$(SOURCEDIR)/set_versions.py
 	buf_size=10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
diff --git a/documentation/conf.py b/documentation/conf.py
index c07b6c419..64dd911ff 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -66,6 +66,11 @@ extensions = [
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
+    # our fork! Do not confuse for sphinxcontrib.rsvgconverter!
+    # FIXME: migrate to upstream once
+    # https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/pull/31
+    # is merged
+    'rsvgconverter',
     'yocto-vars'
 ]
 autosectionlabel_prefix_document = True

-- 
2.51.0


