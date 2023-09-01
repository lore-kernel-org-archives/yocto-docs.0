Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A9ECA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 06:43:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.948.1693550621196908174
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Aug 2023 23:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WsSBoR/O;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693550621; x=1725086621;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ST//IxeTBZkbj1KgG9SXEsXO3/HTHGSCr7GKvKwAgrY=;
  b=WsSBoR/OG/WEHLCqP/W3S+pw4fRJE0ZbldsOQHVSljiwKcA/jqnz35yj
   e+7C9YA3Xzbzr7Hj7qpCKSXwLHJb4zQ0RZowYiTU9pBQX1+wflpIwkLES
   UpiANnBbvZnkii4OWaaWbCv0R++Yl6Ayrhiv7ZDUEF9IxWT83mHm53at2
   uORwWjYOg9EBbqvTKgDpmY/KoogMD5lm/+a3nnAEZc0ZH62T/8HAxMA87
   NrtVqFWvqlKmS2hsrqMBfhtTY31uaYBtri4FPcPlInsnsMN+D87tDhNEg
   8G3CQLMoGmxiwmDyCpKNU6uuflpf/8YkCOkyrdqwJ9L/pQgKwK5ei3gzS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378878065"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="378878065"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 23:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986542377"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="986542377"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 23:43:38 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release notes for 4.2.3
Date: Fri,  1 Sep 2023 14:42:05 +0800
Message-Id: <20230901064205.1528588-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Sep 2023 06:43:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4180

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.2.rst          |   1 +
 .../migration-guides/release-notes-4.2.3.rst  | 263 ++++++++++++++++++
 2 files changed, 264 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.2.3.rst

diff --git a/documentation/migration-guides/release-4.2.rst b/documentation/migration-guides/release-4.2.rst
index 981600ae0..abeebcb1c 100644
--- a/documentation/migration-guides/release-4.2.rst
+++ b/documentation/migration-guides/release-4.2.rst
@@ -9,3 +9,4 @@ Release 4.2 (mickledore)
    release-notes-4.2
    release-notes-4.2.1
    release-notes-4.2.2
