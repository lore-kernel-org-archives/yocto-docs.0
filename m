Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21690D116E7
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 03:40:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web11.4242.1729827608545842221
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 20:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RaOZVLpA;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729827609; x=1761363609;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n3yD01CyiQPIHe2VETv0S+CtX1n8mnPrlMMhrm6AoIY=;
  b=RaOZVLpA4k+NlPHHk4ScfEoRhzFptoQ1htXCBhsxh7Su6hpobeEKSqV5
   8JwT4RkEm0yRqNJZMZO9iyMpfSFHx5TmDkb4zY5Ew8Ko1iXRN1Mx5cJkC
   H9DiwCHpR6BuUjapPfZ0MkDLPtrzMAqeB+6T/hCRkq7qXsKeAhYaNiTFn
   1UP3q+IYhnDOivM6imopOfEmQW4H0NyF/6wEMIVfOc7v+QaO1iZtZNV5I
   MGlUJ6HxDl7Lgjk63ID5I32UL51IAdq/LEF16u8JUPFjG5H4oL9wQBVZJ
   46W/gujG59dMGlfV6uElXdRX0xz5R5lDSe1Kf5qhte5aPaOr7KgsHvrLU
   Q==;
X-CSE-ConnectionGUID: AgHXgPRuT0+q4j4W9UedVA==
X-CSE-MsgGUID: IXGv3iCaT0G4U3VoeF8S6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29649795"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29649795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 20:40:08 -0700
X-CSE-ConnectionGUID: RLWkuD8LQruUltFETLn5xQ==
X-CSE-MsgGUID: vPaPJOHNTeG8olSFfnDK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80963288"
Received: from cheeyang-desk1.png.intel.com ([10.107.249.127])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 20:40:06 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guide: add release notes for 4.0.22
Date: Fri, 25 Oct 2024 11:38:20 +0800
Message-Id: <20241025033820.1778269-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 03:40:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5583

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.22.rst | 196 ++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.22.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation=
/migration-guides/release-4.0.rst
index 03e74d1f8..88ccbec9a 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -28,4 +28,5 @@ Release 4.0 (kirkstone)
    release-notes-4.0.19
    release-notes-4.0.20
    release-notes-4.0.21
+   release-notes-4.0.22
=20
diff --git a/documentation/migration-guides/release-notes-4.0.22.rst b/docu=
mentation/migration-guides/release-notes-4.0.22.rst
new file mode 100644
index 000000000..7cde5d32a
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.22.rst
@@ -0,0 +1,196 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.22 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.22
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  cups: Fix :cve:`2024-35235` and :cve:`2024-47175`
+-  curl: Fix :cve:`2024-8096`
+-  expat: Fix :cve:`2024-45490`, :cve:`2024-45491` and :cve:`2024-45492`
+-  gnupg: Ignore :cve:`2022-3219`
+-  libpcap: Fix :cve:`2023-7256` and :cve:`2024-8006`
+-  linux-yocto/5.10: Fix :cve:`2022-48772`, :cve:`2023-52434`, :cve:`2023-=
52447`, :cve:`2023-52458`, :cve:`2024-0841`, :cve:`2024-26601`, :cve:`2024-=
26882`, :cve:`2024-26883`, :cve:`2024-26884`, :cve:`2024-26885`, :cve:`2024=
-26898`, :cve:`2024-26901`, :cve:`2024-26903`, :cve:`2024-26907`, :cve:`202=
4-26934`, :cve:`2024-26978`, :cve:`2024-27013`, :cve:`2024-27020`, :cve:`20=
24-35972`, :cve:`2024-35978`, :cve:`2024-35982`, :cve:`2024-35984`, :cve:`2=
024-35990`, :cve:`2024-35997`, :cve:`2024-36008`, :cve:`2024-36270`, :cve:`=
2024-36489`, :cve:`2024-36902`, :cve:`2024-36971`, :cve:`2024-36978`, :cve:=
`2024-38546`, :cve:`2024-38547`, :cve:`2024-38549`, :cve:`2024-38552`, :cve=
:`2024-38555`, :cve:`2024-38583`, :cve:`2024-38590`, :cve:`2024-38597`, :cv=
e:`2024-38598`, :cve:`2024-38627`, :cve:`2024-38633`, :cve:`2024-38661`, :c=
ve:`2024-38662`, :cve:`2024-38780`, :cve:`2024-39292`, :cve:`2024-39301`, :=
cve:`2024-39468`, :cve:`2024-39471`, :cve:`2024-39475`, :cve:`2024-39476`, =
:cve:`2024-39480`, :cve:`2024-39482`, :cve:`2024-39484`, :cve:`2024-39487`,=
 :cve:`2024-39489`, :cve:`2024-39495`, :cve:`2024-39506`, :cve:`2024-40902`=
