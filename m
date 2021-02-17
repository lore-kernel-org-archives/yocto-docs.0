Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.2800.1613531363701931758
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 19:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lCDDO-0002Qw-3J; Wed, 17 Feb 2021 04:09:22 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lCDDN-0001OA-3W; Wed, 17 Feb 2021 04:09:21 +0100
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 2/3] common-tasks.rst: fix 'wic cp' command
Date: Wed, 17 Feb 2021 04:09:09 +0100
Message-Id: <20210217030910.5289-2-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217030910.5289-1-u.oelmann@pengutronix.de>
References: <20210217030910.5289-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 65db4aed3380..29956e069fe3 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -5956,8 +5956,8 @@ the existing kernel, and then inserts a new kernel:
    kernel:
    ::
 
-      cp ~/poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
-         ~/poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
+      $ wic cp ~/poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
+               ~/poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
 
    Once the new kernel is added back into the image, you can use the
    ``dd`` command or :ref:`bmaptool
-- 
2.29.2

