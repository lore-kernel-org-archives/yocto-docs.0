Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A4AC3601A
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 03:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.5324.1743651906358668839
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 20:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XNHFftBF;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743651906; x=1775187906;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c/1+CLOA/RSblynwz5FdI0Ui1oWvLnG+pHojfwOJzo8=;
  b=XNHFftBFDxN6WTpBne0KYO7QXpr8VwACmuisJ+Guc3N9zjFw5W3qDUq1
   ZATEXgOubq2Dgf0K3l9bxGVkWVTvPQWNGBhwccrhh+ecAX9szl8WDIAIM
   qc2a6yTm9+MJFT6TuEKPumjdDQKPhbbZxNzJVcqewgkDVzyEPLf3XNU6F
   /stP3CB8C3coZiNhUOAGUE4XY2llChv426VIEpce9/gtI3ytl8R54AlKc
   LtgWTJ7BaG9ffjV+wpUn41tqopT6kdrZ4BSrjsuNEJcrEYeLlyhh2XObX
   LtCuLf5/2hnw+H3wdD7ga55xJm77XiiVRujcL4sx8mZSw8A4anyXXuUDn
   Q==;
X-CSE-ConnectionGUID: rlHnr7o9T7iSy0ocTwafjQ==
X-CSE-MsgGUID: IFQDS4ekQhqmaXx/lKvXFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62581038"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62581038"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:45:06 -0700
X-CSE-ConnectionGUID: CQ+slX3/QleMnDjR/qeoFg==
X-CSE-MsgGUID: kheP1tEVQOKgYeInCRsx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131863995"
Received: from cheeyang-desk1.png.intel.com ([10.107.249.127])
  by orviesa004.jf.intel.com with ESMTP; 02 Apr 2025 20:45:06 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [Patch v2 1/2] migration-guides: add release notes for 5.1.4
Date: Thu,  3 Apr 2025 11:44:15 +0800
Message-Id: <20250403034416.1505203-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 03:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6701

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
v2: cv_mitre -> cve_nist
    add cve fix for libtasn1, libxml2 and xwayland 
    xserver-xorg ignore -> fix

 .../migration-guides/release-5.1.rst          |   1 +
 .../migration-guides/release-notes-5.1.4.rst  | 137 ++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-5.1.4.rst

diff --git a/documentation/migration-guides/release-5.1.rst b/documentation/migration-guides/release-5.1.rst
index 57def68e2..820b918e0 100644
--- a/documentation/migration-guides/release-5.1.rst
+++ b/documentation/migration-guides/release-5.1.rst
@@ -10,3 +10,4 @@ Release 5.1 (styhead)
    release-notes-5.1.1
    release-notes-5.1.2
    release-notes-5.1.3
