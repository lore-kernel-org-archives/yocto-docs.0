Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.1366.1617734905386677552
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 11:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RU/y6SNw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id t22so3880768pgu.0
        for <docs@lists.yoctoproject.org>; Tue, 06 Apr 2021 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DQdXcSC8Tb7uo4Tq/PvCVw1mCeeLG8F7Zw0bc4vO/18=;
        b=RU/y6SNw+OSNzqF54sC/E5kkDjlIlAbOdNxy/AxdtKvw8hjvlTwBoY+QHnHDhy1aNE
         M25btKItEoYIZR0pM8pGAOzFNrVsKy6AgnTBpjclq8jY8mdCwWVaYd6XrIlDGnlmxM4I
         p5OmCywQOkpSxVkONQAMkxMT/oM/9AqzChjmOyYFRHPDi08eAjQn//ftNOcQ8T21N2ae
         nvLK4FQe2B+02Tlr8veun3cQbyMBGdbKXTGbDae2l3lP5ZYN4KXhllfoC4i7vOV3Nhe8
         9rkCOE5HTQ1ppbJl2oYkQ4noLkp0o72/bRg8Ij8BYaFmObf4OXhKMt22Mn4TUooyqGOz
         pQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DQdXcSC8Tb7uo4Tq/PvCVw1mCeeLG8F7Zw0bc4vO/18=;
        b=HbF8j/KBHJ3IRoCwAU3vR3+Y2F6B8s6GQ52Ld63WXQNBWSFMTNpt/ZcmibUzS50fQE
         WhxIcu3iYhzazwhukb30B9ISDrPSk62e3v6D9DArAucDFdXvKsh+BIRvzu2Dx7bwhnes
         R0szosjboLNTPVEYKBsqm046EkKnK4gLGOUzth/nyJdm3mqpkVUmjvWX05j/eFF2M2pk
         LJadP4N+pDC4WCvHNT6U5OIjZQ5KRZKINIaDR7EGDx6/BijFmzZOC3CFVMcnD2SGbm72
         WR6AdH06JuXT6gJjh0OU4DRYeZYSzs36CyMGPahR6rSNWGGBS3eJK53RDV70Ut4FD6As
         ZQNg==
X-Gm-Message-State: AOAM532pArl/6JdC3t8UCpR02usSnFuklBNh7ZNAYjIm3zADMUxd9ZOA
	i/xOOKhL9DIzZo0HOxXFmcoVYe+Is6GAsnXS+fo=
X-Google-Smtp-Source: ABdhPJxP7vClqhzxncRzwNpMlgy0THBnfzSISPpVFxQdmRbVUF+Af2ST6xV7HNUOvr5KHl6yDrT4xA==
X-Received: by 2002:a63:4547:: with SMTP id u7mr10902137pgk.351.1617734904361;
        Tue, 06 Apr 2021 11:48:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j30sm19339218pgm.59.2021.04.06.11.48.21
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 11:48:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: prepare for 3.1.7 release
Date: Tue,  6 Apr 2021 08:47:54 -1000
Message-Id: <5a54200a8702e473ecbbc3dbbdaa24169796c9e8.1617734759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617734759.git.steve@sakoman.com>
References: <cover.1617734759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 6 ++++++
 documentation/sphinx-static/switchers.js | 4 ++--
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index c2e9801fd..4d3185088 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.6"
+current_version = "3.1.7"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index ee9b2acbe..d72e68c21 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.6"
+DISTRO : "3.1.7"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.6"
+YOCTO_DOC_VERSION : "3.1.7"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.6"
-POKYVERSION : "23.0.6"
+DISTRO_REL_TAG : "yocto-3.1.7"
+POKYVERSION : "23.0.7"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 536c3a6d2..2311fa885 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,6 +11,11 @@
 - :yocto_docs:`3.1 Documentation </3.1>`
 - :yocto_docs:`3.1.1 Documentation </3.1.1>`
 - :yocto_docs:`3.1.2 Documentation </3.1.2>`
+- :yocto_docs:`3.1.3 Documentation </3.1.3>`
+- :yocto_docs:`3.1.4 Documentation </3.1.4>`
+- :yocto_docs:`3.1.5 Documentation </3.1.5>`
+- :yocto_docs:`3.1.6 Documentation </3.1.6>`
+- :yocto_docs:`3.1.7 Documentation </3.1.7>`
 
 ==========================
  Previous Release Manuals
@@ -24,6 +29,7 @@
 - :yocto_docs:`3.0.1 Documentation </3.0.1>`
 - :yocto_docs:`3.0.2 Documentation </3.0.2>`
 - :yocto_docs:`3.0.3 Documentation </3.0.3>`
+- :yocto_docs:`3.0.4 Documentation </3.0.4>`
 
 ****************************
 2.7 'warrior' Release Series
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index b28d91c08..cfbc5d5db 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -2,8 +2,8 @@
   'use strict';
 
   var all_versions = {
-    'dev': 'dev (3.2)',
-    '3.1.3': '3.1.3',
+    'dev': 'dev (3.3)',
+    '3.1.7': '3.1.7',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1

