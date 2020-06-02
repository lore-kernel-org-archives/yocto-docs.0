Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.206.1591057738367196945
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EkfOudV2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id h185so3217976pfg.2
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7g8ikYx/+OkMnP7ijMqyMvXyipP+TYve8P9TXJOb76w=;
        b=EkfOudV2oSeGT4Yq5b0gHCSjHy3Umxj3qe/DZEPpk52i9m/HYZ/euz3tITlCQEjG6k
         Kb46C1Gsf6BVMZMMZSWpX3pCZ1+HFah2eXHqJhHdb43Zb8QYKWY2ju2cvWJ0u4hY23P2
         qi7k+Vk0MMxcQMqL5nr21Pu8dKpFtuLjiIA91NZ3WhK2npZofUNuEZd11ngcvRp9xB7I
         qHgyyJQT4sQ1TBHtNwj5vVQIO/OWY3PoOctIJPiC0azGs/g7Yg9lT0DTJEBW/OuuLZUQ
         Mm18c7Jw4cbRoYoulnGJZLV3tV+qGDd/Si5DOSoVUv6eoe7cZVhVmeQukjnQhRW1hGjZ
         g4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7g8ikYx/+OkMnP7ijMqyMvXyipP+TYve8P9TXJOb76w=;
        b=Wg986j0aiJN33Ue+GcVI+SL/xiM4pLc/HsZhbFuIhFuyqIlLpFUWFEoeBE0ISpJgym
         FPC8Cxkhwl/IlMW/Eo+G4UG3nxeEt7GPdDTmiHSPmQ3GZCNecyQpxqtC3tAwVQVEFDgp
         06gvHhZy0r0bbTAIlIpvqMfpRNniSIOeG7ytUfhqN7v7v0fAZeBzOZbU+Gr7msFtuCpa
         7apI1Hk4Adcz6rJgWEpCpmEx+pJBKMexHCu+VNLFPlqeXnD1e7InO3UO7Hzo2IyH4Zcl
         o7vnoE3XHJ/J+ISzGjZ/AAyRYtyId3zoIKPxi7l5cGiS3xLn9z7rUWA8+7qlBzp0kMPC
         ghqA==
X-Gm-Message-State: AOAM531ynlACqTjBAMbiNky5QK6Rhs8p9Cu1MRc9aK3p1IPgRhzG6L5o
	H8eYKrZQ50EXlAT4XTRxQhdRWtTkUt0=
X-Google-Smtp-Source: ABdhPJx2o+Zk5/Ev9dKSwe4dKT9hiryRyH7ba9E0iMBO1ovq/0epweqEijKSGVgG200cpMxPsBjCFQ==
X-Received: by 2002:a05:6a00:80a:: with SMTP id m10mr22904117pfk.174.1591057737307;
        Mon, 01 Jun 2020 17:28:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p190sm474461pfb.107.2020.06.01.17.28.56
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:28:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 6/6] Documenation: Prepared for the 3.1.1 release
Date: Mon,  1 Jun 2020 14:28:24 -1000
Message-Id: <069c27574bf7333cdf58d9920734bb33c81ecc93.1591057623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591057623.git.steve@sakoman.com>
References: <cover.1591057623.git.steve@sakoman.com>

---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 documentation/poky.ent                        | 14 +++---
 .../profile-manual/profile-manual.xml         |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 7 files changed, 60 insertions(+), 35 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index a189606ce..6ab89d653 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -127,9 +127,14 @@
             </revision>
             <revision>
                 <revnumber>3.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>April 2020</date>
                 <revremark>Released with the Yocto Project 3.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.1</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 6f86454ed..5c6b3457f 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -117,9 +117,14 @@
             </revision>
             <revision>
                 <revnumber>3.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>April 2020</date>
                 <revremark>Released with the Yocto Project 3.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.1</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index e730f7259..a20843fc1 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -93,9 +93,14 @@
             </revision>
             <revision>
                 <revnumber>3.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>April 2020</date>
                 <revremark>Released with the Yocto Project 3.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.1</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index a54793911..0a0deab8f 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.1">
-<!ENTITY DISTRO_COMPRESSED "31">
+<!ENTITY DISTRO "3.1.1">
+<!ENTITY DISTRO_COMPRESSED "311">
 <!ENTITY DISTRO_NAME_NO_CAP "dunfell">
 <!ENTITY DISTRO_NAME "Dunfell">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
-<!ENTITY YOCTO_DOC_VERSION "3.1">
+<!ENTITY YOCTO_DOC_VERSION "3.1.1">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
-<!ENTITY DISTRO_REL_TAG "yocto-3.1">
+<!ENTITY DISTRO_REL_TAG "yocto-3.1.1">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "April 2020">
+<!ENTITY REL_MONTH_YEAR "June 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "23.0.0">
-<!ENTITY POKYVERSION_COMPRESSED "2300">
+<!ENTITY POKYVERSION "23.0.1">
+<!ENTITY POKYVERSION_COMPRESSED "2301">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY ORGNAME "The Yocto Project">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index fa1fa8ac8..710fb770e 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -102,9 +102,14 @@
             </revision>
             <revision>
                 <revnumber>3.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>April 2020</date>
                 <revremark>Released with the Yocto Project 3.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.1</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index e6d424523..53d666446 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -82,9 +82,14 @@
             </revision>
             <revision>
                 <revnumber>3.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>April 2020</date>
                 <revremark>Released with the Yocto Project 3.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.1</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index b1ea9edb7..d52f1ebdb 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

