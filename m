Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.19262.1592231054813743427
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HjPwE03A;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id x11so1472222plo.7
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=yv5GP24T4pKbQr648KAMRricLZB5hQqqzweYU4xuK+s=;
        b=HjPwE03AtOAbfBKHyQLMYthURjAbOx4OKp0/q6nmvpC2d7qEgLirh8B1Bfoa+brJuh
         hZEl1YLn+yNnMJ7X0CT6WtJGDk7ClAvobASBnhFMeTMvFo8YZduoi73kqoTNThh1xfHS
         dswarsOEeqYY+ia5d7zRJ4wjxJ5ln5GomsatMrNTgsQRdDJEPT1BQtLi7dZexqsBBxv3
         GnpZJkYnEi6FiEB3SUDQ62GvLuXnjMzFkHvUA58LQXqPVgnMUc/QReK6qoNUCN2acPj6
         d0CdDjvOOyq7p5wUR9HoaVvh/ZGwR0gdUy4PIapX+srKP9D5PpeN34k8wyA9VzofW+nZ
         H5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=yv5GP24T4pKbQr648KAMRricLZB5hQqqzweYU4xuK+s=;
        b=MWRVCLhVeHnW1u6dEMMKjWPAR469wguKYHT5jTUmqwIRPkRONumTQ38tjXebCXq85j
         rpLSQTWaSMVQIK8pvyZbKwPPyey+G4OZFUagx9GnxmqKiBXyT0fJjviz99AJ3B+1buU9
         fGEmvN8ojfW7I9WGJrrs5z7+YkIitbA5ltKe/0xjNC6riIOLt32eNFYFkRukKi5XVtKg
         nhfXBWMuSBPKJfrt71rNZWXRB3TtxcYnByWb0BMuwlBz42u39NNImAedGp6N8xE0eqlo
         0Buwh9WZ8D/LG7UMgDcLr9/b3dj3PZHvY8KVIgAOfqwPaW4aSevUIv3fomhmR/5S+Abi
         IwGA==
X-Gm-Message-State: AOAM532YBDcHl+5OZmfm/fBlycQEIbzWvbivw7IXHCohQHDmmDYZk0Ea
	AtRu/tzHeLhuSsDM6wv4zQIifjUT
X-Google-Smtp-Source: ABdhPJxcj93JCkd6znKjWdomYQrUGGfIxziU8oq/jkuVCoNxOgj5e/7Nxo8I3Hiy/oWGhYCDeYqEQQ==
X-Received: by 2002:a17:90a:5d85:: with SMTP id t5mr5991663pji.154.1592231053883;
        Mon, 15 Jun 2020 07:24:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.13
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/8] adt-manual: Add SPDX license headers
Date: Mon, 15 Jun 2020 07:24:05 -0700
Message-Id: <20200615142412.30882-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/adt-manual/adt-command.xml                      | 1 +
 documentation/adt-manual/adt-intro.xml                        | 1 +
 documentation/adt-manual/adt-manual-customization.xsl         | 1 +
 documentation/adt-manual/adt-manual-eclipse-customization.xsl | 2 ++
 documentation/adt-manual/adt-manual-intro.xml                 | 1 +
 documentation/adt-manual/adt-manual.xml                       | 1 +
 documentation/adt-manual/adt-package.xml                      | 1 +
 documentation/adt-manual/adt-prepare.xml                      | 1 +
 documentation/adt-manual/adt-style.css                        | 2 ++
 9 files changed, 11 insertions(+)

diff --git a/documentation/adt-manual/adt-command.xml b/documentation/adt-manual/adt-command.xml
index c78d18a16..b88c0ac68 100644
--- a/documentation/adt-manual/adt-command.xml
+++ b/documentation/adt-manual/adt-command.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='using-the-command-line'>
 <title>Using the Command Line</title>
diff --git a/documentation/adt-manual/adt-intro.xml b/documentation/adt-manual/adt-intro.xml
index 597c7120b..eb75763db 100644
--- a/documentation/adt-manual/adt-intro.xml
+++ b/documentation/adt-manual/adt-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='adt-intro'>
     <title>The Application Development Toolkit (ADT)</title>
diff --git a/documentation/adt-manual/adt-manual-customization.xsl b/documentation/adt-manual/adt-manual-customization.xsl
index b86be519b..551f7e9e9 100644
--- a/documentation/adt-manual/adt-manual-customization.xsl
+++ b/documentation/adt-manual/adt-manual-customization.xsl
@@ -1,4 +1,5 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/adt-manual/adt-manual-eclipse-customization.xsl b/documentation/adt-manual/adt-manual-eclipse-customization.xsl
index 77ba5f571..3d536d547 100644
--- a/documentation/adt-manual/adt-manual-eclipse-customization.xsl
+++ b/documentation/adt-manual/adt-manual-eclipse-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet
 	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 	xmlns="http://www.w3.org/1999/xhtml"
diff --git a/documentation/adt-manual/adt-manual-intro.xml b/documentation/adt-manual/adt-manual-intro.xml
index 034fdff60..b7a25a54b 100644
--- a/documentation/adt-manual/adt-manual-intro.xml
+++ b/documentation/adt-manual/adt-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='adt-manual-intro'>
 <title>Introduction</title>
diff --git a/documentation/adt-manual/adt-manual.xml b/documentation/adt-manual/adt-manual.xml
index 972f8bf08..13202cc0d 100644
--- a/documentation/adt-manual/adt-manual.xml
+++ b/documentation/adt-manual/adt-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='adt-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
diff --git a/documentation/adt-manual/adt-package.xml b/documentation/adt-manual/adt-package.xml
index 68eee9b38..eaed0447b 100644
--- a/documentation/adt-manual/adt-package.xml
+++ b/documentation/adt-manual/adt-package.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='adt-package'>
 <title>Optionally Customizing the Development Packages Installation</title>
diff --git a/documentation/adt-manual/adt-prepare.xml b/documentation/adt-manual/adt-prepare.xml
index 65df1d03e..684eb75c5 100644
--- a/documentation/adt-manual/adt-prepare.xml
+++ b/documentation/adt-manual/adt-prepare.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='adt-prepare'>
 
diff --git a/documentation/adt-manual/adt-style.css b/documentation/adt-manual/adt-style.css
index d722ad4b7..9d6221ae5 100644
--- a/documentation/adt-manual/adt-style.css
+++ b/documentation/adt-manual/adt-style.css
@@ -1,4 +1,6 @@
 /*
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
-- 
2.17.1

