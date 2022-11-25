Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78604C4321E
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 09:57:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.43914.1669370219299346033
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Nov 2022 01:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=M7sFOy4G;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669370219; x=1700906219;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XdU7EdBLjSLVLMVO/BYn4PCAGtWi2mhmlDAu5avDtWQ=;
  b=M7sFOy4GC/wA0ZJiThGRcxZiJZrbDgqY1z/sQac/a3F8D9r7suAGF82F
   4xGqt0dzzlbbAJ0f9eZXjSAOjKqkwZDz27o3MayN2CiwLFppFu+BXYxQz
   K0EUyp3FlnOHCuTZJOtEzvUAk3TJCTDSHjyhzpYqO4KHJKhZKdTl5DORR
   qhKRVMa4VFi/UEXs6dwzgPo9MPPE05DHU4nkOIW4/2x+bjOzD7FCgpZ4E
   /NKMlAwgGhN6mxZE1urONKPUOqozTWwbq4/L7uPDS2VujnTWBE5xO1c8+
   Gz+ejq4Xog7Gr6hODldi2UyQDZgkaaWZ4rJ6caah5fL4+sfB5AT2G0TJg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="294154911"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="294154911"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 01:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="817094679"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="817094679"
Received: from cheeyang-desk2.png.intel.com ([172.30.130.125])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2022 01:56:57 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [patch v2] migration-guides: add release-notes for 4.1.1
Date: Fri, 25 Nov 2022 18:01:05 +0800
Message-Id: <20221125100105.1646449-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Nov 2022 09:57:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3507

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---

v2 add more fixed CVE for openssl 

 .../migration-guides/release-4.1.rst          |   1 +
 .../migration-guides/release-notes-4.1.1.rst  | 317 ++++++++++++++++++
 2 files changed, 318 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.1.1.rst

diff --git a/documentation/migration-guides/release-4.1.rst b/documentation/migration-guides/release-4.1.rst
index 8ebf4a4c9..c91724c5e 100644
--- a/documentation/migration-guides/release-4.1.rst
+++ b/documentation/migration-guides/release-4.1.rst
@@ -5,3 +5,4 @@ Release 4.1 (langdale)
 
    migration-4.1
    release-notes-4.1
