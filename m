Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.285.1592347551402983579
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 15:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HdK+9/7D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id x14so329284wrp.2
        for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2020 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM7OH//339LpVE4QC+goxPvHCb3SxwJwdrRVTg+pnLI=;
        b=HdK+9/7DChLjN16dHZ49XZWRO1IK4DtACL+y1eq3KWaPfJdM241MmV83C+eFk526IJ
         mdQcPQNuMLujM3/LqGwipDNiAXtKBbX+5mL1nElj6PpddFOxwyX8HJ5J488EcBZut6Hr
         rYM0fXlEFiYJ5CUNtoCZ99SZe1lKQD3ey7jZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM7OH//339LpVE4QC+goxPvHCb3SxwJwdrRVTg+pnLI=;
        b=ILaY/SbwzrIib5gy52OchRSgoHPbLpNN451qkFSQhShFjgsRoidJpm/31sNpdH5xdJ
         7MC0Jeaj6VL2aXrRQitAX8Z9GCyojEfDGnYJQF3emM4AO1VvKePxNoiCGJduXbFl7zns
         KSSDw44Iq+ZxFZjQ6opU/Tm4JElEiUR7XmOmTIG73GobB3uOZytOxTiPisAfSjVJCTt7
         jdwN5ULpDaA3/Tp1pHVUgPcHpJCbgT/Nplr4bpZWWs87Gb8qVR9jz7DGDCulz/ax6oyd
         EmPdQiHmFDFsfg27Nf/AXzZJl3pSh2fMSvBQE0CpPQJybA69eZ5e215XDdYfmbRv+qAM
         DT8w==
X-Gm-Message-State: AOAM532l8z1fBOjO/ug9VAGPz8V6bAi/Pe3HhENebNizNeIKfnwi5gF4
	IYbgpyFFM6Dn8jkW0hCNuvhDVOkFLH0+9w==
X-Google-Smtp-Source: ABdhPJyEjoq73uAgkvar280BdQmUoR87oomQtQ6EXpMpOfaX0Zw+11lU3cVSe3c6VZINq+Avkhks8A==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr5350149wrr.96.1592347549363;
        Tue, 16 Jun 2020 15:45:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u74sm5974729wmu.31.2020.06.16.15.45.48
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 15:45:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] test-manual: Add SPDX license headers
Date: Tue, 16 Jun 2020 23:45:47 +0100
Message-Id: <20200616224547.390160-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Yocto #13873]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/test-manual/test-manual-customization.xsl         | 2 ++
 documentation/test-manual/test-manual-intro.xml                 | 1 +
 documentation/test-manual/test-manual-style.css                 | 2 ++
 documentation/test-manual/test-manual-test-process.xml          | 1 +
 .../test-manual/test-manual-understand-autobuilder.xml          | 1 +
 documentation/test-manual/test-manual.xml                       | 1 +
 6 files changed, 8 insertions(+)

diff --git a/documentation/test-manual/test-manual-customization.xsl b/documentation/test-manual/test-manual-customization.xsl
index 6e437d482..17bf57c2d 100644
--- a/documentation/test-manual/test-manual-customization.xsl
+++ b/documentation/test-manual/test-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/test-manual/test-manual-intro.xml b/documentation/test-manual/test-manual-intro.xml
index 5e9def894..9464d332c 100644
--- a/documentation/test-manual/test-manual-intro.xml
+++ b/documentation/test-manual/test-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='test-manual-intro'>
 
diff --git a/documentation/test-manual/test-manual-style.css b/documentation/test-manual/test-manual-style.css
index 15ff718b1..10ee4c79c 100644
--- a/documentation/test-manual/test-manual-style.css
+++ b/documentation/test-manual/test-manual-style.css
@@ -1,6 +1,8 @@
 /*
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Browser wrangling and typographic design by
       Oyvind Kolas / pippin@gimp.org
 
diff --git a/documentation/test-manual/test-manual-test-process.xml b/documentation/test-manual/test-manual-test-process.xml
index 0b5036cd2..6e2157c62 100644
--- a/documentation/test-manual/test-manual-test-process.xml
+++ b/documentation/test-manual/test-manual-test-process.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='test-manual-test-process'>
 
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.xml b/documentation/test-manual/test-manual-understand-autobuilder.xml
index 754130535..c96713c1d 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.xml
+++ b/documentation/test-manual/test-manual-understand-autobuilder.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='test-manual-understand-autobuilder'>
 
diff --git a/documentation/test-manual/test-manual.xml b/documentation/test-manual/test-manual.xml
index 9d3c0354d..d454566c5 100755
--- a/documentation/test-manual/test-manual.xml
+++ b/documentation/test-manual/test-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='test-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
-- 
2.25.1

