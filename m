Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3AEC77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 06:19:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.41630.1682749180121310858
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 23:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Fg+2uoSU;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682749180; x=1714285180;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ygtfGUMLwLC451JzMOhBjkfqcegoYFaAhIjXT40t2j8=;
  b=Fg+2uoSUlpLlHuNBcPubOEHMzdHheqLTV+3T5lMxv02CGbUMB6UcN/rj
   TR/tc16Ps2D7G8ZAyePOIVimkBDmFGDLfReXVUBunKCkQOmcE4rrTty0y
   fHDSmHa+oDAme0V0WUILkKaJHZsbS4WC4OpJhoFo4OUsy6jlSe898VitB
   Z+KqhMt4I/ZlSKFfi4n9doW5QAQtJoM0QNAN+QvlUaxi6NzJztiSHckwa
   PRPlV+s+VBEDi/kdg1q8Spak1IwLzsY6d/dqW2aAIh1kQrgIUdkOjmBp1
   9ccQmVGSmWY/MDLqBz3CdMIp+nJaEJpqaq51tWyuwEfRNV5+wLPQx70oG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="332245206"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="332245206"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 23:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="941392688"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="941392688"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2023 23:19:37 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.2: remove/merge duplicates entries
Date: Sat, 29 Apr 2023 14:18:30 +0800
Message-Id: <20230429061830.3359909-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 29 Apr 2023 06:19:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3883

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-4.2.rst    | 48 ++++---------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 30a4afeeb..473ea984c 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -8,37 +8,34 @@ New Features / Enhancements in 4.2
 
 -  Linux kernel 6.1, glibc 2.37 and ~350 other recipe upgrades
 
--  Python 3.8 is the minimum Python version required on the build host.
+-  Python 3.8+ and GCC 8.0+ are now the minimum required versions on the build host.
    For host distributions that do not provide it, this is included as part of the
    :term:`buildtools` tarball.
 
 -  BitBake in this release now supports a new ``addpylib`` directive to enable
-   Python libraries within layers.
+   Python libraries within layers. For more information,
+   see :ref:`bitbake-user-manual/bitbake-user-manual-metadata:extending python library code`.
 
    This directive should be added to your layer configuration
    as in the below example from ``meta/conf/layer.conf``::
 
       addpylib ${LAYERDIR}/lib oe
 
--  BitBake has seen multiple internal changes that may impact
+-  BitBake has seen multiple internal changes that may improve
    memory and disk usage as well as parsing time, in particular:
 
    -  BitBake's Cooker server is now multithreaded.
 
+   -  Ctrl+C can now be used to interrupt some long-running operations
+      that previously ignored it.
+
    -  BitBake's cache has been extended to include more hash
       debugging data, but has also been optimized to :yocto_git:`compress
       cache data <https://git.yoctoproject.org/poky/commit/?h=mickledore&id=7d010055e2af3294e17db862f42664ca689a9356>`.
 
-   -  BitBake's Cooker server :yocto_git:`can now be pinged
-      </poky/commit/?h=mickledore&id=26f255da09>`
-      from the UI.
-
--  Architecture-specific enhancements:
-
-   -  This release adds initial support for the
-      :wikipedia:`LoongArch <Loongson#LoongArch>`
-      (``loongarch64``) architecture, though there is no testing for it yet.
-
+   -  BitBake's UI will now ping the server regularly to ensure
+      it is still alive.
+ 
 -  New variables:
 
    -  :term:`VOLATILE_TMP_DIR` allows to specify
@@ -71,27 +68,6 @@ New Features / Enhancements in 4.2
    -  Use built-in Rust targets for ``-native`` builds to save several
       minutes building the Rust toolchain
 
--  Python 3.8+ and GCC 8.0+ are now the minimum required versions on the build host
-
--  BitBake in this release now supports a new ``addpylib`` directive to enable
-   Python libraries within layers. For more information,
-   see :ref:`bitbake-user-manual/bitbake-user-manual-metadata:extending python library code`.
-
--  BitBake has seen multiple internal changes that may improve
-   memory and disk usage as well as parsing time, in particular:
-
-   -  BitBake's Cooker server is now multithreaded.
-
-   -  Ctrl+C can now be used to interrupt some long-running operations
-      that previously ignored it.
-
-   -  BitBake's cache has been extended to include more hash
-      debugging data, but has also been optimized to :yocto_git:`compress
-      cache data <https://git.yoctoproject.org/poky/commit/?h=mickledore&id=7d010055e2af3294e17db862f42664ca689a9356>`.
-
-   -  BitBake's UI will now ping the server regularly to ensure
-      it is still alive.
-
 -  Architecture-specific enhancements:
 
    -  This release adds initial support for the
@@ -227,7 +203,6 @@ New Features / Enhancements in 4.2
    - ``base-passwd``
    - ``cronie``
    - ``cups``
-   - ``cups``
    - ``curl``
    - ``file``
    - ``gstreamer1.0-plugins-good``
@@ -310,9 +285,6 @@ New Features / Enhancements in 4.2
 
    -  Many packages were updated to add large file support.
 
-   -  New :term:`VOLATILE_TMP_DIR` variable allows to specify whether ``/tmp``
-      should be on persistent storage or in RAM.
-
    -  ``vulkan-loader``: allow headless targets to build the loader
    -  ``dhcpcd``: fix to work with systemd
    -  ``u-boot``: add /boot to :term:`SYSROOT_DIRS` to allow boot files to be used by other recipes
-- 
2.34.1


