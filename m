Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E262C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:28:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web11.409.1749101334053059549
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 22:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JF6y4E6Y;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749101335; x=1780637335;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K/407Yh34SBRJoIAE0ZHVwpzBUJjFycmp07/dAINm4M=;
  b=JF6y4E6YUC7JyKwf8xkKlN1mlXQ8unyBgyy2NDBDEH3tpRYho45Go8C/
   zMkAIZCgOSkIHC3nz5wzRT31JcfGTFLtf7LHxYr4WIjxvD6jcLpRgDeQn
   hagHMXtOvxwEpWESnwYqd+ar/lmFIYruExkPjFx2WPi0kQddIernYeqJN
   x338wzzu1hq1X0NTVkaIITck57hZZec52I4J+W1x6xYOqOlaLSsfkpLfL
   Ix6M+iUl5foNLjmnS08xu9qul6tCNrhtde9BPtEQtsWFqxdmtE/pmTIm/
   2GEMwpsqbmEFoxHow1QnMAN0OBMhD08D77exOntrPtzqGKUFnGxNiGvGv
   Q==;
X-CSE-ConnectionGUID: b1kEi7QKSoK3QdjeXy7BWQ==
X-CSE-MsgGUID: 6K/A+QyXS9Cne+9ozSif3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51298399"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51298399"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:28:55 -0700
X-CSE-ConnectionGUID: GVu+lYwDQqGU111pyKV0Tg==
X-CSE-MsgGUID: bHy3DFLWRuWflHNuQmyJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="149233945"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2025 22:28:54 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-guides: add release notes for 4.0.27
Date: Thu,  5 Jun 2025 13:29:05 +0800
Message-ID: <20250605052905.2343826-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605052905.2343826-1-chee.yang.lee@intel.com>
References: <20250605052905.2343826-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 05:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7001

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.27.rst | 153 ++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.27.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 7c13a33d7..1053ec4c0 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -33,3 +33,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.24
    release-notes-4.0.25
    release-notes-4.0.26
