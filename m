Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.2591.1616638766309930635
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 19:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7Hp+ht6KMqR2rLB6VsCQVT2HNKQFTy0zvFWGF5ziClU2RAtW2ViraH++t1V5Kb/P8JNQg8Gc/k
 0XFombfcCHfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254819845"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; 
   d="scan'208";a="254819845"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 19:19:24 -0700
IronPort-SDR: ZIKMl9C198dapLjGol2i3wj+rJgR3wCVzSPjrEaPqhfg0evoiV464ciFakG2emQjT+nYEL02pZ
 nMDwfNpvurDw==
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; 
   d="scan'208";a="452845247"
Received: from ivytee-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.214.173.221])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 19:19:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [gatesgarth][PATCH] documentation: version bumps for 3.2.3 release
Date: Thu, 25 Mar 2021 10:19:19 +0800
Message-Id: <20210325021919.17580-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py   |  2 +-
 documentation/poky.yaml | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 0a6e330e2..eb6c04782 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.2.2"
+current_version = "3.2.3"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 1909f0d83..4df23efe1 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.2.2"
+DISTRO : "3.2.3"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
-YOCTO_DOC_VERSION : "3.2.2"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.5"
-DISTRO_REL_TAG : "yocto-3.2.2"
-POKYVERSION : "24.0.2"
+YOCTO_DOC_VERSION : "3.2.3"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
+DISTRO_REL_TAG : "yocto-3.2.3"
+POKYVERSION : "24.0.3"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.30.2

