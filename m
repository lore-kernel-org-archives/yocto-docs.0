Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE25E776CD
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123714.1766593910998522691
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RPIKem//;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72A681A23E5
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B53C6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C14210AB1372;
	Wed, 24 Dec 2025 17:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593908; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oVzwD24nQIYcTZX+ZTDvX860/qvI6V8KV9R5vMcJunA=;
	b=RPIKem//kgU53hvRdhPmzFJYl1ZIZf9BHX8HSxtJIv/Io+Pq1Tf4ZlDva19l/HqtK/TGvH
	vWXOwRdRvcikLbozyK2D0imbcYrKkJ9RAkTETqNnAjWZ9NEV4lD/kH6xyEH/YL3n5cUiAD
	r3F0vyjUivWLUcia9kQwd2My7z6zuV1HT6v7/EVoLpq19kQKxJPMwC4nbfqkyF8h6h7ZgD
	qQkLh3trGKc5FuHptKqRgnEZSQ6uVKhTbKRKv/GLPWm1mtcl0U79hXr5EsP+Ap/csS2+ez
	F65lGOPu2rPitpB7j/PJiFNBzlgrvbJwf5WA+liH8LW/T76+hMrmxmDWHR+80Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:30 +0100
Subject: [PATCH 04/53] bsp-guide/bsp.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-4-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=14316;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HyX01m2+x4+F6v9083Y9/sRtW4JuA4RoQ3eLUZlOKio=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVn79F4mOXUw8mzsJBNFzN6wX97adwPhcJ2I
 JsOW8LhH9CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZwAKCRDRgEFAKaOo
 Nhv3D/wKgmdS+7JyNR/MN5Bo2t29DLJ3W54/diPbQ+dmQtXMTqz6rsrxGp8q9xDKtG04uUGuLWX
 YcswK+UEDZADIkx18Oy9XQdGVPPkO2UNTwK0xuXxCiIzdq3ZL4TqGe6uWms5vg4k2NDYlN3Wtb6
 Z5MCMRktWCIdKS1rJfZ/YSYeLVbF1WX6Vsm8FtNlniHWCYYUPhRwcp70c3IDyia5JGOdmjmtfdi
 AY7LC+A3kP5TRUr69hoMOfqYKHLBLbK1wMYaPtAS4HO4V5MKWe9i4ki8hm0ZJpNwWa5nNCd6i5m
 cVaS6xjUOZLyc2BlxqUQ0NmVGwHJRJfi5cWcVVAWsWdmuHODwxDq79byAoXA6iY8ghxJHS0ukc/
 6fEJelqR8aZ3NrXa0bTYnU/ZslsEezzZzFsZ1sVXDHGpHXP38TYsmkMKAqECNiBow+p58ejdxiW
 WiHaw73MmSeSWMOKe5ELY1WkoTT3D/hK2XbmB3NlE3f0aW4EjRoRsCz8HJiJ1CcujFmFr678vtQ
 OXuk/SMn8kjgrF1oZl/+F+XFjnU6C+r1PJtilKoPXNQYoOqyhTM9mFU2nNRFrF4NbhyaoxdmTCh
 2ulwEnprpT0TiTrK+Sy2mfPFWBzsHSZb7+nL/6LCFwCsoKm97RhNVM0viboeTlqdfINfd9++MXe
 9MbAmGKvmuzMYnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8333

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases, and refer to bitbake-setup or the manual setup in the
intro.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/bsp-guide/bsp.rst | 151 +++++++++++++---------------------------
 1 file changed, 48 insertions(+), 103 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 74912cdd6..2a451b213 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -62,8 +62,8 @@ Here is an example that clones the Raspberry Pi BSP layer::
 
    $ git clone git://git.yoctoproject.org/meta-raspberrypi
 
-In addition to BSP layers, the ``meta-yocto-bsp`` layer is part of the
-shipped ``poky`` repository. The ``meta-yocto-bsp`` layer maintains
+In addition to BSP layers, the ``meta-yocto-bsp`` layer is part of
+:yocto_git:`meta-yocto </meta-yocto>`. The ``meta-yocto-bsp`` layer maintains
 several "reference" BSPs including the ARM-based Beaglebone and generic
 versions of both 32-bit and 64-bit IA machines.
 
