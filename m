Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AADD39409
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 09:59:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12034.1775123937419192239
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 02:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Kq39ihlh;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775123937; x=1806659937;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3ThLTKwP9O0cQSR2VRUPWoqrhPXLSXInwcXkHPusfSI=;
  b=Kq39ihlhe996fLZZDbvNfVVVhCtCo1cJoYFQLfqMFXQcqqeuBZEkuwMI
   igyJixBKO6uBe7LmCXzE62IMUJzvOLFHEGh2cUlNl70t1j7ah2dR9nRmj
   qRA7+mUJpEG0C+4Vs7awfM8/ddDt7ZumEE5iAyjrk8waL0z8U4duEYrZi
   l34DKkfEutbBUAbdgPfl/7PsLfu7VIuMoiO8s1iuzWt8yWELp9JKiBUh7
   smJ85LO4jHR5uC+r+h4X30mdUx28Bi53iga9rOriwDOhK1ave1a2lh1Cj
   e0sTJqc+80jC/1Lp2446M7Po/yBSWK5Z16+tuhm7RVunJnkHNYQ7ha8vm
   Q==;
X-CSE-ConnectionGUID: 6ObZ/r9LQFSYs4i5gR4ldQ==
X-CSE-MsgGUID: Ql/YiuK7TgKm41A3LXbPeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87638455"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87638455"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 02:58:57 -0700
X-CSE-ConnectionGUID: 0E/EO6s2Qsq3OSFV9DdMiA==
X-CSE-MsgGUID: Cf3MubEUQq+/dungAw/aVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231343363"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2026 02:58:55 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] migration-guide: add release notes for 4.0.33 4.0.34
Date: Thu,  2 Apr 2026 17:58:10 +0800
Message-ID: <20260402095811.60426-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 09:59:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9164

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   2 +
 .../migration-guides/release-notes-4.0.33.rst | 182 +++++++++++++++++
 .../migration-guides/release-notes-4.0.34.rst | 191 ++++++++++++++++++
 3 files changed, 375 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.33.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.34.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 9b0cc01a1..daacd92ff 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -39,3 +39,5 @@ Release 4.0 (kirkstone)
    release-notes-4.0.30
    release-notes-4.0.31
    release-notes-4.0.32
