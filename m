Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D08C04FF6
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:22:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web11.43206.1712917349705194460
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OA+9jkvx;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712917351; x=1744453351;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=x08adHAH47MaBx+nIEYfVetpxCmJwEm2wyMt0da4WP4=;
  b=OA+9jkvxxfg1e6X5vfQCxHY+nRVbGhiKku/ZIigfEiEhnj8XvdU6O9Gd
   sipwoMVLHLzf0QOu52mujV1pf4NEG92oYyl9J+lA1uZmnjMUF8ef2dESI
   UnngQqPqhOlo7kijywXlmbRRuHf88cT+hMmlTk88kx7Mm1KHvqwdQmEIG
   ucaot4GS6LDaSG/xyDUV/YuSdnjzFsKJ6o5Y+GznPJy6zouZPKVRdBMAT
   8DqrU2tWNzxltkp9lxGKs/lQUKicHX8ve8J3M0UduOSvEWSOe6wL8L9fT
   bs956m46Cn95YizwvZ9ATIAS6z1UgCeEZnMqGssTFbOfRa2ZRvhHrBVkw
   Q==;
X-CSE-ConnectionGUID: HBUq/TART/eMTnwy+Y8AWw==
X-CSE-MsgGUID: vbmu+Q0AR26RCYVvZhsvkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8227519"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8227519"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:22:30 -0700
X-CSE-ConnectionGUID: GCaMEX2BR8Gzgw7YIYY+rQ==
X-CSE-MsgGUID: 4j+gik/vQIOY1ZLLDLPxqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25979583"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 03:22:30 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/3] release-notes-5.0: update bitbake improvement
Date: Fri, 12 Apr 2024 18:19:56 +0800
Message-Id: <20240412101957.2071854-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412101957.2071854-1-chee.yang.lee@intel.com>
References: <20240412101957.2071854-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5118

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 0a0e4e5f3..4ac54e869 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -179,6 +179,10 @@ New Features / Enhancements in 5.0
    -  ``bitbake.conf``: add ``runtimedir`` to represent the path to the runtime
       state directory (i.e., ``/run``).
 
+   -  Allow disabling colored text output thru environment variable `NO_OUTPUT <https://https://no-color.org//>`__.
+
+   -  git-make-shallow: added support for git's safe.bareRepository=explicit environemnt.
+
 -  Packaging changes:
 
    -  ``package_rpm``: the RPM package compressor's mode can now be overriden.
-- 
2.34.1


