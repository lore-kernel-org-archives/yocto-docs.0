Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D27C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 15:41:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.123998.1698075684873802155
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 08:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SHPokGPn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18680FF803;
	Mon, 23 Oct 2023 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698075683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BtOmSfwNweaUOw1qOkrcHsrnmO8YecqGKOShfk/x7FE=;
	b=SHPokGPngrQQ/A13dBsxeoxNamWRIQc59/fxo/ZQjFJKxXU94+aUSw1QOgGkAoA4Q+FqHZ
	pIADC/QZb5H+MbinzcAgRYAu7zW9X/xVSTAmE2ylrAjvnwJktpGRBU3AwcM5C6V4O/cD1r
	zteYWrRfywpcQmSe+QEOX2B6rqe3N2uFykIHZJAaCSHQcUyvRSQ3ZnGSEF0xm4i5O6iLaU
	aKfMdUMEWjzvscxXkXTkeRgeJ1zptiZGnSmNBSqnSAs3/f7mOpKBlG+2QXspK2+CyCxdwd
	t2y5E0bDzTPs2pfucrb3EO+6RBpXVkWS+SbPXsPv+5eqaUNsmyt7IY52QehpEg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: correct "yocto-linux" by "linux-yocto"
Date: Mon, 23 Oct 2023 17:41:20 +0200
Message-Id: <20231023154120.43906-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Oct 2023 15:41:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4455

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst     | 2 +-
 documentation/kernel-dev/common.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 5d186d9e1a..4b40d886a7 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1178,7 +1178,7 @@ Use these steps to create a BSP layer:
 
 -  *Create a Kernel Recipe:* Create a kernel recipe in
    ``recipes-kernel/linux`` by either using a kernel append file or a
-   new custom kernel recipe file (e.g. ``yocto-linux_4.12.bb``). The BSP
+   new custom kernel recipe file (e.g. ``linux-yocto_4.12.bb``). The BSP
    layers mentioned in the previous step also contain different kernel
    examples. See the ":ref:`kernel-dev/common:modifying an existing recipe`"
    section in the Yocto Project Linux Kernel Development Manual for
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index c781a0682c..9b197bfccb 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1001,7 +1001,7 @@ Section.
       the following sequence of commands::
 
               $ cd poky/build
-              $ bitbake -c cleanall yocto-linux
+              $ bitbake -c cleanall linux-yocto
               $ bitbake core-image-minimal -c cleanall
               $ bitbake core-image-minimal
               $ runqemu qemux86
-- 
2.34.1


