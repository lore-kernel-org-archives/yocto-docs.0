Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AC7C00A94
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:22:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web11.43206.1712917349705194460
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MvD3pGoa;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712917352; x=1744453352;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=X218yeRV9FI6GN4AHDw1OZ7ajocfyGS04QeDlTVq0QM=;
  b=MvD3pGoan4XEgDqvumGEZnVfVwRGizoqTizxQMcCv5jb2m3pNT6gZR8O
   mlhue1pxOo3FpcG+FEPqqBdkPEH5vEAOy6BH4YRR+RvbpX35J/Didyjf3
   5rPVMjNt+j7meb1DFTdKR4R5sQNvJJh+ZM0QjawZJw52zl+qdQfFBOhfJ
   tPvsajec/pWgYGQ2QfMnnTKT/LX9/AFjyM57/BNvWbL1zAq0QO+AnT7Sm
   B0gcRic0mGGXsKR9ObrVEp615uief8sfT1bVMW9dJBJpSxSD86G3HHSE0
   CMWvD8fqYA+a6Vj0eoTJCUFK4wjBi4QExqt+WGxOMATrUIV7UGmDQoxpJ
   Q==;
X-CSE-ConnectionGUID: ipj1HV+qToKdD/uK9XOxLg==
X-CSE-MsgGUID: ORD1LJ8rQumbFq5QSpENRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8227520"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8227520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:22:31 -0700
X-CSE-ConnectionGUID: bZLQV3FqQl+mWFqw0sgHHg==
X-CSE-MsgGUID: u9+HnnleSj+/jBTJ6o53rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25979584"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 03:22:31 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/3] release-notes-5.0: add devtool improvement
Date: Fri, 12 Apr 2024 18:19:57 +0800
Message-Id: <20240412101957.2071854-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412101957.2071854-1-chee.yang.lee@intel.com>
References: <20240412101957.2071854-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5119

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 4ac54e869..db292ab2b 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -183,6 +183,15 @@ New Features / Enhancements in 5.0
 
    -  git-make-shallow: added support for git's safe.bareRepository=explicit environemnt.
 
+-  Devtool improvement:
+
+   -  Introduced new ide-sdk plugin provides the eSDK and configures an
+      IDE to work with the eSDK.
+
+   -  Add --no-pypi option for python project that are not hosted on PyPI.
+
+   -  Add support for git submodule.
+
 -  Packaging changes:
 
    -  ``package_rpm``: the RPM package compressor's mode can now be overriden.
-- 
2.34.1


