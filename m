Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B50FC6187
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 01:21:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web11.87697.1726276864888752837
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Sep 2024 18:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Pi2F2rwH;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726276865; x=1757812865;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ig1jWGz1OrcjwFaiuuH1FfQ4hdGFjGGP062mZwgoidA=;
  b=Pi2F2rwHGNw3EvltfoQIdxOtxcTU74lyEfWsIHpa4wfAtXB06GW2KQm3
   JsGkTTpiYcX3CFKHqXa4K3vBzJkyUiVsq/H9F3ohBylO9CGGBXrnIcosu
   G+IOCCfeR/VjfzJ03+zSTWmllwUsP6bu+v3KEqVXc6RRMo+tYhSJh5zQY
   rp4lTTpbMZu3MecaYTo59ZbD4dycc/1fX/KkbNdr7opD9DEMTeQBJXaJP
   NK+ttBvcF3GoiM3FLzYkPKc8nLKO8ZAEgZcbkdkjYdD+tr4wzsSWGSnIA
   +jQ6p1FP1LdYBARtB6eZ/emDyqexqLdDuSy5NUYHvWbjF96+agOMfrZBA
   w==;
X-CSE-ConnectionGUID: kprbt+iKQAa3WNV1wus9xw==
X-CSE-MsgGUID: J9758KvKQcGZHrFOPm+QKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35865363"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35865363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 18:21:04 -0700
X-CSE-ConnectionGUID: w3F6FH8pQ4mOLjSqhnoz5A==
X-CSE-MsgGUID: AplaBjSGQ7myCzo2loW9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68767668"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orviesa007.jf.intel.com with ESMTP; 13 Sep 2024 18:21:03 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guide: add release notes for 4.0.21
Date: Sat, 14 Sep 2024 09:20:20 +0800
Message-Id: <20240914012020.2099102-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 14 Sep 2024 01:21:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5357

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.21.rst | 166 ++++++++++++++++++
 2 files changed, 167 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.21.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation=
/migration-guides/release-4.0.rst
index 4954ea678..03e74d1f8 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -27,4 +27,5 @@ Release 4.0 (kirkstone)
    release-notes-4.0.18
    release-notes-4.0.19
    release-notes-4.0.20
+   release-notes-4.0.21
=20
diff --git a/documentation/migration-guides/release-notes-4.0.21.rst b/docu=
mentation/migration-guides/release-notes-4.0.21.rst
new file mode 100644
index 000000000..a12f4b247
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.21.rst
@@ -0,0 +1,166 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.21 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.21
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bind: Fix :cve:`2024-4076`, :cve:`2024-1737`, :cve:`2024-0760` and :cve=
:`2024-1975`
+-  apr: Fix :cve:`2023-49582`
+-  busybox: Fix :cve:`2023-42363`, :cve:`2023-42364`, :cve:`2023-42365`, :=
cve:`2023-42366` and :cve:`2021-42380`
+-  curl: Ignore :cve:`2024-32928`
+-  curl: Fix :cve:`2024-7264`
+-  ghostscript: Fix :cve:`2024-29506`, :cve:`2024-29509` and :cve:`2024-29=
511`
+-  go: Fix :cve:`2024-24789` and :cve:`2024-24791`
+-  gtk+3: Fix :cve:`2024-6655`
+-  libarchive: Ignore :cve:`2024-37407`
+-  libyaml: Ignore :cve:`2024-35325`, :cve:`2024-35326` and :cve:`2024-353=
28`
+-  linux-yocto/5.15: Fix :cve:`2022-48772`, :cve:`2024-35972`, :cve:`2024-=
35984`, :cve:`2024-35990`, :cve:`2024-35997`, :cve:`2024-36008`, :cve:`2024=
-36270`, :cve:`2024-36489`, :cve:`2024-36897`, :cve:`2024-36938`, :cve:`202=
4-36965`, :cve:`2024-36967`, :cve:`2024-36969`, :cve:`2024-36971`, :cve:`20=
24-36978`, :cve:`2024-38546`, :cve:`2024-38547`, :cve:`2024-38549`, :cve:`2=
024-38552`, :cve:`2024-38555`, :cve:`2024-38571`, :cve:`2024-38583`, :cve:`=
2024-38591`, :cve:`2024-38597`, :cve:`2024-38598`, :cve:`2024-38600`, :cve:=
`2024-38627`, :cve:`2024-38633`, :cve:`2024-38661`, :cve:`2024-38662`, :cve=
:`2024-38780`, :cve:`2024-39277`, :cve:`2024-39292`, :cve:`2024-39301`, :cv=
e:`2024-39466`, :cve:`2024-39468`, :cve:`2024-39471`, :cve:`2024-39475`, :c=
ve:`2024-39476`, :cve:`2024-39480`, :cve:`2024-39482`, :cve:`2024-39484`, :=
cve:`2024-39487`, :cve:`2024-39489`, :cve:`2024-39493`, :cve:`2024-39495`, =
:cve:`2024-39506`, :cve:`2024-40902`, :cve:`2024-40911`, :cve:`2024-40912`,=
 :cve:`2024-40932`, :cve:`2024-40934`, :cve:`2024-40954`, :cve:`2024-40956`=
