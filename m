Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F04FC77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:28:22 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.44703.1685345293872663620
 for <docs@lists.yoctoproject.org>;
 Mon, 29 May 2023 00:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Bc+SifaU;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685345293; x=1716881293;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZxZZla3FnHo5KOlcpeU+u/DFR0yVxzfTh61Z8HEUVvM=;
  b=Bc+SifaUPsq1eCEMoHrUZK2p8NjeEAzWT3nD7wKxwYe+t/JdcEAKI16y
   mDZBDcSd5IfQq18rEoyNcancZMkEyAmhucb+JZ3SNpQK2MZaF8b/7vJKU
   pjc3PCzWZhBd1DvvyOjwZGVvDGbtqlPGdiHDh1JtPMo6AlgJpVJw9pTIc
   JksNKfJq6bVG9BnBCSAFscMZENJWv95DKYF8G6Ml/IzXHmdCgXZoysO7H
   lHbD3DUwBZVjkTLUqSUj9Qyc7ZyWPs1U8aI8Jjazx6KE2rnxy02K22GzL
   tV9CdSn6Ox1/pai4xyZHW12mYKbiFrvGncRFiGKNwSOld/IK+y05RV7Nb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="440998239"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="440998239"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 00:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="795825829"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="795825829"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2023 00:28:12 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 4.2.1
Date: Mon, 29 May 2023 15:27:18 +0800
Message-Id: <20230529072718.1703166-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 May 2023 07:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3973

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.2.rst          |   1 +
 .../migration-guides/release-notes-4.2.1.rst  | 206 ++++++++++++++++++
 2 files changed, 207 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.2.1.rst

diff --git a/documentation/migration-guides/release-4.2.rst b/documentation/migration-guides/release-4.2.rst
index ae52d939c..2757f8927 100644
--- a/documentation/migration-guides/release-4.2.rst
+++ b/documentation/migration-guides/release-4.2.rst
@@ -7,3 +7,4 @@ Release 4.2 (mickledore)
 
    migration-4.2
    release-notes-4.2
