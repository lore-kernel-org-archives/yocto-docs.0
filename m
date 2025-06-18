Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C296C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 20:51:48 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.6579.1750279905389174115
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 13:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z4LkbF7k;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NPDpWPU1MuF+rvNzU0wQLDbuFvN4owhVBb2MCYOjLdA=; b=Z4LkbF7k+45Oc6qMzvuqINb4GE
	klzVkRQOPoBqLr9ig4RbF08aEUbNwM0hdh8D2eiq2cJ9ktMDCpWY2wGPRY++NiiN9iBpyOZSc6WE5
	vzyBcmt9z7SXs5nvsDLOwiVdYt3Ms/Nxjh3/RiKtLEOzK9HJqQ7cueQjfmndhZ36jb/w4V85gelIF
	dy8jecBwYkUnX/bEpyk0NjnQJGOyUt6r26NNmJcPzcNRyylBT5dqyU/JZDajwwd0OfCe4mXRITKrO
	9tAN+pBB16+aoacn49RyR/mBcGoCEoAQmCGe+ckCat0zkrJQJb5EQp0wBJfNWMUBpp0stl1IpscE8
	1YJWsYyA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34370 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRzkx-00000006FAR-3OJ7
	for docs@lists.yoctoproject.org;
	Wed, 18 Jun 2025 16:51:43 -0400
Date: Wed, 18 Jun 2025 16:51:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] bsp-guide: update all of section 1.8.2 to reflect current
 beaglebone conf file
Message-ID: <de29a1ee-8b61-87cc-ddb5-950d143c2942@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 20:51:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7106


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 35972f172..d31ae0e88 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1242,7 +1242,7 @@ located in :yocto_git:`poky/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf

    PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"

-   MACHINE_EXTRA_RRECOMMENDS = "kernel-modules kernel-devicetree"
+   MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"

    EXTRA_IMAGEDEPENDS += "virtual/bootloader"

@@ -1258,23 +1258,21 @@ located in :yocto_git:`poky/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
    SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"

    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "6.1%"
+   PREFERRED_VERSION_linux-yocto ?= "6.12%"

    KERNEL_IMAGETYPE = "zImage"
-   KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
-   KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+   DTB_FILES = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+   KERNEL_DEVICETREE = '${@' '.join('ti/omap/%s' % d for d in '${DTB_FILES}'.split())}'

    PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"

    SPL_BINARY = "MLO"
    UBOOT_SUFFIX = "img"
    UBOOT_MACHINE = "am335x_evm_defconfig"
-   UBOOT_ENTRYPOINT = "0x80008000"
-   UBOOT_LOADADDRESS = "0x80008000"

    MACHINE_FEATURES = "usbgadget usbhost vfat alsa"

-   IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY} ${KERNEL_IMAGETYPE} ${KERNEL_DEVICETREE}"
+   IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY} ${KERNEL_IMAGETYPE} ${DTB_FILES}"

    # support runqemu
    EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
@@ -1328,12 +1326,12 @@ Project Reference Manual.
    needed in the root filesystem. In this case, the U-Boot recipe must
    be built for the image.

-   At the end of the file, we also use this setings to implement
+   At the end of the file, we also use this setting to implement
    ``runqemu`` support on the host machine.

 -  :term:`DEFAULTTUNE`: Machines
    use tunings to optimize machine, CPU, and application performance.
-   These features, which are collectively known as "tuning features",
+   These features --- collectively known as "tuning features" ---
    are set in the :term:`OpenEmbedded-Core (OE-Core)` layer. In this
    example, the default tuning file is :oe_git:`tune-cortexa8
    </openembedded-core/tree/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc>`.
@@ -1363,8 +1361,7 @@ Project Reference Manual.
    to create the sysroot when building a Wic image.

 -  :term:`SERIAL_CONSOLES`:
-   Defines a serial console (TTY) to enable using getty. In this case,
-   the baud rate is "115200" and the device name is "ttyO0".
+   Defines one or more serial consoles (TTYs) to enable using getty.

 -  :term:`PREFERRED_PROVIDER_virtual/kernel <PREFERRED_PROVIDER>`:
    Specifies the recipe that provides "virtual/kernel" when more than
@@ -1374,7 +1371,7 @@ Project Reference Manual.

 -  :term:`PREFERRED_VERSION_linux-yocto <PREFERRED_VERSION>`:
    Defines the version of the recipe used to build the kernel, which is
-   "6.1" in this case.
+   "6.12" in this case.

 -  :term:`KERNEL_IMAGETYPE`:
    The type of kernel to build for the device. In this case, the
@@ -1416,12 +1413,6 @@ Project Reference Manual.
       Specifies the value passed on the make command line when building
       a U-Boot image.

-   -  :term:`UBOOT_ENTRYPOINT`:
-      Specifies the entry point for the U-Boot image.
-
-   -  :term:`UBOOT_LOADADDRESS`:
-      Specifies the load address for the U-Boot image.
-
 -  :term:`MACHINE_FEATURES`:
    Specifies the list of hardware features the BeagleBone device is
    capable of supporting. In this case, the device supports "usbgadget

