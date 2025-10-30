Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A924CCCFA00
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:18:07 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web11.216.1761837485248977716
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 08:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cy7612zgQzljf;
	Thu, 30 Oct 2025 16:18:01 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cy76106LCz43B;
	Thu, 30 Oct 2025 16:18:00 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 30 Oct 2025 16:17:46 +0100
Subject: [PATCH RFC 1/3] sphinx: import sphinxcontrib.rsvgconverter sphinx
 plugin in-tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-fix-make-multi-target-v1-1-213616ed1f0a@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7924

From: Quentin Schulz <quentin.schulz@cherry.de>

Imported from https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/blob/5add946275c06d2b338f64d169bc087ef99ebac3/sphinxcontrib/rsvgconverter.py

It'll be modified in the next commit to add support for SVG-PNG
conversion.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/sphinx/rsvgconverter.py | 96 +++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/documentation/sphinx/rsvgconverter.py b/documentation/sphinx/rsvgconverter.py
new file mode 100644
index 000000000..5ae858029
--- /dev/null
+++ b/documentation/sphinx/rsvgconverter.py
@@ -0,0 +1,96 @@
+# -*- coding: utf-8 -*-
+"""
+    sphinxcontrib.rsvgconverter
+    ~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+    Converts SVG images to PDF using libRSVG in case the builder does not
+    support SVG images natively (e.g. LaTeX).
+
+    :copyright: Copyright 2018-2023 by Stefan Wiehler
+                <sphinx_contribute@missinglinkelectronics.com>.
+    :license: BSD, see LICENSE.txt for details.
+"""
+import subprocess
+
+from sphinx.errors import ExtensionError
+from sphinx.locale import __
+from sphinx.transforms.post_transforms.images import ImageConverter
+from sphinx.util import logging
+from errno import ENOENT, EPIPE, EINVAL
+
+if False:
+    # For type annotation
+    from typing import Any, Dict  # NOQA
+    from sphinx.application import Sphinx  # NOQA
+
+
+logger = logging.getLogger(__name__)
+
+
+class RSVGConverter(ImageConverter):
+    conversion_rules = [
+        ('image/svg+xml', 'application/pdf'),
+    ]
+
+    def is_available(self):
+        # type: () -> bool
+        """Confirms if RSVG converter is available or not."""
+        try:
+            args = [self.config.rsvg_converter_bin, '--version']
+            logger.debug('Invoking %r ...', args)
+            ret = subprocess.call(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
+            if ret == 0:
+                return True
+            else:
+                return False
+        except (OSError, IOError):
+            logger.warning(__('RSVG converter command %r cannot be run. '
+                              'Check the rsvg_converter_bin setting'),
+                           self.config.rsvg_converter_bin)
+            return False
+
+    def convert(self, _from, _to):
+        # type: (unicode, unicode) -> bool
+        """Converts the image from SVG to PDF via libRSVG."""
+        try:
+            args = ([self.config.rsvg_converter_bin] +
+                    self.config.rsvg_converter_args +
+                    ['--format=' + self.config.rsvg_converter_format,
+                     '--output=' + str(_to), str(_from)])
+            logger.debug('Invoking %r ...', args)
+            p = subprocess.Popen(args, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
+        except OSError as err:
+            if err.errno != ENOENT:  # No such file or directory
+                raise
+            logger.warning(__('RSVG converter command %r cannot be run. '
+                              'Check the rsvg_converter_bin setting'),
+                           self.config.rsvg_converter_bin)
+            return False
+
+        try:
+            stdout, stderr = p.communicate()
+        except (OSError, IOError) as err:
+            if err.errno not in (EPIPE, EINVAL):
+                raise
+            stdout, stderr = p.stdout.read(), p.stderr.read()
+            p.wait()
+        if p.returncode != 0:
+            raise ExtensionError(__('RSVG converter exited with error:\n'
+                                    '[stderr]\n%s\n[stdout]\n%s') %
+                                 (stderr, stdout))
+
+        return True
+
+
+def setup(app):
+    # type: (Sphinx) -> Dict[unicode, Any]
+    app.add_post_transform(RSVGConverter)
+    app.add_config_value('rsvg_converter_bin', 'rsvg-convert', 'env')
+    app.add_config_value('rsvg_converter_args', [], 'env')
+    app.add_config_value('rsvg_converter_format', 'pdf', 'env')
+
+    return {
+        'version': 'builtin',
+        'parallel_read_safe': True,
+        'parallel_write_safe': True,
+    }

-- 
2.51.0