+   release-notes-5.1.4
diff --git a/documentation/migration-guides/release-notes-5.1.4.rst b/documentation/migration-guides/release-notes-5.1.4.rst
new file mode 100644
index 000000000..4df784097
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.1.4.rst
@@ -0,0 +1,137 @@
+Release notes for Yocto-5.1.4 (Styhead)
+---------------------------------------
+
+Security Fixes in Yocto-5.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  binutils: Fix :cve_nist:`2025-0840`
+-  grub: Fix :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2024-45776`,
+   :cve_nist:`2024-45777`, :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2024-45780`,
+   :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-45783`, :cve_nist:`2024-56737`,
+   :cve_nist:`2025-0622`, :cve_nist:`2025-0624`, :cve_nist:`2025-0677`, :cve_nist:`2025-0678`,
+   :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`,
+   :cve_nist:`2025-0690`, :cve_nist:`2025-1118` and :cve_nist:`2025-1125`
+-  libtasn1: fix :cve_nist:`2024-12133`
+-  libxml2: fix :cve_nist:`2024-56171`, :cve_nist:`2025-24928` and :cve_nist:`2025-27113`
+-  openssh: Fix :cve_nist:`2025-26465` and :cve_nist:`2025-26466`
+-  puzzles: Ignore :cve_nist:`2024-13769`, :cve_nist:`2024-13770` and :cve_nist:`2025-0837`
+-  subversion: Ignore :cve_nist:`2024-45720`
+-  xserver-xorg: Fix :cve_nist:`2025-26594`, :cve_nist:`2025-26595`, :cve_nist:`2025-26596`,
+   :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`, :cve_nist:`2025-26600`
+   and :cve_nist:`2025-26601`
+-  xwayland: Fix :cve_nist:`2025-26594`, :cve_nist:`2025-26595`, :cve_nist:`2025-26596`,
+   :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`, :cve_nist:`2025-26600`
+   and :cve_nist:`2025-26601`
+
+
+Fixes in Yocto-5.1.4
+~~~~~~~~~~~~~~~~~~~~
+
+-  bitbake: event/utils: Avoid deadlock from lock_timeout() and recursive events
+-  bitbake: utils: Add signal blocking for lock_timeout
+-  bitbake: utils: Print information about lock issue before exiting
+-  bitbake: utils: Tweak lock_timeout logic
+-  build-appliance-image: Update to styhead head revision
+-  docs: Remove all mention of core-image-lsb
+-  grub: backport strlcpy function
+-  grub: drop obsolete CVE statuses
+-  icu: Adjust ICU_DATA_DIR path on big endian targets
+-  libtasn1: upgrade to 4.20.0
+-  libxml2: upgrade to 2.13.6
+-  migration-guides: add release notes for 4.0.25 and 5.1.3
+-  poky.conf: bump version for 5.1.4
+-  ref-manual: Add missing variable :term:`IMAGE_ROOTFS_MAXSIZE`
+-  ref-manual: don't refer to poky-lsb
+-  ref-manual: remove OE_IMPORTS
+-  tzcode-native: Fix compiler setting from 2023d version
+-  tzdata/tzcode-native: upgrade to 2025a
+-  vulnerabilities/classes: remove references to cve-check text format
+-  xserver-xf86-config: add a configuration fragment to disable screen blanking
+-  xserver-xf86-config: remove obsolete configuration files
+-  xserver-xorg: upgrade to 21.1.16
+-  xwayland: upgrade to 21.1.6
+
+
+Known Issues in Yocto-5.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  NA
+
+Contributors to Yocto-5.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+
+Thanks to the following people who contributed to this release:
+
+-  Alessio Cascone
+-  Lee Chee Yang
+-  Makarios Christakis
+-  Marta Rybczynska
+-  Peter Marko
+-  Priyal Doshi
+-  Richard Purdie
+-  Ross Burton
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Wang Mingyu
+-  Weisser, Pascal
+
+
+Repositories / Downloads for Yocto-5.1.4
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`styhead </poky/log/?h=styhead>`
+-  Tag:  :yocto_git:`yocto-5.1.4 </poky/log/?h=yocto-5.1.4>`
+-  Git Revision: :yocto_git:`70dc28ac287bf35541270cae1d99130a0f6b7b5f </poky/commit/?id=70dc28ac287bf35541270cae1d99130a0f6b7b5f>`
+-  Release Artefact: poky-70dc28ac287bf35541270cae1d99130a0f6b7b5f
+-  sha: 63f1d3d47a28bd9b41c89db6e1f2657c04233a00d10210795e766c0bc265d766
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4/poky-70dc28ac287bf35541270cae1d99130a0f6b7b5f.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.1.4/poky-70dc28ac287bf35541270cae1d99130a0f6b7b5f.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`styhead </openembedded-core/log/?h=styhead>`
+-  Tag:  :oe_git:`yocto-5.1.4 </openembedded-core/log/?h=yocto-5.1.4>`
+-  Git Revision: :oe_git:`2d94f4b8a852dc761f89e5106347e239382df5fb </openembedded-core/commit/?id=2d94f4b8a852dc761f89e5106347e239382df5fb>`
+-  Release Artefact: oecore-2d94f4b8a852dc761f89e5106347e239382df5fb
+-  sha: 344ac23f814c049d69b06cee42c43b7b422506ce84397406caef09becb2555bf
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4/oecore-2d94f4b8a852dc761f89e5106347e239382df5fb.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.1.4/oecore-2d94f4b8a852dc761f89e5106347e239382df5fb.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`styhead </meta-mingw/log/?h=styhead>`
+-  Tag:  :yocto_git:`yocto-5.1.4 </meta-mingw/log/?h=yocto-5.1.4>`
+-  Git Revision: :yocto_git:`77fe18d4f8ec34501045c5d92ce7e13b1bd129e9 </meta-mingw/commit/?id=77fe18d4f8ec34501045c5d92ce7e13b1bd129e9>`
+-  Release Artefact: meta-mingw-77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
+-  sha: 4c7f8100a3675d9863e51825def3df5b263ffc81cd57bae26eedbc156d771534
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4/meta-mingw-77fe18d4f8ec34501045c5d92ce7e13b1bd129e9.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.1.4/meta-mingw-77fe18d4f8ec34501045c5d92ce7e13b1bd129e9.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.10 </bitbake/log/?h=2.10>`
+-  Tag:  :oe_git:`yocto-5.1.4 </bitbake/log/?h=yocto-5.1.4>`
+-  Git Revision: :oe_git:`82b9f42126983579da03bdbb4e3ebf07346118a7 </bitbake/commit/?id=82b9f42126983579da03bdbb4e3ebf07346118a7>`
+-  Release Artefact: bitbake-82b9f42126983579da03bdbb4e3ebf07346118a7
+-  sha: 209d62c5262f2287af60e7fe2343c29ab25b5088de4da71de89016e75900285a
+-  Download Locations:
+   https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4/bitbake-82b9f42126983579da03bdbb4e3ebf07346118a7.tar.bz2
+   https://mirrors.kernel.org/yocto/yocto/yocto-5.1.4/bitbake-82b9f42126983579da03bdbb4e3ebf07346118a7.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`styhead </yocto-docs/log/?h=styhead>`
+-  Tag: :yocto_git:`yocto-5.1.4 </yocto-docs/log/?h=yocto-5.1.4>`
+-  Git Revision: :yocto_git:`f0324b8f14881227336f84325cdebd0518e17796 </yocto-docs/commit/?id=f0324b8f14881227336f84325cdebd0518e17796>`
+
-- 
2.34.1


