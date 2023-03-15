Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E03C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 02:35:42 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.3112.1678847740462270277
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 19:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=IWrKz/pg;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678847740; x=1710383740;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bKJDRPZ8CdHZAGlcIKGiMS+Sdo1eOW9FGBN4XnixIL0=;
  b=IWrKz/pgf6WWyU7HL9dEZlbJw3ACkVlfEvuOBzZ0XcPVp5PZ5HxHdoAL
   hJ6RJxLJQkvJy2DI1X5qk8mLf5A/RJ/5OnJmSe7988TM93/ENoXca2F2J
   KCZgAQT4hJ4rsxFiEh3r78inqaNR5COn21XAjbab3JVePJ4gp48BZ0ZuT
   t0r5mc8UnJ29CkXX+hwKDZTNP5vR9+Ayk6a0D7eZFdSnr5PBwZfqa4DdM
   Z/Ue0Fx/Atm6MIE5MlLfY04rEuNrhuJ7A3JI1JXFCVvTFDXS8jA+8+xpg
   nLpgIjUX6LDKLWQYctS+aPTSQc9aDz2LcsaDzO0aMA+dUSBoUTwcLzWDt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="337617777"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="337617777"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 19:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="748259337"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="748259337"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.12])
  by fmsmga004.fm.intel.com with ESMTP; 14 Mar 2023 19:35:39 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: add release-notes for 4.1.3
Date: Wed, 15 Mar 2023 10:31:38 +0800
Message-Id: <20230315023138.1783298-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Mar 2023 02:35:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3793

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.1.rst          |   1 +
 .../migration-guides/release-notes-4.1.3.rst  | 317 ++++++++++++++++++
 2 files changed, 318 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.1.3.rst

diff --git a/documentation/migration-guides/release-4.1.rst b/documentation/migration-guides/release-4.1.rst
index 437832e3b..dbca7c7e0 100644
--- a/documentation/migration-guides/release-4.1.rst
+++ b/documentation/migration-guides/release-4.1.rst
@@ -9,3 +9,4 @@ Release 4.1 (langdale)
    release-notes-4.1
    release-notes-4.1.1
    release-notes-4.1.2
