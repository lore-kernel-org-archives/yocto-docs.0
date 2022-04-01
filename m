Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B93C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 02:30:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.5803.1648780203358872958
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 19:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=UFoPxT6N;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648780203; x=1680316203;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bx9UXPAJD1i8tY5ydaMA1ubmQ6P3uhQdVskyKcC9K7c=;
  b=UFoPxT6N+EV6aDKecQiE/mSSTNOsUJsXLkeyBFY+TWVa6zwW0WS49Y0d
   Qay2cXqVg7ejsKAcEsVwQe+lcWdjk3X2F7evAcbG7kfe9qTg5RunrimmG
   V0n76r2AHKcqbytPggyfnEu2Qf9QEori0G56CHktE89Fvy4d3K9kprTnr
   xCikIiS9GMGSeh47rKBxB4Pd22Qn2P6nh7f4rwJ5Ed1o2MB+GgM6ttUqs
   FBxq/ZhdBuGd1GKrFH3cz7uwY3/09itUv6KMo2V1nj6HySRRZkbKhXcf3
   f9ceKMai8wpVoQsXKQKkH9y17CBPH6lSMKccp5Izjp+bGfvg655OK/9QZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260012612"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="260012612"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 19:30:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="606462039"
Received: from ktee1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.235.187])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 19:30:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [hardknott][PATCH] documentation: prepare for 3.3.6 release
Date: Fri,  1 Apr 2022 10:29:55 +0800
Message-Id: <20220401022955.5447-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Apr 2022 02:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2743

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      | 2 +-
 documentation/poky.yaml    | 8 ++++----
 documentation/releases.rst | 5 ++++-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index fc064bf32..e7c2e502f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.3.5"
+current_version = "3.3.6"
 bitbake_version = "1.50"
 
 # String used in sidebar
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 32849bc70..769a981b6 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.3.5"
+DISTRO : "3.3.6"
 DISTRO_NAME_NO_CAP : "hardknott"
 DISTRO_NAME : "Hardknott"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "gatesgarth"
-YOCTO_DOC_VERSION : "3.3.5"
+YOCTO_DOC_VERSION : "3.3.6"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
-DISTRO_REL_TAG : "yocto-3.3.5"
-POKYVERSION : "25.0.5"
+DISTRO_REL_TAG : "yocto-3.3.6"
+POKYVERSION : "25.0.6"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 1fb6054bc..233448c68 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -10,7 +10,8 @@
 
 - :yocto_docs:`3.4 Documentation </3.4>`
 - :yocto_docs:`3.4.1 Documentation </3.4.1>`
-- :yocto_docs:`3.4.1 Documentation </3.4.2>`
+- :yocto_docs:`3.4.2 Documentation </3.4.2>`
+- :yocto_docs:`3.4.3 Documentation </3.4.3>`
 
 *******************************
 3.3 'hardknott' Release Series
@@ -22,6 +23,7 @@
 - :yocto_docs:`3.3.3 Documentation </3.3.3>`
 - :yocto_docs:`3.3.4 Documentation </3.3.4>`
 - :yocto_docs:`3.3.5 Documentation </3.3.5>`
+- :yocto_docs:`3.3.6 Documentation </3.3.6>`
 
 ****************************
 3.1 'dunfell' Release Series
@@ -42,6 +44,7 @@
 - :yocto_docs:`3.1.12 Documentation </3.1.12>`
 - :yocto_docs:`3.1.13 Documentation </3.1.13>`
 - :yocto_docs:`3.1.14 Documentation </3.1.14>`
+- :yocto_docs:`3.1.15 Documentation </3.1.15>`
 
 ==========================
  Previous Release Manuals
-- 
2.35.1


