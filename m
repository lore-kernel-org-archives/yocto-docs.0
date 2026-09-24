Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92646C98328
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:09 +0000 (UTC)
Received: from mail-ua2-f39.google.com (mail-ua2-f39.google.com [74.125.226.231])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3795.1790270948486011767
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kQ6JQ6Lk;
 spf=pass (domain: gmail.com, ip: 74.125.226.231, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f39.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso34493241.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270947; x=1790875747; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LLLvrqB1D4M5phhj3cKpYVhbXvyFa5H1x7ljUd2CXj0=;
        b=kQ6JQ6LkDNezSrg8IJSY/LsmW5hahacpF7OvZMKY1dd2CuxfO6YK7z24Nn/hPzlXDI
         tVgMc3Iaww8hiJISl8xW21ggsGSaa4Fh0dZh/8Omdd4Kws2oHspbPHRe2eDUKKiAt11d
         gcrxI58EPrgXBwmRAxxsOHhYF/InM+q/SFUj8kPssFbYBRs1IAubLyFXJz+4cWkPwUV9
         dlvtAy06cQExD8EtPI3j0GXK6GwoWOXvJwjhbVhPFtZRRAoQY55tW+4nCuYqT8MvPAc/
         76OfqpaY7F/oTgpt0SIgfZBySX5FOy+s6pMMfJ6GvmU+K/NPvM1DY90YRc38TkzXIBYT
         tkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270947; x=1790875747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LLLvrqB1D4M5phhj3cKpYVhbXvyFa5H1x7ljUd2CXj0=;
        b=oGSR2VPMWWAf8dJbHB9VO9ChW/RSLwCgYKoGTe1e2vb6AbWAQvlbOWYFqb6UZHgX1h
         YyDM5SSoZB2eb0CS277cGWVcBul3MpC5lW567IRz7IhESr4V+X2NqIq18RM8f1RUpxK2
         MdGDsbdjjXf3FXpztiLlh+xBDr/+VEHMhE+LYvJWBhTF4gr77Rtxqf8XZbQ3ms/zIRWv
         Xa+UXONoExvJ9Mttk6DsrZQJujmls6kGFFjF8AyFo6OLgns2l1EAGT6jYbKBy1bgbMRY
         9Ef4eCwSJiJAet1/irEYJBvS7KHs/uk+XVbpFgvGwCSzDD85u4LerUr09jBnKdMrKbpX
         I13A==
X-Gm-Message-State: AFuF++k8nybmVqTT5gIDdLkqdNPSAYsLEg7zSfEKirpWRSurUkaEzz6Y
	HY9wgenkxkYSFfDZm5UaC0AWWeX7DMguSSZkdxfoYdLARqIPmgimyZgx1Du9Lg==
X-Gm-Gg: AYBFou2nof5vifX/i1IC9EEqMCRru1FmPvonQXmCaVJXdYRgs9cSJnSllvHMPkiOs2j
	XwwSpgQVgTgVGsz75nOLgrrEHb008Y8ulIrKkhiK+H943vGvmKd5JsT896FIwgqpJllJVVG9xXP
	grjOC2W3ZFDvY/OiqS7nv6V/1XQtw5CnX+SQ5yJlgDNT4JCT4S4yRzSXc5eczaOqGL8M0gGh3z7
	G2zCLy8QmIJhOnZJQIzcTs23RI5MvVI289BlxMdOxG7UYnM1nxCZ5ft3glSSLDuzeeHwbde41uM
	4q2cL/HKuKmTCzNKN9R9kzH1QD40QLvaIU1JYAMEY9y09rZPfm6/RFrEKbtO0Ri9QCDC31znb9D
	qVKJkWUJ/K7OGG0otScbWK+rr0+xpRKMcYgSrh1jFjVx5msDdmcs+jHmL50zYftPGOXEbcafcXY
	Jlv02hpIxBVjDkX7mR4yb8HMYnNbzu7j+JN9Drs3i83Dp2YkXmW5J2NTIKK1fGWimEXucgc0byX
	fyA54nlgvyjXPKp8JKlbRFAexBnYZe2qJipXY/U
X-Received: by 2002:a05:6102:3911:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7af1e4e799emr1400524137.22.1790270946826;
        Thu, 24 Sep 2026 10:29:06 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.05
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 06/10] docs: remove real accounts from the examples
Date: Thu, 24 Sep 2026 13:28:49 -0400
Message-ID: <20260924172853.2665062-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10629

Examples across the manuals carry the account names of the people who
wrote them, in home directory paths and in a shell prompt that also
names a machine. Use "/home/user" and a bare "$", which is what the rest
of the manuals already do.

Two are left as they are: the autobuilder's service account, whose
paths are about autobuilder output rather than somebody's machine, and
a prompt whose command is a relative path, where the working directory
the prompt carries is what says where the command runs.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- the setup-layers prompt keeps its path, which is what says where the
  relative command runs

changes in v2:
- rebased on master-next; no other change
---
 documentation/dev-manual/debugging.rst        |  4 +-
 documentation/dev-manual/layers.rst           | 10 ++---
 documentation/dev-manual/qemu.rst             |  2 +-
 .../dev-manual/upgrading-recipes.rst          | 18 ++++----
 documentation/dev-manual/wic.rst              | 44 +++++++++----------
 documentation/kernel-dev/common.rst           | 16 +++----
 documentation/profile-manual/usage.rst        |  2 +-
 .../ref-manual/devtool-reference.rst          |  6 +--
 documentation/ref-manual/faq.rst              |  6 +--
 documentation/ref-manual/variables.rst        |  8 ++--
 documentation/sdk-manual/extensible.rst       |  6 +--
 11 files changed, 61 insertions(+), 61 deletions(-)

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
index 185a63feb700..5c8bf32b41fc 100644
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
index 3de61cab08d6..c478e64d6577 100644
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
index 7ba5c48fd8ed..ce17d713f399 100644
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


