Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.1104.1606873243927882080
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 17:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Q+9tzaJxjNuvXnORocXgsPMw8y7XYdQEV0Hysm+/VJ6DZTMbpdvfO9qSmsJpn596qoIkqCr1Ag
 /g7KcrP9dvVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152766485"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="152766485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:40:40 -0800
IronPort-SDR: Af0fNEW9BqrQdfTMHHLWgLzwgUU2SSPE7CTefiB67jvdT/xWjDckXwkDx/FSSdAiefB5QoK88Q
 9LJNrDYmDArw==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="539458790"
Received: from kshekara-mobl2.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.112.62])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:40:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [gatesgarth][PATCH] documentation: prepare for 3.2.1 release
Date: Wed,  2 Dec 2020 09:40:27 +0800
Message-Id: <20201202014027.22533-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump the current version to 3.2.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py   | 2 +-
 documentation/poky.yaml | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index ed8c5c033..44f1e43a8 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.2"
+current_version = "3.2.1"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e184fa829..ef63d6eb7 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.2"
+DISTRO : "3.2.1"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
-YOCTO_DOC_VERSION : "3.2"
+YOCTO_DOC_VERSION : "3.2.1"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
-DISTRO_REL_TAG : "yocto-3.2"
-POKYVERSION : "24.0.0"
+DISTRO_REL_TAG : "yocto-3.2.1"
+POKYVERSION : "24.0.1"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.28.0

