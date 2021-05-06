Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.2690.1620263535343715151
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 18:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: PnSp8tH1zdmoTRofDqqMdtuvrLx0razS78aaWenjD0zTZOVAJjLxVmb/OJqdcxagARIkb1ugm0
 gvb1Z9NX/Yyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="185809680"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="185809680"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 18:12:14 -0700
IronPort-SDR: W7KAgMZF0OhFEi6d18U00CZAcv4F7okAd2u8wg8DBibT4/z7q0g9M8/i2QRZZHmI33Yf3qebs3
 TJk/evWAPycg==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="434093386"
Received: from hanpinon-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.47.180])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 18:12:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org,
	richard.purdie@linuxfounation.org
Subject: [gatesgarth][PATCH] documentation: prepare for 3.2.4 release
Date: Thu,  6 May 2021 09:12:08 +0800
Message-Id: <20210506011208.13982-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also update documentation to include links to previous releases.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      |  2 +-
 documentation/poky.yaml    | 10 +++++-----
 documentation/releases.rst |  9 +++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index eb6c04782..1efd63ca1 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.2.3"
+current_version = "3.2.4"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 4df23efe1..189f7bec6 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.2.3"
+DISTRO : "3.2.4"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
-YOCTO_DOC_VERSION : "3.2.3"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
-DISTRO_REL_TAG : "yocto-3.2.3"
-POKYVERSION : "24.0.3"
+YOCTO_DOC_VERSION : "3.2.4"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.7"
+DISTRO_REL_TAG : "yocto-3.2.4"
+POKYVERSION : "24.0.4"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index dbdc173a0..3e95ab9e2 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -9,6 +9,10 @@
 *******************************
 
 - :yocto_docs:`3.2 Documentation </3.2>`
+- :yocto_docs:`3.2.1 Documentation </3.2.1>`
+- :yocto_docs:`3.2.2 Documentation </3.2.2>`
+- :yocto_docs:`3.2.3 Documentation </3.2.3>`
+- :yocto_docs:`3.2.4 Documentation </3.2.4>`
 
 ****************************
 3.1 'dunfell' Release Series
@@ -18,6 +22,10 @@
 - :yocto_docs:`3.1.1 Documentation </3.1.1>`
 - :yocto_docs:`3.1.2 Documentation </3.1.2>`
 - :yocto_docs:`3.1.3 Documentation </3.1.3>`
+- :yocto_docs:`3.1.4 Documentation </3.1.4>`
+- :yocto_docs:`3.1.5 Documentation </3.1.5>`
+- :yocto_docs:`3.1.6 Documentation </3.1.6>`
+- :yocto_docs:`3.1.7 Documentation </3.1.7>`
 
 ==========================
  Previous Release Manuals
@@ -31,6 +39,7 @@
 - :yocto_docs:`3.0.1 Documentation </3.0.1>`
 - :yocto_docs:`3.0.2 Documentation </3.0.2>`
 - :yocto_docs:`3.0.3 Documentation </3.0.3>`
+- :yocto_docs:`3.0.4 Documentation </3.0.4>`
 
 ****************************
 2.7 'warrior' Release Series
-- 
2.30.2

