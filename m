Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2B3CA6C86
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5808.1769501976177344168
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V1xrUb7u;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9E17C1A2A6C
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7446C606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AA4D119A868F;
	Tue, 27 Jan 2026 09:19:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/7D2Kwc9KAnogfj73kh8IWG2nUdpk4PuKXVKagn0zo=;
	b=V1xrUb7uNu9FXLVn2Lxt66Kge8xHnNJe7Kxd0MY/jnl1cJXNYYCHFdMBUo0V34LJZmIIe+
	u21IFxYj7CNxbwp9Ii5eYmYG8AGT4sWo+B01bUTt6+CPcTV6MOEPj/1DETWMJhU1ldO6DV
	5COCgEbSY73jgD/IXckESV6kZWh9r1BP2R2rJdoyO5CAH9Ijb4lR0s9kQpL26ISfrBzB0K
	YF/NFgZkX6EUFCdxtAXO/4c9ls7kC1I5Zotr7N5nE+SwsD2r7Tgg6r/SIxAp8hik1OAUAH
	fDnWycZxYP3KuFPuqfvtb6HQ3yHHggSmu4PhH8c1Ps+/KobbGMEtvDk21z2OVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:14 +0100
Subject: [PATCH v2 19/56] kernel-dev/common.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-19-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=14965;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zsVqUF2yiH0Rvx1/WfXNXEyK/ahT59ANiA1bH1xLuBY=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUBZVh6tJOVji/IXXxW5fPQRIDxxunZ9nFQx
 8wrNFvRYvGJAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AQAKCRDRgEFAKaOo
 NpPsD/iCaSVg+1xJvV5S2J8P4ftzyecNS2ZRQV/DsL9B/G5Odw6P+talqIze67JfYITeQtshWXk
 WEOwDE6znO67+I5jj5Sqsrh7YcKZkFCfG8X/NtNfxNd/R1wEwKFA6wVYBUUKBaHNlAVKA2xUc4P
 m6htSol+y5IQBE0QB9vMWRveabgGPSp9CNWWAm+xKmpFAoZ4wBiidfff3ZZPchI9lLcNHnvdZ7H
 +3sDJVMXfOIioLmMcxL8toDhNcGsQzdYayrJh+XuxqEvttuozx6WZqFHx12AViqe2KcZw8hAe/T
 +RwWWEKtswF4g1QMBrNxkbshGRegVK+zOF1VEqL07fjV5jUOcKm34a/kAK4jdAJfu2jVTi0m+O9
 UBA2cwydZo27f+rK+ERA5Me2/ArV8XrVWpVwRDV4h+GBTyLYdm32Ul3gRcW2N5v8CD8FZg0zzuZ
 NcIC/nREshFMM8C5e9gZZ6agjna+QSuGhS72neMoVI1geZ9psciJ+/G9ZgdBw20l9UOTshrtABU
 SlsDVsLYeZesEOJtt8oEt6EBfZ9gqf9C96YZ0nvx7y4HGH0nXCnL1lcx0LEAcyINXgDvidd/Xr8
 0tBkijgOYxzd3Ihe8Mrj5C+xoRi92QnEBQQYRQHjJPklkWGVprVgTly1BU6HRLeAv7iZ/9qoVkO
 +xebiN616/xHb
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8680

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/kernel-dev/common.rst | 112 +++++++++++++++---------------------
 1 file changed, 46 insertions(+), 66 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 2142d31c0..a653d897c 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -44,25 +44,15 @@ image and ready to make modifications as described in the
 ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section:
 
-#. *Initialize the BitBake Environment:*
-   you need to initialize the BitBake build environment by sourcing
-   the build environment script (i.e. :ref:`structure-core-script`)::
-
-      $ cd poky
-      $ source oe-init-build-env
-
-   .. note::
-
-      The previous commands assume the
-      :ref:`overview-manual/development-environment:yocto project source repositories`
-      (i.e. ``poky``) have been cloned using Git and the local repository is named
-      "poky".
+#. *Initialize the Build Environment:* Follow the :doc:`/dev-manual/start`
+   section of the Yocto Project Development Tasks Manual in order to have a
+   ready-to-use shell that can execute ``devtool``.
 
 #. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
    is set to "qemux86-64", which is fine if you are building for the QEMU
    emulator in 64-bit mode. However, if you are not, you need to set the
    :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
