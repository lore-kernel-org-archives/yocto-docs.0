Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.13724.1593280110033033779
 for <docs@lists.yoctoproject.org>;
 Sat, 27 Jun 2020 10:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qtr1rUDt;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id l6so3209608pjq.1
        for <docs@lists.yoctoproject.org>; Sat, 27 Jun 2020 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=98eKXT4oSDUzPpLKreeNw+5iOiAoMcQ99W4tha7IKqs=;
        b=Qtr1rUDt7W7Ynnm/xK71sX29voQSIZnBPjTMFmlKSE+ri9yMbhadojEKmeM5MaNLiH
         S1fKzP2yjagyeQC0JKgrb3i58G3evKP+n4vh81Wz8/oDY0SEG13M4XGVUzVYk/x73oTz
         /25HA3Ki1wkyXZ4XcWsvGPLxopA/SFZpXmToHeOYxO6sCTe0orc5FP2jKytDFAEbfQ87
         q6lFbRaDnBCDeQiYjZBo0TBUeIBXGKq87VyWv8aV9mVjbK2JifA2gT2nzANy7H79gy2P
         qbnXlbPURdDXcru2i50/icHPRqAo7HOhgsgcbzllk+8ybaO9cmKc6SvL7df6OYs1Rpwk
         mgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=98eKXT4oSDUzPpLKreeNw+5iOiAoMcQ99W4tha7IKqs=;
        b=m+v1JcVbyaoiLDfMhIH9o+ERfLUcV1zkU3E/745Gw7mmAlfIkr9Xdt1TI2eRlgD0dF
         ThI21OHUjzPncjBh6nU07Ti70aNq5Um4UD3Sj0JLATf3YCMgtynwUn9oBsN29Jwp8beI
         N1fBvaWsIOSvWYnf5oXdx6A3tesaaBEHWiMmGAFL7STOkyavPBrC15coQYr0IEiMS2kt
         ASBXko94Tro/EXDfx+ur+2pP4L3lK7lmq3EzD4l8a9Nuv9Hvrf+bSjXV4fzLYlpoGhMf
         VoKtNUDZq0Pe4OKLlgbJy4/iN8/PFNTuUimKrQk1TuVbTkd10g/ZktxZI7Ty+zoFAZ4p
         jTyQ==
X-Gm-Message-State: AOAM531BbGORpVQs5SMYE5EDe5H/AEFBd09g2VicEgqIqrhpwregA8F0
	9N6BA4zwJrUupdqQxXFon65uJ8hz
X-Google-Smtp-Source: ABdhPJzFiRGzEevDDg2qa6BFDSa5VG5va92a3JIvhZbNqicAgdft11QUnI//hgrMtu01ACThnPAQgw==
X-Received: by 2002:a17:90a:8c96:: with SMTP id b22mr9987385pjo.88.1593280109170;
        Sat, 27 Jun 2020 10:48:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f4ca:9bde:369a:d30c])
        by smtp.gmail.com with ESMTPSA id r8sm4408632pfg.147.2020.06.27.10.48.28
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 10:48:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/3] mega-manual: Add SPDX license headers
Date: Sat, 27 Jun 2020 10:48:25 -0700
Message-Id: <20200627174826.7030-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200627174826.7030-1-akuster808@gmail.com>
References: <20200627174826.7030-1-akuster808@gmail.com>

[Yocto #13873]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/mega-manual/mega-manual-customization.xsl | 1 +
 documentation/mega-manual/mega-manual.xml               | 2 +-
 documentation/mega-manual/mega-style.css                | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/mega-manual/mega-manual-customization.xsl b/documentation/mega-manual/mega-manual-customization.xsl
index b52b5b2aa..33a6e1632 100644
--- a/documentation/mega-manual/mega-manual-customization.xsl
+++ b/documentation/mega-manual/mega-manual-customization.xsl
@@ -1,4 +1,5 @@
 <?xml version='1.0'?>
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
 
   <xsl:import href="http://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index e730f7259..d9912fa44 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -1,7 +1,7 @@
 <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
 "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
-
+<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
 
 <book id='mega-manual' lang='en'
       xmlns:xi="http://www.w3.org/2003/XInclude"
diff --git a/documentation/mega-manual/mega-style.css b/documentation/mega-manual/mega-style.css
index cd71eb642..7748320fb 100644
--- a/documentation/mega-manual/mega-style.css
+++ b/documentation/mega-manual/mega-style.css
@@ -1,4 +1,6 @@
 /*
+   SPDX-License-Identifier: CC-BY-2.0-UK
+
    Generic XHTML / DocBook XHTML CSS Stylesheet.
 
    Browser wrangling and typographic design by
-- 
2.17.1

