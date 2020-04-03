Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.2221.1585875380913677866
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 17:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: hC3yhntydgb8m5Zvqs1AafVTYSaHZnxh7/J3OsfK7T33+DXnOKFXTqDpGO1ih8IPaLzRVavl89
 N5kWsDNbWTbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 17:56:24 -0700
IronPort-SDR: 6EDn37zHkoGEq15r5mSMrVfumrr3CrnlEpW1TUCWAPvl5yCMC6rcHz8N/+pSx+2qUkpCGZ4PAF
 G93QNRGDzViw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,337,1580803200"; 
   d="scan'208";a="451129865"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2020 17:56:23 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 4/5] dev-manual: buildtools versions and changes
Date: Thu,  2 Apr 2020 17:55:56 -0700
Message-Id: <20200403005557.4708-4-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
References: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump tar, Python versions and add new gcc requirement.

Update reference from 'required-git-tar-and-python-versions'
to 'required-git-tar-python-and-gcc-versions'

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 documentation/dev-manual/dev-manual-start.xml | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index a151ba61c..8cb5631f0 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -467,23 +467,26 @@
                     <emphasis>Meet Minimal Version Requirements:</emphasis>
                     The OpenEmbedded build system should be able to run on any
                     modern distribution that has the following versions for
-                    Git, tar, and Python.
+                    Git, tar, Python and gcc.
                     <itemizedlist>
                         <listitem><para>
                             Git 1.8.3.1 or greater
                             </para></listitem>
                         <listitem><para>
-                            tar 1.27 or greater
+                            tar 1.28 or greater
                             </para></listitem>
                         <listitem><para>
-                            Python 3.4.0 or greater.
-                            </para></listitem>
+                            Python 3.5.0 or greater.
+                        </para></listitem>
+                        <listitem><para>
+                            gcc 5.0 or greater.
+                        </para></listitem>
                     </itemizedlist>
                     If your build host does not meet any of these three listed
                     version requirements, you can take steps to prepare the
                     system so that you can still use the Yocto Project.
                     See the
-                    "<ulink url='&YOCTO_DOCS_REF_URL;#required-git-tar-and-python-versions'>Required Git, tar, and Python Versions</ulink>"
+                    "<ulink url='&YOCTO_DOCS_REF_URL;#required-git-tar-python-and-gcc-versions'>Required Git, tar, Python and gcc Versions</ulink>"
                     section in the Yocto Project Reference Manual for
                     information.
                     </para></listitem>
-- 
2.24.0