+   release-notes-4.2.1
diff --git a/documentation/migration-guides/release-notes-4.2.1.rst b/documentation/migration-guides/release-notes-4.2.1.rst
new file mode 100644
index 000000000..370b5230a
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.2.1.rst
@@ -0,0 +1,206 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.2.1 (Mickledore)
+------------------------------------------
+
+Security Fixes in Yocto-4.2.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  connman: Fix :cve:`2023-28488`
+-  linux-yocto: Ignore :cve:`2023-1652` and :cve:`2023-1829`
+-  ghostscript: Fx :cve:`2023-28879`
+-  qemu: Ignore :cve:`2023-0664`
+-  ruby: Fix :cve:`2022-28738` and :cve:`2022-28739`
+-  tiff: Fix :cve:`2022-4645`
+-  xwayland: Fix :cve:`2023-1393`
+
+
+Fixes in Yocto-4.2.1
+~~~~~~~~~~~~~~~~~~~~
+
+-  apr: upgrade to 1.7.3
+-  bind: upgrade to 9.18.13
+-  build-appliance-image: Update to mickledore head revision
+-  cargo: Fix build on musl/riscv
+-  cpio: fix appending to archives larger than 2GB
+-  cracklib: upgrade to 2.9.11
+-  cve-update-nvd2-native: added the missing http import
+-  dev-manual: init-manager.rst: add summary
+-  dhcpcd: use git instead of tarballs
+-  docs: add support for mickledore (4.2) release
+-  gawk: Add skipped.txt to emit test to ignore
+-  gawk: Disable known ptest fails on musl
+-  gawk: Remove redundant patch
+-  glib-networking: Add test retry to avoid failures
+-  glib-networking: Correct glib error handling in test patch
+-  gtk4: upgrade to 4.10.3
+-  kernel-devsrc: depend on python3-core instead of python3
+-  kernel-fitimage: Fix the default dtb config check
+-  kernel: improve initramfs bundle processing time
+-  libarchive: Enable acls, xattr for native as well as target
+-  libhandy: upgrade to 1.8.2
+-  libnotify: remove dependency dbus
+-  libpam: Fix the xtests/tst-pam_motd[1|3] failures
+-  libpcap: upgrade to 1.10.4
+-  libsdl2: upgrade to 2.26.5
+-  libxml2: Disable icu tests on musl
+-  license.bbclass: Include :term:`LICENSE` in the output when it fails to parse
+-  linux-firmware: upgrade to 20230404
+-  machine/qemuarm*: don't explicitly set vmalloc
+-  maintainers.inc: Fix email address typo
+-  maintainers.inc: Move repo to unassigned
+-  man-pages: upgrade to 6.04
+-  manuals: document :term:`SPDX_CUSTOM_ANNOTATION_VARS`
+-  manuals: expand init manager documentation
+-  mesa: upgrade to 23.0.3
+-  migration-guides: add release-notes for 4.1.4
+-  migration-guides: fixes and improvements to 4.2 release notes
+-  migration-guides: release-notes-4.0.9.rst: add missing :term:`SPDX` info
+-  migration-guides: release-notes-4.2: add doc improvement highlights
+-  mpg123: upgrade to 1.31.3
+-  mtools: upgrade to 4.0.43
+-  oeqa/utils/metadata.py: Fix running oe-selftest running with no distro set
+-  overview-manual: development-environment: update text and screenshots
+-  overview-manual: update section about source archives
+-  package_manager/ipk: fix config path generation in _create_custom_config()
+-  pango: upgrade to 1.50.14
+-  perl: patch out build paths from native binaries
+-  poky.conf: bump version for 4.2.1 release
+-  populate_sdk_ext.bbclass: redirect stderr to stdout so that both end in LOGFILE
+-  populate_sdk_ext.bbclass: set :term:`METADATA_REVISION` with an :term:`DISTRO` override
+-  python3targetconfig.bbclass: Extend PYTHONPATH instead of overwriting
+-  qemu: Add fix for powerpc instruction fallback issue
+-  qemu: Update ppc instruction fix to match revised upstream version
+-  quilt: Fix merge.test race condition
+-  recipes: Default to https git protocol where possible
+-  ref-manual: add "Mixin" term
+-  ref-manual: classes.rst: document devicetree.bbclass
+-  ref-manual: classes: kernel: document automatic defconfig usage
+-  ref-manual: classes: kernel: remove incorrect sentence opening
+-  ref-manual: remove unused and obsolete file
+-  ref-manual: system-requirements.rst: fix AlmaLinux variable name
+-  ref-manual: variables.rst: add wikipedia shortcut for "getty"
+-  ref-manual: variables.rst: document :term:`KERNEL_DANGLING_FEATURES_WARN_ONLY`
+-  ref-manual: variables.rst: don't mention the :term:`INIT_MANAGER` "none" option
+-  release-notes-4.2: remove/merge duplicates entries
+-  release-notes-4.2: update RC3 changes
+-  release-notes-4.2: update known issues and Repositories/Downloads
+-  releases.svg: fix and explain duration of Hardknott 3.3
+-  ruby: upgrade to 3.2.2
+-  rust: upgrade to 1.68.2
+-  selftest/distrodata: clean up exception lists in recipe maintainers test
+-  systemd-systemctl: fix instance template WantedBy symlink construction
+-  texinfo: upgrade to 7.0.3
+-  unfs3: fix symlink time setting issue
+-  update-alternatives.bbclass: fix old override syntax
+-  vala: upgrade to 0.56.6
+-  waffle: upgrade to 1.7.2
+-  weston: add xwayland to :term:`DEPENDS` for :term:`PACKAGECONFIG` xwayland
+-  wpebackend-fdo: upgrade to 1.14.2
+-  xserver-xorg: upgrade to 21.1.8
+-  xwayland: upgrade to 23.1.1
+
+
+Known Issues in Yocto-4.2.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.2.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alex Kiernan
+-  Alexander Kanavin
+-  Arslan Ahmad
+-  Bruce Ashfield
+-  Chen Qi
+-  Dmitry Baryshkov
+-  Enrico Jörns
+-  Jan Vermaete
+-  Joe Slater
+-  Johannes Schrimpf
+-  Kai Kang
+-  Khem Raj
+-  Kyle Russell
+-  Lee Chee Yang
+-  Luca Ceresoli
+-  Markus Volk
+-  Martin Jansa
+-  Martin Siegumfeldt
+-  Michael Halstead
+-  Michael Opdenacker
+-  Ming Liu
+-  Otavio Salvador
+-  Pawan Badganchi
+-  Peter Bergin
+-  Peter Kjellerstedt
+-  Piotr Łobacz
+-  Richard Purdie
+-  Ross Burton
+-  Steve Sakoman
+-  Thomas Roos
+-  Virendra Thakur
+-  Wang Mingyu
+-  Yoann Congal
+-  Zhixiong Chi
+
+
+Repositories / Downloads for Yocto-4.2.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`mickledore </poky/log/?h=mickledore>`
+-  Tag:  :yocto_git:`yocto-4.2.1 </poky/log/?h=yocto-4.2.1>`
+-  Git Revision: :yocto_git:`c5c69f78fc7ce4ba361363c14352e4264ce7813f </poky/commit/?id=c5c69f78fc7ce4ba361363c14352e4264ce7813f>`
+-  Release Artefact: poky-c5c69f78fc7ce4ba361363c14352e4264ce7813f
+-  sha: 057d7771dceebb949a79359d7d028a733a29ae7ecd98b60fefcff83fecb22eb7
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.1/poky-c5c69f78fc7ce4ba361363c14352e4264ce7813f.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.1/poky-c5c69f78fc7ce4ba361363c14352e4264ce7813f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`mickledore </openembedded-core/log/?h=mickledore>`
+-  Tag:  :oe_git:`yocto-4.2.1 </openembedded-core/log/?h=yocto-4.2.1>`
+-  Git Revision: :oe_git:`20cd64812d286c920bd766145ab1cd968e72667e </openembedded-core/commit/?id=20cd64812d286c920bd766145ab1cd968e72667e>`
+-  Release Artefact: oecore-20cd64812d286c920bd766145ab1cd968e72667e
+-  sha: 877fb909af7aa51e1c962d33cfe91ba3e075c384716006aa1345b4bcb15a48ef
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.1/oecore-20cd64812d286c920bd766145ab1cd968e72667e.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.1/oecore-20cd64812d286c920bd766145ab1cd968e72667e.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`mickledore </meta-mingw/log/?h=mickledore>`
+-  Tag:  :yocto_git:`yocto-4.2.1 </meta-mingw/log/?h=yocto-4.2.1>`
+-  Git Revision: :yocto_git:`cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e </meta-mingw/commit/?id=cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e>`
+-  Release Artefact: meta-mingw-cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e
+-  sha: 69ccc3ee503b5c35602889e85d28df64a5422ad0f1e55c96c94135b837bb4a1c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.1/meta-mingw-cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.1/meta-mingw-cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.4 </bitbake/log/?h=2.4>`
+-  Tag:  :oe_git:`yocto-4.2.1 </bitbake/log/?h=yocto-4.2.1>`
+-  Git Revision: :oe_git:`d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c </bitbake/commit/?id=d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c>`
+-  Release Artefact: bitbake-d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c
+-  sha: 5edcb97cb545011226b778355bb840ebcc790552d4a885a0d83178153697ba7a
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.1/bitbake-d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.1/bitbake-d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`mickledore </yocto-docs/log/?h=mickledore>`
+-  Tag: :yocto_git:`yocto-4.2.1 </yocto-docs/log/?h=yocto-4.2.1>`
+-  Git Revision: :yocto_git:`6b04269bba72311e83139cc88b7a3539a5d832e8 </yocto-docs/commit/?id=6b04269bba72311e83139cc88b7a3539a5d832e8>`
+
-- 
2.34.1


