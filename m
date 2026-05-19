Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95700CD343F
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 02:33:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13168.1779157986629462191
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 19:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JtB0enlP;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779157988; x=1810693988;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VJiNsVJUohrHGI0o8VlvP3T5VMC2Y+6EnKXJf+fk8Sk=;
  b=JtB0enlP4derrD820kKtzPCSS5A44TQyUvBWhq/dZf0m4h7Ny4T/OTfB
   LWCMtgJoOSTOz/cckb4/xfMzsiuoX+J/4BJj9Biht4oRPkebsQw+X4hlU
   W6eMFMGvSQGPIUHYVxT54Wy7QQXEa+DriVGfcv+Tskqj99VFuIayuFQ2Y
   drsZmQ/wNdN6KfQbCJyi/eW61azZkt5l1o0fNeXDu1rQvR7o8Iyp0XxlQ
   Vxe5CJ9hX+hGLBIr1rfnpKuJAcebpXr0dj4Y0KCu11kaWL5267XTr5XhZ
   42UbmXE5Q7AQCh7Yb7T2RrOSCtCmOE8RKozKYixmmo+f2U6Hff18peeNt
   Q==;
X-CSE-ConnectionGUID: h3w1Gn1hRxyhTdxp73bQzA==
X-CSE-MsgGUID: FWMPBmWnQCu10wCMDqydrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80078829"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80078829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:58 -0700
X-CSE-ConnectionGUID: DJqvO/lZTbKWRwxbQ+MI8w==
X-CSE-MsgGUID: VhkPHE56RHqFXhR72/5lvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277731045"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 19:32:58 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/4] migration-guide: add release notes for 4.0.35
Date: Tue, 19 May 2026 09:17:14 +0800
Message-Id: <20260519011715.972400-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20260519011715.972400-1-chee.yang.lee@intel.com>
References: <20260519011715.972400-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 02:33:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9481

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.35.rst | 198 ++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.35.rst

diff --git a/documentation/migration-guides/release-4.0.rst b/documentation/migration-guides/release-4.0.rst
index daacd92ff..e0b9a8fb5 100644
--- a/documentation/migration-guides/release-4.0.rst
+++ b/documentation/migration-guides/release-4.0.rst
@@ -41,3 +41,4 @@ Release 4.0 (kirkstone)
    release-notes-4.0.32
    release-notes-4.0.33
    release-notes-4.0.34
