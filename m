Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6F7C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:22:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web11.43206.1712917349705194460
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YlBndrGC;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712917349; x=1744453349;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CWsa5SbY0uMnW1UHP1ZZ+qKJlnkl4n40WCiRg6bB49U=;
  b=YlBndrGCjm/o91d2jXI/ARaKpEFfdGSt+l3yuo0USJpRJ8k/yT7DtU24
   a2aPPyP/kufJXeelAI8UqB0YCa4+yfAmG6UM07eYx32Y1QDUPBvRVnGng
   gw2q+KHo3mJAkyQMQ768XmGkdUFg8sDIXI9WmwhmZ3oJRiMzmWv017l+A
   fyK7+VL9JGe5rv8k9hlFA5pxT2fhLHI1qh9ZehpoCKZjuphN1LeOm1uDF
   uo8ztfPd/abnVRu5JQrY9b0ZS6SKVJMmtRObIn9yOLua5CbB6QDbzeeS0
   y/RKDb2Re1fewck8QDg8INlC/+rFozLQ7y6Q2OQGz7MIhG1wrO6JaFQQW
   w==;
X-CSE-ConnectionGUID: lzhzdpiTRWCn/iYf1WvQcg==
X-CSE-MsgGUID: Nuw6YYQ3SyS/+7gfiUWOpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8227517"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8227517"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:22:29 -0700
X-CSE-ConnectionGUID: OBKHFL6+SJqtNm2iBEFxOg==
X-CSE-MsgGUID: YhyWk8sCTZO/+8VUWJKRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25979581"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 03:22:28 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/3] release-notes-5.0: update license, bitbake and devtool
Date: Fri, 12 Apr 2024 18:19:54 +0800
Message-Id: <20240412101957.2071854-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5116

From: Lee Chee Yang <chee.yang.lee@intel.com>

This is based on master-next 20e9c0c9fad3109567948af6bc40bb0fa2a5552b.
feel free to squash for commit count reduction.

Lee Chee Yang (3):
  release-notes-5.0: update license section
  release-notes-5.0: update bitbake improvement
  release-notes-5.0: add devtool improvement

 .../migration-guides/release-notes-5.0.rst    | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

-- 
2.34.1


