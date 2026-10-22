Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18773.1792661227095043990
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 02:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BTT90ZrO;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792661227; x=1824197227;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=be7eBq5a/9og6nJ4SJTlcpMaO99n3I/zV1v16Y5VcZE=;
  b=BTT90ZrORg+fr++pEdO/RrzP36MDuetgZ5AgGScV1ZYxeIwR2lh1+ObS
   CE2spEc/C/UrJuTVJofr0ADOBLFE8up9QICvcXKTNJ16UQWjSRtQadzrj
   czfqZYuhWhZaMta+mBU7/4Nso7jNUAVfoen1LsgkrUDFftAJ6qQ8zrKzw
   BD2uOXf35ssiMZEsoRUuBoW5sFuhY70ESDMo2WcoxRszB7Y1WpACXn/xK
   LB4rf+01e+KCg0mDYXzOq5X5k5pzOi+vOT8+wgZ8ScUPi2SbMz2UDPVGm
   xGCWvhSRB2mPVBuUtR/q24Tet3EmssvU6JR8ZRFIzrR/tl/o6Ax9ebw7w
   w==;
X-CSE-ConnectionGUID: ShfFAU1IQzS8FysFd/ANoQ==
X-CSE-MsgGUID: K44Nf3AmTnaBMfJQ3S0U4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1417756"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1417756"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 02:27:07 -0700
X-CSE-ConnectionGUID: 3nPBxl4FSICGpLWtIWtRgQ==
X-CSE-MsgGUID: DXSSGoIOTuGhFsei6Cz5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5163932"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa011.fm.intel.com with ESMTP; 22 Oct 2026 02:27:06 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] release-notes-6.1: update Downloads section
Date: Thu, 22 Oct 2026 17:26:05 +0800
Message-ID: <20261022092606.218597-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 09:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10711
Content-Type: text/plain; charset="utf-8"

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-6.1.rst    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/documentation/migration-guides/release-notes-6.1.rst
index 0c50a7c8c7..d2fd3b940b 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -2282,3 +2282,61 @@ Thanks to the following people who contributed to this release:
 
 Repositories / Downloads for Yocto-|yocto-ver|
 ----------------------------------------------
+
+yocto-docs
+
+-  Repository Location: :yocto_git:`/yocto-docs`
+-  Branch: :yocto_git:`blacksail </yocto-docs/log/?h=blacksail>`
+-  Tag:  :yocto_git:`yocto-6.1 </yocto-docs/log/?h=yocto-6.1>`
+-  Git Revision: :yocto_git:`f26faba8568a3c8fc81d81d3650cc419847a4e17 </yocto-docs/commit/?id=f26faba8568a3c8fc81d81d3650cc419847a4e17>`
+-  Release Artefact: yocto-docs-f26faba8568a3c8fc81d81d3650cc419847a4e17
+-  sha: db04fa7ccbe99ab633f83329490a4af296328c749835559bcc840a3f8aaf9b51
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.1/yocto-docs-f26faba8568a3c8fc81d81d3650cc419847a4e17.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.1/yocto-docs-f26faba8568a3c8fc81d81d3650cc419847a4e17.tar.bz2
+
+openembedded-core
+
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`blacksail </openembedded-core/log/?h=blacksail>`
+-  Tag:  :oe_git:`yocto-6.1 </openembedded-core/log/?h=yocto-6.1>`
+-  Git Revision: :oe_git:`419c1b0f1ed0e3ce22b1022061f763d007883121 </openembedded-core/commit/?id=419c1b0f1ed0e3ce22b1022061f763d007883121>`
+-  Release Artefact: oecore-419c1b0f1ed0e3ce22b1022061f763d007883121
+-  sha: 2619d7b6104324debe382938dfddc6e3b23d8b258e09a3d22c440d0dcafb17be
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.1/oecore-419c1b0f1ed0e3ce22b1022061f763d007883121.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.1/oecore-419c1b0f1ed0e3ce22b1022061f763d007883121.tar.bz2
+
+meta-yocto
+
+-  Repository Location: :yocto_git:`/meta-yocto`
+-  Branch: :yocto_git:`blacksail </meta-yocto/log/?h=blacksail>`
+-  Tag:  :yocto_git:`yocto-6.1 </meta-yocto/log/?h=yocto-6.1>`
+-  Git Revision: :yocto_git:`43946d08974e61361f6313ae348c5d87c12be934 </meta-yocto/commit/?id=43946d08974e61361f6313ae348c5d87c12be934>`
+-  Release Artefact: meta-yocto-43946d08974e61361f6313ae348c5d87c12be934
+-  sha: cc2c54afc85fce7cd429eb356ada6b3b921fe6065169a297c085adba16bead21
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.1/meta-yocto-43946d08974e61361f6313ae348c5d87c12be934.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.1/meta-yocto-43946d08974e61361f6313ae348c5d87c12be934.tar.bz2
+
+bitbake
+
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`2.20 </bitbake/log/?h=2.20>`
+-  Tag:  :oe_git:`yocto-6.1 </bitbake/log/?h=yocto-6.1>`
+-  Git Revision: :oe_git:`634f8dede6b9d71b5a6691499fd05a8678b46eae </bitbake/commit/?id=634f8dede6b9d71b5a6691499fd05a8678b46eae>`
+-  Release Artefact: bitbake-634f8dede6b9d71b5a6691499fd05a8678b46eae
+-  sha: bb9f71d0d6de0d8f456bfe35f6e3f9db518e39d15af3cd49b51a90f2c5488c58
+-  Download Locations:
+
+   https://downloads.yoctoproject.org/releases/yocto/yocto-6.1/bitbake-634f8dede6b9d71b5a6691499fd05a8678b46eae.tar.bz2
+
+   https://mirrors.edge.kernel.org/yocto/yocto/yocto-6.1/bitbake-634f8dede6b9d71b5a6691499fd05a8678b46eae.tar.bz2
+
+
-- 
2.43.0

