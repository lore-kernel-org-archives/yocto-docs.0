Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC353CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:26:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.44795.1697217965845594120
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 10:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=izb4OKAQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BF62FF806;
	Fri, 13 Oct 2023 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697217963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V2fxjvJWytspQIZpz7qxXoirR6kcsJre/OkuvLNX4PU=;
	b=izb4OKAQce6CiIDKnUYOstjnPqTVATWEj93DPDDv7tq2QCOv24nLonorLmmQXF3Ie8qh6O
	b9aPq5bArO+ZUWSZFdAnxGbqV3XghFRfsmx3aCoNGBsQpS6YEubmVi7IQ2AgkSVx5lylgE
	JPEx4a0EZtlLfLS6f8MXwnpbIEIp/M2bWvHgdLdFKhvrCqXcxE75SJsnmoYDw2mbyUtzul
	Hbj55o8j2mu8Kl40yewzeDkPHfSY33s0rnqBnYyS4VPgGQFGFvVMcQkqge2psQe1Jco7S6
	V0OjnXM43S0DBWCyck3JEglE0tmmnFzQOkKghs+x6pAJ/T9RjmJfLokvYQSs0Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/5] dev-manual: wic: update "wic list images" output
Date: Fri, 13 Oct 2023 19:25:44 +0200
Message-Id: <20231013172547.82195-3-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4367

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/wic.rst | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 664f07a212..312f78c403 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -140,19 +140,19 @@ command to return the available Wic images as follows::
 
    $ wic list images
      genericx86                    		Create an EFI disk image for genericx86*
-     edgerouter                    		Create SD card image for Edgerouter
      beaglebone-yocto              		Create SD card image for Beaglebone
-     qemux86-directdisk            		Create a qemu machine 'pcbios' direct disk image
-     systemd-bootdisk              		Create an EFI disk image with systemd-boot
-     mkhybridiso                   		Create a hybrid ISO image
+     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
      mkefidisk                     		Create an EFI disk image
-     sdimage-bootpart              		Create SD card image with a boot partition
+     qemuloongarch                 		Create qcow2 image for LoongArch QEMU machines
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
 
 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a
@@ -284,15 +284,17 @@ Use the following command to list the available kickstart files::
    $ wic list images
      genericx86                    		Create an EFI disk image for genericx86*
      beaglebone-yocto              		Create SD card image for Beaglebone
-     edgerouter                    		Create SD card image for Edgerouter
-     qemux86-directdisk            		Create a QEMU machine 'pcbios' direct disk image
-     directdisk-gpt                		Create a 'pcbios' direct disk image
+     qemuriscv                     		Create qcow2 image for RISC-V QEMU machines
      mkefidisk                     		Create an EFI disk image
+     qemuloongarch                 		Create qcow2 image for LoongArch QEMU machines
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