, :cve:`2024-40904`, :cve:`2024-40905`, :cve:`2024-40912`, :cve:`2024-40932=
`, :cve:`2024-40934`, :cve:`2024-40958`, :cve:`2024-40959`, :cve:`2024-4096=
0`, :cve:`2024-40961`, :cve:`2024-40980`, :cve:`2024-40981`, :cve:`2024-409=
95`, :cve:`2024-41000`, :cve:`2024-41006`, :cve:`2024-41007`, :cve:`2024-41=
012`, :cve:`2024-41040`, :cve:`2024-41046`, :cve:`2024-41049`, :cve:`2024-4=
1059`, :cve:`2024-41063`, :cve:`2024-41064`, :cve:`2024-41070`, :cve:`2024-=
41087`, :cve:`2024-41089`, :cve:`2024-41092`, :cve:`2024-41095`, :cve:`2024=
-41097`, :cve:`2024-42070`, :cve:`2024-42076`, :cve:`2024-42077`, :cve:`202=
4-42082`, :cve:`2024-42090`, :cve:`2024-42093`, :cve:`2024-42094`, :cve:`20=
24-42101`, :cve:`2024-42102`, :cve:`2024-42104`, :cve:`2024-42131`, :cve:`2=
024-42137`, :cve:`2024-42148`, :cve:`2024-42152`, :cve:`2024-42153`, :cve:`=
2024-42154`, :cve:`2024-42157`, :cve:`2024-42161`, :cve:`2024-42223`, :cve:=
`2024-42224`, :cve:`2024-42229`, :cve:`2024-42232`, :cve:`2024-42236`, :cve=
:`2024-42244` and :cve:`2024-42247`
+-  linux-yocto/5.15: Fix :cve:`2023-52889`, :cve:`2024-41011`, :cve:`2024-=
42114`, :cve:`2024-42259`, :cve:`2024-42271`, :cve:`2024-42272`, :cve:`2024=
-42277`, :cve:`2024-42280`, :cve:`2024-42283`, :cve:`2024-42284`, :cve:`202=
4-42285`, :cve:`2024-42286`, :cve:`2024-42287`, :cve:`2024-42288`, :cve:`20=
24-42289`, :cve:`2024-42301`, :cve:`2024-42302`, :cve:`2024-42309`, :cve:`2=
024-42310`, :cve:`2024-42311`, :cve:`2024-42313`, :cve:`2024-43817`, :cve:`=
2024-43828`, :cve:`2024-43854`, :cve:`2024-43856`, :cve:`2024-43858`, :cve:=
`2024-43860`, :cve:`2024-43861`, :cve:`2024-43863`, :cve:`2024-43871`, :cve=
:`2024-43873`, :cve:`2024-43882`, :cve:`2024-43889`, :cve:`2024-43890`, :cv=
e:`2024-43893`, :cve:`2024-43894`, :cve:`2024-43902`, :cve:`2024-43907`, :c=
ve:`2024-43908`, :cve:`2024-43909`, :cve:`2024-43914`, :cve:`2024-44934`, :=
cve:`2024-44935`, :cve:`2024-44944`, :cve:`2024-44947`, :cve:`2024-44952`, =
:cve:`2024-44954`, :cve:`2024-44958`, :cve:`2024-44960`, :cve:`2024-44965`,=
 :cve:`2024-44966`, :cve:`2024-44969`, :cve:`2024-44971`, :cve:`2024-44982`=
