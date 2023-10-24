Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FE9C25B48
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.18016.1698154046385830291
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nWA5/yRT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E754F20010;
	Tue, 24 Oct 2023 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imDwFAUaYitUjBBff9PMzK7Fe8oggUwOd+EJQIMRAE4=;
	b=nWA5/yRTOPU0AB21W7t3g/xkL5V0wPmt0G4rc9DCzf+v5HBrKJKH1kHeqb2WOBDuXmw3SU
	T07+i9dQNbDzFFT0/5qAYNAkbxInlPvAw3Ns6ecRQOt1NyEn+OewfmEzHGKCO+jmotbnKu
	48ZcbTCRy1LY2PDrn7nnzQh8gRN/DLwovpwWuM5YSt4yDIxi+LRag75ygZMyeQuhrW5myt
	1Boq3/RvHNkkGAhyCcHGGFNx+sakhTcgHwwx7E3YTdB6xJBvIrqIu6Y+GfI8iVL15Q+waV
	l0ndlO/LCKZ7fxPUK2jOgv1JEy1ftVSb8oKTjEpPwYEnoFysmJXp3kWcXYb61Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 03/16] dev-manual: wic: update "wic list images" output
Date: Tue, 24 Oct 2023 15:26:59 +0200
Message-Id: <20231024132712.90600-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4477

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/wic.rst | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 213f143273..25180c5cb5 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -142,17 +142,18 @@ command to return the available Wic images as follows::
      genericx86                    		Create an EFI disk image for genericx86*
      edgerouter                    		Create SD card image for Edgerouter
      beaglebone-yocto              		Create SD card image for Beaglebone
-     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
-     systemd-bootdisk              		Create an EFI disk image with systemd-boot
-     mkhybridiso                   		Create a hybrid ISO image
+     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
      mkefidisk                     		Create an EFI disk image
-     sdimage-bootpart              		Create SD card image with a boot partition
      directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
      directdisk                    		Create a 'pcbios' direct disk image
-     directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
-     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
+     efi-bootdisk                  		
+     mkhybridiso                   		Create a hybrid ISO image
      directdisk-gpt                		Create a 'pcbios' direct disk image
-     efi-bootdisk
+     systemd-bootdisk              		Create an EFI disk image with systemd-boot
+     sdimage-bootpart              		Create SD card image with a boot partition
+     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
+     directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
+
 
 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a
@@ -283,16 +284,18 @@ Use the following command to list the available kickstart files::
 
    $ wic list images
      genericx86                    		Create an EFI disk image for genericx86*
-     beaglebone-yocto              		Create SD card image for Beaglebone
      edgerouter                    		Create SD card image for Edgerouter
-     qemux86-directdisk            		Create a QEMU machine 'pcbios' direct disk image
-     directdisk-gpt                		Create a 'pcbios' direct disk image
+     beaglebone-yocto              		Create SD card image for Beaglebone
+     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
      mkefidisk                     		Create an EFI disk image
+     directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
      directdisk                    		Create a 'pcbios' direct disk image
-     systemd-bootdisk              		Create an EFI disk image with systemd-boot
+     efi-bootdisk                  		
      mkhybridiso                   		Create a hybrid ISO image
+     directdisk-gpt                		Create a 'pcbios' direct disk image
+     systemd-bootdisk              		Create an EFI disk image with systemd-boot
      sdimage-bootpart              		Create SD card image with a boot partition
-     directdisk-multi-rootfs       		Create multi rootfs image using rootfs plugin
+     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
      directdisk-bootloader-config  		Create a 'pcbios' direct disk image with custom bootloader config
 
 When you use an existing file, you
-- 
2.34.1


