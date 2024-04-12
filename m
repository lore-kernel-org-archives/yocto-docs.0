Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334B1C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:22:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web11.43206.1712917349705194460
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NsMjRI5d;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712917350; x=1744453350;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ethqIUgFpslso8BwyG114YiUkCDG7nh/vjX9+Rp0plQ=;
  b=NsMjRI5dwJPxdCcqFQRrqjCj9tzJKiZlCxjQz7iCIGXz9u5pgx39HFZH
   /ePKPBJNEz3bJZ5I7dQaOoKBzYhhQevndCv02vYwGNo/U/U+1KySVMLyq
   MUx8+2KapQmLwehCnL9s1NyHgU31CfSXSX3mB3tbWSPzfdiekJcfaRlvC
   ZQBd2utZUiZm0gzv1Zu5tn/vBRy/MjsQwLWq4pVOuWMwrI3mQ4Z1YQ66A
   47RSBmZ91+uA15V8XzKQ5SfJEagI6B5Z6ou8kzqHnrr+2MHYiM3XnHtW9
   QFah7LnEKz3vc/lJ78EyWpMvyuXILGjd6+t+/XwrHb1tJgNjHHsZc1jZX
   w==;
X-CSE-ConnectionGUID: 3tcaWq1CRPaImxb9VLM2SQ==
X-CSE-MsgGUID: 87ODj8U8Q1CWxkL/NL3eiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8227518"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8227518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:22:30 -0700
X-CSE-ConnectionGUID: gmy3VDClT+Cv+09J2Y+urg==
X-CSE-MsgGUID: zGFk/SVdRRGwPRmxuXlN6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25979582"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 03:22:29 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/3] release-notes-5.0: update license section
Date: Fri, 12 Apr 2024 18:19:55 +0800
Message-Id: <20240412101957.2071854-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412101957.2071854-1-chee.yang.lee@intel.com>
References: <20240412101957.2071854-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5117

From: Lee Chee Yang <chee.yang.lee@intel.com>

also re-order license.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 documentation/migration-guides/release-notes-5.0.rst | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 2f39fda41..0a0e4e5f3 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -232,8 +232,16 @@ Recipe License changes in 5.0
 
 The following corrections have been made to the :term:`LICENSE` values set by recipes:
 
--  ``systemd``: make the scope of ``LGPL`` more accurate (``LGPL-2.1`` -> ``LGPL-2.1-or-later``)
--  ``libsystemd``: set its own :term:`LICENSE` value (``LGPL-2.1-or-later``) to add more granularity
+-  ``elfutils``: split license for libraries & backend and utilities.
+-  ``ghostscript``: correct :term:`LICENSE` to ``AGPL-3.0-or-later``.
+-  ``libsystemd``: set its own :term:`LICENSE` value (``LGPL-2.1-or-later``) to add more granularity.
+-  ``libtest-warnings-perl``: update :term:`LICENSE` ``Artistic-1.0`` to ``Artistic-1.0-Perl``.
+-  ``linux-firmware``: set package :term:`LICENSE` appropriately for carl9170, rockchip and powerpr.
+-  ``newlib``: add license ``Apache-2.0-with-LLVM-exception``.
+-  ``python3-poetry-core``: add license ``BSD-3-Claus`` for fastjsonschema.
+-  ``systemd``: make the scope of ``LGPL`` more accurate (``LGPL-2.1`` -> ``LGPL-2.1-or-later``).
+-  ``util-linux``: add ``GPL-1.0-or-later`` license for fdisk and ``MIT`` license for flock.
+-  ``zstd``: set to dual-licensed ``BSD-3-Clause`` or ``GPL-2.0-only``.
 
 Security Fixes in 5.0
 ~~~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


