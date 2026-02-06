Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988F0EB28FE
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 09:42:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8040.1770370954342566121
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 01:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YeZNWDwN;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770370954; x=1801906954;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rb5CfYz8ADORjlrJrQGJLELV/JcUrZUJb5fcB4oEKtI=;
  b=YeZNWDwNASHbwU14eQ7At68KLl6gi24qTSvNb7FqsVegzranzZ+orRos
   h3ZPFXG6yrigpguOQCah/+hMrz4CxUMrXvi4iCXxdweJ24w59FubqA4r+
   P6pS6476f+uPbMC9lEb+OovzOiD9yAaGNdrwmCxhXPKYRJ96/FyVTzHqp
   wX6m5866WZ5GSKGy+w7tMvxtEUWgiIiLzPjgfFWu+/rTN+kWoozFc1gXZ
   FKJY8YwgUCE0w5sLkm6on56zB1ccT/21+gGw1P25bmNVVtSQQ1B+KbufY
   HNKJKqlx/PUISI/wACLhSzp6uGV3hl45P2Rf3WEb+6sRhj7BcoZcsjatU
   Q==;
X-CSE-ConnectionGUID: Bs1altuARfWr7tIj4GNQhA==
X-CSE-MsgGUID: AGUV3n0pRHuxQzYlI0UNQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82946771"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="82946771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 01:42:30 -0800
X-CSE-ConnectionGUID: DuxJqCKhSLaRJJesOx7nhQ==
X-CSE-MsgGUID: FNp+bHxXT7y2wWS+DbJI5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210723681"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 01:42:27 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-guides: add release notes for 4.0.32
Date: Fri,  6 Feb 2026 17:41:46 +0800
Message-ID: <20260206094146.61584-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206094146.61584-1-chee.yang.lee@intel.com>
References: <20260206094146.61584-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Feb 2026 09:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8875

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.32.rst | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.32.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index b143a8595..9b0cc01a1 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -38,3 +38,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.29
    release-notes-4.0.30
    release-notes-4.0.31
