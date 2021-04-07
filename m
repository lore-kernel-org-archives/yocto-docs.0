Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.9593.1617812188115186340
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 09:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lUAqv-0000I9-TA; Wed, 07 Apr 2021 18:16:25 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lUAqv-0003S5-GP; Wed, 07 Apr 2021 18:16:25 +0200
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] sdk-manual: fix typo
Date: Wed,  7 Apr 2021 18:16:10 +0200
Message-Id: <20210407161610.12537-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/sdk-manual/appendix-obtain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 395102c3bd1b..0fd421f31f8f 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -38,7 +38,7 @@ Follow these steps to locate and hand-install the toolchain:
                 "sato" or "minimal"
 
           arch is a string representing the target architecture:
-                 "aarch64", "armv5e", "core2-64", "coretexa8hf-neon", "i586", "mips32r2",
+                 "aarch64", "armv5e", "core2-64", "cortexa8hf-neon", "i586", "mips32r2",
                  "mips64", or "ppc7400"
 
           release is the version of Yocto Project.
-- 
2.29.2

