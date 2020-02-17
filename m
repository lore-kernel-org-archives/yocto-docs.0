Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.10823.1581954942905499174
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 07:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NaN3QE4W;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id z7so9392722pgk.7
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2020 07:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=gsCgtb3DvGvZihXsJ/+OWACUXlHQenQwJQLoZq+0okU=;
        b=NaN3QE4W5BdkTkUdr3TdIk3kNbql7nxO/M9I9Con6em8xXvBYCqkyZN6X855ccGxYm
         xP8z8BNOAyLAuur2tRIKKib6jTLL0XPUgJkiPUUHWiAN57vPtoJtz5cD4pg7pJiFj5Pm
         Ah3MYgzE7C4OwEUcQDQc8gjHLPDV5b9rGCm0OvG2Z8gdreEaSvuL+29Jb0Nz33M4sEPW
         3i63FEeEixmB0Ou3GD/AISu3W6f/JlQml7Zvuii5cpVzhsAeHmLmkcFe0IyBukbenUq6
         ntWJNUuQ2IWAovOweb3Nr03czT7woyCJ24FnxZ2+1/JQgcbkPAaRxjfACvxv1+t9UlL6
         g8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=gsCgtb3DvGvZihXsJ/+OWACUXlHQenQwJQLoZq+0okU=;
        b=Wf4cayBe91VryzgLpa0M1hNEXW13KEFNbgHYluc0uya22F+psYx0F4nGeOMbxZx/at
         JAZ5QjgNI3FxBNFubvMooepCruta1HPAWquNG6r323HjC4oUkBMDbDhdXkZM8A74JS8i
         +Y8TbscDmnFmaH0HpZs0O4ReiAGO/itn88YyElgnmdSoQ9Y4B4MV1i76L3NVfvmxKspa
         k9RdsWBOrfk2ge1fvY8ZhPI+S8UrWStJFJhUv3+AdYQpySdGsS9l63OPUOpnkQ0stkt1
         qTajULk1zSnqBll0paAysK6HUFhcc15KEf5hy3VE6Shqj9kMdNjuzaiBIBPa4D0d74gy
         yLLA==
X-Gm-Message-State: APjAAAXNmE0US6qnkIsO2xPW6hpHoU/kl2RzKmtY+BHGl6vGCzB6LLi7
	Sbqw0Z8HmRvJV4+hUSRusbWDkr0n
X-Google-Smtp-Source: APXvYqxzrVPraqZokmRVhjOmeCcXi5uT0rNwe3Glsj8R6Nq5I0KTzcWTxxkRcg5vQDxYLGpcGDQC5w==
X-Received: by 2002:a63:2a02:: with SMTP id q2mr17829601pgq.198.1581954941959;
        Mon, 17 Feb 2020 07:55:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
        by smtp.gmail.com with ESMTPSA id w25sm890554pfi.106.2020.02.17.07.55.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:55:41 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [warrior][PATCH] Documenation: Prepared for the 2.7.3 release
Date: Mon, 17 Feb 2020 07:55:40 -0800
Message-Id: <20200217155540.21651-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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
index e060a55b9..b6cc61109 100644
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
index 3033d7a91..d6f4ebbd7 100644
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
index 90c12e978..3797a3cc4 100644
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
index 535e11ca8..42b1ee6fe 100644
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
index 5ab067549..cf9dff36a 100644
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
index 316804118..c0c05e29c 100644
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
index a17d362f4..06118b58d 100644
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
index b3926f3bd..a4e626ff7 100644
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
index c37fc3309..1d0cd28a6 100644
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

