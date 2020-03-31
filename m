Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3128.1585630092874604758
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 21:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: zJ4+iBUEncs+CKOP2yEBhPgSpQEuO3bQqizJrRYVj53i5MFjEblD6nOgz7RA0Bt/nSb9rbJjTt
 ATp58dzgxqjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 21:48:18 -0700
IronPort-SDR: 7KQrgqVd7FC6ew0ZZJY7H51paKZcZ1Ktbz+3XmetFIyXzd02HTfMUZFkPBW2sBlI4bGKynJtQX
 01RYnwruaeIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="241816570"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2020 21:48:17 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: docs@lists.yoctoproject.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 4/4] dev-manual-common-tasks.xml: Replace "QemuTarget" with "qemu"
Date: Tue, 31 Mar 2020 12:48:08 +0800
Message-Id: <1585630088-31467-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>

As the OEQA code revamp and code changes in testimage.bbclass,
testexport.bbclass, runtime/context.py and oeqa/runexported.py,
"QemuTarget" was obsolete and replaced by "qemu".
Replacing the refer of "QemuTarget" with "qemu".

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 353602c..0d03ddc 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -12027,7 +12027,7 @@
                     In order to run tests on hardware, you need to set
                     <filename>TEST_TARGET</filename> to an appropriate value.
                     For QEMU, you do not have to change anything, the default
-                    value is "QemuTarget".
+                    value is "qemu".
                     For running tests on hardware, the following options exist:
                     <itemizedlist>
                         <listitem><para><emphasis>"simpleremote":</emphasis>
@@ -12607,7 +12607,7 @@
                                 <listitem><para><emphasis><filename>target</filename>:</emphasis>
                                     The target controller object used to deploy
                                     and start an image on a particular target
-                                    (e.g. QemuTarget, SimpleRemote, and
+                                    (e.g. Qemu, SimpleRemote, and
                                     SystemdbootTarget).
                                     Tests usually use the following:
                                     <itemizedlist>
-- 
2.7.4

