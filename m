Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF89C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 15:35:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web10.63737.1715614516624709212
 for <docs@lists.yoctoproject.org>;
 Mon, 13 May 2024 08:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=POpYT/oz;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715614517; x=1747150517;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sl8cAoBNyvpGKPuvTFyg2U2BlZyvPZmTUXQ1fThJ1QI=;
  b=POpYT/ozGuLz+Nf3tKgBnpjKYBzUpZbNyz7ZuGyCVGdpchpB7MQ9v2w9
   KPCfXnEENDX3xd4FIz6/+aRvk0CosYebLFUzjDjbZaQEH2Rzw0Z8fkzXP
   SPL66jvnMrT3SB2IqjMCxAoq5epPkzmHPNbBExcRT3YcOql7H87hMdsyX
   HtW6Q7lhLrtSTCfQQkvIxmIZQCgXiLiqJtNyypr0oDco5GiQrmtRDLtAC
   6lPz6ecnUr2PDUZ2ZHha+z4TDhm8N9EwdiHzucx4/G6IN0A0ZbkvLnhsw
   g/I0QDtyUsiLW1zf5ZZLoNhRKW/6kultX0BOXb8on5yYl0yrm99AM4dxN
   g==;
X-CSE-ConnectionGUID: 8PEFy+c1RjO52wZSA4F0wQ==
X-CSE-MsgGUID: vRmn4ed0QJqPybeO4eihuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22131220"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22131220"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:35:17 -0700
X-CSE-ConnectionGUID: MB8FcoeRTOeRZGDjzaJn5w==
X-CSE-MsgGUID: daiSc13wSsCohChCIAvOzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35126920"
Received: from cheeyang-vm.png.intel.com ([10.107.234.33])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2024 08:35:15 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.0.18: specify backported license
Date: Mon, 13 May 2024 22:58:58 +0800
Message-Id: <20240513145858.89639-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 May 2024 15:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5218

From: Lee Chee Yang <chee.yang.lee@intel.com>

Align with finalized text-based release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-4.0.18.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.0.18.rst b/documentation/migration-guides/release-notes-4.0.18.rst
index fc8cd83c0..d5a2a7f6c 100644
--- a/documentation/migration-guides/release-notes-4.0.18.rst
+++ b/documentation/migration-guides/release-notes-4.0.18.rst
@@ -28,7 +28,7 @@ Fixes in Yocto-4.0.18
 ~~~~~~~~~~~~~~~~~~~~~
 
 -  build-appliance-image: Update to kirkstone head revision
--  common-licenses: Backport missing license
+-  common-licenses: backport LGPL-3.0-with-zeromq-exception license
 -  contributor-guide: add notes for tests
 -  contributor-guide: be more specific about meta-* trees
 -  cups: fix typo in :cve:`2023-32360` backport patch
-- 
2.34.1


