Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.705.1580919821326385000
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 08:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YsiKSYTa;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id 84so1457732pfy.6
        for <docs@lists.yoctoproject.org>; Wed, 05 Feb 2020 08:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=FPuup7QFteZV99brdkg3Ck6XDXhoBbCczLkB9zRqTQY=;
        b=YsiKSYTakUqVn89vFSds+rxq0siSJ69hk3s949gxK1+2XRtEH6xWe3LE3pRbCz/aAW
         eObWsivWe1fNhn+cBsYeh2r8mtxD1dBuCMn183R6R8e/By2i+LF3BcCxCbTvVhvoHT1o
         qxkzkaCZXpOEzT4/y4wY6N6jyMgThnEfbCe5DN+9VuXGAWNGgSgMayznSqeRl0AYWe6b
         N9WpPY4sPb7IE8aJFbi29Tkbcu2nCsASVQ90JtwDu9mxFZuGX1r3pKQALjDoKSUlSmlF
         8BtwmJbbV6ktik4j3yu/dOXpQYjOBKl9bmBDmzYACKaq4oAn0/0br4bj1tOHrzx+HFYe
         p8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=FPuup7QFteZV99brdkg3Ck6XDXhoBbCczLkB9zRqTQY=;
        b=OgDRCbdDWhJHb99U7uBzPLCUtSwlFKHuTINfwvJTauqWWuEMGtINjyUeFSttB6yS2R
         abaVcSSoQgGTyYKTlS6G8JRZXeezr4Ou3sD12ILflmvMA/l06jtblpOdM0/EHu/aze0H
         QNRL80XsOvKeeTLpGGN/Ft2Fxm4KwW+nkU34YLk5+V06MTZ9Qs25wyyYTURbdJjRejKd
         yt3ljBdh20RappTouiwcj9peNgJRwa35FG9fpjLyqwU0OVspWXY+XXB8RdL1jXcOxiZb
         POpMtaA9zzhnzVvjf1fUmZkaKj0IfKhHFNVCLE+nH6uYIQJMH71PVY+mwdghjjip8ahM
         Ex1A==
X-Gm-Message-State: APjAAAXEACXVpGNnFJx7os/w0wYvlmef0UToj/S9PhDUb6AuBvQux3Yw
	jdG5ozAK41EqUlZTY8bp6NHb65ld
X-Google-Smtp-Source: APXvYqzIEhywcOsCXQ21EMQrGbDa/a7n12h6C6inTlTMmykz0VeNaENZCcU5Y2TYS9WNR3PjQoYU1g==
X-Received: by 2002:a63:3c08:: with SMTP id j8mr37606327pga.223.1580919820400;
        Wed, 05 Feb 2020 08:23:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e0e6:3e38:df8b:421b])
        by smtp.gmail.com with ESMTPSA id r62sm30318000pfc.89.2020.02.05.08.23.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 08:23:39 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][zeus][PATCH] Documentation: Prepared for 3.0.2 release
Date: Wed,  5 Feb 2020 08:23:38 -0800
Message-Id: <20200205162338.18261-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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
index ab33cb1ed..a1dae35f8 100755
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
index acfa4c10a..27399e05f 100755
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
index c6fa5f6f8..94abe06c5 100755
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
index b9e2de17c..9ab010d93 100755
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
index ab62d1320..6c9056b77 100755
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
index e7b1a9b13..ba4dbc869 100755
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
index e061a1181..4e10978ca 100755
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
index 58a34b876..f9f5723d6 100755
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
index aa88fe980..161d573bf 100755
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
index 6d68a194a..6d3321cfd 100755
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
index ce205f3d6..8e306098b 100755
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

