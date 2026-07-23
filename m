Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D33C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:45:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19714.1784799955298881137
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 02:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Jmul8ZpA;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784799956; x=1816335956;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EEgFvIiq4g5wrvjBhhZrD1YwNjz41hofCvxeCGsRw9U=;
  b=Jmul8ZpAOHNxGFla11K1o2/8P0uvoCgw+4h/fUJ/43ZPoOqvapkE0jbm
   RY1ukvBEHIgyjl5jH8j244s723LxcjSQw3eJQMks/vKI1ZjSRvrE2fssJ
   J06VUOWWQEro6VqH4C+dtAWSUbs8XGA/oCWY2RoEZR8suVz0DorlwWGWw
   H74uPPztfRfxd7UZNUqjgd1FFEW9tKggixD6NX+s2G+xqKhCYKFNHULPA
   cgmniCp9A1kZHv03SmJWI0YkWN5dSB+7Q82seHimOi9/93hdOUVs3G6kT
   mtdvsM6DtbNWR5vhEy0whxS11HSvYGgX120xqJi0EaJU81cihXQTsga95
   Q==;
X-CSE-ConnectionGUID: ul7xCszOQ2e/W6BEZ93vvA==
X-CSE-MsgGUID: aNspMmrzQTiWh00XnP/CJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102996029"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="102996029"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 02:45:56 -0700
X-CSE-ConnectionGUID: Yfoxcr6MRROb2ZNaRfSMEw==
X-CSE-MsgGUID: mB2Kt77oSQWT0UxP8l6EUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="254013244"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2026 02:45:54 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-guide: add release notes for 6.0.2
Date: Thu, 23 Jul 2026 17:45:05 +0800
Message-ID: <20260723094505.628062-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723094505.628062-1-chee.yang.lee@intel.com>
References: <20260723094505.628062-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jul 2026 09:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10119

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-6.0.rst          |   1 +
 .../migration-guides/release-notes-6.0.2.rst  | 273 ++++++++++++++++++
 2 files changed, 274 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-6.0.2.rst

diff --git a/documentation/migration-guides/release-6.0.rst b/documentation/migration-guides/release-6.0.rst
index 6cfe3297f4..5f5ed5e2e4 100644
--- a/documentation/migration-guides/release-6.0.rst
+++ b/documentation/migration-guides/release-6.0.rst
@@ -9,3 +9,4 @@ Release 6.0 (wrynose)
    release-notes-6.0
    migration-6.0
    release-notes-6.0.1
