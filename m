Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C40CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 02:33:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13168.1779157986629462191
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 19:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MPR7kXL0;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779157987; x=1810693987;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pQoXeq3I7i8uJIP+Iiicq9HiJAR44lzkJ1oZF3rd/f8=;
  b=MPR7kXL0eD5LKI76Klh/McrTBjl4/xJ0ZU1X7fbPRtFYaeIeT2InHBBF
   8FFjx0y50DDZqavW+JlYrEaDgKZfG9kRgBSFjnY3/MHbbp5lL4QzryhyT
   PRpxVqpJk7GZSDS8iWS8AY81xptzstWrdlV7fAaLFeUyoNPdX6HSNoUam
   Z7VGzn3y6azmVz6iQ2/D3/mciQuugLHyiARjKwYyF7YLuq0C5eoPd6eu7
   hQtRu3yldODu0QfoHS9vS938cfpvYEk+vh3127yI8LXjRQqZyslHYLX8i
   8RsVBzSQyQC6prqlwoZqhIlZQpi5OMeHZbN/igvd32CbakRNAof8tTI7h
   A==;
X-CSE-ConnectionGUID: r6hAiPwoSSyv1lhBZqy6Zg==
X-CSE-MsgGUID: AXx6FsxJRqqqKDLszcCj3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80078825"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80078825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:56 -0700
X-CSE-ConnectionGUID: tvi+ub2KTfWZdwF4iBW5SQ==
X-CSE-MsgGUID: und2KIIFTaKIrv2cixOcnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277731041"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 19:32:56 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/4] release-note-6.0: update downloads section
Date: Tue, 19 May 2026 09:17:12 +0800
Message-Id: <20260519011715.972400-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 02:33:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9479

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-6.0.rst    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index f93075d7a..00f7cfef2 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -2223,3 +2223,74 @@ Thanks to the following people who contributed to this release:
 
 Repositories / Downloads for Yocto-|yocto-ver|
 ----------------------------------------------
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`wrynose </yocto-docs/log/?h=wrynose>`
+-  Tag:  :yocto_git:`yocto-6.0 </yocto-docs/log/?h=yocto-6.0>`
+-  Git Revision: :yocto_git:`eb74fdfd9e5e579a65e8872d1a73b51e77b14f63 </yocto-docs/commit/?id=eb74fdfd9e5e579a65e8872d1a73b51e77b14f63>`
+-  Release Artefact: yocto-docs-eb74fdfd9e5e579a65e8872d1a73b51e77b14f63
+-  sha: 50d7391b4b4d169649a5628a8f367443eb03fb78faa813b9c20d5214e49ce782
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0/yocto-docs-eb74fdfd9e5e579a65e8872d1a73b51e77b14f63.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0/yocto-docs-eb74fdfd9e5e579a65e8872d1a73b51e77b14f63.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`wrynose </openembedded-core/log/?h=wrynose>`
+-  Tag:  :oe_git:`yocto-6.0 </openembedded-core/log/?h=yocto-6.0>`
+-  Git Revision: :oe_git:`42fa856a00ac16b2a7a83d7ecfa60a5be192b16c </openembedded-core/commit/?id=42fa856a00ac16b2a7a83d7ecfa60a5be192b16c>`
+-  Release Artefact: oecore-42fa856a00ac16b2a7a83d7ecfa60a5be192b16c
+-  sha: 14abd19071d1b31737f5d3946182f21825e0a7121468054bbaa68f207b018fb6
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0/oecore-42fa856a00ac16b2a7a83d7ecfa60a5be192b16c.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0/oecore-42fa856a00ac16b2a7a83d7ecfa60a5be192b16c.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`wrynose </meta-yocto/log/?h=wrynose>`
+-  Tag:  :yocto_git:`yocto-6.0 </meta-yocto/log/?h=yocto-6.0>`
+-  Git Revision: :yocto_git:`904846ae078ee20de073040ebb77c86e19250f56 </meta-yocto/commit/?id=904846ae078ee20de073040ebb77c86e19250f56>`
+-  Release Artefact: meta-yocto-904846ae078ee20de073040ebb77c86e19250f56
+-  sha: d3470939772339d2d70a2bbdd4e01563357c376fdb496d5515a1f96bce4e2ea2
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0/meta-yocto-904846ae078ee20de073040ebb77c86e19250f56.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0/meta-yocto-904846ae078ee20de073040ebb77c86e19250f56.tar.bz2
+
+meta-mingw
+
+-  Repository Location: :yocto_git:`/meta-mingw`
+-  Branch: :yocto_git:`wrynose </meta-mingw/log/?h=wrynose>`
+-  Tag:  :yocto_git:`yocto-6.0 </meta-mingw/log/?h=yocto-6.0>`
+-  Git Revision: :yocto_git:`a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315 </meta-mingw/commit/?id=a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315>`
+-  Release Artefact: meta-mingw-a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
+-  sha: cea731150cd3caedd90ca6a82bf050a00c3705cea166d24a6077d07b1b7b2404
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0/meta-mingw-a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0/meta-mingw-a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.18 </bitbake/log/?h=2.18>`
+-  Tag:  :oe_git:`yocto-6.0 </bitbake/log/?h=yocto-6.0>`
+-  Git Revision: :oe_git:`33581c84f3a85008239acbd940501a35de48dc91 </bitbake/commit/?id=33581c84f3a85008239acbd940501a35de48dc91>`
+-  Release Artefact: bitbake-33581c84f3a85008239acbd940501a35de48dc91
+-  sha: 8a0b0243b50b6e004f3350824628f69ee66be0d3a28bc25f3d96b35406015ba7
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.0/bitbake-33581c84f3a85008239acbd940501a35de48dc91.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.0/bitbake-33581c84f3a85008239acbd940501a35de48dc91.tar.bz2
+
-- 
2.37.3


