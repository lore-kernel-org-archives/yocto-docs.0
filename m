Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F73C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 22:03:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.2726.1689199420513358413
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jul 2023 15:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1qJhvt-0008Oe-W6; Thu, 13 Jul 2023 00:03:38 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qJhvs-00DyaB-Ak; Thu, 13 Jul 2023 00:03:36 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qJhvr-006qGH-0Z; Thu, 13 Jul 2023 00:03:35 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/3] ref-manual: classes: kernel-fitimage: fix variable name
Date: Thu, 13 Jul 2023 00:03:30 +0200
Message-Id: <20230712220332.1630850-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4046

The actual code in kernel-fitimage.bbclass checks if "fitImage" is listed in
KERNEL_IMAGETYPES (see e.g. [1]) whereas the class does not use KERNEL_IMAGETYPE
at all.

[1] https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel-fitimage.bbclass?h=4.3_M1&id=cc97d775cb402df0d4122bf54eab1a5198c98471#n9

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/ref-manual/classes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e555a80b5af9..c3fa9a86966e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1599,8 +1599,8 @@ an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
 device trees.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
-is set to include ":ref:`ref-classes-kernel-fitimage`" and :term:`KERNEL_IMAGETYPE`
-is set to "fitImage".
+is set to include ":ref:`ref-classes-kernel-fitimage`" and :term:`KERNEL_IMAGETYPES`
+is set to include "fitImage".
 
 The options for the device tree compiler passed to ``mkimage -D``
 when creating the FIT image are specified using the
-- 
2.39.2


