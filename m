Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2315CCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 08:55:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5261.1762332930481713011
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 00:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kZjke5r8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4FA8EC0E61E
	for <docs@lists.yoctoproject.org>; Wed,  5 Nov 2025 08:55:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47A2660693;
	Wed,  5 Nov 2025 08:55:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47CC110B51B94;
	Wed,  5 Nov 2025 09:55:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762332927; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mgd8BdhyoRDtMWlgt+25dFIRbjcGrLszsQCtg4j1e4k=;
	b=kZjke5r8eOm+3/Q/R3cGNXqu2dpgj6H49VpXH+Ur1XTEfVpMJOwcMZcVZwHYpUuu1eMdI8
	LExzQvmcur+/ROa8TP33Cgya/3zS8Nl5iBpGnLJrQ8Hm5jsZJNVZvI8NhvTlOVotEqv/Hf
	guSKuCwY9RNSz+Kk5pKKiVkKuiTxm0o9vduLG566yynsA/lGvvynHQwLlwZSZ/ezwonNrp
	HgYtDdb+GpSC1NZuTr6dHUi+y8LezrMNKunnX1tVwa30XReGURuv8K+qBlyuYaelc7ogxl
	ZVVsbsM/KOkqOiy69xOvin26R1r2ieK/xysYWWXQ01zDojz1rlgZhA8/hNGzVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 09:55:26 +0100
Message-Id: <DE0MVTN84YMA.29KPMVEGA8YKX@bootlin.com>
Subject: Re: [docs] [PATCH] migration-guides: add release notes for 5.0.13
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20251105072700.1209561-1-chee.yang.lee@intel.com>
In-Reply-To: <20251105072700.1209561-1-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 08:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7988

Hi,

On Wed Nov 5, 2025 at 8:27 AM CET, Lee Chee Yang via lists.yoctoproject.org=
 wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../migration-guides/release-5.0.rst          |   1 +
>  .../migration-guides/release-notes-5.0.13.rst | 241 ++++++++++++++++++
>  2 files changed, 242 insertions(+)
>  create mode 100644 documentation/migration-guides/release-notes-5.0.13.r=
st
>
> diff --git a/documentation/migration-guides/release-5.0.rst b/documentati=
on/migration-guides/release-5.0.rst
> index 523521b37..808ead9af 100644
> --- a/documentation/migration-guides/release-5.0.rst
> +++ b/documentation/migration-guides/release-5.0.rst
> @@ -19,3 +19,4 @@ Release 5.0 (scarthgap)
>     release-notes-5.0.10
>     release-notes-5.0.11
>     release-notes-5.0.12
> +   release-notes-5.0.13
> diff --git a/documentation/migration-guides/release-notes-5.0.13.rst b/do=
cumentation/migration-guides/release-notes-5.0.13.rst
> new file mode 100644
> index 000000000..e683adc30
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-5.0.13.rst
> @@ -0,0 +1,241 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Release notes for Yocto-5.0.13 (Scarthgap)
> +------------------------------------------
> +
> +Security Fixes in Yocto-5.0.13
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  busybox: Fix :cve_nist:`2025-46394`
> +-  cups: Fix :cve_nist:`2025-58060` and :cve_nist:`2025-58364`
> +-  curl: Fix :cve_nist:`2025-9086`
> +-  dpkg: Fix :cve_nist:`2025-6297`
> +-  expat: follow-up Fix :cve_nist:`2024-8176`
> +-  ffmpeg: Fix :cve_nist:`2025-1594`
> +-  ffmpeg: Ignore :cve_nist:`2023-49502`, :cve_nist:`2023-50007`, :cve_n=
ist:`2023-50008`,
> +   :cve_nist:`2023-50009`, :cve_nist:`2023-50010`, :cve_nist:`2024-31578=
`, :cve_nist:`2024-31582`
> +   and :cve_nist:`2024-31585`
> +-  ghostscript: Fix :cve_nist:`2025-59798`, :cve_nist:`2025-59799` and :=
cve_nist:`2025-59800`
> +-  glib-2.0: Fix :cve_nist:`2025-6052` and :cve_nist:`2025-7039`
> +-  go-binary-native: Ignore :cve_nist:`2025-0913`
> +-  go: Fix :cve_nist:`2025-4674`, :cve_nist:`2025-47906` and :cve_nist:`=
2025-47907`
> +-  grub2: Fix :cve_nist:`2024-56738`
> +-  grub2: Ignore :cve_nist:`2024-2312`
> +-  gstreamer1.0-plugins-bad: Fix :cve_nist:`2025-3887`
> +-  gstreamer1.0-plugins-base: Fix :cve_nist:`2025-47807`
> +-  gstreamer1.0-plugins-base: Ignore :cve_nist:`2025-47806` and :cve_nis=
t:`2025-47808`
> +-  gstreamer1.0-plugins-good: Ignore :cve_nist:`2025-47183` and :cve_nis=
t:`2025-47219`
> +-  gstreamer1.0: Ignore :cve_nist:`2025-2759`
> +-  libpam: Fix :cve_nist:`2024-10963`
> +-  libxslt: Fix :cve_nist:`2025-7424`
> +-  openssl: Fix :cve_nist:`2025-9230`, :cve_nist:`2025-9231` and :cve_ni=
st:`2025-9232`
> +-  pulseaudio: Ignore :cve_nist:`2024-11586`
> +-  qemu: Ignore :cve_nist:`2024-7730`
> +-  tiff: Fix :cve_nist:`2025-9900`
> +-  tiff: Ignore :cve_nist:`2024-13978`, :cve_nist:`2025-8176`, :cve_nist=
:`2025-8177`,
> +   :cve_nist:`2025-8534` and :cve_nist:`2025-8851`
> +-  vim: Fix :cve_nist:`2025-9389`
> +-  wpa-supplicant: Fix :cve_nist:`2022-37660`
> +
> +
> +Fixes in Yocto-5.0.13
> +~~~~~~~~~~~~~~~~~~~~~

