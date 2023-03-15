Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635ACC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 16:30:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.835.1678897797212352171
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 09:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HenpOuPu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E0B44000B;
	Wed, 15 Mar 2023 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678897795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gMhUseCt0NXroaVbaACzhErtlpKpYfF9VhjNykyM0Q4=;
	b=HenpOuPuPLPwzpIYP1FTPiF5Lrk2iTsiGz7huVMHLFyIsA/oSmnDcWosUQwEV9E7piuVBu
	a4GxmWdT77LNhy+x4db9YCeA2Yb4QT3t3CYfhjGK+bVdrQwDpEjSEmj7GZIZQ7beOIGyXO
	F18utfJbHf05piRNbvotY0Q6ZuGjcIZOXNVAI5qtWDYLpeLZf3raww4mTHvdCOvOuB1qRH
	JSsdeB0J+enWrvy7nQNQeWu9gifNP3mJvMaIq+SbNZaykPBlah3rAnmSWB1B3it6KkO8i/
	pvKrCVlbPsJHveWFPskVGUE0MWtmfhvBHzhL7JKH8bFcdnTRo0Q14VQx9+3J6g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [langdale] migration-guides: update release notes
Date: Wed, 15 Mar 2023 17:29:51 +0100
Message-Id: <20230315162951.423935-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Mar 2023 16:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3795

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-4.0.rst          |   3 +
 .../migration-guides/release-4.1.rst          |   5 +
 .../migration-guides/release-notes-4.0.8.rst  | 217 ++++++++++++
 .../migration-guides/release-notes-4.1.1.rst  | 319 ++++++++++++++++++
 .../migration-guides/release-notes-4.1.2.rst  | 286 ++++++++++++++++
 .../migration-guides/release-notes-4.1.3.rst  | 317 +++++++++++++++++
 6 files changed, 1147 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.8.rst
 create mode 100644 documentation/migration-guides/release-notes-4.1.1.rst
 create mode 100644 documentation/migration-guides/release-notes-4.1.2.rst
 create mode 100644 documentation/migration-guides/release-notes-4.1.3.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 3458cb24cf..2294265a46 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 4.0 (kirkstone)
 =======================
 
@@ -12,3 +14,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.5
    release-notes-4.0.6
    release-notes-4.0.7
+   release-notes-4.0.8
diff --git a/documentation/migration-guides/release-4.1.rst b/documentation/migration-guides/release-4.1.rst
index 8ebf4a4c95..dbca7c7e04 100644
--- a/documentation/migration-guides/release-4.1.rst
+++ b/documentation/migration-guides/release-4.1.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
 Release 4.1 (langdale)
 ======================
 
@@ -5,3 +7,6 @@ Release 4.1 (langdale)
 
    migration-4.1
    release-notes-4.1
