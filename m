Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F06C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:15:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9654.1672913691572277441
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 02:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UPAyDtJQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3F091C0010;
	Thu,  5 Jan 2023 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672913689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mxZBMCDaA7yzPl/fQTmNJD0uSAbzyrbvnop4z7nSAso=;
	b=UPAyDtJQHxJYIEEZJx4H5Ie7tZJDV3hh4Jts5M9PWSk3xsONwzYmyAslI5JTR849N4oh9P
	jz+kS1bcIgdr0fIkrfUumupNjo14znbjfCumHupi2aDN0112sNRdMTKNXu3jky1CgG/bSU
	3pnC8phwMdkSyNS4f7G/snJTWByePR4F1FYNMW8GNMBFkKVZk/IWrI7Ey015iU+1ugy8Rs
	SIUFMKZBPMsUr2lnphsuTq6dABiyzOdxBxJZX0jIGDWrosFUdKAR2jw1d6iumtSZY5GkPw
	sFonoMdtbPRSPvIHMQ6sLpZldwSTXdeIhvV4Ue2Fsow3hQZ63Bwk9jit0H2QLQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] add 4.0.5 and 4.0.6 release notes
Date: Thu,  5 Jan 2023 11:14:46 +0100
Message-Id: <20230105101446.54737-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 10:15:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3583

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-4.0.rst          |   2 +
 .../migration-guides/release-notes-4.0.5.rst  | 196 +++++++++++
 .../migration-guides/release-notes-4.0.6.rst  | 313 ++++++++++++++++++
 3 files changed, 511 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.5.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.6.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 9f67daaffb..8190b97237 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -9,3 +9,5 @@ Release 4.0 (kirkstone)
    release-notes-4.0.2
    release-notes-4.0.3
    release-notes-4.0.4
