Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.8976.1613488134187980080
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Feb 2021 07:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: UWkFUP3kYD9XL+lVh9sYNaMV1OXD3fvHa5Ok0NyNRT4ZOYw7dh9N2NMNTAKVw1eT0rtskxa/zq
 9lygNjDop6gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="182128144"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="182128144"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:08:53 -0800
IronPort-SDR: ezMe5Kuoyb56tZlni1w5p+N1nLrIJpBKGOBfMk3CC5B+75GqDkQeGURnpJ+3RGU7StUY5Df3Tu
 EBPgTzhrs+qg==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="361709161"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.135])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:08:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [gatesgarth][PATCH] documentation: version bumps for 3.2.2 release
Date: Tue, 16 Feb 2021 23:08:47 +0800
Message-Id: <20210216150847.11253-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py   |  2 +-
 documentation/poky.yaml | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 44f1e43a8..0a6e330e2 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.2.1"
+current_version = "3.2.2"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index ef63d6eb7..1909f0d83 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.2.1"
+DISTRO : "3.2.2"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
-YOCTO_DOC_VERSION : "3.2.1"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
-DISTRO_REL_TAG : "yocto-3.2.1"
-POKYVERSION : "24.0.1"
+YOCTO_DOC_VERSION : "3.2.2"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.5"
+DISTRO_REL_TAG : "yocto-3.2.2"
+POKYVERSION : "24.0.2"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.29.2

