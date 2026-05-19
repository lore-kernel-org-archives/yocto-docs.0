Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F61CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 02:33:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13080.1779157987703960408
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 19:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Ndl9P3//;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779157988; x=1810693988;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ikV9ic+tTvCxcK6R7Y12GNs2r0F+OHSGKc4V/6mjPw8=;
  b=Ndl9P3//DDTn90iIAYjt9q6nbsgaKyBsi3xGrlTWPgz6iA9twXxm5Uhk
   TN0Ssa6szo2ewSPhHRLLkTWsy8ULW5xhmIStygM9w3ZeoLzux5oQ+S86x
   zNHqpGjWnFlQN+fTKKn9L8LvW3KKsrmep2EbqfSvLjH/wvxHiyPPDuh/D
   THqml0zeXRjDCpnoJjK1hFG6PBp4V317+zWrWcrl32S065vsd4/GFD149
   oRBkXs/mckZozqRT9FjFtwIuRdgAbuhMbmqLc1ev/U168cUnvaexMYMvy
   Dayln00jW/uuPXo2mi5f4clcpfJje0Mib/m/TR0kh6jZ4XZKTBTGcBIT4
   A==;
X-CSE-ConnectionGUID: bAeCLT1TSkaYGGeWWXUFnQ==
X-CSE-MsgGUID: irpn9Ll8TR+zoW/xso56Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80078826"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80078826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:57 -0700
X-CSE-ConnectionGUID: FlhUmHM1SYC8UoLlBi4WzA==
X-CSE-MsgGUID: B4D2omIMRsyfnH4izG5cXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277731044"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 19:32:57 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/4] release-note-6.0: update several section
Date: Tue, 19 May 2026 09:17:13 +0800
Message-Id: <20260519011715.972400-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20260519011715.972400-1-chee.yang.lee@intel.com>
References: <20260519011715.972400-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 02:33:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9482

From: Lee Chee Yang <chee.yang.lee@intel.com>

update several section to align with
https://downloads.yoctoproject.org/releases/yocto/yocto-6.0/RELEASENOTES

remove fixed known issue, add another on going known issue.
update for sbom-cve-check, spdx and DISTRO_FEATURES changes.
reorder new variable section.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-6.0.rst    | 155 ++++++++++--------
 1 file changed, 86 insertions(+), 69 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 00f7cfef2..b14dde377 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -38,67 +38,6 @@ New Features / Enhancements in |yocto-ver|
 
 -  Minimum Python version required on the host: 3.9.
 
--  New variables:
-
-   -  The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify the
-      directory where OpenSSH host keys are stored. The default value is
-      ``/etc/ssh`` (:oecore_rev:`addd80ddfd892eb4513f323d369d210935416e05`)
-
-   -  The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be used to
-      specify the directory where OpenSSH host keys are stored when the device
-      uses a read-only filesystem. The default value is ``/var/run/ssh``
-      (:oecore_rev:`addd80ddfd892eb4513f323d369d210935416e05`)
-
-   -  The :term:`SPDX_INCLUDE_KERNEL_CONFIG` can be set to "1" to export the Linux
-      kernel configuration (``CONFIG_*`` parameters) into the SPDX document when
-      using the :ref:`ref-classes-create-spdx` class
-      (:oecore_rev:`228a968e7c47d811c06143279bdb0f9c5f374bef`)
-
-   -  The :term:`SPDX_INCLUDE_PACKAGECONFIG` variable can be set to "1" to
-      export a recipe's :term:`PACKAGECONFIG` features (enabled/disabled) into
-      the SPDX document when using the :ref:`ref-classes-create-spdx` class
-      (:oecore_rev:`228a968e7c47d811c06143279bdb0f9c5f374bef`)
-
-   -  The :term:`SPDX_PACKAGE_URL` allows specifying a space-separated list of
-      Package URLs (purls) for the software Package when using the
-      :ref:`ref-classes-create-spdx` class
-      (:oecore_rev:`874b2d301d3cac617b1028bc6ce91b1f916a6508`)
-
-   -  The :term:`SPDX_GIT_PURL_MAPPINGS` variable allows mapping domain names to
-      PURLs (Package URLs) in SPDX documents
-      (:oecore_rev:`9f1825e74d0f70917676201286b148aea84cc660`)
-
-   -  The :term:`SPDX_CONCLUDED_LICENSE` allows specifying the
-      ``hasConcludedLicense`` object of individual SBOM packages when using the
-      :ref:`ref-classes-create-spdx` class
-      (:oecore_rev:`bb21c6a429a2ecec82a8afe7d79502291ccaef01`)
-
-   -  The :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options
-      to the ``mkimage`` command when creating a FIT image with the
-      :ref:`ref-classes-kernel-fit-image` class
-      (:oecore_rev:`d925d67061ef5d7a8abe15c715614650094d50c6`)
-
-   -  The :term:`FIT_CONF_MAPPINGS` variable allows mapping extra configurations
-      to existing ones or rename an existing configuration in FIT images created
-      with the :ref:`ref-classes-kernel-fit-image` class (:oecore_rev:`e30f809a50c2151e525424879383c02325a7ec9a`)
-
-   -  The :term:`UBOOT_CONFIG_FRAGMENTS` and :term:`UBOOT_FRAGMENTS` allow
-      supplying additional configuration fragments to the existing U-Boot
-      configuration. See the definition of the variables for more information,
-      and the documentation of the :ref:`ref-classes-uboot-config` class
-      (:oecore_rev:`9e96d3dedee47657657686310508e0aaee7f4e02`)
-
-   -  The :term:`IMAGE_EXTRA_PARTITION_FILES` allows specifying extra files from
-      the deploy directory (:term:`DEPLOY_DIR_IMAGE`) to install in a WIC
-      partition created with the ``extra_partition`` plugin
-      (:oecore_rev:`e1526079d205dac6e3cff6d8e5cb37f68b631009`)
-
-   -  The :term:`FIT_LOADABLES`, :term:`FIT_LOADABLE_FILENAME`,
-      :term:`FIT_LOADABLE_TYPE`, :term:`FIT_LOADABLE_ARCH`,
-      :term:`FIT_LOADABLE_OS` and :term:`FIT_LOADABLE_LOADADDRESS` variables can
-      be used to specify arbitrary ``loadables`` in a FIT image
-      (:oecore_rev:`2535427d8de07f6e432d08cbdc046bdfd8788911`)
-
 -  Kernel-related changes:
 
    -  :ref:`ref-classes-kernel-fit-image`: Support arbitrary loadables