+   release-notes-4.0.33
+   release-notes-4.0.34
diff --git a/documentation/migration-guides/release-notes-4.0.33.rst b/documentation/migration-guides/release-notes-4.0.33.rst
new file mode 100644
index 000000000..d393b59c2
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.33.rst
@@ -0,0 +1,182 @@
+Release notes for Yocto-4.0.33 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.33
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-1181`, :cve_nist:`2025-11494`, :cve_nist:`2025-11839` and
+   :cve_nist:`2025-11840`
+-  cups: Fix :cve_nist:`2025-58436` and :cve_nist:`2025-61915`
+-  curl: Fix :cve_nist:`2025-14017`, :cve_nist:`2025-15079` and :cve_nist:`2025-15224`
+-  dropbear: Fix :cve_nist:`2019-6111`
+-  glib-2.0: Fix :cve_nist:`2025-13601`, :cve_nist:`2025-14087` and :cve_nist:`2025-14512`
+-  gnupg: Fix :cve_nist:`2025-68973`
+-  go: Fix :cve_nist:`2023-39323`, :cve_nist:`2025-61727` and :cve_nist:`2025-61729`
+-  go: Fix :cve_nist:`2025-58187` (update patch)
+-  grub: Fix :cve_nist:`2025-61661`, :cve_nist:`2025-61662`, :cve_nist:`2025-61663` and
+   :cve_nist:`2025-61664`
+-  libarchive: Fix :cve_nist:`2025-60753` (update patch)
+-  libpcap: Fix :cve_nist:`2025-11961` and :cve_nist:`2025-11964`
+-  libsoup: fix :cve_nist:`2025-12105`
+-  libxslt: Fix :cve_nist:`2025-11731`
+-  python3: Fix :cve_nist:`2025-13836`
+-  python3-urllib3: Fix :cve_nist:`2025-66418`
+-  qemu: Fix :cve_nist:`2025-12464`
+-  qemu: Ignore :cve_nist:`2025-54566` and :cve_nist:`2025-54567`
+-  rsync: Fix :cve_nist:`2025-10158`
+-  util-linux: Fix :cve_nist:`2025-14104`
+
+
+Fixes in Yocto-4.0.33
+~~~~~~~~~~~~~~~~~~~~~
+
+-  build-appliance-image: Update to kirkstone head revision
+-  contributor-guide/recipe-style-guide.rst: explain difference between layer and recipe license(s)
+-  cross.bbclass: Propagate dependencies to outhash
+-  cups: allow unknown directives in conf files
+-  docs: Add a new "Security" section
+-  oeqa: Use 2.14 release of cpio instead of 2.13
+-  overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
+-  overview-manual/yp-intro.rst: fix SDK type in bullet list
+-  overview-manual/yp-intro.rst: link to YP members and participants
+-  overview-manual: convert YP-flow-diagram.png to SVG
+-  poky.conf: Bump version for 4.0.33 release
+-  pseudo: Upgrade to 1.9.2+git125b020dd2
+-  ref-manual/classes.rst: document the image-container class
+-  ref-manual/release-process.rst: add a "Development Cycle" section
+-  ref-manual/svg/releases.svg: mark styhead and walnascar EOL
+-  ref-manual/svg/releases.svg: mark whinlatter as current release
+-  ref-manual/variables.rst: document the :term:`CCACHE_TOP_DIR` variable
+-  scripts/install-buildtools: Update to 4.0.31
+-  test-manual/ptest.rst: detail the exit code and output requirements
+
+
+Known Issues in Yocto-4.0.33
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.33
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aleksandar Nikolic
+-  Antonin Godard
+-  Changqing Li
+-  Deepesh Varatharajan
+-  Hitendra Prajapati
+-  Jiaying Song
+-  Kai Kang
+-  Khem Raj
+-  Libo Chen
+-  Liyin Zhang
+-  Martin Jansa
+-  Mingli Yu
+-  Paul Barker
+-  Peter Marko
+-  Richard Purdie
+-  Robert Yang
+-  Vijay Anusuri
+-  Yash Shinde
+
+Repositories / Downloads for Yocto-4.0.33
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.33 </yocto-docs/log/?h=yocto-4.0.33>`
+-  Git Revision: :yocto_git:`6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9 </yocto-docs/commit/?id=6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9>`
+-  Release Artefact: yocto-docs-6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9
+-  sha: 42a0eb89c8f87a9a966aecb8265f463486d4383cb67d1e67382ddf9d4d7f88b5
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/yocto-docs-6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/yocto-docs-6799b1be5d48f4bf5dcd0b16c2dbc2e297d4ecd9.tar.bz2
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.33 </poky/log/?h=yocto-4.0.33>`
+-  Git Revision: :yocto_git:`ff118ede826a9ae45eb35025a5f7f612880fba01 </poky/commit/?id=ff118ede826a9ae45eb35025a5f7f612880fba01>`
+-  Release Artefact: poky-ff118ede826a9ae45eb35025a5f7f612880fba01
+-  sha: 2a8c24406fa96fc52728a96f25136a3fd7ee652eea6e12319a6b7c0457ccfdfd
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/poky-ff118ede826a9ae45eb35025a5f7f612880fba01.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/poky-ff118ede826a9ae45eb35025a5f7f612880fba01.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.33 </openembedded-core/log/?h=yocto-4.0.33>`
+-  Git Revision: :oe_git:`036f76ea35c49a78d612093dcd8eb1fac7ded8d7 </openembedded-core/commit/?id=036f76ea35c49a78d612093dcd8eb1fac7ded8d7>`
+-  Release Artefact: oecore-036f76ea35c49a78d612093dcd8eb1fac7ded8d7
+-  sha: fc180ff224529fd73a7aec4a4cf5beb40fba17646ee694715cf603baba26610c
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/oecore-036f76ea35c49a78d612093dcd8eb1fac7ded8d7.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/oecore-036f76ea35c49a78d612093dcd8eb1fac7ded8d7.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`kirkstone </meta-yocto/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.33 </meta-yocto/log/?h=yocto-4.0.33>`
+-  Git Revision: :yocto_git:`677379f21941363d50f9d946963542b4ccb7e27c </meta-yocto/commit/?id=677379f21941363d50f9d946963542b4ccb7e27c>`
+-  Release Artefact: meta-yocto-677379f21941363d50f9d946963542b4ccb7e27c
+-  sha: 90f52c406f4e69748b8d73eee07b8a1247d19cc29f4893174f110a034b10415f
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/meta-yocto-677379f21941363d50f9d946963542b4ccb7e27c.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/meta-yocto-677379f21941363d50f9d946963542b4ccb7e27c.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.33 </meta-mingw/log/?h=yocto-4.0.33>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.33 </meta-gplv2/log/?h=yocto-4.0.33>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.33 </bitbake/log/?h=yocto-4.0.33>`
+-  Git Revision: :oe_git:`8e2d1f8de055549b2101614d85454fcd1d0f94b2 </bitbake/commit/?id=8e2d1f8de055549b2101614d85454fcd1d0f94b2>`
+-  Release Artefact: bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2
+-  sha: fad4e7699bae62082118e89785324b031b0af0743064caee87c91ba28549afb0
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.33/bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.33/bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2.tar.bz2
+
diff --git a/documentation/migration-guides/release-notes-4.0.34.rst b/documentation/migration-guides/release-notes-4.0.34.rst
new file mode 100644
index 000000000..d2de165df
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.34.rst
@@ -0,0 +1,191 @@
+Release notes for Yocto-4.0.34 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.34
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  avahi: Fix :cve_nist:`2026-24401`, :cve_nist:`2025-68276`, :cve_nist:`2025-68468` and
+   :cve_nist:`2025-68471`
+-  bind: Fix :cve_nist:`2025-13878`
+-  expat: Fix :cve_nist:`2026-24515` and :cve_nist:`2026-25210`
+-  ffmpeg: Ignore :cve_nist:`2025-25468` and :cve_nist:`2025-25469`
+-  glib-2.0: Fix :cve_nist:`2026-0988`, :cve_nist:`2026-1484`, :cve_nist:`2026-1485` and
+   :cve_nist:`2026-1489`
+-  glibc: Fix :cve_nist:`2025-15281`, :cve_nist:`2026-0861` and :cve_nist:`2026-0915`
+-  harfbuzz: Ignore :cve_nist:`2026-22693`
+-  inetutils: Fix :cve_nist:`2026-24061`
+-  libpng: Fix :cve_nist:`2026-22695`, :cve_nist:`2026-22801` and :cve_nist:`2026-25646`
+-  libtasn1: Fix :cve_nist:`2025-13151`
+-  libxml2: Fix :cve_nist:`2026-0990` and :cve_nist:`2026-0992`
+-  linux-yocto/5.15: Fix :cve_nist:`2022-49465`, :cve_nist:`2023-54207`, :cve_nist:`2025-22058`,
+   :cve_nist:`2025-40040`, :cve_nist:`2025-40149`, :cve_nist:`2025-40164`, :cve_nist:`2025-68211`,
+   :cve_nist:`2025-68340`, :cve_nist:`2025-68365`, :cve_nist:`2025-68725`, :cve_nist:`2025-68817`,
+   :cve_nist:`2025-71147`, :cve_nist:`2025-71154`, :cve_nist:`2025-71162`, :cve_nist:`2025-71163`,
+   :cve_nist:`2026-22976`, :cve_nist:`2026-22977`, :cve_nist:`2026-22978`, :cve_nist:`2026-22980`,
+   :cve_nist:`2026-22982`, :cve_nist:`2026-22984`, :cve_nist:`2026-22990`, :cve_nist:`2026-22991`,
+   :cve_nist:`2026-22992`, :cve_nist:`2026-22997`, :cve_nist:`2026-22998`, :cve_nist:`2026-22999`,
+   :cve_nist:`2026-23060`, :cve_nist:`2026-23061`, :cve_nist:`2026-23063`, :cve_nist:`2026-23064`,
+   :cve_nist:`2026-23076`, :cve_nist:`2026-23078`, :cve_nist:`2026-23080`, :cve_nist:`2026-23083`,
+   :cve_nist:`2026-23084`, :cve_nist:`2026-23085`, :cve_nist:`2026-23087`, :cve_nist:`2026-23089`,
+   :cve_nist:`2026-23090`, :cve_nist:`2026-23091`, :cve_nist:`2026-23093`, :cve_nist:`2026-23095`,
+   :cve_nist:`2026-23096`, :cve_nist:`2026-23097`, :cve_nist:`2026-23119`, :cve_nist:`2026-23120`,
+   :cve_nist:`2026-23121`, :cve_nist:`2026-23124`, :cve_nist:`2026-23125`, :cve_nist:`2026-23133`,
+   :cve_nist:`2026-23146`, :cve_nist:`2026-23150`, :cve_nist:`2026-23164`, :cve_nist:`2026-23167`
+   and :cve_nist:`2026-23170`
+-  openssl: Fix :cve_nist:`2025-15467`, :cve_nist:`2026-22795`, :cve_nist:`2026-22796`,
+   :cve_nist:`2025-68160`, :cve_nist:`2025-69418`, :cve_nist:`2025-69419`, :cve_nist:`2025-69420`
+   and :cve_nist:`2025-69421`
+-  python3: Fix :cve_nist:`2025-12084` and :cve_nist:`2025-13837`
+-  vim: Ignore :cve_nist:`2025-66476`
+-  zlib: Ignore :cve_nist:`2026-22184`
+
+
+Fixes in Yocto-4.0.34
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bind: Upgrade to 9.18.44
+-  build-appliance-image: Update to kirkstone head revision
+-  classes/buildhistory: Do not sign buildhistory commits
+-  dev-manual/packages.rst: fix example recipe version
+-  dev-manual/packages.rst: pr server: fix and explain why r0.X increments on :term:`SRCREV` change
+-  dev-manual/packages.rst: rename r0.0 to r0 when :term:`PR` server is not enabled
+-  glibc: stable 2.35 branch updates
+-  linux-yocto/5.15: update to v5.15.199
+-  migration-guides: add release notes for 4.0.32
+-  openssl: upgrade to 3.0.19
+-  poky.conf: Bump version for 4.0.34 release
+-  poky.conf: add fedora-41, debian-12, rocky-8&9 to :term:`SANITY_TESTED_DISTROS`
+-  pseudo: Update to 1.9.3+git43cbd8fb49
+-  ref-manual/classes.rst: fix broken links to U-Boot documentation
+-  ref-manual/system-requirements.rst: update untested distros
+-  scripts/install-buildtools: Update to 4.0.32
+-  u-boot: move CVE patch out of u-boot-common.inc
+-  what-i-wish-id-known.rst: replace figure by the new SVG
+
+
+Known Issues in Yocto-4.0.34
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.34
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aleksandar Nikolic
+-  Amaury Couderc
+-  Ankur Tyagi
+-  Antonin Godard
+-  Bruce Ashfield
+-  Fabio Berton
+-  Hugo SIMELIERE
+-  Lee Chee Yang
+-  Michael Opdenacker
+-  Paul Barker
+-  Peter Marko
+-  Richard Purdie
+-  Scott Murray
+-  Vijay Anusuri
+-  Yoann Congal
+
+Repositories / Downloads for Yocto-4.0.34
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.34 </yocto-docs/log/?h=yocto-4.0.34>`
+-  Git Revision: :yocto_git:`7c348dd67cfd169b1a56bf969606b03dccb76c56 </yocto-docs/commit/?id=7c348dd67cfd169b1a56bf969606b03dccb76c56>`
+-  Release Artefact: yocto-docs-7c348dd67cfd169b1a56bf969606b03dccb76c56
+-  sha: 0677fc3aee3c936599f3bcffbe16792494058bd3506ca3ab1697ceac1822829b
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/yocto-docs-7c348dd67cfd169b1a56bf969606b03dccb76c56.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/yocto-docs-7c348dd67cfd169b1a56bf969606b03dccb76c56.tar.bz2
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.34 </poky/log/?h=yocto-4.0.34>`
+-  Git Revision: :yocto_git:`8334e82e1d85e50557bd3da64054fc9e3eafc495 </poky/commit/?id=8334e82e1d85e50557bd3da64054fc9e3eafc495>`
+-  Release Artefact: poky-8334e82e1d85e50557bd3da64054fc9e3eafc495
+-  sha: 74fcc57d1dd3bb0c6ef77bfaaeca7504f393e705a55149cf52d4b61981c9c387
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/poky-8334e82e1d85e50557bd3da64054fc9e3eafc495.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/poky-8334e82e1d85e50557bd3da64054fc9e3eafc495.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.34 </openembedded-core/log/?h=yocto-4.0.34>`
+-  Git Revision: :oe_git:`7b6c9faa301a6d058ca34e230586f6a81ffa3ffb </openembedded-core/commit/?id=7b6c9faa301a6d058ca34e230586f6a81ffa3ffb>`
+-  Release Artefact: oecore-7b6c9faa301a6d058ca34e230586f6a81ffa3ffb
+-  sha: 375a22e3e229064749e78c80c44cde95adcedd26df76045fccefa3a9d3fa14ad
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/oecore-7b6c9faa301a6d058ca34e230586f6a81ffa3ffb.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/oecore-7b6c9faa301a6d058ca34e230586f6a81ffa3ffb.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`kirkstone </meta-yocto/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.34 </meta-yocto/log/?h=yocto-4.0.34>`
+-  Git Revision: :yocto_git:`1d3874a383023a5e2433e0fcfd87ac5d1e6d341d </meta-yocto/commit/?id=1d3874a383023a5e2433e0fcfd87ac5d1e6d341d>`
+-  Release Artefact: meta-yocto-1d3874a383023a5e2433e0fcfd87ac5d1e6d341d
+-  sha: baf48bbe1f29686d502c0c6f311c7723b0a18f08e7efbf89c150589102285dbe
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/meta-yocto-1d3874a383023a5e2433e0fcfd87ac5d1e6d341d.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/meta-yocto-1d3874a383023a5e2433e0fcfd87ac5d1e6d341d.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.34 </meta-mingw/log/?h=yocto-4.0.34>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.34 </meta-gplv2/log/?h=yocto-4.0.34>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.34 </bitbake/log/?h=yocto-4.0.34>`
+-  Git Revision: :oe_git:`8e2d1f8de055549b2101614d85454fcd1d0f94b2 </bitbake/commit/?id=8e2d1f8de055549b2101614d85454fcd1d0f94b2>`
+-  Release Artefact: bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2
+-  sha: fad4e7699bae62082118e89785324b031b0af0743064caee87c91ba28549afb0
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.34/bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.34/bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2.tar.bz2
+
-- 
2.43.0


