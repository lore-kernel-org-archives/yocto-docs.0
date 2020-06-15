Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.19387.1592231056220576067
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iz9T/EeB;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id j4so3620334plk.3
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ipMvnvkHBceAcY7WyU3eQtaPQ9P4r/04LGlh0Jp40dY=;
        b=iz9T/EeBKCPyL81WWrLDmrwE21hvEu97I2vQ+MQhIMupnYX0ywqNOL+CLh4u0qOa5Z
         zPPENhwi9yyWeuS2fXXecNQceAsNJPFNB1e36IEWOUSGMlZrpdtjkwbMyaGHRn9jtECy
         ukcBNxExWm6szMH6DuMM5+pXFuHRGgIY9HzBO8IDggzIi8q24UM5g53yRBrQB5MGNmMP
         XCFShMaj3t/6BTOdzmEgHMkohzfZ6Pl09RmthIG7EJ6IjmbwsUoaEkT+CGngXycBD6Hl
         3UWpL1CKW43PkayoER1LSZSkSQ1D9/ZBDajFbWRqCQo4rSbxJL1rLHfXe34+EtTvN5DA
         qOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ipMvnvkHBceAcY7WyU3eQtaPQ9P4r/04LGlh0Jp40dY=;
        b=Bb4/g821ThZgwXahDOw1u+hmsx9SqmHCfCmexD157vauS0+Utc/i6jwfVC6p2CntxB
         2OtPRe3g34Bwd+QGl2SSksQahJyuFtKfg6a8IMShuqFNQBWzB++Z+R/FbSyc7ts/++cm
         O93Abe3tLkTVyM6nHbMM+1rUmVl/tIyrBWU6qAGim7pfZtCrv4SxnBZIUybmwJvJMjW+
         pVXT1oOAFCkKUE9IKy4Owbzu/7Nf4/iWuY/blAclNanLehEQUwKT8lwvjkrSORlvjvue
         eDRVwoV2NO/vx6oPdmE9Gj4cXoxQh55ZMv46ngDpZnt/eJPz87XHgPw5YSKm2QkwQQlc
         CKFA==
X-Gm-Message-State: AOAM533KnaFv4ZPi3S1Xz4wWrkHK488e6D238fPqpUKocUupmC+0cfwY
	h55n4BQYsWAa3UESEzCTEy/Jjwti
X-Google-Smtp-Source: ABdhPJxjHLDPH1E8TLk/Jks4xuII2WOBqEQyAoeo3hl7Ew8eB7/jscs3AkYz+kfNc7+8iYPAasQ0Jg==
X-Received: by 2002:a17:90a:297:: with SMTP id w23mr12946607pja.140.1592231055499;
        Mon, 15 Jun 2020 07:24:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.14
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:15 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/8] brief-yoctoprojectsqa: Add SPDX license headers
Date: Mon, 15 Jun 2020 07:24:07 -0700
Message-Id: <20200615142412.30882-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../brief-yoctoprojectqs-customization.xsl                     | 2 ++
 .../brief-yoctoprojectqs/brief-yoctoprojectqs-style.css        | 3 +++
 .../brief-yoctoprojectqs/brief-yoctoprojectqs-titlepage.xsl    | 1 +
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml    | 1 +
 4 files changed, 7 insertions(+)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-customization.xsl b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-customization.xsl
index 0d57424b5..012d86384 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-customization.xsl
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-style.css b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-style.css
index 386841deb..e4e79d90e 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-style.css
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-titlepage.xsl b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-titlepage.xsl
index a435ac77a..e74ac530d 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-titlepage.xsl
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs-titlepage.xsl
@@ -1,4 +1,5 @@
 <?xml version="1.0"?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exclude-result-prefixes="exsl">
 
diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
index 3c83afd46..198c7b968 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <article id='brief-yocto-project-qs-intro'>
     <articleinfo>
-- 
2.17.1

