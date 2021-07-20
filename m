Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.9687.1626796173806942184
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 08:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="296824603"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; 
   d="scan'208";a="296824603"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 08:49:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; 
   d="scan'208";a="657583484"
Received: from kimkeech-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.226.28])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2021 08:49:31 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][hardknott][PATCH] documentation: prepare for 3.3.2 release
Date: Tue, 20 Jul 2021 23:49:24 +0800
Message-Id: <20210720154924.11768-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include updates to versions for dunfell releases as well.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      | 2 +-
 documentation/poky.yaml    | 8 ++++----
 documentation/releases.rst | 4 ++++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index a764ea4de..ab8d3b94d 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.3.1"
+current_version = "3.3.2"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index a273de329..bf211e310 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.3.1"
+DISTRO : "3.3.2"
 DISTRO_NAME_NO_CAP : "hardknott"
 DISTRO_NAME : "Hardknott"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "gatesgarth"
-YOCTO_DOC_VERSION : "3.3.1"
+YOCTO_DOC_VERSION : "3.3.2"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
-DISTRO_REL_TAG : "yocto-3.3.1"
-POKYVERSION : "25.0.1"
+DISTRO_REL_TAG : "yocto-3.3.2"
+POKYVERSION : "25.0.2"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index daf891279..08f949130 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -10,6 +10,7 @@
 
 - :yocto_docs:`3.3 Documentation </3.3>`
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
+- :yocto_docs:`3.3.2 Documentation </3.3.2>`
 
 
 *******************************
@@ -33,6 +34,9 @@
 - :yocto_docs:`3.1.4 Documentation </3.1.4>`
 - :yocto_docs:`3.1.5 Documentation </3.1.5>`
 - :yocto_docs:`3.1.6 Documentation </3.1.6>`
+- :yocto_docs:`3.1.7 Documentation </3.1.7>`
+- :yocto_docs:`3.1.8 Documentation </3.1.8>`
+- :yocto_docs:`3.1.9 Documentation </3.1.9>`
 
 ==========================
  Previous Release Manuals
-- 
2.31.1