+   release-notes-4.1.1
diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
new file mode 100644
index 000000000..cd52ab3b3
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -0,0 +1,317 @@
+Release notes for Yocto-4.1.1 (Langdale)
+----------------------------------------
+
+Security Fixes in Yocto-4.1.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  curl: Fix :cve:`2022-32221`, :cve:`2022-35260`, :cve:`2022-42915` and :cve:`2022-42916`
+-  libx11: Fix :cve:`2022-3554`
+-  lighttpd: Fix :cve:`2022-41556`
+-  openssl: Fix :cve:`2022-3358`, :cve:`2022-3602` and :cve:`2022-3786`
+-  pixman: Fix :cve:`2022-44638`
+-  qemu: Fix :cve:`2022-3165`
+-  sudo: Fix :cve:`2022-43995`
+-  tiff: Fix :cve:`2022-3599`, :cve:`2022-3597`, :cve:`2022-3626`, :cve:`2022-3627`, :cve:`2022-3570` and :cve:`2022-3598`
+-  xserver-xorg: Fix :cve:`2022-3550` and :cve:`2022-3551`
+-  xserver-xorg: Ignore :cve:`2022-3553`
+
+
+Fixes in Yocto-4.1.1
+~~~~~~~~~~~~~~~~~~~~
+
+-  Add 4.1 migration guide & release notes
+-  bitbake: asyncrpc: serv: correct closed client socket detection
+-  bitbake: bitbake-user-manual: details about variable flags starting with underscore
+-  bitbake: bitbake: bitbake-layers: checkout layer(s) branch when clone exists
+-  bitbake: bitbake: user-manual: inform about spaces in :remove
+-  bitbake: doc: bitbake-user-manual: expand description of BB_PRESSURE_MAX variables
+-  bitbake: fetch2/git: don't set core.fsyncobjectfiles=0
+-  bitbake: tests/fetch: Allow handling of a file:// url within a submodule
+-  bitbake: tests: bb.tests.fetch.URLHandle: add 2 new tests
+-  bitbake: utils/ply: Update md5 to better report errors with hashlib
+-  bluez5: add dbus to RDEPENDS
+-  build-appliance-image: Update to langdale head revision
+-  buildconf: compare abspath
+-  buildtools-tarball: export certificates to python and curl
+-  cmake-native: Fix host tool contamination
+-  create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED
+-  create-spdx: Remove ";name=..." for downloadLocation
+-  cve-update-db-native: add timeout to urlopen() calls
+-  dev-manual: common-tasks.rst: add reference to "do_clean" task
+-  dev-manual: common-tasks.rst: add reference to "do_listtasks" task
+-  docs: add support for langdale (4.1) release
+-  dropbear: add pam to PACKAGECONFIG
+-  externalsrc.bbclass: fix git repo detection
+-  externalsrc.bbclass: Remove a trailing slash from ${B}
+-  externalsrc: move back to classes
+-  gcc: Allow -Wno-error=poison-system-directories to take effect
+-  glib-2.0: fix rare GFileInfo test case failure
+-  gnutls: Unified package names to lower-case
+-  gnutls: upgrade 3.7.7 -> 3.7.8
+-  grub: disable build on armv7ve/a with hardfp
+-  gstreamer1.0-libav: fix errors with ffmpeg 5.x
+-  ifupdown: upgrade 0.8.37 -> 0.8.39
+-  insane.bbclass: Allow hashlib version that only accepts on parameter
+-  install-buildtools: support buildtools-make-tarball and update to 4.1
+-  kern-tools: fix relative path processing
+-  kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate
+-  kernel-yocto: improve fatal error messages of symbol_why.py
+-  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
+-  libcap: upgrade 2.65 -> 2.66
+-  libical: upgrade 3.0.14 -> 3.0.15
+-  libksba: upgrade 1.6.0 -> 1.6.2
+-  libsdl2: upgrade 2.24.0 -> 2.24.1
+-  lighttpd: upgrade 1.4.66 -> 1.4.67
+-  linux-firmware: package amdgpu firmware
+-  linux-firmware: split rtl8761 firmware
+-  linux-yocto/5.15: update to v5.15.72
+-  linux-yocto/5.19: update to v5.19.14
+-  linux-yocto: add efi entry for machine features
+-  lttng-modules: upgrade 2.13.4 -> 2.13.5
+-  lttng-ust: upgrade 2.13.4 -> 2.13.5
+-  manuals: add reference to "do_configure" task
+-  manuals: add reference to the "do_compile" task
+-  manuals: add reference to the "do_install" task
+-  manuals: add reference to the "do_kernel_configcheck" task
+-  manuals: add reference to the "do_populate_sdk" task
+-  manuals: add references to "do_package_write_*" tasks
+-  manuals: add references to "do_populate_sysroot" task
+-  manuals: add references to the "do_build" task
+-  manuals: add references to the "do_bundle_initramfs" task
+-  manuals: add references to the "do_cleanall" task
+-  manuals: add references to the "do_deploy" task
+-  manuals: add references to the "do_devshell" task
+-  manuals: add references to the "do_fetch" task
+-  manuals: add references to the "do_image" task
+-  manuals: add references to the "do_kernel_configme" task
+-  manuals: add references to the "do_package" task
+-  manuals: add references to the "do_package_qa" task
+-  manuals: add references to the "do_patch" task
+-  manuals: add references to the "do_rootfs" task
+-  manuals: add references to the "do_unpack" task
+-  manuals: fix misc typos
+-  manuals: improve initramfs details
+-  manuals: updates for building on Windows (WSL 2)
+-  mesa: only apply patch to fix ALWAYS_INLINE for native
+-  mesa: update 22.2.0 -> 22.2.2
+-  meson: make wrapper options sub-command specific
+-  meson: upgrade 0.63.2 -> 0.63.3
+-  migration guides: 3.4: remove spurious space in example
+-  migration guides: add release notes for 4.0.4
+-  migration-general: add section on using buildhistory
+-  migration-guides/release-notes-4.1.rst: add more known issues
+-  migration-guides/release-notes-4.1.rst: update Repositories / Downloads
+-  migration-guides: add known issues for 4.1
+-  migration-guides: add reference to the "do_shared_workdir" task
+-  migration-guides: use contributor real name
+-  migration-guides: use contributor real name
+-  mirrors.bbclass: use shallow tarball for binutils-native
+-  mtools: upgrade 4.0.40 -> 4.0.41
+-  numactl: upgrade 2.0.15 -> 2.0.16
+-  oe/packagemanager/rpm: don't leak file objects
+-  openssl: export necessary env vars in SDK
+-  openssl: Fix SSL_CERT_FILE to match ca-certs location
+-  openssl: Upgrade 3.0.5 -> 3.0.7
+-  opkg-utils: use a git clone, not a dynamic snapshot
+-  overlayfs: Allow not used mount points
+-  overview-manual: concepts.rst: add reference to "do_packagedata" task
+-  overview-manual: concepts.rst: add reference to "do_populate_sdk_ext" task
+-  overview-manual: concepts.rst: fix formating and add references
+-  own-mirrors: add crate
+-  pango: upgrade 1.50.9 -> 1.50.10
+-  perf: Depend on native setuptools3
+-  poky.conf: bump version for 4.1.1
+-  poky.conf: remove Ubuntu 21.10
+-  populate_sdk_base: ensure ptest-pkgs pulls in ptest-runner
+-  psplash: add psplash-default in rdepends
+-  qemu-native: Add PACKAGECONFIG option for jack
+-  quilt: backport a patch to address grep 3.8 failures
+-  ref-manual/faq.rst: update references to products built with OE / Yocto Project
+-  ref-manual/variables.rst: clarify sentence
+-  ref-manual: add a note to ssh-server-dropbear feature
+-  ref-manual: add CVE_CHECK_SHOW_WARNINGS
+-  ref-manual: add CVE_DB_UPDATE_INTERVAL
+-  ref-manual: add DEV_PKG_DEPENDENCY
+-  ref-manual: add DISABLE_STATIC
+-  ref-manual: add FIT_PAD_ALG
+-  ref-manual: add KERNEL_DEPLOY_DEPEND
+-  ref-manual: add missing features
+-  ref-manual: add MOUNT_BASE variable
+-  ref-manual: add overlayfs class variables
+-  ref-manual: add OVERLAYFS_ETC_EXPOSE_LOWER
+-  ref-manual: add OVERLAYFS_QA_SKIP
+-  ref-manual: add previous overlayfs-etc variables
+-  ref-manual: add pypi class
+-  ref-manual: add SDK_TOOLCHAIN_LANGS
+-  ref-manual: add section for create-spdx class
+-  ref-manual: add serial-autologin-root to IMAGE_FEATURES documentation
+-  ref-manual: add UBOOT_MKIMAGE_KERNEL_TYPE
+-  ref-manual: add WATCHDOG_TIMEOUT to variable glossary
+-  ref-manual: add WIRELESS_DAEMON
+-  ref-manual: classes.rst: add links to all references to a class
+-  ref-manual: complementary package installation recommends
+-  ref-manual: correct default for BUILDHISTORY_COMMIT
+-  ref-manual: document new github-releases class
+-  ref-manual: expand documentation on image-buildinfo class
+-  ref-manual: faq.rst: reorganize into subsections, contents at top
+-  ref-manual: remove reference to largefile in DISTRO_FEATURES
+-  ref-manual: remove reference to testimage-auto class
+-  ref-manual: system-requirements: Ubuntu 22.04 now supported
+-  ref-manual: tasks.rst: add reference to the "do_image_complete" task
+-  ref-manual: tasks.rst: add reference to the "do_kernel_checkout" task
+-  ref-manual: tasks.rst: add reference to the "do_kernel_metadata" task
+-  ref-manual: tasks.rst: add reference to the "do_validate_branches" task
+-  ref-manual: tasks.rst: add references to the "do_cleansstate" task
+-  ref-manual: update buildpaths QA check documentation
+-  ref-manual: update pypi documentation for CVE_PRODUCT default in 4.1
+-  ref-manual: variables.rst: add reference to "do_populate_lic" task
+-  release-notes-4.1.rst remove bitbake-layers subcommand argument
+-  runqemu: Do not perturb script environment
+-  runqemu: Fix gl-es argument from causing other arguments to be ignored
+-  rust-target-config: match riscv target names with what rust expects
+-  rust: install rustfmt for riscv32 as well
+-  sanity: check for GNU tar specifically
+-  scripts/oe-check-sstate: cleanup
+-  scripts/oe-check-sstate: force build to run for all targets, specifically populate_sysroot
+-  sdk-manual: correct the bitbake target for a unified sysroot build
+-  shadow: update 4.12.1 -> 4.12.3
+-  systemd: add systemd-creds and systemd-cryptenroll to systemd-extra-utils
+-  test-manual: fix typo in machine name
+-  tiff: fix a typo for :cve:`2022-2953`.patch
+-  u-boot: Add savedefconfig task
+-  u-boot: Remove duplicate inherit of cml1
+-  uboot-sign: Fix using wrong KEY_REQ_ARGS
+-  Update documentation for classes split
+-  vim: upgrade to 9.0.0820
+-  vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in do_unpack
+-  wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
+-  wic: swap partitions are not added to fstab
+-  wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
+-  xserver-xorg: move some recommended dependencies in required
+-  zlib: do out-of-tree builds
+-  zlib: upgrade 1.2.12 -> 1.2.13
+-  zlib: use .gz archive and set a PREMIRROR
+
+
+Known Issues in Yocto-4.1.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+
+Contributors to Yocto-4.1.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Adrian Freihofer
+-  Alex Kiernan
+-  Alexander Kanavin
+-  Bartosz Golaszewski
+-  Bernhard Rosenkränzer
+-  Bruce Ashfield
+-  Chen Qi
+-  Christian Eggers
+-  Claus Stovgaard
+-  Ed Tanous
+-  Etienne Cordonnier
+-  Frank de Brabander
+-  Hitendra Prajapati
+-  Jan-Simon Moeller
+-  Jeremy Puhlman
+-  Johan Korsnes
+-  Jon Mason
+-  Jose Quaresma
+-  Joshua Watt
+-  Justin Bronder
+-  Kai Kang
+-  Keiya Nobuta
+-  Khem Raj
+-  Lee Chee Yang
+-  Liam Beguin
+-  Luca Boccassi
+-  Mark Asselstine
+-  Mark Hatle
+-  Markus Volk
+-  Martin Jansa
+-  Michael Opdenacker
+-  Ming Liu
+-  Mingli Yu
+-  Paul Eggleton
+-  Peter Kjellerstedt
+-  Qiu, Zheng
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert Joslyn
+-  Ross Burton
+-  Sean Anderson
+-  Sergei Zhmylev
+-  Steve Sakoman
+-  Takayasu Ito
+-  Teoh Jay Shen
+-  Thomas Perrot
+-  Tim Orling
+-  Vincent Davis Jr
+-  Vyacheslav Yurkov
+-  Ciaran Courtney
+-  Wang Mingyu
+
+
+Repositories / Downloads for Yocto-4.1.1
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.1 </poky/log/?h=yocto-4.1.1>`
+-  Git Revision: :yocto_git:`d3cda9a3e0837eb2ac5482f5f2bd8e55e874feff </poky/commit/?id=d3cda9a3e0837eb2ac5482f5f2bd8e55e874feff>`
+-  Release Artefact: poky-d3cda9a3e0837eb2ac5482f5f2bd8e55e874feff
+-  sha: e92b694fbb74a26c7a875936dfeef4a13902f24b06127ee52f4d1c1e4b03ec24
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.1/poky-d3cda9a3e0837eb2ac5482f5f2bd8e55e874feff.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.1/poky-d3cda9a3e0837eb2ac5482f5f2bd8e55e874feff.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`langdale </openembedded-core/log/?h=langdale>`
+-  Tag:  :oe_git:`yocto-4.1.1 </openembedded-core/log/?h=yocto-4.1.1>`
+-  Git Revision: :oe_git:`9237ffc4feee2dd6ff5bdd672072509ef9e82f6d </openembedded-core/commit/?id=9237ffc4feee2dd6ff5bdd672072509ef9e82f6d>`
+-  Release Artefact: oecore-9237ffc4feee2dd6ff5bdd672072509ef9e82f6d
+-  sha: d73198aef576f0fca0d746f9d805b1762c19c31786bc3f7d7326dfb2ed6fc1be
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.1/oecore-9237ffc4feee2dd6ff5bdd672072509ef9e82f6d.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.1/oecore-9237ffc4feee2dd6ff5bdd672072509ef9e82f6d.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.1 </meta-mingw/log/?h=yocto-4.1.1>`
+-  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
+-  Release Artefact: meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c
+-  sha: 704f2940322b81ce774e9cbd27c3cfa843111d497dc7b1eeaa39cd694d9a2366
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.1/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.1/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.2 </bitbake/log/?h=2.2>`
+-  Tag:  :oe_git:`yocto-4.1.1 </bitbake/log/?h=yocto-4.1.1>`
+-  Git Revision: :oe_git:`138dd7883ee2c521900b29985b6d24a23d96563c </bitbake/commit/?id=138dd7883ee2c521900b29985b6d24a23d96563c>`
+-  Release Artefact: bitbake-138dd7883ee2c521900b29985b6d24a23d96563c
+-  sha: 5dc5aff4b4a801253c627cdaab6b1a0ceee2c531f1a6b166d85d1265a35d4be5
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.1/bitbake-138dd7883ee2c521900b29985b6d24a23d96563c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.1/bitbake-138dd7883ee2c521900b29985b6d24a23d96563c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
+-  Tag: :yocto_git:`yocto-4.1.1 </yocto-docs/log/?h=yocto-4.1.1>`
+-  Git Revision: :yocto_git:`8e0841c3418caa227c66a60327db09dfbe72054a </yocto-docs/commit/?id=8e0841c3418caa227c66a60327db09dfbe72054a>`
+
+
-- 
2.38.1


