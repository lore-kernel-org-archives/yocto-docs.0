Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17484.1795526290976330154
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 05:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ETfoTUbZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 264464E4175D
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F099D601E1
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 484DC11E698F5;
	Tue, 24 Nov 2026 14:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795526284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mrzeuwg9igrGqlhTZ6oqxdE6cBphcQrdRnjT5prEiJ8=;
	b=ETfoTUbZ8+oNIX/5nUF3qgkxGbfH5B4vTN9EyWUzUHErwBJAAaIHd9lazVKcz2+wraf1Q1
	R5jM6EcwdXLGEcb8snm70Y1Dhh62GQZj0+V6xaXtk4L1xk95i9vmzM27wk2RHFmNiUSvYC
	1BbHNLN2gY2U/CqporOrvlS/JsvKuvZKDfkmwkio9OEIy1h2VlhZjnhGc/BPJjr2quWIj1
	UBW5tY9/ponCsuo4hYlqwEmsFvMmqu5ZIwbwKtQQ9KooRYSJ+F0WhjHT15cdSM9V1vpPjm
	TQbs7jHoy3YAAPDSkChKCCGiHD/X75ftqGcbWtbrnYSVSv6bZMwPzKPp95eQqw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Nov 2026 14:17:54 +0100
Subject: [PATCH 1/3] conf.py: enable sphinx.ext.autodoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-oe-utils-docs-v1-1-5fafbf6cb01c@bootlin.com>
References: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
In-Reply-To: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5284;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BS/l3TKGbhqU9EIMYmFfLBz0BO2KCvacQt53nZrXOyo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBY6DpY3G/Y1eU41PP9yB/PGRVvAe3RVa8nXY6
 sorNoq1K+aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawWOgwAKCRDRgEFAKaOo
 NlJyD/9sjGX52O3HxXdFTFKwlUyJdokb/Cd805SXaKtazS8yRTYWdkFCH9flkJRNSZfbZbeNq0A
 iEo24zsGPGV7DEi3fBrl/DAcNZPiv/qNiyMylqN9dJvI1A3FC0wKp4+Ugk4u9M0B/lgBkg8Kfpf
 AdjJl+dupLFON6d2dbNQjFkiOlgwoZnSEV2rYDpcEBozKW+UU8679f1okRPnfnXarTDV3Kltc2g
 BPQ4WGi25Xh34oH/U7B0orXJYk+xWO3j7NKNspf2ko3dcLrAaNnJCj8sswzUJPt7eAeMNEaWdee
 lNQ5DgcEcfX+jdki6SLsXg4hC7VpbBSR+4RPVFqUKFHtJvI/1hPfL95kQ/BBvhPNPS/VH1II0mn
 Fxsr/WwPSSdpp1qPtmLgNMT+PVJgRTGlBEAWETrNhYFLwmhMGIAMGaNgj7lUHO1lRvIwHJdQPVR
 ijFOKFDsbEqyBE1CWyv4HUamfngdOZ6TM0VzBBY0RZh+7H4dvGaLTiYzzEVgGvFFllBO232NkJD
 UEazhW3G6yUgzJvscO0TnJvnQxlr7UNbG2+MkXnPskS7US/YNLjufO4zRhxyjr2c/OIu0cd6TOV
 x47sJw3we2O/kXLljmGWEyu1JbnS8F8+r9uUj4FEofjgZSwPmV2+H5o6NnaTsoZTKIJr1mAjKVu
 fWnYXKTn2rRpq5g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10832

Enable the sphinx.ext.autodoc extension for this Sphinx build, but do
not make it a requirement for building the documentation locally. The
idea is to auto-document functions from openembedded-core here (which
depends on bitbake since the oe library imports the bb library).
However, this is most likely not the case for people wanting to
contribute the yocto-docs documentation: therefore, ignore any
'autodoc.import_object' warning by default.

An exception to that rule is when building from the Autobuilder, where
we _need_ those warnings (turned to errors) to be caught. We expect the
Autobuilder to set AUTOBUILDER_BUILD to 1 in these conditions.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README  | 21 +++++++++++++++++++++
 documentation/conf.py | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/documentation/README b/documentation/README
