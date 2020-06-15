Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.19390.1592231058056962301
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bX/FgnHc;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ne5so6895789pjb.5
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6SrwcLQ5bzwb7xwD07GtgElJ1Rbj/o5w0M/JLbUd6R8=;
        b=bX/FgnHc47ZwslGk+20yhh7eEp8PNSMBoFDZ+3Nn7+4WYXBOLXy/KQNwVplKfh1Imk
         zbf0xMs2UIA0lhQ+vb9udqrjhhnlssq1mOOpEf1Zkj6NdrKsCedherpjZPebrWSI0T4V
         7uvHjbr368cF7AfYwxPIOzkq5kWuQp9vM8eL4q6lb4MN9Wym6biXodugavikUIuYg2+9
         pav0c4lXihQogkimybeeDxVPZhN6J2VqB53uz8P+NlPF1XgEPLH7kksNbPemELYo00hw
         pNxqQc2TfNcwsskRNde0eNOBAc4Fv0MgmS+LktKcWxBxJYVwn1NhH0avYP32z4jODQUR
         bXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6SrwcLQ5bzwb7xwD07GtgElJ1Rbj/o5w0M/JLbUd6R8=;
        b=k8EU2nKwr3gj2E8XovntwRrxV5Fg6U/aB5UFWwTuY29Jq+R40FjOFMPPkyskm6r/xq
         iRzPEJHgxrK7TQxlKEUhBZsfFjsOCzBYnwLnR1fYP0PV8Kmi+1E0LGFpLPPRCzvhEPjG
         s1E1N1boazR2kKjrH+9P+oKan2mTqZSAmgFZdf1TurQwqsg02VqFK8dfWGNzIoj+7vsF
         vapGhdbCFbjuHmRFYQfUg4RaT/AkHyStTxDc7x3Cz9Tq8uQUuJId6Mn2fsTt93gUA1ck
         SWAj3IYXqspOItD1ZR5DShgVuJl4Bay7/qeCYCu27EipUpJ6dtM3YTyoQE3txBdI5wyE
         TOSg==
X-Gm-Message-State: AOAM530JGzdb7Qook+oxgsiGCLLshom2fs/yfZmnnweCasr90/Oa57uC
	52uIQEV+bZySIJDpEVxbGVJbderk
X-Google-Smtp-Source: ABdhPJylDkRdXseGBKpst643hK2DDDZC2nAI9HUKECoyA/NqEMh+vBXeYOAi3RB/6jbEAGfeOPnVDg==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr12810184pjb.19.1592231057262;
        Mon, 15 Jun 2020 07:24:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/8] kernel-dev: Add SPDX license headers
Date: Mon, 15 Jun 2020 07:24:09 -0700
Message-Id: <20200615142412.30882-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/kernel-dev/kernel-dev-advanced.xml      | 1 +
 documentation/kernel-dev/kernel-dev-common.xml        | 1 +
 documentation/kernel-dev/kernel-dev-concepts-appx.xml | 1 +
 documentation/kernel-dev/kernel-dev-customization.xsl | 2 ++
 documentation/kernel-dev/kernel-dev-faq.xml           | 1 +
 documentation/kernel-dev/kernel-dev-intro.xml         | 1 +
 documentation/kernel-dev/kernel-dev-maint-appx.xml    | 1 +
 documentation/kernel-dev/kernel-dev-style.css         | 3 +++
 documentation/kernel-dev/kernel-dev.xml               | 1 +
 9 files changed, 12 insertions(+)

diff --git a/documentation/kernel-dev/kernel-dev-advanced.xml b/documentation/kernel-dev/kernel-dev-advanced.xml
index 5c76ed239..37177966b 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.xml
+++ b/documentation/kernel-dev/kernel-dev-advanced.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='kernel-dev-advanced'>
 <title>Working with Advanced Metadata (<filename>yocto-kernel-cache</filename>)</title>
diff --git a/documentation/kernel-dev/kernel-dev-common.xml b/documentation/kernel-dev/kernel-dev-common.xml
index c1c2d6d70..8e8a6dbed 100644
--- a/documentation/kernel-dev/kernel-dev-common.xml
+++ b/documentation/kernel-dev/kernel-dev-common.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='kernel-dev-common'>
 <title>Common Tasks</title>
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.xml b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
index 62c68527d..0f2df2a62 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.xml
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <appendix id='kernel-dev-concepts-appx'>
 <title>Advanced Kernel Concepts</title>
diff --git a/documentation/kernel-dev/kernel-dev-customization.xsl b/documentation/kernel-dev/kernel-dev-customization.xsl
index 325b738e9..88bf7c678 100644
--- a/documentation/kernel-dev/kernel-dev-customization.xsl
+++ b/documentation/kernel-dev/kernel-dev-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/kernel-dev/kernel-dev-faq.xml b/documentation/kernel-dev/kernel-dev-faq.xml
index c3a20465a..d76f0a4e3 100644
--- a/documentation/kernel-dev/kernel-dev-faq.xml
+++ b/documentation/kernel-dev/kernel-dev-faq.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <appendix id='kernel-dev-faq'>
 <title>Kernel Development FAQ</title>
diff --git a/documentation/kernel-dev/kernel-dev-intro.xml b/documentation/kernel-dev/kernel-dev-intro.xml
index 4e4fd282a..7c1ea0e51 100644
--- a/documentation/kernel-dev/kernel-dev-intro.xml
+++ b/documentation/kernel-dev/kernel-dev-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='kernel-dev-intro'>
 <title>Introduction</title>
diff --git a/documentation/kernel-dev/kernel-dev-maint-appx.xml b/documentation/kernel-dev/kernel-dev-maint-appx.xml
index b825ae7ea..3d9c7c66f 100644
--- a/documentation/kernel-dev/kernel-dev-maint-appx.xml
+++ b/documentation/kernel-dev/kernel-dev-maint-appx.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <appendix id='kernel-dev-maint-appx'>
 <title>Kernel Maintenance</title>
diff --git a/documentation/kernel-dev/kernel-dev-style.css b/documentation/kernel-dev/kernel-dev-style.css
index 9c01aa798..fc6fbb8de 100644
--- a/documentation/kernel-dev/kernel-dev-style.css
+++ b/documentation/kernel-dev/kernel-dev-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index 998fe4141..887ff836f 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='kernel-dev' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
-- 
2.17.1

