Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.22937.1581346287131902450
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 06:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
IronPort-SDR: tcUirBztYnpHc8cf9ocyH6yKxbI0wG3t66diTTGvRTASlpjPnQ6uxGZDck0IYAX7IGU/GAH8iA
 /fnuomlkjSerJWNAz9nfYYAvQIADktspmJBBNHwN1W0rRP5aBNmr94JlDhlia5wHK363vw8egW
 mdJ+mlBgq9EqPOigHTNJMQjvNBcbL1wk1G1MYI2yMHYDdgdC/3oyaDEFlPqY8K8+1nJ7Md1EeO
 /I5GJoEbtkw+k2zMw+9w6xO9Gj5vLIL/d05TRfAeD+17uPaibsoiGTGiyuiEdgH281EZNPVfE/
 TyQ=
X-IronPort-AV: E=Sophos;i="5.70,425,1574118000"; 
   d="scan'208,217";a="5258083"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [master][zeus][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
Date: Mon, 10 Feb 2020 15:51:17 +0100
Message-ID: <20200210145121.18307-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-structure.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-structure.xml b/documentation/ref-manual/ref-structure.xml
index 8e0c9f5b62..937a4322fd 100644
--- a/documentation/ref-manual/ref-structure.xml
+++ b/documentation/ref-manual/ref-structure.xml
@@ -424,7 +424,7 @@
     </section>
 
     <section id='structure-build-conf-sanity_info'>
-        <title><filename>build/conf/sanity_info</filename></title>
+        <title><filename>build/cache/sanity_info</filename></title>
 
         <para>
             This file indicates the state of the sanity checks and is created
-- 
2.21.1

