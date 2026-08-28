Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DE2C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:50:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2828.1787910605830662960
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 02:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WzsnsgJT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 246C44E413FD
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:50:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB9AD60537
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:50:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55BB311C78192;
	Fri, 28 Aug 2026 11:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787910599; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SESI1e7m6m+vDTof3Gr4X1wSPaZkZjwWH83/W8q0Q/g=;
	b=WzsnsgJT3FbL4h6Gt796aZQhJVrKrcfKSHOmv7vGouXUDa6lMRReOsi3NYoAPzW/XiKSgr
	mFbUFnlGt6cqcrY8AWTIFaBN0Bqeam1YcpdbQdo2kq4UZDDRcSBE3RsDgDwIpVUlGZbWdE
	cIRg6c5XVWDGh241wQxoJdS5ZCYwkgZmyVkM0zOHxgrPdHclTy3eD9/IYAK+ftivWe3+Yk
	sZy2D0NKm+5eV7fWNi5VhM6Dr2m/lkaomUFH33pUGePCerAU62NQHutIB5DYkaDhmdwuMu
	9sjqP2GcdpKcusQVeHVuaOJ7KGIXUyAY2H3XpdPPjyaADizKZWv1a/DdmLOo2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Aug 2026 11:49:36 +0200
Subject: [PATCH 3/3] conf.py: reorganize options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-cleanup-conf-py-v1-3-c8925e5fe1ac@bootlin.com>
References: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
In-Reply-To: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13469;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6+bNWF1+z+y1BShuRXvJkDWtvmZhdwc2dJDuTJ+TFEk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqkVm5CLACxZKJBAgRMTKz5FlFk7Gjpeompxp1+
 JTX2O2vO8KJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapFZuQAKCRDRgEFAKaOo
 No+qEACqJe319YUaS+/LzsiXzVwdNRdg3wFuHqu4jSNnDhP/IT6Nf5R6LllMxwEAbmIgwnFHxp1
 IFTwZ+PflGxZDX6oKb0SoTJdZgcZAbR1zLzh5PMCqeFm9gOeC5n+dNpU11WiIZK448vRevesCDw
 HUNFMkTb5+QaUiyDTBWlKFlmYLPNgFkaTrFU5JgoW3uOBtojfg179taZymrDq+zxWcwAbfNr1D0
 Z6XlEvmvBt58qdYEO2KeUTuuvuQU+16kRsI+eEGfIvlgSzZ1TvF9dOefBaNSGpBJrt2m0YBMXu7
 jETkngG27bmDXOdiYifsNGAzeKuzPdEBp/er5CGtZAbb6FMUoGV8jTZPbzF+Enj5iP9IcwBxEm4
 9mmTGEiwndrOrzGAagKGk3j/jpHzkjIXtLODAaDBXiliZR+VybA9B9pk5/NhS42jP57KSEp1vx5
 s7e3fQ9wB+2AyqZ38c3hFIdrlkEyuD4caLO2WYW7GjGuIbh1W3m1920WyYOLbK1YoQTEOD6bnYD
 0nbrm9mb7sEU0riwdPv0iByMnIZxy6Nk8aWnkqaj4PEss/BSFa8w1thdis5DqBZUJxCw/T9BG4Y
 slP9ASWX89aFsjqtfoY6ViO//q3KFRMl8FXnZjQ1M5V0DQLPbLrDhsNfeDp62DzNJFXN1KrBEvS
 OZ8qEUov2yVrdxg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10394

This patch does not modify the configuration, but only moves them around
to categorize them better - per category and extension. The only "mixed"
section is the "General configuration" section but only contains native
Sphinx modification (nothing related to extensions).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 238 ++++++++++++++++++++++++++------------------------
 1 file changed, 124 insertions(+), 114 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index bd3a4e5bc..48d28a686 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -6,12 +6,6 @@
 # list see the documentation:
 # https://www.sphinx-doc.org/en/master/usage/configuration.html
 
-# -- Path setup --------------------------------------------------------------
-
-# If extensions (or modules to document with autodoc) are in another directory,
-# add these directories to sys.path here. If the directory is relative to the
-# documentation root, use os.path.abspath to make it absolute, like shown here.
-
 import datetime
 import importlib.util
 import os