+   release-notes-4.0.5
+   release-notes-4.0.6
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
new file mode 100644
index 0000000000..ea0280b03c
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -0,0 +1,196 @@
+Release notes for Yocto-4.0.5 (Kirkstone)
+-----------------------------------------
+
+Security Fixes in Yocto-4.0.5
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  qemu: fix :cve:`2021-3750`, :cve:`2021-3611` and :cve:`2022-2962`
+-  binutils : fix :cve:`2022-38126`, :cve:`2022-38127` and :cve:`2022-38128`
+-  tff: fix :cve:`2022-2867`, :cve:`2022-2868` and :cve:`2022-2869`
+-  inetutils: fix :cve:`2022-39028`
+-  go: fix :cve:`2022-27664`
+
+Fixes in Yocto-4.0.5
+~~~~~~~~~~~~~~~~~~~~
+
+-  Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
+-  bind: upgrade to 9.18.7
+-  binutils: stable 2.38 branch updates (dc2474e7)
+-  bitbake: Fix npm to use https rather than http
+-  bitbake: asyncrpc/client: Fix unix domain socket chdir race issues
+-  bitbake: bitbake: Add copyright headers where missing
+-  bitbake: gitsm: Error out if submodule refers to parent repo
+-  bitbake: runqueue: Drop deadlock breaking force fail
+-  bitbake: runqueue: Ensure deferred tasks are sorted by multiconfig
+-  bitbake: runqueue: Improve deadlock warning messages
+-  bitbake: siggen: Fix insufficent entropy in sigtask file names
+-  bitbake: tests/fetch: Allow handling of a file:// url within a submodule
+-  build-appliance-image: Update to kirkstone head revision (4a88ada)
+-  busybox: add devmem 128-bit support
+-  classes: files: Extend overlayfs-etc class
+-  coreutils: add openssl PACKAGECONFIG
+-  create-pull-request: don't switch the git remote protocol to git://
+-  dev-manual: fix reference to BitBake user manual
+-  expat: upgrade 2.4.8 -> 2.4.9
+-  files: overlayfs-etc: refactor preinit template
+-  gcc-cross-canadian: add default plugin linker
+-  gcc: add arm-v9 support
+-  git: upgrade 2.35.4 -> 2.35.5
+-  glibc-locale: explicitly remove empty dirs in ${libdir}
+-  glibc-tests: use += instead of :append
+-  glibc: stable 2.35 branch updates.(8d125a1f)
+-  go-native: switch from SRC_URI:append to SRC_URI +=
+-  image_types_wic.bbclass: fix cross binutils dependency
+-  kern-tools: allow 'y' or 'm' to avoid config audit warnings
+-  kern-tools: fix queue processing in relative TOPDIR configurations
+-  kernel-yocto: allow patch author date to be commit date
+-  libpng: upgrade to 1.6.38
+-  linux-firmware: package new Qualcomm firmware
+-  linux-firmware: upgrade 20220708 -> 20220913
+-  linux-libc-headers: switch from SRC_URI:append to SRC_URI +=
+-  linux-yocto-dev: add qemuarm64
+-  linux-yocto/5.10: update to v5.10.149
+-  linux-yocto/5.15: cfg: fix ACPI warnings for -tiny
+-  linux-yocto/5.15: update to v5.15.68
+-  local.conf.sample: correct the location of public hashserv
+-  ltp: Fix pread02 case trigger the glibc overflow detection
+-  lttng-modules: Fix crash on powerpc64
+-  lttng-tools: Disable on qemuriscv32
+-  lttng-tools: Disable on riscv32
+-  migration-guides: add 4.0.4 release notes
+-  oeqa/runtime/dnf: fix typo
+-  own-mirrors: add crate
+-  perf: Fix for recent kernel upgrades
+-  poky.conf: bump version for 4.0.5
+-  poky.yaml.in: update version requirements
+-  python3-rfc3986-validator: switch from SRC_URI:append to SRC_URI +=
+-  python3: upgrade 3.10.4 -> 3.10.7
+-  qemu: Backport patches from upstream to support float128 on qemu-ppc64
+-  rpm: Remove -Wimplicit-function-declaration warnings
+-  rpm: update to 4.17.1
+-  rsync: update to 3.2.5
+-  stress-cpu: disable float128 math on powerpc64 to avoid SIGILL
+-  tune-neoversen2: support tune-neoversen2 base on armv9a
+-  tzdata: update to 2022d
+-  u-boot: switch from append to += in SRC_URI
+-  uninative: Upgrade to 3.7 to work with glibc 2.36
+-  vim: Upgrade to 9.0.0598
+-  webkitgtk: Update to 2.36.7
+
+
+Known Issues in Yocto-4.0.5
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- There are recent CVEs in key components such as openssl. They are not included in this release as it was built before the issues were known and fixes were available but these are now available on the kirkstone branch. 
+
+
+Contributors to Yocto-4.0.5
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Adrian Freihofer
+-  Alexander Kanavin
+-  Alexandre Belloni
+-  Bhabu Bindu
+-  Bruce Ashfield
+-  Chen Qi
+-  Daniel McGregor
+-  Denys Dmytriyenko
+-  Dmitry Baryshkov
+-  Florin Diaconescu
+-  He Zhe
+-  Joshua Watt
+-  Khem Raj
+-  Martin Jansa
+-  Michael Halstead
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Mingli Yu
+-  Neil Horman
+-  Pavel Zhukov
+-  Richard Purdie
+-  Robert Joslyn
+-  Ross Burton
+-  Ruiqiang Hao
+-  Samuli Piippo
+-  Steve Sakoman
+-  Sundeep KOKKONDA
+-  Teoh Jay Shen
+-  Tim Orling
+-  Virendra Thakur
+-  Vyacheslav Yurkov
+-  Xiangyu Chen
+-  Yash Shinde
+-  pgowda
+-  Wang Mingyu
+
+
+Repositories / Downloads for Yocto-4.0.5
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.5 </poky/log/?h=yocto-4.0.5>`
+-  Git Revision: :yocto_git:`2e79b199114b25d81bfaa029ccfb17676946d20d </poky/commit/?id=2e79b199114b25d81bfaa029ccfb17676946d20d>`
+-  Release Artefact: poky-2e79b199114b25d81bfaa029ccfb17676946d20d
+-  sha: 7bcf3f901d4c5677fc95944ab096e9e306f4c758a658dde5befd16861ad2b8ea
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/poky-2e79b199114b25d81bfaa029ccfb17676946d20d.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/poky-2e79b199114b25d81bfaa029ccfb17676946d20d.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.5 </openembedded-core/log/?h=yocto-4.0.5>`
+-  Git Revision: :oe_git:`fbdf93f43ff4b876487e1f26752598ec8abcb46e </openembedded-core/commit/?id=fbdf93f43ff4b876487e1f26752598ec8abcb46e>`
+-  Release Artefact: oecore-fbdf93f43ff4b876487e1f26752598ec8abcb46e
+-  sha: 2d9b5a8e9355b633bb57633cc8c2d319ba13fe4721f79204e61116b3faa6cbf1
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/oecore-fbdf93f43ff4b876487e1f26752598ec8abcb46e.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/oecore-fbdf93f43ff4b876487e1f26752598ec8abcb46e.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.5 </meta-mingw/log/?h=yocto-4.0.5>`
+-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
+-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
+-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.5 </meta-gplv2/log/?h=yocto-4.0.5>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.5 </bitbake/log/?h=yocto-4.0.5>`
+-  Git Revision: :oe_git:`c90d57497b9bcd237c3ae810ee8edb5b0d2d575a </bitbake/commit/?id=c90d57497b9bcd237c3ae810ee8edb5b0d2d575a>`
+-  Release Artefact: bitbake-c90d57497b9bcd237c3ae810ee8edb5b0d2d575a
+-  sha: 5698d548ce179036e46a24f80b213124c8825a4f443fa1d6be7ab0f70b01a9ff
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.5/bitbake-c90d57497b9bcd237c3ae810ee8edb5b0d2d575a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.5/bitbake-c90d57497b9bcd237c3ae810ee8edb5b0d2d575a.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.5 </yocto-docs/log/?h=yocto-4.0.5>`
+-  Git Revision: :yocto_git:`8c2f9f54e29781f4ee72e81eeaa12ceaa82dc2d3 </yocto-docs/commit/?id=8c2f9f54e29781f4ee72e81eeaa12ceaa82dc2d3>`
+
diff --git a/documentation/migration-guides/release-notes-4.0.6.rst b/documentation/migration-guides/release-notes-4.0.6.rst
new file mode 100644
index 0000000000..76d23fcf0c
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.6.rst
@@ -0,0 +1,313 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.6 (Kirkstone)
+-----------------------------------------
+
+Security Fixes in Yocto-4.0.6
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bash: Fix :cve:`2022-3715`
+-  curl: Fix :cve:`2022-32221`, :cve:`2022-42915` and :cve:`2022-42916`
+-  dbus: Fix :cve:`2022-42010`, :cve:`2022-42011` and :cve:`2022-42012`
+-  dropbear: Fix :cve:`2021-36369`
+-  ffmpeg: Fix :cve:`2022-3964`, :cve:`2022-3965`
+-  go: Fix :cve:`2022-2880`
+-  grub2: Fix :cve:`2022-2601`, :cve:`2022-3775` and :cve:`2022-28736`
+-  libarchive: Fix :cve:`2022-36227`
+-  libpam: Fix :cve:`2022-28321`
+-  libsndfile1: Fix :cve:`2021-4156`
+-  lighttpd: Fix :cve:`2022-41556`
+-  openssl: Fix :cve:`2022-3358`
+-  pixman: Fix :cve:`2022-44638`
+-  python3-mako: Fix :cve:`2022-40023`
+-  python3: Fix :cve:`2022-42919`
+-  qemu: Fix :cve:`2022-3165`
+-  sysstat: Fix :cve:`2022-39377`
+-  systemd: Fix :cve:`2022-3821`
+-  tiff: Fix :cve:`2022-2953`, :cve:`2022-3599`, :cve:`2022-3597`, :cve:`2022-3626`, :cve:`2022-3627`, :cve:`2022-3570`, :cve:`2022-3598` and :cve:`2022-3970`
+-  vim: Fix :cve:`2022-3352`, :cve:`2022-3705` and :cve:`2022-4141`
+-  wayland: Fix :cve:`2021-3782`
+-  xserver-xorg: Fix :cve:`2022-3550` and :cve:`2022-3551`
+
+
+Fixes in Yocto-4.0.6
+~~~~~~~~~~~~~~~~~~~~
+
+-  archiver: avoid using machine variable as it breaks multiconfig
+-  babeltrace: upgrade to 1.5.11
+-  bind: upgrade to 9.18.8
+-  bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
+-  bitbake: gitsm: Fix regression in gitsm submodule path parsing
+-  bitbake: runqueue: Fix race issues around hash equivalence and sstate reuse
+-  bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
+-  bluez5: add dbus to RDEPENDS
+-  build-appliance-image: Update to kirkstone head revision
+-  buildtools-tarball: export certificates to python and curl
+-  cargo_common.bbclass: Fix typos
+-  classes: make TOOLCHAIN more permissive for kernel
+-  cmake-native: Fix host tool contamination (Bug: 14951)
+-  common-tasks.rst: fix oeqa runtime test path
+-  create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED
+-  create-spdx: Remove ";name=..." for downloadLocation
+-  create-spdx: default share_src for shared sources
+-  cve-update-db-native: add timeout to urlopen() calls
+-  dbus: upgrade to 1.14.4
+-  dhcpcd: fix to work with systemd
+-  expat: upgrade to 2.5.0
+-  externalsrc.bbclass: Remove a trailing slash from ${B}
+-  externalsrc.bbclass: fix git repo detection
+-  externalsrc: git submodule--helper list unsupported
+-  gcc-shared-source: Fix source date epoch handling
+-  gcc-source: Drop gengtype manipulation
+-  gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change
+-  gcc-source: Fix gengtypes race
+-  gdk-pixbuf: upgrade to 2.42.10
+-  get_module_deps3.py: Check attribute '__file__'
+-  glib-2.0: fix rare GFileInfo test case failure
+-  glibc-locale: Do not INHIBIT_DEFAULT_DEPS
+-  gnomebase.bbclass: return the whole version for tarball directory if it is a number
+-  gnutls: Unified package names to lower-case
+-  groff: submit patches upstream
+-  gstreamer1.0-libav: fix errors with ffmpeg 5.x
+-  gstreamer1.0: upgrade to 1.20.4
+-  ifupdown: upgrade to 0.8.39
+-  insane.bbclass: Allow hashlib version that only accepts on parameter
+-  iso-codes: upgrade to 4.12.0
+-  kea: submit patch upstream (fix-multilib-conflict.patch)
+-  kern-tools: fix relative path processing
+-  kern-tools: integrate ZFS speedup patch
+-  kernel-yocto: improve fatal error messages of symbol_why.py
+-  kernel.bbclass: Include randstruct seed assets in STAGING_KERNEL_BUILDDIR
+-  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
+-  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
+-  libcap: upgrade to 2.66
+-  libepoxy: convert to git
+-  libepoxy: update to 1.5.10
+-  libffi: submit patch upstream (0001-arm-sysv-reverted-clang-VFP-mitigation.patch )
+-  libffi: upgrade to 3.4.4
+-  libical: upgrade to 3.0.16
+-  libksba: upgrade to 1.6.2
+-  libuv: fixup SRC_URI
+-  libxcrypt: upgrade to 4.4.30
+-  lighttpd: upgrade to 1.4.67
+-  linux-firmware: add new fw file to ${PN}-qcom-adreno-a530
+-  linux-firmware: don't put the firmware into the sysroot
+-  linux-firmware: package amdgpu firmware
+-  linux-firmware: split rtl8761 firmware
+-  linux-firmware: upgrade to 20221109
+-  linux-yocto/5.10: update genericx86* machines to v5.10.149
+-  linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
+-  linux-yocto/5.15: update genericx86* machines to v5.15.72
+-  linux-yocto/5.15: update to v5.15.78
+-  ltp: backport clock_gettime04 fix from upstream
+-  lttng-modules: upgrade to 2.13.7
+-  lttng-tools: Upgrade to 2.13.8
+-  lttng-tools: submit determinism.patch upstream
+-  lttng-ust: upgrade to 2.13.5
+-  meson: make wrapper options sub-command specific
+-  meta-selftest/staticids: add render group for systemd
+-  mirrors.bbclass: update CPAN_MIRROR
+-  mirrors.bbclass: use shallow tarball for binutils-native
+-  mobile-broadband-provider-info: upgrade 20220725 -> 20221107
+-  mtd-utils: upgrade 2.1.4 -> 2.1.5
+-  numactl: upgrade to 2.0.16
+-  oe/packagemanager/rpm: don't leak file objects
+-  oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
+-  oeqa/selftest/minidebuginfo: Create selftest for minidebuginfo
+-  oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file()
+-  openssl: Fix SSL_CERT_FILE to match ca-certs location
+-  openssl: upgrade to 3.0.7
+-  openssl: export necessary env vars in SDK
+-  opkg-utils: use a git clone, not a dynamic snapshot
+-  opkg: Set correct info_dir and status_file in opkg.conf
+-  overlayfs: Allow not used mount points
+-  ovmf: correct patches status
+-  package: Fix handling of minidebuginfo with newer binutils
+-  perf: Depend on native setuptools3
+-  poky.conf: bump version for 4.0.6
+-  psplash: add psplash-default in rdepends
+-  psplash: consider the situation of psplash not exist for systemd
+-  python3: advance to version 3.10.8
+-  qemu-helper-native: Correctly pass program name as argv[0]
+-  qemu-helper-native: Re-write bridge helper as C program
+-  qemu-native: Add PACKAGECONFIG option for jack
+-  qemu: add io_uring PACKAGECONFIG
+-  quilt: backport a patch to address grep 3.8 failures
+-  resolvconf: make it work
+-  rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
+-  runqemu: Do not perturb script environment
+-  runqemu: Fix gl-es argument from causing other arguments to be ignored
+-  sanity: Drop data finalize call
+-  sanity: check for GNU tar specifically
+-  scripts/oe-check-sstate: cleanup
+-  scripts/oe-check-sstate: force build to run for all targets, specifically populate_sysroot
+-  scripts: convert-overrides: Allow command-line customizations
+-  socat: upgrade to 1.7.4.4
+-  SPDX and CVE documentation updates
+-  sstate: Allow optimisation of do_deploy_archives task dependencies
+-  sstatesig: emit more helpful error message when not finding sstate manifest
+-  sstatesig: skip the rm_work task signature
+-  sudo: upgrade to 1.9.12p1
+-  systemd: Consider PACKAGECONFIG in RRECOMMENDS
+-  systemd: add group render to udev package
+-  tcl: correct patch status
+-  tiff: refresh with devtool
+-  tiff: add CVE tag to b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
+-  u-boot: Remove duplicate inherit of cml1
+-  uboot-sign: Fix using wrong KEY_REQ_ARGS
+-  vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only that
+-  valgrind: remove most hidden tests for arm64
+-  vim: Upgrade to 9.0.0947
+-  vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in do_unpack
+-  wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
+-  wic: make ext2/3/4 images reproducible
+-  wic: swap partitions are not added to fstab
+-  wpebackend-fdo: upgrade to 1.14.0
+-  xserver-xorg: move some recommended dependencies in required
+-  xwayland: upgrade to 22.1.5
+
+
+Known Issues in Yocto-4.0.6
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.6
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Alex Kiernan
+-  Alexander Kanavin
+-  Alexey Smirnov
+-  Bartosz Golaszewski
+-  Bernhard Rosenkränzer
+-  Bhabu Bindu
+-  Bruce Ashfield
+-  Chee Yang Lee
+-  Chen Qi
+-  Christian Eggers
+-  Claus Stovgaard
+-  Diego Sueiro
+-  Dmitry Baryshkov
+-  Ed Tanous
+-  Enrico Jörns
+-  Etienne Cordonnier
+-  Frank de Brabander
+-  Harald Seiler
+-  Hitendra Prajapati
+-  Jan-Simon Moeller
+-  Jeremy Puhlman
+-  Joe Slater
+-  John Edward Broadbent
+-  Jose Quaresma
+-  Joshua Watt
+-  Kai Kang
+-  Keiya Nobuta
+-  Khem Raj
+-  Konrad Weihmann
+-  Leon Anavi
+-  Liam Beguin
+-  Marek Vasut
+-  Mark Hatle
+-  Martin Jansa
+-  Michael Opdenacker
+-  Mikko Rapeli
+-  Narpat Mali
+-  Nathan Rossi
+-  Niko Mauno
+-  Pavel Zhukov
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Polampalli, Archana
+-  Qiu, Zheng
+-  Ravula Adhitya Siddartha
+-  Richard Purdie
+-  Ross Burton
+-  Sakib Sajal
+-  Sean Anderson
+-  Sergei Zhmylev
+-  Steve Sakoman
+-  Teoh Jay Shen
+-  Thomas Perrot
+-  Tim Orling
+-  Vincent Davis Jr
+-  Vivek Kumbhar
+-  Vyacheslav Yurkov
+-  Wang Mingyu
+-  Xiangyu Chen
+-  Zheng Qiu
+-  Ciaran Courtney
+-  Wang Mingyu
+
+
+Repositories / Downloads for Yocto-4.0.6
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.6 </poky/log/?h=yocto-4.0.6>`
+-  Git Revision: :yocto_git:`c4e08719a782fd4119eaf643907b80cebf57f88f </poky/commit/?id=c4e08719a782fd4119eaf643907b80cebf57f88f>`
+-  Release Artefact: poky-c4e08719a782fd4119eaf643907b80cebf57f88f
+-  sha: 2eb3b323dd2ccd25f9442bfbcbde82bc081fad5afd146a8e6dde439db24a99d4
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.6/poky-c4e08719a782fd4119eaf643907b80cebf57f88f.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.6/poky-c4e08719a782fd4119eaf643907b80cebf57f88f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.6 </openembedded-core/log/?h=yocto-4.0.6>`
+-  Git Revision: :oe_git:`45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2 </openembedded-core/commit/?id=45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2>`
+-  Release Artefact: oecore-45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2
+-  sha: de8b443365927befe67cc443b60db57563ff0726377223f836a3f3971cf405ec
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.6/oecore-45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.6/oecore-45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.6 </meta-mingw/log/?h=yocto-4.0.6>`
+-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </meta-mingw/commit/?id=a90614a6498c3345704e9611f2842eb933dc51c1>`
+-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
+-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.6/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.6/meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.6 </meta-gplv2/log/?h=yocto-4.0.6>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.6/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.6/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.6 </bitbake/log/?h=yocto-4.0.6>`
+-  Git Revision: :oe_git:`7e268c107bb0240d583d2c34e24a71e373382509 </bitbake/commit/?id=7e268c107bb0240d583d2c34e24a71e373382509>`
+-  Release Artefact: bitbake-7e268c107bb0240d583d2c34e24a71e373382509
+-  sha: c3e2899012358c95962c7a5c85cf98dc30c58eae0861c374124e96d9556bb901
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.6/bitbake-7e268c107bb0240d583d2c34e24a71e373382509.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.6/bitbake-7e268c107bb0240d583d2c34e24a71e373382509.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.6 </yocto-docs/log/?h=yocto-4.0.6>`
+-  Git Revision: :yocto_git:`c10d65ef3bbdf4fe3abc03e3aef3d4ca8c2ad87f </yocto-docs/commit/?id=c10d65ef3bbdf4fe3abc03e3aef3d4ca8c2ad87f>`
+
+
-- 
2.37.2


