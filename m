Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D02C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:05:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.24631.1751465099934194222
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jul 2025 07:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=T4TgUrS0;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751465100; x=1783001100;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6xKkJ6thic+lM2zY1gy59FrNX0WGEGQu2dBEDSDHRts=;
  b=T4TgUrS0hPuPJQPefRXqSdADotrjT9Ul9mXYn8bpv38LB2d3pTylvRL2
   Jr2KgOFYLplMFPd47ZfW+u1Wc0u7h7AcZ8OJJKZdVAJfe8a9G9Bbq+0YZ
   i6p78z11AZmK4PQtLNihIlpY4jL4wcpcWZ8NcsZJK0JrgDDrG81JNHjd8
   aXNaxRJHWdHXoaceS+iwzqR2BYlfAdARceylLARuVSIYhgjgaRxSRYDFw
   KBx9hzLRi6Fu6b/G5ay1bmwCQ1z3LvQlUIYCdufBpPCJF6+2yLd+P80rb
   z3GpWXFj+pMuMiaeM/bFCpikJDZfqkRqr5/EC1Rq/6o5dBxe6c4JpmtA2
   A==;
X-CSE-ConnectionGUID: 8saw/pKITlaBgjR34O0gCQ==
X-CSE-MsgGUID: AWSL26vaQIiSqFEnvpHxMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64007969"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64007969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 07:05:00 -0700
X-CSE-ConnectionGUID: vEMDbd+ZQO2D7109TGKdGg==
X-CSE-MsgGUID: KsOaCWVYS8q8/I/j7j/c9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154431353"
Received: from cheeyang-desk4.png.intel.com ([10.107.249.123])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 07:04:59 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/yocto-project-supported-features: update contact for meta-intel
Date: Wed,  2 Jul 2025 22:04:50 +0800
Message-ID: <20250702140450.3251232-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Jul 2025 14:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7259

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index 283c79d4c..0e6c33cf6 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -86,7 +86,7 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
      - meta-aws
    * - `meta-intel <https://git.yoctoproject.org/meta-intel>`__
      - meta-intel layer testing
-     - TBD
+     - meta-intel mailing list <meta-intel@lists.yoctoproject.org>
      - meta-intel
    * - `meta-exein <https://github.com/exein-io/meta-exein>`__
      - meta-exein layer testing
-- 
2.43.0