@@ -72,7 +72,7 @@ For information on typical BSP development workflow, see the
 section. For more
 information on how to set up a local copy of source files from a Git
 repository, see the
-:ref:`dev-manual/start:locating yocto project source files`
+:doc:`/dev-manual/poky-manual-setup`
 section in the Yocto Project Development Tasks Manual.
 
 The BSP layer's base directory (``meta-bsp_root_name``) is the root
@@ -150,24 +150,23 @@ section.
    to get a build host ready that is either a native Linux machine or a machine
    that uses CROPS.
 
-#. *Clone the poky Repository:* You need to have a local copy of the
-   Yocto Project :term:`Source Directory` (i.e. a local
-   ``poky`` repository). See the
-   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" and
-   possibly the
-   ":ref:`dev-manual/start:checking out by branch in poky`" or
-   ":ref:`dev-manual/start:checking out by tag in poky`"
-   sections
-   all in the Yocto Project Development Tasks Manual for information on
-   how to clone the ``poky`` repository and check out the appropriate
-   branch for your work.
+#. *Prepare the Source Repositories*:
+
+   There are two ways of setting up the :term:`Poky` reference distro:
+
+   -  Using the ``bitbake-setup`` command-line utility from :term:`BitBake`.
+      Follow:
+
+      :doc:`Setting Up The Environment With bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>`
+
+   -  Manually cloning the required repositories. Follow:
+
+      :doc:`/dev-manual/poky-manual-setup`
 
 #. *Determine the BSP Layer You Want:* The Yocto Project supports many
    BSPs, which are maintained in their own layers or in layers designed
-   to contain several BSPs. To get an idea of machine support through
-   BSP layers, you can look at the
-   :yocto_dl:`index of machines </releases/yocto/&DISTRO_REL_LATEST_TAG;/machines>`
-   for the release.
+   to contain several BSPs. The :oe_layerindex:`Layer Index <>` can help finding
+   BSP layers to use.
 
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
@@ -175,10 +174,7 @@ section.
    :yocto_git:`README </meta-intel/tree/README.md>` file.
 
    #. *Navigate to Your Source Directory:* Typically, you set up the
-      ``meta-intel`` Git repository inside the :term:`Source Directory` (e.g.
-      ``poky``). ::
-
-         $ cd /home/you/poky
+      ``meta-intel`` Git repository next to the other layers in your build.
 
    #. *Clone the Layer:* ::
 
@@ -224,18 +220,21 @@ section.
       Resolving deltas: 100% (2447/2447), done.
       Checking connectivity... done.
 
-#. *Initialize the Build Environment:* While in the root directory of
-   the Source Directory (i.e. ``poky``), run the
-   :ref:`ref-manual/structure:``oe-init-build-env``` environment
-   setup script to define the OpenEmbedded build environment on your
-   build host. ::
+#. *Initialize the Build Environment:* While in the directory where the
+   different layers are cloned, run the :ref:`ref-manual/structure:``oe-init-build-env```
+   environment setup script located in :term:`OpenEmbedded-Core (OE-Core)` to
+   define the OpenEmbedded build environment on your build host. ::
 
       $ source oe-init-build-env
 
    Among other things, the script creates the :term:`Build Directory`, which is
-   ``build`` in this case and is located in the :term:`Source Directory`.  After
-   the script runs, your current working directory is set to the ``build``
-   directory.
+   ``build``.  After the script runs, your current working directory is set to
+   the ``build`` directory.
+
+   .. note::
+
+      Alternatively, you can source the ``init-build-env`` file provided by
+      :doc:`bitbake-setup <bitbake:bitbake-user-manual/bitbake-user-manual-environment-setup>` 
 
 Example Filesystem Layout
 =========================
@@ -597,10 +596,10 @@ optimization flags, which are carefully chosen to give best performance
 on a given processor.
 
 Tuning files are found in the ``meta/conf/machine/include`` directory
-within the :term:`Source Directory`.
+within :term:`OpenEmbedded-Core (OE-Core)`.
 For example, many ``tune-*`` files (e.g. ``tune-arm1136jf-s.inc``,
 ``tune-1586-nlp.inc``, and so forth) reside in the
-``poky/meta/conf/machine/include`` directory.
+``meta/conf/machine/include`` directory.
 
 To use an include file, you simply include them in the machine
 configuration file. For example, the Raspberry Pi BSP