+   release-notes-4.0.32
diff --git a/documentation/migration-guides/release-notes-4.0.32.rst b/documentation/migration-guides/release-notes-4.0.32.rst
new file mode 100644
index 000000000..652b17eed
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.32.rst
@@ -0,0 +1,194 @@
+Release notes for Yocto-4.0.32 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.32
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bind: Fix :cve_nist:`2025-8677`, :cve_nist:`2025-40778` and :cve_nist:`2025-40780`
+-  binutils: Fix :cve_nist:`2025-11412` and :cve_nist:`2025-11413`
+-  curl: Ignore :cve_nist:`2025-10966`
+-  elfutils: Fix :cve_nist:`2025-1376` and :cve_nist:`2025-1377`
+-  gnutls: Fix :cve_nist:`2025-9820`
+-  go: Fix :cve_nist:`2024-24783`, :cve_nist:`2025-58187`, :cve_nist:`2025-58189`,
+   :cve_nist:`2025-61723` and :cve_nist:`2025-61724`
+-  libarchive: Fix :cve_nist:`2025-60753`
+-  libarchive: Fix 2 security issue (https://github.com/libarchive/libarchive/pull/2753 and
+   https://github.com/libarchive/libarchive/pull/2768)
+-  libpng: Fix :cve_nist:`2025-64505`, :cve_nist:`2025-64506`, :cve_nist:`2025-64720`,
+   :cve_nist:`2025-65018` and :cve_nist:`2025-66293`
+-  libxml2: Fix :cve_nist:`2025-7425`
+-  musl: Fix :cve_nist:`2025-26519`
+-  openssh: Fix :cve_nist:`2025-61984` and :cve_nist:`2025-61985`
+-  python3-idna: Fix :cve_nist:`2024-3651`
+-  python3-urllib3: Fix :cve_nist:`2024-37891`
+-  python3: fix :cve_nist:`2025-6075`
+-  ruby: Fix :cve_nist:`2024-35176`, :cve_nist:`2024-39908` and :cve_nist:`2024-41123`
+-  rust-cross-canadian: Ignore :cve_nist:`2024-43402`
+-  u-boot: Fix :cve_nist:`2024-42040`
+-  wpa-supplicant: Fix :cve_nist:`2025-24912`
+-  xserver-xorg: Fix :cve_nist:`2025-62229`, :cve_nist:`2025-62230` and :cve_nist:`2025-62231`
+-  xwayland: Fix :cve_nist:`2025-62229`, :cve_nist:`2025-62230` and :cve_nist:`2025-62231`
+
+
+Fixes in Yocto-4.0.32
+~~~~~~~~~~~~~~~~~~~~~
+
+-  babeltrace2: fetch with https protocol
+-  bind: upgrade to 9.18.41
+-  build-appliance-image: Update to kirkstone head revision
+-  dev-manual/layers.rst: document "bitbake-layers show-machines"
+-  dev-manual/new-recipe.rst: replace 'bitbake -e' with 'bitbake-getvar'
+-  dev-manual/new-recipe.rst: typo, "whith" -> "which"
+-  dev-manual/new-recipe.rst: update "recipetool -h" output
+-  dev-manual: debugging: use bitbake-getvar in Viewing Variable Values section
+-  documentation: link to the Releases page on yoctoproject.org instead of wiki
+-  efibootmgr: update :term:`SRC_URI` branch
+-  flac: patch seeking bug
+-  goarch.bbclass: do not leak :term:`TUNE_FEATURES` into crosssdk task signatures
+-  kernel-dev: add disable config example
+-  kernel-dev: common: migrate bitbake -e to bitbake-getvar
+-  libmicrohttpd: disable experimental code by default
+-  migration-guides: add release notes for 4.0.31
+-  oe-build-perf-report: relax metadata matching rules
+-  overview-manual: migrate to SVG + fix typo
+-  poky.conf: bump version for 4.0.32
+-  python3-urllib3: upgrade to 1.26.20
+-  recipes: Don't use ftp.gnome.org
+-  ref-manual: variables: migrate the :term:`OVERRIDES` note to bitbake-getvar
+-  systemd-bootchart: update :term:`SRC_URI` branch
+-  xf86-video-intel: correct :term:`SRC_URI` as freedesktop anongit is down
+
+
+Known Issues in Yocto-4.0.32
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.32
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+-  Alexander Kanavin
+-  Archana Polampalli
+-  Divya Chellam
+-  Gyorgy Sarvari
+-  Hitendra Prajapati
+-  Hongxu Jia
+-  Jason Schonberg
+-  Lee Chee Yang
+-  Peter Marko
+-  Praveen Kumar
+-  Quentin Schulz
+-  Richard Purdie
+-  Robert P. J. Day
+-  Ross Burton
+-  Saquib Iltaf
+-  Soumya Sambu
+-  Steve Sakoman
+-  Vijay Anusuri
+-  Walter Werner SCHNEIDER
+
+
+Repositories / Downloads for Yocto-4.0.32
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.32 </yocto-docs/log/?h=yocto-4.0.32>`
+-  Git Revision: :yocto_git:`4b9df539fa06fb19ed8b51ef2d46e5c56779de81 </yocto-docs/commit/?id=4b9df539fa06fb19ed8b51ef2d46e5c56779de81>`
+-  Release Artefact: yocto-docs-4b9df539fa06fb19ed8b51ef2d46e5c56779de81
+-  sha: 70ee2caf576683c5f31ac5a592cde1c0650ece25cfcd5ff3cc7eedf531575611
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/yocto-docs-4b9df539fa06fb19ed8b51ef2d46e5c56779de81.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/yocto-docs-4b9df539fa06fb19ed8b51ef2d46e5c56779de81.tar.bz2
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.32 </poky/log/?h=yocto-4.0.32>`
+-  Git Revision: :yocto_git:`2c05660b21c7cc1082aeac8b75d8a2d82e249f63 </poky/commit/?id=2c05660b21c7cc1082aeac8b75d8a2d82e249f63>`
+-  Release Artefact: poky-2c05660b21c7cc1082aeac8b75d8a2d82e249f63
+-  sha: d7a55a18a597a7b140a81586b7ca6379c208ebbb3285de36c48fde10882947d8
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/poky-2c05660b21c7cc1082aeac8b75d8a2d82e249f63.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/poky-2c05660b21c7cc1082aeac8b75d8a2d82e249f63.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.32 </openembedded-core/log/?h=yocto-4.0.32>`
+-  Git Revision: :oe_git:`2ed3f8b938579dbbb804e04c45a968cc57761db7 </openembedded-core/commit/?id=2ed3f8b938579dbbb804e04c45a968cc57761db7>`
+-  Release Artefact: oecore-2ed3f8b938579dbbb804e04c45a968cc57761db7
+-  sha: 11b9632586dfbf3f0ef69eca2014a8002f25ca8d53cfe9424e27361ba3a20831
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/oecore-2ed3f8b938579dbbb804e04c45a968cc57761db7.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/oecore-2ed3f8b938579dbbb804e04c45a968cc57761db7.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`kirkstone </meta-yocto/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.32 </meta-yocto/log/?h=yocto-4.0.32>`
+-  Git Revision: :yocto_git:`77b40877c179ea3ce5c37c7ba1831e9c0e289266 </meta-yocto/commit/?id=77b40877c179ea3ce5c37c7ba1831e9c0e289266>`
+-  Release Artefact: meta-yocto-77b40877c179ea3ce5c37c7ba1831e9c0e289266
+-  sha: e908d42690881cd6e07b9ca18a21eb8761a0ec72d940b12905622e75ba913974
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/meta-yocto-77b40877c179ea3ce5c37c7ba1831e9c0e289266.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/meta-yocto-77b40877c179ea3ce5c37c7ba1831e9c0e289266.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.32 </meta-mingw/log/?h=yocto-4.0.32>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.32 </meta-gplv2/log/?h=yocto-4.0.32>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.32 </bitbake/log/?h=yocto-4.0.32>`
+-  Git Revision: :oe_git:`8e2d1f8de055549b2101614d85454fcd1d0f94b2 </bitbake/commit/?id=8e2d1f8de055549b2101614d85454fcd1d0f94b2>`
+-  Release Artefact: bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2
+-  sha: fad4e7699bae62082118e89785324b031b0af0743064caee87c91ba28549afb0
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.32/bitbake-8e2d1f8de055549b2101614d85454fcd1d0f94b2.tar.bz2
+
-- 
2.43.0