, :cve:`2024-44983`, :cve:`2024-44985`, :cve:`2024-44986`, :cve:`2024-44987=
`, :cve:`2024-44988`, :cve:`2024-44989`, :cve:`2024-44990`, :cve:`2024-4499=
5`, :cve:`2024-44998`, :cve:`2024-44999`, :cve:`2024-45003`, :cve:`2024-450=
06`, :cve:`2024-45011`, :cve:`2024-45016`, :cve:`2024-45018`, :cve:`2024-45=
021`, :cve:`2024-45025`, :cve:`2024-45026`, :cve:`2024-45028`, :cve:`2024-4=
6673`, :cve:`2024-46674`, :cve:`2024-46675`, :cve:`2024-46676`, :cve:`2024-=
46677`, :cve:`2024-46679`, :cve:`2024-46685`, :cve:`2024-46689`, :cve:`2024=
-46702` and :cve:`2024-46707`
+-  openssl: Fix :cve:`2024-6119`
+-  procps: Fix :cve:`2023-4016`
+-  python3: Fix :cve:`2023-27043`, :cve:`2024-4030`, :cve:`2024-4032`, :cv=
e:`2024-6923`, :cve:`2024-6232`, :cve:`2024-7592` and :cve:`2024-8088`
+-  qemu: Fix :cve:`2024-4467`
+-  rust: Ignore :cve:`2024-43402`
+-  webkitgtk: Fix :cve:`2024-40779`
+-  wpa-supplicant: Ignore :cve:`2024-5290`
+-  wpa-supplicant: Fix :cve:`2024-3596`
+
+
+Fixes in Yocto-4.0.22
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bintuils: stable 2.38 branch update
+-  bitbake: fetch2/wget: Canonicalize :term:`DL_DIR` paths for wget2 compa=
tibility
+-  bitbake: fetch/wget: Move files into place atomically
+-  bitbake: hashserv: tests: Omit client in slow server start test
+-  bitbake: tests/fetch: Tweak to work on Fedora40
+-  bitbake: wget: Make wget --passive-ftp option conditional on ftp/ftps
+-  build-appliance-image: Update to kirkstone head revision
+-  buildhistory: Fix intermittent package file list creation
+-  buildhistory: Restoring files from preserve list
+-  buildhistory: Simplify intercept call sites and drop SSTATEPOSTINSTFUNC=
 usage
