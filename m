Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.19264.1592231058940130547
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 07:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WwL7dw7m;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id s88so7211870pjb.5
        for <docs@lists.yoctoproject.org>; Mon, 15 Jun 2020 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xIxBG47zZDMPsdM3E3wx3/SrmUp+f5BO4D/kgE2ZD9o=;
        b=WwL7dw7mhgAtzrCQANc8IHLVwuza2L+qMB9vXkDz7pq4QGBAQmC+Q5CHNasBt6RL0y
         gutVjXpU+VOnBLf5GL6mgDGqZcAbluspghok/cxJhB81G0Z67r30073Llk5TGZbgFg18
         WdBksmwa2OcP78ILhUw/MNvSAMqz6LlEn7sOsA+cvUVgbnH3zSHo4RmOyziTBDZy7KPL
         2oTSRlkQi/bDpAclninPm5NcKcnjp2XEfu3O9vti1CMyE++3Aeyvt8i5jtahvIODB/9g
         IIiuegmTo+QwT0A0Ph79LlnzvSblHE+Yh441QuMl/oqDT4dPN+XnrFYmPTQxt+10W3VJ
         K+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xIxBG47zZDMPsdM3E3wx3/SrmUp+f5BO4D/kgE2ZD9o=;
        b=mgEdDP4RMgXy7UIshPv72o6ExX3Am8OqU4BxMXSgzEBW5LkNScV2x4L+Zd3dPiIgxL
         xaBCsD5poLFXojoqxPtRwgC3Zu8GYozZmH8lyqTCip1JoWKTYEfRV9S1i1YP8sZyzzWs
         dW+8O7jLm3ubD23aVUoIigykaXZ2SLE0eMvc671pwZ/DASBSA8CqMpgZFudXaFSw5a0F
         cyEN4hk9xueY9DkWKyy3AwDXT+l2cDrh+t2IUjfDENMlzE7kk+R2JWqn8EXFE9B+F0q7
         UuNcS3qBos/EFzSIukdmTrX0eCzpQ+apYGMO3QpcKCOiWTx11p213/B4b9xY2EUkf3Ps
         iMxg==
X-Gm-Message-State: AOAM533L8AhjZ3Y7ccbh1JJzO8yv6Y8U0n/5YLQpTIlh8sFc5Gtxh3gh
	Y0xKyGK4yRU+AQmEJgBQXJkxKVRg
X-Google-Smtp-Source: ABdhPJx8vzGBWH3gcOQNTMlmS3BDawQ7AEgCt43333O15ZkkufA+p0exI1SR6sUJfz3TgbvJa4vVWQ==
X-Received: by 2002:a17:90a:d18b:: with SMTP id fu11mr12288246pjb.102.1592231058119;
        Mon, 15 Jun 2020 07:24:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:e920:50fc:4b6a:daf0])
        by smtp.gmail.com with ESMTPSA id h13sm14177219pfk.25.2020.06.15.07.24.17
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:24:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 6/8] profile-manual: Add SPDX licence headers
Date: Mon, 15 Jun 2020 07:24:10 -0700
Message-Id: <20200615142412.30882-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615142412.30882-1-akuster808@gmail.com>
References: <20200615142412.30882-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/profile-manual/profile-manual-arch.xml          | 1 +
 documentation/profile-manual/profile-manual-customization.xsl | 2 ++
 documentation/profile-manual/profile-manual-examples.xml      | 1 +
 documentation/profile-manual/profile-manual-intro.xml         | 1 +
 documentation/profile-manual/profile-manual-style.css         | 3 +++
 documentation/profile-manual/profile-manual-usage.xml         | 1 +
 documentation/profile-manual/profile-manual.xml               | 1 +
 7 files changed, 10 insertions(+)

diff --git a/documentation/profile-manual/profile-manual-arch.xml b/documentation/profile-manual/profile-manual-arch.xml
index 19d115522..8eb7bbfab 100644
--- a/documentation/profile-manual/profile-manual-arch.xml
+++ b/documentation/profile-manual/profile-manual-arch.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='profile-manual-arch'>
 
diff --git a/documentation/profile-manual/profile-manual-customization.xsl b/documentation/profile-manual/profile-manual-customization.xsl
index caa57ef34..d995e0b3c 100644
--- a/documentation/profile-manual/profile-manual-customization.xsl
+++ b/documentation/profile-manual/profile-manual-customization.xsl
@@ -1,4 +1,6 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
+
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/profile-manual/profile-manual-examples.xml b/documentation/profile-manual/profile-manual-examples.xml
index 9630c6c30..91e06fcd1 100644
--- a/documentation/profile-manual/profile-manual-examples.xml
+++ b/documentation/profile-manual/profile-manual-examples.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='profile-manual-examples'>
 
diff --git a/documentation/profile-manual/profile-manual-intro.xml b/documentation/profile-manual/profile-manual-intro.xml
index f16db3f0f..a2d2f80ec 100644
--- a/documentation/profile-manual/profile-manual-intro.xml
+++ b/documentation/profile-manual/profile-manual-intro.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='profile-manual-intro'>
 
diff --git a/documentation/profile-manual/profile-manual-style.css b/documentation/profile-manual/profile-manual-style.css
index f3cca8536..8502c1109 100644
--- a/documentation/profile-manual/profile-manual-style.css
+++ b/documentation/profile-manual/profile-manual-style.css
@@ -1,4 +1,7 @@
 /*
+
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
diff --git a/documentation/profile-manual/profile-manual-usage.xml b/documentation/profile-manual/profile-manual-usage.xml
index 9a4273a0f..3a7148cbd 100644
--- a/documentation/profile-manual/profile-manual-usage.xml
+++ b/documentation/profile-manual/profile-manual-usage.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <chapter id='profile-manual-usage'>
 
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index fa1fa8ac8..48bfba5b8 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -1,6 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='profile-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
-- 
2.17.1

