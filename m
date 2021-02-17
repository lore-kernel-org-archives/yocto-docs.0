Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.10105.1613579402476869637
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Feb 2021 08:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bB8O3II5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id cl8so1775148pjb.0
        for <docs@lists.yoctoproject.org>; Wed, 17 Feb 2021 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rbjPp/EOwyvsX1ssKvqK06CIfRjvOSu6VB0nWYOQLoc=;
        b=bB8O3II5GLguEJeQy0OSHHMXIPUS5IZK3SN+6NaBpMChWvjRjOU3WMZge1yXS5px3f
         d+lqvwwrddZsNqobOnaqF4mjsQLdG0GAbdF+Q4UvQN7+qLwcrjju8RBkp58eP5GoP/d4
         D1xvbn0kkdXmsW4+f80Uoqy1Ynz/9yReSKzFVSBBDN8QxGO+DurBxdFXDJgvZmjxJOWa
         8SZfJVufAz4iuA1QyhgZhTr4ZOLFUP2Wse+b6riCPcCCQW8+GgavSOXopdajcvtnOlGQ
         jKTRZNIR4eUIgQIXMGJdhs4DJQDQwwxIou/pRgz4bHUHb7ogPXTV09+RoxQIddSoJpZE
         3Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbjPp/EOwyvsX1ssKvqK06CIfRjvOSu6VB0nWYOQLoc=;
        b=RhpSz+sGWx0jw8eLEc+noJSpVdeTFcDNnXF1OkRKsZkYiUBxKVwzfcFJOEFKVGjh4a
         BFDf5xVtTkDovhTZhpqduCoOKc7KeXMvpMhqWdAU3shV0nUzligo9Eq6k0dJezm+LPoi
         +6Jsys0LD/CiOOSCsZRcwJgfTuKekHNaeMGv1qWoaOHKJJOSNydYYXIIwUpiYqevwzCD
         L2k8T9Yuo5qkptNOBPilfEvGh5mXRdeoDimET8pg5CpA5J9uw0jSKYHmbO7k60Qav3ca
         hGAueRDIICx5uBHJo/CtE6P8SZ/AhR5Jk65GL64bduGA1E9L/lWuQvIeW4vSTsedo+xW
         0uOA==
X-Gm-Message-State: AOAM530GyK5S6B16K+xX/tQP3sFoRDE9/rCbo0oX6zTGVyF+cj/ON9f0
	YCY9u2C1u7oYz1y+WnDYk1WOz2OGgb3eyMKPdvo=
X-Google-Smtp-Source: ABdhPJwE9d9vddUChlAaRrAhFznDOQtHmEebBQU6HKRUwz7vXKPKMBqM2iUPVwb+M5ECphudoyG0Iw==
X-Received: by 2002:a17:90a:5d87:: with SMTP id t7mr10161135pji.175.1613579401326;
        Wed, 17 Feb 2021 08:30:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u14sm2888478pfc.39.2021.02.17.08.29.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 08:30:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/1] documentation: prepare for 3.1.6 release
Date: Wed, 17 Feb 2021 06:29:46 -1000
Message-Id: <450fa80f0115751332805b581c24d4903074cdff.1613579284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613579284.git.steve@sakoman.com>
References: <cover.1613579284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump the current version to 3.1.6

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py   | 2 +-
 documentation/poky.yaml | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 518ebb480..c2e9801fd 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.5"
+current_version = "3.1.6"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 71cb29822..ee9b2acbe 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.5"
+DISTRO : "3.1.6"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.5"
+YOCTO_DOC_VERSION : "3.1.6"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.5"
-POKYVERSION : "23.0.5"
+DISTRO_REL_TAG : "yocto-3.1.6"
+POKYVERSION : "23.0.6"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1

