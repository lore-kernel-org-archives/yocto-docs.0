Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.4978.1630483500353165001
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 01:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="216825942"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="216825942"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:04:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="428510454"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.235.132])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:04:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: docs@lists.yoctoproject.org
Subject: [docs][hardknott][PATCH] documentation: prepare for 3.3.3 release
Date: Wed,  1 Sep 2021 16:04:53 +0800
Message-Id: <20210901080453.46365-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also add a link for documentation to just release 3.1.10 release.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 documentation/conf.py      | 2 +-
 documentation/poky.yaml    | 8 ++++----
 documentation/releases.rst | 2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index ab8d3b94d..d1c08a9c9 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.3.2"
+current_version = "3.3.3"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index bf211e310..02c9bf3dc 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.3.2"
+DISTRO : "3.3.3"
 DISTRO_NAME_NO_CAP : "hardknott"
 DISTRO_NAME : "Hardknott"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "gatesgarth"
-YOCTO_DOC_VERSION : "3.3.2"
+YOCTO_DOC_VERSION : "3.3.3"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
-DISTRO_REL_TAG : "yocto-3.3.2"
-POKYVERSION : "25.0.2"
+DISTRO_REL_TAG : "yocto-3.3.3"
+POKYVERSION : "25.0.3"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 08f949130..2b17cd635 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,6 +11,7 @@
 - :yocto_docs:`3.3 Documentation </3.3>`
 - :yocto_docs:`3.3.1 Documentation </3.3.1>`
 - :yocto_docs:`3.3.2 Documentation </3.3.2>`
+- :yocto_docs:`3.3.3 Documentation </3.3.3>`
 
 
 *******************************
@@ -37,6 +38,7 @@
 - :yocto_docs:`3.1.7 Documentation </3.1.7>`
 - :yocto_docs:`3.1.8 Documentation </3.1.8>`
 - :yocto_docs:`3.1.9 Documentation </3.1.9>`
+- :yocto_docs:`3.1.10 Documentation </3.1.10>`
 
 ==========================
  Previous Release Manuals
-- 
2.31.1

