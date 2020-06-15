Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.19389.1592231057102911966
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HWBunpip;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id k1so6773136pls.2
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+AMM9s0TYWaCsYVYaWpj3v4cg7skG+TifHN5kNZzVDg=;
        b=HWBunpipFStbdAWyYk3MReDBDX7XiJ0DdvAFjsgB0tAVye+wfZtSQBVn1R6PMpfpAx
         aPOv2hUGOV1le5ORKX06INFAMLf21cho5H9hVvm4kbYNxbL1KLfDUMw4wqQznmdGAXUW
         UaHG7vYKlsUshzQmy5foM4HX/2FUprRKq1D/Al4br+ZOWLtxzkZq3Rv9+NR/+v+AlWcV
         F7UFQfLAJc/5p5J/UHG8ahQv6im8jGpWOwTzEz7ogrXivilRME+b3EcxlS07rr207tsz
         CxAePc5DFj6ZRepF9NK+Ppet/VS7Yg2Paa9JKw95M1GIMpFFOnsDoNzmTjW9Wxc2A0IT
         ySKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+AMM9s0TYWaCsYVYaWpj3v4cg7skG+TifHN5kNZzVDg=;
        b=KWdTQSCx1qNMEW26PXsCoj6z3lc5ZXTdvH9DqBnlBucK/sNe/KoUqeCZUiF4KrD2Oy
         B4F5iZ05ZrqPsQ/gDOeOzaZ2d3Qn40Iv2CJ0/lpKlT9y/ojqxGgMdMzQCUEIvmtizJbQ
         TGC63v7Iu1xKNGUf6YYgB8wrcHuNz4cRvZ9ru3n8oFYcDp1imP0enUUVRYUuORwjAXsQ
         hGNpqcODVYwTlTf5Q60Vbo9gi7O4CzzeXFv4vB6kJbfjSFL6hb63JSsfO3+hOdA+EGkR
         QSc+i3q9kdusxtQ6RSvR6PDYy/0BocUpChR7QY2lbQ9jr4b16jdYVAqjju0VKgkFajM/
         9bOw==
X-Gm-Message-State: AOAM533Ez8fLf+PmWkzLi7ss7exPpd4BYYZIlVh8WanYp7mP2OItA42e
	+dr+pSGcaFdhQttN4i5UM3DbF0uc
X-Google-Smtp-Source: ABdhPJxSTUzxET11QxStXWhIts5PMsZJinao+Llpejf3hjXHUig+qsJvohqhqu6lSgoltXIRKesA1Q==
X-Received: by 2002:a17:90a:6706:: with SMTP id n6mr12975994pjj.13.1592231056399;
        Mon, 15 Jun 2020 07:24:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:15 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/8] dev-manual: Add SPDX License headers
Date: Mon, 15 Jun 2020 07:24:08 -0700
Message-Id: <20200615142412.30882-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml  | 1 +
 documentation/dev-manual/dev-manual-customization.xsl | 2 ++
 documentation/dev-manual/dev-manual-intro.xml         | 1 +
 documentation/dev-manual/dev-manual-qemu.xml          | 1 +
 documentation/dev-manual/dev-manual-start.xml         | 1 +
 documentation/dev-manual/dev-manual.xml               | 1 +
 documentation/dev-manual/dev-style.css                | 3 +++
 7 files changed, 10 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 605d1ad7e..d29fe6262 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='extendpoky'>
 
diff --git a/documentation/dev-manual/dev-manual-customization.xsl b/documentation/dev-manual/dev-manual-customization.xsl
index 523ea3c5e..6b16bcabf 100644
--- a/documentation/dev-manual/dev-manual-customization.xsl
+++ b/documentation/dev-manual/dev-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/dev-manual/dev-manual-intro.xml b/documentation/dev-manual/dev-manual-intro.xml
index 3a34094b8..38de5e4f5 100644
--- a/documentation/dev-manual/dev-manual-intro.xml
+++ b/documentation/dev-manual/dev-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='dev-manual-intro'>
 
diff --git a/documentation/dev-manual/dev-manual-qemu.xml b/documentation/dev-manual/dev-manual-qemu.xml
index 5ccc0dfe8..46fe67bab 100644
--- a/documentation/dev-manual/dev-manual-qemu.xml
+++ b/documentation/dev-manual/dev-manual-qemu.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='dev-manual-qemu'>
 
diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 8cb5631f0..9ff9ac4c8 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='dev-manual-start'>
 
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 6f86454ed..66439930e 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='dev-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
diff --git a/documentation/dev-manual/dev-style.css b/documentation/dev-manual/dev-style.css
index 6d0aa8e9f..331c7c54d 100644
--- a/documentation/dev-manual/dev-style.css
+++ b/documentation/dev-manual/dev-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
-- 
2.17.1

