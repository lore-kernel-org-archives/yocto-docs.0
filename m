Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A4FC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 02:35:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.3408.1753324501392557430
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 19:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=g4mijIk7;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753324502; x=1784860502;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K4IAveBpSVISmZxqm45ERJAExTrPC7UksJP3SEITFAA=;
  b=g4mijIk7z+4rwpSIFAw+qFUe8OC/9Le7CUkeiMFi/gfhMX9kvMGHXCoD
   ELJI5G0fh3Jql8sHo9qIQnB/5/vX3ThJ+5aLiqrbEXuv94thxaXl0HCHY
   XRFviW0gCLYtP9ka/QgyaRDm4J9EUrClX6uuWVMM156mulaifpgl06p0E
   ApOOynB80aMGNbi2vTqkHxgwbM1s7vuKTrzrPnIkM+aKBIZ60MaFa8Rqt
   ZiWexNeqatkx4w9QToVEjuXWNVwSjUpqAeLbpSaCHCZscHCSmPTY+mkEi
   3jv6OHTE5QwVKcSJ1y+FNbwQgQ9fASDKuMRp5q/XAcoW0aFszq8BO8Us+
   w==;
X-CSE-ConnectionGUID: zt0DOD2mQeywS4X4qSLcBw==
X-CSE-MsgGUID: gnaea470Sbe9iiZOzF2cbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73077796"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="73077796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 19:35:02 -0700
X-CSE-ConnectionGUID: JAYCWc9sTH+7y2G5vDD5fA==
X-CSE-MsgGUID: qbdDawMZQZ+vLlKQtLiKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159525647"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2025 19:35:01 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-guides: add release notes for 5.0.11
Date: Thu, 24 Jul 2025 10:34:58 +0800
Message-ID: <20250724023458.2932744-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724023458.2932744-1-chee.yang.lee@intel.com>
References: <20250724023458.2932744-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 02:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7371

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-5.0.rst          |   1 +
 .../migration-guides/release-notes-5.0.11.rst | 219 ++++++++++++++++++
 2 files changed, 220 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.11.rst

diff --git a/documentation/migration-guides/release-5.0.rst b/documentation/migration-guides/release-5.0.rst
index b3e7a6791..6942b37c8 100644
--- a/documentation/migration-guides/release-5.0.rst
+++ b/documentation/migration-guides/release-5.0.rst
@@ -17,3 +17,4 @@ Release 5.0 (scarthgap)
    release-notes-5.0.8
    release-notes-5.0.9
    release-notes-5.0.10