@@ -636,7 +635,7 @@ directory. Here is the ``machconfig`` file for the Raspberry Pi BSP::
    according to the formfactor configuration file that is installed by
    the main formfactor recipe
    ``meta/recipes-bsp/formfactor/formfactor_0.0.bb``, which is found in
-   the :term:`Source Directory`.
+   :term:`OpenEmbedded-Core (OE-Core)`.
 
 Display Support Files
 ---------------------
@@ -664,7 +663,7 @@ types of files although, in practice, it is likely that you would have
 one or the other.
 
 For your BSP, you typically want to use an existing Yocto Project kernel
-recipe found in the :term:`Source Directory`
+recipe found in :term:`OpenEmbedded-Core (OE-Core)`
 at
 ``meta/recipes-kernel/linux``. You can append machine-specific changes
 to the kernel recipe by using a similarly named append file, which is
@@ -767,19 +766,22 @@ workflow.
    .. note::
 
       -  There are three hardware reference BSPs in the Yocto
-         Project release, located in the ``poky/meta-yocto-bsp``
+         Project release, located in the :yocto_git:`meta-yocto-bsp
+         </meta-yocto/tree/meta-yocto-bsp>`
          BSP layer:
 
          -  Texas Instruments Beaglebone (``beaglebone-yocto``)
 
          -  Two generic IA platforms (``genericx86`` and ``genericx86-64``)
 
+         -  A generic ARM 64 platforma (``genericarm64``)
+
    When you set up a layer for a new BSP, you should follow a standard
    layout. This layout is described in the ":ref:`bsp-guide/bsp:example filesystem layout`"
    section. In the standard layout, notice
    the suggested structure for recipes and configuration information.
    You can see the standard layout for a BSP by examining any supported
-   BSP found in the ``meta-intel`` layer inside the Source Directory.
+   BSP found in the ``meta-intel`` layer.
 
 #. *Make Configuration Changes to Your New BSP Layer:* The standard BSP
    layer structure organizes the files you need to edit in ``conf`` and
@@ -861,9 +863,7 @@ The requirements for a released BSP that conform to the Yocto Project are:
 
 -  *File System Layout:* When possible, use the same directory names in
    your BSP layer as listed in the ``recipes.txt`` file, which is found
-   in ``poky/meta`` directory of the :term:`Source Directory`
-   or in the OpenEmbedded-Core Layer (``openembedded-core``) at
-   :oe_git:`/openembedded-core/tree/meta`.
+   in ``meta`` directory of :term:`OpenEmbedded-Core (OE-Core)`.
 
    You should place recipes (``*.bb`` files) and recipe modifications
    (``*.bbappend`` files) into ``recipes-*`` subdirectories by
@@ -872,8 +872,8 @@ The requirements for a released BSP that conform to the Yocto Project are:
    up your own ``recipes-*`` subdirectory.
 
    Within any particular ``recipes-*`` category, the layout should match
-   what is found in the OpenEmbedded-Core Git repository
-   (``openembedded-core``) or the Source Directory (``poky``). In other
+   what is found in the :term:`OpenEmbedded-Core (OE-Core)` Git repository.
+   In other
    words, make sure you place related files in appropriately-related
    ``recipes-*`` subdirectories specific to the recipe's function, or
    within a subdirectory containing a set of closely-related recipes.
@@ -1169,7 +1169,7 @@ Use these steps to create a BSP layer:
 
 -  *Create a Machine Configuration File:* Create a
    ``conf/machine/bsp_root_name.conf`` file. See
-   :yocto_git:`meta-yocto-bsp/conf/machine </poky/tree/meta-yocto-bsp/conf/machine>`
+   :yocto_git:`meta-yocto-bsp/conf/machine </meta-yocto/tree/meta-yocto-bsp/conf/machine>`
    for sample ``bsp_root_name.conf`` files. There are other samples such as
    :yocto_git:`meta-ti </meta-ti/tree/meta-ti-bsp/conf/machine>`
    and
@@ -1187,7 +1187,7 @@ Use these steps to create a BSP layer:
 
 The remainder of this section provides a description of the Yocto
 Project reference BSP for Beaglebone, which resides in the
