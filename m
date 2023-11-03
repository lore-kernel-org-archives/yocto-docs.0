Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3B5C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 14:24:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.52689.1699021454198394452
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 07:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nsDOf+/7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5595260004;
	Fri,  3 Nov 2023 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699021452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JWZLxnRo8/psOPtrFRvaGgC7fS6cFrzTWOqhOP4OYn4=;
	b=nsDOf+/7w7v1lFBPaTxFnUpk8UmNIpsMbY42rKBBsQrWki6E53kvFYe6ZygFg96AhT5AdN
	z7AJMMAhm5lARZ17llOKhyzZaWhwo5NkuyRzrNv/ODngmCoSwivd+uaghd4LX+Rcca/0Je
	HlL6Vv97OUHmHdqSqbu24R6KBtKuahnFavl6PxaBjuAT3EqWwn3Ruz9myMsj01XdC9iBc+
	5JkuCoYHxpWnlFkX7wW12CkUCtFE/Vr6paj47DRAWuhXdObK0VlLp1y/oDwgtBnKCeHY+k
	+w3XWJv9My4VJR7JHG/AMqcecq3vYn64KmUZtVf016wYEvZc+/4w5jXnZ8ZD2Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] bsp-guide: bsp.rst: update beaglebone example
Date: Fri,  3 Nov 2023 15:24:09 +0100
Message-Id: <20231103142410.2022995-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Nov 2023 14:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4581

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 63 ++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 4b40d886a7..f92b1177b7 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1234,21 +1234,18 @@ There are one or more machine configuration files in the
 
 For example, the machine configuration file for the `BeagleBone and
 BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
-located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
-``beaglebone-yocto.conf``::
+located in :yocto_git:`poky/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+</poky/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`::
 
    #@TYPE: Machine
    #@NAME: Beaglebone-yocto machine
    #@DESCRIPTION: Reference machine configuration for http://beagleboard.org/bone and http://beagleboard.org/black boards
 
    PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-   XSERVER ?= "xserver-xorg \
-               xf86-video-modesetting \
-              "
 
    MACHINE_EXTRA_RRECOMMENDS = "kernel-modules kernel-devicetree"
 
-   EXTRA_IMAGEDEPENDS += "u-boot"
+   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
    DEFAULTTUNE ?= "cortexa8hf-neon"
    include conf/machine/include/arm/armv7a/tune-cortexa8.inc
@@ -1256,19 +1253,20 @@ located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
    IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
    EXTRA_IMAGECMD:jffs2 = "-lnp "
    WKS_FILE ?= "beaglebone-yocto.wks"
-   IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
-   do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image kernel-devicetree"
+   do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot virtual/bootloader:do_deploy"
 
-   SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0"
-   SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+   SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
 
    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "5.0%"
+   PREFERRED_VERSION_linux-yocto ?= "6.1%"
 
    KERNEL_IMAGETYPE = "zImage"
    KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
    KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
+   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
+
    SPL_BINARY = "MLO"
    UBOOT_SUFFIX = "img"
    UBOOT_MACHINE = "am335x_evm_defconfig"
@@ -1277,7 +1275,24 @@ located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
 
    MACHINE_FEATURES = "usbgadget usbhost vfat alsa"
 
-   IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO zImage am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+   IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY} ${KERNEL_IMAGETYPE} ${KERNEL_DEVICETREE}"
+
+   # support runqemu
+   EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+   IMAGE_CLASSES += "qemuboot"
+   QB_DEFAULT_FSTYPE = "wic"
+   QB_FSINFO = "wic:no-kernel-in-fs"
+   QB_KERNEL_ROOT = "/dev/vda2"
+   QB_SYSTEM_NAME = "qemu-system-arm"
+   QB_MACHINE = "-machine virt"
+   QB_CPU = "-cpu cortex-a15"
+   QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 systemd.mask=systemd-networkd"
+   QB_OPT_APPEND = "-device virtio-rng-device"
+   QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+   QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+   QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+   QB_SERIAL_OPT = ""
+   QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 
 The variables used to configure the machine define machine-specific properties; for
 example, machine-dependent packages, machine tunings, the type of kernel
@@ -1297,11 +1312,6 @@ Project Reference Manual.
    "virtual/xserver" is "xserver-xorg", available in
    ``poky/meta/recipes-graphics/xorg-xserver``.
 
--  :term:`XSERVER`: The packages that
-   should be installed to provide an X server and drivers for the
-   machine. In this example, the "xserver-xorg" and
-   "xf86-video-modesetting" are installed.
-
 -  :term:`MACHINE_EXTRA_RRECOMMENDS`:
    A list of machine-dependent packages not essential for booting the
    image. Thus, the build does not fail if the packages do not exist.
@@ -1319,12 +1329,15 @@ Project Reference Manual.
    needed in the root filesystem. In this case, the U-Boot recipe must
    be built for the image.
 
+   At the end of the file, we also use this setings to implement
+   ``runqemu`` support on the host machine.
+
 -  :term:`DEFAULTTUNE`: Machines
    use tunings to optimize machine, CPU, and application performance.
    These features, which are collectively known as "tuning features",
-   are set in the :term:`OpenEmbedded-Core (OE-Core)` layer (e.g.
-   ``poky/meta/conf/machine/include``). In this example, the default
-   tuning file is ``cortexa8hf-neon``.
+   are set in the :term:`OpenEmbedded-Core (OE-Core)` layer. In this
+   example, the default tuning file is :oe_git:`tune-cortexa8
+   </openembedded-core/tree/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc>`.
 
    .. note::
 
@@ -1344,13 +1357,7 @@ Project Reference Manual.
 
 -  :term:`WKS_FILE`: The location of
    the :ref:`Wic kickstart <ref-manual/kickstart:openembedded kickstart (\`\`.wks\`\`) reference>` file used
-   by the OpenEmbedded build system to create a partitioned image
-   (image.wic).
-
--  :term:`IMAGE_INSTALL`:
-   Specifies packages to install into an image through the
-   :ref:`ref-classes-image` class. Recipes
-   use the :term:`IMAGE_INSTALL` variable.
+   by the OpenEmbedded build system to create a partitioned image.
 
 -  ``do_image_wic[depends]``: A task that is constructed during the
    build. In this example, the task depends on specific tools in order
@@ -1368,7 +1375,7 @@ Project Reference Manual.
 
 -  :term:`PREFERRED_VERSION_linux-yocto <PREFERRED_VERSION>`:
    Defines the version of the recipe used to build the kernel, which is
-   "5.0" in this case.
+   "6.1" in this case.
 
 -  :term:`KERNEL_IMAGETYPE`:
    The type of kernel to build for the device. In this case, the
-- 
2.34.1


