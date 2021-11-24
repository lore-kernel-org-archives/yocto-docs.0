Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2280C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:09:35 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.7143.1637766575043114267
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 07:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="298698379"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800";
   d="scan'208";a="298698379"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 07:09:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800";
   d="scan'208";a="674889017"
Received: from itong-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.141.89])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 07:09:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [honister][PATCH] documentation: prepare for 3.4.1 release
Date: Wed, 24 Nov 2021 23:09:28 +0800
Message-Id: <20211124150928.11645-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 15:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2187

Also include reference to just release 3.3.4.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      |  2 +-
 documentation/poky.yaml    | 10 +++++-----
 documentation/releases.rst |  2 ++
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 104b49ea0..9fd836a35 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.4"
+current_version = "3.4.1"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index f2d1e8b97..11e209e30 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.4"
+DISTRO : "3.4.1"
 DISTRO_NAME_NO_CAP : "honister"
 DISTRO_NAME : "Honister"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.4"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.3.3"
-DISTRO_REL_TAG : "yocto-3.4"
-POKYVERSION : "26.0.0"
+YOCTO_DOC_VERSION : "3.4.1"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.3.4"
+DISTRO_REL_TAG : "yocto-3.4.1"
+POKYVERSION : "26.0.1"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 529d00e70..6f7bca540 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -9,6 +9,7 @@ Release Series 3.4 (honister)
 ******************************
 
 - :yocto_docs:`3.4 Documentation </3.4>`
+- :yocto_docs:`3.4.1 Documentation </3.4.1>`
 
 ******************************
 Release Series 3.3 (hardknott)
@@ -18,6 +19,7 @@ Release Series 3.3 (hardknott)
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
 - :yocto_docs:`3.3.2 Documentation </3.3.2>`
 - :yocto_docs:`3.3.3 Documentation </3.3.3>`
+- :yocto_docs:`3.3.4 Documentation </3.3.4>`
 
 *******************************
 Release Series 3.2 (gatesgarth)
-- 
2.33.1