Not for now but for Whinlatter, it would be better to split the below chang=
es in
the different repositories they belong to (openembedded-core, bitbake,
meta-yocto, yocto-docs), since Poky will no longer be updated.

> +-  binutils: fix build with gcc-15
> +-  bitbake: Use a "fork" multiprocessing context
> +-  bitbake: bitbake: Bump version to 2.8.1
> +-  build-appliance-image: Update to scarthgap head revision
> +-  buildtools-tarball: fix unbound variable issues under 'set -u'
> +-  cmake: fix build with gcc-15 on host
> +-  conf/bitbake.conf: use gnu mirror instead of main server
> +-  contributor-guide: submit-changes: align :term:`CC` tag description
> +-  contributor-guide: submit-changes: clarify example with Yocto bug ID
> +-  contributor-guide: submit-changes: fix improper bold string
> +-  contributor-guide: submit-changes: make "Crediting contributors" part=
 of "Commit your changes"
> +-  contributor-guide: submit-changes: make the Cc tag follow kernel guid=
elines
> +-  contributor-guide: submit-changes: number instruction list in commit =
your changes
> +-  contributor-guide: submit-changes: reword commit message instructions
> +-  cpio: Pin to use C17 std
> +-  cups: upgrade to 2.4.11
> +-  curl: update :term:`CVE_STATUS` for :cve_nist:`2025-5025`
> +-  dbus-glib: fix build with gcc-15
> +-  default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue
> +-  dev-manual/building.rst: add note about externalsrc variables absolut=
e paths
> +-  dev-manual/security-subjects.rst: update mailing lists
> +-  elfutils: fix build with gcc-15
> +-  examples: genl: fix wrong attribute size
> +-  expect: Fix build with GCC 15
> +-  expect: Revert "expect-native: fix do_compile failure with gcc-14"
> +-  expect: cleanup do_install
> +-  expect: don't run aclocal in do_configure
> +-  expect: fix native build with GCC 15
> +-  expect: update code for Tcl channel implementation
> +-  ffmpeg: upgrade to 6.1.3
> +-  gdbm: Use C11 standard
> +-  git: fix build with gcc-15 on host
> +-  gmp: Fix build with GCC15/C23
> +-  gmp: Fix build with older gcc versions
> +-  kernel-dev/common.rst: fix the in-tree defconfig description
> +-  lib/oe/utils: use multiprocessing from bb
> +-  libarchive: patch regression of patch for :cve_nist:`2025-5918`
> +-  libgpg-error: fix build with gcc-15
> +-  libtirpc: Fix build with gcc-15/C23
> +-  license.py: avoid deprecated ast.Str
> +-  llvm: fix build with gcc-15
> +-  llvm: update to 18.1.8
> +-  m4: Stick to C17 standard
> +-  migration-guides: add release notes for 4.0.29 5.0.12
> +-  ncurses: Pin to C17 standard
> +-  oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server
> +-  openssl: upgrade to 3.2.6
> +-  p11-kit: backport fix for handle :term:`USE_NLS` from master
> +-  pkgconfig: fix build with gcc-15
> +-  poky.conf: bump version for 5.0.13
> +-  pulseaudio: Add audio group explicitly
> +-  ref-manual/structure: document the auto.conf file
> +-  ref-manual/variables.rst: expand :term:`IMAGE_OVERHEAD_FACTOR` glossa=
ry entry
> +-  ref-manual/variables.rst: fix the description of :term:`KBUILD_DEFCON=
FIG` :term:`STAGING_DIR`
> +-  rpm: keep leading "/" from sed operation
> +-  ruby-ptest: some ptest fixes
> +-  runqemu: fix special characters bug
> +-  rust-llvm: fix build with gcc-15
> +-  sanity.conf: Update minimum bitbake version to 2.8.1
> +-  scripts/install-buildtools: Update to 5.0.12
> +-  sdk: The main in the C example should return an int
> +-  selftest/cases/meta_ide.py: use use gnu mirror instead of main server
> +-  shared-mime-info: Handle :term:`USE_NLS`
> +-  sudo: remove devtool FIXME comment
> +-  systemd: backport fix for handle :term:`USE_NLS` from master
> +-  systemtap: Fix task_work_cancel build
> +-  test-manual/yocto-project-compatible.rst: fix a typo
> +-  test-manual: update runtime-testing Exporting Tests section
> +-  unifdef: Don't use C23 constexpr keyword
> +-  unzip: Fix build with GCC-15
> +-  util-linux: use ${B} instead of ${WORKDIR}/build, to fix building und=
er devtool
> +-  vim: upgrade to 9.1.1683
> +-  yocto-uninative: Update to 4.9 for glibc 2.42 GCC 15.1
> +
> +
> +Known Issues in Yocto-5.0.13
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- N/A
> +
> +Contributors to Yocto-5.0.13
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Thanks to the following people who contributed to this release:
> +-  Adam Blank
> +-  Adrian Freihofer
> +-  Aleksandar Nikolic
> +-  Antonin Godard
> +-  Archana Polampalli
> +-  AshishKumar Mishra
> +-  Barne Carstensen
> +-  Chris Laplante
> +-  Deepak Rathore
> +-  Divya Chellam
> +-  Gyorgy Sarvari
> +-  Haixiao Yan
> +-  Hitendra Prajapati
> +-  Hongxu Jia
> +-  Jan Vermaete
> +-  Jiaying Song
> +-  Jinfeng Wang
> +-  Joao Marcos Costa
> +-  Joshua Watt
> +-  Khem Raj
> +-  Kyungjik Min
> +-  Lee Chee Yang
> +-  Libo Chen
> +-  Martin Jansa
> +-  Michael Halstead
> +-  Nitin Wankhade
> +-  Peter Marko
> +-  Philip Lorenz
> +-  Praveen Kumar
> +-  Quentin Schulz
> +-  Ross Burton
> +-  Stanislav Vovk
> +-  Steve Sakoman
> +-  Talel BELHAJ SALEM
> +-  Vijay Anusuri
> +-  Vrushti Dabhi
> +-  Yogita Urade
> +
> +
> +Repositories / Downloads for Yocto-5.0.13
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +yocto-docs
> +
> +-  Repository Location: :yocto_git:`/yocto-docs`
> +-  Branch: :yocto_git:`scarthgap </yocto-docs/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.13 </yocto-docs/log/?h=3Dyocto-5.0.13>`
> +-  Git Revision: :yocto_git:`6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a </=
yocto-docs/commit/?id=3D6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a>`
> +-  Release Artefact: yocto-docs-6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a
> +-  sha: 454601d8b6034268212f74ca689ed360b08f7a4c7de5df726aa3706586ca4351
> +-  Download Locations:
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.13/yocto-=
docs-6f086fd3d9dbbb0c80f6c3e89b8df4fed422e79a.tar.bz2
> +   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.13/yocto-docs-6f086f=
d3d9dbbb0c80f6c3e89b8df4fed422e79a.tar.bz2
> +
> +poky
> +
> +-  Repository Location: :yocto_git:`/poky`
> +-  Branch: :yocto_git:`scarthgap </poky/log/?h=3Dscarthgap>`
> +-  Tag:  :yocto_git:`yocto-5.0.13 </poky/log/?h=3Dyocto-5.0.13>`
> +-  Git Revision: :yocto_git:`f16cffd030d21d12dd57bb95cfc310bda41f8a1f </=
poky/commit/?id=3Df16cffd030d21d12dd57bb95cfc310bda41f8a1f>`
> +-  Release Artefact: poky-f16cffd030d21d12dd57bb95cfc310bda41f8a1f
> +-  sha: 1367e43907f5ffa725f3afb019cd7ca07de21f13e5e73a1f5d1808989ae6ed2a
> +-  Download Locations:
> +   https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.13/poky-f=
16cffd030d21d12dd57bb95cfc310bda41f8a1f.tar.bz2
> +   https://mirrors.kernel.org/yocto/yocto/yocto-5.0.13/poky-f16cffd030d2=
1d12dd57bb95cfc310bda41f8a1f.tar.bz2

And likewise poky will need to be removed for Whinlatter.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