+-  busybox: Fix cut with "-s" flag
+-  cdrtools-native: fix build with gcc-14
+-  curl: free old conn better on reuse
+-  cve-exclusion: Drop the version comparision/warning
+-  dejagnu: Fix :term:`LICENSE` (change to GPL-3.0-only)
+-  doc/features: remove duplicate word in distribution feature ext2
+-  gcc: upgrade to v11.5
+-  gcr: Fix :term:`LICENSE` (change to LGPL-2.0-only)
+-  glibc: stable 2.35 branch updates
+-  install-buildtools: fix "test installation" step
+-  install-buildtools: remove md5 checksum validation
+-  install-buildtools: support buildtools-make-tarball and update to 4.1
+-  iw: Fix :term:`LICENSE` (change to ISC)
+-  kmscube: Add patch to fix -int-conversion build error
+-  lib/oeqa: rename assertRaisesRegexp to assertRaisesRegex
+-  libedit: Make docs generation deterministic
+-  linux-yocto/5.10: fix NFSV3 config warning
+-  linux-yocto/5.10: remove obsolete options
+-  linux-yocto/5.10: update to v5.10.223
+-  linux-yocto/5.15: update to v5.15.166
+-  meta-world-pkgdata: Inherit nopackages
+-  migration-guide: add release notes for 4.0.21
+-  openssl: Upgrade to 3.0.15
+-  poky.conf: bump version for 4.0.22
+-  populate_sdk_base: inherit nopackages
+-  python3: Upgrade to 3.10.15
+-  ruby: Make docs generation deterministic
+-  runqemu: keep generating tap devices
+-  scripts/install-buildtools: Update to 4.0.21
+-  selftest/runtime_test/virgl: Disable for all fedora
+-  testexport: fallback for empty :term:`IMAGE_LINK_NAME`
+-  testimage: fallback for empty :term:`IMAGE_LINK_NAME`
+-  tiff: Fix :term:`LICENSE` (change to libtiff)
+-  udev-extraconf: Add collect flag to mount
+-  unzip: Fix :term:`LICENSE` (change to Info-ZIP)
+-  valgrind: disable avx_estimate_insn.vgtest
+-  wpa-supplicant: Patch security advisory 2024-2
+-  yocto-uninative: Update to 4.5 for gcc 14
+-  yocto-uninative: Update to 4.6 for glibc 2.40
+-  zip: Fix :term:`LICENSE` (change to Info-ZIP)
+-  zstd: fix :term:`LICENSE` statement (change to "BSD-3-Clause | GPL-2.0-=
only")
+
+
+Known Issues in Yocto-4.0.22
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  ``oeqa/runtime``: the ``beaglebone-yocto`` target fails the ``parselogs=
``
+   runtime test due to unexpected kernel error messages in the log (see
+   :yocto_bugs:`bug 15624 </show_bug.cgi?id=3D15624>` on Bugzilla).
+
+
+Contributors to Yocto-4.0.22
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aleksandar Nikolic
+-  Alexandre Belloni
+-  Archana Polampalli
+-  Bruce Ashfield
+-  Colin McAllister
+-  Deepthi Hemraj
+-  Divya Chellam
+-  Hitendra Prajapati
+-  Hugo SIMELIERE
+-  Jinfeng Wang
+-  Joshua Watt
+-  J=C3=B6rg Sommer
+-  Konrad Weihmann
+-  Lee Chee Yang
+-  Martin Jansa
+-  Massimiliano Minella
+-  Michael Halstead
+-  Mingli Yu
+-  Niko Mauno
+-  Paul Eggleton
+-  Pedro Ferreira
+-  Peter Marko
+-  Purushottam Choudhary
+-  Richard Purdie
+-  Rob Woolley
+-  Rohini Sangam
+-  Ross Burton
+-  Rudolf J Streif
+-  Siddharth Doshi
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Vivek Kumbhar
+
+
+Repositories / Downloads for Yocto-4.0.22
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.22 </poky/log/?h=3Dyocto-4.0.22>`
+-  Git Revision: :yocto_git:`7e87dc422d972e0dc98372318fcdc63a76347d16 </po=
ky/commit/?id=3D7e87dc422d972e0dc98372318fcdc63a76347d16>`
+-  Release Artefact: poky-7e87dc422d972e0dc98372318fcdc63a76347d16
+-  sha: 5058e7b2474f8cb73c19e776ef58d9784321ef42109d5982747c8c432531239f
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.22/poky-7e87=
dc422d972e0dc98372318fcdc63a76347d16.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.22/poky-7e87dc422d972e0=
dc98372318fcdc63a76347d16.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=3Dkirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.22 </openembedded-core/log/?h=3Dyocto-4.0.22>`
+-  Git Revision: :oe_git:`f09fca692f96c9c428e89c5ef53fbcb92ac0c9bf </opene=
mbedded-core/commit/?id=3Df09fca692f96c9c428e89c5ef53fbcb92ac0c9bf>`
+-  Release Artefact: oecore-f09fca692f96c9c428e89c5ef53fbcb92ac0c9bf
+-  sha: 378bcc840ba9fbf06a15fea1b5dacdd446f3ad4d85115d708e7bbb20629cdeb4
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.22/oecore-f0=
9fca692f96c9c428e89c5ef53fbcb92ac0c9bf.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.22/oecore-f09fca692f96c=
9c428e89c5ef53fbcb92ac0c9bf.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.22 </meta-mingw/log/?h=3Dyocto-4.0.22>`
+-  Git Revision: :yocto_git:`f6b38ce3c90e1600d41c2ebb41e152936a0357d7 </me=
ta-mingw/commit/?id=3Df6b38ce3c90e1600d41c2ebb41e152936a0357d7>`
+-  Release Artefact: meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7
+-  sha: 7d57167c19077f4ab95623d55a24c2267a3a3fb5ed83688659b4c03586373b25
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.22/meta-ming=
w-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.22/meta-mingw-f6b38ce3c=
90e1600d41c2ebb41e152936a0357d7.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.22 </meta-gplv2/log/?h=3Dyocto-4.0.22>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </me=
ta-gplv2/commit/?id=3Dd2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.22/meta-gplv=
2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.22/meta-gplv2-d2f8b5cdb=
285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=3D2.0>`
+-  Tag:  :oe_git:`yocto-4.0.22 </bitbake/log/?h=3Dyocto-4.0.22>`
+-  Git Revision: :oe_git:`eb5c1ce6b1b8f33535ff7b9263ec7648044163ea </bitba=
ke/commit/?id=3Deb5c1ce6b1b8f33535ff7b9263ec7648044163ea>`
+-  Release Artefact: bitbake-eb5c1ce6b1b8f33535ff7b9263ec7648044163ea
+-  sha: 473d3e9539160633f3de9d88cce69123f6c623e4c8ab35beb7875868564593cf
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.22/bitbake-e=
b5c1ce6b1b8f33535ff7b9263ec7648044163ea.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.22/bitbake-eb5c1ce6b1b8=
f33535ff7b9263ec7648044163ea.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=3Dkirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.22 </yocto-docs/log/?h=3Dyocto-4.0.22>`
+-  Git Revision: :yocto_git:`2169a52a24ebd1906039c42632bae6c4285a3aca </yo=
cto-docs/commit/?id=3D2169a52a24ebd1906039c42632bae6c4285a3aca>`
+
--=20
2.34.1


