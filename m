Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3128.1585630092874604758
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 21:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: 9XyqUz3I4KhcOfCqOxTlMoBloIcvWwkk9sZza6fgdGLU1cWYpCDwdBhPwSK/RWKIQm4IKHZ4ew
 i+C/k6SV8ZnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 21:48:14 -0700
IronPort-SDR: IDi7/nOfyWuiBLpCWLJK1vQiAw4UtwPcas3uvJUeQnY48GKJEw2bzoMNqHB1MuI2ZIKRCLZICu
 jXzwDQQWM/Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="241816560"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2020 21:48:13 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: docs@lists.yoctoproject.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 2/4] dev-manual-common-tasks: Replace "SimpleRemoteTarget" with "simpleremote"
Date: Tue, 31 Mar 2020 12:48:06 +0800
Message-Id: <1585630088-31467-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>

As the OEQA code revamp and code changes in testimage.bbclass,
testexport.bbclass, runtime/context.py and oeqa/runexported.py,
"SimpleRemoteTarget" was obsolete and replaced by "simpleremote".
Replacing the refer of "SimpleRemoteTarget" by "simpleremote".

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index dfbc6ee..353602c 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -12030,12 +12030,12 @@
                     value is "QemuTarget".
                     For running tests on hardware, the following options exist:
                     <itemizedlist>
-                        <listitem><para><emphasis>"SimpleRemoteTarget":</emphasis>
-                            Choose "SimpleRemoteTarget" if you are going to
+                        <listitem><para><emphasis>"simpleremote":</emphasis>
+                            Choose "simpleremote" if you are going to
                             run tests on a target system that is already
                             running the image to be tested and is available
                             on the network.
-                            You can use "SimpleRemoteTarget" in conjunction
+                            You can use "simpleremote" in conjunction
                             with either real hardware or an image running
                             within a separately started QEMU or any
                             other virtual machine manager.
@@ -12210,7 +12210,7 @@
                 <title>Power Control</title>
 
                 <para>
-                    For most hardware targets other than SimpleRemoteTarget,
+                    For most hardware targets other than "simpleremote",
                     you can control power:
                     <itemizedlist>
                         <listitem><para>
-- 
2.7.4

