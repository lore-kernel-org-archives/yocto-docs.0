Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3A9C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 20:38:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.7752.1710275901124943173
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 13:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1rk8t8-0004Xb-H4; Tue, 12 Mar 2024 21:38:18 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1rk8t8-005yzb-4b; Tue, 12 Mar 2024 21:38:18 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1rk8t8-006uHa-0F;
	Tue, 12 Mar 2024 21:38:18 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] ref-manual: classes: update description of class 'image_types'
Date: Tue, 12 Mar 2024 21:38:07 +0100
Message-Id: <20240312203807.1646308-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Mar 2024 20:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4944

Cite usage of IMGCLASSES variable in class 'image' as found in OE-Core's
commit [1].

[1] 451363438d38 ("classes/recipes: Switch to use inherit_defer")

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/ref-manual/classes.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5aaf8ecc0c24..412dc5ca2fe5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1184,13 +1184,17 @@ enables the :ref:`ref-classes-image_types` class. The :ref:`ref-classes-image` c
 ``IMGCLASSES`` variable as follows::
 
    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
-   IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
+   # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
+   # in the non-Linux SDK_OS case, such as mingw32
+   inherit populate_sdk_base
+   IMGCLASSES += "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
    IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
    IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
    IMGCLASSES += "image_types_wic"
    IMGCLASSES += "rootfs-postcommands"
    IMGCLASSES += "image-postinst-intercepts"
-   inherit ${IMGCLASSES}
+   IMGCLASSES += "overlayfs-etc"
+   inherit_defer ${IMGCLASSES}
 
 The :ref:`ref-classes-image_types` class also handles conversion and compression of images.
 
-- 
2.39.2


