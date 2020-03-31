Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.12092.1585669638179963697
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 08:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbJv8ODf;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id a24so3669535pfc.8
        for <docs@lists.yoctoproject.org>; Tue, 31 Mar 2020 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=j0idjpT/mw/0SX/oJbcsRcaAoK//YsxEdG2ge5STcNw=;
        b=sbJv8ODfqUOEK+Ww+CfMd6o/xnymtVCpFa26tNBYJJzorfkSt91wppiGYAbxFffT9V
         EyWXAfSQB/AEvup1zjTiv3EEXMrdhv9ealLN9FjYhSiU3TnkXfjAh8lFui/5eP5S+n0y
         dfOrqPoQ24mIazo8tcMU92f28IA8QykrqvH2LrlA/5A8skV3H05+V0Z62rBQg6hJGZnO
         /Uu2ChOT5Ajb/a/mB1On5e1EUesTLZVLgApfA/Frwl0b5f0ixl2i68eTgAPovRTAWRFA
         wJbCI9ZZZ8v0isjrzRb6G6hGtnWPsxKFN99hIqCCFaP2MwP4Cbngbjfzh/0hbLM9pQop
         tANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=j0idjpT/mw/0SX/oJbcsRcaAoK//YsxEdG2ge5STcNw=;
        b=YHj7wDRuxMmrW0/qLzPqNSAd4oapxJw78B/rUfhYMoVdu7QFBWbCkjPOczay14Cyxs
         VjIJcarz1TZDTxfIuamYRjVhofMmyUycX3guV584rng/Z/TbD+Q3Ing24jbFUgtLuA1P
         5AObAzUljKhWfendKpO1bOOf/ASpb0uSboYF37edE5+s7qNXQjvdi9Tqe19ZZqS2CcTy
         ISwQsEgrJAU/56nY6KiSVHRvTLwb8xeZjtib83V8LkmYj03XJw3Qh8nbLdvzn7MUiXIC
         x7af6dhlKWHPIzRKUzOvaRlU9l4aLkK0gw4fkMyuxtjN4rJDbLxPcfpHPcEtn/loQlJu
         gMSA==
X-Gm-Message-State: ANhLgQ04mh5ZzCwJB8U85DiMfvkl3rr/n9XIpt8ZA/wvEPm6uOW0/5dH
	If2T0a308FDyYgY9hQ6xo+U9zd8tNJY=
X-Google-Smtp-Source: ADFU+vtgwJ9SmnUXlcNna3jh34DFuLil/k9rLrJLXpATT1myMjsBEs3ZpK38HdOVbWRJwUQZbs3jZw==
X-Received: by 2002:a63:ef07:: with SMTP id u7mr17774979pgh.77.1585669637234;
        Tue, 31 Mar 2020 08:47:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:a8c0:f557:a490:54cc])
        by smtp.gmail.com with ESMTPSA id h198sm12737075pfe.76.2020.03.31.08.47.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 08:47:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] yocto docs: change author info
Date: Tue, 31 Mar 2020 08:47:15 -0700
Message-Id: <20200331154715.15744-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide.xml             | 4 ++--
 documentation/dev-manual/dev-manual.xml           | 5 ++---
 documentation/kernel-dev/kernel-dev.xml           | 5 ++---
 documentation/mega-manual/mega-manual.xml         | 5 ++---
 documentation/overview-manual/overview-manual.xml | 5 ++---
 documentation/poky.ent                            | 2 +-
 documentation/profile-manual/profile-manual.xml   | 5 ++---
 documentation/ref-manual/ref-manual.xml           | 5 ++---
 documentation/sdk-manual/sdk-manual.xml           | 5 ++---
 documentation/toaster-manual/toaster-manual.xml   | 5 ++---
 10 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index ea4899b70..d2294a45c 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -24,9 +24,9 @@
             <author>
                 <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 2ef7087cd..05b91d1d6 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index e0aed297d..7d06d5905 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 13ada7c03..b07cfc02d 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -33,11 +33,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index dfdc165a6..fc7514342 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/poky.ent b/documentation/poky.ent
index eb5de9514..0b25d4964 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -5,7 +5,7 @@
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
 <!ENTITY YOCTO_DOC_VERSION "3.1">
-<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.7.2">
+<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
 <!ENTITY DISTRO_REL_TAG "yocto-3.1">
 <!ENTITY METAINTELVERSION "12.0">
 <!ENTITY REL_MONTH_YEAR "April 2020">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 14c508ea1..bffd9cc25 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 48358aae5..3d7e4b4cd 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
 
         </authorgroup>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index b00547c1a..79f907901 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index d38137c8a..a5c5401f5 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Kristi</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>Yocto Project</orgname>
                 </affiliation>
-                <email>kristi@buzzcollectivemarketing.com</email>
+                <email>docs@lists.yoctoproject.org</email>
             </author>
         </authorgroup>
 
-- 
2.17.1