@@ -29,42 +23,25 @@ except ImportError:
     \nPlease make sure to install pyyaml Python package.\n")
     sys.exit(1)
 
-# current_version = "dev"
-# bitbake_version = "" # Leave empty for development branch
-# Obtain versions from poky.yaml instead
-with open("poky.yaml") as data:
-    buff = data.read()
-    subst_vars = yaml.safe_load(buff)
-    if "DOCCONF_VERSION" not in subst_vars:
-        sys.stderr.write("Please set DOCCONF_VERSION in poky.yaml")
-        sys.exit(1)
-    current_version = subst_vars["DOCCONF_VERSION"]
-    if "BITBAKE_SERIES" not in subst_vars:
-        sys.stderr.write("Please set BITBAKE_SERIES in poky.yaml")
-        sys.exit(1)
-    bitbake_version = subst_vars["BITBAKE_SERIES"]
-
-# String used in sidebar
-version = 'Version: ' + current_version
-if current_version == 'dev':
-    version = 'Version: Current Development'
-# Version seen in documentation_options.js and hence in js switchers code
-release = current_version
-
-
 # -- Project information -----------------------------------------------------
+
 project = 'The Yocto Project \xae'
 copyright = '2010-%s, The Linux Foundation, CC-BY-SA-2.0-UK license' % datetime.datetime.now().year
 author = 'The Linux Foundation'
 
+# -- Path setup --------------------------------------------------------------
+
+# If extensions (or modules to document with autodoc) are in another directory,
+# add these directories to sys.path here. If the directory is relative to the
+# documentation root, use os.path.abspath to make it absolute, like shown here.
+
+sys.path.insert(0, os.path.abspath('sphinx'))
+
 # -- General configuration ---------------------------------------------------
 
 # Prevent building with an outdated version of sphinx
 needs_sphinx = "4.0"
 
-# to load local extension from the folder 'sphinx'
-sys.path.insert(0, os.path.abspath('sphinx'))
-
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
@@ -76,7 +53,28 @@ extensions = [
     'sphinxcontrib.rsvgconverter',
     'yocto-vars'
 ]
-autosectionlabel_prefix_document = True
+
+# current_version = "dev"
+# bitbake_version = "" # Leave empty for development branch
+# Obtain versions from poky.yaml instead
+with open("poky.yaml") as data:
+    buff = data.read()
+    subst_vars = yaml.safe_load(buff)
+    if "DOCCONF_VERSION" not in subst_vars:
+        sys.stderr.write("Please set DOCCONF_VERSION in poky.yaml")
+        sys.exit(1)
+    current_version = subst_vars["DOCCONF_VERSION"]
+    if "BITBAKE_SERIES" not in subst_vars:
+        sys.stderr.write("Please set BITBAKE_SERIES in poky.yaml")
+        sys.exit(1)
+    bitbake_version = subst_vars["BITBAKE_SERIES"]
+
+# String used in sidebar
+version = 'Version: ' + current_version
+if current_version == 'dev':
+    version = 'Version: Current Development'
+# Version seen in documentation_options.js and hence in js switchers code
+release = current_version
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -97,74 +95,39 @@ rst_prolog = """
 .. |author| replace:: %s
 """ % (project, copyright, author)
 
