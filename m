Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055C3C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 03:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.5324.1743651906358668839
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 20:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KFFfDVIH;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743651907; x=1775187907;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RyWOeWPuYKpELaXa6U61bR7I7sKQViuEOmkmcgXo6Qk=;
  b=KFFfDVIHP92dSAAJtzvKYNm5YHoq4zWSmcUbc5i4PrBtZkmQqrsUpZ7U
   Vk2FeBXc4zC8jJT9TZUhy2245HieumkSdwKlCgSdljH1jxfmZVD1npO5J
   zCGTyE0PslqOQVGBFnEztKhhE8Mk9QC9UCFE331YpungVkyVFR9oF/bIM
   nMgTtagL9cNWqYiuB1h2RKTXXwo8OmfjqHYBYepa4Vy8so7jMFhM9hZi3
   ORnYDnvlE08olCV4NW1ZP0+s3TWNM3c19OQB47973Xly4wRBVfPfAmTLW
   AO2HGecdvPq6FO8zuZr08HW5aG7eFa2yfFbtXpOHo62vlvZW22v1AiKfg
   w==;
X-CSE-ConnectionGUID: I7zWq10UQkahP5ajrpTYNQ==
X-CSE-MsgGUID: +KNphUsnS6icr6Qxn807Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62581043"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62581043"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:45:07 -0700
X-CSE-ConnectionGUID: PO3xIwJ7QNWeAdgdC5bItA==
X-CSE-MsgGUID: 4ihrjHJaSX6/76KJ+im3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131864016"
Received: from cheeyang-desk1.png.intel.com ([10.107.249.127])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2025 20:45:07 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [Patch v2 2/2] migration-guides: add release notes for 5.0.8
Date: Thu,  3 Apr 2025 11:44:16 +0800
Message-Id: <20250403034416.1505203-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403034416.1505203-1-chee.yang.lee@intel.com>
References: <20250403034416.1505203-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 03:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6702

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
v2: cve_mitre -> cve_nist

 .../migration-guides/release-5.0.rst          |   2 +-
 .../migration-guides/release-notes-5.0.8.rst  | 226 ++++++++++++++++++
 2 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.8.rst

diff --git a/documentation/migration-guides/release-5.0.rst b/documentation/migration-guides/release-5.0.rst
index 920e05f12..528963ec2 100644
--- a/documentation/migration-guides/release-5.0.rst
+++ b/documentation/migration-guides/release-5.0.rst
@@ -14,4 +14,4 @@ Release 5.0 (scarthgap)
    release-notes-5.0.5
    release-notes-5.0.6
    release-notes-5.0.7
