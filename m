Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.1744.1582230457237069046
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 12:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=PiJ2ZuTp;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=713; q=dns/txt; s=axis-central1;
  t=1582230457; x=1613766457;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oMpeJFiGMGtM9hkKfu70vPRMxXbyYqtnfggxO5i0WEQ=;
  b=PiJ2ZuTpAaGgmwqTZNX06GDfyoKJwkPkpVBrEX8UIqCEAPfQ3iQBWqVC
   ZKwHfRpczCkyvmlWtAkQtgQchCM9+zo6dldquUqBIYE87C4OyrEyyxztC
   pVwNM743VFnSasXQ4rWxRO9W2vkOwKPgltADqRgY5FHYVXzpZlpEbGNzt
   x4ptf6vfZvzdzKIaEoNwPeegwZDD4VSRmId4jZSso5SeoYxGDqZCKtxm2
   QEslpS/ny6hwjAp8kt/HsMcSID5v4A+CPl6kCJ8lvThGPgorXgoDiH3wB
   RV6TdKU8eoeAlF+bMANRuy926hg/iD5m9Dd41OcUja/s+oflKQWokKWHS
   w==;
IronPort-SDR: BUIc0iO68BR2GJEvMKSEcUxRjWjqpbHOM+5y0+rf04wmHtBdHnQXbcbbwei0gFj0+7Xiq+Q+/U
 7XLDeGqWOQPfZCDCYYfHMv4EWNlSFZYFrXEXWHM3cZ6FFBXGQlSlS06vDrJURgS+N2X8jKJyk6
 PADYUx89HUl97sWaEOmt5dmEJZK7QH0ydkr1kTC1QBiTe3/czY/NWzAIn1a1tQjZLLPB53VPpi
 wbypfrfyiQCh5aMytfwr5oqpjKjHQ5MXKkDHbcpVFCLq12o+9oGfhHUkaJSRXENnm06Ua+fWrE
 388=
X-IronPort-AV: E=Sophos;i="5.70,465,1574118000"; 
   d="scan'208,217";a="5501089"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [Resend][PATCH 1/5] ref-manual: The sanity_info file has moved from build/conf to build/cache
Date: Thu, 20 Feb 2020 21:27:29 +0100
Message-ID: <20200220202733.21907-1-pkj@axis.com>
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

