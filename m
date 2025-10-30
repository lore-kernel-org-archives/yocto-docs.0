Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F35CCFA02
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:18:07 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
 by mx.groups.io with SMTP id smtpd.web11.213.1761837483794400829
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 08:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cy7615rpszn2Q;
	Thu, 30 Oct 2025 16:18:01 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cy7612tyJz34F;
	Thu, 30 Oct 2025 16:18:01 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 30 Oct 2025 16:17:47 +0100
Subject: [PATCH RFC 2/3] sphinx: rsvgconverter: add support for PNG output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-fix-make-multi-target-v1-2-213616ed1f0a@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7922

From: Quentin Schulz <quentin.schulz@cherry.de>

All tools used currently for converting from SVG to PDF actually also
support converting to PNG, so let's add support for that.

Note that I didn't check on Inkscape < 1.0 so I simply adapted the code
to what I believe should be correct. At the same time, I'm not sure
there are many distros still using Inkscape < 1.0 nowadays so hopefully
that should be pretty safe.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
[imported from https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/pull/31/commits/bfd73e78a8be788951bd12d81f4270d67f9efeba]
[removed from the diff anything not rsvgconverter.py]
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sphinx/rsvgconverter.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/documentation/sphinx/rsvgconverter.py b/documentation/sphinx/rsvgconverter.py
index 5ae858029..a63f180a1 100644
--- a/documentation/sphinx/rsvgconverter.py
+++ b/documentation/sphinx/rsvgconverter.py
@@ -3,13 +3,14 @@
     sphinxcontrib.rsvgconverter
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-    Converts SVG images to PDF using libRSVG in case the builder does not
+    Converts SVG images to PDF or PNG using libRSVG in case the builder does not
     support SVG images natively (e.g. LaTeX).
 
     :copyright: Copyright 2018-2023 by Stefan Wiehler
                 <sphinx_contribute@missinglinkelectronics.com>.
     :license: BSD, see LICENSE.txt for details.
 """
+import pathlib
 import subprocess
 
 from sphinx.errors import ExtensionError
@@ -30,6 +31,7 @@ logger = logging.getLogger(__name__)
 class RSVGConverter(ImageConverter):
     conversion_rules = [
         ('image/svg+xml', 'application/pdf'),
+        ('image/svg+xml', 'image/png'),
     ]
 
     def is_available(self):
@@ -51,11 +53,17 @@ class RSVGConverter(ImageConverter):
 
     def convert(self, _from, _to):
         # type: (unicode, unicode) -> bool
-        """Converts the image from SVG to PDF via libRSVG."""
+        """Converts the image from SVG to PDF or PNG via libRSVG."""
         try:
+            # Guess output format based on file extension
+            fmt = pathlib.Path(str(_to)).suffix[1:]
+            # rsvg-convert supports different standards of PDF, so use the
+            # rsvg_converter_format config when building a PDF
+            if fmt == 'pdf':
+                fmt = self.config.rsvg_converter_format
             args = ([self.config.rsvg_converter_bin] +
                     self.config.rsvg_converter_args +
-                    ['--format=' + self.config.rsvg_converter_format,
+                    ['--format=' + fmt,
                      '--output=' + str(_to), str(_from)])
             logger.debug('Invoking %r ...', args)
             p = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
@@ -86,7 +94,9 @@ def setup(app):
     # type: (Sphinx) -> Dict[unicode, Any]
     app.add_post_transform(RSVGConverter)
     app.add_config_value('rsvg_converter_bin', 'rsvg-convert', 'env')
+    # Applies to both PDF and PNG output
     app.add_config_value('rsvg_converter_args', [], 'env')
+    # Only applies to PDF output
     app.add_config_value('rsvg_converter_format', 'pdf', 'env')
 
     return {

-- 
2.51.0


