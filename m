Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.10875.1597517313941271330
 for <docs@lists.yoctoproject.org>;
 Sat, 15 Aug 2020 11:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WUe64Yam;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id p37so6072432pgl.3
        for <docs@lists.yoctoproject.org>; Sat, 15 Aug 2020 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=+mbWUkHJif9BXIOj5M+Q5QBb8iB29IJqIgeU9H1Ajqo=;
        b=WUe64YamjFD+XrjvzdHBirjq3G0+3yXP3lbjoKPIhFTvNsxvaQeHFdiAaY8Qzd77YV
         5T70LZjabDE8Z/aThaySmoITMKvIK4O1/g6t9QHXs8Nz5NyIZGN9oURYWZ2PiTIakJOV
         01vm/ljVxICHtSYIZNahWVQGeGWTIG2C1T1oEdS4R0AnixicKtg0RkfIMp/IgOOf/hs3
         kVmTDHa7suc2VJXBg8cJ5ccyu0b7Y9BJXhivVOZzf5hytPbpXScYeSg+QqFV8B9jK7GI
         E3f3aq6YwyQsbdh8GeapSdQy/w0xCL5oowy2/MzKUINyRshYGoph2dtrrez7UzNNTXPU
         iWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=+mbWUkHJif9BXIOj5M+Q5QBb8iB29IJqIgeU9H1Ajqo=;
        b=kb5Em8MF2TPnw5KskKqYUqVGugZAuTElk7K2g1IMT5xnlxBKWkNebEEvra+FJxaWBO
         yXPlmTfErrM031x1M15Kz+S1FcgyuKChAErGaw3xY1MF5Cys0hGRUFsvalqbs2LLyo3S
         5dkjc8JnEac7qbjvT9851gNA8kvMfb01lgtDpaMRoWuUsNV+ifTRtdgpTVD6i8PBhQFS
         vDUTkv/vSvq5js6Z+3BrD2NPB5T9Qg0NqO8Q6an2ta1ev+gzkfolnNx7rVVAqHKExCcB
         bhiKRwjeZc+0z1LliVI1NG54sne+REIjcTtMm4tL/Kcixjj1bqbvh5bP0RhLhUYEGrMn
         Csjw==
X-Gm-Message-State: AOAM530Ia0CjY+AWnmcvssFWCDHTDIQ0MepKi7ddeKF36yP8P5mAXv5S
	aAp1vY/HKghWe4cJWvtNVjBS1Zh/oH4=
X-Google-Smtp-Source: ABdhPJwIDcBT2VMab8Y4E3KydhmsbAOmksmPk2QqR+HhJcu2daoBrVP5g0DcYyciMfKQxw6IFR8dag==
X-Received: by 2002:a63:315:: with SMTP id 21mr4547439pgd.103.1597517312978;
        Sat, 15 Aug 2020 11:48:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:856d:a45:cbc0:a95c])
        by smtp.gmail.com with ESMTPSA id 144sm12657053pfu.114.2020.08.15.11.48.31
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 11:48:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][zeus][PATCH] Documentation: Prepared for 3.0.4 release
Date: Sat, 15 Aug 2020 11:48:30 -0700
Message-Id: <20200815184830.27124-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 .../overview-manual/overview-manual.xml       |  7 ++-
 documentation/poky.ent                        | 14 +++---
 documentation/ref-manual/ref-manual.xml       |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 9 files changed, 72 insertions(+), 37 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index 7b492bc04..db68bed3d 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -148,9 +148,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index f8ac3e480..4d2d738da 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -133,9 +133,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index fa1da3fd3..dc7521a2a 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -104,9 +104,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 14e8cf808..1e01b73fd 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -63,9 +63,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/poky.ent b/documentation/poky.ent
index 95230863d..ed43ece64 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-<!ENTITY DISTRO "3.0.3">
-<!ENTITY DISTRO_COMPRESSED "303">
+<!ENTITY DISTRO "3.0.4">
+<!ENTITY DISTRO_COMPRESSED "304">
 <!ENTITY DISTRO_NAME_NO_CAP "zeus">
 <!ENTITY DISTRO_NAME "Zeus">
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "warrior">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Warrior">
-<!ENTITY YOCTO_DOC_VERSION "3.0.3">
+<!ENTITY YOCTO_DOC_VERSION "3.0.4">
 <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.7.3">
-<!ENTITY DISTRO_REL_TAG "yocto-3.0.3">
+<!ENTITY DISTRO_REL_TAG "yocto-3.0.4">
 <!ENTITY METAINTELVERSION "12.0">
-<!ENTITY REL_MONTH_YEAR "MAY 2020">
+<!ENTITY REL_MONTH_YEAR "Aug 2020">
 <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
-<!ENTITY POKYVERSION "22.0.3">
-<!ENTITY POKYVERSION_COMPRESSED "2203">
+<!ENTITY POKYVERSION "22.0.4">
+<!ENTITY POKYVERSION_COMPRESSED "2204">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
 <!ENTITY YOCTO_DL_URL "http://downloads.yoctoproject.org">
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 7ef1f0cc0..e10256bf3 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -149,9 +149,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
         </revhistory>
 
     <copyright>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index e985491cc..a1d3e0c08 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -83,9 +83,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index 0e40495f9..d1977a544 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -93,9 +93,14 @@
             </revision>
             <revision>
                 <revnumber>3.0.3</revnumber>
-                <date>&REL_MONTH_YEAR;</date>
+                <date>May 2020;</date>
                 <revremark>Released with the Yocto Project 3.0.3 Release.</revremark>
             </revision>
+            <revision>
+                <revnumber>3.0.4</revnumber>
+                <date>&REL_MONTH_YEAR;</date>
+                <revremark>Released with the Yocto Project 3.0.4 Release.</revremark>
+            </revision>
        </revhistory>
 
     <copyright>
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index 854061a96..654996d08 100755
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (<word>-<word>-<word> style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
 
 # Processes all other manuals (<word>-<word> style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
+# s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
 
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/sdk-manual/sdk-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/bsp-guide/bsp-guide.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/dev-manual/dev-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/overview-manual/overview-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/kernel-dev/kernel-dev.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/profile-manual/profile-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/ref-manual/ref-manual.html#@"link" href="#@g
-s@"ulink" href="http://www.yoctoproject.org/docs/3.0.3/toaster-manual/toaster-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/sdk-manual/sdk-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/bsp-guide/bsp-guide.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/dev-manual/dev-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/overview-manual/overview-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/kernel-dev/kernel-dev.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/profile-manual/profile-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/ref-manual/ref-manual.html#@"link" href="#@g
+s@"ulink" href="http://www.yoctoproject.org/docs/3.0.4/toaster-manual/toaster-manual.html#@"link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.3/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
+s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.0.4/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
 
-- 
2.17.1

