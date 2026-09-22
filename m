Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7C4C9830B
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:33:07 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2912.1790101985854058796
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PxL01CUq;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76906adso3339621cf.0
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101985; x=1790706785; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ohFFDzfcp43C/zNfCcuBIBV1YJCSyHNVNZU1QDpt00=;
        b=PxL01CUqOFiTRLoVA/JdTH0+5T3Xj4U8ARvmJMVUwhS13D1jeX7sMdF/eii+00i/0G
         hvZexjE9DxlGWlq4xSUwRDi1vKn3fx8MW0bWGJayApRVMcUh5GLA2aVlIXsdD5yHOcwa
         MM5/hBPwzZniaglWzQIMr0HIXf10GvyzLWtnYMJR7kEsvU5gvKAPblZgJ0sOVIa90G3E
         Y7k7KXDt8V21NLEgtZfkY4Wyzp6HNuFEqqTtIDzKjmU6IjxPfy+TbOBJhD2jAQD3TYSu
         6dcMzJ+/TbswuODmQC9JxgxxpVf1UCsK15orjnFFjrGjHqw0sNhGCrqn4O0BM+n7udhj
         uOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101985; x=1790706785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4ohFFDzfcp43C/zNfCcuBIBV1YJCSyHNVNZU1QDpt00=;
        b=tHnG/ljjB+uEx0qhk6H3F8kYdWUa6aLGekId2XK2s5mR5Z09VhNrfv9psIBu2DAuS4
         zOhAGUWxCcld6PZ3Ut9ZzOosXAS0wTNfUKPBxgTw4v1qAUQrxoiMoFrBYvCx+TQhpai7
         hN+yVH5z4rlTQcaAS/tNpuHe5uA6fs7PpQUe9M9WcDsDzWLPGyRgVP8sF5j0LuFflVo8
         /PN18I+cTrfISvHZ7KK21Z63HWPGDx2a/q6UYmg9eWhlqlBgDoVRx7O54RPeAb7/2Qi0
         U1rDG9zhoOEQTQLIPYH5yO5P8SfR39K0+Y9LwPIeElPm/Y4t7swLqh0O3yTCf+l4Abwl
         n/Mg==
X-Gm-Message-State: AFuF++nBqE1W9od4IB+ybHXMuLrQRIKLD4kiyg2g4yFGKZ97MAcSKofP
	cHx2vGk70JErRY3N7cpUFn2DxsBXYmq13PeWM5cwlvnqYo6PJ9fIIdGoGHFUjQ==
X-Gm-Gg: AYBFou0JOSstWEpDJZFbbt8/kIFfUUU+2EeR5QeLzlISb9RtOm8hytdyhUcbJKPc879
	CMuUtIq27tskAgqeyGWdZ9O23w6YvbDM3bkQttQC3kzDeheYjbnhwgmtFWha4viZ3VGiGumh/+c
	MZrklA0GGldyaagifTDfi+BS/SY7e8E2cGbXUClVKKalcLb3Gh1wGwWkfwqTi9YL87h9ZVaPW65
	1TQZ0ouO90dkzBhF3ww0+X6OSzbD8eIRxnswInUHW23/jdbjJ2NXNOZ2JcWzx2D+GcZkOTJ6jXE
	NXfXFz67ey9iXtwAvbZOvyqS8casdXp+PCuMgL75u4pBmMYcN3rWiNTyE7xcJWue1+lqlj5GJ+6
	KuO+PEN9xBBD8zpI5ayq7zAMRZPQKXVbnGgOrJjIj+MKMUJXVusml6yYeBsCxS86pmyipIxdRKV
	cQ2tGS71v3i+XmhYJffSVw9bL2j2OwgBSd5JbK2JCQVnuU+nSD7OfKvbO8sKUut8e6Vd/NggtOP
	vqAoolG5TP5zj021WvkGnRHQgvhFbC2L72BkAmU7hS1d6d3sJY=
X-Received: by 2002:a05:622a:138a:b0:532:a5a2:e3f4 with SMTP id d75a77b69052e-532eacf5413mr6738201cf.41.1790101984313;
        Tue, 22 Sep 2026 11:33:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.33.03
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:33:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 6/8] docs: remove real accounts from the examples
Date: Tue, 22 Sep 2026 14:32:47 -0400
Message-ID: <20260922183249.2433345-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922183249.2433345-1-twoerner@gmail.com>
References: <20260922183249.2433345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10595

Examples across the manuals carry the account names of the people who
wrote them, in home directory paths and in shell prompts that also
name a machine. Use "/home/user" and a bare "$", which is what the rest
of the manuals already do.

