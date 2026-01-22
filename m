Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126C3C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 03:07:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29172.1769051270775337782
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 19:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=a8BGqUH8;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769051269; x=1800587269;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EVGcoJPj9QYtLYXg2ZkiPSDJt02rTOj6UzJ9ouT2Wxw=;
  b=a8BGqUH8Hco00SL3vNVMM/7ZkT6mCkJcq4Ww/RZzb9l11JX6rfIBsBh0
   JkwEVtxrb4KeeFrQZVhhllea59d2COhXLiIZS/VJJ9vKHvYC1Xzfu4icV
   mXMcMC3xvi2CsTDO9QOz1bS7fJt9CboyQCXfTopNzZbTloX1FMV1w52Lx
   Opiq52A59sVqdN/CrltOtel6uvchRhvVhZPMQkkvaenI86B+Mf5ulg1ZJ
   r921EUAKCJplo8CEHsTKyl1WoVw9wbIJm5fsD8eAS2Re+ESbZHKPkzgh+
   OZyIjnjgzRpxV+gHeQXVHw5BTz+uN2fOEGbmWOUrk1Ca2NazEaCjenoK7
   A==;
X-CSE-ConnectionGUID: rXK83hkYS1CexCuwdBKXOA==
X-CSE-MsgGUID: FGwb1Bp+Rxu/fP8BlNj3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81397663"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81397663"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:07:48 -0800
X-CSE-ConnectionGUID: GUBMTvYYSeOGBTTCeJN2CQ==
X-CSE-MsgGUID: 0/9AA5hIQm63S98fpEw6aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="211629772"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2026 19:07:50 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 5.0.15
Date: Thu, 22 Jan 2026 11:07:17 +0800
Message-ID: <20260122030717.1284107-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jan 2026 03:07:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8626

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-5.0.rst          |   1 +
 .../migration-guides/release-notes-5.0.15.rst | 219 ++++++++++++++++++
 2 files changed, 220 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.15.rst

diff --git a/documentation/migration-guides/release-5.0.rst b/documentation/migration-guides/release-5.0.rst
index 8b5ae88f3..63b23edb1 100644
--- a/documentation/migration-guides/release-5.0.rst
+++ b/documentation/migration-guides/release-5.0.rst
@@ -21,3 +21,4 @@ Release 5.0 (scarthgap)
    release-notes-5.0.12
    release-notes-5.0.13
    release-notes-5.0.14