+   release-notes-4.0.27
diff --git a/documentation/migration-guides/release-notes-4.0.27.rst b/documentation/migration-guides/release-notes-4.0.27.rst
new file mode 100644
index 000000000..e37e2f78b
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.27.rst
@@ -0,0 +1,153 @@
+Release notes for Yocto-4.0.27 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.27
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-1178`
+-  busybox: fix :cve_nist:`2023-39810`
+-  connman :fix :cve_nist:`2025-32743`
+-  curl: Ignore :cve_nist:`2025-0725`
+-  ghostscript: Fix :cve_nist:`2025-27830`, :cve_nist:`2025-27831`, :cve_nist:`2025-27832`,
+   :cve_nist:`2025-27834`, :cve_nist:`2025-27835` and :cve_nist:`2025-27836`
+-  ghostscript: Ignore :cve_nist:`2024-29507`, :cve_nist:`2025-27833` and :cve_nist:`2025-27837`
+-  glib-2.0: Fix :cve_nist:`2025-3360`
+-  go: Fix :cve_nist:`2025-22871`
+-  libarchive: Ignore :cve_nist:`2024-48615`
+-  libpam: Fix :cve_nist:`2024-10041`
+-  libsoup-2.4: Fix :cve_nist:`2024-52532`, :cve_nist:`2025-32906` and :cve_nist:`2025-32909`
+-  libsoup: Fix :cve_nist:`2024-52532`, :cve_nist:`2025-32906`, :cve_nist:`2025-32909`,
+   :cve_nist:`2025-32910`, :cve_nist:`2025-32911`, :cve_nist:`2025-32912`, :cve_nist:`2025-32913`
+   and :cve_nist:`2025-32914`
+-  libxml2: Fix :cve_nist:`2025-32414` and :cve_nist:`2025-32415`
+-  ofono: Fix :cve_nist:`2024-7537`
+-  perl: Fix :cve_nist:`2024-56406`
+-  ppp: Fix :cve_nist:`2024-58250`
+-  python3-setuptools: Fix :cve_nist:`2024-6345`
+-  qemu: Ignore :cve_nist:`2023-1386`
+-  ruby: Fix :cve_nist:`2024-43398`
+-  sqlite3: Fix :cve_nist:`2025-29088`
+-  systemd: Ignore :cve_nist:`2022-3821`, :cve_nist:`2022-4415` and :cve_nist:`2022-45873`
+
+
+Fixes in Yocto-4.0.27
+~~~~~~~~~~~~~~~~~~~~~
+
+-  Revert "cve-update-nvd2-native: Tweak to work better with NFS DL_DIR"
+-  build-appliance-image: Update to kirkstone head revision
+-  cve-update-nvd2-native: add workaround for json5 style list
+-  docs: Fix dead links that use the :term:`DISTRO` macro
+-  docs: manuals: remove repeated word
+-  docs: poky.yaml: introduce DISTRO_LATEST_TAG
+-  glibc: Add single-threaded fast path to rand()
+-  glibc: stable 2.35 branch updates
+-  module.bbclass: add KBUILD_EXTRA_SYMBOLS to install
+-  perl: enable _GNU_SOURCE define via d_gnulibc
+-  poky.conf: bump version for 4.0.27
+-  ref-manual/variables.rst: document autotools class related variables
+-  scripts/install-buildtools: Update to 4.0.26
+-  systemd: backport patch to fix journal issue
+-  systemd: systemd-journald fails to setup LogNamespace
+-  tzdata/tzcode-native: upgrade to 2025b
+
+
+Known Issues in Yocto-4.0.27
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.27
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aleksandar Nikolic
+-  Alexander Kanavin
+-  Alon Bar-Lev
+-  Andrew Kreimer
+-  Antonin Godard
+-  Chen Qi
+-  Deepesh Varatharajan
+-  Divya Chellam
+-  Haitao Liu
+-  Haixiao Yan
+-  Hitendra Prajapati
+-  Peter Marko
+-  Praveen Kumar
+-  Priyal Doshi
+-  Shubham Kulkarni
+-  Soumya Sambu
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Yogita Urade
+
+
+Repositories / Downloads for Yocto-4.0.27
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.27 </poky/log/?h=yocto-4.0.27>`
+-  Git Revision: :yocto_git:`ab9a994a8cd8e06b519a693db444030999d273b7 </poky/commit/?id=ab9a994a8cd8e06b519a693db444030999d273b7>`
+-  Release Artefact: poky-ab9a994a8cd8e06b519a693db444030999d273b7
+-  sha: 77a366c17cf29eef15c6ff3f44e73f81c07288c723fd4a6dbd8c7ee9b79933f3
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.27/poky-ab9a994a8cd8e06b519a693db444030999d273b7.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.27/poky-ab9a994a8cd8e06b519a693db444030999d273b7.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.27 </openembedded-core/log/?h=yocto-4.0.27>`
+-  Git Revision: :oe_git:`e8be08a624b2d024715a5c8b0c37f2345a02336b </openembedded-core/commit/?id=e8be08a624b2d024715a5c8b0c37f2345a02336b>`
+-  Release Artefact: oecore-e8be08a624b2d024715a5c8b0c37f2345a02336b
+-  sha: cc5b0fadab021c6dc61f37fc4ff01a1cf657e7c219488ce264bede42f7f6212f
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.27/oecore-e8be08a624b2d024715a5c8b0c37f2345a02336b.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.27/oecore-e8be08a624b2d024715a5c8b0c37f2345a02336b.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.27 </meta-mingw/log/?h=yocto-4.0.27>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.27/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.27/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.27 </meta-gplv2/log/?h=yocto-4.0.27>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.27/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.27/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.27 </bitbake/log/?h=yocto-4.0.27>`
+-  Git Revision: :oe_git:`046871d9fd76efdca7b72718b328d8f545523f7e </bitbake/commit/?id=046871d9fd76efdca7b72718b328d8f545523f7e>`
+-  Release Artefact: bitbake-046871d9fd76efdca7b72718b328d8f545523f7e
+-  sha: e9df0a9f5921b583b539188d66b23f120e1751000e7822e76c3391d5c76ee21a
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.27/bitbake-046871d9fd76efdca7b72718b328d8f545523f7e.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-4.0.27/bitbake-046871d9fd76efdca7b72718b328d8f545523f7e.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.27 </yocto-docs/log/?h=yocto-4.0.27>`
+-  Git Revision: :yocto_git:`0d51e553d5f83eea6634e03ddc9c7740bf72fcea </yocto-docs/commit/?id=0d51e553d5f83eea6634e03ddc9c7740bf72fcea>`
+
-- 
2.43.0


