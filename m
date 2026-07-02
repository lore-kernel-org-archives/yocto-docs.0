Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F8EC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 10:15:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65662.1782987331038867127
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 03:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Tz5N/e1H;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782987331; x=1814523331;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DjtIDCgZYd0QOukt3yt7puF/KsmjkQBc8SVIakqW3UI=;
  b=Tz5N/e1HHXj/Q14E8cfT3Tha/yrneXKUCHjjubyVOy1jOpDCn2jPOv1D
   fcWSvjGbV+V5qOYbQZ2CtjiF2CG7sjNY3EF5c/IMEzsNmQPm44i0VBfws
   0zzU/Ak61MXMCJd/DXdUxiflABvP5Ah7TkXABa1sV7dCN2X/pDEZXIsvw
   ciq1ddXlmIERrkhmjTNJE9/y3EEuqvZXii4mQaPKec8GEu8Nw3VFlqfbB
   CfDzlOUept7cU0dqTQJi2dV7BGjmoyBt4+7hoeb1RrTYjom8+gnQ2NV0l
   NFtP493ulfJ5CXBwGJKe4/XNd9Xo9SgXoA8niNhPmmW9Gd/hqJk1kNQgG
   A==;
X-CSE-ConnectionGUID: lbaf2kTnRKqQO+vcxBFRpw==
X-CSE-MsgGUID: Qh+9zkkQRK+wluLtKR0phQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82726729"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82726729"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:15:30 -0700
X-CSE-ConnectionGUID: DDSlqdskTu266Cn+3fbFgw==
X-CSE-MsgGUID: JSWUxDTHQU+py8QzHdwQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256405646"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2026 03:15:29 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add add release notes for 6.0.1
Date: Thu,  2 Jul 2026 18:14:34 +0800
Message-ID: <20260702101434.3618-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 10:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9998

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-6.0.rst          |   1 +
 .../migration-guides/release-notes-6.0.1.rst  | 249 ++++++++++++++++++
 2 files changed, 250 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-6.0.1.rst

diff --git a/documentation/migration-guides/release-6.0.rst b/documentation/migration-guides/release-6.0.rst
index 6d82261298..6cfe3297f4 100644
--- a/documentation/migration-guides/release-6.0.rst
+++ b/documentation/migration-guides/release-6.0.rst
@@ -8,3 +8,4 @@ Release 6.0 (wrynose)
 
    release-notes-6.0
    migration-6.0
