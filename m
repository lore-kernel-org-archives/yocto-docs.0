Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.2221.1585875380913677866
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 17:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: <nil>, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: hHpJN/SFpIulFmhR5AnyXOS+XrC5Fw+sfuN3SvftPUnFXRucoyi3C59VXurxwNHLc4rJVri9a5
 N3MocsvQrsgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 17:56:27 -0700
IronPort-SDR: i+C8PzB7VlmZkoKkJJu8GlpZeHoFfMS7rMBj7dnDPhNF6M6dbTHz+DRc20Y1ISJwlofqF8OJvN
 EBu0h0BqC9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,337,1580803200"; 
   d="scan'208";a="451129883"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2020 17:56:27 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 5/5] brief-yoctoprojectqs: buildtools changes
Date: Thu,  2 Apr 2020 17:55:57 -0700
Message-Id: <20200403005557.4708-5-timothy.t.orling@linux.intel.com>
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
 .../brief-yoctoprojectqs/brief-yoctoprojectqs.xml     | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
index 9b976014a..3c83afd46 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
@@ -107,17 +107,20 @@
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
                     section in the Yocto Project Reference Manual for information.
                     </para></listitem>
             </itemizedlist>
-- 
2.24.0

