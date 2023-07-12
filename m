Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DE9EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 22:03:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.2847.1689199419962267838
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jul 2023 15:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1qJhvt-0008Oa-W6; Thu, 13 Jul 2023 00:03:38 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qJhvs-00Dya5-5A; Thu, 13 Jul 2023 00:03:36 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qJhvr-006qGO-4X; Thu, 13 Jul 2023 00:03:35 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 3/3] ref-manual: classes: kernel-fitimage: refine role of INITRAMFS_IMAGE_BUNDLE
Date: Thu, 13 Jul 2023 00:03:32 +0200
Message-Id: <20230712220332.1630850-3-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712220332.1630850-1-u.oelmann@pengutronix.de>
References: <20230712220332.1630850-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jul 2023 22:03:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4045

Although it might seem a little bit pedantic this patch describes what the class
actually checks (see e.g. [1]) and kernel.bbclass per default sets the parameter
INITRAMFS_IMAGE_BUNDLE to the empty string (see [2]) which already satisfies
that check without the need of additionally explicitly setting it to '0'.

[1] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel-fitimage.bbclass?h=4.3_M1&id=cc97d775cb402df0d4122bf54eab1a5198c98471#n667
[2] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel.bbclass?h=4.3_M1&id=cc97d775cb402df0d4122bf54eab1a5198c98471#n37

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/ref-manual/classes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 63bdbea9f98e..bbda6ecb83c0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1625,7 +1625,7 @@ The address where the RAM disk image is to be loaded by U-Boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to the FIT image when
 :term:`INITRAMFS_IMAGE` is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE`
-is set to 0.
+is not set to 1.
 
 Only a single :term:`Initramfs` bundle can be added to the FIT image created by
 :ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in FIT is optional.
-- 
2.39.2


