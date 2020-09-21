Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.39810.1600687623315215942
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 04:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: g5g5UeS878FEN5Mnb/7Hr3zh4GDr8NWLH6zohK3ya3pKGLytN60aUogsNfHLJAAi7CfPdJdlO9
 AqAN1eFuN96A==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="224499064"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="224499064"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 04:26:58 -0700
IronPort-SDR: UZOVBRu5nTQps3NvaCUnTfoP6rMaNGZB4D7rfgIRApQ6GaDrFaWGPi5a763ATAmIIqj3lG+ZjK
 MSwuXOYv20Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="290872753"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 21 Sep 2020 04:26:56 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: docs@lists.yoctoproject.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH v3] sphinx: ref-variables: Added entry for IMAGE_EFI_BOOT_FILES
Date: Mon, 21 Sep 2020 19:26:55 +0800
Message-Id: <1600687615-18331-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

IMAGE_EFI_BOOT_FILES created to help differentiate files needed between
bootimg-efi and bootimg-partition when creating the installer/.wic file.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 documentation/ref-manual/ref-variables.rst | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 625a37c..c09809e 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -2902,10 +2902,46 @@ system and gives an overview of their function and contents.
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
+         IMAGE_EFI_BOOT_FILES = "${KERNEL_IMAGETYPE};bz2"
+         IMAGE_EFI_BOOT_FILES = "${KERNEL_IMAGETYPE} microcode.cpio"
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