-:yocto_git:`meta-yocto-bsp </poky/tree/meta-yocto-bsp>`
+:yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bsp>`
 layer.
 
 BSP Layer Configuration Example
@@ -1235,63 +1235,8 @@ There are one or more machine configuration files in the
 
 For example, the machine configuration file for the `BeagleBone and
 BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
-located in :yocto_git:`poky/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
-</poky/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`::
-
-   #@TYPE: Machine
-   #@NAME: Beaglebone-yocto machine
-   #@DESCRIPTION: Reference machine configuration for http://beagleboard.org/bone and http://beagleboard.org/black boards
-
-   PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-
-   MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
-
-   EXTRA_IMAGEDEPENDS += "virtual/bootloader"
-
-   DEFAULTTUNE ?= "cortexa8hf-neon"
-   include conf/machine/include/arm/armv7a/tune-cortexa8.inc
-
-   IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
-   EXTRA_IMAGECMD:jffs2 = "-lnp "
-   WKS_FILE ?= "beaglebone-yocto.wks"
-   MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image kernel-devicetree"
-   do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot virtual/bootloader:do_deploy"
-
-   SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
-
-   PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-   PREFERRED_VERSION_linux-yocto ?= "6.12%"
-
-   KERNEL_IMAGETYPE = "zImage"
-   DTB_FILES = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
-   KERNEL_DEVICETREE = '${@' '.join('ti/omap/%s' % d for d in '${DTB_FILES}'.split())}'
-
-   PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
-
-   SPL_BINARY = "MLO"
-   UBOOT_SUFFIX = "img"
-   UBOOT_MACHINE = "am335x_evm_defconfig"
-
-   MACHINE_FEATURES = "usbgadget usbhost vfat alsa"
-
-   IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY} ${KERNEL_IMAGETYPE} ${DTB_FILES}"
-
-   # support runqemu
-   EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
-   IMAGE_CLASSES += "qemuboot"
-   QB_DEFAULT_FSTYPE = "wic"
-   QB_FSINFO = "wic:no-kernel-in-fs"
-   QB_KERNEL_ROOT = "/dev/vda2"
-   QB_SYSTEM_NAME = "qemu-system-arm"
-   QB_MACHINE = "-machine virt"
-   QB_CPU = "-cpu cortex-a15"
-   QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 systemd.mask=systemd-networkd"
-   QB_OPT_APPEND = "-device virtio-rng-device"
-   QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-   QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
-   QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-   QB_SERIAL_OPT = ""
-   QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+located in :yocto_git:`/meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+</meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`.
 
 The variables used to configure the machine define machine-specific properties; for
 example, machine-dependent packages, machine tunings, the type of kernel
@@ -1309,7 +1254,7 @@ Project Reference Manual.
    The recipe that provides "virtual/xserver" when more than one
    provider is found. In this case, the recipe that provides
    "virtual/xserver" is "xserver-xorg", available in
-   ``poky/meta/recipes-graphics/xorg-xserver``.
+   ``meta/recipes-graphics/xorg-xserver`` in :term:`OpenEmbedded-Core (OE-Core)`.
 
 -  :term:`MACHINE_EXTRA_RRECOMMENDS`:
    A list of machine-dependent packages not essential for booting the
@@ -1400,7 +1345,7 @@ Project Reference Manual.
    .. note::
 
       For more information on how the SPL variables are used, see the
-      :yocto_git:`u-boot.inc </poky/tree/meta/recipes-bsp/u-boot/u-boot.inc>`
+      :oe_git:`u-boot.inc </openembedded-core/tree/meta/recipes-bsp/u-boot/u-boot.inc>`
       include file.
 
 -  :term:`UBOOT_* <UBOOT_ENTRYPOINT>`: Defines
@@ -1438,7 +1383,7 @@ The ``meta-yocto-bsp/recipes-kernel/linux`` directory in the layer contains
 metadata used to build the kernel. In this case, a kernel append file
 (i.e. ``linux-yocto_6.1.bbappend``) is used to override an established
 kernel recipe (i.e. ``linux-yocto_6.1.bb``), which is located in
-:yocto_git:`/poky/tree/meta/recipes-kernel/linux`.
+:oe_git:`/openembedded-core/tree/meta/recipes-kernel/linux`.
 
 The contents of the append file are::
 

-- 
2.51.0


