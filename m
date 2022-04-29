Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBD8C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 14:23:49 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.10592.1651242210666881081
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 07:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZmN/wP37;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651242210; x=1682778210;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NtQOAgUP9jMUXYbkWJV9haHM9nu1UglrRyHUE8ISnXM=;
  b=ZmN/wP37mj5dtdFx0g+NGLmAl4x8PQTenB6A/DEReAzqnY29TVrOxqHj
   oLjr5qPJ0CKXkORSHlsHoHjf8Rafr+erEqCSIeIAvT81IjjfwBUOadsFj
   1ZYoi9xGLxZp/Stlb6djjOqBVs43d2Sz1Y2FmfejFHiks/HFvibrQGD5x
   HQwpTQiUiBXuEjrPuTDEZEfw6w1Z9FUKvfjgzAs4rm15FZ23mQriCP6Wo
   UxAYf+GJiCgccRUa1pS68aP0vUl0RTZdfJowimBVe4FXmPwgwk6SBNxOq
   zd++029ZnP8ALu8ON37PUNyLR3w+oRixN+InHvnnEV+D5JbqSTzYqK44V
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266185989"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600";
   d="scan'208";a="266185989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:23:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600";
   d="scan'208";a="662365213"
Received: from weihouli-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.252.167])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:23:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [honister][PATCH] documentation: update for 3.4.4 release
Date: Fri, 29 Apr 2022 22:23:24 +0800
Message-Id: <20220429142324.10143-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Apr 2022 14:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2902

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/poky.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index d8ee000c0..fc7ec9ec3 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,14 +1,14 @@
-DISTRO : "3.4.3"
+DISTRO : "3.4.4"
 DISTRO_NAME_NO_CAP : "honister"
 DISTRO_NAME : "Honister"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.4.3"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
-DISTRO_REL_TAG : "yocto-3.4.3"
-DOCCONF_VERSION : "3.4.3"
+YOCTO_DOC_VERSION : "3.4.4"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.3.6"
+DISTRO_REL_TAG : "yocto-3.4.4"
+DOCCONF_VERSION : "3.4.4"
 BITBAKE_SERIES : "1.52"
-POKYVERSION : "26.0.3"
+POKYVERSION : "26.0.4"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.35.1


