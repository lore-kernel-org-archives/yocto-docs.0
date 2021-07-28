Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5621.1627482899670256306
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 07:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E422B20002;
	Wed, 28 Jul 2021 14:34:56 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: mention license information in footer
Date: Wed, 28 Jul 2021 16:34:47 +0200
Message-Id: <20210728143447.148182-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the license for the manuals was only
stated in the SPDX headers at the beginning of source files

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 6c6458fed7..8e15fdc869 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -28,7 +28,7 @@ release = current_version
 
 # -- Project information -----------------------------------------------------
 project = 'The Yocto Project \xae'
-copyright = '2010-%s, The Linux Foundation' % datetime.datetime.now().year
+copyright = '2010-%s, The Linux Foundation, CC-BY-SA-2.0-UK license' % datetime.datetime.now().year
 author = 'The Linux Foundation'
 
 # -- General configuration ---------------------------------------------------
-- 
2.25.1