index 56abe83bb..da6838695 100644
--- a/documentation/README
+++ b/documentation/README
@@ -128,6 +128,27 @@ but require you to use Pipenv for them to run and aren't available when
 following the instructions from
 https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host.
 
+Note 2: while not a requirement to build the documentation, some parts of it
+need the [BitBake] and [OpenEmbedded-Core] repositories to be cloned next to the
+yocto-docs repository. This is used to generate documentation from Python
+docstrings. The expected default layout of the different repositories is is:
+
+ bitbake/
+ openembedded-core/
+ yocto-docs/
+
+The paths to BitBake and OpenEmbedded-Core can be overridden by setting the
+BITBAKE_REPO_PATH and OECORE_REPO_PATH environment variables respectively
+before building.
+
+Both BitBake and OpenEmbedded-Core should be cloned to the closest matching tag
+(e.g. 'yocto-6.1' for each of them).
+
+If not cloned, these parts of the documentation will be left empty.
+
+[BitBake]: https://git.openembedded.org/bitbake/
+[OpenEmbedded-Core]: https://git.openembedded.org/openembedded-core/
+
 Style checking the Yocto Project documentation
 ==============================================
 
diff --git a/documentation/conf.py b/documentation/conf.py
index d2252d5ab..833aa50b3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -10,8 +10,10 @@ import datetime
 import importlib.util
 import os
 import re
+import subprocess
 import sys
 
+from pathlib import Path
 from sphinx.builders.epub3 import Epub3Builder
 from sphinx.search import SearchEnglish
 from sphinx.search import languages
@@ -37,6 +39,30 @@ author = 'The Linux Foundation'
 
 sys.path.insert(0, os.path.abspath('sphinx'))
 
+# We require openembedded-core's library to auto-document utilities and such,
+# which itself requires bitbake's library. We assume their default location is
+# next to the yocto-docs repository, but can be overridden with environment
+# variables.
+yocto_docs_parent_dir = Path(__file__).resolve().parent.parent.parent
+bitbake_dir = os.getenv("BITBAKE_REPO_PATH", str(yocto_docs_parent_dir / 'bitbake'))
+oecore_dir = os.getenv("OECORE_REPO_PATH", str(yocto_docs_parent_dir / 'openembedded-core'))
+sys.path.insert(0, os.path.join(bitbake_dir, 'lib'))
+sys.path.insert(0, os.path.join(oecore_dir, 'meta/lib'))
+
+# Check that we can import the oe module. If we can, show some information about
+# the repositories (useful for debugging in case of version mismatch).
+if not importlib.util.find_spec('oe'):
+    print("NOTE: bitbake and/or openembedded-core not found next to yocto-docs, "
+          "auto-documenting oe.* functions will not work")
+    if os.getenv('AUTOBUILDER_BUILD', '0') == '1':
+        sys.exit(1)
+else:
+    bitbake_rev = subprocess.check_output(["git", "-C", bitbake_dir, "describe"], encoding="utf-8").strip()
+    oecore_rev = subprocess.check_output(["git", "-C", oecore_dir, "describe"], encoding="utf-8").strip()
+    print("Found bb and oe modules:\n"
+          f"{bitbake_dir} ({bitbake_rev})\n"
+          f"{oecore_dir} ({oecore_rev})")
+
 # -- General configuration ---------------------------------------------------
 
 # Prevent building with an outdated version of sphinx
@@ -46,6 +72,7 @@ needs_sphinx = "4.0"
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
 extensions = [
+    'sphinx.ext.autodoc',
     'sphinx.ext.autosectionlabel',
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
@@ -101,6 +128,12 @@ manpages_url = 'https://manpages.debian.org/{path}'
 # Suppress "WARNING: unknown mimetype for ..."
 suppress_warnings = ['epub.unknown_project_files']
 
+# Unless, we're building the docs with the Autobuilder, suppress warnings from
+# the autodoc module, as it assumes openembedded-core and bitbake are cloned
+# in yocto-docs.
+if not os.getenv('AUTOBUILDER_BUILD', '0') == '1':
+    suppress_warnings.append('autodoc.import_object')
+
 # We need XeTeX to process special unicode character, sometimes the contributor
 # list from the release note contains those.
 # See https://docs.readthedocs.io/en/stable/guides/pdf-non-ascii-languages.html.

-- 
2.56.0

