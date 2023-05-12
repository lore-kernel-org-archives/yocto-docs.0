Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5E6C77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 07:56:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.18851.1683878200030259593
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 00:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=b+Wtaa2X;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683878200; x=1715414200;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lx+7Qx3DM9IPaTbik6b8BZG8T5FEquRqkGQpExiS9aA=;
  b=b+Wtaa2XVD2IfraAvyIOHYmDDsZlkF/ihmZR4dRs+xqxnK6pJdrQiYWM
   krXwMMv8kq4FWkKXgiBBSz1n6J3h6mS5pMulsoKINovTZZMRWhI6PJ0As
   MAsAkQU1aV1LMk0lFjMtL0+j3nF7D8hcqcZf6aQkc0XINj4dvU+3NhZLA
   Pwv0ovq9LMP3aqurlQ6aypS1sZJxjl0LCAehokioqIkJc2czrsOfbSstQ
   hBom+nzuWEgNeK+cIemXdTKvJVEKJ01v4ZpUBecYI7INM4dnNArMInAPM
   rqn4EqgPO1nmdTabsvLjAa47y1Sw/vr2Bzvk+O3Acowrou2hRQPNSZ7E8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353862500"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353862500"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 00:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703097797"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="703097797"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2023 00:56:37 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release-notes for 4.1.4
Date: Fri, 12 May 2023 15:55:36 +0800
Message-Id: <20230512075536.393334-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 07:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3933

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.1.rst          |   1 +
 .../migration-guides/release-notes-4.1.4.rst  | 254 ++++++++++++++++++
 2 files changed, 255 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.1.4.rst

diff --git a/documentation/migration-guides/release-4.1.rst b/documentation/migration-guides/release-4.1.rst
index dbca7c7e0..7d1ce95e2 100644
--- a/documentation/migration-guides/release-4.1.rst
+++ b/documentation/migration-guides/release-4.1.rst
@@ -10,3 +10,4 @@ Release 4.1 (langdale)
    release-notes-4.1.1
    release-notes-4.1.2
    release-notes-4.1.3
