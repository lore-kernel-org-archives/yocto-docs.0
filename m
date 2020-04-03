Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.2218.1585875365436678347
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 17:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.20, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: 8HDBSYkiyZd0Y6dgUwq1+6zucvTYJJNBus3dhxTZIWjTiY61af/yLlXZhzN/eMFh6I0TMBL+Ta
 5DyJAQQd3d5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 17:56:04 -0700
IronPort-SDR: UXt+YyKyiZtMSiOOaDXTydsxIUhTO3M8MT+vC1oMfEZ6ZU49ngUsNRkUIHGYp0KN0ZlRhYSVbt
 WUWnfjh54N/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,337,1580803200"; 
   d="scan'208";a="451129791"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2020 17:56:04 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 1/5] ref-manual: bump tar and python min versions
Date: Thu,  2 Apr 2020 17:55:53 -0700
Message-Id: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* tar min version is now 1.28
* python min version is now 3.5

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 documentation/ref-manual/ref-system-requirements.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index e65ef6350..21cd79de0 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -314,8 +314,8 @@
             Python:
             <itemizedlist>
                 <listitem><para>Git 1.8.3.1 or greater</para></listitem>
-                <listitem><para>tar 1.27 or greater</para></listitem>
-                <listitem><para>Python 3.4.0 or greater</para></listitem>
+                <listitem><para>tar 1.28 or greater</para></listitem>
+                <listitem><para>Python 3.5.0 or greater</para></listitem>
             </itemizedlist>
         </para>
 
-- 
2.24.0

