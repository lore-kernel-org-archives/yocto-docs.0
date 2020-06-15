Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.10265.1592193382413049528
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 20:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zcj/ZSPJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id s23so7243022pfh.7
        for <docs@lists.yoctoproject.org>; Sun, 14 Jun 2020 20:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=ZkKYhKDbnS5HzTzPeB29iHSclDn8EFTRJRtv8VaMA5k=;
        b=Zcj/ZSPJ6PtDMTHXw3r5ewoyO135fhds8QQxciX+w7919bNwpuQdSTPWcg0XxF06JI
         yw05CLO+/BYxQAKrgUHNlb70GteMvLa53ZbIJSY9L/9CarsquS3l95Fkwml0Or1TryyX
         7P+U/DsBtMmgNDDVvaV0+N4Do9afuVE3OafLtUszO3F5CMoAZIhoAFgNxRwqyQuFRpsQ
         wznCn3nEDenXPwddYLIG60QxzhGxRYxVse/t36DL94blCvONMaqis3LDkwZa1OMhrkHJ
         mroodzNzCPJrapkMTYYDXnUgvOmk79ghjYMuBYBIHccx6S603+QATOAL/cf9zg3JURVG
         vPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ZkKYhKDbnS5HzTzPeB29iHSclDn8EFTRJRtv8VaMA5k=;
        b=BwW2wpDfTdYxBlNzGKi86/9YD0QzLX+4zZtXZH2mkeJMbcnlY8kSaPXT9diiYqzR+1
         t8zt1FrYYmNoGSRs9miS1jkP8uO1yF9+w+QhJRqcV6b6jdXlKwGPyvcGw87ZGxD2TKc/
         OLx3wO8dqOC6Z1vVqfAvYRO3YaNkk8aIOQEd8Et0RA7X6hH3QhGdkNpTnZWvFjVN5yzC
         OMMz6gfe51c9wPPZMBtB5ThirnAfjzzv4EcaKBj/jaoszSzflPJs3q4w6qYGt1z9QQ0B
         vq3yg/td9QZWIEDKfX4DZFJN+yJOlh+0kSEeWHlxT1zk39Sn67g/VGVrnYYsz8BdNqwn
         Zcyg==
X-Gm-Message-State: AOAM533HNfNpmfBF95VrVIA4fwo9XyliadLejxT2VCBZ+HTg1VIF6Ftg
	NFB6lcayrorsR4uGNBcGojhx/Mam
X-Google-Smtp-Source: ABdhPJxW1MlsEuGJfMPyO+vcmxvqDBByvhcnsnrbSPPnBEbUIY9C6+vKBdUo6dr7DhHVCr8H+3iQ5g==
X-Received: by 2002:a63:1323:: with SMTP id i35mr20213134pgl.311.1592193381369;
        Sun, 14 Jun 2020 20:56:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id mw5sm12202254pjb.27.2020.06.14.20.56.20
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 20:56:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] overview-manual: add SPDX license header
Date: Sun, 14 Jun 2020 20:56:19 -0700
Message-Id: <20200615035619.21626-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/overview-manual/overview-manual-concepts.xml      | 1 +
 documentation/overview-manual/overview-manual-customization.xsl | 2 ++
 .../overview-manual/overview-manual-development-environment.xml | 1 +
 documentation/overview-manual/overview-manual-intro.xml         | 1 +
 documentation/overview-manual/overview-manual-style.css         | 2 ++
 documentation/overview-manual/overview-manual-yp-intro.xml      | 1 +
 documentation/overview-manual/overview-manual.xml               | 1 +
 7 files changed, 9 insertions(+)

diff --git a/documentation/overview-manual/overview-manual-concepts.xml b/documentation/overview-manual/overview-manual-concepts.xml
index f085dd710..58b64bd26 100644
--- a/documentation/overview-manual/overview-manual-concepts.xml
+++ b/documentation/overview-manual/overview-manual-concepts.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id=' overview-manual-concepts'>
 <title>Yocto Project Concepts</title>
diff --git a/documentation/overview-manual/overview-manual-customization.xsl b/documentation/overview-manual/overview-manual-customization.xsl
index 22360e7ba..1dd91bde8 100644
--- a/documentation/overview-manual/overview-manual-customization.xsl
+++ b/documentation/overview-manual/overview-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/overview-manual/overview-manual-development-environment.xml b/documentation/overview-manual/overview-manual-development-environment.xml
index 36ebf8a32..8415d1dd7 100644
--- a/documentation/overview-manual/overview-manual-development-environment.xml
+++ b/documentation/overview-manual/overview-manual-development-environment.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='overview-development-environment'>
 <title>The Yocto Project Development Environment</title>
diff --git a/documentation/overview-manual/overview-manual-intro.xml b/documentation/overview-manual/overview-manual-intro.xml
index 39433aa41..0e0bfed6e 100644
--- a/documentation/overview-manual/overview-manual-intro.xml
+++ b/documentation/overview-manual/overview-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='overview-manual-intro'>
 
diff --git a/documentation/overview-manual/overview-manual-style.css b/documentation/overview-manual/overview-manual-style.css
index 97a364b12..eec934161 100644
--- a/documentation/overview-manual/overview-manual-style.css
+++ b/documentation/overview-manual/overview-manual-style.css
@@ -1,4 +1,6 @@
 /*
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/overview-manual/overview-manual-yp-intro.xml b/documentation/overview-manual/overview-manual-yp-intro.xml
index 1b60a3030..2097ed36e 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.xml
+++ b/documentation/overview-manual/overview-manual-yp-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='overview-yp'>
     <title>Introducing the Yocto Project</title>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 210d644b3..8021a2e95 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='overview-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
-- 
2.17.1

