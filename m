Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB3DC3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 11:04:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.33383.1672657480424691626
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jan 2023 03:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=arF/I652;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 32ECE1C0011;
	Mon,  2 Jan 2023 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672657478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iqPrm6PXCFcfCSsYwy9a362YB5sncsoI6BtuS9ebdI8=;
	b=arF/I652oMHQM6eW5GFwRtlrTpgcqe0pK46iDgKp99t4jdpeW+/hBZrNglwfYz05rqgA4T
	dJV9IX5dS7Wai07BCTw7WIWMcW7+bnCqBNP6WBNuz/N6ddjSk0BLRXTgqLiRjH0pvPVjnM
	1eFK92ojspcR1RuWcflwHb6ZdIhPWmq4Vd9lTcdFuUcH/C4kKfqh5YvB9KvmSLCLaFuRk8
	A97MK7IM8I158NzQo5pZ1JNTgJgPUZlwSZst2iac5xTLQH7aM0OqVZ2S8XtbrnT0VW8tY4
	aZwcDPcypYm0foqNAPOpbW488A16QMxFkQa+uwf8t4H/4MOsbMorHIl6bCKH1A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>,
	Takayasu Ito <ito@lineo.co.jp>
Subject: [PATCH v2] migration-guides: add release-notes for 4.0.6
Date: Mon,  2 Jan 2023 12:04:27 +0100
Message-Id: <20230102110427.141215-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <40a9a00e-69af-1742-4e1c-1ff01db4e5e1@lineo.co.jp>
References: <40a9a00e-69af-1742-4e1c-1ff01db4e5e1@lineo.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jan 2023 11:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3567

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Takayasu Ito <ito@lineo.co.jp>

---

Changes in V2:
- Add missing SPDX header at the beginning of the file
- Add fixed vim CVEs (reported by Takayasu Ito)
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.6.rst  | 313 ++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.6.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index bb9c1a7b2b..8ca8498838 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -12,3 +12,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.3
    release-notes-4.0.4
    release-notes-4.0.5
+   release-notes-4.0.6
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