-# base url definitions
-oe_git_server = "https://git.openembedded.org"
-oecore_git = f"{oe_git_server}/openembedded-core"
-bitbake_git = f"{oe_git_server}/bitbake"
-yocto_git_server = "https://git.yoctoproject.org"
-meta_yocto_git = f"{yocto_git_server}/meta-yocto"
-bugzilla_server = "https://bugzilla.yoctoproject.org"
-
-# external links and substitutions
-extlinks = {
-    'bitbake_git': (f'{bitbake_git}%s', None),
-    'bitbake_path': (f'{bitbake_git}/tree/%s', '%s'),
-    'bitbake_rev': (f'{bitbake_git}/commit/?id=%s', '%.7s'),
-    'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
-    'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
-    'yocto_home': ('https://www.yoctoproject.org%s', None),
-    'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
-    'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-    'yocto_lists': ('https://lists.yoctoproject.org%s', None),
-    'yocto_bugs': (f'{bugzilla_server}%s', None),
-    'yocto_bug': (f'{bugzilla_server}/show_bug.cgi?id=%s', '%s'),
-    'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
-    'yocto_docs': ('https://docs.yoctoproject.org%s', None),
-    'yocto_git': (f'{yocto_git_server}%s', None),
-    'meta_yocto_path': (f'{meta_yocto_git}/tree/%s', '%s'),
-    'meta_yocto_rev': (f'{meta_yocto_git}/commit/?id=%s', '%.7s'),
-    'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
-    'oe_home': ('https://www.openembedded.org%s', None),
-    'oe_lists': ('https://lists.openembedded.org%s', None),
-    'oe_git': (f'{oe_git_server}%s', None),
-    'oecore_path': (f'{oecore_git}/tree/%s', '%s'),
-    'oecore_rev': (f'{oecore_git}/commit/?id=%s', '%.7s'),
-    'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
-    'oe_layerindex': ('https://layers.openembedded.org%s', None),
-    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
-    'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
-}
-
 # To be able to use :manpage:`<something>` in the docs.
 manpages_url = 'https://manpages.debian.org/{path}'
 
-# Intersphinx config to use cross reference with BitBake user manual
-intersphinx_mapping = {
-    'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
-}
-
 # Suppress "WARNING: unknown mimetype for ..."
 suppress_warnings = ['epub.unknown_project_files']
 
-# sphinx-copybutton configuration
-copybutton_prompt_text = "$ "
+# We need XeTeX to process special unicode character, sometimes the contributor
+# list from the release note contains those.
+# See https://docs.readthedocs.io/en/stable/guides/pdf-non-ascii-languages.html.
+latex_engine = 'xelatex'
+latex_use_xindy = False
+latex_elements = {
+    'passoptionstopackages': '\\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
+    'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
+}
 
-# Don't check self-references to yocto-docs since they are already
-# checked when building.
-linkcheck_ignore = [r'https?://docs\.yoctoproject\.org.*']
+class DashFriendlySearchEnglish(SearchEnglish):
 
-# When using the linkcheck builder, ignore the following links which are too
-# frequent in the docs, unless the LINKCHECK_NOT_NICE environment variable is set
-# to 1.
-if os.environ.get('LINKCHECK_NOT_NICE') != "1":
-    linkcheck_ignore.extend([
-        r'https?://nvd\.nist\.gov.*',
-        r'https?://git\.yoctoproject\.org.*',
-        r'https?://git\.openembedded\.org.*',
-        r'https?://downloads\.yoctoproject\.org.*',
-        r'https?://mirrors\.kernel\.org.*',
-        r'https?://mirrors\.edge\.kernel\.org.*',
-    ])
+    # Accept words that can include 'inner' hyphens or dots
+    _word_re = re.compile(r'[\w]+(?:[\.\-][\w]+)*')
+
+    js_splitter_code = r"""
+function splitQuery(query) {
+    return query
+        .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}\-\.]+/gu)
+        .filter(term => term.length > 0);
+}
+"""
+
+languages['en'] = DashFriendlySearchEnglish
+
+# Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
+Epub3Builder.supported_image_types = ['image/png', 'image/gif', 'image/jpeg']
 
 # -- Options for HTML output -------------------------------------------------
 
@@ -206,30 +169,77 @@ html_last_updated_fmt = '%b %d, %Y'
 # Remove the trailing 'dot' in section numbers
 html_secnumber_suffix = " "
 
-# We need XeTeX to process special unicode character, sometimes the contributor
-# list from the release note contains those.
-# See https://docs.readthedocs.io/en/stable/guides/pdf-non-ascii-languages.html.
-latex_engine = 'xelatex'
-latex_use_xindy = False
-latex_elements = {
-    'passoptionstopackages': '\\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
-    'preamble': '\\usepackage[UTF8]{ctex}\n\\setcounter{tocdepth}{2}',
-}
+# -- linkcheck configuration -------------------------------------------------
 