The autobuilder's own service account is left alone: the paths containing
it are about autobuilder output rather than about somebody's machine.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- rebased on master-next; no other change
---
 documentation/dev-manual/debugging.rst        |  4 +-
 documentation/dev-manual/layers.rst           | 12 ++---
 documentation/dev-manual/qemu.rst             |  2 +-
 .../dev-manual/upgrading-recipes.rst          | 18 ++++----
 documentation/dev-manual/wic.rst              | 44 +++++++++----------
 documentation/kernel-dev/common.rst           | 16 +++----
 documentation/profile-manual/usage.rst        |  2 +-
 .../ref-manual/devtool-reference.rst          |  6 +--
 documentation/ref-manual/faq.rst              |  6 +--
 documentation/ref-manual/variables.rst        |  8 ++--
 documentation/sdk-manual/extensible.rst       |  6 +--
 11 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 8412c997a51e..62e19a6c8a28 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -144,7 +144,7 @@ helpful during debugging.
 Variables that are exported to the environment are preceded by
 ``export`` in the output of ``bitbake-getvar``. See the following example::
 
-   export CC="i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/ulf/poky/build/tmp/sysroots/qemux86"
+   export CC="i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/user/poky/build/tmp/sysroots/qemux86"
 
 Shell functions and tasks can also be inspected with the same mechanism::
 
@@ -522,7 +522,7 @@ task dependency mechanisms.
 
    .. code-block:: none
 
-      WARNING: /home/ulf/openembedded-core/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb.do_compile is tainted from a forced run
+      WARNING: /home/user/openembedded-core/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb.do_compile is tainted from a forced run
 
 
    The purpose of the warning is to let you know that the work directory
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 185a63feb700..a36f849a0c3f 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -916,11 +916,11 @@ shows the layers that are in your :ref:`structure-build-conf-bblayers.conf` file
    NOTE: Starting bitbake server...
    layer                 path                                                            priority
    ==============================================================================================
-   meta                  /home/scottrif/bitbake-builds/layers/openembedded-core/meta           5
-   meta-poky             /home/scottrif/bitbake-builds/layers/meta-yocto/meta-poky             5
-   meta-yocto-bsp        /home/scottrif/bitbake-builds/layers/meta-yocto/meta-yocto-bsp        5
-   workspace             /home/scottrif/bitbake-builds/build/workspace                         99
-   meta-scottrif         /home/scottrif/bitbake-builds/build/meta-scottrif                     6
+   meta                  /home/user/bitbake-builds/layers/openembedded-core/meta           5
+   meta-poky             /home/user/bitbake-builds/layers/meta-yocto/meta-poky             5
+   meta-yocto-bsp        /home/user/bitbake-builds/layers/meta-yocto/meta-yocto-bsp        5
+   workspace             /home/user/bitbake-builds/build/workspace                         99
+   meta-scottrif         /home/user/bitbake-builds/build/meta-scottrif                     6
 
 Adding the layer to this file
 enables the build system to locate the layer during the build.
@@ -958,7 +958,7 @@ above:
 
 #. Run the script directly with no options::
 
-      alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
+      $ meta-alex/setup-layers
       Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
 
       Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 6d092b2d2034..d7e0b2f2f44f 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -151,7 +151,7 @@ available. Follow these general steps to run QEMU:
       determines the QEMU architecture (`MACHINE`) to be "qemux86-64" and
       the root filesystem type to be "vmdk"::
 
-         $ runqemu /home/scott-lenovo/vm/core-image-minimal-qemux86-64.wic.vmdk
+         $ runqemu /home/user/vm/core-image-minimal-qemux86-64.wic.vmdk
 
 Switching Between Consoles
 ==========================
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 0bdc1351ec7f..f4b9df241093 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -244,12 +244,12 @@ script. For example, suppose you use the ``nano.bb`` recipe from the
 ``meta-oe`` layer in the ``meta-openembedded`` repository. For this
 example, assume that the layer has been cloned into following area::
 
-   /home/scottrif/bitbake-builds/layers/meta-openembedded
+   /home/user/bitbake-builds/layers/meta-openembedded
 
 The following command from your :term:`Build Directory` adds the layer to
 your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``)::
 
-   $ bitbake-layers add-layer /home/scottrif/bitbake-builds/layers/meta-openembedded/meta-oe
+   $ bitbake-layers add-layer /home/user/bitbake-builds/layers/meta-openembedded/meta-oe
    NOTE: Starting bitbake server...
    Parsing recipes: 100% |##########################################| Time: 0:00:55
    Parsing of 1431 .bb files complete (0 cached, 1431 parsed). 2040 targets, 56 skipped, 0 masked, 0 errors.
