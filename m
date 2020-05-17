Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.26951.1589738192448465339
 for <docs@lists.yoctoproject.org>;
 Sun, 17 May 2020 10:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9ejsIp0;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id f6so3657142pgm.1
        for <docs@lists.yoctoproject.org>; Sun, 17 May 2020 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=VP957IP0jbyUSBDF4CH7TmBXdM/9ES3QKlqwgKBrF28=;
        b=V9ejsIp0j/t225XzuXXAn+UdlaESzZXI5mV2WdG6kCcdBX98QRR1WJJe0m2K6a+O2S
         mAghFreyNThwZ2Tz7JUbRKWBERH2Lg85Ab1Xfx5SreVxxzQCU9NDrtp6nl/XbG2+yPMG
         wDrbhJBcFcuBLpdM9/Pp3724CztJZbCBlFPtusqYi+m+6nwZoekKwwr4p6/JKS9Jnd2t
         Zkek/lr0VKpVq3vwGm4n/4QvfnzHMz1vKvq1ndJC896NWuGLz89YjCsvIZfG2RfORLTf
         1npc+6UTmz1aRl9ZFtO3suJRGU7Y6jC0sLVmm53GjR/Z+wXuWNEFU9zSdotIiNoMrVGC
         ZpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=VP957IP0jbyUSBDF4CH7TmBXdM/9ES3QKlqwgKBrF28=;
        b=C+pdTgPFNqZMsiMLNDhW7UW4Jm8/aOR/y0j1f1/rPbWhqpNqrdyU7PiSDI06BvT0zM
         7Bh8TJ+kKhWqPBZh6KwgvX+JA6Bh50we9gN+8CFc+72EAHyLIvIhVNHekUkOOpzZiGDO
         60RCGsf3dY3I25u7MJLjoxu6kK+YLm9CF2l80ml6KDYMGJBO38c0RzAMxjnpkPCrM1ub
         SLaQwigZ8vIKpIEUT2LX3Zj3Kc59q9+T1NV4PTU+zG9sg7XOduKFODCWwE58O8GhcYTE
         XMkTpbVvO5fSRHpJxkd4pF2hEHDKoZZ+M07ZCCZ3MzNX5J3lN7wdzMkXFi0o6BR2kz6p
         4XXA==
X-Gm-Message-State: AOAM532DxOMg+w27nIImEo+N3wjvgDyodJr2+7fF6qNxoClU8vogHzQx
	uWnTyasjJvDrENtPwR5wZYepV2lN
X-Google-Smtp-Source: ABdhPJzoHxVhzoO8cT1/9v3LEpPKaJDlW5DZRumPF4reaDB3TED/2EQIYQHVM4dvzbvFIOg+SAeLLA==
X-Received: by 2002:a62:1a53:: with SMTP id a80mr12908101pfa.50.1589738191521;
        Sun, 17 May 2020 10:56:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f0e2:1a5f:63ed:f38])
        by smtp.gmail.com with ESMTPSA id y186sm6505006pfy.66.2020.05.17.10.56.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 10:56:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] Documentation: Prepared for 3.0.3 release
Date: Sun, 17 May 2020 10:56:29 -0700
Message-Id: <20200517175629.15225-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 .../overview-manual/overview-manual.xml       |  7 ++-
 documentation/poky.ent                        | 16 +++----
 documentation/ref-manual/ref-manual.xml       |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 44 +++++++++----------
 9 files changed, 72 insertions(+), 37 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index a1dae35f8c..7b492bc047 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -143,9 +143,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 27399e05f1..f8ac3e480c 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -128,9 +128,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 9ab010d93a..fa1da3fd34 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -99,9 +99,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 6c9056b773..14e8cf808a 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -58,9 +58,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index ba4dbc8691..95230863d6 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.0.2">
-<!ENTITY DISTRO_COMPRESSED "302">
+<!ENTITY DISTRO "3.0.3">
+<!ENTITY DISTRO_COMPRESSED "303">
 <!ENTITY DISTRO_NAME_NO_CAP "zeus">
 <!ENTITY DISTRO_NAME "Zeus">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "warrior">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Warrior">
-<!ENTITY YOCTO_DOC_VERSION "3.0.2">
-<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.7.2">
-<!ENTITY DISTRO_REL_TAG "yocto-3.0.2">
+<!ENTITY YOCTO_DOC_VERSION "3.0.3">
+<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.7.3">
+<!ENTITY DISTRO_REL_TAG "yocto-3.0.3">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "FEBURARY 2020">
+<!ENTITY REL_MONTH_YEAR "MAY 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "22.0.2">
-<!ENTITY POKYVERSION_COMPRESSED "2202">
+<!ENTITY POKYVERSION "22.0.3">
+<!ENTITY POKYVERSION_COMPRESSED "2203">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY YOCTO_DL_URL "http://downloads.yoctoproject.org">
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index f9f5723d65..7ef1f0cc08 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -144,9 +144,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index 161d573bfe..e985491cc1 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -78,9 +78,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index 6d3321cfdc..0e40495f93 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -88,9 +88,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.2</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>FEBURARY 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.3</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index 8e306098ba..854061a962 100755
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -2,35 +2,35 @@
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
 # s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

