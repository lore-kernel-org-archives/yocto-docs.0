Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D146C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 07:27:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7141.1639639664464370977
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 23:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BE46220005;
	Thu, 16 Dec 2021 07:27:41 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: replace "rootfs" by "root filesystem"
Date: Thu, 16 Dec 2021 08:27:38 +0100
Message-Id: <20211216072738.2012661-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 07:27:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2280

Almost everyone understands "rootfs", but "root filesystem"
is real English.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst        |  9 +++++----
 documentation/kernel-dev/faq.rst                 |  4 ++--
 documentation/migration-guides/migration-2.2.rst |  2 +-
 documentation/migration-guides/migration-2.5.rst |  2 +-
 documentation/migration-guides/migration-2.6.rst |  2 +-
 documentation/profile-manual/usage.rst           |  2 +-
 documentation/ref-manual/classes.rst             | 10 +++++-----
 documentation/ref-manual/kickstart.rst           |  4 ++--
 documentation/ref-manual/variables.rst           |  2 +-
 documentation/what-i-wish-id-known.rst           |  2 +-
 10 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index f7d82ba191..9d0c8f33d4 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2243,12 +2243,13 @@ error during the
 
 If you have recipes that use ``pkg_postinst`` function and they require
 the use of non-standard native tools that have dependencies during
-rootfs construction, you need to use the
+root filesystem construction, you need to use the
 :term:`PACKAGE_WRITE_DEPS`
 variable in your recipe to list these tools. If you do not use this
 variable, the tools might be missing and execution of the
 post-installation script is deferred until first boot. Deferring the
-script to first boot is undesirable and for read-only rootfs impossible.
+script to the first boot is undesirable and impossible for read-only
+root filesystems.
 
 .. note::
 
@@ -8487,14 +8488,14 @@ perform a one-time setup of your controller image by doing the following:
 
    -  Uses a custom Initial RAM Disk (initramfs) image with a custom
       installer. A normal image that you can install usually creates a
-      single rootfs partition. This image uses another installer that
+      single root filesystem partition. This image uses another installer that
       creates a specific partition layout. Not all Board Support
       Packages (BSPs) can use an installer. For such cases, you need to
       manually create the following partition layout on the target:
 
       -  First partition mounted under ``/boot``, labeled "boot".
 
-      -  The main rootfs partition where this image gets installed,
+      -  The main root filesystem partition where this image gets installed,
          which is mounted under ``/``.
 
       -  Another partition labeled "testrootfs" where test images get
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index 5aa702ad69..e40e3ff372 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -30,8 +30,8 @@ Refer to the
 ":ref:`kernel-dev/common:working with your own sources`"
 section for information.
 
-How do I install/not-install the kernel image on the rootfs?
-------------------------------------------------------------
+How do I install/not-install the kernel image on the root filesystem?
+---------------------------------------------------------------------
 
 The kernel image (e.g. ``vmlinuz``) is provided by the
 ``kernel-image`` package. Image recipes depend on ``kernel-base``. To
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index c063deb44b..a6c1a4aa48 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -154,7 +154,7 @@ enables fine-grained tuning of options passed to QEMU without the
 Using a configuration file is particularly convenient when trying to use
 QEMU with machines other than the ``qemu*`` machines in
 :term:`OpenEmbedded-Core (OE-Core)`. The ``qemuboot.conf`` file is generated by the