-
+   release-notes-5.0.8
diff --git a/documentation/migration-guides/release-notes-5.0.8.rst b/documentation/migration-guides/release-notes-5.0.8.rst
new file mode 100644
index 000000000..5cb8b3024
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.8.rst
@@ -0,0 +1,226 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-5.0.8 (Scarthgap)
+-----------------------------------------
+
+Security Fixes in Yocto-5.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-0840`
+-  curl: Ignore :cve_nist:`2025-0725`
+-  elfutils: Fix :cve_nist:`2025-1352`, :cve_nist:`2025-1365` and :cve_nist:`2025-1372`
+-  ffmpeg: Fix :cve_nist:`2024-35365`, :cve_nist:`2024-35369`, :cve_nist:`2024-36613`,
+   :cve_nist:`2024-36616`, :cve_nist:`2024-36617`, :cve_nist:`2024-36618`, :cve_nist:`2024-36619`,
+   :cve_nist:`2025-0518`, :cve_nist:`2025-22919`, :cve_nist:`2025-22921` and :cve_nist:`2025-25473`
+-  glibc: Fix :cve_nist:`2025-0395`
+-  gnutls: Fix :cve_nist:`2024-12243`
+-  go: Fix :cve_nist:`2024-45336`, :cve_nist:`2024-45341` and :cve_nist:`2025-22866`
+-  gstreamer1.0-rtsp-server: Fix :cve_nist:`2024-44331`
+-  libcap: Fix :cve_nist:`2025-1390`
+-  libtasn1: Fix :cve_nist:`2024-12133`
+-  libxml2: Fix :cve_nist:`2024-56171` and :cve_nist:`2025-24928`
+-  linux-yocto/6.6: Fix :cve_nist:`2024-36476`, :cve_nist:`2024-53179`, :cve_nist:`2024-56582`,
+   :cve_nist:`2024-56703`, :cve_nist:`2024-57801`, :cve_nist:`2024-57802`, :cve_nist:`2024-57841`,
+   :cve_nist:`2024-57882`, :cve_nist:`2024-57887`, :cve_nist:`2024-57890`, :cve_nist:`2024-57892`,
+   :cve_nist:`2024-57895`, :cve_nist:`2024-57896`, :cve_nist:`2024-57900`, :cve_nist:`2024-57901`,
+   :cve_nist:`2024-57902`, :cve_nist:`2024-57906`, :cve_nist:`2024-57907`, :cve_nist:`2024-57908`,
+   :cve_nist:`2024-57910`, :cve_nist:`2024-57911`, :cve_nist:`2024-57912`, :cve_nist:`2024-57913`,
+   :cve_nist:`2024-57916`, :cve_nist:`2024-57922`, :cve_nist:`2024-57925`, :cve_nist:`2024-57926`,
+   :cve_nist:`2024-57933`, :cve_nist:`2024-57938`, :cve_nist:`2024-57939`, :cve_nist:`2024-57940`,
+   :cve_nist:`2024-57949`, :cve_nist:`2024-57951`, :cve_nist:`2025-21631`, :cve_nist:`2025-21636`,
+   :cve_nist:`2025-21637`, :cve_nist:`2025-21638`, :cve_nist:`2025-21639`, :cve_nist:`2025-21640`,
+   :cve_nist:`2025-21642`, :cve_nist:`2025-21652`, :cve_nist:`2025-21658`, :cve_nist:`2025-21665`,
+   :cve_nist:`2025-21666`, :cve_nist:`2025-21667`, :cve_nist:`2025-21669`, :cve_nist:`2025-21670`,
+   :cve_nist:`2025-21671`, :cve_nist:`2025-21673`, :cve_nist:`2025-21674`, :cve_nist:`2025-21675`,
+   :cve_nist:`2025-21676`, :cve_nist:`2025-21680`, :cve_nist:`2025-21681`, :cve_nist:`2025-21683`,
+   :cve_nist:`2025-21684`, :cve_nist:`2025-21687`, :cve_nist:`2025-21689`, :cve_nist:`2025-21690`,
+   :cve_nist:`2025-21692`, :cve_nist:`2025-21694`, :cve_nist:`2025-21697` and :cve_nist:`2025-21699`
+-  openssh: Fix :cve_nist:`2025-26466`
+-  openssl: Fix :cve_nist:`2024-9143`, :cve_nist:`2024-12797` and :cve_nist:`2024-13176`
+-  pyhton3: Fix :cve_nist:`2024-12254` and :cve_nist:`2025-0938`
+-  subversion: Ignore :cve_nist:`2024-45720`
+-  u-boot: Fix :cve_nist:`2024-57254`, :cve_nist:`2024-57255`, :cve_nist:`2024-57256`,
+   :cve_nist:`2024-57257`, :cve_nist:`2024-57258` and :cve_nist:`2024-57259`
+-  vim: Fix :cve_nist:`2025-22134` and :cve_nist:`2025-24014`
+-  xwayland: Fix :cve_nist:`2024-9632`, :cve_nist:`2025-26594`, :cve_nist:`2025-26595`,
+   :cve_nist:`2025-26596`, :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`,
+   :cve_nist:`2025-26600` and :cve_nist:`2025-26601`
+
+
+Fixes in Yocto-5.0.8
+~~~~~~~~~~~~~~~~~~~~
+
+-  base-files: Drop /bin/sh dependency
+-  bind: upgrade to 9.18.33
+-  binutils: File name too long causing failure to open temporary head file in dlltool
+-  binutils: stable 2.42 branch update
+-  bitbake: bblayers/query: Fix using "removeprefix" string method
+-  bitbake: bitbake-diffsigs: fix handling when finding only a single sigfile
+-  bitbake: data_smart.py: clear expand_cache in _setvar_update_overridevars
+-  bitbake: data_smart.py: remove unnecessary ? from __expand_var_regexp__
+-  bitbake: data_smart.py: simple clean up
+-  build-appliance-image: Update to scarthgap head revision
+-  ccache.conf: Add include_file_ctime to sloppiness
+-  cmake: apply parallel build settings to ptest tasks
+-  contributor-guide/submit-changes: add policy on AI generated code
+-  dev-manual/building: document the initramfs-framework recipe
+-  devtool: ide-sdk recommend :term:`DEBUG_BUILD`
+-  devtool: ide-sdk remove the plugin from eSDK installer
+-  devtool: ide-sdk sort cmake preset
+-  devtool: modify support debug-builds
+-  docs: Add favicon for the documentation html
+-  docs: Fix typo in standards.md
+-  docs: Remove all mention of core-image-lsb
+-  docs: vulnerabilities/classes: remove references to cve-check text format
+-  files: Amend overlayfs unit descriptions with path information
+-  files: overlayfs-create-dirs: Improve mount unit dependency
+-  glibc: stable 2.39 branch updates
+-  gnupg: upgrade to 2.4.5
+-  go: upgrade 1.22.12
+-  icu: remove host references in nativesdk to fix reproducibility
+-  libtasn1: upgrade to 4.20.0
+-  libxml2: upgrade to 2.12.10
+-  linux-yocto/6.6: upgrade to v6.6.75
+-  meta: Enable '-o pipefail' for the SDK installer
+-  migration-guides: add release notes for 4.0.24, 4.0.25 and 5.0.7
+-  oe-selftest: devtool ide-sdk use modify debug-build
+-  oeqa/sdk/context: fix for gtk3 test failure during do_testsdk
+-  oeqa/selftest/rust: skip on all MIPS platforms
+-  openssl: upgrade to 3.2.4
+-  pkg-config-native: pick additional search paths from $EXTRA_NATIVE_PKGCONFIG_PATH
+-  poky.conf: add ubuntu2404 to :term:`SANITY_TESTED_DISTROS`
+-  poky.conf: bump version for 5.0.8
+-  ppp: Revert lock path to /var/lock
+-  python3-setuptools-scm: respect GIT_CEILING_DIRECTORIES
+-  python3: upgrade to 3.12.9
+-  qemu: Do not define sched_attr with glibc >= 2.41
+-  ref-manual/faq: add q&a on systemd as default
+-  ref-manual: Add missing variable :term:`IMAGE_ROOTFS_MAXSIZE`
+-  ref-manual: don't refer to poky-lsb
+-  ref-manual: remove OE_IMPORTS
+-  rust-common.bbclass: soft assignment for RUSTLIB path
+-  rust: fix for rust multilib sdk configuration
+-  rust: remove redundant cargo config file
+-  scripts/install-buildtools: Update to 5.0.7
+-  sdk-manual: extensible.rst: devtool ide-sdk improve
+-  sdk-manual: extensible.rst: update devtool ide-sdk
+-  selftest/rust: correctly form the PATH environment variable
+-  systemd: add libpcre2 as :term:`RRECOMMENDS` if pcre2 is enabled
+-  systemd: upgrade to 255.17
+-  test-manual/ptest: link to common framework ptest classes
+-  tzcode-native: Fix compiler setting from 2023d version
+-  tzdata/tzcode-native: upgrade to 2025a
+-  u-boot: kernel-fitimage: Fix dependency loop if :term:`UBOOT_SIGN_ENABLE` and UBOOT_ENV enabled
+-  u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior
+-  uboot-config: fix devtool modify with kernel-fitimage
+-  vim: upgrade to 9.1.1043
+
+
+Known Issues in Yocto-5.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  N/A
+
+Contributors to Yocto-5.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Adrian Freihofer
+-  Aleksandar Nikolic
+-  Alessio Cascone
+-  Alexander Kanavin
+-  Alexis Cellier
+-  Antonin Godard
+-  Archana Polampalli
+-  Bruce Ashfield
+-  Chen Qi
+-  Deepesh Varatharajan
+-  Divya Chellam
+-  Enrico Jörns
+-  Esben Haabendal
+-  Etienne Cordonnier
+-  Fabio Berton
+-  Guðni Már Gilbert
+-  Harish Sadineni
+-  Hitendra Prajapati
+-  Hongxu Jia
+-  Jiaying Song
+-  Joerg Schmidt
+-  Johannes Schneider
+-  Khem Raj
+-  Lee Chee Yang
+-  Marek Vasut
+-  Marta Rybczynska
+-  Moritz Haase
+-  Oleksandr Hnatiuk
+-  Pedro Ferreira
+-  Peter Marko
+-  Poonam Jadhav
+-  Priyal Doshi
+-  Ross Burton
+-  Simon A. Eugster
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Wang Mingyu
+-  Weisser, Pascal
+
+
+Repositories / Downloads for Yocto-5.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.8 </poky/log/?h=yocto-5.0.8>`
+-  Git Revision: :yocto_git:`dc4827b3660bc1a03a2bc3b0672615b50e9137ff </poky/commit/?id=dc4827b3660bc1a03a2bc3b0672615b50e9137ff>`
+-  Release Artefact: poky-dc4827b3660bc1a03a2bc3b0672615b50e9137ff
+-  sha: ace7264e16e18ed02ef0ad2935fa10b5fad2c4de38b2356f4192b38ef2184504
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.8/poky-dc4827b3660bc1a03a2bc3b0672615b50e9137ff.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.8/poky-dc4827b3660bc1a03a2bc3b0672615b50e9137ff.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0.8 </openembedded-core/log/?h=yocto-5.0.8>`
+-  Git Revision: :oe_git:`cd2b6080a4c0f2ed2c9939ec0b87763aef595048 </openembedded-core/commit/?id=cd2b6080a4c0f2ed2c9939ec0b87763aef595048>`
+-  Release Artefact: oecore-cd2b6080a4c0f2ed2c9939ec0b87763aef595048
+-  sha: 14c7cd5c62a96ceb9c2141164ea0f087fdbaed99ca3e9a722977a3f12d6381f6
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.8/oecore-cd2b6080a4c0f2ed2c9939ec0b87763aef595048.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.8/oecore-cd2b6080a4c0f2ed2c9939ec0b87763aef595048.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.8 </meta-mingw/log/?h=yocto-5.0.8>`
+-  Git Revision: :yocto_git:`bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f </meta-mingw/commit/?id=bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f>`
+-  Release Artefact: meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
+-  sha: ab073def6487f237ac125d239b3739bf02415270959546b6b287778664f0ae65
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.8/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.8/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0.8 </bitbake/log/?h=yocto-5.0.8>`
+-  Git Revision: :oe_git:`7375d32e8c1af20c51abec4eb3b072b4ca58b239 </bitbake/commit/?id=7375d32e8c1af20c51abec4eb3b072b4ca58b239>`
+-  Release Artefact: bitbake-7375d32e8c1af20c51abec4eb3b072b4ca58b239
+-  sha: 13dffbc162c5b6e2c95fa72936a430b9a542d52d81d502a5d0afc592fbf4a16b
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.8/bitbake-7375d32e8c1af20c51abec4eb3b072b4ca58b239.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.8/bitbake-7375d32e8c1af20c51abec4eb3b072b4ca58b239.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag: :yocto_git:`yocto-5.0.8 </yocto-docs/log/?h=yocto-5.0.8>`
+-  Git Revision: :yocto_git:`7d3cce5b962ca9f73b29affceb7ebc6710627739 </yocto-docs/commit/?id=7d3cce5b962ca9f73b29affceb7ebc6710627739>`
+
-- 
2.34.1


