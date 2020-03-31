Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.3615.1585681930105900900
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 12:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jKmfAlTk;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id c20so8239211pfi.7
        for <docs@lists.yoctoproject.org>; Tue, 31 Mar 2020 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=RosyLDP29gab0FxAdd1h5y1FiSuo750cGZPGUSiaGmU=;
        b=jKmfAlTkK+CqiXlTJRoZxhWg6OU/deZipMXIdJ1Aq0IYg7pqATxJE38j7ITNQokNMU
         zgAoCXUk7oO0F17+EmDDFoFXmTlIHc+istB/kaGNi1aJ56kHAB7t0tldyDitxz3L86Ng
         +WOmjKi/SSrrAZLn0z6qKHwTxle3bQ2/jTGGfoJaGymoniNE1yXcQI4y3mCvg58hFr6J
         sVk5V6uh6uPxZIUQBsTutf8Dt74hh0d8+VIvpOhz6JQLV3md06QDCD6V6bOJglHHjGQa
         X79JqtlODoR9kvMB8UMLnzatdtJFdk/PpBQzNBmH1WgZh6NB4HFTRAcuFT+LWPjfMe3z
         rwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=RosyLDP29gab0FxAdd1h5y1FiSuo750cGZPGUSiaGmU=;
        b=jEjb9tWrFIaILj0tUlRBYVxe8FuhGAoao9cCFLrKF1dvAEaYFT4NoUerzDEwzp1mhm
         kmQRVaZeU2bjQ1AH3LVBxtq873P/3vS0tpJ6235S6z/TmWwxYebCf4/ehXNdPRfYQ3aH
         +J79/yUb4niLfeEhO3iVTOOnYRtvUqIvXh5j1OOQy2fH6cxrCBlMWQae75njiHLLE+eU
         l4Qeqlbu+Nr97zqiCQmWO+7OIDKau/SzfvMQE5FPxW2GbMWViNKBKG6QKA9FwYY/gu9X
         xiQVMPkVyhqFFUQ0bvjGo726CqlOoIOtH95HvQIrhltqIzEvExLmp7PzOscu+Pcx/Dmi
         WW2w==
X-Gm-Message-State: ANhLgQ2gY6WFkVnU9o2pAOxu7ggRMfGu6JsL7JVynCJbl48F1xGj/xcS
	uGi4BhPov9Hp+vcaFa3LNOIcO/72sUU=
X-Google-Smtp-Source: ADFU+vuI3rImBR8MZbOHrsGdTCLQZyElejwA5BzFeHSjX+z/8fAN4NLv2xiQX+n5/yx6GX36MJV8sg==
X-Received: by 2002:a62:2a8d:: with SMTP id q135mr20744247pfq.220.1585681928661;
        Tue, 31 Mar 2020 12:12:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:a8c0:f557:a490:54cc])
        by smtp.gmail.com with ESMTPSA id x189sm13015925pfb.1.2020.03.31.12.12.07
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 12:12:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-doc][v2][PATCH] yocto docs: change author info
Date: Tue, 31 Mar 2020 12:12:07 -0700
Message-Id: <20200331191207.9254-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[v2]
Remove missed author change.
Use variables for author and email

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp-guide.xml             | 5 ++---
 documentation/dev-manual/dev-manual.xml           | 5 ++---
 documentation/kernel-dev/kernel-dev.xml           | 5 ++---
 documentation/mega-manual/mega-manual.xml         | 5 ++---
 documentation/overview-manual/overview-manual.xml | 5 ++---
 documentation/poky.ent                            | 4 +++-
 documentation/profile-manual/profile-manual.xml   | 5 ++---
 documentation/ref-manual/ref-manual.xml           | 5 ++---
 documentation/sdk-manual/sdk-manual.xml           | 5 ++---
 documentation/toaster-manual/toaster-manual.xml   | 5 ++---
 10 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index ea4899b70..fabbb98be 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 2ef7087cd..a5cf5ccaf 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index e0aed297d..471559458 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index 13ada7c03..0c3ee4e5a 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -33,11 +33,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index dfdc165a6..b45b9605e 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORHNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/poky.ent b/documentation/poky.ent
index eb5de9514..7ff9a448e 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -5,7 +5,7 @@
 <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
 <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
 <!ENTITY YOCTO_DOC_VERSION "3.1">
-<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "2.7.2">
+<!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
 <!ENTITY DISTRO_REL_TAG "yocto-3.1">
 <!ENTITY METAINTELVERSION "12.0">
 <!ENTITY REL_MONTH_YEAR "April 2020">
@@ -14,6 +14,8 @@
 <!ENTITY POKYVERSION_COMPRESSED "2300">
 <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
 <!ENTITY COPYRIGHT_YEAR "2010-2020">
+<!ENTITY ORGNAME "The Yocto Project">
+<!ENTITY ORGEMAIL "docs@lists.yoctoproject.org">
 <!ENTITY YOCTO_DL_URL "http://downloads.yoctoproject.org">
 <!ENTITY YOCTO_HOME_URL "http://www.yoctoproject.org">
 <!ENTITY YOCTO_LISTS_URL "http://lists.yoctoproject.org">
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index 14c508ea1..2b914b2e8 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 48358aae5..030a28329 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
 
         </authorgroup>
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index b00547c1a..67d70cb31 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Scott</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>srifenbark@gmail.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index d38137c8a..4e036af54 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -22,11 +22,10 @@
 
         <authorgroup>
             <author>
-                <firstname>Kristi</firstname> <surname>Rifenbark</surname>
                 <affiliation>
-                    <orgname>Scotty's Documentation Services, INC</orgname>
+                    <orgname>&ORGNAME;</orgname>
                 </affiliation>
-                <email>kristi@buzzcollectivemarketing.com</email>
+                <email>&ORGEMAIL;</email>
             </author>
         </authorgroup>
 
-- 
2.17.1