+   release-notes-4.1.4
diff --git a/documentation/migration-guides/release-notes-4.1.4.rst b/documentation/migration-guides/release-notes-4.1.4.rst
new file mode 100644
index 000000000..236602069
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.1.4.rst
@@ -0,0 +1,254 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.1.4 (Langdale)
+----------------------------------------
+
+Security Fixes in Yocto-4.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  cve-extra-exclusions/linux-yocto: Ignore :cve:`2020-27784`, :cve:`2021-3669`, :cve:`2021-3759`, :cve:`2021-4218`, :cve:`2022-0480`, :cve:`2022-1184`, :cve:`2022-1462`, :cve:`2022-2308`, :cve:`2022-2327`, :cve:`2022-26365`, :cve:`2022-2663`, :cve:`2022-2785`, :cve:`2022-3176`, :cve:`2022-33740`, :cve:`2022-33741`, :cve:`2022-33742`, :cve:`2022-3526`, :cve:`2022-3563`, :cve:`2022-3621`, :cve:`2022-3623`, :cve:`2022-3624`, :cve:`2022-3625`, :cve:`2022-3629`, :cve:`2022-3630`, :cve:`2022-3633`, :cve:`2022-3635`, :cve:`2022-3636`, :cve:`2022-3637`, :cve:`2022-3646` and :cve:`2022-3649`
+-  cve-extra-exclusions/linux-yocto 5.15: Ignore :cve:`2022-3435`, :cve:`2022-3534`, :cve:`2022-3564`, :cve:`2022-3564`, :cve:`2022-3619`, :cve:`2022-3640`, :cve:`2022-42895`, :cve:`2022-42896`, :cve:`2022-4382`, :cve:`2023-0266` and :cve:`2023-0394`
+-  epiphany: Fix :cve:`2023-26081`
+-  git: Ignore :cve:`2023-22743`
+-  go: Fix :cve:`2022-41722`, :cve:`2022-41723`, :cve:`2022-41724`, :cve:`2022-41725` and :cve:`2023-24532`
+-  harfbuzz: Fix :cve:`2023-25193`
+-  libmicrohttpd: Fix :cve:`2023-27371`
+-  libxml2: Fix :cve:`2022-40303` and :cve:`2022-40304`
+-  openssl: Fix :cve:`2023-0464`, :cve:`2023-0465` and :cve:`2023-0466`
+-  python3-setuptools: Fix :cve:`2022-40897`
+-  qemu: Fix :cve:`2022-4144`
+-  screen: Fix :cve:`2023-24626`
+-  shadow: Ignore :cve:`2016-15024`
+-  tiff: Fix :cve:`2022-48281`, :cve:`2023-0795`, :cve:`2023-0796`, :cve:`2023-0797`, :cve:`2023-0798`, :cve:`2023-0799`, :cve:`2023-0800`, :cve:`2023-0801`, :cve:`2023-0802`, :cve:`2023-0803` and :cve:`2023-0804`
+-  vim: Fix :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1264` and :cve:`2023-1355`
+-  xdg-utils: Fix :cve:`2022-4055`
+-  xserver-xorg: Fix for :cve:`2023-1393`
+
+
+Fixes in Yocto-4.1.4
+~~~~~~~~~~~~~~~~~~~~
+
+-  apt: re-enable version check
+-  base-files: Drop localhost.localdomain from hosts file
+-  binutils: Fix nativesdk ld.so search
+-  bitbake: bin/utils: Ensure locale en_US.UTF-8 is available on the system
+-  bitbake: cookerdata: Drop dubious exception handling code
+-  bitbake: cookerdata: Improve early exception handling
+-  bitbake: cookerdata: Remove incorrect SystemExit usage
+-  bitbake: fetch/git: Fix local clone url to make it work with repo
+-  bitbake: toaster: Add refreshed oe-core and poky fixtures
+-  bitbake: toaster: fixtures/README: django 1.8 -> 3.2
+-  bitbake: toaster: fixtures/gen_fixtures.py: update branches
+-  bitbake: utils: Allow to_boolean to support int values
+-  bmap-tools: switch to main branch
+-  build-appliance-image: Update to langdale head revision
+-  buildtools-tarball: Handle spaces within user $PATH
+-  busybox: move hwclock init earlier in startup
+-  cargo.bbclass: use offline mode for building
+-  cpio: Fix wrong CRC with ASCII CRC for large files
+-  cracklib: update github branch to 'main'
+-  cups: add/fix web interface packaging
+-  cups: check :term:`PACKAGECONFIG` for pam feature
+-  cups: use BUILDROOT instead of DESTDIR
+-  cve-check: Fix false negative version issue
+-  devtool/upgrade: do not delete the workspace/recipes directory
+-  dhcpcd: Fix install conflict when enable multilib.
+-  ffmpeg: fix build failure when vulkan is enabled
+-  filemap.py: enforce maximum of 4kb block size
+-  gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch
+-  glibc: Add missing binutils dependency
+-  go: upgrade to 1.19.7
+-  image_types: fix multiubi var init
+-  image_types: fix vname var init in multiubi_mkfs() function
+-  iso-codes: upgrade to 4.13.0
+-  kernel-devsrc: fix mismatched compiler warning
+-  lib/oe/gpg_sign.py: Avoid race when creating .sig files in detach_sign
+-  lib/resulttool: fix typo breaking resulttool log --ptest
+-  libcomps: Fix callback function prototype for PyCOMPS_hash
+-  libdnf: upgrade to 0.70.0
+-  libgit2: update license information
+-  libmicrohttpd: upgrade to 0.9.76
+-  linux-yocto-rt/5.15: upgrade to -rt59
+-  linux-yocto/5.15: upgrade to v5.15.108
+-  linux: inherit pkgconfig in kernel.bbclass
+-  lttng-modules: upgrade to v2.13.9
+-  lua: Fix install conflict when enable multilib.
+-  mdadm: Fix raid0, 06wrmostly and 02lineargrow tests
+-  mesa-demos: packageconfig weston should have a dependency on wayland-protocols
+-  meson: Fix wrapper handling of implicit setup command
+-  meson: remove obsolete RPATH stripping patch
+-  migration-guides: update release notes
+-  oeqa ping.py: avoid busylooping failing ping command
+-  oeqa ping.py: fail test if target IP address has not been set
+-  oeqa rtc.py: skip if read-only-rootfs
+-  oeqa/runtime: clean up deprecated backslash expansion
+-  oeqa/sdk: Improve Meson test
+-  oeqa/selftest/cases/package.py: adding unittest for package rename conflicts
+-  oeqa/selftest/cases/runqemu: update imports
+-  oeqa/selftest/prservice: Improve debug output for failure
+-  oeqa/selftest/reproducible: Split different packages from missing packages output
+-  oeqa/selftest: OESelftestTestContext: convert relative to full path when newbuilddir is provided
+-  oeqa/targetcontrol: do not set dump_host_cmds redundantly
+-  oeqa/targetcontrol: fix misspelled RuntimeError
+-  oeqa/targetcontrol: remove unused imports
+-  oeqa/utils/commands: fix usage of undefined EPIPE
+-  oeqa/utils/commands: remove unused imports
+-  oeqa/utils/qemurunner: replace hard-coded user 'root' in debug output
+-  oeqs/selftest: OESelftestTestContext: replace the os.environ after subprocess.check_output
+-  package.bbclass: check packages name conflict in do_package
+-  pango: upgrade to 1.50.13
+-  piglit: Fix build time dependency
+-  poky.conf: bump version for 4.1.4
+-  populate_sdk_base: add zip options
+-  populate_sdk_ext: Handle spaces within user $PATH
+-  pybootchart: Fix extents handling to account for cpu/io/mem pressure changes
+-  pybootchartui: Fix python syntax issue
+-  report-error: catch Nothing :term:`PROVIDES` error
+-  rpm: Fix hdr_hash function prototype
+-  run-postinsts: Set dependency for ldconfig to avoid boot issues
+-  runqemu: respect :term:`IMAGE_LINK_NAME`
+-  runqemu: Revert "workaround for APIC hang on pre 4.15 kernels on qemux86q"
+-  scripts/lib/buildstats: handle top-level build_stats not being complete
+-  selftest/recipetool: Stop test corrupting tinfoil class
+-  selftest/runtime_test/virgl: Disable for all Rocky Linux
+-  selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting SSTATE_MIRROR
+-  selftest: runqemu: better check for ROOTFS: in the log
+-  selftest: runqemu: use better error message when asserts fail
+-  shadow: Fix can not print full login timeout message
+-  staging/multilib: Fix manifest corruption
+-  staging: Separate out different multiconfig manifests
+-  sudo: upgrade to 1.9.13p3
+-  systemd.bbclass: Add /usr/lib/systemd to searchpaths as well
+-  systemd: add group sgx to udev package
+-  systemd: fix wrong nobody-group assignment
+-  timezone: use 'tz' subdir instead of ${WORKDIR} directly
+-  toolchain-scripts: Handle spaces within user $PATH
+-  tzcode-native: fix build with gcc-13 on host
+-  tzdata: upgrade to 2023c
+-  tzdata: use separate :term:`B` instead of :term:`WORKDIR` for zic output
+-  u-boot: Map arm64 into map for u-boot dts installation
+-  uninative: Upgrade to 3.9 to include glibc 2.37
+-  vala: Fix install conflict when enable multilib.
+-  vim: add missing pkgconfig inherit
+-  vim: set modified-by to the recipe :term:`MAINTAINER`
+-  vim: upgrade to 9.0.1429
+-  xcb-proto: Fix install conflict when enable multilib.
+
+
+Known Issues in Yocto-4.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alexander Kanavin
+-  Andrew Geissler
+-  Arturo Buzarra
+-  Bhabu Bindu
+-  Bruce Ashfield
+-  Carlos Alberto Lopez Perez
+-  Chee Yang Lee
+-  Chris Elledge
+-  Christoph Lauer
+-  Dmitry Baryshkov
+-  Enrico Jörns
+-  Fawzi KHABER
+-  Frank de Brabander
+-  Frederic Martinsons
+-  Geoffrey GIRY
+-  Hitendra Prajapati
+-  Jose Quaresma
+-  Kenfe-Mickael Laventure
+-  Khem Raj
+-  Marek Vasut
+-  Martin Jansa
+-  Michael Halstead
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Ming Liu
+-  Mingli Yu
+-  Narpat Mali
+-  Pavel Zhukov
+-  Peter Marko
+-  Piotr Łobacz
+-  Randy MacLeod
+-  Richard Purdie
+-  Robert Yang
+-  Romuald JEANNE
+-  Romuald Jeanne
+-  Ross Burton
+-  Siddharth
+-  Siddharth Doshi
+-  Soumya
+-  Steve Sakoman
+-  Sudip Mukherjee
+-  Tim Orling
+-  Tobias Hagelborn
+-  Tom Hochstein
+-  Trevor Woerner
+-  Wang Mingyu
+-  Xiangyu Chen
+-  Zoltan Boszormenyi
+
+
+Repositories / Downloads for Yocto-4.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.4 </poky/log/?h=yocto-4.1.4>`
+-  Git Revision: :yocto_git:`3e95f268ce04b49ba6731fd4bbc53b1693c21963 </poky/commit/?id=3e95f268ce04b49ba6731fd4bbc53b1693c21963>`
+-  Release Artefact: poky-3e95f268ce04b49ba6731fd4bbc53b1693c21963
+-  sha: 54798c4b519f5e11f409e1fd074bea1bc0a1b80672aa60dddbac772c8e4d838b
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.4/poky-3e95f268ce04b49ba6731fd4bbc53b1693c21963.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.4/poky-3e95f268ce04b49ba6731fd4bbc53b1693c21963.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`langdale </openembedded-core/log/?h=langdale>`
+-  Tag:  :oe_git:`yocto-4.1.4 </openembedded-core/log/?h=yocto-4.1.4>`
+-  Git Revision: :oe_git:`78211cda40eb018a3aa535c75b61e87337236628 </openembedded-core/commit/?id=78211cda40eb018a3aa535c75b61e87337236628>`
+-  Release Artefact: oecore-78211cda40eb018a3aa535c75b61e87337236628
+-  sha: 1303d836bae54c438c64d6b9f068eb91c32be4cc1779e89d0f2d915a55d59b15
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.4/oecore-78211cda40eb018a3aa535c75b61e87337236628.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.4/oecore-78211cda40eb018a3aa535c75b61e87337236628.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.4 </meta-mingw/log/?h=yocto-4.1.4>`
+-  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
+-  Release Artefact: meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c
+-  sha: 704f2940322b81ce774e9cbd27c3cfa843111d497dc7b1eeaa39cd694d9a2366
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.4/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.4/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.2 </bitbake/log/?h=2.2>`
+-  Tag:  :oe_git:`yocto-4.1.4 </bitbake/log/?h=yocto-4.1.4>`
+-  Git Revision: :oe_git:`5b105e76dd7de3b9a25b17b397f2c12c80048894 </bitbake/commit/?id=5b105e76dd7de3b9a25b17b397f2c12c80048894>`
+-  Release Artefact: bitbake-5b105e76dd7de3b9a25b17b397f2c12c80048894
+-  sha: 2cd6448138816f5a906f9927c6b6fdc5cf24981ef32b6402312f52ca490edb4f
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.4/bitbake-5b105e76dd7de3b9a25b17b397f2c12c80048894.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.4/bitbake-5b105e76dd7de3b9a25b17b397f2c12c80048894.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
+-  Tag: :yocto_git:`yocto-4.1.4 </yocto-docs/log/?h=yocto-4.1.4>`
+-  Git Revision: :yocto_git:`da685fc5e69d49728e3ffd6c4d623e7e1745059d </yocto-docs/commit/?id=da685fc5e69d49728e3ffd6c4d623e7e1745059d>`
+
-- 
2.34.1