+   release-notes-4.1.1
+   release-notes-4.1.2
+   release-notes-4.1.3
diff --git a/documentation/migration-guides/release-notes-4.0.8.rst b/documentation/migration-guides/release-notes-4.0.8.rst
new file mode 100644
index 0000000000..223b74fbaf
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.8.rst
@@ -0,0 +1,217 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.8 (Kirkstone)
+-----------------------------------------
+
+Security Fixes in Yocto-4.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  apr-util: Fix :cve:`2022-25147`
+-  apr: Fix :cve:`2022-24963`, :cve:`2022-28331` and :cve:`2021-35940`
+-  bind: Fix :cve:`2022-3094`, :cve:`2022-3736` and :cve:`2022-3924`
+-  git: Ignore :cve:`2022-41953`
+-  git: Fix :cve:`2022-23521` and :cve:`2022-41903`
+-  libgit2: Fix :cve:`2023-22742`
+-  ppp: Fix :cve:`2022-4603`
+-  python3-certifi: Fix :cve:`2022-23491`
+-  sudo: Fix :cve:`2023-22809`
+-  tar: Fix :cve:`2022-48303`
+
+
+Fixes in Yocto-4.0.8
+~~~~~~~~~~~~~~~~~~~~
+
+-  core-image.bbclass: Fix missing leading whitespace with ':append'
+-  populate_sdk_ext.bbclass: Fix missing leading whitespace with ':append'
+-  ptest-packagelists.inc: Fix missing leading whitespace with ':append'
+-  apr-util: upgrade to 1.6.3
+-  apr: upgrade to 1.7.2
+-  apt: fix do_package_qa failure
+-  bind: upgrade to 9.18.11
+-  bitbake: bb/utils: include SSL certificate paths in export_proxies
+-  bitbake: bitbake-diffsigs: Make PEP8 compliant
+-  bitbake: bitbake-diffsigs: break on first dependent task difference
+-  bitbake: fetch2/git: Clarify the meaning of namespace
+-  bitbake: fetch2/git: Prevent git fetcher from fetching gitlab repository metadata
+-  bitbake: fetch2/git: show SRCREV and git repo in error message about fixed SRCREV
+-  bitbake: siggen: Fix inefficient string concatenation
+-  bitbake: utils/ply: Update md5 to better report errors with hashlib
+-  bootchart2: Fix usrmerge support
+-  bsp-guide: fix broken git URLs and missing word
+-  build-appliance-image: Update to kirkstone head revision
+-  buildtools-tarball: set pkg-config search path
+-  classes/fs-uuid: Fix command output decoding issue
+-  dev-manual: common-tasks.rst: add link to FOSDEM 2023 video
+-  dev-manual: fix old override syntax
+-  devshell: Do not add scripts/git-intercept to PATH
+-  devtool: fix devtool finish when gitmodules file is empty
+-  diffutils: upgrade to 3.9
+-  gdk-pixbuf: do not use tools from gdk-pixbuf-native when building tests
+-  git: upgrade to 2.35.7
+-  glslang: branch rename master -> main
+-  httpserver: add error handler that write to the logger
+-  image.bbclass: print all QA functions exceptions
+-  kernel/linux-kernel-base: Fix kernel build artefact determinism issues
+-  libc-locale: Fix on target locale generation
+-  libgit2: upgrade to 1.4.5
+-  libjpeg-turbo: upgrade to 2.1.5
+-  libtirpc: Check if file exists before operating on it
+-  libusb1: Link with latomic only if compiler has no atomic builtins
+-  libusb1: Strip trailing whitespaces
+-  linux-firmware: upgrade to 20230117
+-  linux-yocto/5.15: update to v5.15.91
+-  lsof: fix old override syntax
+-  lttng-modules: Fix for 5.10.163 kernel version
+-  lttng-tools: upgrade to 2.13.9
+-  make-mod-scripts: Ensure kernel build output is deterministic
+-  manuals: update patchwork instance URL
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
+-  oeqa ssh.py: move output prints to new line
+-  oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with a signal
+-  oeqa/selftest/bbtests: Update message lookup for test_git_unpack_nonetwork_fail
+-  oeqa/selftest/locales: Add selftest for locale generation/presence
+-  poky.conf: Update SANITY_TESTED_DISTROS to match autobuilder
+-  poky.conf: bump version for 4.0.8
+-  profile-manual: update WireShark hyperlinks
+-  python3-pytest: depend on python3-tomli instead of python3-toml
+-  qemu: fix compile error
+-  quilt: fix intermittent failure in faildiff.test
+-  quilt: use upstreamed faildiff.test fix
+-  recipe_sanity: fix old override syntax
+-  ref-manual: document SSTATE_EXCLUDEDEPS_SYSROOT
+-  scons.bbclass: Make MAXLINELENGTH overridable
+-  scons: Pass MAXLINELENGTH to scons invocation
+-  sdkext/cases/devtool: pass a logger to HTTPService
+-  spirv-headers: set correct branch name
+-  sudo: upgrade to 1.9.12p2
+-  system-requirements.rst: add Fedora 36 and AlmaLinux 8.7 to list of supported distros
+-  testimage: Fix error message to reflect new syntax
+-  update-alternatives: fix typos
+-  vulkan-samples: branch rename master -> main
+
+
+Known Issues in Yocto-4.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alejandro Hernandez Samaniego
+-  Alexander Kanavin
+-  Alexandre Belloni
+-  Armin Kuster
+-  Arnout Vandecappelle
+-  Bruce Ashfield
+-  Changqing Li
+-  Chee Yang Lee
+-  Etienne Cordonnier
+-  Harald Seiler
+-  Kai Kang
+-  Khem Raj
+-  Lee Chee Yang
+-  Louis Rannou
+-  Marek Vasut
+-  Marius Kriegerowski
+-  Mark Hatle
+-  Martin Jansa
+-  Mauro Queiros
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Mingli Yu
+-  Narpat Mali
+-  Niko Mauno
+-  Pawel Zalewski
+-  Peter Kjellerstedt
+-  Richard Purdie
+-  Rodolfo Quesada Zumbado
+-  Ross Burton
+-  Sakib Sajal
+-  Schmidt, Adriaan
+-  Steve Sakoman
+-  Thomas Roos
+-  Ulrich Ölmann
+-  Xiangyu Chen
+
+
+Repositories / Downloads for Yocto-4.0.8
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.8 </poky/log/?h=yocto-4.0.8>`
+-  Git Revision: :yocto_git:`a361fb3df9c87cf12963a9d785a9f99faa839222 </poky/commit/?id=a361fb3df9c87cf12963a9d785a9f99faa839222>`
+-  Release Artefact: poky-a361fb3df9c87cf12963a9d785a9f99faa839222
+-  sha: af4e8d64be27d3a408357c49b7952ce04c6d8bb0b9d7b50c48848d9355de7fc2
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.8/poky-a361fb3df9c87cf12963a9d785a9f99faa839222.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.8/poky-a361fb3df9c87cf12963a9d785a9f99faa839222.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.8 </openembedded-core/log/?h=yocto-4.0.8>`
+-  Git Revision: :oe_git:`b20e2134daec33fbb8ce358d984751d887752bd5 </openembedded-core/commit/?id=b20e2134daec33fbb8ce358d984751d887752bd5>`
+-  Release Artefact: oecore-b20e2134daec33fbb8ce358d984751d887752bd5
+-  sha: 63cce6f1caf8428eefc1471351ab024affc8a41d8d7777f525e3aa9ea454d2cd
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.8/oecore-b20e2134daec33fbb8ce358d984751d887752bd5.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.8/oecore-b20e2134daec33fbb8ce358d984751d887752bd5.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.8 </meta-mingw/log/?h=yocto-4.0.8>`
+-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
+-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
+-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.8/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.8/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.8 </meta-gplv2/log/?h=yocto-4.0.8>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.8/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.8/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.8 </bitbake/log/?h=yocto-4.0.8>`
+-  Git Revision: :oe_git:`9bbdedc0ba7ca819b898e2a29a151d6a2014ca11 </bitbake/commit/?id=9bbdedc0ba7ca819b898e2a29a151d6a2014ca11>`
+-  Release Artefact: bitbake-9bbdedc0ba7ca819b898e2a29a151d6a2014ca11
+-  sha: 8e724411f4df00737e81b33eb568f1f97d2a00d5364342c0a212c46abb7b005b
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.8/bitbake-9bbdedc0ba7ca819b898e2a29a151d6a2014ca11.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.8/bitbake-9bbdedc0ba7ca819b898e2a29a151d6a2014ca11.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.8 </yocto-docs/log/?h=yocto-4.0.8>`
+-  Git Revision: :yocto_git:`16ecbe028f2b9cc021267817a5413054e070b563 </yocto-docs/commit/?id=16ecbe028f2b9cc021267817a5413054e070b563>`
+
diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
new file mode 100644
index 0000000000..4f31fbf1c7
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -0,0 +1,319 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
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
+-  bluez5: add dbus to :term:`RDEPENDS`
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
+-  dropbear: add pam to :term:`PACKAGECONFIG`
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
+-  kernel: Clear :term:`SYSROOT_DIRS` instead of replacing sysroot_stage_all
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
+-  qemu-native: Add :term:`PACKAGECONFIG` option for jack
+-  quilt: backport a patch to address grep 3.8 failures
+-  ref-manual/faq.rst: update references to products built with OE / Yocto Project
+-  ref-manual/variables.rst: clarify sentence
+-  ref-manual: add a note to ssh-server-dropbear feature
+-  ref-manual: add :term:`CVE_CHECK_SHOW_WARNINGS`
+-  ref-manual: add :term:`CVE_DB_UPDATE_INTERVAL`
+-  ref-manual: add :term:`DEV_PKG_DEPENDENCY`
+-  ref-manual: add :term:`DISABLE_STATIC`
+-  ref-manual: add :term:`FIT_PAD_ALG`
+-  ref-manual: add :term:`KERNEL_DEPLOY_DEPEND`
+-  ref-manual: add missing features
+-  ref-manual: add :term:`MOUNT_BASE` variable
+-  ref-manual: add overlayfs class variables
+-  ref-manual: add :term:`OVERLAYFS_ETC_EXPOSE_LOWER`
+-  ref-manual: add :term:`OVERLAYFS_QA_SKIP`
+-  ref-manual: add previous overlayfs-etc variables
+-  ref-manual: add pypi class
+-  ref-manual: add :term:`SDK_TOOLCHAIN_LANGS`
+-  ref-manual: add section for create-spdx class
+-  ref-manual: add serial-autologin-root to :term:`IMAGE_FEATURES` documentation
+-  ref-manual: add :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
+-  ref-manual: add :term:`WATCHDOG_TIMEOUT` to variable glossary
+-  ref-manual: add :term:`WIRELESS_DAEMON`
+-  ref-manual: classes.rst: add links to all references to a class
+-  ref-manual: complementary package installation recommends
+-  ref-manual: correct default for :term:`BUILDHISTORY_COMMIT`
+-  ref-manual: document new github-releases class
+-  ref-manual: expand documentation on image-buildinfo class
+-  ref-manual: faq.rst: reorganize into subsections, contents at top
+-  ref-manual: remove reference to largefile in :term:`DISTRO_FEATURES`
+-  ref-manual: remove reference to testimage-auto class
+-  ref-manual: system-requirements: Ubuntu 22.04 now supported
+-  ref-manual: tasks.rst: add reference to the "do_image_complete" task
+-  ref-manual: tasks.rst: add reference to the "do_kernel_checkout" task
+-  ref-manual: tasks.rst: add reference to the "do_kernel_metadata" task
+-  ref-manual: tasks.rst: add reference to the "do_validate_branches" task
+-  ref-manual: tasks.rst: add references to the "do_cleansstate" task
+-  ref-manual: update buildpaths QA check documentation
+-  ref-manual: update pypi documentation for :term:`CVE_PRODUCT` default in 4.1
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
+-  vulkan-samples: add lfs=0 to :term:`SRC_URI` to avoid git smudge errors in do_unpack
+-  wic: honor the :term:`SOURCE_DATE_EPOCH` in case of updated fstab
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
diff --git a/documentation/migration-guides/release-notes-4.1.2.rst b/documentation/migration-guides/release-notes-4.1.2.rst
new file mode 100644
index 0000000000..ee5d4ccc51
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.1.2.rst
@@ -0,0 +1,286 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.1.2 (Langdale)
+----------------------------------------
+
+Security Fixes in Yocto-4.1.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  sudo: Fix :cve:`2022-43995`
+-  binutils: Fix :cve:`2022-4285`
+-  cairo: update patch for :cve:`2019-6461` with upstream solution
+-  expat: Fix :cve:`2022-43680`
+-  ffmpeg: Fix :cve:`2022-3964` and :cve:`2022-3965`
+-  grub: Fix :cve:`2022-28736`
+-  libarchive: Fix :cve:`2022-36227`
+-  libpam: Fix :cve:`2022-28321`
+-  libpng: Fix :cve:`2019-6129`
+-  ruby: Fix :cve:`2022-28738` and :cve:`2022-28739`
+-  tiff: Fix :cve:`2022-3970`
+-  vim: Fix :cve:`2022-4141`
+
+
+Fixes in Yocto-4.1.2
+~~~~~~~~~~~~~~~~~~~~
+
+-  Expand create-spdx class documentation
+-  Expand cve-check class documentation
+-  archiver: avoid using machine variable as it breaks multiconfig
+-  babeltrace: Upgrade to 1.5.11
+-  backport SPDX documentation and vulnerability improvements
+-  baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
+-  bc: extend to nativesdk
+-  bind: Upgrade to 9.18.9
+-  bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
+-  bitbake: gitsm: Fix regression in gitsm submodule path parsing
+-  bitbake: runqueue: Fix race issues around hash equivalence and sstate reuse
+-  bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
+-  build-appliance-image: Update to langdale head revision
+-  cargo_common.bbclass: Fix typos
+-  classes: make TOOLCHAIN more permissive for kernel
+-  cmake: Upgrade to 3.24.2
+-  combo-layer: add sync-revs command
+-  combo-layer: dont use bb.utils.rename
+-  combo-layer: remove unused import
+-  common-tasks.rst: fix oeqa runtime test path
+-  create-spdx: default share_src for shared sources
+-  curl: Correct LICENSE from MIT-open-group to curl
+-  dbus: Add missing CVE product name
+-  devtool/upgrade: correctly handle recipes where S is a subdir of upstream tree
+-  dhcpcd: fix to work with systemd
+-  docs: kernel-dev: faq: update tip on how to not include kernel in image
+-  docs: migration-4.0: specify variable name change for kernel inclusion in image recipe
+-  expat: upgrade to 2.5.0
+-  externalsrc: fix lookup for .gitmodules
+-  ffmpeg: Upgrade to 5.1.2
+-  gcc-shared-source: Fix source date epoch handling
+-  gcc-source: Drop gengtype manipulation
+-  gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change
+-  gcc-source: Fix gengtypes race
+-  gdk-pixbuf: Upgrade to 2.42.10
+-  get_module_deps3.py: Check attribute '__file__'
+-  glibc-tests: correctly pull in the actual tests when installing -ptest package
+-  gnomebase.bbclass: return the whole version for tarball directory if it is a number
+-  go-crosssdk: avoid host contamination by GOCACHE
+-  go: Update reproducibility patch to fix panic errors
+-  go: submit patch upstream
+-  go: Upgrade to 1.19.3
+-  gptfdisk: remove warning message from target system
+-  groff: submit patches upstream
+-  gstreamer1.0: Upgrade to 1.20.5
+-  help2man: Upgrade to 1.49.3
+-  insane: add codeload.github.com to src-uri-bad checkz
+-  inetutils: Upgrade to 2.4
+-  iso-codes: Upgrade to 4.12.0
+-  kbd: Don't build tests
+-  kea: submit patch upstream
+-  kern-tools: integrate ZFS speedup patch
+-  kernel.bbclass: Include randstruct seed assets in STAGING_KERNEL_BUILDDIR
+-  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
+-  kernel.bbclass: remove empty module directories to prevent QA issues
+-  lib/buildstats: fix parsing of trees with reduced_proc_pressure directories
+-  libdrm: Remove libdrm-kms package
+-  libepoxy: convert to git
+-  libepoxy: remove upstreamed patch
+-  libepoxy: Upgrade to 1.5.10
+-  libffi: submit patch upstream
+-  libffi: Upgrade to 3.4.4
+-  libical: Upgrade to 3.0.16
+-  libnewt: Upgrade to 0.52.23
+-  libsdl2: Upgrade to 2.24.2
+-  libpng: Upgrade to 1.6.39
+-  libuv: fixup SRC_URI
+-  libxcrypt-compat: Upgrade to 4.4.33
+-  libxcrypt: Upgrade to 4.4.30
+-  libxml2: fix test data checksums
+-  linux-firmware: add new fw file to ${PN}-qcom-adreno-a530
+-  linux-firmware: don't put the firmware into the sysroot
+-  linux-firmware: Upgrade to 20221109
+-  linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
+-  linux-yocto/5.15: update genericx86* machines to v5.15.72
+-  linux-yocto/5.15: Upgrade to v5.15.78
+-  linux-yocto/5.19: cfg: intel and vesa updates
+-  linux-yocto/5.19: fix CONFIG_CRYPTO_CCM mismatch warnings
+-  linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure
+-  linux-yocto/5.19: security.cfg: remove configs which have been dropped
+-  linux-yocto/5.19: update genericx86* machines to v5.19.14
+-  linux-yocto/5.19: Upgrade to v5.19.17
+-  lsof: add update-alternatives logic
+-  lttng-modules: Upgrade to 2.13.7
+-  lttng-tools: submit determinism.patch upstream
+-  manuals: add 4.0.5 and 4.0.6 release notes
+-  mesa: do not rely on native llvm-config in target sysroot
+-  mesa: Upgrade to 22.2.3
+-  meta-selftest/staticids: add render group for systemd
+-  mirrors.bbclass: update CPAN_MIRROR
+-  mobile-broadband-provider-info: Upgrade to 20221107
+-  mpfr: Upgrade to 4.1.1
+-  mtd-utils: Upgrade to 2.1.5
+-  oeqa/concurrencytest: Add number of failures to summary output
+-  oeqa/runtime/dnf: rewrite test_dnf_installroot_usrmerge
+-  oeqa/selftest/externalsrc: add test for srctree_hash_files
+-  oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
+-  openssh: remove RRECOMMENDS to rng-tools for sshd package
+-  opkg: Set correct info_dir and status_file in opkg.conf
+-  opkg: Upgrade to 0.6.1
+-  ovmf: correct patches status
+-  package: Fix handling of minidebuginfo with newer binutils
+-  pango: Make it build with ptest disabled
+-  pango: replace a recipe fix with an upstream submitted patch
+-  pango: Upgrade to 1.50.11
+-  poky.conf: bump version for 4.1.2
+-  psplash: consider the situation of psplash not exist for systemd
+-  python3-mako: Upgrade to 1.2.3
+-  qemu-helper-native: Correctly pass program name as argv[0]
+-  qemu-helper-native: Re-write bridge helper as C program
+-  qemu: Ensure libpng dependency is deterministic
+-  qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel image
+-  resolvconf: make it work
+-  rm_work: adjust dependency to make do_rm_work_all depend on do_rm_work
+-  rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
+-  ruby: merge .inc into .bb
+-  ruby: Upgrade to 3.1.3
+-  rust: submit a rewritten version of crossbeam_atomic.patch upstream
+-  sanity: Drop data finalize call
+-  scripts: convert-overrides: Allow command-line customizations
+-  selftest: add a copy of previous mtd-utils version to meta-selftest
+-  socat: Upgrade to 1.7.4.4
+-  sstate: Allow optimisation of do_deploy_archives task dependencies
+-  sstatesig: emit more helpful error message when not finding sstate manifest
+-  sstatesig: skip the rm_work task signature
+-  sudo: Upgrade to 1.9.12p1
+-  sysstat: Upgrade to 12.6.1
+-  systemd: Consider PACKAGECONFIG in RRECOMMENDS
+-  systemd: Make importd depend on glib-2.0 again
+-  systemd: add group render to udev package
+-  systemd: Upgrade to 251.8
+-  tcl: correct patch status
+-  tzdata: Upgrade to 2022g
+-  vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only that
+-  valgrind: skip the boost_thread test on arm
+-  vim: Upgrade to 9.0.0947
+-  wic: make ext2/3/4 images reproducible
+-  xwayland: libxshmfence is needed when dri3 is enabled
+-  xwayland: Upgrade to 22.1.5
+-  yocto-check-layer: Allow OE-Core to be tested
+
+
+Known Issues in Yocto-4.1.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.1.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alejandro Hernandez Samaniego
+-  Alex Kiernan
+-  Alex Stewart
+-  Alexander Kanavin
+-  Alexey Smirnov
+-  Bruce Ashfield
+-  Carlos Alberto Lopez Perez
+-  Chen Qi
+-  Diego Sueiro
+-  Dmitry Baryshkov
+-  Enrico Jörns
+-  Harald Seiler
+-  Hitendra Prajapati
+-  Jagadeesh Krishnanjanappa
+-  Jose Quaresma
+-  Joshua Watt
+-  Kai Kang
+-  Konrad Weihmann
+-  Leon Anavi
+-  Marek Vasut
+-  Martin Jansa
+-  Mathieu Dubois-Briand
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Narpat Mali
+-  Nathan Rossi
+-  Niko Mauno
+-  Ola x Nilsson
+-  Ovidiu Panait
+-  Pavel Zhukov
+-  Peter Bergin
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Polampalli, Archana
+-  Qiu, Zheng
+-  Quentin Schulz
+-  Randy MacLeod
+-  Ranjitsinh Rathod
+-  Ravula Adhitya Siddartha
+-  Richard Purdie
+-  Robert Andersson
+-  Ross Burton
+-  Ryan Eatmon
+-  Sakib Sajal
+-  Sandeep Gundlupet Raju
+-  Sergei Zhmylev
+-  Steve Sakoman
+-  Tim Orling
+-  Wang Mingyu
+-  Xiangyu Chen
+-  pgowda
+
+Repositories / Downloads for Yocto-4.1.2
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`langdale </poky/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.2 </poky/log/?h=yocto-4.1.2>`
+-  Git Revision: :yocto_git:`74c92e38c701e268406bb656b45ccd68471c217e </poky/commit/?id=74c92e38c701e268406bb656b45ccd68471c217e>`
+-  Release Artefact: poky-74c92e38c701e268406bb656b45ccd68471c217e
+-  sha: 06a2b304d0e928b62d81087797ae86115efe925c506bcb40c7d4747e14790bb0
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.2/poky-74c92e38c701e268406bb656b45ccd68471c217e.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.2/poky-74c92e38c701e268406bb656b45ccd68471c217e.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`langdale </openembedded-core/log/?h=langdale>`
+-  Tag:  :oe_git:`yocto-4.1.2 </openembedded-core/log/?h=yocto-4.1.2>`
+-  Git Revision: :oe_git:`670f4f103b25897524d115c1f290ecae441fe4bd </openembedded-core/commit/?id=670f4f103b25897524d115c1f290ecae441fe4bd>`
+-  Release Artefact: oecore-670f4f103b25897524d115c1f290ecae441fe4bd
+-  sha: 09d77700e84efc738aef5713c5e86f19fa092f876d44b870789155cc1625ef04
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.2/oecore-670f4f103b25897524d115c1f290ecae441fe4bd.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.2/oecore-670f4f103b25897524d115c1f290ecae441fe4bd.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`langdale </meta-mingw/log/?h=langdale>`
+-  Tag:  :yocto_git:`yocto-4.1.2 </meta-mingw/log/?h=yocto-4.1.2>`
+-  Git Revision: :yocto_git:`b0067202db8573df3d23d199f82987cebe1bee2c </meta-mingw/commit/?id=b0067202db8573df3d23d199f82987cebe1bee2c>`
+-  Release Artefact: meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c
+-  sha: 704f2940322b81ce774e9cbd27c3cfa843111d497dc7b1eeaa39cd694d9a2366
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.2/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.2/meta-mingw-b0067202db8573df3d23d199f82987cebe1bee2c.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.2 </bitbake/log/?h=2.2>`
+-  Tag:  :oe_git:`yocto-4.1.2 </bitbake/log/?h=yocto-4.1.2>`
+-  Git Revision: :oe_git:`f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4 </bitbake/commit/?id=f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4>`
+-  Release Artefact: bitbake-f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4
+-  sha: 7faf97eca78afd3994e4e126e5f5908617408c340c6eff8cd7047e0b961e2d10
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.2/bitbake-f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.1.2/bitbake-f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`langdale </yocto-docs/log/?h=langdale>`
+-  Tag: :yocto_git:`yocto-4.1.2 </yocto-docs/log/?h=yocto-4.1.2>`
+-  Git Revision: :yocto_git:`30f5f9ece260fd600f0c0fa32fc2f1fc61cf7d1b </yocto-docs/commit/?id=30f5f9ece260fd600f0c0fa32fc2f1fc61cf7d1b>`
+
diff --git a/documentation/migration-guides/release-notes-4.1.3.rst b/documentation/migration-guides/release-notes-4.1.3.rst
new file mode 100644
index 0000000000..16e0a40426
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
+-  xserver-xorg: Fix `CVE-2023-0494 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0494>`__
+-  xwayland: Fix `CVE-2023-0494 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0494>`__
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
+-  Lei Maohui
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


