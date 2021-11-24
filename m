Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE4FC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:49:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.7113.1637765380841692344
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 06:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="321524428"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800";
   d="scan'208";a="321524428"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:49:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800";
   d="scan'208";a="571500914"
Received: from itong-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.141.89])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 06:49:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] releases.rst: move gatesgarth to outdated releases section
Date: Wed, 24 Nov 2021 22:49:34 +0800
Message-Id: <20211124144934.8908-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 14:49:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2186

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/releases.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/releases.rst b/documentation/releases.rst
index 95f1bd41d..4223d56d2 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -20,16 +20,6 @@ Release Series 3.3 (hardknott)
 - :yocto_docs:`3.3.3 Documentation </3.3.3>`
 - :yocto_docs:`3.3.4 Documentation </3.3.4>`
 
-*******************************
-Release Series 3.2 (gatesgarth)
-*******************************
-
-- :yocto_docs:`3.2 Documentation </3.2>`
-- :yocto_docs:`3.2.1 Documentation </3.2.1>`
-- :yocto_docs:`3.2.2 Documentation </3.2.2>`
-- :yocto_docs:`3.2.3 Documentation </3.2.3>`
-- :yocto_docs:`3.2.4 Documentation </3.2.4>`
-
 ****************************
 Release Series 3.1 (dunfell)
 ****************************
@@ -52,6 +42,16 @@ Release Series 3.1 (dunfell)
  Outdated Release Manuals
 ==========================
 
+*******************************
+Release Series 3.2 (gatesgarth)
+*******************************
+
+- :yocto_docs:`3.2 Documentation </3.2>`
+- :yocto_docs:`3.2.1 Documentation </3.2.1>`
+- :yocto_docs:`3.2.2 Documentation </3.2.2>`
+- :yocto_docs:`3.2.3 Documentation </3.2.3>`
+- :yocto_docs:`3.2.4 Documentation </3.2.4>`
+
 *************************
 Release Series 3.0 (zeus)
 *************************
-- 
2.33.1


