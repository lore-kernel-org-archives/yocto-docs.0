Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.8774.1600420011426189014
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 02:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: FFOi5L0kSejusCh5uCXQW9kC/UBljHImI0Gg9nWQ3+dlhr3uuIrmKFslr4CZSwCliLvv9/+PoX
 Yitf80HgS78Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="244729717"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="244729717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:06:50 -0700
IronPort-SDR: vnFEc7qwHgaKNgiYxBtuy2Og/DGSu0Qx47YiJ1b/j35eUg6PhWay9acisqRWKkRcdRpGZ281j7
 EJp0oxavx1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="346934875"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 18 Sep 2020 02:06:48 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: docs@lists.yoctoproject.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH v2] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
Date: Fri, 18 Sep 2020 17:06:47 +0800
Message-Id: <1600420007-43045-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

IMAGE_EFI_BOOT_FILES created to help differentiate files needed between
bootimg-efi and bootimg-partition when creating the installer/.wic file.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 documentation/ref-manual/ref-variables.rst | 37 +++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 625a37c..8483e08 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -2902,10 +2902,45 @@ system and gives an overview of their function and contents.
       The base name of image output files. This variable defaults to the
       recipe name (``${``\ :term:`PN`\ ``}``).
 
+   IMAGE_EFI_BOOT_FILES
+      A space-separated list of files installed into the boot partition
+      when preparing an image using the Wic tool with the
+      ``bootimg-efi`` source plugin. By default,
+      the files are
+      installed under the same name as the source files. To change the
+      installed name, separate it from the original name with a semi-colon
+      (;). Source files need to be located in
+      :term:`DEPLOY_DIR_IMAGE`. Here are two
+      examples:
+      ::
+
+         IMAGE_EFI_BOOT_FILES = ${IMGDEPLOYDIR}/${IMAGE_BASENAME}-${MACHINE}.ext4;rootfs.img
+
+      Alternatively, source files can be picked up using a glob pattern. In
+      this case, the destination file must have the same name as the base
+      name of the source file path. To install files into a directory
+      within the target location, pass its name after a semi-colon (;).
+      Here are two examples:
+      ::
+
+         IMAGE_EFI_BOOT_FILES = "boot/loader/*"
+         IMAGE_EFI_BOOT_FILES = "boot/loader/*;boot/"
+
+      The first example
+      installs all files from ``${DEPLOY_DIR_IMAGE}/boot/loader/``
+      into the root of the target partition. The second example installs
+      the same files into a ``boot`` directory within the target partition.
+
+      You can find information on how to use the Wic tool in the
+      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
+      section of the Yocto Project Development Tasks Manual. Reference
+      material for Wic is located in the
+      ":doc:`../ref-manual/ref-kickstart`" chapter.
+
    IMAGE_BOOT_FILES
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
-      ``bootimg-partition`` or ``bootimg-efi`` source plugin. By default,
+      ``bootimg-partition`` source plugin. By default,
       the files are
       installed under the same name as the source files. To change the
       installed name, separate it from the original name with a semi-colon
-- 
2.7.4

