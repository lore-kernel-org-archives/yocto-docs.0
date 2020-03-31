Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.3128.1585630092874604758
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2020 21:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: SVDPgqT+S/qPCJAUAkt0k/EuE8p9U1g4TbkVionLMgoWYqtEtlAM/APGU6ok2zk8EUshA2L17o
 Ra05ZqsEOgbw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 21:48:12 -0700
IronPort-SDR: XZXtDiyWp6WWCgKjB7LZL2iTMGYpuW8GSRil7EaniK5B3eeRU9SD0MhuWY2lZqgUZUZjcThYQE
 P/klNRm5BvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="241816555"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2020 21:48:11 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: docs@lists.yoctoproject.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 1/4] ref-variables.xml: Replace "SimpleRemoteTarget" with "simpleremote"
Date: Tue, 31 Mar 2020 12:48:05 +0800
Message-Id: <1585630088-31467-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4

As the OEQA code revamp and code changes in testimage.bbclass,
testexport.bbclass, runtime/context.py and oeqa/runexported.py,
"SimpleRemoteTarget" was obsolete and replaced by "simpleremote".
Replacing the refer of "SimpleRemoteTarget" by "simpleremote".

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 documentation/ref-manual/ref-variables.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index c8ee50a..0735fb4 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -15714,14 +15714,14 @@
                             section in the Yocto Project Development Tasks
                             Manual for more information.
                             </para></listitem>
-                        <listitem><para><emphasis>"SimpleRemoteTarget":</emphasis>
+                        <listitem><para><emphasis>"simpleremote":</emphasis>
                             Runs the tests on target hardware that is already
                             up and running.
                             The hardware can be on the network or it can be
                             a device running an image on QEMU.
                             You must also set
                             <link linkend='var-TEST_TARGET_IP'><filename>TEST_TARGET_IP</filename></link>
-                            when you use "SimpleRemoteTarget".
+                            when you use "simpleremote".
                             <note>
                                 This argument is defined in
                                 <filename>meta/lib/oeqa/controllers/simpleremote.py</filename>.
-- 
2.7.4

