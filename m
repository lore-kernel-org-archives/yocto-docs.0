Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.19391.1592231060197538617
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P6G/GH8i;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id j1so7892333pfe.4
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ygqZLg+cLWeEnZnYYLKzQg4FARVowzlLg2YhmgMRZY4=;
        b=P6G/GH8ie2KdFuQFK/pjjS2suxEQM4xG5Oi/RPA8DUKbZf01H6jlYTVp2bL1FrraIz
         olkBvQhNjUDt+WpDOUd4ZdOPOsu7JzP59R/xUAtLlf4W+2HyO7oxwVosQQIA8J/l9od0
         s7octtfjo5PmUdnOp9FPOxbaBIGgsZI3dLTK0FXReyLwZVdJ2sClsLQCLaceQnntDCwO
         80JP16uBylvhEj9AW/zjxitde07fuCJFzxsmwpMrlR0JkNCV9GnW6Pxwa02/EiIKklPE
         44ZgPMvdZHTeeFTHkYXroyE/uliDw48F0o2gdmdfvngsfR/rM1XRZifLyw+OGSh3oMIX
         Rcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ygqZLg+cLWeEnZnYYLKzQg4FARVowzlLg2YhmgMRZY4=;
        b=lyDvclZzdVdZuzusJJFBLHttSWr2aXeWtpf8nrJOsbePF1kMcG0VsFmCoZg+95Z6o7
         2f2VeJxZd4U/mMkSNQoiiCksTa8s2d4YvHK0ZgRkPWBOyIpPc+BSutbW60+EQZEkCz/L
         mvMVSYwrUxupXsyPJtclg/5V3CGNlQjBLXHEbewkf082T/0P6uRTD6ails2xF1Zi/28D
         kr/0kEVIjLkKDist0I2kxQ4TOoEMGr6XhgWsjDGlzCtsjLZuEgQFxEppAXD9gGYhO6wp
         ef1t36ELe08m6ES2bsgAId8b3AcOzECbtnj+H6FUi/RSVF4smgvz/Gl7AY/kxmaWBbLj
         cr9w==
X-Gm-Message-State: AOAM53104cByYfo9SsYC3mJEIWqk7+TIwWxtMl62wLJa69KPCx3zT/of
	RSk2xaFmFgDWbq2RcD8yA/i6doff
X-Google-Smtp-Source: ABdhPJyttWB4LGCQXRljEGMx4w+s3aebj4Mr+TYJkdehTcQmMxZ30per1cSz7czEemPnkTG8dTg7mQ==
X-Received: by 2002:a63:4754:: with SMTP id w20mr15105646pgk.255.1592231059274;
        Mon, 15 Jun 2020 07:24:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.18
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:18 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 7/8] sdk-manual: Add SPDX license headers
Date: Mon, 15 Jun 2020 07:24:11 -0700
Message-Id: <20200615142412.30882-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/sdk-manual/sdk-appendix-customizing-standard.xml | 1 +
 documentation/sdk-manual/sdk-appendix-customizing.xml          | 1 +
 documentation/sdk-manual/sdk-appendix-obtain.xml               | 1 +
 documentation/sdk-manual/sdk-extensible.xml                    | 1 +
 documentation/sdk-manual/sdk-intro.xml                         | 1 +
 documentation/sdk-manual/sdk-manual-customization.xsl          | 2 ++
 documentation/sdk-manual/sdk-manual.xml                        | 1 +
 documentation/sdk-manual/sdk-style.css                         | 3 +++
 documentation/sdk-manual/sdk-using.xml                         | 1 +
 documentation/sdk-manual/sdk-working-projects.xml              | 1 +
 10 files changed, 13 insertions(+)

diff --git a/documentation/sdk-manual/sdk-appendix-customizing-standard.xml b/documentation/sdk-manual/sdk-appendix-customizing-standard.xml
index f20891c80..3a6b4c8d8 100644
--- a/documentation/sdk-manual/sdk-appendix-customizing-standard.xml
+++ b/documentation/sdk-manual/sdk-appendix-customizing-standard.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <appendix id='sdk-appendix-customizing-standard'>
 
diff --git a/documentation/sdk-manual/sdk-appendix-customizing.xml b/documentation/sdk-manual/sdk-appendix-customizing.xml
index 911658f91..08054f8b7 100644
--- a/documentation/sdk-manual/sdk-appendix-customizing.xml
+++ b/documentation/sdk-manual/sdk-appendix-customizing.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <appendix id='sdk-appendix-customizing'>
 
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.xml b/documentation/sdk-manual/sdk-appendix-obtain.xml
index 86b6d7dd0..de7f75e2b 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.xml
+++ b/documentation/sdk-manual/sdk-appendix-obtain.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <appendix id='sdk-appendix-obtain'>
 
diff --git a/documentation/sdk-manual/sdk-extensible.xml b/documentation/sdk-manual/sdk-extensible.xml
index 94d2a241f..a73a07a7b 100644
--- a/documentation/sdk-manual/sdk-extensible.xml
+++ b/documentation/sdk-manual/sdk-extensible.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='sdk-extensible'>
 
diff --git a/documentation/sdk-manual/sdk-intro.xml b/documentation/sdk-manual/sdk-intro.xml
index 9169fe9c0..f42670ea6 100644
--- a/documentation/sdk-manual/sdk-intro.xml
+++ b/documentation/sdk-manual/sdk-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='sdk-intro'>
 <title>Introduction</title>
diff --git a/documentation/sdk-manual/sdk-manual-customization.xsl b/documentation/sdk-manual/sdk-manual-customization.xsl
index efa8a84bb..4f8816f95 100644
--- a/documentation/sdk-manual/sdk-manual-customization.xsl
+++ b/documentation/sdk-manual/sdk-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index 537663dad..6344478fb 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='sdk-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
diff --git a/documentation/sdk-manual/sdk-style.css b/documentation/sdk-manual/sdk-style.css
index 52518964c..e0c4416a1 100644
--- a/documentation/sdk-manual/sdk-style.css
+++ b/documentation/sdk-manual/sdk-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/sdk-manual/sdk-using.xml b/documentation/sdk-manual/sdk-using.xml
index 66b15cd6c..28ee50d0b 100644
--- a/documentation/sdk-manual/sdk-using.xml
+++ b/documentation/sdk-manual/sdk-using.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='sdk-using-the-standard-sdk'>
     <title>Using the Standard SDK</title>
diff --git a/documentation/sdk-manual/sdk-working-projects.xml b/documentation/sdk-manual/sdk-working-projects.xml
index 521271d54..070d903c7 100644
--- a/documentation/sdk-manual/sdk-working-projects.xml
+++ b/documentation/sdk-manual/sdk-working-projects.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='sdk-working-projects'>
 
-- 
2.17.1

