Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1C6C63700
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.10371.1649934586381354592
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 04:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YTUfCv7l;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id w4so6382439wrg.12
        for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WcH6Dfp8g3mZWnMSKBEwuN7WbxKEspqBSIi7fkPIJ0=;
        b=YTUfCv7leKpK9Dcg5XDfr0Us2Qig9XtZ7wthGT1yXaIbIId0QyG87MAckUkRcybQNw
         Rp2oyhXw8b+E774dS9LEWgB754KKW8uNezMugmCsCpScraPrw2jALphNVKbznzVu09Q+
         dYugBDJc3qWlA16rOtIqpC53LhQYQxy7K8AdBMQiL0qFfaFrdRejg/HcNovIlc/pUwwh
         QJJxW3lE9HpWg0H6rkgjUHvg9Hoy/M5kfkXn05Ei/Iet9k+5Jj3E0owQ74t7rAtHsQp+
         ACnTpUJ5o2FQ4cmDbydmIxzei0J6JCENHDk3yMfncq7U5JZp5GwN+D5VPjMNcUdICtGr
         XHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WcH6Dfp8g3mZWnMSKBEwuN7WbxKEspqBSIi7fkPIJ0=;
        b=VuZy/Z52NYZPajsrKv6NKUNWpjcwOi8O8NbsCEFX0NDozGPEPI9IVXBc9qnPtGNa7V
         hfle9I4psNxTI7w0Mw9XE7QlMu9WT1WPVQv1ExsOf2IX3vkO9XYgeHCpYZMr99WzrKuF
         XEFPdx+R3PARFwPKB1cbjwCrdrQZh0yYlqdjdJaJ//00dZGZ2A2IhiPq1lncYEBoPSb6
         jZm64DGDycEGppWECIw6WJO5QYbOBgA3GKTqRekX8eH6XtHPemh9TL74Y3NjQa/2bILV
         9dfwl+rGX6PAwn9xPMqGzTTiPn4saxsd/JycsMSUngtqEwwuaGcpXyDSsSgCtxS1+Epy
         aK3g==
X-Gm-Message-State: AOAM531L/F8hANmukYw4xlIOwP6T09uF6b+6JUa1ocO0WVMcowi8a0i8
	EAheKjgS3rEzEE2Odfyv3iqlXbJnuQ5yJg==
X-Google-Smtp-Source: 
 ABdhPJzQQOgV6XsXofiJqtw4B4+pDQeqM+mRdui46c6EVjrvyg5ocXVHJHBJZIdJJoKWWIHzqaHSVg==
X-Received: by 2002:a5d:5846:0:b0:204:1a79:f1ab with SMTP id
 i6-20020a5d5846000000b002041a79f1abmr1676139wrf.520.1649934584635;
        Thu, 14 Apr 2022 04:09:44 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.140])
        by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1744985wmz.43.2022.04.14.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 04:09:44 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] yocto-docs: profile manual,
 added banner at the top for direction to most recent website for version
 3.1.3
Date: Thu, 14 Apr 2022 12:08:48 +0100
Message-Id: <20220414110847.56425-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2766

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 3.1.3/profile-manual/profile-manual-style.css | 28 ++++++++++++++++---
 3.1.3/profile-manual/profile-manual.html      |  6 +++-
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/3.1.3/profile-manual/profile-manual-style.css b/3.1.3/profile-manual/profile-manual-style.css
index f3cca853..8f1e1d41 100644
--- a/3.1.3/profile-manual/profile-manual-style.css
+++ b/3.1.3/profile-manual/profile-manual-style.css
@@ -43,11 +43,31 @@
 body {
   font-family: Verdana, Sans, sans-serif;
 
-  min-width: 640px;
-  width: 80%;
-  margin:  0em auto;
-  padding: 2em 5em 5em 5em;
+  /*min-width: 640px;*/
+  width: 100%;
+  margin:  0;
+  padding: 0;
   color: #333;
+  overflow-x: hidden;
+  }
+ 
+ /*added books too*/
+.book{
+margin:  0 auto;
+min-width: 640px;
+padding: 0 5em 5em 5em;
+}
+/* added the id below to make the banner show and be fixed*/
+#outdated-warning{
+text-align: center;
+background-color: rgb(255, 186, 186); 
+color: rgb(106, 14, 14); 
+padding: 0.5em 50px; 
+width: 100%;
+position: fixed;
+top: 0;
+
+
 }
 
 h1,h2,h3,h4,h5,h6,h7 {
diff --git a/3.1.3/profile-manual/profile-manual.html b/3.1.3/profile-manual/profile-manual.html
index b81f5b21..50cb0ca8 100644
--- a/3.1.3/profile-manual/profile-manual.html
+++ b/3.1.3/profile-manual/profile-manual.html
@@ -1,6 +1,10 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>Yocto Project Profiling and Tracing Manual</title><link rel="stylesheet" type="text/css" href="profile-manual-style.css" /><meta name="generator" content="DocBook XSL Stylesheets V1.76.1" /></head><body><div xml:lang="en" class="book" title="Yocto Project Profiling and Tracing Manual" id="profile-manual" lang="en"><div class="titlepage"><div><div><h1 class="title">
+<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>Yocto Project Profiling and Tracing Manual</title><link rel="stylesheet" type="text/css" href="profile-manual-style.css" /><meta name="generator" content="DocBook XSL Stylesheets V1.76.1" /></head>
+<body>
+    <div id="outdated-warning">Version 3.1.3 of the project is now considered obsolete, please select and use a more recent version</div>
+    <div xml:lang="en" class="book" title="Yocto Project Profiling and Tracing Manual" id="profile-manual" lang="en"><div class="titlepage"><div><div><h1 class="title">
 		  Yocto Project Profiling and Tracing Manual
+
 		</h1></div><div><div class="authorgroup">
             <div class="author"><h3 class="author"></h3><div class="affiliation">
                     <span class="orgname">The Yocto Project<br /></span>
-- 
2.25.1


