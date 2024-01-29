Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B807C48285
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 06:01:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web11.8284.1706508081674425882
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Jan 2024 22:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Sm1rDBYQ;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706508082; x=1738044082;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Owryt9p1HqmzYfQZ3CkxU80MvM4aqQlrrX/SIO5yoxM=;
  b=Sm1rDBYQvhmDddZ/N6Xw138yUoHOyxWl5MERtP1SQkyKMEhZmu/gkglC
   GJ5pMkXksbvYO5PkUraaCaCxxRaEpk3/kChfhXAZXSz2/51RdqDvUe2h/
   nLKEjOBBSR4OIgrks63rHHIosOeeccUr9yuGeNxfkYK4UDteGw6WBAFL0
   dUdT0WX9wYqihC4XPp+tcmicfxyEjazJS889t5eHr375vo4dhleMU/QzM
   3OA7pcWyqFqHYJVT0B8tB9EUIGnbN6EhWx04b2kw0uqZDtarxAJ4JsrRu
   nRq1IevQ4cclEuIwoJcVzj2y5v1SMWWTyYfUIe1gBC4sfJdWl8tMksyo0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2719566"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="2719566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 22:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="29668932"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2024 22:01:16 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guide: add release notes for 4.0.16
Date: Mon, 29 Jan 2024 13:57:04 +0800
Message-Id: <20240129055704.1812957-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jan 2024 06:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4794

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.16.rst | 191 ++++++++++++++++++
 2 files changed, 192 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.16.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index 09fb8ca04..dfe5e186e 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -22,3 +22,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.13
    release-notes-4.0.14
    release-notes-4.0.15
