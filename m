Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6.1593043123792472073
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 16:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05ONwgeP009569
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 16:58:42 -0700 (PDT)
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 24 Jun 2020 16:58:24 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] Fixed PDF build issue caused by duplicate IDs
Date: Wed, 24 Jun 2020 16:53:52 -0700
Message-ID: <20200624235352.18790-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 documentation/test-manual/test-manual-test-process.xml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/test-manual/test-manual-test-process.xml b/documentation/test-manual/test-manual-test-process.xml
index 6e2157c62..15bf420a0 100644
--- a/documentation/test-manual/test-manual-test-process.xml
+++ b/documentation/test-manual/test-manual-test-process.xml
@@ -1,7 +1,6 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
-<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='test-manual-test-process'>
 
@@ -46,7 +45,7 @@
             The full build includes all these things and is slower but more comprehensive.</para>
     </section>
 
-    <section id='test-yocto-project-autobuilder-overview'>
+    <section id='test-release-builds'>
         <title>Release Builds</title>
 
         <para>The project typically has two major releases a year with a six month cadence in April
-- 
2.17.1

