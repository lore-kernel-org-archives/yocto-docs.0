Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.19385.1592231055280292656
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oovnogAv;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id v24so6868938plo.6
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kJfQ+tuJVAUcfWxHeLdWRAarRd3bTY0iBUWEzJsR1fk=;
        b=oovnogAvn7258oxXOVRR5w4N3fV8p3B68hyPDQpBHf7uKfrq8jx4mymjTXz6KDzZGB
         3Bo1XSSafh1PDIQINSpaWVqltpyxCqHlixH3mzpuNT6iBusLpvLepYhfPer6TP3zfz5A
         J/xlouTfAns4VUjs4/u/k51as2gMkCBVAd7+afcnb6eKx37UcO8lscwLvDdbi6fIf4xs
         b8NVGpIU7PoKiYyVWegQuhnejjkb8qD7yi+bOgR0zhkkL8bFSXm6dQKafAtQr3Tkh2DH
         AQDi4tQd/tCfIqJyIQYDdkSo9NzUerZcKX6p4Fdxe2X+XuvGzWptZNjF137LcWIjZ4pQ
         sWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kJfQ+tuJVAUcfWxHeLdWRAarRd3bTY0iBUWEzJsR1fk=;
        b=OAGNqYpNtEJb2EDPEZYYHtWM6kO8BjayEHh6i+eRnKl1G3lm4OvMr1Fs5PijLPYaqc
         M+lM7f1yYfgg/Ocuc/UVfs98ftoas0XzKe5Wqx3REl4Wts6sI9okSt7Fd7n0RLASW6d2
         NetraVZVmj/ya9HKaCFsnrZ6IM71BpRUm9aEVPNCb1yZwxlVrGdjfI+qckB3PkQv4XNd
         Bn1K/6ghw0iJDwOBrynSXKcQOxpyBxCiewC07sqjAC5AGFRTLAmjU3SPsBW3IhFnZIRH
         nKQCCl5qyCtoxUOKEJY4PDPrWQ8oMWzP3lpHt6dQhnQvARCvXiYur39lxgLoGlgB6o88
         opIw==
X-Gm-Message-State: AOAM531eB1CGxBEz35lDitPaDLqZTT8HvcF1WQzRXjLL8+sdugmoNRg+
	2cF+D0aqMG93Zs6PW/uDZM9Hn5XZ
X-Google-Smtp-Source: ABdhPJyz2a4TIq1OyWkw/JdMSD7+T3pgp2KK4qkgBOCcl/d7EcCaCLyzGBNLgHU+CQH+19w5COLkgw==
X-Received: by 2002:a17:90a:be09:: with SMTP id a9mr11969026pjs.43.1592231054692;
        Mon, 15 Jun 2020 07:24:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.14
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:14 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/8] bsp-guide: Add SPDX license headers
Date: Mon, 15 Jun 2020 07:24:06 -0700
Message-Id: <20200615142412.30882-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide-customization.xsl | 2 ++
 documentation/bsp-guide/bsp-guide.xml               | 1 +
 documentation/bsp-guide/bsp-style.css               | 2 ++
 documentation/bsp-guide/bsp.xml                     | 1 +
 4 files changed, 6 insertions(+)

diff --git a/documentation/bsp-guide/bsp-guide-customization.xsl b/documentation/bsp-guide/bsp-guide-customization.xsl
index de674a0ae..37fcbcd20 100644
--- a/documentation/bsp-guide/bsp-guide-customization.xsl
+++ b/documentation/bsp-guide/bsp-guide-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index a189606ce..93ba1e7fe 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='bsp-guide' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
diff --git a/documentation/bsp-guide/bsp-style.css b/documentation/bsp-guide/bsp-style.css
index 0c8689b96..4ccf5d8ae 100644
--- a/documentation/bsp-guide/bsp-style.css
+++ b/documentation/bsp-guide/bsp-style.css
@@ -1,4 +1,6 @@
 /*
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
index 96c0455f6..72a077e80 100644
--- a/documentation/bsp-guide/bsp.xml
+++ b/documentation/bsp-guide/bsp.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='bsp'>
 
-- 
2.17.1

