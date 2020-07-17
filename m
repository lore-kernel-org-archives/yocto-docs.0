Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.614.1595003098351421273
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 09:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jkp929Eb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id m9so5620453pfh.0
        for <docs@lists.yoctoproject.org>; Fri, 17 Jul 2020 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LcKJ3Apt/90Q/x5v6E5uPrguwlqAPfsQ6YA8ZxRtlHM=;
        b=jkp929Eb6Me5OORV7S2o6XHsnh36qp5Khd6Z2hcoLQHhAHnhI11qc5t3WKfHkTD590
         d1uj0JiNp6L3O/ILASkODHWTpsg5VrxmPTe6bxbrURIgQSVPSwpvdHwpjd18tDNSq9ni
         9kSaBiXJv0aIXvQae0wtUpi7JEgrgXNW7QvwuB4fnkfKqO+cwh2bE0OyBt5UVaKnDlBK
         +3fZn/P73X8gPmTb2xpd7EQjPExdTEZOufzNP37OKSrQY5mTUUJqAh1SwpCRmFJKZMNw
         wZiWG9jojtAas13tchC07KgKrrhEcjMpv2wIJXg4IesDzdh/hS1e0Ed51Yopy+y6Qefu
         EuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LcKJ3Apt/90Q/x5v6E5uPrguwlqAPfsQ6YA8ZxRtlHM=;
        b=jrFBVwB/kxqDSr2USUAjlwMo3CuESgIA7YeEbLjxazDvEK1n5Yq52kENYrLdblJzpr
         eGEsqVLRZhwEP+JLqS6kUh3X7hqHo2K85Jyb/Vkxu95+tMCix3SjEfG0DSoM0XzPIVMf
         0dm1ocbxkC5ON6Lyep3nNMW7158IHMW8i/bX+IoHxZkdtFQU57ooLj7Fdz6qQ7lq34qO
         t0I3XWeT5/r/9Bq4B8YGU//Feyn68WOnqubbbCSTujRzqOkzLN0lIK6wcosEdGXKrs2p
         8TCxnSwy7neyfZpA0zojDNueWKnVsENPWx3z+SsG1QiFO+iWMrjwP35TwSmfwP4cKOzN
         DWnA==
X-Gm-Message-State: AOAM5337fNABxhsNL+Tg4abt3+jkzv5oPNyjudSqPuMaMIz4z9OCTJ7b
	GOUcEtB7rrIzM7T/e2IfdQnjDU+hASc=
X-Google-Smtp-Source: ABdhPJwSmLvYLTgL7uWk1/clrYpB05a5IrQuaanr0X2UCgBvZuSnGzPX6U8Idy1tZioqrN9Mbt8iVA==
X-Received: by 2002:a63:c50a:: with SMTP id f10mr9553382pgd.167.1595003096703;
        Fri, 17 Jul 2020 09:24:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id ia13sm3269768pjb.42.2020.07.17.09.24.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:24:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] Documenation: Prepared for the 3.1.2 release
Date: Fri, 17 Jul 2020 06:24:40 -1000
Message-Id: <a442f741d0b4513c3dae30cf98988553a7baa96b.1595002733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595002733.git.steve@sakoman.com>
References: <cover.1595002733.git.steve@sakoman.com>

---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/kernel-dev/kernel-dev.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 .../overview-manual/overview-manual.xml       |  7 ++-
 documentation/poky.ent                        | 14 +++---
 .../profile-manual/profile-manual.xml         |  7 ++-
 documentation/ref-manual/ref-manual.xml       |  7 ++-
 .../ref-manual/ref-system-requirements.xml    |  3 ++
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 12 files changed, 87 insertions(+), 39 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index 6ab89d653..76f40f81d 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -132,9 +132,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 5c6b3457f..381c7e3c3 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -122,9 +122,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index fe3687ba7..be613fe40 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -107,9 +107,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index a20843fc1..69111a9ca 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -98,9 +98,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index b6da7517f..771eca07f 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -57,9 +57,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index 0a0deab8f..1d0aef5f3 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.1.1">
-<!ENTITY DISTRO_COMPRESSED "311">
+<!ENTITY DISTRO "3.1.2">
+<!ENTITY DISTRO_COMPRESSED "312">
 <!ENTITY DISTRO_NAME_NO_CAP "dunfell">
 <!ENTITY DISTRO_NAME "Dunfell">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
-<!ENTITY YOCTO_DOC_VERSION "3.1.1">
+<!ENTITY YOCTO_DOC_VERSION "3.1.2">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
-<!ENTITY DISTRO_REL_TAG "yocto-3.1.1">
+<!ENTITY DISTRO_REL_TAG "yocto-3.1.2">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "June 2020">
+<!ENTITY REL_MONTH_YEAR "July 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "23.0.1">
-<!ENTITY POKYVERSION_COMPRESSED "2301">
+<!ENTITY POKYVERSION "23.0.2">
+<!ENTITY POKYVERSION_COMPRESSED "2302">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY ORGNAME "The Yocto Project">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 710fb770e..3527850df 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -107,9 +107,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 1e970c1d7..d7b82bb5c 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -133,9 +133,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 7a11ec2cf..c6e1eb971 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -94,9 +94,12 @@
                 <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
                 <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
                 <listitem><para>Ubuntu 19.04</para></listitem>
+                <listitem><para>Ubuntu 20.04</para></listitem>
                 <listitem><para>Fedora 28</para></listitem>
                 <listitem><para>Fedora 29</para></listitem>
                 <listitem><para>Fedora 30</para></listitem>
+                <listitem><para>Fedora 31</para></listitem>
+                <listitem><para>Fedora 32</para></listitem>
                 <listitem><para>CentOS 7.x</para></listitem>
                 <listitem><para>Debian GNU/Linux 8.x (Jessie)</para></listitem>
                 <listitem><para>Debian GNU/Linux 9.x (Stretch)</para></listitem>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index b0408f8b0..a557549ed 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -77,9 +77,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index 53d666446..fbc051200 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -87,9 +87,14 @@
             </revision>
             <revision>
                 <revnumber>3.1.1</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>June 2020</date>
                 <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.1.2</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.1.2 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index d52f1ebdb..933f23ea8 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.1.2/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

