Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.28188.1589742220649912456
 for <docs@lists.yoctoproject.org>;
 Sun, 17 May 2020 12:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XfZapJ2p;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id q8so2007020pfu.5
        for <docs@lists.yoctoproject.org>; Sun, 17 May 2020 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=jzgsOUbDlW2xSkuQYPtn2IWdIt3LjzZ+Rj0VZ7IUSWk=;
        b=XfZapJ2pFhpLMvzPJ7ldpFNXIjLObDPGZp9H7ygI/ngi1s4dzGl/dTm17+Mw6vfkjb
         b9q7p+slXiPNkhTAXdeDiqLYjulMd1ubKyBvtVp/ynt8jovUPjA90GB9qIQZfZ0/mrgk
         Si+T7qwIuZEWSWivVNBTnCbgosTaFgjO0Cy7WLzq6sYePA0RFydrtQMNDDtBnCz8nneQ
         Dv3wryfpI86kjdtDxM5ToBJUHzqTcGiV9/aXDfxSjSXGrPMjmg+VWEDgEnmj7p2tlnQO
         rHby89Gy/HMQE56V5Jd2SPs8lkVPLzsG4ie0oIgzWlS85KQWqq7zB/TLH8aO8mPfTNDF
         Xrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=jzgsOUbDlW2xSkuQYPtn2IWdIt3LjzZ+Rj0VZ7IUSWk=;
        b=sG75XN+vdD2sToeUEj/ZR2Rql8jKNlj7p7kosMHE1QF6Xy1Alnk3ofJYCRLc90Rh61
         HgGqQe9mWtCKStSM/kcrX7UPof9YbqeO+uo2KfSD3JlU4eQnBQSRjRlWMGjLTTXffzCF
         lmNTbx7aM5H+75X/BhhFxJ7G5TJt/QOjLvoXw6PIsxLxJkyZ7McUrtqYRzmvOTTD2Wz9
         UUTvL+/6/CTWEu+HO+CqS3Vg9UemafbtHAY7/4cf/jL1wkRfzSVYKiSoqmwwaGQmONRe
         GpqBuSkCvX7fhR/RqCUJvbw/HCobeJDnqOmDBFbwMuPgvJJgbt2kf+69tgzfUUh5jNES
         j32Q==
X-Gm-Message-State: AOAM532Ubvd5rJJ9tnVy35fBkEanN//3N+fO2uqpce8f2tNK5gQDWm8c
	uvX1vRPrJYUTfvczFOYfuKahcxU8
X-Google-Smtp-Source: ABdhPJw9B2DzLRWelTwYVuBv215kiSXUNy1Q5rbPh8WZHzbpxXl6QRnVXDSGrn+5sW+lTF1qhXqpGQ==
X-Received: by 2002:a63:5020:: with SMTP id e32mr6025617pgb.176.1589742219634;
        Sun, 17 May 2020 12:03:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f0e2:1a5f:63ed:f38])
        by smtp.gmail.com with ESMTPSA id w11sm6821413pfq.100.2020.05.17.12.03.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 12:03:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [warrior][PATCH] Documenation: Prepared for the 2.7.4 release
Date: Sun, 17 May 2020 12:03:37 -0700
Message-Id: <20200517190337.16080-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/kernel-dev/kernel-dev.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 documentation/poky.ent                        | 14 +++---
 .../profile-manual/profile-manual.xml         |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 9 files changed, 72 insertions(+), 37 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index b6cc611091..a42a295092 100644
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -143,9 +143,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
         </revhistory>
     <copyright>
       <year>&COPYRIGHT_YEAR;</year>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index d6f4ebbd7f..c23fa314a6 100644
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -128,9 +128,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index 3797a3cc43..1e2c44e7ac 100644
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -113,9 +113,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 42b1ee6fe8..a39a53d7e8 100644
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -99,9 +99,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index cf9dff36a1..faeb4c569a 100644
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "2.7.3">
-<!ENTITY DISTRO_COMPRESSED "273">
+<!ENTITY DISTRO "2.7.4">
+<!ENTITY DISTRO_COMPRESSED "274">
 <!ENTITY DISTRO_NAME_NO_CAP "warrior">
 <!ENTITY DISTRO_NAME "Warrior">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "thud">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Thud">
-<!ENTITY YOCTO_DOC_VERSION "2.7.3">
+<!ENTITY YOCTO_DOC_VERSION "2.7.4">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.6.4">
-<!ENTITY DISTRO_REL_TAG "yocto-2.7.3">
+<!ENTITY DISTRO_REL_TAG "yocto-2.7.4">
 <!ENTITY METAINTELVERSION "11.0">
-<!ENTITY REL_MONTH_YEAR "February 2020">
+<!ENTITY REL_MONTH_YEAR "May 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "21.0.3">
-<!ENTITY POKYVERSION_COMPRESSED "2103">
+<!ENTITY POKYVERSION "21.0.4">
+<!ENTITY POKYVERSION_COMPRESSED "2104">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY YOCTO_DL_URL "http://downloads.yoctoproject.org">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index c0c05e29c7..e3d21d7578 100644
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -113,9 +113,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index 06118b58d0..95294d7464 100644
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -78,9 +78,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index a4e626ff7f..336f8539cb 100644
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -88,9 +88,14 @@
             </revision>
             <revision>
                 <revnumber>2.7.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>February 2020;</date>
                 <revremark>Released with the Yocto Project 2.7.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>2.7.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 2.7.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index 1d0cd28a6a..de26a2ab9e 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/2.7.3/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/2.7.4/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.3/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/2.7.4/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

