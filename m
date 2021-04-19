Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.734.1618865262251462427
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 13:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MLX3uqXz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.49, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f49.google.com with SMTP id u11so14972157pjr.0
        for <docs@lists.yoctoproject.org>; Mon, 19 Apr 2021 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+tf9V1u2kZVPyPf9MoMVnsSL3lzqENnMFOAmwlMH+U=;
        b=MLX3uqXzJ7OxGljdUEvJh21EbTd45DiFhB6TKRGDh1+daGPccuoJqJpoM2F8xVXDeZ
         A6FL6Ehm+UqKdIx4PYL4nemE4AE56Y3wViBq3TXmIZ7xXI7zqzrgAxjB1bNkuXGHzDvc
         ONVi97mmi97mxhoITb+LL4SlPY4Kbs1HbBtwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+tf9V1u2kZVPyPf9MoMVnsSL3lzqENnMFOAmwlMH+U=;
        b=lLUl9tAuLkMooxDXUzkAF6KwgHs3tY+/zBkvDp4t9kqroGEChvHnZecTDGCbFMJTsH
         mSJUqvSH46kGeaIclDNfF3sL3SC2zW6WBwPhT9JEPXtui73+0zcf3R7wFm+XuNuXlk4P
         sBiYgzuNcGOn1mEDwdskgI63ZJdoD5aR2fEKGcjc1kKz/tdyNMEB3ii4IPzqjCJ0bErv
         6JuOXsY5JJrsSEpeJefPyXJZYp18RodU2EKqb2NSltNIQDpd7UBl0RHCXNkMx9C/qm5Y
         K/rysPU9l7nGEFu7E157mDC7fC8G7R/HrqVh1wwN9fSGJV0ALFVIEBskKUh29ulhGbni
         vgIQ==
X-Gm-Message-State: AOAM533Bzhky3vFK2mQ6aXJR9CMXg2+c8gwZNPWTMBAbv3OwoDCgfh4P
	NSwgwm+5duVAnU/Pf7pFuGbZQ5Dzln++bQ==
X-Google-Smtp-Source: ABdhPJxShNpE1hVtyVD36tbyX5gWy+QSp/+6RsA7WCtggNQfxELAbkk6eLX79TrrNv0cxxmw3RZt6Q==
X-Received: by 2002:a17:90a:ec03:: with SMTP id l3mr970102pjy.61.1618865261298;
        Mon, 19 Apr 2021 13:47:41 -0700 (PDT)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id g21sm300337pjl.28.2021.04.19.13.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 13:47:40 -0700 (PDT)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.3
Date: Mon, 19 Apr 2021 13:47:35 -0700
Message-Id: <20210419204735.42922-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Hardknott to documentation switcher and release list.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 16 ++++++++--------
 documentation/releases.rst               |  6 ++++++
 documentation/sphinx-static/switchers.js |  3 ++-
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 8ccb359e0..22706a0fb 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.2.3"
-DISTRO_NAME_NO_CAP : "gatesgarth"
-DISTRO_NAME : "Gatesgarth"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
+DISTRO : "3.3"
+DISTRO_NAME_NO_CAP : "hardknott"
+DISTRO_NAME : "Hardknott"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.2.3"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
-DISTRO_REL_TAG : "yocto-3.2.3"
-POKYVERSION : "24.0.3"
+YOCTO_DOC_VERSION : "3.3"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.2.3"
+DISTRO_REL_TAG : "yocto-3.3"
+POKYVERSION : "25.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 6a65b9fb3..e8258f6a1 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -4,6 +4,12 @@
  Current Release Manuals
 =========================
 
+*******************************
+3.3 'hardknott' Release Series
+*******************************
+
+- :yocto_docs:`3.3 Documentation </3.3>`
+
 *******************************
 3.2 'gatesgarth' Release Series
 *******************************
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 7a4edc9e7..96efab2e8 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -2,7 +2,8 @@
   'use strict';
 
   var all_versions = {
-    'dev': 'dev (3.3)',
+    'dev': 'dev (3.4)',
+    '3.3': '3.3',
     '3.2.3': '3.2.3',
     '3.1.6': '3.1.6',
     '3.0.4': '3.0.4',
-- 
2.30.2

