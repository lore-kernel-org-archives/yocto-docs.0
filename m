Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.426.1623776341799708490
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 09:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0DcDMuxb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id a127so7910457pfa.10
        for <docs@lists.yoctoproject.org>; Tue, 15 Jun 2021 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C6s2nBFvmuOOUlyVG66jEIZfX90KK7s+T7fQ/F65oLE=;
        b=0DcDMuxbMIUfcfb9dlLBrM6TLmupvY7b7AH7hYRuQIUgb7tSWkEjX/57iR3hBqscV/
         /8u5ain2hINlvV/EcsHaCwIsXLA2hD9xwPww46P4yzqgnO8r9h8bASO+AAfwCAZMPltC
         vdUfYuKSUBbArMSrdr+n+OBL16MZvHByMOKgmSl5CuwGc0EUnjKGwxoN0N8FhZN9ZJvx
         Yb1K+MRMsGjRm9UhdRBpuAFg+GljPlPu3camQ1OC52NyvTPs6XIfj8K65u6+nyQ/TBj/
         gAxdgxg6+KfscCPuMjAcOHQfN1Tj1OzfBJRJyoQbAQllr79uIQw6idXOESiyPQSxqrGS
         ZruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6s2nBFvmuOOUlyVG66jEIZfX90KK7s+T7fQ/F65oLE=;
        b=MUD02XoE4tMBwxKo2Z6txh4RReKVypH4nN6uGg70tTUwuUA2DCLXxCPS/jFFWkEhsX
         mk78ZmWJGgMp6l2r9Eb5k6Tj0A/Yc1VqeCOJPtt3905kDj19EH4EQnb1sFGAL/nQFYQs
         Jw+68na8D2lPWHXOwjvijN9J7UXg+vgffrwmw07nFpNphAcVsWL9faE2UV96a3UxKZXd
         CTzFXHRV496vc//AWQqsmDbNbQQn/1+gPTw31EYLb/EQDVG1j69Dii2u0OUkSz7Z53FI
         fE1yD1u9eZFplR3q/B7I5yXe7gwiGHULCm2NC5HkweKU01Nv9AaIp4bsZa4ZGLvexTra
         ZpAw==
X-Gm-Message-State: AOAM533kRBQ1JDIllOywuX8ZkFCZVg447fKO0Be26DJ3ilWd5MkhY5SD
	lsfNilVaTfWNdlKpTvG2i/Om4/5/0nrEh452Y0E=
X-Google-Smtp-Source: ABdhPJw3KvwaMC3EKmiqDHRGF6jSfoCvSG0T6JE75dbS98Ma1dR80aiku/3YIEDQVlsdhT8Ah1XUcQ==
X-Received: by 2002:aa7:9281:0:b029:2f1:67b4:440a with SMTP id j1-20020aa792810000b02902f167b4440amr5257490pfa.73.1623776340794;
        Tue, 15 Jun 2021 09:59:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id z3sm7862741pgl.77.2021.06.15.09.58.57
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:59:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 3/3] documentation: prepare for 3.1.9 release
Date: Tue, 15 Jun 2021 06:58:13 -1000
Message-Id: <87b5dc74c5a94b999da23ee17e3dc3321a4fb8a7.1623775736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623775736.git.steve@sakoman.com>
References: <cover.1623775736.git.steve@sakoman.com>
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
index 7a57b3065..99bf4b364 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.8"
+current_version = "3.1.9"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 8d42c4496..999779e7c 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.8"
+DISTRO : "3.1.9"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.8"
+YOCTO_DOC_VERSION : "3.1.9"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.8"
-POKYVERSION : "23.0.8"
+DISTRO_REL_TAG : "yocto-3.1.9"
+POKYVERSION : "23.0.9"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 88740a63f..e272cdc72 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -17,6 +17,7 @@
 - :yocto_docs:`3.1.6 Documentation </3.1.6>`
 - :yocto_docs:`3.1.7 Documentation </3.1.7>`
 - :yocto_docs:`3.1.7 Documentation </3.1.8>`
+- :yocto_docs:`3.1.9 Documentation </3.1.9>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 21a495f60..06d4a8709 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.1.8': '3.1.8',
+    '3.1.9': '3.1.9',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1