+   release-notes-4.1.3
diff --git a/documentation/migration-guides/release-notes-4.1.3.rst b/documentation/migration-guides/release-notes-4.1.3.rst
new file mode 100644
index 000000000..adc95ae92
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.1.3.rst
@@ -0,0 +1,317 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.1.3 (Langdale)
+----------------------------------------
+
+Security Fixes in Yocto-4.1.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  apr-util: Fix :cve:`2022-25147`
+-  apr: Fix :cve:`2022-24963` and :cve:`2022-28331`
+-  bind: Fix :cve:`2022-3094`, :cve:`2022-3736` and :cve:`2022-3924`
+-  curl: Fix :cve:`2022-43551` and :cve:`2022-43552`
+-  dbus: Fix :cve:`2022-42010`, :cve:`2022-42011` and :cve:`2022-42012`
+-  git: Fix  :cve:`2022-23521`, :cve:`2022-39253`, :cve:`2022-39260` and :cve:`2022-41903`
+-  git: Ignore :cve:`2022-41953`
+-  go: Fix :cve:`2022-41717` and :cve:`2022-41720`
+-  grub2: Fix :cve:`2022-2601` and :cve:`2022-3775`
+-  less: Fix :cve:`2022-46663`
+-  libarchive: Fix :cve:`2022-36227`
+-  libksba: Fix :cve:`2022-47629`
+-  openssl: Fix :cve:`2022-3996`
+-  pkgconf: Fix :cve:`2023-24056`
+-  ppp: Fix :cve:`2022-4603`
+-  sudo: Fix :cve:`2023-22809`
+-  tar: Fix :cve:`2022-48303`
+-  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054`, :cve:`2023-0288`, :cve:`2023-0433` and :cve:`2023-0512`
+-  xserver-xorg: Fix :cve:`2023-0494`
+-  xwayland: Fix :cve:`2023-0494`
+
+
+Fixes in Yocto-4.1.3
+~~~~~~~~~~~~~~~~~~~~
+
+-  apr-util: Upgrade to 1.6.3
+-  apr: Upgrade to 1.7.2
+-  apt: fix do_package_qa failure
+-  at: Change when files are copied
+-  base.bbclass: Fix way to check ccache path
+-  bblayers/makesetup: skip git repos that are submodules
+-  bblayers/setupwriters/oe-setup-layers: create dir if not exists
+-  bind: Upgrade to 9.18.11
+-  bitbake-layers: fix a typo
+-  bitbake: bb/utils: include SSL certificate paths in export_proxies
+-  bitbake: fetch2/git: Clarify the meaning of namespace
+-  bitbake: fetch2/git: Prevent git fetcher from fetching gitlab repository metadata
+-  bitbake: process: log odd unlink events with bitbake.sock
+-  bitbake: server/process: Add bitbake.sock race handling
+-  bitbake: siggen: Fix inefficient string concatenation
+-  bootchart2: Fix usrmerge support
+-  bsp-guide: fix broken git URLs and missing word
+-  build-appliance-image: Update to langdale head revision
+-  buildtools-tarball: set pkg-config search path
+-  busybox: Fix depmod patch
+-  busybox: always start do_compile with orig config files
+-  busybox: rm temporary files if do_compile was interrupted
+-  cairo: fix CVE patches assigned wrong CVE number
+-  classes/fs-uuid: Fix command output decoding issue
+-  classes/populate_sdk_base: Append cleandirs
+-  classes: image: Set empty weak default IMAGE_LINGUAS
+-  cml1: remove redundant addtask
+-  core-image.bbclass: Fix missing leading whitespace with ':append'
+-  createrepo-c: Include missing rpm/rpmstring.h
+-  curl: don't enable debug builds
+-  curl: fix dependencies when building with ldap/ldaps
+-  cve-check: write the cve manifest to IMGDEPLOYDIR
+-  cve-update-db-native: avoid incomplete updates
+-  cve-update-db-native: show IP on failure
+-  dbus: Upgrade to 1.14.6
+-  dev-manual: common-tasks.rst: add link to FOSDEM 2023 video
+-  dev-manual: fix old override syntax
+-  devshell: Do not add scripts/git-intercept to PATH
+-  devtool: fix devtool finish when gitmodules file is empty
+-  devtool: process local files only for the main branch
+-  dhcpcd: backport two patches to fix runtime error
+-  dhcpcd: fix dhcpcd start failure on qemuppc64
+-  diffutils: Upgrade to 3.9
+-  ffmpeg: fix configure failure on noexec /tmp host
+-  gdk-pixbuf: do not use tools from gdk-pixbuf-native when building tests
+-  git: Upgrade to 2.37.6
+-  glslang: branch rename master -> main
+-  go: Upgrade to 1.19.4
+-  gstreamer1.0 : Revert  "disable flaky gstbin:test_watch_for_state_change test" and Fix race conditions in gstbin tests with upstream solution
+-  harfbuzz: remove bindir only if it exists
+-  httpserver: add error handler that write to the logger
+-  image.bbclass: print all QA functions exceptions
+-  kernel-fitimage: Adjust order of dtb/dtbo files
+-  kernel-fitimage: Allow user to select dtb when multiple dtb exists
+-  kernel-yocto: fix kernel-meta data detection
+-  kernel/linux-kernel-base: Fix kernel build artefact determinism issues
+-  lib/buildstats: handle tasks that never finished
+-  lib/oe/reproducible: Use git log without gpg signature
+-  libarchive: Upgrade to 3.6.2
+-  libc-locale: Fix on target locale generation
+-  libgit2: Upgrade to 1.5.1
+-  libjpeg-turbo: Upgrade to 2.1.5.1
+-  libksba: Upgrade to 1.6.3
+-  libpng: Enable NEON for aarch64 to enensure consistency with arm32.
+-  librsvg: Only enable the Vala bindings if GObject Introspection is enabled
+-  librsvg: enable vapi build
+-  libseccomp: fix for the ptest result format
+-  libseccomp: fix typo in DESCRIPTION
+-  libssh2: Clean up ptest patch/coverage
+-  libtirpc: Check if file exists before operating on it
+-  libusb1: Link with latomic only if compiler has no atomic builtins
+-  libusb1: Strip trailing whitespaces
+-  linux-firmware: add yamato fw files to qcom-adreno-a2xx package
+-  linux-firmware: properly set license for all Qualcomm firmware
+-  linux-firmware: Upgrade to 20230210
+-  linux-yocto/5.15: fix perf build with clang
+-  linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
+-  linux-yocto/5.15: ltp and squashfs fixes
+-  linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user copy
+-  linux-yocto/5.15: Upgrade to v5.15.91
+-  linux-yocto/5.19: fix perf build with clang
+-  linux-yocto/5.19: powerpc: Fix reschedule bug in KUAP-unlocked user copy
+-  lsof: fix old override syntax
+-  lttng-modules: Fix for 5.10.163 kernel version
+-  lttng-modules: fix for kernel 6.2+
+-  lttng-modules: Upgrade to 2.13.8
+-  lttng-tools: Upgrade to 2.13.9
+-  make-mod-scripts: Ensure kernel build output is deterministic
+-  manuals: update patchwork instance URL
+-  mesa-gl: gallium is required when enabling x11
+-  meta: remove True option to getVar and getVarFlag calls (again)
+-  migration-guides: add release-notes for 4.0.7
+-  native: Drop special variable handling
+-  numactl: skip test case when target platform doesn't have 2 CPU node
+-  oeqa context.py: fix --target-ip comment to include ssh port number
+-  oeqa dump.py: add error counter and stop after 5 failures
+-  oeqa qemurunner.py: add timeout to QMP calls
+-  oeqa qemurunner.py: try to avoid reading one character at a time
+-  oeqa qemurunner: read more data at a time from serial
+-  oeqa ssh.py: add connection keep alive options to ssh client
+-  oeqa ssh.py: fix hangs in run()
+-  oeqa ssh.py: move output prints to new line
+-  oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with a signal
+-  oeqa/rpm.py: Increase timeout and add debug output
+-  oeqa/selftest/debuginfod: improve testcase
+-  oeqa/selftest/locales: Add selftest for locale generation/presence
+-  oeqa/selftest/resulttooltests: fix minor typo
+-  openssl: Upgrade to 3.0.8
+-  opkg: ensure opkg uses private gpg.conf when applying keys.
+-  pango: Upgrade to 1.50.12
+-  perf: Enable debug/source packaging
+-  pkgconf: Upgrade to 1.9.4
+-  poky.conf: Update SANITY_TESTED_DISTROS to match autobuilder
+-  poky.conf: bump version for 4.1.3
+-  populate_sdk_ext.bbclass: Fix missing leading whitespace with ':append'
+-  profile-manual: update WireShark hyperlinks
+-  ptest-packagelists.inc: Fix missing leading whitespace with ':append'
+-  python3-pytest: depend on python3-tomli instead of python3-toml
+-  quilt: fix intermittent failure in faildiff.test
+-  quilt: use upstreamed faildiff.test fix
+-  recipe_sanity: fix old override syntax
+-  ref-manual: Fix invalid feature name
+-  ref-manual: update DEV_PKG_DEPENDENCY in variables
+-  ref-manual: variables.rst: fix broken hyperlink
+-  rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively
+-  runqemu: kill qemu if it hangs
+-  rust: Do not use default compiler flags defined in CC crate
+-  scons.bbclass: Make MAXLINELENGTH overridable
+-  scons: Pass MAXLINELENGTH to scons invocation
+-  sdkext/cases/devtool: pass a logger to HTTPService
+-  selftest/virgl: use pkg-config from the host
+-  spirv-headers/spirv-tools: set correct branch name
+-  sstate.bbclass: Fetch non-existing local .sig files if needed
+-  sstatesig: Improve output hash calculation
+-  sudo: Upgrade to 1.9.12p2
+-  system-requirements.rst: Add Fedora 36, AlmaLinux 8.7 & 9.1, and OpenSUSE 15.4 to list of supported distros
+-  testimage: Fix error message to reflect new syntax
+-  tiff: Add packageconfig knob for webp
+-  toolchain-scripts: compatibility with unbound variable protection
+-  uninative: Upgrade to 3.8.1 to include libgcc
+-  update-alternatives: fix typos
+-  vim: Upgrade to 9.0.1293
+-  vulkan-samples: branch rename master -> main
+-  wic: Fix usage of fstype=none in wic
+-  wireless-regdb: Upgrade to 2023.02.13
+-  xserver-xorg: Upgrade to 21.1.7
+-  xwayland: Upgrade to 22.1.8
+
+
+Known Issues in Yocto-4.1.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  N/A
+
+
+Contributors to Yocto-4.1.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Adrian Freihofer
+-  Alejandro Hernandez Samaniego
+-  Alex Kiernan
+-  Alexander Kanavin
+-  Alexis Lothoré
+-  Anton Antonov
+-  Antonin Godard
+-  Armin Kuster
+-  Arnout Vandecappelle
+-  Benoît Mauduit
+-  Bruce Ashfield
+-  Carlos Alberto Lopez Perez
+-  Changqing Li
+-  Charlie Johnston
+-  Chee Yang Lee
+-  Chen Qi
+-  Dmitry Baryshkov
+-  Enguerrand de Ribaucourt
+-  Etienne Cordonnier
+-  Fawzi KHABER
+-  Federico Pellegrin
+-  Frank de Brabander
+-  Harald Seiler
+-  He Zhe
+-  Jan Kircher
+-  Jermain Horsman
+-  Jose Quaresma
+-  Joshua Watt
+-  Kai Kang
+-  Khem Raj
+-  Louis Rannou
+-  Luis
+-  Marek Vasut
+-  Markus Volk
+-  Marta Rybczynska
+-  Martin Jansa
+-  Mateusz Marciniec
+-  Mauro Queiros
+-  Michael Halstead
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Mingli Yu
+-  Narpat Mali
+-  Niko Mauno
+-  Pavel Zhukov
+-  Pawel Zalewski
+-  Peter Kjellerstedt
+-  Petr Kubizňák
+-  Quentin Schulz
+-  Randy MacLeod
+-  Richard Purdie
+-  Robert Joslyn
+-  Rodolfo Quesada Zumbado
+-  Ross Burton
+-  Sakib Sajal
+-  Sandeep Gundlupet Raju
+-  Saul Wold
+-  Siddharth Doshi
+-  Steve Sakoman
+-  Thomas Roos
+-  Tobias Hagelborn
+-  Ulrich Ölmann
+-  Vivek Kumbhar
+-  Wang Mingyu
+-  Xiangyu Chen
+-  leimaohui
+
+
+Repositories / Downloads for Yocto-4.1.3
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.3 </poky/log/?h=yocto-4.1.3>`
+-  Git Revision: :yocto_git:`91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f </poky/commit/?id=91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f>`
+-  Release Artefact: poky-91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f
+-  sha: 94e4615eba651fe705436b29b854458be050cc39db936295f9d5eb7e85d3eff1
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/poky-91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.3/poky-91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`langdale </openembedded-core/log/?h=langdale>`
+-  Tag:  :oe_git:`yocto-4.1.3 </openembedded-core/log/?h=yocto-4.1.3>`
+-  Git Revision: :oe_git:`b995ea45773211bd7bdd60eabcc9bbffda6beb5c </openembedded-core/commit/?id=b995ea45773211bd7bdd60eabcc9bbffda6beb5c>`
+-  Release Artefact: oecore-b995ea45773211bd7bdd60eabcc9bbffda6beb5c
+-  sha: 952e19361f205ee91b74e5caaa835d58fa6dd0d92ddaed50d4cd3f3fa56fab63
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/oecore-b995ea45773211bd7bdd60eabcc9bbffda6beb5c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.3/oecore-b995ea45773211bd7bdd60eabcc9bbffda6beb5c.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.3 </meta-mingw/log/?h=yocto-4.1.3>`
+-  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
+-  Release Artefact: meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c
+-  sha: 704f2940322b81ce774e9cbd27c3cfa843111d497dc7b1eeaa39cd694d9a2366
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.3/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.2 </bitbake/log/?h=2.2>`
+-  Tag:  :oe_git:`yocto-4.1.3 </bitbake/log/?h=yocto-4.1.3>`
+-  Git Revision: :oe_git:`592ee222a1c6da42925fb56801f226884b6724ec </bitbake/commit/?id=592ee222a1c6da42925fb56801f226884b6724ec>`
+-  Release Artefact: bitbake-592ee222a1c6da42925fb56801f226884b6724ec
+-  sha: 79c32f2ca66596132e32a45654ce0e9dd42b6b39186eff3540a9d6b499fe952c
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/bitbake-592ee222a1c6da42925fb56801f226884b6724ec.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.3/bitbake-592ee222a1c6da42925fb56801f226884b6724ec.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
+-  Tag: :yocto_git:`yocto-4.1.3 </yocto-docs/log/?h=yocto-4.1.3>`
+-  Git Revision: :yocto_git:`3de2ad1f8ff87aeec30088779267880306a0f31a </yocto-docs/commit/?id=3de2ad1f8ff87aeec30088779267880306a0f31a>`
+
-- 
2.34.1


