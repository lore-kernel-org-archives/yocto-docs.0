Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96383C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 07:10:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.4316.1635923431497139699
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 00:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218350979"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800";
   d="scan'208";a="218350979"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 00:10:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800";
   d="scan'208";a="667426430"
Received: from syasyapu-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.135.212])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 00:10:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [hardknott][PATCH] documentation: prepare for 3.3.4 release
Date: Wed,  3 Nov 2021 15:10:23 +0800
Message-Id: <20211103071023.51887-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Nov 2021 07:10:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2071

Also add a link for documentation to just released 3.1.11 release.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      | 2 +-
 documentation/poky.yaml    | 8 ++++----
 documentation/releases.rst | 2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index d1c08a9c9..28af37d7b 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.3.3"
+current_version = "3.3.4"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 7207df142..30eb45379 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.3.3"
+DISTRO : "3.3.4"
 DISTRO_NAME_NO_CAP : "hardknott"
 DISTRO_NAME : "Hardknott"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "gatesgarth"
-YOCTO_DOC_VERSION : "3.3.3"
+YOCTO_DOC_VERSION : "3.3.4"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
-DISTRO_REL_TAG : "yocto-3.3.3"
-POKYVERSION : "25.0.3"
+DISTRO_REL_TAG : "yocto-3.3.4"
+POKYVERSION : "25.0.4"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 2b17cd635..e19dfde6c 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -12,6 +12,7 @@
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
 - :yocto_docs:`3.3.2 Documentation </3.3.2>`
 - :yocto_docs:`3.3.3 Documentation </3.3.3>`
+- :yocto_docs:`3.3.4 Documentation </3.3.4>`
 
 
 *******************************
@@ -39,6 +40,7 @@
 - :yocto_docs:`3.1.8 Documentation </3.1.8>`
 - :yocto_docs:`3.1.9 Documentation </3.1.9>`
 - :yocto_docs:`3.1.10 Documentation </3.1.10>`
+- :yocto_docs:`3.1.11 Documentation </3.1.11>`
 
 ==========================
  Previous Release Manuals
-- 
2.31.1