@@ -185,11 +124,78 @@ New Features / Enhancements in |yocto-ver|
    -  :ref:`ref-classes-sbom-cve-check-recipe`: Class for post-build CVE
       analysis of recipes (using the recipe SBOM, meaning building the
       software provided by the recipe is not needed), which uses the
-      `sbom-cve-check <github.com/bootlin/sbom-cve-check>`__ tool internally
-      (:oecore_rev:`e2518b1eaabef13c9f8d44b52b8ec9d4dd4ed916`)
+      `sbom-cve-check <github.com/bootlin/sbom-cve-check>`__ tool internally.
+      This also obsoletes the cve-check class.
+      (:oecore_rev:`e2518b1eaabef13c9f8d44b52b8ec9d4dd4ed916`,
+      :oecore_rev:`00de455f8d3aeca880129d23e8cfb7e246404699`)
+
+-  New variables:
+
+   -  The :term:`OPENSSH_HOST_KEY_DIR` variable can be used to specify the
+      directory where OpenSSH host keys are stored. The default value is
+      ``/etc/ssh`` (:oecore_rev:`addd80ddfd892eb4513f323d369d210935416e05`)
+
+   -  The :term:`OPENSSH_HOST_KEY_DIR_READONLY_CONFIG` variable can be used to
+      specify the directory where OpenSSH host keys are stored when the device
+      uses a read-only filesystem. The default value is ``/var/run/ssh``
+      (:oecore_rev:`addd80ddfd892eb4513f323d369d210935416e05`)
+
+   -  The :term:`SPDX_INCLUDE_KERNEL_CONFIG` can be set to "1" to export the Linux
+      kernel configuration (``CONFIG_*`` parameters) into the SPDX document when
+      using the :ref:`ref-classes-create-spdx` class
+      (:oecore_rev:`228a968e7c47d811c06143279bdb0f9c5f374bef`)
+
+   -  The :term:`SPDX_INCLUDE_PACKAGECONFIG` variable can be set to "1" to
+      export a recipe's :term:`PACKAGECONFIG` features (enabled/disabled) into
+      the SPDX document when using the :ref:`ref-classes-create-spdx` class
+      (:oecore_rev:`228a968e7c47d811c06143279bdb0f9c5f374bef`)
+
+   -  The :term:`SPDX_PACKAGE_URL` allows specifying a space-separated list of
+      Package URLs (purls) for the software Package when using the
+      :ref:`ref-classes-create-spdx` class
+      (:oecore_rev:`874b2d301d3cac617b1028bc6ce91b1f916a6508`)
+
+   -  The :term:`SPDX_GIT_PURL_MAPPINGS` variable allows mapping domain names to
+      PURLs (Package URLs) in SPDX documents
+      (:oecore_rev:`9f1825e74d0f70917676201286b148aea84cc660`)
+
+   -  The :term:`SPDX_CONCLUDED_LICENSE` allows specifying the
+      ``hasConcludedLicense`` object of individual SBOM packages when using the
+      :ref:`ref-classes-create-spdx` class
+      (:oecore_rev:`bb21c6a429a2ecec82a8afe7d79502291ccaef01`)
+
+   -  The :term:`FIT_MKIMAGE_EXTRA_OPTS` variable allows passing extra options
+      to the ``mkimage`` command when creating a FIT image with the
+      :ref:`ref-classes-kernel-fit-image` class
+      (:oecore_rev:`d925d67061ef5d7a8abe15c715614650094d50c6`)
+
+   -  The :term:`FIT_CONF_MAPPINGS` variable allows mapping extra configurations
+      to existing ones or rename an existing configuration in FIT images created
+      with the :ref:`ref-classes-kernel-fit-image` class (:oecore_rev:`e30f809a50c2151e525424879383c02325a7ec9a`)
+
+   -  The :term:`UBOOT_CONFIG_FRAGMENTS` and :term:`UBOOT_FRAGMENTS` allow
+      supplying additional configuration fragments to the existing U-Boot
+      configuration. See the definition of the variables for more information,
+      and the documentation of the :ref:`ref-classes-uboot-config` class
+      (:oecore_rev:`9e96d3dedee47657657686310508e0aaee7f4e02`)
+
+   -  The :term:`IMAGE_EXTRA_PARTITION_FILES` allows specifying extra files from
+      the deploy directory (:term:`DEPLOY_DIR_IMAGE`) to install in a WIC
+      partition created with the ``extra_partition`` plugin
+      (:oecore_rev:`e1526079d205dac6e3cff6d8e5cb37f68b631009`)
+
+   -  The :term:`FIT_LOADABLES`, :term:`FIT_LOADABLE_FILENAME`,
+      :term:`FIT_LOADABLE_TYPE`, :term:`FIT_LOADABLE_ARCH`,
+      :term:`FIT_LOADABLE_OS` and :term:`FIT_LOADABLE_LOADADDRESS` variables can
+      be used to specify arbitrary ``loadables`` in a FIT image
+      (:oecore_rev:`2535427d8de07f6e432d08cbdc046bdfd8788911`)
 
 -  Global configuration changes:
 