+   release-notes-4.0.16
diff --git a/documentation/migration-guides/release-notes-4.0.16.rst b/documentation/migration-guides/release-notes-4.0.16.rst
new file mode 100644
index 000000000..60bfbd96b
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.16.rst
@@ -0,0 +1,191 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.16 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  bitbake: asyncrpc: Add context manager API
+-  bitbake: data: Add missing dependency handling of remove operator
+-  bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 and 3.9
+-  bitbake: toastergui: verify that an existing layer path is given
+-  build-appliance-image: Update to kirkstone head revision
+-  contributor-guide: add License-Update tag
+-  contributor-guide: fix command option
+-  contributor-guide: use "apt" instead of "aptitude"
+-  cpio: upgrade to 2.14
+-  cve-update-nvd2-native: faster requests with API keys
+-  cve-update-nvd2-native: increase the delay between subsequent request failures
+-  cve-update-nvd2-native: make number of fetch attemtps configurable
+-  cve-update-nvd2-native: remove unused variable CVE_SOCKET_TIMEOUT
+-  dev-manual: Discourage the use of SRC_URI[md5sum]
+-  dev-manual: layers: update link to YP Compatible form
+-  dev-manual: runtime-testing: fix test module name
+-  dev-manual: start.rst: update use of Download page
+-  docs: add :term:`CONVERSION_CMD` definition
+-  documentation: Add :term:`UBOOT_BINARY`, extend :term:`UBOOT_CONFIG`
+-  elfutils: Disable stringop-overflow warning for build host
+-  externalsrc: Ensure :term:`SRCREV` is processed before accessing :term:`SRC_URI`
+-  linux-firmware: upgrade to 20231030
+-  manuals: brief-yoctoprojectqs: align variable order with default local.conf
+-  manuals: document VSCode extension
+-  manuals: fix URL
+-  migration-guides: add release notes for 4.0.15
+-  migration-guides: release 3.5 is actually 4.0
+-  perl: upgrade to 5.34.3
+-  poky.conf: bump version for 4.0.16
+-  pybootchartgui: fix 2 SyntaxWarnings
+-  python3-ptest: skip test_storlines
+-  ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults
+-  ref-manual: classes: remove insserv bbclass
+-  ref-manual: releases.svg: update nanbield release status
+-  ref-manual: resources: sync with master branch
+-  ref-manual: update tested and supported distros
+-  test-manual: add links to python unittest
+-  test-manual: add or improve hyperlinks
+-  test-manual: explicit or fix file paths
+-  test-manual: resource updates
+-  test-manual: text and formatting fixes
+-  test-manual: use working example
+-  testimage: Exclude wtmp from target-dumper commands
+-  testimage: drop target_dumper, host_dumper, and monitor_dumper
+-  tzdata: Upgrade to 2023d
+
+
+Fixes in Yocto-4.0.16
+~~~~~~~~~~~~~~~~~~~~~
+
+-  curl: Revert "curl: Backport fix CVE-2023-32001"
+-  cpio: Fix :cve_mitre:`2023-7207`
+-  curl: Fix :cve:`2023-46218`
+-  dropbear:Fix :cve:`2023-48795`
+-  ffmpeg: Fix :cve:`2022-3964` and :cve:`2022-3965`
+-  ghostscript: Fix :cve:`2023-46751`
+-  gnutls: Fix :cve:`2024-0553` and :cve:`2024-0567`
+-  go: Fix :cve:`2023-39326`
+-  openssh: Fix :cve:`2023-48795`, :cve:`2023-51384` and :cve:`2023-51385`
+-  openssl: Fix :cve:`2023-6129` and :cve_mitre:`2023-6237`
+-  pam: Fix :cve_mitre:`2024-22365`
+-  perl: Fix :cve:`2023-47038`
+-  qemu: Fix :cve:`2023-5088`
+-  sqlite3: Fix :cve:`2023-7104`
+-  systemd: Fix :cve:`2023-7008`
+-  tiff: Fix :cve:`2023-6228`
+-  xserver-xorg: Fix :cve:`2023-6377`, :cve:`2023-6478`, :cve:`2023-6816`, :cve_mitre:`2024-0229`, :cve:`2024-0408`, :cve:`2024-0409`, :cve_mitre:`2024-21885` and :cve_mitre:`2024-21886`
+-  zlib: Ignore :cve:`2023-6992`
+
+
+Known Issues in Yocto-4.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aatir Manzur
+-  Archana Polampalli
+-  Dhairya Nagodra
+-  Dmitry Baryshkov
+-  Enguerrand de Ribaucourt
+-  Hitendra Prajapati
+-  Insu Park
+-  Joshua Watt
+-  Justin Bronder
+-  Jörg Sommer
+-  Khem Raj
+-  Lee Chee Yang
+-  mark.yang
+-  Marta Rybczynska
+-  Martin Jansa
+-  Maxin B. John
+-  Michael Opdenacker
+-  Paul Barker
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Poonam Jadhav
+-  Richard Purdie
+-  Shubham Kulkarni
+-  Simone Weiß
+-  Soumya Sambu
+-  Sourav Pramanik
+-  Steve Sakoman
+-  Trevor Gamblin
+-  Vijay Anusuri
+-  Vivek Kumbhar
+-  Yoann Congal
+-  Yogita Urade
+
+
+Repositories / Downloads for Yocto-4.0.16
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.16 </poky/log/?h=yocto-4.0.16>`
+-  Git Revision: :yocto_git:`54af8c5e80ebf63707ef4e51cc9d374f716da603 </poky/commit/?id=54af8c5e80ebf63707ef4e51cc9d374f716da603>`
+-  Release Artefact: poky-54af8c5e80ebf63707ef4e51cc9d374f716da603
+-  sha: a53ec3a661cf56ca40c0fbf1500288c2c20abe94896d66a572bc5ccf5d92e9d6
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/poky-54af8c5e80ebf63707ef4e51cc9d374f716da603.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/poky-54af8c5e80ebf63707ef4e51cc9d374f716da603.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.16 </openembedded-core/log/?h=yocto-4.0.16>`
+-  Git Revision: :oe_git:`a744a897f0ea7d34c31c024c13031221f9a85f24 </openembedded-core/commit/?id=a744a897f0ea7d34c31c024c13031221f9a85f24>`
+-  Release Artefact: oecore-a744a897f0ea7d34c31c024c13031221f9a85f24
+-  sha: 8c2bc9487597b0caa9f5a1d72b18cfcd1ddc7e6d91f0f051313563d6af95aeec
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/oecore-a744a897f0ea7d34c31c024c13031221f9a85f24.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/oecore-a744a897f0ea7d34c31c024c13031221f9a85f24.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.16 </meta-mingw/log/?h=yocto-4.0.16>`
+-  Git Revision: :yocto_git:`f6b38ce3c90e1600d41c2ebb41e152936a0357d7 </meta-mingw/commit/?id=f6b38ce3c90e1600d41c2ebb41e152936a0357d7>`
+-  Release Artefact: meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7
+-  sha: 7d57167c19077f4ab95623d55a24c2267a3a3fb5ed83688659b4c03586373b25
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/meta-mingw-f6b38ce3c90e1600d41c2ebb41e152936a0357d7.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.16 </meta-gplv2/log/?h=yocto-4.0.16>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.16 </bitbake/log/?h=yocto-4.0.16>`
+-  Git Revision: :oe_git:`ee090484cc25d760b8c20f18add17b5eff485b40 </bitbake/commit/?id=ee090484cc25d760b8c20f18add17b5eff485b40>`
+-  Release Artefact: bitbake-ee090484cc25d760b8c20f18add17b5eff485b40
+-  sha: 479e3a57ae9fbc2aa95292a7554caeef113bbfb28c226ed19547b8dde1c95314
+-  Download Locations:
+   http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.16/bitbake-ee090484cc25d760b8c20f18add17b5eff485b40.tar.bz2
+   http://mirrors.kernel.org/yocto/yocto/yocto-4.0.16/bitbake-ee090484cc25d760b8c20f18add17b5eff485b40.tar.bz2
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag: :yocto_git:`yocto-4.0.16 </yocto-docs/log/?h=yocto-4.0.16>`
+-  Git Revision: :yocto_git:`aba67b58711019a6ba439b2b77337f813ed799ac </yocto-docs/commit/?id=aba67b58711019a6ba439b2b77337f813ed799ac>`
+
-- 
2.34.1


