Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.19980.1621262550611267825
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 07:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZNB11XL5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so3835463pjv.1
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pHHih+7FkFTc3dsbB2WLcsULksHemUFheE4SFSnFoCA=;
        b=ZNB11XL5Fn3voqiwpCQVMIhYLO/y6rDwaKK+2HV2TrQGg+frcDi7hVH3AFJ1UNumZp
         wuUF8m+rs93e6T04GNjQLB+PYWOjSNEdv8NgAmOSQMnFsgOYfwZRszwQVUqL/h8FRH49
         IbjOB2+67BRK9jw4dUs54fPHgPB+K3S1tZjMm59MuRl6VyxjpB/dErkPKmiQMlV/kB7u
         sz4ae/aTsQDX04IpSTQwDRUMhOnmYn5TqD2Bho079pAiTHsZ/e25LCl4/YGhniLEWJyz
         zYJTkKBRjyXvd7UiKjIBSuo6kuPflZq7xwOvjCSemEagUXQR3ugJ/Cg9qFDX6Q7zMjPw
         tjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pHHih+7FkFTc3dsbB2WLcsULksHemUFheE4SFSnFoCA=;
        b=YdYdnXQC4anePA3fYFrWfelZzRdViepkayOSns276RH4n+E+zzsH17f7OKBKRq17+b
         OM2Ccw8Q9ksUcM6i36El+TT07LJgSmpQXHZwYxmqKSxAnmOdRo+PwjmVV/tL2bdsBrRD
         Np1nGSK3k+l7wPkdI+8VQjqcoW9tvEhHSI1wk75B2MXp39SqAdax4DrOEsQP5cG/Srjr
         WaD3zWc5tnn2aMMxAdkgtqTNvtUS0YSgtfgL2i/9eZa0gxgBOAMLGspoIFTb7Agv+Pgu
         UJ38ixsqCnXEHexDNtElkmbLBkIFI1LspZbkz4Je8uzrjXqH0DbCjk++FCuE7Bq65wjV
         1FMw==
X-Gm-Message-State: AOAM532PKFqwJkY0NCLaGWuFSq9Fx3yv9aVE1v7lsRRDwhSbQkihwX7V
	8+e0xWevzixIenrYi64EGp1qlBG5WyW3GvmLjRE=
X-Google-Smtp-Source: ABdhPJzHHntZc3vTATwru1q57rowuDqcr8qN29+bJTPCrSSIQhOIaPNj9y9bhsk5MEiczfwIVopYoQ==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id fr10mr307101pjb.6.1621262549731;
        Mon, 17 May 2021 07:42:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y64sm9908138pfy.204.2021.05.17.07.42.28
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:42:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/2] documentation: prepare for 3.1.8 release
Date: Mon, 17 May 2021 04:42:12 -1000
Message-Id: <09b64a4d246bdcca62dddee152deef7b0dea69d7.1621262110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621262110.git.steve@sakoman.com>
References: <cover.1621262110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 4d3185088..7a57b3065 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.7"
+current_version = "3.1.8"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index d72e68c21..8d42c4496 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.7"
+DISTRO : "3.1.8"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.7"
+YOCTO_DOC_VERSION : "3.1.8"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.7"
-POKYVERSION : "23.0.7"
+DISTRO_REL_TAG : "yocto-3.1.8"
+POKYVERSION : "23.0.8"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 2311fa885..88740a63f 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -16,6 +16,7 @@
 - :yocto_docs:`3.1.5 Documentation </3.1.5>`
 - :yocto_docs:`3.1.6 Documentation </3.1.6>`
 - :yocto_docs:`3.1.7 Documentation </3.1.7>`
+- :yocto_docs:`3.1.7 Documentation </3.1.8>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index cfbc5d5db..21a495f60 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.1.7': '3.1.7',
+    '3.1.8': '3.1.8',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1