+   release-notes-6.0.2
diff --git a/documentation/migration-guides/release-notes-6.0.2.rst b/documentation/migration-guides/release-notes-6.0.2.rst
new file mode 100644
index 0000000000..689c8e9bac
--- /dev/null
+++ b/documentation/migration-guides/release-notes-6.0.2.rst
@@ -0,0 +1,273 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-6.0.2 (Whinlatter)
+------------------------------------------
+
+This release removed the linux-yocto 6.18 CVE exclusion list (:oe_git:`meta/recipes-kernel/linux/cve-exclusion_6.18.inc </openembedded-core/commit/meta/recipes-kernel/linux/cve-exclusion_6.18.inc?id=596ad6c397c5ca264c6c257283ea78095562e67c>`) as sbom-cve-check now natively handles CVE status.
+
+Security Fixes in Yocto-6.0.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bind: Fix :cve_nist:`2026-3039`, :cve_nist:`2026-3592`, :cve_nist:`2026-3593`,
+   :cve_nist:`2026-5946`, :cve_nist:`2026-5947` and :cve_nist:`2026-5950`
+-  cups: Fix :cve_nist:`2026-34978`, :cve_nist:`2026-34979`, :cve_nist:`2026-34980`,
+   :cve_nist:`2026-34990`, :cve_nist:`2026-39314` and :cve_nist:`2026-39316`
+-  curl: Fix :cve_nist:`2026-6276`
+-  go: Fix :cve_nist:`2026-27145`, :cve_nist:`2026-33811`, :cve_nist:`2026-33814`,
+   :cve_nist:`2026-39817`, :cve_nist:`2026-39819`, :cve_nist:`2026-39820`, :cve_nist:`2026-39823`,
+   :cve_nist:`2026-39825`, :cve_nist:`2026-39826`, :cve_nist:`2026-39836`, :cve_nist:`2026-42499`,
+   :cve_nist:`2026-42501`, :cve_nist:`2026-42504` and :cve_nist:`2026-42507`
+-  libinput: Fix :cve_nist:`2026-50292`
+-  libsolv: Fix :cve_nist:`2026-9150`
+-  libusb1: Fix :cve_nist:`2026-23679` and :cve_nist:`2026-47104`
+-  openssl: Fix :cve_nist:`2026-7383`, :cve_nist:`2026-9076`, :cve_nist:`2026-34180`,
+   :cve_nist:`2026-34181`, :cve_nist:`2026-34182`, :cve_nist:`2026-34183`, :cve_nist:`2026-42764`,
+   :cve_nist:`2026-42766`, :cve_nist:`2026-42767`, :cve_nist:`2026-42768`, :cve_nist:`2026-42769`,
+   :cve_nist:`2026-42770`, :cve_nist:`2026-45445`, :cve_nist:`2026-45446` and :cve_nist:`2026-45447`
+-  python3: Fix :cve_nist:`2026-1502`, :cve_nist:`2026-3087`, :cve_nist:`2026-3298`,
+   :cve_nist:`2026-4786`, :cve_nist:`2026-5713`, :cve_nist:`2026-6019` and :cve_nist:`2026-6100`
+-  qemu: Fix :cve_nist:`2024-6519`
+-  xserver-xorg: Fix :cve_nist:`2026-33999`, :cve_nist:`2026-34000`, :cve_nist:`2026-34001`,
+   :cve_nist:`2026-34002` and :cve_nist:`2026-34003`
+-  xwayland: Fix :cve_nist:`2026-33999`, :cve_nist:`2026-34000`, :cve_nist:`2026-34001`,
+   :cve_nist:`2026-34002` and :cve_nist:`2026-34003`
+
+
+Fixes in Yocto-6.0.2
+~~~~~~~~~~~~~~~~~~~~
+
+bitbake
+^^^^^^^
+
+-  bitbake: fix issue with varflag exclusion
+-  fetch2/crate: guard against empty version list
+-  fetch2/crate: skip yanked versions when reading cargo index
+-  fetch2/git: quote shallow extra ref arguments
+-  fetch2/wget: limit auth on checkstatus redirects
+-  fetch2: Unpack RPMs with --no-absolute-filenames
+-  fetch2: allow empty value for params while formatting URI string.
+-  fetch2: reraise IOError during download
+-  fetch2: validate deb/ipk data member names
+-  fetch2: validate striplevel parameter
+-  hashserv/tests: use valid 64-character unihashes
+-  hashserv: validate unihash values
+-  layerindexlib: restapi.py: fix unbound variable
+-  tests/fetch: cover checkstatus redirect auth handling
+-  toaster: use https for clones, remove cgit in links in defaults
+
+meta-yocto
+^^^^^^^^^^
+
+-  poky.conf: Bump version for 6.0.2 release
+
+openembedded-core
+^^^^^^^^^^^^^^^^^
+
+-  bind: upgrade to 9.20.23
+-  binutils: Upgrade to 2.46.1
+-  build-appliance-image: Update to wrynose head revisions
+-  ca-certificates: upgrade to 20260601
+-  classes/gtk-icon-cache: fix libdir passed to the postrm intercept
+-  conf/machine: fix typos in ARM and x86 README files
+-  curl: fix mbedtls detection
+-  dropbear: Clarify :term:`LICENSE` and drop PD
+-  gcc: Upgrade GCC to 15.3 release
+-  gettext-minimal-native: Use SPDX License Identifier
+-  glib-2.0-native: Remove problematic path reference
+-  glib-2.0: Change from Public Domain to Gnome GCR Documentation License
+-  go: upgrade to 1.26.4
+-  gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer creation
+-  libpcap: fix error message on 32-bit integer overflow
+-  libsdl2: Fix compilation error with DirectFB
+-  licenses: Update with the pull-sdpx-licenses.py script to 3.28.0
+-  linux-yocto: remove CVE exclusion list, sbom-cve-check does this itself
+-  lttng-modules: Fix trace_hrtimer_start build failure
+-  matchbox-panel-2: backport patch to set a constant size for the clock
+-  mobile-broadband-provider-info: Fix license to be CC-PDDC
+-  net-tools: Handle binmerge
+-  oeqa/core/runner: stub addDuration in OETestResult
+-  openssl: upgrade to 3.5.7
+-  perf: disable BUILD_BPF_SKEL by default
+-  perf: make libraries for install_headers configurable
+-  pixman: Change PD license to HPND-sell-variant
+-  ppp: Remove PD license
+-  pseudo: Update to version 1.9.8
+-  python3-pycryptodome: Update :term:`LICENSE` PD -> Unlicense
+-  python3-pyelftools: Update license to Unlicense
+-  python3: Fix ThreadingMock call_count race condition
+-  python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak
+-  python3: upgrade to 3.14.5
+-  python3targetconfig: pull in nativesdk python when building nativesdk recipes
+-  rust: export CARGO_BUILD_TARGET
+-  sbom-cve-check-common: Fatalize command failure
+-  sbom-cve-check: Fix breakage with empty :term:`IMAGE_LINK_NAME`
+-  scripts/install-buildtools: Update to 6.0.1
+-  sqlite3: Use SPDX identifier
+-  squashfs-tools: add another CPE
+-  sstate: Detect broken sstate paths containing tmpdir
+-  udev-extraconf: use -H for unmount tmpfile find
+-  util-macros: Remove redundant MIT license
+-  wireless-regdb: upgrade to 2026.05.30
+-  xserver-xorg/xwayland: 'Clarify' xserver license
+-  xserver-xorg/xwayland: Drop X11-swapped from :term:`LICENSE`
+-  xserver-xorg: upgrade to 21.1.22
+-  xwayland: upgrade 24.1.9 -> 24.1.11
+
+yocto-docs
+^^^^^^^^^^
+
+-  Document shared state signing
+-  bsp-guide: mention bootloader and device tree in BSP intro
+-  bsp-guide: simplify example of structure of BSP layer
+-  bsp-guide: update guide to reflect newer beaglebone
+-  build-manual: update :term:`ROOTFS_POSTPROCESS_COMMAND` example
+-  contributor-guide: couple minor typo/grammar fixes
+-  dev-manual: SysVinit is the default init manager for Poky
+-  dev-manual: change "setup" to "set up" when used as an action
+-  dev-manual: drop "PREFERRED_VERSION" from x86-base.inc snippet
+-  dev-manual: fix broken grammar in "Libraries" section
+-  dev-manual: fix grammatical error, missing word "with"
+-  dev-manual: fully define SOLIBS-related variables in bitbake.conf
+-  dev-manual: remove semicolons for rootfs commands
+-  dev-manual: update :term:`AUTOREV` explanation to match current file
+-  kernel-dev: remove references to defunct LTSI project
+-  migration-guide: Fix migration scripts
+-  migration-guide: add release notes for 5.0.18
+-  overview-manual/concepts: convert several .png to SVG
+-  overview-manual/svg: remove white backgrounds
+-  overview-manual: add ":term:" for OE Build System
+-  overview-manual: correct that "conf" is a subdir of build dir
+-  overview-manual: explain "ODM" and "OSV" acronyms
+-  overview-manual: fix typo, "semi-colon" -> "colon"
+-  overview-manual: hyphens not allowed in file version
+-  overview-manual: inform the reader early of "bitbake-getvar"
+-  overview-manual: mention that patch files can be compressed
+-  overview-manual: provide a more expansive definition of "layer"
+-  overview-manual: remind reader that meta-poky is a distro layer
+-  overview-manual: update deploy.bbclass snippet
+-  overview-manual: use correct spelling "counterpart"
+-  recipe-style-guide.rst: two minor grammatical tweaks
+-  ref-manual/variables.rst: link \*MIRRORS definitions to the BitBake manual
+-  ref-manual: add more explanation to glossary variable :term:`LICENSE`
+-  ref-manual: clarify that :term:`PACKAGE_EXCLUDE` supports DEB packaging
+-  ref-manual: clarify use of "PACKAGE_ARCH" in a packagegroup
+-  ref-manual: document :term:`RM_WORK_EXCLUDE_ITEMS` variable
+-  ref-manual: update glossary entries for packaging backend variables
+-  security-manual: some grammar and wording fixes in intro
+-  security-team.rst: update my email address and key
+-  security-team: Add section on multi-project embargoes
+-  security-team: Tidy and update section on security team operations
+-  security-team: Update membership list
+
+
+Known Issues in Yocto-6.0.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+Contributors to Yocto-6.0.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Abhishek Bachiphale
+-  Adarsh Jagadish Kamini
+-  Alexander Kanavin
+-  Anders Heimer
+-  Anil Dongare
+-  Ankur Tyagi
+-  Anthony Squires
+-  Antonin Godard
+-  Bin Cao
+-  David Reyna
+-  Deepak Rathore
+-  Harish Sadineni
+-  He Zhe
+-  Hemanth Kumar M D
+-  Jate Sujjavanich
+-  Jesse Van Gavere
+-  Jinfeng Wang
+-  Joshua Watt
+-  João Marcos Costa
+-  Jörg Sommer
+-  Lee Chee Yang
+-  Marcio Henriques
+-  Mark Hatle
+-  Mark Jonas
+-  Marta Rybczynska
+-  Niko Mauno
+-  Omkar Patil
+-  Paul Barker
+-  Peter Marko
+-  Prabhudasu Vatala
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert P. J. Day
+-  Ross Burton
+-  Sai Sneha
+-  Thomas Perrot
+-  Tushar Darote
+-  Vyacheslav Yurkov
+-  Wang Mingyu
+-  Yoann Congal
+-  hongxu
+
+Repositories / Downloads for Yocto-6.0.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`whinlatter </yocto-docs/log/?h=whinlatter>`
+-  Tag:  :yocto_git:`yocto-6.0.2 </yocto-docs/log/?h=yocto-6.0.2>`
+-  Git Revision: :yocto_git:`2c59a23fc39d92831cb55a0e5f713d20f94730d4 </yocto-docs/commit/?id=2c59a23fc39d92831cb55a0e5f713d20f94730d4>`
+-  Release Artefact: yocto-docs-2c59a23fc39d92831cb55a0e5f713d20f94730d4
+-  sha: ed297179a81884c892ca4fac44be163e9603c77d2ca84462b7b29a772c427236
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.2/yocto-docs-2c59a23fc39d92831cb55a0e5f713d20f94730d4.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.2/yocto-docs-2c59a23fc39d92831cb55a0e5f713d20f94730d4.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`whinlatter </openembedded-core/log/?h=whinlatter>`
+-  Tag:  :oe_git:`yocto-6.0.2 </openembedded-core/log/?h=yocto-6.0.2>`
+-  Git Revision: :oe_git:`5d1aa5c806c061a2994f4decb59016610f093213 </openembedded-core/commit/?id=5d1aa5c806c061a2994f4decb59016610f093213>`
+-  Release Artefact: oecore-5d1aa5c806c061a2994f4decb59016610f093213
+-  sha: d7c5b514ebba36558921bf30b2f404521a46bbe38805011afb1f43ec60925c31
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.2/oecore-5d1aa5c806c061a2994f4decb59016610f093213.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.2/oecore-5d1aa5c806c061a2994f4decb59016610f093213.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`whinlatter </meta-yocto/log/?h=whinlatter>`
+-  Tag:  :yocto_git:`yocto-6.0.2 </meta-yocto/log/?h=yocto-6.0.2>`
+-  Git Revision: :yocto_git:`24c24cef5d1523fefe43a3e3d34667b37ae551f3 </meta-yocto/commit/?id=24c24cef5d1523fefe43a3e3d34667b37ae551f3>`
+-  Release Artefact: meta-yocto-24c24cef5d1523fefe43a3e3d34667b37ae551f3
+-  sha: d81d38f935efaf7f744f9f3b0b47e0c551dc4aad09343792813acadc60a11ef2
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.2/meta-yocto-24c24cef5d1523fefe43a3e3d34667b37ae551f3.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.2/meta-yocto-24c24cef5d1523fefe43a3e3d34667b37ae551f3.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.18 </bitbake/log/?h=2.18>`
+-  Tag:  :oe_git:`yocto-6.0.2 </bitbake/log/?h=yocto-6.0.2>`
+-  Git Revision: :oe_git:`acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd </bitbake/commit/?id=acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd>`
+-  Release Artefact: bitbake-acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+-  sha: 13c93db11c6648ceed179408244a07111b6d6fb911749d46d160103fdd375ec9
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0.2/bitbake-acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0.2/bitbake-acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd.tar.bz2
+
-- 
2.43.0


