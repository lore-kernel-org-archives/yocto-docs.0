Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EE9C64EC7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 14:36:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.15758.1676298964945814270
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 06:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pRZw2-0003Ms-Pl; Mon, 13 Feb 2023 15:36:02 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pRZvy-004g3A-UW; Mon, 13 Feb 2023 15:36:00 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pRZvz-003DJb-GJ; Mon, 13 Feb 2023 15:35:59 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 2/3] ref-manual: refer to MACHINE variable instead of KMACHINE
Date: Mon, 13 Feb 2023 15:35:56 +0100
Message-Id: <20230213143557.766119-2-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230213143557.766119-1-u.oelmann@pengutronix.de>
References: <20230213143557.766119-1-u.oelmann@pengutronix.de>
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
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 14:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3671

Although in the example case of a "raspberrypi2" the variable KMACHINE has the
same value as MACHINE, only the latter is an allowed override. So do not set the
reader on the wrong track.

Suggested-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 54da54f71d72..62176f7ee8f1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4277,7 +4277,7 @@ system and gives an overview of their function and contents.
 
          KBUILD_DEFCONFIG:<machine> ?= "defconfig_file"
 
-      Here is an example from a "raspberrypi2" :term:`KMACHINE` build that uses
+      Here is an example from a "raspberrypi2" :term:`MACHINE` build that uses
       a ``defconfig`` file named "bcm2709_defconfig"::
 
          KBUILD_DEFCONFIG:raspberrypi2 = "bcm2709_defconfig"
-- 
2.30.2


