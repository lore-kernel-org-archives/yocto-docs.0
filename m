Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E389BE7BD9E
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:27:11 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17724.1771241225499844866
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 03:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=Ax3kf6qn;
 spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fF0qC5MR6zGkZ;
	Mon, 16 Feb 2026 12:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771241223;
	bh=2WE6y0Rucjxxj6ramMqtJpoSF817w+dujbbFjSDzcV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ax3kf6qnNRq+n1MxtycQiwfw0PnKGNrH9TqdGnm5K5KK9NfqbGEF4vXVYFC7HUHjE
	 pxSAK6C5ckCUam/OscOyGZ0xvPvoQvb+Vkknn/b/TsrCWtWVrDgrywRl/IvVfs0B3+
	 O7qND1WLyCyMDvE6W7wy4OzS49KMt2v/hLfAC5kroXkDeTazXoLksL6g4+nmlMqBsB
	 B5MYepGCKs/+g51XzKX/n1slagKVXx3CNPQmQ4rack0REJkBTUMknx829ILKmyQYwS
	 Bu6FxMqtg0gWxjCwiIt/BcdrGOKn4MSk3fdhy6FMbFxDMEfzzesP6y70zqNDLOFpQz
	 r06YcBv/k63Bg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fF0qC2BzdzBW9;
	Mon, 16 Feb 2026 12:27:03 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 16 Feb 2026 12:26:55 +0100
Subject: [PATCH v4 3/3] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-fix-make-multi-target-v4-3-749e588cb7f5@cherry.de>
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
In-Reply-To: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:27:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8927

From: Quentin Schulz <quentin.schulz@cherry.de>

The sphinxcontrib.rsvgconverter plugin allows to generate a PDF or PNG
from an SVG.
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

sphinxcontrib.rsvgconverter is a plugin from
sphinxcontrib-svg2pdfconverter python module. SVGs to PNGs is only
supported since 2.0.0.

[1] https://www.sphinx-doc.org/en/master/man/sphinx-build.html#cmdoption-sphinx-build-d
[2] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.latex.LaTeXBuilder.supported_image_types
[3] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.epub3.Epub3Builder.supported_image_types
[4] https://www.sphinx-doc.org/en/master/usage/builders/index.html#sphinx.builders.html.StandaloneHTMLBuilder

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/Makefile                             | 27 +++-------------------
 documentation/Pipfile                              |  2 ++
 documentation/conf.py                              |  1 +
 .../tools/host_packages_scripts/pip3_docs.sh       |  2 +-
 4 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index e144a50b4..897db2b5a 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -10,11 +10,8 @@ VALEOPTS       ?= --no-wrap --glob '!migration-guides/release-notes-*.rst'
 SOURCEDIR      = .
 VALEDOCS       ?= $(SOURCEDIR)
 SPHINXLINTDOCS ?= $(SOURCEDIR)
-IMAGEDIRS      = */svg
 BUILDDIR       = _build
 DESTDIR        = final
-SVG2PNG        = rsvg-convert
-SVG2PDF        = rsvg-convert
 
 ifeq ($(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi),0)
 $(error "The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed")
@@ -24,7 +21,7 @@ endif
 help:
 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
 
-.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf
+.PHONY: all checks help Makefile clean stylecheck publish latexpdf
 
 publish: Makefile checks epub latexpdf html singlehtml
 	rm -rf $(BUILDDIR)/$(DESTDIR)/
@@ -35,22 +32,8 @@ publish: Makefile checks epub latexpdf html singlehtml
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
-	$(SVG2PDF) --format=pdf --output=$@ $<
-
-# Pattern rule for converting SVG to PNG
-%.png : %.svg
-	$(SVG2PNG) --format=png --output=$@ $<
-
 clean:
-	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst
+	@rm -rf $(BUILDDIR) poky.yaml sphinx-static/switchers.js releases.rst
 
 checks:
 	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
@@ -62,14 +45,10 @@ stylecheck:
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
 
diff --git a/documentation/Pipfile b/documentation/Pipfile
index 1fa2df31e..67fce078d 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -10,6 +10,8 @@ sphinx = "*"
 sphinx-rtd-theme = "*"
 pyyaml = "*"
 sphinx-copybutton = "*"
+# SVG to PNG only supported since 2.0.0
+sphinxcontrib-svg2pdfconverter = ">=2.0.0"
 
 [requires]
 python_version = "3"
diff --git a/documentation/conf.py b/documentation/conf.py
index 3d04f9057..5a69977cf 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -67,6 +67,7 @@ extensions = [
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
     'sphinx_copybutton',
+    'sphinxcontrib.rsvgconverter',
     'yocto-vars'
 ]
 autosectionlabel_prefix_document = True
diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/documentation/tools/host_packages_scripts/pip3_docs.sh
index 9aa7f16fb..2c9330d70 100644
--- a/documentation/tools/host_packages_scripts/pip3_docs.sh
+++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
@@ -1,3 +1,3 @@
 python3 -m venv --clear --system-site-packages /tmp/yocto-venv
 . /tmp/yocto-venv/bin/activate
-python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
+python3 -m pip install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphinxcontrib-svg2pdfconverter>=2.0.0'

-- 
2.53.0


