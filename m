Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3128.1585630092874604758
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 21:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: aTPKGSKkwCwSU6qseKfVFixkDvSOs3coGP1+dViT3zTDxBBUPdGzlulwtyGd0hOvAUUVjYeji6
 Ci1IpquY3aKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 21:48:16 -0700
IronPort-SDR: EX2X928nV52OcKuAc1lbiLXbsjm7IfbKk2Yjf3o2IK7s+JXts7B1UzUCncS6cr07RELngBxliA
 pRyVmBJ8NgCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="241816564"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2020 21:48:15 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: docs@lists.yoctoproject.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 3/4] ref-variables.xml: Replace "QemuTarget" with "qemu"
Date: Tue, 31 Mar 2020 12:48:07 +0800
Message-Id: <1585630088-31467-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>

As the OEQA code revamp and code changes in testimage.bbclass,
testexport.bbclass, runtime/context.py and oeqa/runexported.py,
"QemuTarget" was obsolete and replaced by "qemu".
Replacing the refer of "QemuTarget" with "qemu".

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 documentation/ref-manual/ref-variables.xml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 0735fb4..c400d1e 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -15686,9 +15686,9 @@
 <!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
                     Specifies the target controller to use when running tests
                     against a test image.
-                    The default controller to use is "QemuTarget":
+                    The default controller to use is "qemu":
                     <literallayout class='monospaced'>
-     TEST_TARGET = "QemuTarget"
+     TEST_TARGET = "qemu"
                     </literallayout>
                 </para>
 
@@ -15707,7 +15707,7 @@
                     You can provide the following arguments with
                     <filename>TEST_TARGET</filename>:
                     <itemizedlist>
-                        <listitem><para><emphasis>"QemuTarget":</emphasis>
+                        <listitem><para><emphasis>"qemu":</emphasis>
                             Boots a QEMU image and runs the tests.
                             See the
                             "<ulink url='&YOCTO_DOCS_DEV_URL;#qemu-image-enabling-tests'>Enabling Runtime Tests on QEMU</ulink>"
-- 
2.7.4

