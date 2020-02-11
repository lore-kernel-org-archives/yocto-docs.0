Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.4786.1581388804124138239
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 18:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LnlIXUQQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id d6so4899862pgn.5
        for <docs@lists.yoctoproject.org>; Mon, 10 Feb 2020 18:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AH51rxBgZqijFVIx2bStsyGpqvtfX9ONYs28OiC0A0U=;
        b=LnlIXUQQtoxG6CzPMcg49KY3uwTEwwcFMM7EYE1tt/K8AdKK3sdG6CnqdV5hR7CWFh
         v7/nS+j87wFaTnYra+WKQFTC4KTQysEbzurZubOj7aKRYp0AzuxR1FQwS5UtN6xjZkzi
         c0L8CetPO6BZ0260fWky9gR1h2df6EC0PAnG7XZv+3zDUt3E2xMLo0RDKviVp8jfQ0hV
         Nlk6WjpX6mLTex2pv6YGyMfGWJQJDO5uH2kc1T+dSLHpFHCCTRqOog9yAi01cR6FX/f5
         /oBtLtmru+mjRI8t60kCszobYIY0hBoloX8X26Xh1r/OX5AK0jkbDLJ6PeNqZyPDR+QL
         rijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AH51rxBgZqijFVIx2bStsyGpqvtfX9ONYs28OiC0A0U=;
        b=gkYlmvz0GTpsY/IGzqzCI15KlP3UvFjoYNMDu4iw4TbzJ38blIjD357oxLwt7o+TPH
         Urhn+MCdq6nLE41UVaZvuXg25iqLA04LiGh7j0AgGpBDQAhfVA12shLoD2CKXnA9H+tS
         Cjh7JkgQeVfbtq8xsWjRSgy5pWDXwflK59uW2x0ZMHGvHcFgkaEw0MC+jow2tPPbuBY1
         FtcdzaTaKXSnV4xcDPGtnphpJTBjlBoC/ozv42D3eeeVC29hfk19/mKdvRLCNU/eGSYm
         CRXLsF6WWUVWVbkiBo5OLH7GevAp6jCaKForhwt4/FasunP+ebeWbzkjqht2zZ2tiyE0
         RBIQ==
X-Gm-Message-State: APjAAAWIlkLhLX73lqdVNW0MsoBNgmmZ1SnOmbVBlV+5f7JubJkGd2Bf
	vrdeK8+Wjdj0ntEVOsGfWmCZzvC5
X-Google-Smtp-Source: APXvYqzNlkgL2BYFc5nJEK+/tyBl6o9fTyXyLQQdSqS/l++ZVTcPf1avhwOQkRzDUaMIR3ErKMrFBw==
X-Received: by 2002:a63:7156:: with SMTP id b22mr4039524pgn.16.1581388803104;
        Mon, 10 Feb 2020 18:40:03 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
        by smtp.gmail.com with ESMTPSA id v184sm1798884pfc.67.2020.02.10.18.40.02
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 18:40:02 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [warrior 1/1] Documenation: Prepared for the 2.7.3 release
Date: Mon, 10 Feb 2020 18:39:58 -0800
Message-Id: <21d635685f1654fd336e418294db83aa2c918681.1581388725.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581388725.git.akuster808@gmail.com>
References: <cover.1581388725.git.akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide.xml         |  8 +++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/kernel-dev/kernel-dev.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 documentation/poky.ent                        | 18 ++++----
 .../profile-manual/profile-manual.xml         |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 9 files changed, 74 insertions(+), 40 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index e060a55b9e9..b6cc6110913 100644
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -138,11 +138,15 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
         </revhistory>
-
     <copyright>
       <year>&COPYRIGHT_YEAR;</year>
       <holder>Linux Foundation</holder>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 3033d7a9162..d6f4ebbd7ff 100644
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -123,9 +123,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index 90c12e978f4..3797a3cc43b 100644
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -108,9 +108,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 535e11ca8a3..42b1ee6fe83 100644
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -94,9 +94,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index 5ab0675495d..cf9dff36a14 100644
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,19 +1,19 @@
-<!ENTITY DISTRO "2.7.2">
-<!ENTITY DISTRO_COMPRESSED "272">
+<!ENTITY DISTRO "2.7.3">
+<!ENTITY DISTRO_COMPRESSED "273">
 <!ENTITY DISTRO_NAME_NO_CAP "warrior">
 <!ENTITY DISTRO_NAME "Warrior">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "thud">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Thud">
-<!ENTITY YOCTO_DOC_VERSION "2.7.2">
-<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.6">
-<!ENTITY DISTRO_REL_TAG "yocto-2.7.2">
+<!ENTITY YOCTO_DOC_VERSION "2.7.3">
+<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.6.4">
+<!ENTITY DISTRO_REL_TAG "yocto-2.7.3">
 <!ENTITY METAINTELVERSION "11.0">
-<!ENTITY REL_MONTH_YEAR "November 2019">
+<!ENTITY REL_MONTH_YEAR "February 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "21.0.0">
-<!ENTITY POKYVERSION_COMPRESSED "2100">
+<!ENTITY POKYVERSION "21.0.3">
+<!ENTITY POKYVERSION_COMPRESSED "2103">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
-<!ENTITY COPYRIGHT_YEAR "2010-2019">
+<!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY YOCTO_DL_URL "http://downloads.yoctoproject.org">
 <!ENTITY YOCTO_HOME_URL "http://www.yoctoproject.org">
 <!ENTITY YOCTO_LISTS_URL "http://lists.yoctoproject.org">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 31680411893..c0c05e29c77 100644
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -108,9 +108,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index a17d362f410..06118b58d0a 100644
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -73,9 +73,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index b3926f3bd44..a4e626ff7f9 100644
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -83,9 +83,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>November 2019</date>
                 <revremark>Released with the Yocto Project 2.7.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index c37fc33096e..1d0cd28a6a6 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.2/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.2/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