-   found in the :term:`Build Directory` (i.e.  ``poky/build`` in this example).
+   found in the :term:`Build Directory` (i.e.  ``bitbake-builds/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
    to set the :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS` variable to include
@@ -79,7 +69,7 @@ section:
    patches created for the kernel image. You can use the
    ``bitbake-layers create-layer`` command as follows::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ bitbake-layers create-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
       Add your new layer with 'bitbake-layers add-layer ../../meta-mylayer'
@@ -103,7 +93,7 @@ section:
    :term:`BBLAYERS` variable in the
    ``bblayers.conf`` file as follows::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ bitbake-layers add-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
       $
@@ -157,7 +147,7 @@ section:
    set to "qemux86-64", which is fine if you are building for the QEMU emulator
    in 64-bit mode. However, if you are not, you need to set the :term:`MACHINE`
    variable appropriately in your ``conf/local.conf`` file found in the
-   :term:`Build Directory` (i.e.  ``poky/build`` in this example).
+   :term:`Build Directory` (i.e.  ``bitbake-builds/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
    to set the
@@ -175,7 +165,7 @@ section:
    patches created for the kernel image. You can use the
    ``bitbake-layers create-layer`` command as follows::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ bitbake-layers create-layer ../../meta-mylayer
       NOTE: Starting bitbake server...
       Add your new layer with 'bitbake-layers add-layer ../../meta-mylayer'
@@ -198,7 +188,7 @@ section:
    :term:`BBLAYERS` variable in the
    ``bblayers.conf`` file as follows::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ bitbake-layers add-layer ../../meta-mylayer
       NOTE: Starting bitbake server ...
       $
@@ -210,8 +200,7 @@ section:
 
    For simplicity, it is recommended that you create your copy of the
    kernel Git repository outside of the
-   :term:`Source Directory`, which is
-   usually named ``poky``. Also, be sure you are in the
+   :term:`Source Directory`. Also, be sure you are in the
    ``standard/base`` branch.
 
    The following commands show how to create a local copy of the
@@ -237,8 +226,7 @@ section:
 #. *Create a Local Copy of the Kernel Cache Git Repository:* For
    simplicity, it is recommended that you create your copy of the kernel
    cache Git repository outside of the
-   :term:`Source Directory`, which is
-   usually named ``poky``. Also, for this example, be sure you are in
+   :term:`Source Directory`. Also, for this example, be sure you are in
    the ``yocto-4.12`` branch.
 
    The following commands show how to create a local copy of the
@@ -334,8 +322,7 @@ Modifying an Existing Recipe
 In many cases, you can customize an existing linux-yocto recipe to meet
 the needs of your project. Each release of the Yocto Project provides a
 few Linux kernel recipes from which you can choose. These are located in
-the :term:`Source Directory` in
-``meta/recipes-kernel/linux``.
+:term:`OpenEmbedded-Core (OE-Core)` in ``meta/recipes-kernel/linux``.
 
 Modifying an existing recipe can consist of the following:
 
@@ -430,9 +417,8 @@ Although this particular example does not use it, the
 :term:`KERNEL_FEATURES`
 variable could be used to enable features specific to the kernel. The
 append file points to specific commits in the
-:term:`Source Directory` Git repository and
-the ``meta`` Git repository branches to identify the exact kernel needed
-to build the BSP.
+:term:`OpenEmbedded-Core (OE-Core)` Git repository branches to identify the
+exact kernel needed to build the BSP.
 
 One thing missing in this particular BSP, which you will typically need
 when developing a BSP, is the kernel configuration file (``.config``)
@@ -677,7 +663,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
 
               ERROR: Taskhash mismatch 2c793438c2d9f8c3681fd5f7bc819efa versus
                      be3a89ce7c47178880ba7bf6293d7404 for
-                     /path/to/esdk/layers/poky/meta/recipes-kernel/linux/linux-yocto_4.10.bb.do_unpack
+                     /path/to/esdk/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb.do_unpack
 
 
       You can safely ignore these messages. The source code is correctly
@@ -688,11 +674,11 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
 
    #. *Change the working directory*: In the previous step, the output
       noted where you can find the source files (e.g.
-      ``poky_sdk/workspace/sources/linux-yocto``). Change to where the
+      ``build/workspace/sources/linux-yocto``). Change to where the
       kernel source code is before making your edits to the
       ``calibrate.c`` file::
 
-         $ cd poky_sdk/workspace/sources/linux-yocto
+         $ cd build/workspace/sources/linux-yocto
 
    #. *Edit the source file*: Edit the ``init/calibrate.c`` file to have
       the following changes::
@@ -758,7 +744,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
    your working directory to where you modified the ``calibrate.c`` file
    and use these Git commands to stage and commit your changes::
 
-      $ cd poky_sdk/workspace/sources/linux-yocto
+      $ cd build/workspace/sources/linux-yocto
       $ git status
       $ git add init/calibrate.c
       $ git commit -m "calibrate: Add printk example"
@@ -784,7 +770,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
    command from your :term:`Build Directory` in the terminal
    set up to run BitBake::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ bitbake core-image-minimal
 
 Using Traditional Kernel Development to Patch the Kernel
@@ -868,7 +854,7 @@ Section.
    :term:`SRCREV` statements similar
    to the following to your ``local.conf``::
 
-      $ cd poky/build/conf
+      $ cd bitbake-builds/build/conf
 
    Add the following to the ``local.conf``::
 
@@ -888,14 +874,14 @@ Section.
    committed, and the ``local.conf`` file pointing to the kernel files,
    you can now use BitBake to build the image::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ bitbake core-image-minimal
 
 #. *Boot the image*: Boot the modified image in the QEMU emulator using
    this command. When prompted to login to the QEMU console, use "root"
    with no password::
 
-      $ cd poky/build
+      $ cd bitbake-builds/build
       $ runqemu qemux86
 
 #. *Look for Your Changes:* As QEMU booted, you might have seen your
@@ -959,14 +945,14 @@ Section.
 
       To build ``core-image-minimal`` again and see the effects of your patch,
       you can essentially eliminate the temporary source files saved in
-      ``poky/build/tmp/work/...`` and residual effects of the build by entering
+      ``bitbake-builds/build/tmp/work/...`` and residual effects of the build by entering
       the following sequence of commands::
 
-              $ cd poky/build
-              $ bitbake -c cleanall linux-yocto
-              $ bitbake core-image-minimal -c cleanall
-              $ bitbake core-image-minimal
-              $ runqemu qemux86
+         $ cd bitbake-builds/build
+         $ bitbake -c cleanall linux-yocto
+         $ bitbake core-image-minimal -c cleanall
+         $ bitbake core-image-minimal
+         $ runqemu qemux86
 
 
 Configuring the Kernel
@@ -1013,10 +999,10 @@ environment, you must do the following:
 The following commands initialize the BitBake environment, run the
 :ref:`ref-tasks-kernel_configme`
 task, and launch ``menuconfig``. These commands assume the Source
-Directory's top-level folder is ``poky``::
+Directory's top-level folder is ``work``::
 
-   $ cd poky
-   $ source oe-init-build-env
+   $ cd work
+   $ source layers/openembedded-core/oe-init-build-env
    $ bitbake linux-yocto -c kernel_configme -f
    $ bitbake linux-yocto -c menuconfig
 
@@ -1063,7 +1049,7 @@ the ``.config`` file would be:
 
 .. code-block:: none
 
-   poky/build/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18...
+   bitbake-builds/build/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18...
    ...967-r0/linux-qemux86-standard-build/.config
 
 .. note::
@@ -1279,32 +1265,32 @@ Here is sample output from the :ref:`ref-tasks-kernel_configcheck` task:
 
    ---------- CONFIG_X86_TSC -----------------
    Config: CONFIG_X86_TSC
-   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-cpu.cfg
+   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-cpu.cfg
    Requested value:  CONFIG_X86_TSC=y
    Actual value:
 
 
    ---------- CONFIG_X86_BIGSMP -----------------
    Config: CONFIG_X86_BIGSMP
-   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
-         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
+   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
+         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
    Requested value:  # CONFIG_X86_BIGSMP is not set
    Actual value:
 
 
    ---------- CONFIG_NR_CPUS -----------------
    Config: CONFIG_NR_CPUS
-   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
-         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc.cfg
-         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
+   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
+         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc.cfg
+         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
    Requested value:  CONFIG_NR_CPUS=8
    Actual value:     CONFIG_NR_CPUS=1
 
 
    ---------- CONFIG_SCHED_SMT -----------------
    Config: CONFIG_SCHED_SMT
-   From: /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
-         /home/scottrif/poky/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
+   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
+         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
    Requested value:  CONFIG_SCHED_SMT=y
    Actual value:
 
@@ -1459,11 +1445,9 @@ Maintaining format compatibility facilitates converging with linux-yocto
 on a future, mutually-supported kernel version.
 
 To help you use your own sources, the Yocto Project provides a
-linux-yocto custom recipe that uses ``kernel.org`` sources and
-the Yocto Project Linux kernel tools for managing kernel Metadata.
-You can find this recipe in the ``poky`` Git repository:
-:yocto_git:`meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
-</poky/tree/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb>`.
+:oe_git:`linux-yocto custom recipe </openembedded-core/tree/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb>`
+that uses ``kernel.org`` sources and the Yocto Project Linux kernel tools for
+managing kernel Metadata.
 
 Here are some basic steps you can use to work with your own sources:
 
@@ -1597,13 +1581,9 @@ Incorporating Out-of-Tree Modules
 
 While it is always preferable to work with sources integrated into the
 Linux kernel sources, if you need an external kernel module, the
-``hello-mod.bb`` recipe is available as a template from which you can
-create your own out-of-tree Linux kernel module recipe.
-
-This template recipe is located in the ``poky`` Git repository of the
-Yocto Project:
-:yocto_git:`meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
-</poky/tree/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb>`.
+:oe_git:`hello-mod </openembedded-core/tree/meta-skeleton/recipes-kernel/hello-mod/>`
+recipe is available as a template from which you can create your own out-of-tree
+Linux kernel module recipe.
 
 To get started, copy this recipe to your layer and give it a meaningful
 name (e.g. ``mymodule_1.0.bb``). In the same directory, create a new

-- 
2.52.0


