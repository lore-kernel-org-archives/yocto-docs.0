Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B44C7EE2E
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 19:39:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3571.1684957155584559165
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 12:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nf480XFU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D5EA41BF207;
	Wed, 24 May 2023 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684957154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Clk+xVWXj3Dr6IELpf31Y3bM8MN+l9BMR+kq9gOlfyQ=;
	b=nf480XFURap9nAkS/Jti2fXwdY2Kxp+xv+fo7oiSmV0sP4pjCnXRjwI7DXplodSRj08fSf
	cxM5vePCWzHFEERsonk//I8Ee2pymjKoSqKEelAtDrzhJ9TTzCOFf2rQ31uZo6v9q2HVNn
	4cQRdaHmshcaRi0fmgWTOBr90IXQF/f9TkPEks1IuvS6sTJvDA5JPyfNRBdjDtIbiwiWoz
	WQ1ECICEfD9j7wDUOzN5alMBMIuy8iajMMd+L1WgppvKpNs53DwayvsarPzkkLdC/YYgFB
	+mqejoNpqD0aoCI25PFUsvX9MRNVzk2CSl0Iu+krUBUhAd41CYsbZXd+/UZqxw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Lee Chee Yang <chee.yang.lee@intel.com>
Subject: [PATCH 4/4] [kirkstone] migration-guides: add release notes for 4.0.10
Date: Wed, 24 May 2023 21:39:03 +0200
Message-Id: <20230524193903.3113544-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
References: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 19:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3965

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.10.rst | 180 ++++++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.10.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation=
/migration-guides/release-4.0.rst
index 1fc74a0f6d..05c2705e8e 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -16,3 +16,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.7
    release-notes-4.0.8
    release-notes-4.0.9
+   release-notes-4.0.10
diff --git a/documentation/migration-guides/release-notes-4.0.10.rst b/docu=
mentation/migration-guides/release-notes-4.0.10.rst
new file mode 100644
index 0000000000..f37c3471ea
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.10.rst
@@ -0,0 +1,180 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.10 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve:`2023-1579`, :cve:`2023-1972`, :cve_mitre:`2023-2558=
4`, :cve_mitre:`2023-25585` and :cve_mitre:`2023-25588`
+-  cargo : Ignore :cve:`2022-46176`
+-  connman: Fix :cve:`2023-28488`
+-  curl: Fix :cve:`2023-27533`, :cve:`2023-27534`, :cve:`2023-27535`, :cve=
:`2023-27536` and :cve:`2023-27538`
+-  ffmpeg: Fix :cve:`2022-48434`
+-  freetype: Fix :cve:`2023-2004`
+-  ghostscript: Fix :cve_mitre:`2023-29979`
+-  git: Fix :cve:`2023-25652` and :cve:`2023-29007`
+-  go: Fix :cve:`2022-41722`, :cve:`2022-41724`, :cve:`2022-41725`, :cve:`=
2023-24534`, :cve:`2023-24537` and :cve:`2023-24538`
+-  go: Ignore :cve:`2022-41716`
+-  libxml2: Fix :cve:`2023-28484` and :cve:`2023-29469`
+-  libxpm: Fix :cve:`2022-44617`, :cve:`2022-46285` and :cve:`2022-4883`
+-  linux-yocto: Ignore :cve:`2021-3759`, :cve:`2021-4135`, :cve:`2021-4155=
`, :cve:`2022-0168`, :cve:`2022-0171`, :cve:`2022-1016`, :cve:`2022-1184`, =
:cve:`2022-1198`, :cve:`2022-1199`, :cve:`2022-1462`, :cve:`2022-1734`, :cv=
e:`2022-1852`, :cve:`2022-1882`, :cve:`2022-1998`, :cve:`2022-2078`, :cve:`=
2022-2196`, :cve:`2022-2318`, :cve:`2022-2380`, :cve:`2022-2503`, :cve:`202=
2-26365`, :cve:`2022-2663`, :cve:`2022-2873`, :cve:`2022-2905`, :cve:`2022-=
2959`, :cve:`2022-3028`, :cve:`2022-3078`, :cve:`2022-3104`, :cve:`2022-310=
5`, :cve:`2022-3106`, :cve:`2022-3107`, :cve:`2022-3111`, :cve:`2022-3112`,=
 :cve:`2022-3113`, :cve:`2022-3115`, :cve:`2022-3202`, :cve:`2022-32250`, :=