-class DashFriendlySearchEnglish(SearchEnglish):
+# Don't check self-references to yocto-docs since they are already
+# checked when building.
+linkcheck_ignore = [r'https?://docs\.yoctoproject\.org.*']
 
-    # Accept words that can include 'inner' hyphens or dots
-    _word_re = re.compile(r'[\w]+(?:[\.\-][\w]+)*')
+# When using the linkcheck builder, ignore the following links which are too
+# frequent in the docs, unless the LINKCHECK_NOT_NICE environment variable is set
+# to 1.
+if os.environ.get('LINKCHECK_NOT_NICE') != "1":
+    linkcheck_ignore.extend([
+        r'https?://nvd\.nist\.gov.*',
+        r'https?://git\.yoctoproject\.org.*',
+        r'https?://git\.openembedded\.org.*',
+        r'https?://downloads\.yoctoproject\.org.*',
+        r'https?://mirrors\.kernel\.org.*',
+        r'https?://mirrors\.edge\.kernel\.org.*',
+    ])
 
-    js_splitter_code = r"""
-function splitQuery(query) {
-    return query
-        .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}\-\.]+/gu)
-        .filter(term => term.length > 0);
+# -- sphinx.ext.autosectionlabel configuration -------------------------------
+
+autosectionlabel_prefix_document = True
+
+# -- sphinx.ext.extlinks configuration ---------------------------------------
+
+# base url definitions
+oe_git_server = "https://git.openembedded.org"
+oecore_git = f"{oe_git_server}/openembedded-core"
+bitbake_git = f"{oe_git_server}/bitbake"
+yocto_git_server = "https://git.yoctoproject.org"
+meta_yocto_git = f"{yocto_git_server}/meta-yocto"
+bugzilla_server = "https://bugzilla.yoctoproject.org"
+
+# external links and substitutions
+extlinks = {
+    'bitbake_git': (f'{bitbake_git}%s', None),
+    'bitbake_path': (f'{bitbake_git}/tree/%s', '%s'),
+    'bitbake_rev': (f'{bitbake_git}/commit/?id=%s', '%.7s'),
+    'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
+    'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
+    'yocto_home': ('https://www.yoctoproject.org%s', None),
+    'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
+    'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
+    'yocto_lists': ('https://lists.yoctoproject.org%s', None),
+    'yocto_bugs': (f'{bugzilla_server}%s', None),
+    'yocto_bug': (f'{bugzilla_server}/show_bug.cgi?id=%s', '%s'),
+    'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
+    'yocto_docs': ('https://docs.yoctoproject.org%s', None),
+    'yocto_git': (f'{yocto_git_server}%s', None),
+    'meta_yocto_path': (f'{meta_yocto_git}/tree/%s', '%s'),
+    'meta_yocto_rev': (f'{meta_yocto_git}/commit/?id=%s', '%.7s'),
+    'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
+    'oe_home': ('https://www.openembedded.org%s', None),
+    'oe_lists': ('https://lists.openembedded.org%s', None),
+    'oe_git': (f'{oe_git_server}%s', None),
+    'oecore_path': (f'{oecore_git}/tree/%s', '%s'),
+    'oecore_rev': (f'{oecore_git}/commit/?id=%s', '%.7s'),
+    'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
+    'oe_layerindex': ('https://layers.openembedded.org%s', None),
+    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
+    'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
 }
-"""
 
-languages['en'] = DashFriendlySearchEnglish
+# -- sphinx.ext.intersphinx configuration ------------------------------------
 
-# Make the EPUB builder prefer PNG to SVG because of issues rendering Inkscape SVG
-Epub3Builder.supported_image_types = ['image/png', 'image/gif', 'image/jpeg']
+# Intersphinx config to use cross reference with BitBake user manual
+intersphinx_mapping = {
+    'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
+}
+
+# -- sphinx_copybutton configuration -----------------------------------------
+
+# sphinx-copybutton configuration
+copybutton_prompt_text = "$ "

-- 
2.55.0