+   release-notes-6.0.1
diff --git a/documentation/migration-guides/release-notes-6.0.1.rst b/documentation/migration-guides/release-notes-6.0.1.rst
new file mode 100644
index 0000000000..2ae7cca201
--- /dev/null
+++ b/documentation/migration-guides/release-notes-6.0.1.rst
@@ -0,0 +1,249 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-6.0.1 (Wrynose)
+---------------------------------------
+
+Security Fixes in Yocto-6.0.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  avahi: Fix :cve_nist:`2026-34933`
+-  base-files: Ignore :cve_nist:`2018-6557`
+-  bind: Ignore :cve_nist:`2017-3139`
+-  busybox: fix :cve_nist:`2024-58251` and :cve_nist:`2026-29004`
+-  cargo: Ignore :cve_nist:`2023-40030`
+-  cve-extra-exclusions: Ignore :cve_nist:`2019-2708`
+-  ffmpeg: Ignore :cve_nist:`2022-2566`, :cve_nist:`2025-9951`, :cve_nist:`2025-59729` and
+   :cve_nist:`2025-59730`
+-  git: Ignore :cve_nist:`2024-32002`, :cve_nist:`2024-50349`, :cve_nist:`2024-52006`,
+   :cve_nist:`2025-48385` and :cve_nist:`2025-48386`
+-  glibc: Fix :cve_nist:`2026-4046`
+-  gnutls: Ignore :cve_nist:`2026-1584`
+-  harfbuzz: Ignore :cve_nist:`2024-56732`
+-  inetutils: Fix :cve_nist:`2026-32772`
+-  libarchive: Ignore :cve_nist:`2026-4426` and :cve_nist:`2026-5745`
+-  libsoup: Fix :cve_nist:`2026-2708` and :cve_nist:`2026-5119`
+-  libsoup: Ignore :cve_nist:`2026-2369` and :cve_nist:`2026-2436`
+-  libssh2: Fix :cve_nist:`2026-7598`
+-  libva: Ignore :cve_nist:`2023-39929`
+-  ovmf: Ignore :cve_nist:`2024-38796`, :cve_nist:`2024-38797`, :cve_nist:`2024-38798`,
+   :cve_nist:`2024-38805`, :cve_nist:`2025-2295`, :cve_nist:`2025-2296` and :cve_nist:`2025-3770`
+-  p11-kit: Ignore :cve_nist:`2026-2100`
+-  python3-requests: Ignore :cve_nist:`2024-35195` and :cve_nist:`2024-47081`
+-  python3-setuptools: Ignore :cve_nist:`2024-6345`
+-  rsync: Ignore :cve_nist:`2024-12084`
+-  ruby: Ignore :cve_nist:`2025-0306`
+-  sed: Fix :cve_nist:`2026-5958`
+-  sudo: Fix :cve_nist:`2026-35535`
+-  tiff: Fix :cve_nist:`2026-4775`
+
+
+Fixes in Yocto-6.0.1
+~~~~~~~~~~~~~~~~~~~~
+
+bitbake
+^^^^^^^
+-  README: Add "2.18" subject-prefix to git-send-email suggestion
+-  b4-config: add send-prefixes for 2.18/wrynose
+-  fetch/git: Fix leaking of temporary directory
+-  fetch/git: Improve temporary directory handling
+-  fetch/wget: in upstream version checks, match versioned directories exactly
+-  fetch2/crate: use CDN endpoint for version checking if possible
+-  fetch2/crate: use CDN for fetching crates
+
+meta-yocto
+^^^^^^^^^^
+-  poky.conf: Bump version for 6.0.1 release
+
+openembedded-core
+^^^^^^^^^^^^^^^^^
+-  README: Add wrynose subject-prefix to git-send-email suggestion
+-  apr-util: Add :term:`CVE_PRODUCT` to support product name
+-  apr: Add :term:`CVE_PRODUCT` to support product name
+-  b4-config: add send-prefixes for wrynose
+-  bluez5: add patches to fix 8.56 cli & gatt issues
+-  build-appliance-image: Update to wrynose head revisions
+-  build-appliance-image: fix branches for wrynose revisions
+-  cargo: set :term:`CVE_PRODUCT`
+-  ccache: upgrade to 4.13.3
+-  classes/base: add explicit bzip2-native dependency for unpacking .bz2
+-  coreutils: set :term:`CVE_PRODUCT`
+-  default-distrovars.inc: add missing spaces in append overrides
+-  devtool: Disable gpg signing when setting up source tree repos
+-  dhcpcd: upgrade to 10.3.1
+-  efivar: Backport patch to fix -march issue for ppc64le
+-  features-check.bbclass: add reference to required :term:`TUNE_FEATURES`
+-  glibc: Fix recipe bug that disabled stack protector
+-  glibc: stable 2.43 branch updates
+-  groff: upgrade to 1.24.1
+-  gsettings-desktop-schemas: upgrade to 50.1
+-  gtk4: upgrade to 4.22.2
+-  gtk+3: upgrade to 3.24.52
+-  hwdata: upgrade to 0.406
+-  mirrors: remove inactive sources.openembedded.org URLs
+-  oe-pkgdata-util: fix empty runtime-rprovides directory handling
+-  oe-pkgdata-util: fix runtime-rprovides handling in lookup_pkg error path
+-  package.py: fix kernel module file pre-filter and document strip asymmetry
+-  perf: add :term:`PACKAGECONFIG` for llvm
+-  pseudo: Upgrade to 1.9.7
+-  python3-requests: Increase chardet upper limit
+-  python3-sbom-cve-check: Update to version 1.3.1
+-  qemu: fix iotlb_to_section() for different AddressSpace
+-  rust: fix codegen test failure on big-endian targets
+-  sbom-cve-check-update-cvelist-native: Update source revision
+-  sbom-cve-check-update-nvd-native: Update source revision
+-  sbom-cve-check: set :term:`PV` from upstream tags and ensure version checks are correct
+-  scripts/makefile-getvar: quote MAKEFILE variable
+-  sed: upgrade to 4.10
+-  shadow-native: Change upstream status of disable_syslog.patch
+-  shadow: set :term:`CVE_PRODUCT`
+-  sudo: set :term:`CVE_PRODUCT`
+-  tzdata/tzcode-native: upgrade to2026b
+-  utils: Handle unexpanded variables in :term:`DISTRO_FEATURES`
+-  wireless-regdb: upgrade to 2026.03.18
+
+yocto-docs
+^^^^^^^^^^
+-  "Transitioning ..." doc: Various pedantic cleanups
+-  Quick Build guide: Various pedantic cleanups
+-  What I Wish I'd KNown: Various pedantic cleanups
+-  YP Quick Build: delete extraneous periods in list
+-  YP Quick Build: use "set up" as a verb
+-  conf.py: add a :yocto_bug: role
+-  contributor-guide: fix type "maintainance" to "maintenance"
+-  dev-manual: "--runonly" should be "--runall"
+-  docs-wide: drop documentation for cve-check and variables
+-  index.rst: update "Software Overview" to "Technical Overview"
+-  migration-guide: add release notes for 4.0.35 5.3.4
+-  migration-guide: migration-6.0: fix typos in cve-check removal
+-  migration-guides/migration-6.0.rst: add migration notes on cve-check removal
+-  migration-guides/migration-6.0.rst: document the :term:`CVE_PRODUCT` behavior change
+-  migration-guides/migration-6.0.rst: mention python3-roman-numerals-py rename
+-  migration-guides/release-notes-6.0.rst: add contributors, CVE fixes, downloads, known issue,
+   license, recipe version changes
+-  migration-guides: fix https:// prefix missing in anonymous reference
+-  migration-guides: migration-6.0: fix grammar and missing word
+-  migration-guides: migration-6.0: reword meta-poky templates removal
+-  migration-guides: release-notes-6.0: fix typo in documentation changes
+-  overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task description
+-  overview-manual: fix "checkout" versus "check out"
+-  ref-manual/system-requirements.rst: add CentOS 10 as a supported distro
+-  ref-manual/variables.rst: document the :term:`SBOM_CVE_CHECK_SHOW_WARNINGS` variable
+-  ref-manual/variables: IMAGE_TYPES: add new wicenv type
+-  ref-manual/variables: document the 'dynamic layer' concept
+-  ref-manual: classes: add missing "task" after create_recipe_sbom
+-  ref-manual: classes: fix https:// prefix missing in anonymous reference
+-  ref-manual: fix "include to" grammar for :term:`UKI_DEVICETREE`
+-  ref-manual: fragments: fix style inconsistencies
+-  ref-manual: replace "naive" with "simple"
+-  ref-manual: variables: add hyphen to "space separated" and "auto generated"
+-  security-manual/vulnerabilities.rst: refresh the document after cve-check removal
+-  security-manual/vulnerabilities.rst: require Upstream-Status, not recommend
+-  tools/build-docs-container: add CentOS 10 support
+-  tools/build-docs-container: add missing leap 16.0 in help message
+-  yp-intro.rst: add link to "buildbot"
+-  yp-intro.rst: delete really old references
+
+
+Known Issues in Yocto-6.0.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+Contributors to Yocto-6.0.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Alexander Kanavin
+-  Andrew Geissler
+-  Ankur Tyagi
+-  Antonin Godard
+-  Benjamin Robin (Schneider Electric)
+-  Chen Qi
+-  Daniel McGregor
+-  Dawid Bijak
+-  Dmitry Sakhonchik
+-  Himanshu Jadon
+-  Ivan Nestlerode
+-  Jinwang Li
+-  Johan Anderholm
+-  João Marcos Costa
+-  Lee Chee Yang
+-  Leonardo Costa
+-  Li Wang
+-  Minwoo Choi
+-  Moritz Haase
+-  Paul Barker
+-  Peter Marko
+-  Peter Tatrai
+-  Quan Sun
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert P. J. Day
+-  Ross Burton
+-  Sam Kent
+-  Thomas Perrot
+-  Vijay Anusuri
+-  Wang Mingyu
+-  Yoann Congal
+
+
+Repositories / Downloads for Yocto-6.0.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`wrynose </yocto-docs/log/?h=wrynose>`
+-  Tag:  :yocto_git:`yocto-6.0.1 </yocto-docs/log/?h=yocto-6.0.1>`
+-  Git Revision: :yocto_git:`7ac955621b36a221126cd40f12c41fa98c213a24 </yocto-docs/commit/?id=7ac955621b36a221126cd40f12c41fa98c213a24>`
+-  Release Artefact: yocto-docs-7ac955621b36a221126cd40f12c41fa98c213a24
+-  sha: 32e25828d25662db5e92829ae6a471291e27d950b5c273458fae211a776e4131
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.1/yocto-docs-7ac955621b36a221126cd40f12c41fa98c213a24.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.1/yocto-docs-7ac955621b36a221126cd40f12c41fa98c213a24.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`wrynose </openembedded-core/log/?h=wrynose>`
+-  Tag:  :oe_git:`yocto-6.0.1 </openembedded-core/log/?h=yocto-6.0.1>`
+-  Git Revision: :oe_git:`06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80 </openembedded-core/commit/?id=06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80>`
+-  Release Artefact: oecore-06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80
+-  sha: 26de701c73d43ab8904bc57b162385901f9a1114807b3e28b665437d4ba23624
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.1/oecore-06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.1/oecore-06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`wrynose </meta-yocto/log/?h=wrynose>`
+-  Tag:  :yocto_git:`yocto-6.0.1 </meta-yocto/log/?h=yocto-6.0.1>`
+-  Git Revision: :yocto_git:`8251bdad5fda780a000fb41e6eda82eadf0fa39e </meta-yocto/commit/?id=8251bdad5fda780a000fb41e6eda82eadf0fa39e>`
+-  Release Artefact: meta-yocto-8251bdad5fda780a000fb41e6eda82eadf0fa39e
+-  sha: ac9125ddd150febba0da9ae4fb7e222dde1d6e8f2ad3aaae1c0c2a4c1f738f36
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.1/meta-yocto-8251bdad5fda780a000fb41e6eda82eadf0fa39e.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.1/meta-yocto-8251bdad5fda780a000fb41e6eda82eadf0fa39e.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.18 </bitbake/log/?h=2.18>`
+-  Tag:  :oe_git:`yocto-6.0.1 </bitbake/log/?h=yocto-6.0.1>`
+-  Git Revision: :oe_git:`22021758e66737bcf68dfd2b74adc6a0cb1d42d9 </bitbake/commit/?id=22021758e66737bcf68dfd2b74adc6a0cb1d42d9>`
+-  Release Artefact: bitbake-22021758e66737bcf68dfd2b74adc6a0cb1d42d9
+-  sha: ce9c213f9b8c5fb677b0a64ac883386a4d578fdb66881dcc9f1cd8bc4e79e7f6
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.1/bitbake-22021758e66737bcf68dfd2b74adc6a0cb1d42d9.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.1/bitbake-22021758e66737bcf68dfd2b74adc6a0cb1d42d9.tar.bz2
+
-- 
2.43.0


