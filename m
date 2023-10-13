Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DA7C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:26:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.44800.1697217968654565176
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 10:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QdpBVVsx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECD95FF806;
	Fri, 13 Oct 2023 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697217967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37sPbVX8EjphxcEJ2BiPiMQ7eUDV97N89uwf3pyTBGE=;
	b=QdpBVVsxlZ+7njB2RaOCc2XMDJwp+HaisrRIZH7AnOHdOxR0FFdJXVSTaPVy/K6Q9MAWpC
	84HwXLoMmQUhlUPkaV4vTGoGrE0uSyaaq2zp/wHA4s3tqNXK+fAtnYTEjor7HXUXi48CaV
	rsCLzZTtB+NNiopgBoFiNsrgbr2gqTc1lO7gshtYaV53WEFTzzNzuAphDFIISAUOnGh1W0
	pLhtY+0Dggt45Ip/1tewIfRz336r4lCiysEQaZycsqemwAeOilyBFQeDLH4Y9+2uOQSTNN
	kwW8pBXRnGOuZEr5x9w88wk3eG+anGooesymHQMDmiagLPlE4ThITGMsvg13KA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/5] manuals: update list of supported machines
Date: Fri, 13 Oct 2023 19:25:46 +0200
Message-Id: <20231013172547.82195-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
References: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Oct 2023 17:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4369

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The EdgeRouter machine is no longer supported.
https://git.yoctoproject.org/poky/commit/?id=0c64d0e4317e3749f7f7ed9ecd5d08bbb0cedc9e

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst              | 10 ++++------
 documentation/dev-manual/runtime-testing.rst |  8 +-------
 documentation/ref-manual/variables.rst       |  3 +--
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index c1160397be..f21fc530e4 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -64,8 +64,8 @@ Here is an example that clones the Raspberry Pi BSP layer::
 
 In addition to BSP layers, the ``meta-yocto-bsp`` layer is part of the
 shipped ``poky`` repository. The ``meta-yocto-bsp`` layer maintains
-several "reference" BSPs including the ARM-based Beaglebone, MIPS-based
-EdgeRouter, and generic versions of both 32-bit and 64-bit IA machines.
+several "reference" BSPs including the ARM-based Beaglebone and generic
+versions of both 32-bit and 64-bit IA machines.
 
 For information on typical BSP development workflow, see the
 :ref:`bsp-guide/bsp:developing a board support package (bsp)`
@@ -764,15 +764,13 @@ workflow.
 
    .. note::
 
-      -  There are four hardware reference BSPs in the Yocto
+      -  There are three hardware reference BSPs in the Yocto
          Project release, located in the ``poky/meta-yocto-bsp``
          BSP layer:
 
          -  Texas Instruments Beaglebone (``beaglebone-yocto``)
 
-         -  Ubiquiti Networks EdgeRouter Lite (``edgerouter``)
-
-         -  Two general IA platforms (``genericx86`` and ``genericx86-64``)
+         -  Two generic IA platforms (``genericx86`` and ``genericx86-64``)
 
       -  There are three core Intel BSPs in the Yocto Project
          release, in the ``meta-intel`` layer:
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index af3fe2c1dd..205a96cc59 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -160,12 +160,6 @@ options are available:
    comments at the top of the BeagleBoneTarget
    ``meta-yocto-bsp/lib/oeqa/controllers/beaglebonetarget.py`` file.
 
--  *"EdgeRouterTarget":* Choose "EdgeRouterTarget" if you are deploying
-   images and running tests on the Ubiquiti Networks EdgeRouter Lite.
-   For information on how to use these tests, see the comments at the
-   top of the EdgeRouterTarget
-   ``meta-yocto-bsp/lib/oeqa/controllers/edgeroutertarget.py`` file.
-
 -  *"GrubTarget":* Choose "GrubTarget" if you are deploying images and running
    tests on any generic PC that boots using GRUB. For information on how
    to use these tests, see the comments at the top of the GrubTarget
@@ -288,7 +282,7 @@ Serial Console Connection
 -------------------------
 
 For test target classes requiring a serial console to interact with the
-bootloader (e.g. BeagleBoneTarget, EdgeRouterTarget, and GrubTarget),
+bootloader (e.g. BeagleBoneTarget and GrubTarget),
 you need to specify a command to use to connect to the serial console of
 the target machine by using the
 :term:`TEST_SERIALCONTROL_CMD`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fd64088512..dbd21826a3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4342,7 +4342,7 @@ system and gives an overview of their function and contents.
       hardware. Continuing with the previous kernel example, the kernel's
       append file is located in the
       BSP layer for a given machine. For example, the append file for the
-      Beaglebone, EdgeRouter, and generic versions of both 32 and 64-bit IA
+      Beaglebone and generic versions of both 32 and 64-bit IA
       machines (``meta-yocto-bsp``) is named
       ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.1.bbappend``.
       Here are the related statements from that append file::
@@ -5081,7 +5081,6 @@ system and gives an overview of their function and contents.
          MACHINE ?= "genericx86"
          MACHINE ?= "genericx86-64"
          MACHINE ?= "beaglebone"
-         MACHINE ?= "edgerouter"
 
       The last five are Yocto Project reference hardware
       boards, which are provided in the ``meta-yocto-bsp`` layer.
-- 
2.34.1


