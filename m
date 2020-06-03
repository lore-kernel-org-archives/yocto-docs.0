Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3212.1591211304126383237
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 12:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oJBv1tHp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id b5so2208484pfp.9
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2020 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pqwMhE8fabtCMP9XvnF9f/AlUdVrdM/MlIpXFZblGI4=;
        b=oJBv1tHpT8FdyVYtRhV9AVA1npXfyJrbNHOOzZZbwhLOscLd3Qg0PJIxUzT/Aca85M
         /A2nKHaAX0cERRbmKMIH32zBJxACdSW4gA5k5esVcC5kjMfbeEzCJCtw/tquwgQaMQGO
         Nu6n0li5LdzJ3O0Ik/zfyfgVJILzs/sPieiMWd5Mux7lP6PeazWffKrCc/13D8InapP8
         YnOybYAAkSIjM1pIwHyMuQ0bwj9bbpAi9+Zb0T2zq/d6zXLqTUCi+FoAHXMhXwmOHxSi
         tLqSVCVHEjQD74SozMJiIhYL4VV+S1uTwccPxU5vgg7V49bUBHRTuwjOmmX5ziJ5V2DS
         lXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pqwMhE8fabtCMP9XvnF9f/AlUdVrdM/MlIpXFZblGI4=;
        b=Z0PmxXekHMDgw0keQkbhXbRXPYYtD8k6ZamEtNw5FzRgqrR9jS+x6Sr9NN1KuGhz8X
         fFQh3obuq3yVxAw6iusYd6TnmLtW2FzMzZS5NL+KPJwhxZaYDAXHBzpehlYLL0iwNFJr
         ynu+rAmF9oyToBfruHtpssDdX1bNyiXNi8dhO/Cs5FsYtc91fkyDvASiycca4ADI9FM/
         igrWle5y44+KZpTiQ743u8OsX74CX/nOBo2JKNJ95jqFvAiYSNYDsNd2BP5epX+0Mn7s
         aRDz5JK3tp8gPu0xACWSm/YwFnVaRPnrfS6V96ARF4P7BJHp8zgXmPERIoJmEYiG4yHa
         tXOg==
X-Gm-Message-State: AOAM533Qgznq4vu6j/wx+8RQtZYS2+shEb8lCe2SYU4fxLFvCR4IlHTT
	RZJRPysfc67eAuJ5z3A5nYymyIcfWgw=
X-Google-Smtp-Source: ABdhPJyvN7CIjtvdHmANjH7hn9TRbzWjlGNTLBx4/J4k4u0cLPoMixwKIOwx9b/wlVtEri02vg3qVw==
X-Received: by 2002:a63:2f46:: with SMTP id v67mr756494pgv.425.1591211302709;
        Wed, 03 Jun 2020 12:08:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 17sm2511047pfn.19.2020.06.03.12.08.21
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 12:08:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/1] Documentation: Add 3.1.1 version updates missing from previous commit
Date: Wed,  3 Jun 2020 09:08:07 -1000
Message-Id: <bd140f0f9988fbd55f428a8ba7a54ae68716a33a.1591211174.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591211174.git.steve@sakoman.com>
References: <cover.1591211174.git.steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/kernel-dev/kernel-dev.xml           | 7 ++++++-
 documentation/overview-manual/overview-manual.xml | 7 ++++++-
 documentation/ref-manual/ref-manual.xml           | 7 ++++++-
 documentation/sdk-manual/sdk-manual.xml           | 7 ++++++-
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/documentation/kernel-dev/kernel-dev.xml b/documentation/kernel-dev/kernel-dev.xml
index 998fe4141..fe3687ba7 100755
--- a/documentation/kernel-dev/kernel-dev.xml
+++ b/documentation/kernel-dev/kernel-dev.xml
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
diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 210d644b3..b6da7517f 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -52,9 +52,14 @@
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
diff --git a/documentation/ref-manual/ref-manual.xml b/documentation/ref-manual/ref-manual.xml
index 9a914f19c..1e970c1d7 100755
--- a/documentation/ref-manual/ref-manual.xml
+++ b/documentation/ref-manual/ref-manual.xml
@@ -128,9 +128,14 @@
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
diff --git a/documentation/sdk-manual/sdk-manual.xml b/documentation/sdk-manual/sdk-manual.xml
index 537663dad..b0408f8b0 100755
--- a/documentation/sdk-manual/sdk-manual.xml
+++ b/documentation/sdk-manual/sdk-manual.xml
@@ -72,9 +72,14 @@
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
-- 
2.17.1

