Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.14302.1600179078959431354
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 07:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lnnOPySV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id o16so1837029pjr.2
        for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2020 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ANEzij/Chh5L3TMkQxkDKzxRum1Eo4iQas8qa2Tk60E=;
        b=lnnOPySVUHEqFjBYb8Dp317Jc5YwzZfLPyTmtx4tgZw+9lHYH4lQlFvCjohe4IHJ/h
         BbwnxCtR/tbPxDtASmYnGXJUQeeLmJ6U197pQkOb6rGwbVffsqdnheLQprNptfQPoa5G
         A7AGcaGvb/3cKWE17B8WzMMXq2TK49W1EPc2fIygHQlGUjoxd4CyRD5leKMpog52b57f
         6/T5d8vtu1ojrSwkNaEnNVR1G1tJclAPEBmtxm+bL8h/kg8wHTsmgeQnHHekIsI2u6sh
         0enJ8aCXAIAHMjWJtVYuBjziqeg3vjFKKe+wJm9F7RtKUAfRXtDJy9ayjo9uOutHHXU0
         Bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ANEzij/Chh5L3TMkQxkDKzxRum1Eo4iQas8qa2Tk60E=;
        b=LuNr64YoMLWX/qnoZhAMOaigUqf8Evw6cYsWypvIewH3Lh1qkz153BS999c0u65mbe
         Sf/G+zpMYLuw1BVggibVngWFaim5Ky2+tULmOR0NYv1AKMOMnFNenZVTxf63rOg04jyq
         Vut6KjwtCWpPtsbOu37nbnbWHH1s3iUHyItQx07Lvtcva7hMufNHfLILXbLLs6nJGmXz
         JOYq3YFbmQDEn+Xg2Uix36N/HiXKf6ipmA9f+DhQZpV783aFKOtgFSrqbT5JbI95N3gF
         /JL0+3hEz+xL3RvseeNVR4FF+W/fS8hvkFk96pE1ZfBgEHj2uXAI5uhuLnD/hJQewKTr
         EZGQ==
X-Gm-Message-State: AOAM531HGtilZ42U5naqC/tU5r4dwVXAv5eGGNCyCfX9B5ZVnNffFiw0
	ZyMFIri0chxbAnOXnRqlqzlSrAiXtSQBM480400=
X-Google-Smtp-Source: ABdhPJw2W/LugrfQ9yO58epdPC1flKM1814bau5xo80DTZGPw7Z6bIY3/ZYDpDqTDqwLmz1IO7IdcQ==
X-Received: by 2002:a17:90a:fb52:: with SMTP id iq18mr4372976pjb.162.1600179077623;
        Tue, 15 Sep 2020 07:11:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i126sm9952920pfc.48.2020.09.15.07.11.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 07:11:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] Documenation: Prepared for the 3.1.3 release
Date: Tue, 15 Sep 2020 04:11:08 -1000
Message-Id: <95a22279635a8961b2017b7f7ec403c0a897b3a0.1600178934.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600178934.git.steve@sakoman.com>
References: <cover.1600178934.git.steve@sakoman.com>

---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/kernel-dev/kernel-dev.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 .../overview-manual/overview-manual.xml       |  7 ++-
 documentation/poky.ent                        | 14 +++---
 .../profile-manual/profile-manual.xml         |  7 ++-
 documentation/ref-manual/ref-manual.xml       |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 11 files changed, 84 insertions(+), 39 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index 76f40f81d..8b3c4b5d5 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -137,9 +137,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 381c7e3c3..a772550b4 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -127,9 +127,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index be613fe40..db47fd1b3 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -112,9 +112,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 69111a9ca..0c2b35608 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -103,9 +103,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 771eca07f..1147503c0 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -62,9 +62,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index 1d0aef5f3..c44fbd7e1 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.1.2">
-<!ENTITY DISTRO_COMPRESSED "312">
+<!ENTITY DISTRO "3.1.3">
+<!ENTITY DISTRO_COMPRESSED "313">
 <!ENTITY DISTRO_NAME_NO_CAP "dunfell">
 <!ENTITY DISTRO_NAME "Dunfell">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
-<!ENTITY YOCTO_DOC_VERSION "3.1.2">
+<!ENTITY YOCTO_DOC_VERSION "3.1.3">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
-<!ENTITY DISTRO_REL_TAG "yocto-3.1.2">
+<!ENTITY DISTRO_REL_TAG "yocto-3.1.3">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "July 2020">
+<!ENTITY REL_MONTH_YEAR "September 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "23.0.2">
-<!ENTITY POKYVERSION_COMPRESSED "2302">
+<!ENTITY POKYVERSION "23.0.3">
+<!ENTITY POKYVERSION_COMPRESSED "2303">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY ORGNAME "The Yocto Project">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 3527850df..9ae4696d0 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -112,9 +112,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index d7b82bb5c..4f6fe6e6c 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -138,9 +138,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index a557549ed..c66f5f3d7 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -82,9 +82,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index fbc051200..bc25d5ca9 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -92,9 +92,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>August 2020</date>
                 <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index 933f23ea8..c1209c4c1 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

