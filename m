Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38D3C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 03:07:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web10.37520.1750216050229438626
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 20:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HKnsBlyZ;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750216050; x=1781752050;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P03HgR8ZjXLwMZf722SoBYp7Kg1gAjsDUJKY77vXwnM=;
  b=HKnsBlyZ1jg/Hlw67901mT2D3gH+kgTpAiX7B8NaWvktpfrL1hVXQ0Kd
   1lxrQWsvSkANX/n+jQ+icGS9CQ3QfTWxiex5MhUotN2d/AL0F0+Ml4S6R
   9utimMo81r67qzFy03D51tKfQxAdPHtizPuValws+8RK+iWHpuWbI7JqX
   tS2kcCQKCPu0lNA/iG7Wn0ZOEA2ERVYfdtTcLphCVPU2SuRgc6hpveWmK
   rqhIKU5cLaD+WxA+q/d8lVuvoPJPl/PYEQgUUC7S+eM0Z9TQq6d1v0z4F
   OYznb5eizAtgxKb/McMV6PRreG6qOyU4QUDxYlZZCoxuXqS26pL3B2eoe
   A==;
X-CSE-ConnectionGUID: VsOsKQdES9C5gM5+gzNQjQ==
X-CSE-MsgGUID: UL0ESruHSHuHrnmEpGW98Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56089953"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="56089953"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 20:07:30 -0700
X-CSE-ConnectionGUID: xOueBP9uTkWfjtGn8l1eEQ==
X-CSE-MsgGUID: vyZQihbJRLqVmeUJpylhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149094856"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 20:07:28 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guide: add release notes for 5.0.10
Date: Wed, 18 Jun 2025 11:07:15 +0800
Message-ID: <20250618030715.198107-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 03:07:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7089

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-5.0.rst          |   1 +
 .../migration-guides/release-notes-5.0.10.rst | 208 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.0.10.rst

diff --git a/documentation/migration-guides/release-5.0.rst b/documentation/migration-guides/release-5.0.rst
index 3eb7349c7..b3e7a6791 100644
--- a/documentation/migration-guides/release-5.0.rst
+++ b/documentation/migration-guides/release-5.0.rst
@@ -16,3 +16,4 @@ Release 5.0 (scarthgap)
    release-notes-5.0.7
    release-notes-5.0.8
    release-notes-5.0.9
