Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD80ECD1299
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:38:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12899.1712155102522478884
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 07:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QE0xNCBc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F5981C0002;
	Wed,  3 Apr 2024 14:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712155101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rlMIFLOWINckom6Eyt7zhGNJ3SzjNw1tFj0Yi6ylDuo=;
	b=QE0xNCBcQQDUiOxifQ3O2oSJsxYJPWnQpkn8BovJiZBfjI4ZV9rUkC0MvtmPDl7R7+VaMr
	e0XnXyirVfpNjYcRelCucrnTgGLkIRRLNFSTcUwTfz2Mf858Xm7s5wSqiPikhsUiWJZWCc
	A9ZKSy88pUdZSqasA1KiAOJ6JCtsBm4NmEOSzqKbfHDzQCDTIfi9EOTOUDx68YWKQYWG+W
	gCgGNeQe0Am/YSNasNxGIWfMQSkJFsppTk9xb7AYsa1c4JomfWxWrCPnRCzzvzLs3z8xwY
	kJcokKq2V8Yd0QT5DScVbL9kVTcSSzms2x5vTM/ngCR4g+/YCLh4aOQrb8JlYg==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 5/5] release-notes: list systemd changes
Date: Wed,  3 Apr 2024 16:37:24 +0200
Message-ID: <20240403143724.1956838-6-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
References: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Apr 2024 14:38:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5055

Add PACKAGECONFIG-related changes, as well as systemd-boot-native, to
'Miscellaneous changes section'.

Mention the licensing changes in systemd and libsystemd.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index e5cdd87d1..adc1597bb 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -42,6 +42,12 @@ New Features / Enhancements in 5.0
 
 -  Miscellaneous changes:
 
+   -  Systemd's following :term:`PACKAGECONFIG` options were added:
+      ``cryptsetup-plugins``, ``no-ntp-fallback``, and ``p11kit``.
+
+   -  ``systemd-boot`` can, from now on, be compiled as ``native``, thus
+      providing ``ukify`` tool to build UKI images.
+
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
 
@@ -50,6 +56,11 @@ Known Issues in 5.0
 Recipe License changes in 5.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+The following corrections have been made to the :term:`LICENSE` values set by recipes:
+
+-  ``systemd``: make the scope of ``LGPL`` more accurate (``LGPL-2.1`` -> ``LGPL-2.1-or-later``)
+-  ``libsystemd``: set its own :term:`LICENSE` value (``LGPL-2.1-or-later``) to add more granularity
+
 Security Fixes in 5.0
 ~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0