@@ -265,7 +265,7 @@ directory automatically upgrades the recipe for you::
 
    $ devtool upgrade nano -V 2.9.3
    NOTE: Starting bitbake server...
-   NOTE: Creating workspace layer in /home/scottrif/bitbake-builds/build/workspace
+   NOTE: Creating workspace layer in /home/user/bitbake-builds/build/workspace
    Parsing recipes: 100% |##########################################| Time: 0:00:46
    Parsing of 1431 .bb files complete (0 cached, 1431 parsed). 2040 targets, 56 skipped, 0 masked, 0 errors.
    NOTE: Extracting current version source...
@@ -277,8 +277,8 @@ directory automatically upgrades the recipe for you::
    NOTE: Executing RunQueue Tasks
    NOTE: Tasks Summary: Attempted 74 tasks of which 72 didn't need to be rerun and all succeeded.
    Adding changed files: 100% |#####################################| Time: 0:00:00
-   NOTE: Upgraded source extracted to /home/scottrif/bitbake-builds/build/workspace/sources/nano
-   NOTE: New recipe is /home/scottrif/bitbake-builds/build/workspace/recipes/nano/nano_2.9.3.bb
+   NOTE: Upgraded source extracted to /home/user/bitbake-builds/build/workspace/sources/nano
+   NOTE: New recipe is /home/user/bitbake-builds/build/workspace/recipes/nano/nano_2.9.3.bb
 
 .. note::
 
@@ -300,7 +300,7 @@ newly upgraded recipe::
           .
    NOTE: Executing SetScene Tasks
    NOTE: Executing RunQueue Tasks
-   NOTE: nano: compiling from external source tree /home/scottrif/bitbake-builds/build/workspace/sources/nano
+   NOTE: nano: compiling from external source tree /home/user/bitbake-builds/build/workspace/sources/nano
    NOTE: Tasks Summary: Attempted 520 tasks of which 304 didn't need to be rerun and all succeeded.
 
 Within the ``devtool upgrade`` workflow, you can
@@ -321,9 +321,9 @@ directory::
    Parsing of 1432 .bb files complete (1431 cached, 1 parsed). 2041 targets, 56 skipped, 0 masked, 0 errors.
    NOTE: Adding new patch 0001-nano.bb-Stuff-I-changed-when-upgrading-nano.bb.patch
    NOTE: Updating recipe nano_2.9.3.bb
-   NOTE: Removing file /home/scottrif/bitbake-builds/layers/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb
-   NOTE: Moving recipe file to /home/scottrif/bitbake-builds/layers/meta-openembedded/meta-oe/recipes-support/nano
-   NOTE: Leaving source tree /home/scottrif/bitbake-builds/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
+   NOTE: Removing file /home/user/bitbake-builds/layers/meta-openembedded/meta-oe/recipes-support/nano/nano_2.7.4.bb
+   NOTE: Moving recipe file to /home/user/bitbake-builds/layers/meta-openembedded/meta-oe/recipes-support/nano
+   NOTE: Leaving source tree /home/user/bitbake-builds/build/workspace/sources/nano as-is; if you no longer need it then please delete it manually
 
 
 Using the ``devtool finish`` command cleans up the workspace and creates a patch
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index c13655f8730a..9161122d3166 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -520,13 +520,13 @@ file:
      ./mkefidisk-201804191017-sda.direct
 
    The following build artifacts were used to create the image(s):
-     ROOTFS_DIR:                   /home/stephano/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
-     BOOTIMG_DIR:                  /home/stephano/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
-     KERNEL_DIR:                   /home/stephano/yocto/build/tmp-glibc/deploy/images/qemux86
-     NATIVE_SYSROOT:               /home/stephano/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
+     ROOTFS_DIR:                   /home/user/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
+     BOOTIMG_DIR:                  /home/user/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
+     KERNEL_DIR:                   /home/user/yocto/build/tmp-glibc/deploy/images/qemux86
+     NATIVE_SYSROOT:               /home/user/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
-     /home/stephano/yocto/openembedded-core/files/wic/mkefidisk.wks
+     /home/user/yocto/openembedded-core/files/wic/mkefidisk.wks
 
 The previous example shows the easiest way to create an image by running
 in cooked mode and supplying a kickstart file and the "-e" option to
@@ -590,8 +590,8 @@ the lines that specify the target disk from which to boot:
 
 .. code-block:: console
 