+   release-notes-4.2.3
diff --git a/documentation/migration-guides/release-notes-4.2.3.rst b/documentation/migration-guides/release-notes-4.2.3.rst
new file mode 100644
index 000000000..3b568a1c2
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.2.3.rst
@@ -0,0 +1,263 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.2.3 (Mickledore)
+------------------------------------------
+
+Security Fixes in Yocto-4.2.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bind: Fix :cve:`2023-2828` and :cve:`2023-2911`
+-  cups: Fix :cve:`2023-34241`
+-  dmidecode: Fix :cve:`2023-30630`
+-  erofs-utils: Fix :cve:`2023-33551` and :cve:`2023-33552`
+-  ghostscript: Fix :cve:`2023-36664`
+-  go: Fix :cve_mitre:`2023-24531`
+-  libarchive: ignore :cve:`2023-30571`
+-  libjpeg-turbo: Fix :cve:`2023-2804`
+-  libx11: Fix :cve:`2023-3138`
+-  ncurses: Fix :cve:`2023-29491`
+-  openssh: Fix :cve:`2023-38408`
+-  python3-certifi: Fix :cve:`2023-37920`
+-  python3-requests: Fix :cve:`2023-32681`
+-  python3: Ignore :cve:`2023-36632`
+-  qemu: fix :cve:`2023-0330`, :cve_mitre:`2023-2861`, :cve_mitre:`2023-3255` and :cve_mitre:`2023-3301`
+-  ruby: Fix :cve:`2023-36617`
+-  vim: Fix :cve:`2023-2609` and :cve:`2023-2610`
+-  webkitgtk: Fix :cve:`2023-27932` and :cve:`2023-27954`
+
+
+Fixes in Yocto-4.2.3
+~~~~~~~~~~~~~~~~~~~~
+
+-  acpica: Update :term:`SRC_URI`
+-  automake: fix buildtest patch
+-  baremetal-helloworld: Fix race condition
+-  bind: upgrade to v9.18.17
+-  binutils: stable 2.40 branch updates
+-  build-appliance-image: Update to mickledore head revision
+-  cargo.bbclass: set up cargo environment in common do_compile
+-  conf.py: add macro for Mitre CVE links
+-  curl: ensure all ptest failures are caught
+-  cve-update-nvd2-native: actually use API keys
+-  cve-update-nvd2-native: fix cvssV3 metrics
+-  cve-update-nvd2-native: handle all configuration nodes, not just first
+-  cve-update-nvd2-native: increase retry count
+-  cve-update-nvd2-native: log a little more
+-  cve-update-nvd2-native: retry all errors and sleep between retries
+-  cve-update-nvd2-native: use exact times, don't truncate
+-  dev-manual: wic.rst: Update native tools build command
+-  devtool/upgrade: raise an error if extracting source produces more than one directory
+-  diffutils: upgrade to 3.10
+-  docs: ref-manual: terms: fix typos in :term:`SPDX` term
+-  file: fix the way path is written to environment-setup.d
+-  file: return wrapper to fix builds when file is in buildtools-tarball
+-  freetype: upgrade to 2.13.1
+-  gcc-testsuite: Fix ppc cpu specification
+-  gcc: don't pass --enable-standard-branch-protection
+-  glibc-locale: use stricter matching for metapackages' runtime dependencies
+-  glibc-testsuite: Fix network restrictions causing test failures
+-  glibc/check-test-wrapper: don't emit warnings from ssh
+-  go: upgrade to 1.20.6
+-  gstreamer1.0: upgrade to 1.22.4
+-  ifupdown: install missing directories
+-  kernel-module-split add systemd modulesloaddir and modprobedir config
+-  kernel-module-split: install config modules directories only when they are needed
+-  kernel-module-split: make autoload and probeconf distribution specific
+-  kernel-module-split: use context manager to open files
+-  kernel: Fix path comparison in kernel staging dir symlinking
+-  kernel: config modules directories are handled by kernel-module-split
+-  kernel: don't fail if Modules.symvers doesn't exist
+-  libassuan: upgrade to 2.5.6
+-  libksba: upgrade to 1.6.4
+-  libnss-nis: upgrade to 3.2
+-  libproxy: fetch from git
+-  libwebp: upgrade to 1.3.1
+-  libx11: upgrade to 1.8.6
+-  libxcrypt: fix hard-coded ".so" extension
+-  linux-firmware : Add firmware of RTL8822 serie
+-  linux-firmware: Fix mediatek mt7601u firmware path
+-  linux-firmware: package firmare for Dragonboard 410c
+-  linux-firmware: split platform-specific Adreno shaders to separate packages
+-  linux-firmware: upgrade to 20230625
+-  linux-yocto/5.15: update to v5.15.124
+-  linux-yocto/6.1: cfg: update ima.cfg to match current meta-integrity
+-  linux-yocto/6.1: upgrade to v6.1.38
+-  ltp: Add kernel loopback module dependency
+-  ltp: add :term:`RDEPENDS` on findutils
+-  lttng-ust: upgrade to 2.13.6
+-  machine/arch-arm64: add -mbranch-protection=standard
+-  maintainers.inc: Modify email address
+-  mdadm: add util-linux-blockdev ptest dependency
+-  mdadm: fix 07revert-inplace ptest
+-  mdadm: fix segfaults when running ptests
+-  mdadm: fix util-linux ptest dependency
+-  mdadm: re-add mdadm-ptest to PTESTS_SLOW
+-  mdadm: skip running known broken ptests
+-  meson.bbclass: Point to llvm-config from native sysroot
+-  migration-guides: add release notes for 4.0.10
+-  migration-guides: add release notes for 4.0.11
+-  migration-guides: add release notes for 4.2.2
+-  oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case
+-  oeqa/runtime/ltp: Increase ltp test output timeout
+-  oeqa/selftest/devtool: add unit test for "devtool add -b"
+-  oeqa/ssh: Further improve process exit handling
+-  oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
+-  oeqa/utils/nfs: allow requesting non-udp ports
+-  openssh: upgrade to 9.3p2
+-  openssl: add PERLEXTERNAL path to test its existence
+-  openssl: use a glob on the PERLEXTERNAL to track updates on the path
+-  opkg-utils: upgrade to 0.6.2
+-  opkg: upgrade to 0.6.2
+-  pkgconf: update :term:`SRC_URI`
+-  poky.conf: bump version for 4.2.3 release
+-  poky.conf: update :term:`SANITY_TESTED_DISTROS` to match autobuilder
+-  ptest-runner: Pull in parallel test fixes and output handling
+-  python3-certifi: upgrade to 2023.7.22
+-  python3: fix missing comma in get_module_deps3.py
+-  recipetool: Fix inherit in created -native* recipes
+-  ref-manual: LTS releases now supported for 4 years
+-  ref-manual: document image-specific variant of :term:`INCOMPATIBLE_LICENSE`
+-  ref-manual: releases.svg: updates
+-  resulttool/resultutils: allow index generation despite corrupt json
+-  rootfs-postcommands.bbclass: Revert "add post func remove_unused_dnf_log_lock"
+-  rootfs: Add debugfs package db file copy and cleanup
+-  rootfs_rpm: don't depend on opkg-native for update-alternatives
+-  rpm: Pick debugfs package db files/dirs explicitly
+-  rust-common.bbclass: move musl-specific linking fix from rust-source.inc
+-  scripts/oe-setup-builddir: copy conf-notes.txt to build dir
+-  scripts/resulttool: add mention about new detected tests
+-  selftest/cases/glibc.py: fix the override syntax
+-  selftest/cases/glibc.py: increase the memory for testing
+-  selftest/cases/glibc.py: switch to using NFS over TCP
+-  shadow-sysroot: add license information
+-  systemd-systemctl: fix errors in instance name expansion
+-  taglib: upgrade to 1.13.1
+-  target/ssh: Ensure exit code set for commands
+-  tcf-agent: upgrade to 1.8.0
+-  testimage/oeqa: Drop testimage_dump_host functionality
+-  tiff: upgrade to 4.5.1
+-  uboot-extlinux-config.bbclass: fix old override syntax in comment
+-  util-linux: add alternative links for ipcs,ipcrm
+-  vim: upgrade to 9.0.1592
+-  webkitgtk: upgrade to 2.38.6
+-  weston: Cleanup and fix x11 and xwayland dependencies
+
+
+Known Issues in Yocto-4.2.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.2.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alejandro Hernandez Samaniego
+-  Alex Kiernan
+-  Alexander Kanavin
+-  Alexis Lothoré
+-  Andrej Valek
+-  Anuj Mittal
+-  Archana Polampalli
+-  BELOUARGA Mohamed
+-  Benjamin Bouvier
+-  Bruce Ashfield
+-  Changqing Li
+-  Chen Qi
+-  Daniel Semkowicz
+-  Dmitry Baryshkov
+-  Enrico Scholz
+-  Etienne Cordonnier
+-  Joe Slater
+-  Joel Stanley
+-  Jose Quaresma
+-  Julien Stephan
+-  Kai Kang
+-  Khem Raj
+-  Lee Chee Yang
+-  Marek Vasut
+-  Mark Hatle
+-  Michael Halstead
+-  Michael Opdenacker
+-  Mingli Yu
+-  Narpat Mali
+-  Oleksandr Hnatiuk
+-  Ovidiu Panait
+-  Peter Marko
+-  Quentin Schulz
+-  Richard Purdie
+-  Ross Burton
+-  Sanjana
+-  Sakib Sajal
+-  Staffan Rydén
+-  Steve Sakoman
+-  Stéphane Veyret
+-  Sudip Mukherjee
+-  Thomas Roos
+-  Tom Hochstein
+-  Trevor Gamblin
+-  Wang Mingyu
+-  Yi Zhao
+-  Yoann Congal
+-  Yogita Urade
+-  Yuta Hayama
+
+
+Repositories / Downloads for Yocto-4.2.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`mickledore </poky/log/?h=mickledore>`
+-  Tag:  :yocto_git:`yocto-4.2.3 </poky/log/?h=yocto-4.2.3>`
+-  Git Revision: :yocto_git:`aa63b25cbe25d89ab07ca11ee72c17cab68df8de </poky/commit/?id=aa63b25cbe25d89ab07ca11ee72c17cab68df8de>`
+-  Release Artefact: poky-aa63b25cbe25d89ab07ca11ee72c17cab68df8de
+-  sha: 9e2b40fc25f7984b3227126ec9b8aa68d3747c8821fb7bf8cb635fc143f894c3
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.3/poky-aa63b25cbe25d89ab07ca11ee72c17cab68df8de.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.3/poky-aa63b25cbe25d89ab07ca11ee72c17cab68df8de.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`mickledore </openembedded-core/log/?h=mickledore>`
+-  Tag:  :oe_git:`yocto-4.2.3 </openembedded-core/log/?h=yocto-4.2.3>`
+-  Git Revision: :oe_git:`7e3489c0c5970389c8a239dc7b367bcadf554eb5 </openembedded-core/commit/?id=7e3489c0c5970389c8a239dc7b367bcadf554eb5>`
+-  Release Artefact: oecore-7e3489c0c5970389c8a239dc7b367bcadf554eb5
+-  sha: 68620aca7c9db6b9a65d9853cacff4e60578f0df39e3e37114e062e1667ba724
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.3/oecore-7e3489c0c5970389c8a239dc7b367bcadf554eb5.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.3/oecore-7e3489c0c5970389c8a239dc7b367bcadf554eb5.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`mickledore </meta-mingw/log/?h=mickledore>`
+-  Tag:  :yocto_git:`yocto-4.2.3 </meta-mingw/log/?h=yocto-4.2.3>`
+-  Git Revision: :yocto_git:`92258028e1b5664a9f832541d5c4f6de0bd05e07 </meta-mingw/commit/?id=92258028e1b5664a9f832541d5c4f6de0bd05e07>`
+-  Release Artefact: meta-mingw-92258028e1b5664a9f832541d5c4f6de0bd05e07
+-  sha: ee081460b5dff4fb8dd4869ce5631718dbaaffbede9532b879b854c18f1b3f5d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.3/meta-mingw-92258028e1b5664a9f832541d5c4f6de0bd05e07.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.3/meta-mingw-92258028e1b5664a9f832541d5c4f6de0bd05e07.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.4 </bitbake/log/?h=2.4>`
+-  Tag:  :oe_git:`yocto-4.2.3 </bitbake/log/?h=yocto-4.2.3>`
+-  Git Revision: :oe_git:`08033b63ae442c774bd3fce62844eac23e6882d7 </bitbake/commit/?id=08033b63ae442c774bd3fce62844eac23e6882d7>`
+-  Release Artefact: bitbake-08033b63ae442c774bd3fce62844eac23e6882d7
+-  sha: 1d070c133bfb6502ac04befbf082cbfda7582c8b1c48296a788384352e5061fd
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.2.3/bitbake-08033b63ae442c774bd3fce62844eac23e6882d7.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.2.3/bitbake-08033b63ae442c774bd3fce62844eac23e6882d7.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`mickledore </yocto-docs/log/?h=mickledore>`
+-  Tag: :yocto_git:`yocto-4.2.3 </yocto-docs/log/?h=yocto-4.2.3>`
+-  Git Revision: :yocto_git:`8e6752a9e55d16f3713e248b37f9d4d2745a2375 </yocto-docs/commit/?id=8e6752a9e55d16f3713e248b37f9d4d2745a2375>`
+
-- 
2.34.1


