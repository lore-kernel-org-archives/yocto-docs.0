Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.5495.1608599169136549097
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 17:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=G/VFO2ag;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id EB2BA20B83FA; Mon, 21 Dec 2020 17:06:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EB2BA20B83FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608599167;
	bh=15OvLsH8Vk4bXagW9mG5RbzyU/Awc3lPeH/diNATXlU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G/VFO2agRGgfEUpJglx+ih4xTZZp4RcLpvDr1WgMQJqD7qdG1ZQpuRtC5dVwDOcE+
	 fI0wZfrvZibXAe7Eo1myYbDezSmEJvLnLK+MMtpxpg06WCVjjhb+7fruhoeCQSyvW9
	 gDSQtRmOjO6xpzAQpYUu0NjWRuu7BPI3IcOmI160=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/5] ref-manual: use consistent capitalisation of U-Boot
Date: Mon, 21 Dec 2020 17:06:04 -0800
Message-Id: <f0712efec27dbf1d26fabcd221851607bf0367a3.1608598606.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Change all instances of U-boot to U-Boot.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst       | 6 +++---
 documentation/ref-manual/migration-1.7.rst | 2 +-
 documentation/ref-manual/variables.rst     | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 08ced7f..d049ca7 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1391,19 +1391,19 @@ when creating the FIT image are specified using the
 
 Only a single kernel can be added to the FIT image created by
 ``kernel-fitimage`` and the kernel image in FIT is mandatory. The
-address where the kernel image is to be loaded by U-boot is
+address where the kernel image is to be loaded by U-Boot is
 specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_ENTRYPOINT`.
 
 Multiple device trees can be added to the FIT image created by
 ``kernel-fitimage`` and the device tree is optional.
-The address where the device tree is to be loaded by U-boot is
+The address where the device tree is to be loaded by U-Boot is
 specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
 and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
 
 Only a single RAM disk can be added to the FIT image created by
 ``kernel-fitimage`` and the RAM disk in FIT is optional.
-The address where the RAM disk image is to be loaded by U-boot
+The address where the RAM disk image is to be loaded by U-Boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to FIT image when
 :term:`INITRAMFS_IMAGE` is specified.
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 19275b3..54544e4 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -190,7 +190,7 @@ Removed Recipes
 
 The following recipes have been removed:
 
--  ``x-load``: This recipe has been superseded by U-boot SPL for all
+-  ``x-load``: This recipe has been superseded by U-Boot SPL for all
    Cortex-based TI SoCs. For legacy boards, the ``meta-ti`` layer, which
    contains a maintained recipe, should be used instead.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 607ebfe..330f7dd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8405,21 +8405,21 @@ system and gives an overview of their function and contents.
       In this example, "sd" is selected as the configuration of the possible four for the
       ``UBOOT_MACHINE``. The "sd" configuration defines
       "mx6qsabreauto_config" as the value for ``UBOOT_MACHINE``, while the
-      "sdcard" specifies the ``IMAGE_FSTYPES`` to use for the U-boot image.
+      "sdcard" specifies the ``IMAGE_FSTYPES`` to use for the U-Boot image.
 
       For more information on how the ``UBOOT_CONFIG`` is handled, see the
       :ref:`uboot-config <ref-classes-uboot-config>`
       class.
 
    :term:`UBOOT_DTB_LOADADDRESS`
-      Specifies the load address for the dtb image used by U-boot. During FIT
+      Specifies the load address for the dtb image used by U-Boot. During FIT
       image creation, the ``UBOOT_DTB_LOADADDRESS`` variable is used in
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify
       the load address to be used in
       creating the dtb sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_DTBO_LOADADDRESS`
-      Specifies the load address for the dtbo image used by U-boot.  During FIT
+      Specifies the load address for the dtbo image used by U-Boot.  During FIT
       image creation, the ``UBOOT_DTBO_LOADADDRESS`` variable is used in
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the load address to be used in
       creating the dtbo sections of Image Tree Source for the FIT image.
@@ -8504,7 +8504,7 @@ system and gives an overview of their function and contents.
       certificate used for signing FIT image.
 
    :term:`UBOOT_SIGN_KEYNAME`
-      The name of keys used for signing U-boot FIT image stored in
+      The name of keys used for signing U-Boot FIT image stored in
       :term:`UBOOT_SIGN_KEYDIR` directory. For e.g. dev.key key and dev.crt
       certificate stored in :term:`UBOOT_SIGN_KEYDIR` directory will have
       :term:`UBOOT_SIGN_KEYNAME` set to "dev".
-- 
1.8.3.1

