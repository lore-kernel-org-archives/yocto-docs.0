Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.6080.1605281995600124862
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 07:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mA4kq8M4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r186so7389802pgr.0
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 07:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mGS647nOepRcy6NVf1n68Lgbw+vsy+eWnyeEHbM0syY=;
        b=mA4kq8M4la86bizYFAr6EW9Fp6hsQeJvorrmRXzDczsiKICqb8Rp3ewtJxJ7MGaVlQ
         4bXqefxHU+BI5a+nG42rVol8xDtBqOp+JWIlpbvte6VOqY3xhCk0H8sbW7qHp3JJiPp3
         EmCdPSmqXMY+30gTqwfR3qWVrFJ9Ve4fXaBiqBWm3Shc7WkbXsrbOn19xvUXiw7R7FU3
         h0gREigP6VUsQGREXIcSfpmZlzG8Tam1r/VIChGrI6zdsJgHkRXPzTH7og1DW8pmJ9pc
         BHYZeq1cSU6IypJfBKVlte5wRIlUqcM4DBo0ix75l3UHSuL94FztxkSNmjta0naOTyNm
         K85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mGS647nOepRcy6NVf1n68Lgbw+vsy+eWnyeEHbM0syY=;
        b=XeWqrLGToXKKc3/nrQeKBmVD7HddxS7Tm8K//TR0GyeQFRDLkzy2pRAoe2rEXZcPAS
         hHbtDLDf68JO0GzbM9/8Ko3bU30N2sAgg0vHtDXbP/Ruwr46K19NmhDELqSoHkkLgxrX
         X5GsgnGyy/Lsb0OzsROUDFZ5U8lOGEANRcXLlBARdoE0mLZHLN8hVd4MG9PNPpSTg31s
         UJ7+D06Gw3vVEJpxVUlGklPNFdsBeExGCwYmveU+Rs46SY7BTuyC3jufSx1gzM/cpwW2
         9s35YOeoIPCsdk2J0PPimVxPsiUgx5JcLCZ6P09aOdmuGi7MlTGo+QN94m5tSAa0iaiR
         yGDQ==
X-Gm-Message-State: AOAM530MTlL8/B5Objlxb8Y6AFTrZXN5keR4elvmPe5wrTDukQoCAWnf
	j73PkOUOJ+DzssENosU9TuyYKMXimEKtSTve
X-Google-Smtp-Source: ABdhPJw3WNajqn4sWuQfg2CTjrQU+FXy0I6XrbU9SfJHIYsvlEA3Pns8PcrPk3uGdpYpBPgx0oPzIg==
X-Received: by 2002:a17:90a:470f:: with SMTP id h15mr3457339pjg.185.1605281989286;
        Fri, 13 Nov 2020 07:39:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c15sm12117037pjc.43.2020.11.13.07.39.47
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 07:39:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] Documenation: Prepared for the 3.1.4 release
Date: Fri, 13 Nov 2020 05:39:35 -1000
Message-Id: <d114374e79be7d97031420067f727c038d8bb0ea.1605281904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605281904.git.steve@sakoman.com>
References: <cover.1605281904.git.steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 8b3c4b5d5..eec048e02 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -142,9 +142,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index a772550b4..26d37da35 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -132,9 +132,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index db47fd1b3..76256c9c3 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -117,9 +117,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 0c2b35608..cea146489 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -108,9 +108,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 1147503c0..7c75e5086 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -67,9 +67,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index c44fbd7e1..7c00d3a41 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.1.3">
-<!ENTITY DISTRO_COMPRESSED "313">
+<!ENTITY DISTRO "3.1.4">
+<!ENTITY DISTRO_COMPRESSED "314">
 <!ENTITY DISTRO_NAME_NO_CAP "dunfell">
 <!ENTITY DISTRO_NAME "Dunfell">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
-<!ENTITY YOCTO_DOC_VERSION "3.1.3">
+<!ENTITY YOCTO_DOC_VERSION "3.1.4">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
-<!ENTITY DISTRO_REL_TAG "yocto-3.1.3">
+<!ENTITY DISTRO_REL_TAG "yocto-3.1.4">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "September 2020">
+<!ENTITY REL_MONTH_YEAR "November 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "23.0.3">
-<!ENTITY POKYVERSION_COMPRESSED "2303">
+<!ENTITY POKYVERSION "23.0.4">
+<!ENTITY POKYVERSION_COMPRESSED "2304">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY ORGNAME "The Yocto Project">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 9ae4696d0..39cdb817d 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -117,9 +117,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 4f6fe6e6c..1b82a41a7 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -143,9 +143,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index c66f5f3d7..1bcc0c853 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -87,9 +87,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index bc25d5ca9..03db6bed3 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -97,9 +97,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>October 2020</date>
                 <revremark>Released with the Yocto Project 3.1.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index c1209c4c1..12e0e6145 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.3/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.4/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.3/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.4/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