-   $ cp /home/stephano/yocto/openembedded-core/files/wic/directdisk-gpt.wks \
-        /home/stephano/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
+   $ cp /home/user/yocto/openembedded-core/files/wic/directdisk-gpt.wks \
+        /home/user/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
 
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
@@ -625,13 +625,13 @@ Computing (nuc) :term:`MACHINE`:
      ./directdisksdb-gpt-201710090938-sdb.direct
 
    The following build artifacts were used to create the image(s):
-     ROOTFS_DIR:                   /home/stephano/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
-     BOOTIMG_DIR:                  /home/stephano/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
-     KERNEL_DIR:                   /home/stephano/yocto/build/tmp-glibc/deploy/images/qemux86
-     NATIVE_SYSROOT:               /home/stephano/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
+     ROOTFS_DIR:                   /home/user/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
+     BOOTIMG_DIR:                  /home/user/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
+     KERNEL_DIR:                   /home/user/yocto/build/tmp-glibc/deploy/images/qemux86
+     NATIVE_SYSROOT:               /home/user/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
-     /home/stephano/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
+     /home/user/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
 
 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot
@@ -655,22 +655,22 @@ default output directory, which is the current directory:
 
 .. code-block:: console
 
-   $ wic create test.wks -o /home/stephano/testwic \
-        --rootfs-dir /home/stephano/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
-        --bootimg-dir /home/stephano/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share \
-        --kernel-dir /home/stephano/yocto/build/tmp/deploy/images/qemux86 \
-        --native-sysroot /home/stephano/yocto/build/tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native
+   $ wic create test.wks -o /home/user/testwic \
+        --rootfs-dir /home/user/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
+        --bootimg-dir /home/user/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share \
+        --kernel-dir /home/user/yocto/build/tmp/deploy/images/qemux86 \
+        --native-sysroot /home/user/yocto/build/tmp/work/i586-poky-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: Creating image(s)...
 
    INFO: The new image(s) can be found here:
-     /home/stephano/testwic/test-201710091445-sdb.direct
+     /home/user/testwic/test-201710091445-sdb.direct
 
    The following build artifacts were used to create the image(s):
-     ROOTFS_DIR:                   /home/stephano/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
-     BOOTIMG_DIR:                  /home/stephano/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
-     KERNEL_DIR:                   /home/stephano/yocto/build/tmp-glibc/deploy/images/qemux86
-     NATIVE_SYSROOT:               /home/stephano/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
+     ROOTFS_DIR:                   /home/user/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs
+     BOOTIMG_DIR:                  /home/user/yocto/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/share
+     KERNEL_DIR:                   /home/user/yocto/build/tmp-glibc/deploy/images/qemux86
+     NATIVE_SYSROOT:               /home/user/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
      test.wks
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 555aadc76a6c..15c8429dbeb3 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1250,32 +1250,32 @@ Here is sample output from the :ref:`ref-tasks-kernel_configcheck` task:
 
    ---------- CONFIG_X86_TSC -----------------
    Config: CONFIG_X86_TSC
-   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-cpu.cfg
+   From: /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc-cpu.cfg
    Requested value:  CONFIG_X86_TSC=y
    Actual value:
 
 
    ---------- CONFIG_X86_BIGSMP -----------------
    Config: CONFIG_X86_BIGSMP
-   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
-         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
+   From: /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
+         /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
    Requested value:  # CONFIG_X86_BIGSMP is not set
    Actual value:
 
 
    ---------- CONFIG_NR_CPUS -----------------
    Config: CONFIG_NR_CPUS
-   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
-         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc.cfg
-         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
+   From: /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
+         /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/bsp/common-pc/common-pc.cfg
+         /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
    Requested value:  CONFIG_NR_CPUS=8
    Actual value:     CONFIG_NR_CPUS=1
 
 
    ---------- CONFIG_SCHED_SMT -----------------
    Config: CONFIG_SCHED_SMT
