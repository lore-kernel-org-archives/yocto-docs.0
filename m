Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C02C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 01:42:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.2476.1702345352891076399
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 17:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CjLkobLf;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702345352; x=1733881352;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wgCcczFoA7cYmqHpTIbcY/MhLzuDAnhTyqVKmkbXkTc=;
  b=CjLkobLfeso89hrfLslfd9D1hwd1hwmFX0lp9SLOAmegSr0pEAPDRtgN
   kVk0ZbqL0FPyPqUnAPEmiX2/kYOaiBd/Dtmrcyw6AUK7sRm3LCEgELGB5
   tYMG7/p9Xgj/64ZKM1VnRMuvW/NkEsosp18UrQpukldZk0z8nMwaIQ77Z
   ivf6Lun7XGYmPiCl/0h0tLLfIKEZpKqv+E3PUNQUemv+95TFDtSgSffb/
   fyTrez9P5W2brzJ5n47nf7R1XLI1iUgWoaHYjck0zSFytbJrz1zglvRBf
   xlkHW1fKRL/o6H33ZiciQx286AQ9YHSM9dvX1/ZuRw70hMq2GL+YxU/6u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="397524343"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="397524343"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 17:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896712726"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="896712726"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orsmga004.jf.intel.com with ESMTP; 11 Dec 2023 17:42:31 -0800
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] release-notes-4.3.1: reword a fixes
Date: Tue, 12 Dec 2023 09:39:20 +0800
Message-Id: <20231212013920.2725397-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Dec 2023 01:42:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4675

From: Lee Chee Yang <chee.yang.lee@intel.com>

reword a fixes with to align with the final release notes.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-4.3.1.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.1.rst b/documentation/migration-guides/release-notes-4.3.1.rst
index 377cdb43f..cea9c538a 100644
--- a/documentation/migration-guides/release-notes-4.3.1.rst
+++ b/documentation/migration-guides/release-notes-4.3.1.rst
@@ -19,7 +19,6 @@ Security Fixes in Yocto-4.3.1
 Fixes in Yocto-4.3.1
 ~~~~~~~~~~~~~~~~~~~~
 
--  Remove references to apm in :term:`MACHINE_FEATURES`
 -  baremetal-helloworld: Pull in fix for race condition on x86-64
 -  base: Ensure recipes using mercurial-native have certificates
 -  bb-matrix-plot.sh: Show underscores correctly in labels
@@ -54,6 +53,7 @@ Fixes in Yocto-4.3.1
 -  machine: drop obsolete SERIAL_CONSOLES_CHECK
 -  manuals: correct "yocto-linux" by "linux-yocto"
 -  manuals: improve description of :term:`CVE_STATUS` and :term:`CVE_STATUS_GROUPS`
+-  manuals: Remove references to apm in :term:`MACHINE_FEATURES`
 -  manuals: update linux-yocto append examples
 -  manuals: update list of supported machines
 -  migration-4.3: additional migration items
-- 
2.34.1