-``qemuboot`` class when the root filesystem is being build (i.e. build
+``qemuboot`` class when the root filesystem is being built (i.e. build
 rootfs). QEMU boot arguments can be set in BSP's configuration file and
 the ``qemuboot`` class will save them to ``qemuboot.conf``.
 
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index bd75522773..abd26809df 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -287,7 +287,7 @@ The following are additional changes:
 
 -  For EFI-based machines, the bootloader (``grub-efi`` by default) is
    installed into the image at /boot. Wic can be used to split the
-   bootloader into separate boot and rootfs partitions if necessary.
+   bootloader into separate boot and root filesystem partitions if necessary.
 
 -  Patches whose context does not match exactly (i.e. where patch
    reports "fuzz" when applying) will generate a warning. For an example
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index a8c56ede72..c68414e1ca 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -363,7 +363,7 @@ Post Installation Changes
 
 You must explicitly mark post installs to defer to the target. If you
 want to explicitly defer a postinstall to first boot on the target
-rather than at rootfs creation time, use ``pkg_postinst_ontarget()`` or
+rather than at root filesystem creation time, use ``pkg_postinst_ontarget()`` or
 call ``postinst_intercept delay_to_first_boot`` from ``pkg_postinst()``.
 Any failure of a ``pkg_postinst()`` script (including exit 1) triggers
 an error during the :ref:`ref-tasks-rootfs` task.
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 3d2840884f..56f1e66674 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -2138,7 +2138,7 @@ For LTTng userspace tracing, you need to have a properly instrumented
 userspace program. For this example, we'll use the 'hello' test program
 generated by the lttng-ust build.
 
-The 'hello' test program isn't installed on the rootfs by the lttng-ust
+The 'hello' test program isn't installed on the root filesystem by the lttng-ust
 build, so we need to copy it over manually. First cd into the build
 directory that contains the hello executable::
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2c191f407e..34e0d86670 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1362,9 +1362,9 @@ is set to 0.
 
 Only a single Initramfs bundle can be added to the FIT image created by
 ``kernel-fitimage`` and the Initramfs bundle in FIT is optional.
-In case of Initramfs, the kernel is configured to be bundled with the rootfs
+In case of Initramfs, the kernel is configured to be bundled with the root filesystem
 in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
-When the kernel is copied to RAM and executed, it unpacks the Initramfs rootfs.
+When the kernel is copied to RAM and executed, it unpacks the Initramfs root filesystem.
 The Initramfs bundle can be enabled when :term:`INITRAMFS_IMAGE`
 is specified and that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
 The address where the Initramfs bundle is to be loaded by U-boot is specified
@@ -1712,13 +1712,13 @@ layers.
 ``overlayfs.bbclass``
 =======================
 
-It's often desired in Embedded System design to have a read-only rootfs.
+It's often desired in Embedded System design to have a read-only root filesystem.
 But a lot of different applications might want to have read-write access to
 some parts of a filesystem. It can be especially useful when your update mechanism
-overwrites the whole rootfs, but you may want your application data to be preserved
+overwrites the whole root filesystem, but you may want your application data to be preserved
 between updates. The :ref:`overlayfs <ref-classes-overlayfs>` class provides a way
 to achieve that by means of ``overlayfs`` and at the same time keeping the base
-rootfs read-only.
+root filesystem read-only.
 
 To use this class, set a mount point for a partition ``overlayfs`` is going to use as upper
 layer in your machine configuration. The underlying file system can be anything that
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 807f5e052d..885c721297 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -87,7 +87,7 @@ the ``part`` and ``partition`` commands:
 
    If you use ``--source rootfs``, Wic creates a partition as large as
    needed and fills it with the contents of the root filesystem pointed
-   to by the ``-r`` command-line option or the equivalent rootfs derived
+   to by the ``-r`` command-line option or the equivalent root filesystem derived
    from the ``-e`` command-line option. The filesystem type used to
    create the partition is driven by the value of the ``--fstype``
    option specified for the partition. See the entry on ``--fstype``
@@ -96,7 +96,7 @@ the ``part`` and ``partition`` commands:
    If you use ``--source plugin-name``, Wic creates a partition as large
    as needed and fills it with the contents of the partition that is
    generated by the specified plugin name using the data pointed to by
-   the ``-r`` command-line option or the equivalent rootfs derived from
+   the ``-r`` command-line option or the equivalent root filesystem derived from
    the ``-e`` command-line option. Exactly what those contents are and
    filesystem type used are dependent on the given plugin
    implementation.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e5216b3f36..4f5d084e54 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5302,7 +5302,7 @@ system and gives an overview of their function and contents.
    :term:`PACKAGE_WRITE_DEPS`
       Specifies a list of dependencies for post-installation and
       pre-installation scripts on native/cross tools. If your
-      post-installation or pre-installation script can execute at rootfs
+      post-installation or pre-installation script can execute at root filesystem
       creation time rather than on the target but depends on a native tool
       in order to execute, you need to list the tools in
       :term:`PACKAGE_WRITE_DEPS`.
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 143f9fbfed..dec5617173 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -150,7 +150,7 @@ contact us with other suggestions.
    need, which is advantageous because you are building for small devices when
    developing for embedded and IoT.
 
-#. **You will want to learn about and know what's packaged in rootfs.**
+#. **You will want to learn about and know what's packaged in the root filesystem.**
 
 #. **Create your own image recipe:**
    There are a number of ways to create your own image recipe.  We suggest you
-- 
2.25.1


