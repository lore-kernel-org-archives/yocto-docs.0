Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7295CC6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 14:36:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.15638.1676298964882770998
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 06:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pRZw2-0003Mr-Pl; Mon, 13 Feb 2023 15:36:02 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pRZvy-004g39-UK; Mon, 13 Feb 2023 15:36:00 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pRZvz-003DJZ-D4; Mon, 13 Feb 2023 15:35:59 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/3] kernel-dev,ref-manual: fix old override syntax
Date: Mon, 13 Feb 2023 15:35:55 +0100
Message-Id: <20230213143557.766119-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3670

Additionally use more common syntax to indicate that an actual machine name is
supposed to be filled in for a concrete use case as has been suggested by Peter
Kjellerstedt (and particularly no KMACHINE). Furthermore add missing quotes in
the reference manual.

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/kernel-dev/common.rst    | 2 +-
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index dff8f504fd6f..3c8e0b74e9b5 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -649,7 +649,7 @@ append files, you can direct the OpenEmbedded build system to use a
 To specify an "in-tree" ``defconfig`` file, use the following statement
 form::
 
-   KBUILD_DEFCONFIG_KMACHINE ?= "defconfig_file"
+   KBUILD_DEFCONFIG:<machine> ?= "defconfig_file"
 
 Here is an example
 that assigns the :term:`KBUILD_DEFCONFIG` variable based on "raspberrypi2"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a36c4c6df962..54da54f71d72 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4275,7 +4275,7 @@ system and gives an overview of their function and contents.
       To use the variable, set it in the append file for your kernel recipe
       using the following form::
 
-         KBUILD_DEFCONFIG_KMACHINE ?= defconfig_file
+         KBUILD_DEFCONFIG:<machine> ?= "defconfig_file"
 
       Here is an example from a "raspberrypi2" :term:`KMACHINE` build that uses
       a ``defconfig`` file named "bcm2709_defconfig"::
-- 
2.30.2