-   From: /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
-         /home/scottrif/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
+   From: /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
+         /home/user/bitbake-builds/build/tmp/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/defconfig
    Requested value:  CONFIG_SCHED_SMT=y
    Actual value:
 
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 4efaa6d10fce..7fdbe41da5e7 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -322,7 +322,7 @@ debug packages once built can be found in ``build/tmp/deploy/rpm/*``
 on the host system. Find the ``busybox-dbg-...rpm`` file and copy it
 to the target. For example::
 
-   [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
+   $ scp /home/user/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
    busybox-dbg-1.20.2-r2.core2_32.rpm                     100% 1826KB   1.8MB/s   00:01
 
 Now install the debug RPM on the target::
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 62c3b707b9ff..c8ca7bad8c9c 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -460,7 +460,7 @@ Here is an example that resets the workspace directory that contains the
 
    $ devtool reset mtr
    NOTE: Cleaning sysroot for recipe mtr...
-   NOTE: Leaving source tree /home/scottrif/bitbake-builds/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
+   NOTE: Leaving source tree /home/user/bitbake-builds/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
 
 .. _devtool-finish-working-on-a-recipe:
 
@@ -612,7 +612,7 @@ You can create a workspace layer anywhere by supplying a pathname with
 the command. The following command creates a new workspace layer named
 "new-workspace"::
 
-   $ devtool create-workspace /home/scottrif/new-workspace
+   $ devtool create-workspace /home/user/new-workspace
 
 .. _devtool-get-the-status-of-the-recipes-in-your-workspace:
 
@@ -632,7 +632,7 @@ Here is sample output after using
 to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
    $ devtool status
-   mtr:/home/scottrif/bitbake-builds/build/workspace/sources/mtr (/home/scottrif/bitbake-builds/build/workspace/recipes/mtr/mtr_0.86.bb)
+   mtr:/home/user/bitbake-builds/build/workspace/sources/mtr (/home/user/bitbake-builds/build/workspace/recipes/mtr/mtr_0.86.bb)
 
 .. _devtool-search-for-available-target-recipes:
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index f8e047e27fed..3646286a6e0c 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -461,11 +461,11 @@ and related variables. To better understand this, consider the following
 two paths (artificially broken across lines for readability) where the
 first is relatively normal and the second is not::
 
-   /home/maxtothemax/poky-bootchart2/build/tmp/work/i586-poky-linux/zlib/
+   /home/user/poky-bootchart2/build/tmp/work/i586-poky-linux/zlib/
       1.2.8-r0/sysroot-destdir/usr/bin
 
-   /home/maxtothemax/poky-bootchart2/build/tmp/work/x86_64-linux/
-      zlib-native/1.2.8-r0/sysroot-destdir/home/maxtothemax/poky-bootchart2/
+   /home/user/poky-bootchart2/build/tmp/work/x86_64-linux/
+      zlib-native/1.2.8-r0/sysroot-destdir/home/user/poky-bootchart2/
       build/tmp/sysroots/x86_64-linux/usr/bin
 
 Even if the paths look unusual, they both are correct --- the first for
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0072992b8597..8a9bd9075843 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -888,10 +888,10 @@ system and gives an overview of their function and contents.
       Here is an example::
 
          BBLAYERS = " \
-             /home/scottrif/bitbake-builds/layers/meta \
-             /home/scottrif/bitbake-builds/layers/meta-poky \
-             /home/scottrif/bitbake-builds/layers/meta-yocto-bsp \
-             /home/scottrif/bitbake-builds/layers/meta-mykernel \
+             /home/user/bitbake-builds/layers/meta \
+             /home/user/bitbake-builds/layers/meta-poky \
+             /home/user/bitbake-builds/layers/meta-yocto-bsp \
+             /home/user/bitbake-builds/layers/meta-mykernel \
              "
 
       This example enables four layers, one of which is a custom,
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 0eb9eda8d82a..8b8034707eab 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -149,7 +149,7 @@ architecture. The example assumes the SDK installer is located in
    Poky (Yocto Project Reference Distro) Extensible SDK installer version 2.5
    ==========================================================================
    Enter target directory for SDK (default: poky_sdk):
-   You are about to install the SDK to "/home/scottrif/poky_sdk". Proceed [Y/n]? Y
+   You are about to install the SDK to "/home/user/poky_sdk". Proceed [Y/n]? Y
    Extracting SDK..............done
    Setting it up...
    Extracting buildtools...
@@ -162,7 +162,7 @@ architecture. The example assumes the SDK installer is located in
    done
    SDK has been successfully set up and is ready to be used.
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
-    $ . /home/scottrif/poky_sdk/environment-setup-core2-64-poky-linux
+    $ . /home/user/poky_sdk/environment-setup-core2-64-poky-linux
 
 .. note::
 
@@ -197,7 +197,7 @@ script is for an IA-based target machine using i586 tuning:
 
 .. code-block:: console
 
-   $ cd /home/scottrif/poky_sdk
+   $ cd /home/user/poky_sdk
    $ source environment-setup-core2-64-poky-linux
    SDK environment now set up; additionally you may now run devtool to perform development tasks.
    Run devtool --help for further details.
-- 
2.50.0.173.g8b6f19ccfc3a