, :cve:`2024-40957`, :cve:`2024-40958`, :cve:`2024-40959`, :cve:`2024-40960=
`, :cve:`2024-40961`, :cve:`2024-40967`, :cve:`2024-40970`, :cve:`2024-4098=
0`, :cve:`2024-40981`, :cve:`2024-40994`, :cve:`2024-40995`, :cve:`2024-410=
00`, :cve:`2024-41002`, :cve:`2024-41006`, :cve:`2024-41007`, :cve:`2024-41=
046`, :cve:`2024-41049`, :cve:`2024-41055`, :cve:`2024-41064`, :cve:`2024-4=
1070`, :cve:`2024-41073`, :cve:`2024-41087`, :cve:`2024-41089`, :cve:`2024-=
41092`, :cve:`2024-41093`, :cve:`2024-41095`, :cve:`2024-41097`, :cve:`2024=
-42068`, :cve:`2024-42070`, :cve:`2024-42076`, :cve:`2024-42077`, :cve:`202=
4-42080`, :cve:`2024-42082`, :cve:`2024-42085`, :cve:`2024-42090`, :cve:`20=
24-42093`, :cve:`2024-42094`, :cve:`2024-42101`, :cve:`2024-42102`, :cve:`2=
024-42104`, :cve:`2024-42109`, :cve:`2024-42140`, :cve:`2024-42148`, :cve:`=
2024-42152`, :cve:`2024-42153`, :cve:`2024-42154`, :cve:`2024-42157`, :cve:=
`2024-42161`, :cve:`2024-42223`, :cve:`2024-42224`, :cve:`2024-42225`, :cve=
:`2024-42229`, :cve:`2024-42232`, :cve:`2024-42236`, :cve:`2024-42244` and =
:cve:`2024-42247`
+-  llvm: Fix :cve:`2023-46049` and :cve:`2024-31852`
+-  ofono: fix :cve:`2023-2794`
+-  orc: Fix :cve:`2024-40897`
+-  python3-certifi: Fix :cve:`2024-39689`
+-  python3-jinja2: Fix :cve:`2024-34064`
+-  python3: Fix :cve:`2024-8088`
+-  qemu: Fix :cve:`2024-7409`
+-  ruby: Fix for :cve:`2024-27282`
+-  tiff: Fix :cve:`2024-7006`
+-  vim: Fix :cve:`2024-22667`, :cve:`2024-41957`, :cve:`2024-41965` and :c=
ve:`2024-43374`
+-  wpa-supplicant: Fix :cve:`2023-52160`
+
+
+Fixes in Yocto-4.0.21
+~~~~~~~~~~~~~~~~~~~~~
+
+-  apr: upgrade to 1.7.5
+-  bind: Upgrade to 9.18.28
+-  bitbake: data_smart: Improve performance for VariableHistory
+-  build-appliance-image: Update to kirkstone head revision
+-  cryptodev-module: Fix build for linux 5.10.220
+-  gcc-runtime: remove bashism
+-  grub: fs/fat: Don't error when mtime is 0
+-  image_types.bbclass: Use --force also with lz4,lzop
+-  libsoup: fix compile error on centos7
+-  linux-yocto/5.15: upgrade to v5.15.164
+-  lttng-modules: Upgrade to 2.13.14
+-  migration-guide: add release notes for 4.0.20
+-  orc: upgrade to 0.4.39
+-  poky.conf: bump version for 4.0.21
+-  python3-jinja2: upgrade to 3.1.4
+-  python3-pycryptodome(x): use python_setuptools_build_meta build class
+-  python3: add PACKAGECONFIG[editline]
+-  ref-manual: fix typo and move :term:`SYSROOT_DIRS` example
+-  sqlite3: CVE_ID correction for :cve:`2023-7104` as patched
+-  sqlite3: Rename patch for :cve:`2022-35737`
+-  uboot-sign: Fix index error in concat_dtb_helper() with multiple configs
+-  vim: upgrade to 9.1.0682
+-  wireless-regdb: upgrade to 2024.07.04
+
+
+Known Issues in Yocto-4.0.21
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.21
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Archana Polampalli
+-  Ashish Sharma
+-  Bruce Ashfield
+-  Deepthi Hemraj
+-  Divya Chellam
+-  Florian Amstutz
+-  Guocai He
+-  Hitendra Prajapati
+-  Hugo SIMELIERE
+-  Lee Chee Yang
+-  Leon Anavi
+-  Matthias Pritschet
+-  Ming Liu
+-  Niko Mauno
+-  Peter Marko
+-  Robert Yang
+-  Rohini Sangam
+-  Ross Burton
+-  Siddharth Doshi
+-  Soumya Sambu
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Vrushti Dabhi
+-  Wang Mingyu
+-  Yogita Urade
+
+
+Repositories / Downloads for Yocto-4.0.21
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.21 </poky/log/?h=3Dyocto-4.0.21>`
+-  Git Revision: :yocto_git:`4cdc553814640851cce85f84ee9c0b58646cd33b </po=
ky/commit/?id=3D4cdc553814640851cce85f84ee9c0b58646cd33b>`
+-  Release Artefact: poky-4cdc553814640851cce85f84ee9c0b58646cd33b
+-  sha: 460e3a4ede491a9b66c5d262cd9498d5bcca1f2d880885342b08dc32b967f33d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.21/poky-4cdc=
553814640851cce85f84ee9c0b58646cd33b.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.21/poky-4cdc55381464085=
1cce85f84ee9c0b58646cd33b.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=3Dkirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.21 </openembedded-core/log/?h=3Dyocto-4.0.21>`
+-  Git Revision: :oe_git:`c40a3fec49942ac6d25ba33e57e801a550e252c9 </opene=
mbedded-core/commit/?id=3Dc40a3fec49942ac6d25ba33e57e801a550e252c9>`
+-  Release Artefact: oecore-c40a3fec49942ac6d25ba33e57e801a550e252c9
+-  sha: afc2aaf312f9fb2590ae006615557ec605c98eff42bc380a1b2d6e39cfdf8930
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.21/oecore-c4=
0a3fec49942ac6d25ba33e57e801a550e252c9.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.21/oecore-c40a3fec49942=
ac6d25ba33e57e801a550e252c9.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.21 </meta-mingw/log/?h=3Dyocto-4.0.21>`
+-  Git Revision: :yocto_git:`f6b38ce3c90e1600d41c2ebb41e152936a0357d7 </me=
ta-mingw/commit/?id=3Df6b38ce3c90e1600d41c2ebb41e152936a0357d7>`
+-  Release Artefact: meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7
+-  sha: 7d57167c19077f4ab95623d55a24c2267a3a3fb5ed83688659b4c03586373b25
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.21/meta-ming=
w-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.21/meta-mingw-f6b38ce3c=
90e1600d41c2ebb41e152936a0357d7.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.21 </meta-gplv2/log/?h=3Dyocto-4.0.21>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </me=
ta-gplv2/commit/?id=3Dd2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.21/meta-gplv=
2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.21/meta-gplv2-d2f8b5cdb=
285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=3D2.0>`
+-  Tag:  :oe_git:`yocto-4.0.21 </bitbake/log/?h=3Dyocto-4.0.21>`
+-  Git Revision: :oe_git:`ec2a99a077da9aa0e99e8b05e0c65dcbd45864b1 </bitba=
ke/commit/?id=3Dec2a99a077da9aa0e99e8b05e0c65dcbd45864b1>`
+-  Release Artefact: bitbake-ec2a99a077da9aa0e99e8b05e0c65dcbd45864b1
+-  sha: 1cb102f4c8dbd067f0262072e4e629ec7cb423103111ccdde75a09fcb8f55e5f
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.21/bitbake-e=
c2a99a077da9aa0e99e8b05e0c65dcbd45864b1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.21/bitbake-ec2a99a077da=
9aa0e99e8b05e0c65dcbd45864b1.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=3Dkirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.21 </yocto-docs/log/?h=3Dyocto-4.0.21>`
+-  Git Revision: :yocto_git:`512025edd9b3b6b8d0938b35bb6188c9f3b7f17d </yo=
cto-docs/commit/?id=3D512025edd9b3b6b8d0938b35bb6188c9f3b7f17d>`
+
--=20
2.34.1