+   release-notes-4.0.35
diff --git a/documentation/migration-guides/release-notes-4.0.35.rst b/documentation/migration-guides/release-notes-4.0.35.rst
new file mode 100644
index 000000000..f8336d1e9
--- /dev/null
+++ b/documentation/migration-guides/release-notes-4.0.35.rst
@@ -0,0 +1,198 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release notes for Yocto-4.0.35 (Kirkstone)
+------------------------------------------
+
+Security Fixes in Yocto-4.0.35
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  alsa-lib: Fix :cve_nist:`2026-25068`
+-  busybox: Fix :cve_nist:`2025-60876`
+-  curl: Fix :cve_nist:`2025-14524`, :cve_nist:`2026-1965`, :cve_nist:`2026-3783` and
+   :cve_nist:`2026-3784`
+-  ffmpeg: Fix :cve_nist:`2025-10256`
+-  gdk-pixbuf: Fix :cve_nist:`2025-6199`
+-  inetutils: Fix :cve_nist:`2026-28372`
+-  libarchive: Fix :cve_nist:`2026-4111`
+-  libpam: Fix :cve_nist:`2024-10963`
+-  linux-yocto/5.15: Fix :cve_nist:`2025-40082`, :cve_nist:`2025-68358`, :cve_nist:`2025-71089`,
+   :cve_nist:`2025-71220`, :cve_nist:`2025-71222`, :cve_nist:`2025-71232`, :cve_nist:`2025-71233`,
+   :cve_nist:`2025-71235`, :cve_nist:`2025-71236`, :cve_nist:`2025-71237`, :cve_nist:`2025-71238`,
+   :cve_nist:`2026-23111`, :cve_nist:`2026-23112`, :cve_nist:`2026-23169`, :cve_nist:`2026-23190`,
+   :cve_nist:`2026-23193`, :cve_nist:`2026-23198`, :cve_nist:`2026-23202`, :cve_nist:`2026-23206`,
+   :cve_nist:`2026-23209`, :cve_nist:`2026-23216`, :cve_nist:`2026-23221`, :cve_nist:`2026-23222`,
+   :cve_nist:`2026-23228`, :cve_nist:`2026-23229`, :cve_nist:`2026-23231`, :cve_nist:`2026-23234`,
+   :cve_nist:`2026-23235`, :cve_nist:`2026-23236`, :cve_nist:`2026-23237` and :cve_nist:`2026-23238`
+-  ncurses: Fix :cve_nist:`2025-69720`
+-  python3: Fix :cve_nist:`2024-6923`, :cve_nist:`2025-15282`, :cve_nist:`2025-59375`,
+   :cve_nist:`2026-0865`, :cve_nist:`2026-24515` and :cve_nist:`2026-25210`
+-  python3-pip: Fix :cve_nist:`2026-1703`
+-  python3-pyopenssl: Fix :cve_nist:`2026-27448` and :cve_nist:`2026-27459`
+-  sqlite3: Fix :cve_nist:`2025-70873`
+-  tiff: Fix :cve_nist:`2025-61143` and :cve_nist:`2025-61144`
+-  vim: Fix :cve_nist:`2026-25749`, :cve_nist:`2026-26269`, :cve_nist:`2026-28418`,
+   :cve_nist:`2026-28419` and :cve_nist:`2026-33412`
+
+
+Fixes in Yocto-4.0.35
+~~~~~~~~~~~~~~~~~~~~~
+
+-  bitbake: tests/fetch: Avoid using git protocol in tests
+-  build-appliance-image: Update to kirkstone head revision
+-  contributor-guide/submit-changes.rst: Added missing word
+-  create-pull-request: Keep commit hash to be pulled in cover email
+-  createrepo-c: Fix createrepo-c-native build on GCC14 hosts (e.g. Fedora 41)
+-  gtk+3: fix incompatible-pointer-types errors for native build on Fedora 41
+-  libcomps: Fix libcomps-native build on GCC14 hosts (e.g. Fedora 41)
+-  libpam: re-add missing libgen include
+-  libtheora: set :term:`CVE_PRODUCT`
+-  linux-yocto/5.15: update to v5.15.201
+-  lsb.py: strip ' from os-release file
+-  migration-guide: add release notes for 4.0.33 4.0.34
+-  oeqa/manual: Default to https git protocol for YP/OE repos
+-  oeqa/sdk: Default to https git protocol for YP/OE repos
+-  oeqa/selftest/git-submodule-test: Default to https git protocol for YP/OE repos
+-  overview-manual: escape wildcard in inline markup
+-  poky.conf: Bump version for 4.0.35 release
+-  python3: upgrade to 3.10.20
+-  README.OE-Core: update contributor links and add kirkstone prefix
+-  recipes: Default to https git protocol for YP/OE repos
+-  recipetool: Recognise https://git. as git urls
+-  ref-manual/system-requirements.rst: update end-of-life distros
+-  scripts/install-buildtools: Update to 4.0.34
+-  scripts: Default to https git protocol for YP/OE repos
+-  selftest/scripts: Update old git protocol references
+-  tcl: skip http11 tests
+-  tiff: set status of CVE-2025-61145 as fixed by patch for :cve_nist:`2025-8961`
+-  tzdata,tzcode-native: Upgrade to 2026a
+
+
+Known Issues in Yocto-4.0.35
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+- N/A
+
+
+Contributors to Yocto-4.0.35
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Aleksandar Nikolic
+-  Antonin Godard
+-  Bruce Ashfield
+-  Fabien Thomas
+-  Hitendra Prajapati
+-  Jinfeng Wang
+-  Ken Kurematsu
+-  Kristiyan Chakarov
+-  Lee Chee Yang
+-  Martin Jansa
+-  Paul Barker
+-  Peter Marko
+-  Richard Purdie
+-  Ross Burton
+-  Shaik Moin
+-  Vijay Anusuri
+-  Yanis BINARD
+-  Yoann Congal
+
+Repositories / Downloads for Yocto-4.0.35
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.35 </yocto-docs/log/?h=yocto-4.0.35>`
+-  Git Revision: :yocto_git:`ce6734c68649739c635675a133fa77edb9865028 </yocto-docs/commit/?id=ce6734c68649739c635675a133fa77edb9865028>`
+-  Release Artefact: yocto-docs-ce6734c68649739c635675a133fa77edb9865028
+-  sha: ddb6fac4d257f4f76836055cafad529729e99c293d3b8d3dabef926fad5e725f
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/yocto-docs-ce6734c68649739c635675a133fa77edb9865028.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/yocto-docs-ce6734c68649739c635675a133fa77edb9865028.tar.bz2
+
+poky
+
+-  Repository Location: :yocto_git:`/poky`
+-  Branch: :yocto_git:`kirkstone </poky/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.35 </poky/log/?h=yocto-4.0.35>`
+-  Git Revision: :yocto_git:`93431249a6260da7bd29ee3ca32145d89e5b8259 </poky/commit/?id=93431249a6260da7bd29ee3ca32145d89e5b8259>`
+-  Release Artefact: poky-93431249a6260da7bd29ee3ca32145d89e5b8259
+-  sha: a8e95213248c5400276611754f2c98b8d8972e166bdf41433c45fcdd2bf668cb
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/poky-93431249a6260da7bd29ee3ca32145d89e5b8259.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/poky-93431249a6260da7bd29ee3ca32145d89e5b8259.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`kirkstone </openembedded-core/log/?h=kirkstone>`
+-  Tag:  :oe_git:`yocto-4.0.35 </openembedded-core/log/?h=yocto-4.0.35>`
+-  Git Revision: :oe_git:`51259c7e933a2ac8ebc01604d6e65607b76b7b56 </openembedded-core/commit/?id=51259c7e933a2ac8ebc01604d6e65607b76b7b56>`
+-  Release Artefact: oecore-51259c7e933a2ac8ebc01604d6e65607b76b7b56
+-  sha: 2cd531e2a107849e7a452e71e41f22b42160979066e10d0661e97acfab125b1f
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/oecore-51259c7e933a2ac8ebc01604d6e65607b76b7b56.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/oecore-51259c7e933a2ac8ebc01604d6e65607b76b7b56.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`kirkstone </meta-yocto/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.35 </meta-yocto/log/?h=yocto-4.0.35>`
+-  Git Revision: :yocto_git:`34e3c9a19b8b955116109a2e9528966db3fced37 </meta-yocto/commit/?id=34e3c9a19b8b955116109a2e9528966db3fced37>`
+-  Release Artefact: meta-yocto-34e3c9a19b8b955116109a2e9528966db3fced37
+-  sha: 18da6dbb745d5e4e42a93527c36751778155e3762728b0b1020b890480402dde
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/meta-yocto-34e3c9a19b8b955116109a2e9528966db3fced37.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/meta-yocto-34e3c9a19b8b955116109a2e9528966db3fced37.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`kirkstone </meta-mingw/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.35 </meta-mingw/log/?h=yocto-4.0.35>`
+-  Git Revision: :yocto_git:`87c22abb1f11be430caf4372e6b833dc7d77564e </meta-mingw/commit/?id=87c22abb1f11be430caf4372e6b833dc7d77564e>`
+-  Release Artefact: meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e
+-  sha: f0bc4873e2e0319fb9d6d6ab9b98eb3f89664d4339a167d2db6a787dd12bc1a8
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/meta-mingw-87c22abb1f11be430caf4372e6b833dc7d77564e.tar.bz2
+
+meta-gplv2
+
+-  Repository Location: :yocto_git:`/meta-gplv2`
+-  Branch: :yocto_git:`kirkstone </meta-gplv2/log/?h=kirkstone>`
+-  Tag:  :yocto_git:`yocto-4.0.35 </meta-gplv2/log/?h=yocto-4.0.35>`
+-  Git Revision: :yocto_git:`d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a </meta-gplv2/commit/?id=d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a>`
+-  Release Artefact: meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
+-  sha: c386f59f8a672747dc3d0be1d4234b6039273d0e57933eb87caa20f56b9cca6d
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/meta-gplv2-d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.0 </bitbake/log/?h=2.0>`
+-  Tag:  :oe_git:`yocto-4.0.35 </bitbake/log/?h=yocto-4.0.35>`
+-  Git Revision: :oe_git:`7fd0197fd5fedd23cc885b5e7e816d86a392fdf9 </bitbake/commit/?id=7fd0197fd5fedd23cc885b5e7e816d86a392fdf9>`
+-  Release Artefact: bitbake-7fd0197fd5fedd23cc885b5e7e816d86a392fdf9
+-  sha: 6c01ff2b4b0060ef3d6d3f1fc11690094b22865af4989946544d08d74b473ec9
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.35/bitbake-7fd0197fd5fedd23cc885b5e7e816d86a392fdf9.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-4.0.35/bitbake-7fd0197fd5fedd23cc885b5e7e816d86a392fdf9.tar.bz2
+
-- 
2.37.3