+   release-notes-5.0.15
diff --git a/documentation/migration-guides/release-notes-5.0.15.rst b/documentation/migration-guides/release-notes-5.0.15.rst
new file mode 100644
index 000000000..f49879673
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.15.rst
@@ -0,0 +1,219 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-5.0.15 (Scarthgap)
+------------------------------------------
+
+Users of Alma 9, Rocky 9 and Centos Stream 9 rolling releases have seen obtuse failures in the execution of tar in various tasks after recent host distro updates. These newer versions of tar contain a CVE fix which uses a new glibc call/syscall (openat2). The fix is to update to a newer pseudo version which handles this syscall. This is not included in this stable release but we aim to include it in the next one.
+
+Security Fixes in Yocto-5.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-11494`, :cve_nist:`2025-11839` and :cve_nist:`2025-11840`
+-  cmake-native: Fix :cve_nist:`2025-9301`
+-  cups: Fix :cve_nist:`2025-58436` and :cve_nist:`2025-61915`
+-  gnutls: Fix CVE-2025-9820
+-  go: Fix :cve_nist:`2025-61727` and :cve_nist:`2025-61729`
+-  go: Update :cve_nist:`2025-58187` patches
+-  grub: Fix :cve_nist:`2025-54770`, :cve_nist:`2025-61661`, :cve_nist:`2025-61662`,
+   :cve_nist:`2025-61663` and :cve_nist:`2025-61664`
+-  libarchive: Fix :cve_nist:`2025-60753`
+-  libarchive: Fix 2 security issue (https://github.com/libarchive/libarchive/pull/2753 and
+   https://github.com/libarchive/libarchive/pull/2768)
+-  libmicrohttpd: Ignore :cve_nist:`2025-59777` and :cve_nist:`2025-62689`
+-  libpng: Fix :cve_nist:`2025-64505`, :cve_nist:`2025-64506`, :cve_nist:`2025-64720`,
+   :cve_nist:`2025-65018` and :cve_nist:`2025-66293`
+-  libsoup: Fix :cve_nist:`2025-12105`
+-  libssh2: Fix :cve_nist:`2023-48795`
+-  libxml2: Fix :cve_nist:`2025-7425`
+-  libxslt: Fix :cve_nist:`2025-11731`
+-  musl: Fix :cve_nist:`2025-26519`
+-  python3-urllib3: Fix :cve_nist:`2025-66418` and :cve_nist:`2025-66471`
+-  python3: Fix :cve_nist:`2025-6075`
+-  qemu: Fix :cve_nist:`2025-12464`
+-  rsync: Fix :cve_nist:`2025-10158`
+-  ruby: Fix :cve_nist:`2025-24294`, :cve_nist:`2025-25186` and :cve_nist:`2025-61594`
+-  sqlite3: Fix :cve_nist:`2025-7709`
+-  xserver-xorg: Fix :cve_nist:`2025-62229`, :cve_nist:`2025-62230` and :cve_nist:`2025-62231`
+-  xwayland: Fix :cve_nist:`2025-62229`, :cve_nist:`2025-62230` and :cve_nist:`2025-62231`
+
+
+Fixes and Feature Changes in Yocto-5.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  build-appliance-image: Update to scarthgap head revision
+-  classes/create-spdx-2.2: Define SPDX_VERSION to 2.2
+-  cml1.bbclass: use consistent make flags for menuconfig
+-  cross.bbclass: Propagate dependencies to outhash
+-  curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected
+-  curl: Use host CA bundle by default for native(sdk) builds
+-  cve-check: extract extending :term:`CVE_STATUS` to library function
+-  dev-manual/layers.rst: document "bitbake-layers show-machines"
+-  dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
+-  dev-manual/new-recipe.rst: typo, "whith" -> "which"
+-  dev-manual/new-recipe.rst: update "recipetool -h" output
+-  dev-manual/sbom.rst: reflect that create-spdx is enabled by default
+-  dev-manual: debugging: use bitbake-getvar in Viewing Variable Values section
+-  documentation: link to the Releases page on yoctoproject.org instead of wiki
+-  glslang: fix compiling with gcc15
+-  go: add sdk test
+-  go: extend runtime test
+-  go: remove duplicate arch map in sdk test
+-  goarch.bbclass: do not leak :term:`TUNE_FEATURES` into crosssdk task signatures
+-  kernel-dev: add disable config example
+-  kernel-dev: common: migrate bitbake -e to bitbake-getvar
+-  kernel.bbclass: Add task to export kernel configuration to :term:`SPDX`
+-  libssh2: fix regression in KEX method validation (GH-1553)
+-  libssh2: upgrade to 1.11.1
+-  migration-guides: add release notes for 4.0.31 and 5.0.13
+-  oe/sdk: fix empty SDK manifests
+-  oeqa/sdk/buildepoxy: skip test in eSDK
+-  oeqa/selftest: oe-selftest: Add :term:`SPDX` tests for kernel config and :term:`PACKAGECONFIG`
+-  oeqa: drop unnecessary dependency from go runtime tests
+-  oeqa: fix package detection in go sdk tests
+-  overview-manual: migrate to SVG + fix typo
+-  poky.conf: bump version for 5.0.15
+-  ref-manual: variables: migrate the :term:`OVERRIDES` note to bitbake-getvar
+-  ruby: Upgrade to 3.3.10
+-  rust-target-config: fix nativesdk-libstd-rs build with baremetal
+-  scripts/install-buildtools: Update to 5.0.14
+-  spdx30: Provide software_packageUrl field in :term:`SPDX` 3.0 SBOM
+-  spdx30: fix cve status for patch files in VEX
+-  spdx30: provide all CVE_STATUS, not only Patched status
+-  spdx30_tasks: Add support for exporting :term:`PACKAGECONFIG` to :term:`SPDX`
+-  spdx: Revert "spdx: Update for bitbake changes"
+-  spdx: extend :term:`CVE_STATUS` variables
+-  testsdk: allow user to specify which tests to run
+-  vex.bbclass: add a new class
+-  vex: fix rootfs manifest
+-  xserver-xorg: remove redundant patch
+
+
+Known Issues in Yocto-5.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+Contributors to Yocto-5.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Adarsh Jagadish Kamini
+-  Aleksandar Nikolic
+-  Alexander Kanavin
+-  Benjamin Robin (Schneider Electric)
+-  Changqing Li
+-  Daniel Turull
+-  Deepak Rathore
+-  Deepesh Varatharajan
+-  Enrico Jörns
+-  Gyorgy Sarvari
+-  Hitendra Prajapati
+-  Hongxu Jia
+-  Hugo SIMELIERE
+-  Jiaying Song
+-  Kai Kang
+-  Kamel Bouhara (Schneider Electric)
+-  Lee Chee Yang
+-  Martin Jansa
+-  Mingli Yu
+-  Moritz Haase
+-  Osama Abdelkader
+-  Ovidiu Panait
+-  Peter Marko
+-  Praveen Kumar
+-  Quentin Schulz
+-  Robert P. J. Day
+-  Ross Burton
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Walter Werner SCHNEIDER
+-  Yash Shinde
+-  Yogita Urade
+
+Repositories / Downloads for Yocto-5.0.15
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.15 </yocto-docs/log/?h=yocto-5.0.15>`
+-  Git Revision: :yocto_git:`b0f5cc276639916df197435780b3e94accd4af41 </yocto-docs/commit/?id=b0f5cc276639916df197435780b3e94accd4af41>`
+-  Release Artefact: yocto-docs-b0f5cc276639916df197435780b3e94accd4af41
+-  sha: 28ebedfa6471e4ed7583aca0925cd31f4429af3d27ffc0a7e250f7b75404edd7
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/yocto-docs-b0f5cc276639916df197435780b3e94accd4af41.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.15/yocto-docs-b0f5cc276639916df197435780b3e94accd4af41.tar.bz2
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.15 </poky/log/?h=yocto-5.0.15>`
+-  Git Revision: :yocto_git:`72983ac391008ebceb45edc7a8f0f6d5f4fe715c </poky/commit/?id=72983ac391008ebceb45edc7a8f0f6d5f4fe715c>`
+-  Release Artefact: poky-72983ac391008ebceb45edc7a8f0f6d5f4fe715c
+-  sha: d5336d1ef1dd48b88cb92748c669360901004d458b7786ddc1918da12fef4edd
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/poky-72983ac391008ebceb45edc7a8f0f6d5f4fe715c.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.15/poky-72983ac391008ebceb45edc7a8f0f6d5f4fe715c.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0.15 </openembedded-core/log/?h=yocto-5.0.15>`
+-  Git Revision: :oe_git:`6988157ad983978ffd6b12bcefedd4deaffdbbd1 </openembedded-core/commit/?id=6988157ad983978ffd6b12bcefedd4deaffdbbd1>`
+-  Release Artefact: oecore-6988157ad983978ffd6b12bcefedd4deaffdbbd1
+-  sha: 98a691ce87f9aba57007e91b56bbe0af6d6c8f62aacb68820026478ff8e1f819
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/oecore-6988157ad983978ffd6b12bcefedd4deaffdbbd1.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.15/oecore-6988157ad983978ffd6b12bcefedd4deaffdbbd1.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`scarthgap </meta-yocto/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.15 </meta-yocto/log/?h=yocto-5.0.15>`
+-  Git Revision: :yocto_git:`9bb6e6e8b016a0c9dfe290369a6ed91ef4020535 </meta-yocto/commit/?id=9bb6e6e8b016a0c9dfe290369a6ed91ef4020535>`
+-  Release Artefact: meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535
+-  sha: 01778c43673ef11ec5d0fb76bd7c600031f5fc9bcfd9bfa586d5fb6b6babff95
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.15/meta-yocto-9bb6e6e8b016a0c9dfe290369a6ed91ef4020535.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.15 </meta-mingw/log/?h=yocto-5.0.15>`
+-  Git Revision: :yocto_git:`bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f </meta-mingw/commit/?id=bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f>`
+-  Release Artefact: meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
+-  sha: ab073def6487f237ac125d239b3739bf02415270959546b6b287778664f0ae65
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.15/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0.15 </bitbake/log/?h=yocto-5.0.15>`
+-  Git Revision: :oe_git:`8dcf084522b9c66a6639b5f117f554fde9b6b45a </bitbake/commit/?id=8dcf084522b9c66a6639b5f117f554fde9b6b45a>`
+-  Release Artefact: bitbake-8dcf084522b9c66a6639b5f117f554fde9b6b45a
+-  sha: 766eda21f2a914276d2723b1d8248be11507f954aef8fc5bb1767f3cb65688dd
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/bitbake-8dcf084522b9c66a6639b5f117f554fde9b6b45a.tar.bz2
+
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.15/bitbake-8dcf084522b9c66a6639b5f117f554fde9b6b45a.tar.bz2
-- 
2.43.0