+   release-notes-5.0.10
diff --git a/documentation/migration-guides/release-notes-5.0.10.rst b/documentation/migration-guides/release-notes-5.0.10.rst
new file mode 100644
index 000000000..e9845aa31
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.0.10.rst
@@ -0,0 +1,208 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-5.0.10 (Scarthgap)
+------------------------------------------
+
+Security Fixes in Yocto-5.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-1153`, :cve_nist:`2025-1179`, :cve_nist:`2025-1180` and
+   :cve_nist:`2025-1182`
+-  connman: Fix :cve_nist:`2025-32366` and :cve_nist:`2025-32743`
+-  curl: Fix :cve_nist:`2024-11053` and :cve_nist:`2025-0167`
+-  elfutils: Fix :cve_nist:`2025-1371`
+-  ffmpeg: Fix :cve_nist:`2024-7055`, :cve_nist:`2024-32230`, :cve_nist:`2024-35366`,
+   :cve_nist:`2024-36613`, :cve_nist:`2024-36616`, :cve_nist:`2024-36617` and :cve_nist:`2024-36619`
+-  git: Fix :cve_nist:`2024-50349` and :cve_nist:`2024-52006`
+-  glib-2.0: fix :cve_nist:`2025-3360` and :cve_nist:`2025-4373`
+-  iputils: Fix :cve_nist:`2025-47268`
+-  libpam: Fix :cve_nist:`2024-10041`
+-  libsoup-2.4: Fix :cve_nist:`2024-52530`, :cve_nist:`2024-52531`, :cve_nist:`2024-52532`,
+   :cve_nist:`2025-32906`, :cve_nist:`2025-32909`, :cve_nist:`2025-32910`, :cve_nist:`2025-32911`,
+   :cve_nist:`2025-32912`, :cve_nist:`2025-32913`, :cve_nist:`2025-32914` and :cve_nist:`2025-46420`
+-  libsoup: Fix :cve_nist:`2025-4476`, :cve_nist:`2025-32906`, :cve_nist:`2025-32909`,
+   :cve_nist:`2025-32910`, :cve_nist:`2025-32911`, :cve_nist:`2025-32912`, :cve_nist:`2025-32913`,
+   :cve_nist:`2025-32914` and :cve_nist:`2025-46420`
+-  libxml2: Fix :cve_nist:`2025-32414` and :cve_nist:`2025-32415`
+-  openssh: Fix :cve_nist:`2025-32728`
+-  perl: Fix :cve_nist:`2024-56406`
+-  ppp: Fix :cve_nist:`2024-58250`
+-  python3-jinja2: Fix :cve_nist:`2024-56201`, :cve_nist:`2024-56326` and :cve_nist:`2025-27516`
+-  ruby: Fix :cve_nist:`2025-27221`
+-  sqlite3: Fix :cve_nist:`2025-3277`, :cve_nist:`2025-29087` and :cve_nist:`2025-29088`
+
+
+Fixes in Yocto-5.0.10
+~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: stable 2.42 branch updates
+-  bluez5: add missing tools to noinst-tools package
+-  bluez5: backport a patch to fix btmgmt -i
+-  bluez5: make media control a :term:`PACKAGECONFIG` option
+-  build-appliance-image: Update to scarthgap head revision
+-  buildtools-tarball: Make buildtools respects host CA certificates
+-  buildtools-tarball: add envvars into :term:`BB_ENV_PASSTHROUGH_ADDITIONS`
+-  buildtools-tarball: move setting of envvars to respective envfile
+-  contributor-guide/submit-changes: encourage patch version changelogs
+-  cve-check.bbclass: Fix symlink handling also for text files
+-  cve-update-nvd2-native: Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"
+-  dev-manual/sbom.rst: fix wrong build outputs
+-  docs: Fix dead links that use the :term:`DISTRO` macro
+-  docs: conf.py: tweak SearchEnglish to be hyphen-friendly
+-  docs:conf.py: define a manpage url
+-  ffmpeg: upgrade to 6.1.2
+-  git: upgrade to 2.44.3
+-  glibc-y2038-tests: remove glibc-y2038-tests_2.39.bb recipe
+-  glibc: Add single-threaded fast path to rand()
+-  glibc: stable 2.39 branch updates
+-  initscripts: add function log_success_msg/log_failure_msg/log_warning_msg
+-  libatomic-ops: Update :term:`GITHUB_BASE_URI`
+-  manuals: remove repeated word
+-  migration-guides: add release notes for 4.0.26, 5.0.8, 5.0.9
+-  module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
+-  perl: upgrade to 5.38.4
+-  perlcross: upgrade to 1.6.2
+-  poky.conf: bump version for 5.0.10
+-  poky.yaml: introduce DISTRO_LATEST_TAG
+-  python3-jinja2: upgrade to 3.1.6
+-  ref-manual/release-process: update releases.svg
+-  ref-manual/variables.rst: HOST_CC_ARCH: fix wrong SDK reference
+-  ref-manual/variables.rst: WATCHDOG_TIMEOUT: fix recipe name
+-  ref-manual/variables.rst: add manpage links for toolchain variables
+-  ref-manual/variables.rst: add missing documentation for BUILD_* variables
+-  ref-manual/variables.rst: document HOST_*_ARCH variables
+-  ref-manual/variables.rst: document :term:`INHIBIT_DEFAULT_RUST_DEPS`
+-  ref-manual/variables.rst: document :term:`INHIBIT_UPDATERCD_BBCLASS`
+-  ref-manual/variables.rst: document :term:`SSTATE_SKIP_CREATION`
+-  ref-manual/variables.rst: document :term:`WIC_CREATE_EXTRA_ARGS`
+-  ref-manual/variables.rst: document autotools class related variables
+-  ref-manual/variables.rst: document missing SDK_*_ARCH variables
+-  ref-manual/variables.rst: document the :term:`IMAGE_ROOTFS_MAXSIZE` variable
+-  ref-manual/variables.rst: document the :term:`INITRAMFS_MAXSIZE` variable
+-  ref-manual/variables.rst: improve the :term:`PKGV` documentation
+-  ref-manual/variables.rst: update :term:`ROOT_HOME` documentation
+-  ref-manual: kernel-fitimage.bbclass does not use :term:`SPL_SIGN_KEYNAME`
+-  scripts/install-buildtools: Update to 5.0.9
+-  sphinx-lint: missing space after literal
+-  sphinx-lint: trailing whitespace
+-  sphinx-lint: unbalanced inline literal markup
+-  systemd: Password agents shouldn't be optional
+-  systemd: upgrade to 255.18
+-  test-manual/intro: remove Buildbot version used
+-  tzdata/tzcode-native: upgrade 2025a -> 2025b
+-  u-boot: ensure keys are generated before assembling U-Boot FIT image
+-  util-linux: Add fix to isolate test fstab entries using CUSTOM_FSTAB
+-  wic: bootimg-efi: Support + symbol in filenames
+
+
+Known Issues in Yocto-5.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  There is an issue where the target libsoup-2.4 build may fail if apachectl is present on the build
+   host. The issue only affects test binaries which aren't actually used. The issue can be fixed by
+   disabling the tests or updating to more recent changes on the scarthgap branch which fix this.
+
+
+Contributors to Yocto-5.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Adrian Freihofer
+-  Aleksandar Nikolic
+-  Alexander Kanavin
+-  Alon Bar-Lev
+-  Alper Ak
+-  Andrew Kreimer
+-  Antonin Godard
+-  Archana Polampalli
+-  Ashish Sharma
+-  Changqing Li
+-  Christos Gavros
+-  Deepesh Varatharajan
+-  Divya Chellam
+-  Divyanshu Rathore
+-  Enrico Jörns
+-  Etienne Cordonnier
+-  Guðni Már Gilbert
+-  Haixiao Yan
+-  Harish Sadineni
+-  Igor Opaniuk
+-  Jeroen Hofstee
+-  Lee Chee Yang
+-  Nguyen Dat Tho
+-  Niko Mauno
+-  Peter Marko
+-  Praveen Kumar
+-  Priyal Doshi
+-  Rogerio Guerra Borin
+-  Shubham Kulkarni
+-  Soumya Sambu
+-  Steve Sakoman
+-  Sunil Dora
+-  Trevor Woerner
+-  Vijay Anusuri
+-  Virendra Thakur
+-  Vyacheslav Yurkov
+-  Yi Zhao
+-  Yogita Urade
+-  rajmohan r
+
+Repositories / Downloads for Yocto-5.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`scarthgap </poky/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.10 </poky/log/?h=yocto-5.0.10>`
+-  Git Revision: :yocto_git:`ac257900c33754957b2696529682029d997a8f28 </poky/commit/?id=ac257900c33754957b2696529682029d997a8f28>`
+-  Release Artefact: poky-ac257900c33754957b2696529682029d997a8f28
+-  sha: ddca7e54b331e78214bea65b346320d4fbcddf4b51103bfbbd9fc3960f32cdc7
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.10/poky-ac257900c33754957b2696529682029d997a8f28.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.10/poky-ac257900c33754957b2696529682029d997a8f28.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`scarthgap </openembedded-core/log/?h=scarthgap>`
+-  Tag:  :oe_git:`yocto-5.0.10 </openembedded-core/log/?h=yocto-5.0.10>`
+-  Git Revision: :oe_git:`d5342ffc570d47a723b18297d75bd2f63c2088db </openembedded-core/commit/?id=d5342ffc570d47a723b18297d75bd2f63c2088db>`
+-  Release Artefact: oecore-d5342ffc570d47a723b18297d75bd2f63c2088db
+-  sha: daa62094f2327f4b3fbcc485e8964d1b86a4722f58fb37e0d8e8e9885094a262
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.10/oecore-d5342ffc570d47a723b18297d75bd2f63c2088db.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.10/oecore-d5342ffc570d47a723b18297d75bd2f63c2088db.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`scarthgap </meta-mingw/log/?h=scarthgap>`
+-  Tag:  :yocto_git:`yocto-5.0.10 </meta-mingw/log/?h=yocto-5.0.10>`
+-  Git Revision: :yocto_git:`bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f </meta-mingw/commit/?id=bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f>`
+-  Release Artefact: meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
+-  sha: ab073def6487f237ac125d239b3739bf02415270959546b6b287778664f0ae65
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.10/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.10/meta-mingw-bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.8 </bitbake/log/?h=2.8>`
+-  Tag:  :oe_git:`yocto-5.0.10 </bitbake/log/?h=yocto-5.0.10>`
+-  Git Revision: :oe_git:`696c2c1ef095f8b11c7d2eff36fae50f58c62e5e </bitbake/commit/?id=696c2c1ef095f8b11c7d2eff36fae50f58c62e5e>`
+-  Release Artefact: bitbake-696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
+-  sha: fc83f879cd6dd14b9b7eba0161fec23ecc191fed0fb00556ba729dceef6c145f
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.10/bitbake-696c2c1ef095f8b11c7d2eff36fae50f58c62e5e.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.10/bitbake-696c2c1ef095f8b11c7d2eff36fae50f58c62e5e.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=scarthgap>`
+-  Tag: :yocto_git:`yocto-5.0.10 </yocto-docs/log/?h=yocto-5.0.10>`
+-  Git Revision: :yocto_git:`3996388e337377bedc113d072a51fe9d68dd40c6 </yocto-docs/commit/?id=3996388e337377bedc113d072a51fe9d68dd40c6>`
+
-- 
2.43.0