+   -  Changes in DISTRO_FEATURES default values and how DISTRO_FEATURES &
+      MACHINE_FEATURES are provided, see :doc:`/migration-guides/migration-6.0`
+      for more information.
+
    -  ``base-passwd``: Add a ``clock`` group as `systemd` version v258 introduces
       this group to `enable applications like linuxptp to open clocks without
       root privileges <https://github.com/systemd/systemd/commit/af96ccfc24bc4803078a46b4ef2cdeb5decdfbcd>`__
@@ -510,9 +516,8 @@ New Features / Enhancements in |yocto-ver|
    -  Add suport for package URLs (PURLs) through :term:`SPDX_PACKAGE_URL`
       (:oecore_rev:`874b2d301d3cac617b1028bc6ce91b1f916a6508`)
 
-   -  ``create-spdx-2.2``: Add CVEs in :term:`CVE_CHECK_IGNORE`
-      to the list of fixed CVEs in the output SBOM
-      (:oecore_rev:`f8525224cb825b1aad2be240731eabafdde7612d`)
+   -  Support only SPDX 3 and removed SPDX 2.2 support.
+      (:oecore_rev:`12abd0574c267bade0962ecb39d9e8da8c56842b`)
 
    -  The :ref:`ref-classes-create-spdx` class used to include `VEX
       <https://cyclonedx.org/capabilities/vex/>`__ statements in the SPDX documents
@@ -757,9 +762,21 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ---------------------------
 
--  A known bug is affecting :term:`build hosts <Build Host>` that have Intel
-   Ultra 7 CPUs and breaks :term:`OpenEmbedded-Core (OE-Core)` tests that
-   involve KVM. See bug :yocto_bug:`16074` for more information.
+Referencing an unset variable in DISTRO_FEATURES causes DISTRO_FEATURES_NATIVE
+and DISTRO_FEATURES_NATIVESDK to be set incorrectly. The leads to confusing
+errors, such as
+
+  - Nothing PROVIDES 'libseccomp-native'
+
+  - Required build target 'glibc' has no buildable providers.
+
+To resolve these errors, ensure that all variables used in DISTRO_FEATURES are
+set. Variables may be set to an empty string if not needed.
+
+A fix for this issue is in progress and should be included in Yocto
+Project 6.0.1. See :yocto_bugs:`Yocto bug #16275 </show_bug.cgi?id=16275>`
+for further details.
+
 
 Recipe License changes in |yocto-ver|
 -------------------------------------
-- 
2.37.3


