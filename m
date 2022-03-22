Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3E9C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:58:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.4232.1647910705491957258
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 17:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mEN9q591;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647910705; x=1679446705;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2VgbNQKwuVxBPz+2wCgBrKC3ibi3EXbQ6YrbaDqueqQ=;
  b=mEN9q5912RjHkAD9rpp9bZF1Jzd30/3qI+VfFMs9mqqvlYLcVHp1ifa+
   ZPjybIkLxPsusWAZ2QbqJ7w0CzL3xAMT30IVItrvIKfnUTC84DvIFaM+T
   3llF2wCViLjT84pIOSOgtWMoTDpLcG6iUwUlSfr8j6UsHI+tRjoNQf3Gs
   bZF5qN7Dw4lHJbT6dqSqwsi/pfjlqAnh5tW4pT4JzrShNAibKljbpvt9r
   ob9jYxK6t1hPf2SVyHRCcb2oAOc+3JP0x0chBkUI9kuZo2Ek4z/MAqNxT
   QuzTzjC8awG8RtRKizUSxWmmhzo34RCKsVXmJaNntbCAMGlUUI9/Cscsl
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255250592"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400";
   d="scan'208";a="255250592"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 17:58:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400";
   d="scan'208";a="518657212"
Received: from mchong5-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.138.6])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 17:58:23 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [honister][PATCH] documentation: prepare for 3.4.3 release
Date: Tue, 22 Mar 2022 08:58:11 +0800
Message-Id: <20220322005811.10112-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 00:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2672

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      | 2 +-
 documentation/poky.yaml    | 8 ++++----
 documentation/releases.rst | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 213912f37..bef6fbfa4 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.4.2"
+current_version = "3.4.3"
 bitbake_version = "1.52"
 
 # String used in sidebar
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 1d29906a3..9398fd5cb 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.4.2"
+DISTRO : "3.4.3"
 DISTRO_NAME_NO_CAP : "honister"
 DISTRO_NAME : "Honister"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.4.2"
+YOCTO_DOC_VERSION : "3.4.3"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
-DISTRO_REL_TAG : "yocto-3.4.2"
-POKYVERSION : "26.0.2"
+DISTRO_REL_TAG : "yocto-3.4.3"
+POKYVERSION : "26.0.3"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index f19fcaf47..7a71ac408 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,6 +11,7 @@ Release Series 3.4 (honister)
 - :yocto_docs:`3.4 Documentation </3.4>`
 - :yocto_docs:`3.4.1 Documentation </3.4.1>`
 - :yocto_docs:`3.4.2 Documentation </3.4.2>`
+- :yocto_docs:`3.4.3 Documentation </3.4.3>`
 
 ******************************
 Release Series 3.3 (hardknott)
-- 
2.35.1