+   release-notes-5.0.11
diff --git a/documentation/migration-guides/release-notes-5.0.11.rst b/documentation/migration-guides/release-notes-5.0.11.rst
new file mode 100644
index 000000000..5c784344e
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.11.rst
@@ -0,0 +1,219 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-5.0.11 (Scarthgap)
+------------------------------------------
+
+Security Fixes in Yocto-5.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-5244` and :cve_nist:`2025-5245`
+-  busybox: Fix :cve_nist:`2022-48174`
+-  coreutils: Fix :cve_nist:`2025-5278`
+-  curl: Ignore :cve_nist:`2025-5025` if :term:`PACKAGECONFIG` set with openssl
+-  ffmpeg: Fix :cve_nist:`2025-1373`
+-  glibc: fix :cve_nist:`2025-4802` and :cve_nist:`2025-5702`
+-  gnupg: Fix :cve_nist:`2025-30258`
+-  go: Fix :cve_nist:`2025-4673`
+-  go: Ignore :cve_nist:`2024-3566`
+-  icu: Fix :cve_nist:`2025-5222`
+-  kea: Fix :cve_nist:`2025-32801`, :cve_nist:`2025-32802` and :cve_nist:`2025-32803`
+-  libarchive: fix :cve_nist:`2025-5914`, :cve_nist:`2025-5915`, :cve_nist:`2025-5916`,
+   :cve_nist:`2025-5917` and :cve_nist:`2025-5918`
+-  libsoup-2.4: Fix :cve_nist:`2025-2784`, :cve_nist:`2025-4476`, :cve_nist:`2025-4945`,
+   :cve_nist:`2025-4948`, :cve_nist:`2025-4969`, :cve_nist:`2025-32050`, :cve_nist:`2025-32052`,
+   :cve_nist:`2025-32053`, :cve_nist:`2025-32907` and :cve_nist:`2025-46421`
+-  libsoup-3.4: Fix :cve_nist:`2025-2784`, :cve_nist:`2025-4945`, :cve_nist:`2025-4948`,
+   :cve_nist:`2025-4969`, :cve_nist:`2025-32050`, :cve_nist:`2025-32051`, :cve_nist:`2025-32052`,
+   :cve_nist:`2025-32053`, :cve_nist:`2025-32907`, :cve_nist:`2025-32908` and :cve_nist:`2025-46421`
+-  libxml2: Fix :cve_nist:`2025-6021`
+-  linux-yocto-6.6: Fix :cve_nist:`2025-21995`, :cve_nist:`2025-21996`, :cve_nist:`2025-21997`,
+   :cve_nist:`2025-21999`, :cve_nist:`2025-22001`, :cve_nist:`2025-22003`, :cve_nist:`2025-22004`,
+   :cve_nist:`2025-22005`, :cve_nist:`2025-22007`, :cve_nist:`2025-22009`, :cve_nist:`2025-22010`,
+   :cve_nist:`2025-22014`, :cve_nist:`2025-22018`, :cve_nist:`2025-22020`, :cve_nist:`2025-22027`,
+   :cve_nist:`2025-22033`, :cve_nist:`2025-22035`, :cve_nist:`2025-22038`, :cve_nist:`2025-22040`,
+   :cve_nist:`2025-22041`, :cve_nist:`2025-22054`, :cve_nist:`2025-22056`, :cve_nist:`2025-22063`,
+   :cve_nist:`2025-22066`, :cve_nist:`2025-22080`, :cve_nist:`2025-22081`, :cve_nist:`2025-22088`,
+   :cve_nist:`2025-22097`, :cve_nist:`2025-23136`, :cve_nist:`2025-37785`, :cve_nist:`2025-37800`,
+   :cve_nist:`2025-37801`, :cve_nist:`2025-37803`, :cve_nist:`2025-37805`, :cve_nist:`2025-37838`,
+   :cve_nist:`2025-37893`, :cve_nist:`2025-38152`, :cve_nist:`2025-39728` and :cve_nist:`2025-39735`
+-  net-tools: Fix :cve_nist:`2025-46836`
+-  python3-setuptools: Fix :cve_nist:`2025-47273`
+-  python3-requests: fix :cve_nist:`2024-47081`
+-  python3-urllib3: Fix :cve_nist:`2025-50181`
+-  python3: Fix CVE 2024-12718 CVE 2025-4138 CVE 2025-4330 CVE 2025-4435 :cve_nist:`2025-4516` CVE
+   2025-4517
+-  screen: fix :cve_nist:`2025-46802`, :cve_nist:`2025-46804` and :cve_nist:`2025-46805`
+-  sudo: Fix :cve_nist:`2025-32462`
+-  xwayland: Fix :cve_nist:`2025-49175`, :cve_nist:`2025-49176`, :cve_nist:`2025-49177`,
+   :cve_nist:`2025-49178`, :cve_nist:`2025-49179` and :cve_nist:`2025-49180`
+
+
+Fixes in Yocto-5.0.11
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bitbake: ast: Change deferred inherits to happen per recipe
+-  bitbake: fetch2: Avoid deprecation warning
+-  bitbake: gcp.py: remove slow calls to gsutil stat
+-  bitbake: toaster/tests/buildtest: Switch to new CDN
+-  brief-yoctoprojectqs/ref-manual: Switch to new CDN
+-  bsp-guide: update kernel version example to 6.12
+-  bsp-guide: update all of section 1.8.2 to reflect current beaglebone conf file
+-  bsp-guide: update lonely "4.12" kernel reference to "6.12"
+-  build-appliance-image: Update to scarthgap head revision
+-  cmake: Correctly handle cost data of tests with arbitrary chars in name
+-  conf.py: improve SearchEnglish to handle terms with dots
+-  docs: Clean up explanation of minimum required version numbers
+-  docs: README: specify how to contribute instead of pointing at another file
+-  docs: conf.py: silence SyntaxWarning on js_splitter_code
+-  gcc: Upgrade to GCC 13.4
+-  ghostscript: upgrade to 10.05.1
+-  glibc: stable 2.39 branch updates (06a70769fd...)
+-  gnupg: update to 2.4.8
+-  gtk+: add missing libdrm dependency
+-  kea: upgrade to 2.4.2
+-  libpng: Add ptest
+-  libsoup-2.4: fix do_compile failure
+-  linux-yocto/6.6: fix beaglebone ethernet
+-  linux-yocto/6.6: update to v6.6.96
+-  local.conf.sample: Switch to new CDN
+-  ltp: backport patch to fix compilation error for x86_64
+-  migration-guides: add release notes for 4.0.27, 4.0.28, 5.0.10
+-  minicom: correct the :term:`SRC_URI`
+-  nfs-utils: don't use signals to shut down nfs server.
+-  overview-manual/concepts.rst: fix sayhello hardcoded bindir
+-  overview-manual: small number of pedantic cleanups
+-  package: export debugsources in :term:`PKGDESTWORK` as json
+-  poky.conf: bump version for 5.0.11
+-  python3-requests: upgrade to 2.32.4
+-  python3: upgrade to 3.12.11
+-  ref-manual: clarify :term:`KCONFIG_MODE` default behaviour
+-  ref-manual: classes: nativesdk: move note to appropriate section
+-  ref-manual: classes: reword to clarify that native/nativesdk options are exclusive
+-  ref-manual: document :term:`KERNEL_SPLIT_MODULES` variable
+-  scripts/install-buildtools: Update to 5.0.10
+-  spdx: add option to include only compiled sources
+-  sstatetests: Switch to new CDN
+-  systemd: Rename systemd_v255.21 to systemd_255.21
+-  systemd: upgrade to 255.21
+-  tcf-agent: correct the :term:`SRC_URI`
+-  testimage: get real os-release file
+-  tune-cortexr52: Remove aarch64 for ARM Cortex-R52
+-  uboot: Allow for customizing installed/deployed file names
+
+
+Known Issues in Yocto-5.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+Contributors to Yocto-5.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+-  Aleksandar Nikolic
+-  Andrew Fernandes
+-  Antonin Godard
+-  Archana Polampalli
+-  Ashish Sharma
+-  Bruce Ashfield
+-  Carlos Sánchez de La Lama
+-  Changqing Li
+-  Chen Qi
+-  Colin Pinnell McAllister
+-  Daniel Turull
+-  Deepesh Varatharajan
+-  Divya Chellam
+-  Dixit Parmar
+-  Enrico Jörns
+-  Etienne Cordonnier
+-  Guocai He
+-  Guðni Már Gilbert
+-  Hitendra Prajapati
+-  Jiaying Song
+-  Lee Chee Yang
+-  Moritz Haase
+-  NeilBrown
+-  Peter Marko
+-  Poonam Jadhav
+-  Praveen Kumar
+-  Preeti Sachan
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert P. J. Day
+-  Roland Kovacs
+-  Ryan Eatmon
+-  Sandeep Gundlupet Raju
+-  Savvas Etairidis
+-  Steve Sakoman
+-  Victor Giraud
+-  Vijay Anusuri
+-  Virendra Thakur
+-  Wang Mingyu
+-  Yogita Urade
+
+
+Repositories / Downloads for Yocto-5.0.11
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.11 </poky/log/?h=yocto-5.0.11>`
+-  Git Revision: :yocto_git:`ae2d52758fc2fcb0ed996aa234430464ebf4b310 </poky/commit/?id=ae2d52758fc2fcb0ed996aa234430464ebf4b310>`
+-  Release Artefact: poky-ae2d52758fc2fcb0ed996aa234430464ebf4b310
+-  sha: 48dec434dd51e5c9c626abdccc334da300fa2b4975137d526f5df6703e5a930e
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.11/poky-ae2d52758fc2fcb0ed996aa234430464ebf4b310.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.11/poky-ae2d52758fc2fcb0ed996aa234430464ebf4b310.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0.11 </openembedded-core/log/?h=yocto-5.0.11>`
+-  Git Revision: :oe_git:`7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b </openembedded-core/commit/?id=7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b>`
+-  Release Artefact: oecore-7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b
+-  sha: fb50992a28298915fe195e327628d6d5872fd2dbc74189c2d840178cd860bb2e
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.11/oecore-7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.11/oecore-7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.11 </meta-mingw/log/?h=yocto-5.0.11>`
+-  Git Revision: :yocto_git:`bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f </meta-mingw/commit/?id=bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f>`
+-  Release Artefact: meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
+-  sha: ab073def6487f237ac125d239b3739bf02415270959546b6b287778664f0ae65
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.11/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.11/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0.11 </bitbake/log/?h=yocto-5.0.11>`
+-  Git Revision: :oe_git:`139f61fe9eec221745184a14b3618d2dfa650b91 </bitbake/commit/?id=139f61fe9eec221745184a14b3618d2dfa650b91>`
+-  Release Artefact: bitbake-139f61fe9eec221745184a14b3618d2dfa650b91
+-  sha: 86669d4220c50d35c0703f151571954ad9c6285cc91a870afbb878d2e555d2ca
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.11/bitbake-139f61fe9eec221745184a14b3618d2dfa650b91.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.11/bitbake-139f61fe9eec221745184a14b3618d2dfa650b91.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`scarthgap </meta-yocto/log/?h=scarthgap>`
+-  Tag: :yocto_git:`yocto-5.0.11 </meta-yocto/log/?h=yocto-5.0.11>`
+-  Git Revision: :yocto_git:`50e5c0d85d3775ac1294bdcd7f11deaa382c9d08 </meta-yocto/commit/?id=50e5c0d85d3775ac1294bdcd7f11deaa382c9d08>`
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag: :yocto_git:`yocto-5.0.11 </yocto-docs/log/?h=yocto-5.0.11>`
+-  Git Revision: :yocto_git:`3f88cb85cca8f9128cfaab36882c4563457b03d9 </yocto-docs/commit/?id=3f88cb85cca8f9128cfaab36882c4563457b03d9>`
+
-- 
2.43.0


