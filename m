Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DE8C4321E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.12506.1649947725944710255
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 07:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KIbFC4U0;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id c7so7304069wrd.0
        for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZoddfwxwUz+422hGs6/p+hazMRxrRlsN9lPH9y1Se1w=;
        b=KIbFC4U0RfhRSYsLi94007CySJzuXaC7/ZsiqWO2mxtf1GXW4ylXIeSCsFFd+0l9Fk
         B79QSqduMokOWyR73825BfokO4yx1iCNDvhk1b0JsT4naW6T5dAUxEw+iT72PMDfMPWn
         vMGpTR8zB9fevvhteNlZI0IZeZ6Inyd2qZQSs+ARMeVGSF6jqT/VJqiLoxLz0xrBBSC0
         yfyTTcYRm/afv0Cf5ZKbeTS/A/mD7XseUasWd9LUM58S4Jml9LNupDh33sGzbNbR/54L
         DvwPb/U+yM9fAmeX6Y2zpMh4Qo8Huqq7D68jc/UOhFLThg/VfwToWyw8FjgMz73XzL34
         ElXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZoddfwxwUz+422hGs6/p+hazMRxrRlsN9lPH9y1Se1w=;
        b=u+R0aE2AL/C3cX3mkwA5aS+PgZIpL1B06qY3BG/G8kAjFEKKddBw7ixaU+RPfFdBWv
         KrmZS9ZjcNajLCLjz4qNkg9HsXSQNgmuzAT3axrinbwMhlqzx4LESqmDc+FDJnqcoET1
         OvN94dFugrzY3sZR2qkMsY273U3ssPB5wOrBXf6LrvSUVVHwoy5NQD0o71PN/fEPwKwQ
         O9Q0QeauENYqeIoyuCxYeySYRFqV9lGPesnAUXLSaDvZL8WQ27IppwAGJhjkuXfzEKpS
         Pe7NCBaBDM/kpfOrHho3Z1O3FKPoS5soaIH9Pgmf0e1OdEDyNZGCH1ankAyFgDIyX+OC
         bnDA==
X-Gm-Message-State: AOAM533tcMlXmL5+zPDBg/5VCfMV8ahACUYnYBa4Ih+M/PVLByC6Eohb
	8pkIGqbw9aLBCKHxvAQHuLW1ivWM/9J/FA==
X-Google-Smtp-Source: 
 ABdhPJyCcdJR8X13//BkzMlrqfvYClAnvDobQ3RIynW1HwP1C5RpX7X3T6mx3Q0397CW8RarEy4LHQ==
X-Received: by 2002:adf:e18f:0:b0:204:444:dd0d with SMTP id
 az15-20020adfe18f000000b002040444dd0dmr2411076wrb.678.1649947724163;
        Thu, 14 Apr 2022 07:48:44 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.140])
        by smtp.gmail.com with ESMTPSA id
 k63-20020a1ca142000000b0038ff2c38e85sm2251871wme.39.2022.04.14.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 07:48:43 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH v2] yocto-docs: profile manual,
 added banner at the top for direction to most recent website for version
 3.1.3
Date: Thu, 14 Apr 2022 15:47:18 +0100
Message-Id: <20220414144718.63967-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2772

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 3.1.3/profile-manual/profile-manual-style.css | 28 ++++++++++++++++---
 3.1.3/profile-manual/profile-manual.html      |  8 +++++-
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/3.1.3/profile-manual/profile-manual-style.css b/3.1.3/profile-manual/profile-manual-style.css
index f3cca853..b9805545 100644
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
+padding: 0.5em 0; 
+width: 100%;
+position: fixed;
+top: 0;
+
+
 }
 
 h1,h2,h3,h4,h5,h6,h7 {
diff --git a/3.1.3/profile-manual/profile-manual.html b/3.1.3/profile-manual/profile-manual.html
index b81f5b21..9fa44c12 100644
--- a/3.1.3/profile-manual/profile-manual.html
+++ b/3.1.3/profile-manual/profile-manual.html
@@ -1,5 +1,11 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><title>Yocto Project Profiling and Tracing Manual</title><link rel="stylesheet" type="text/css" href="profile-manual-style.css" /><meta name="generator" content="DocBook XSL Stylesheets V1.76.1" /></head><body><div xml:lang="en" class="book" title="Yocto Project Profiling and Tracing Manual" id="profile-manual" lang="en"><div class="titlepage"><div><div><h1 class="title">
+<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
+    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
+    <title>Yocto Project Profiling and Tracing Manual</title>
+    <link rel="stylesheet" type="text/css" href="profile-manual-style.css" />
+    <meta name="generator" content="DocBook XSL Stylesheets V1.76.1" /></head>
+    <body>  <div id="outdated-warning">This document is for outdated version 3.1.3, you should select the <a href="https://docs.yoctoproject.org/">latest release version</a> in this series.</div>
+    <div xml:lang="en" class="book" title="Yocto Project Profiling and Tracing Manual" id="profile-manual" lang="en"><div class="titlepage"><div><div><h1 class="title">
 		  Yocto Project Profiling and Tracing Manual
 		</h1></div><div><div class="authorgroup">
             <div class="author"><h3 class="author"></h3><div class="affiliation">
-- 
2.25.1


