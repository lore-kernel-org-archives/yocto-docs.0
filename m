Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.4379.1581386595636964585
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 18:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p9eH8vVc;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 70so2737115pgf.8
        for <docs@lists.yoctoproject.org>; Mon, 10 Feb 2020 18:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bxQI180a8QcuXmqH6X+JZByGFn3psUIi2y9YZtdmtG0=;
        b=p9eH8vVcg/0NoOg/S4QJMeiDCeKkbbOhnU5bo04Wx+XYiaWU9anU7oM98ThwnbHI4w
         Gmj4g3AWRmRH4hBNjO2klLhsbrFWdnYWw1JlBrdrcqV+TrE0WRjDXodZcdIp3Vh2Nv59
         7EUmtCKqzfd+VnRz01mXvkdUQCnbQY0dJV8ltJbnqxa/2lUmLayhhMYRW46rITybXyaw
         iU7SMEViSjoMslwOBkANdhsttQFwGPxd1UoSB8AJd2Jo0rW7MSjGLtz0WkgRE7JW8AoL
         a6zgpgRDimk73x2jCQ6MNUXCGbdNXi0o2VxLy6CSy0Cbscjlwd253kBbNFFosaGiscOB
         c4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bxQI180a8QcuXmqH6X+JZByGFn3psUIi2y9YZtdmtG0=;
        b=fs2L9IT88OD2ZMrseyLu+sS+bvNd+qyTzS1vayFqOQkRIUiCWA3gfE//0OGnMGEJhI
         nUgIHVYlWYrfTfsDl3JOa31dVw7Ws5ZpKUAIrqvtYDWq1Z11S9tBdcMT1n78Gu0F9x0E
         tMigihQZnDr/M6Y4RdsmyA6gE4k7MCGEgAgb/3zjI3eZ6QYmJQiXeksh0DjbC0xlK/Qp
         Bln3Bniddl9TG6YKYwCDHJ8NFRMUyRQqGWNj/61Q//Sfm3WD/daF/IdEcfjIb/VHNDzr
         JYydo78oIrlWL8yJK8Jl1MrFwqLZv/+iDQysUXON8s5f6qaOI+48hX58CIW/uW+n6b/4
         Fidw==
X-Gm-Message-State: APjAAAWebm0XSSgjAcY2QoQIniSrLYgf03daCygGhxJoevSUKSIsbsK7
	r4U9i/fgYkXqueEPYU0oJpRFJR/Q
X-Google-Smtp-Source: APXvYqxNEKFiUFr9ujTJzp7nuuYkQ5bckF8tq4mNQWI/2fpG7mRXVFUMJRet8JtaEzHyogHTCygDLQ==
X-Received: by 2002:a63:7457:: with SMTP id e23mr4626871pgn.386.1581386594637;
        Mon, 10 Feb 2020 18:03:14 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
        by smtp.gmail.com with ESMTPSA id l26sm1381804pgn.46.2020.02.10.18.03.13
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 18:03:14 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [zeus 1/1] Documentation: Prepared for 3.0.2 release
Date: Mon, 10 Feb 2020 18:03:10 -0800
Message-Id: <468637f4b42cce3daba871322690e2d89895b027.1581386454.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581386454.git.akuster808@gmail.com>
References: <cover.1581386454.git.akuster808@gmail.com>

Add release date for 3.0.2.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
 documentation/tools/mega-manual.sed           | 44 +++++++++----------
 11 files changed, 83 insertions(+), 38 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index ab33cb1ed30..a1dae35f8cd 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -138,9 +138,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019;</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index acfa4c10ab7..27399e05f19 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -123,9 +123,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019;</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index c6fa5f6f8e9..94abe06c5a2 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -108,9 +108,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019;</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index b9e2de17c63..9ab010d93ab 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -94,9 +94,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index ab62d132000..6c9056b7730 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -53,9 +53,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index e7b1a9b13e0..ba4dbc8691a 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.0.1">
-<!ENTITY DISTRO_COMPRESSED "301">
+<!ENTITY DISTRO "3.0.2">
+<!ENTITY DISTRO_COMPRESSED "302">
 <!ENTITY DISTRO_NAME_NO_CAP "zeus">
 <!ENTITY DISTRO_NAME "Zeus">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "warrior">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Warrior">
-<!ENTITY YOCTO_DOC_VERSION "3.0.1">
+<!ENTITY YOCTO_DOC_VERSION "3.0.2">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.7.2">
-<!ENTITY DISTRO_REL_TAG "yocto-3.0.1">
+<!ENTITY DISTRO_REL_TAG "yocto-3.0.2">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "December 2019">
+<!ENTITY REL_MONTH_YEAR "FEBURARY 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "22.0.1">
-<!ENTITY POKYVERSION_COMPRESSED "2201">
+<!ENTITY POKYVERSION "22.0.2">
+<!ENTITY POKYVERSION_COMPRESSED "2202">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY YOCTO_DL_URL "http://downloads.yoctoproject.org">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index e061a11817c..4e10978cadf 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -108,9 +108,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 58a34b8760c..f9f5723d65a 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -139,9 +139,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index aa88fe9806c..161d573bfe8 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -73,9 +73,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index 6d68a194a0d..6d3321cfdcf 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -83,9 +83,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>December 2019</date>
                 <revremark>Released with the Yocto Project 3.0.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.2 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index ce205f3d613..8e306098ba7 100755
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -2,35 +2,35 @@
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
 # s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.2/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.1/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.2/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