cve:`2022-32296`, :cve:`2022-32981`, :cve:`2022-3303`, :cve:`2022-33740`, :=
cve:`2022-33741`, :cve:`2022-33742`, :cve:`2022-33743`, :cve:`2022-33744`, =
:cve:`2022-33981`, :cve:`2022-3424`, :cve:`2022-3435`, :cve:`2022-34918`, :=
cve:`2022-3521`, :cve:`2022-3545`, :cve:`2022-3564`, :cve:`2022-3586`, :cve=
:`2022-3594`, :cve:`2022-36123`, :cve:`2022-3621`, :cve:`2022-3623`, :cve:`=
2022-3629`, :cve:`2022-3633`, :cve:`2022-3635`, :cve:`2022-3646`, :cve:`202=
2-3649`, :cve:`2022-36879`, :cve:`2022-36946`, :cve:`2022-3707`, :cve:`2022=
-39188`, :cve:`2022-39190`, :cve:`2022-39842`, :cve:`2022-40307`, :cve:`202=
2-40768`, :cve:`2022-4095`, :cve:`2022-41218`, :cve:`2022-4139`, :cve:`2022=
-41849`, :cve:`2022-41850`, :cve:`2022-41858`, :cve:`2022-42328`, :cve:`202=
2-42329`, :cve:`2022-42703`, :cve:`2022-42721`, :cve:`2022-42722`, :cve:`20=
22-42895`, :cve:`2022-4382`, :cve:`2022-4662`, :cve:`2022-47518`, :cve:`202=
2-47519`, :cve:`2022-47520`, :cve:`2022-47929`, :cve:`2023-0179`, :cve:`202=
3-0394`, :cve:`2023-0461`, :cve:`2023-0590`, :cve:`2023-1073`, :cve:`2023-1=
074`, :cve:`2023-1077`, :cve:`2023-1078`, :cve:`2023-1079`, :cve:`2023-1095=
`, :cve:`2023-1118`, :cve:`2023-1249`, :cve:`2023-1252`, :cve:`2023-1281`, =
:cve:`2023-1382`, :cve:`2023-1513`, :cve:`2023-1829`, :cve:`2023-1838`, :cv=
e:`2023-1998`, :cve:`2023-2006`, :cve:`2023-2008`, :cve:`2023-2162`, :cve:`=
2023-2166`, :cve:`2023-2177`, :cve:`2023-22999`, :cve:`2023-23002`, :cve:`2=
023-23004`, :cve:`2023-23454`, :cve:`2023-23455`, :cve:`2023-23559`, :cve:`=
2023-25012`, :cve:`2023-26545`, :cve:`2023-28327` and :cve:`2023-28328`
+-  nasm: Fix :cve:`2022-44370`
+-  python3-cryptography: Fix :cve:`2023-23931`
+-  qemu: Ignore :cve:`2023-0664`
+-  ruby: Fix :cve:`2023-28755` and :cve:`2023-28756`
+-  screen: Fix :cve:`2023-24626`
+-  shadow: Fix :cve:`2023-29383`
+-  tiff: Fix :cve:`2022-4645`
+-  webkitgtk: Fix :cve:`2022-32888` and :cve:`2022-32923`
+-  xserver-xorg: Fix :cve:`2023-1393`
+
+
+Fixes in Yocto-4.0.10
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bitbake: bin/utils: Ensure locale en_US.UTF-8 is available on the system
+-  build-appliance-image: Update to kirkstone head revision
+-  cmake: add CMAKE_SYSROOT to generated toolchain file
+-  glibc: stable 2.35 branch updates.
+-  kernel-devsrc: depend on python3-core instead of python3
+-  kernel: improve initramfs bundle processing time
+-  libarchive: Enable acls, xattr for native as well as target
+-  libbsd: Add correct license for all packages
+-  libpam: Fix the xtests/tst-pam_motd[1|3] failures
+-  libxpm: upgrade to 3.5.15
+-  linux-firmware: upgrade to 20230404
+-  linux-yocto/5.15: upgrade to v5.15.108
+-  migration-guides: add release-notes for 4.0.9
+-  oeqa/utils/metadata.py: Fix running oe-selftest running with no distro =
set
+-  openssl: Move microblaze to linux-latomic config
+-  package.bbclass: correct check for /build in copydebugsources()
+-  poky.conf: bump version for 4.0.10
+-  populate_sdk_base: add zip options
+-  populate_sdk_ext.bbclass: set :term:`METADATA_REVISION` with an :term:`=
DISTRO` override
+-  run-postinsts: Set dependency for ldconfig to avoid boot issues
+-  update-alternatives.bbclass: fix old override syntax
+-  wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
+-  wpebackend-fdo: upgrade to 1.14.2
+-  xorg-lib-common: Add variable to set tarball type
+-  xserver-xorg: upgrade to 21.1.8
+
+
+Known Issues in Yocto-4.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Archana Polampalli
+-  Arturo Buzarra
+-  Bruce Ashfield
+-  Christoph Lauer
+-  Deepthi Hemraj
+-  Dmitry Baryshkov
+-  Frank de Brabander
+-  Hitendra Prajapati
+-  Joe Slater
+-  Kai Kang
+-  Kyle Russell
+-  Lee Chee Yang
+-  Mark Hatle
+-  Martin Jansa
+-  Mingli Yu
+-  Narpat Mali
+-  Pascal Bach
+-  Pawan Badganchi
+-  Peter Bergin
+-  Peter Marko
+-  Piotr =C5=81obacz
+-  Randolph Sapp
+-  Ranjitsinh Rathod
+-  Ross Burton
+-  Shubham Kulkarni
+-  Siddharth Doshi
+-  Steve Sakoman
+-  Sundeep KOKKONDA
+-  Thomas Roos
+-  Virendra Thakur
+-  Vivek Kumbhar
+-  Wang Mingyu
+-  Xiangyu Chen
+-  Yash Shinde
+-  Yoann Congal
+-  Yogita Urade
+-  Zhixiong Chi
+
+
+Repositories / Downloads for Yocto-4.0.10
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.10 </poky/log/?h=3Dyocto-4.0.10>`
+-  Git Revision: :yocto_git:`f53ab3a2ff206a130cdc843839dd0ea5ec4ad02f </po=
ky/commit/?id=3Df53ab3a2ff206a130cdc843839dd0ea5ec4ad02f>`
+-  Release Artefact: poky-f53ab3a2ff206a130cdc843839dd0ea5ec4ad02f
+-  sha: 8820aeac857ce6bbd1c7ef26cadbb86eca02be93deded253b4a5f07ddd69255d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.10/poky-f53a=
b3a2ff206a130cdc843839dd0ea5ec4ad02f.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.10/poky-f53ab3a2ff206a1=
30cdc843839dd0ea5ec4ad02f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=3Dkirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.10 </openembedded-core/log/?h=3Dyocto-4.0.10>`
+-  Git Revision: :oe_git:`d2713785f9cd2d58731df877bc8b7bcc71b6c8e6 </opene=
mbedded-core/commit/?id=3Dd2713785f9cd2d58731df877bc8b7bcc71b6c8e6>`
+-  Release Artefact: oecore-d2713785f9cd2d58731df877bc8b7bcc71b6c8e6
+-  sha: 78e084a1aceaaa6ec022702f29f80eaffade3159e9c42b6b8985c1b7ddd2fbab
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.10/oecore-d2=
713785f9cd2d58731df877bc8b7bcc71b6c8e6.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.10/oecore-d2713785f9cd2=
d58731df877bc8b7bcc71b6c8e6.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.10 </meta-mingw/log/?h=3Dyocto-4.0.10>`
+-  Git Revision: :yocto_git:`a90614a6498c3345704e9611f2842eb933dc51c1 </me=
ta-mingw/commit/?id=3Da90614a6498c3345704e9611f2842eb933dc51c1>`
+-  Release Artefact: meta-mingw-a90614a6498c3345704e9611f2842eb933dc51c1
+-  sha: 49f9900bfbbc1c68136f8115b314e95d0b7f6be75edf36a75d9bcd1cca7c6302
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.10/meta-ming=
w-a90614a6498c3345704e9611f2842eb933dc51c1.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.10/meta-mingw-a90614a64=
98c3345704e9611f2842eb933dc51c1.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=3Dkirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.10 </meta-gplv2/log/?h=3Dyocto-4.0.10>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </me=
ta-gplv2/commit/?id=3Dd2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.10/meta-gplv=
2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.10/meta-gplv2-d2f8b5cdb=
285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=3D2.0>`
+-  Tag:  :oe_git:`yocto-4.0.10 </bitbake/log/?h=3Dyocto-4.0.10>`
+-  Git Revision: :oe_git:`0c6f86b60cfba67c20733516957c0a654eb2b44c </bitba=
ke/commit/?id=3D0c6f86b60cfba67c20733516957c0a654eb2b44c>`
+-  Release Artefact: bitbake-0c6f86b60cfba67c20733516957c0a654eb2b44c
+-  sha: 4caa94ee4d644017b0cc51b702e330191677f7d179018cbcec8b1793949ebc74
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.10/bitbake-0=
c6f86b60cfba67c20733516957c0a654eb2b44c.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.10/bitbake-0c6f86b60cfb=
a67c20733516957c0a654eb2b44c.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=3Dkirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.10 </yocto-docs/log/?h=3Dyocto-4.0.10>`
+-  Git Revision: :yocto_git:`8388be749806bd0bf4fccf1005dae8f643aa4ef4 </yo=
cto-docs/commit/?id=3D8388be749806bd0bf4fccf1005dae8f643aa4ef4>`
+
--=20
2.34.1


