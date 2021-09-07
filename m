Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.290.1631026128997645607
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Sep 2021 07:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W+NyFVAt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id x10-20020a056830408a00b004f26cead745so13045522ott.10
        for <docs@lists.yoctoproject.org>; Tue, 07 Sep 2021 07:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uRx5YxTYKgs3xTa9PhgRZD5Jn0dnVjPPk2bReqWGDe4=;
        b=W+NyFVAtW2waotHAVOJyEJkm99SnWyPv4tTwrvo5kyNc4+jRvY9nSIRqhdCpG+gkgO
         i9nRqlGQmdkMFdVTL/QmNKzmYq/lOpRcwni2XluQ3x+qVYVHZq95pCl1W44VDajJ99uy
         4XWcwB7+B7e2ZqeMUi2CZp9Dtctx5nRXgY7MsqCB4BCo8tuMt1W7rt0pQN1IODoVZDaA
         KpG87TEsSGOv11RsetdnjkzCsmQtw9fvAsZj5b2qFxVVKpbzTu2nCJS9kVemktmqbHvd
         E8N4Vm1kuiDVSeHCcSp/FHN/KrZ8ykcZ5PAmsPtvOsE9HhIlsB4iraZ0Y3r5pRuyIc5c
         uHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRx5YxTYKgs3xTa9PhgRZD5Jn0dnVjPPk2bReqWGDe4=;
        b=Ww3ZO/MpDmKtPAiiM2owounMQ/eQdCmbxEyETX1/QKwCmP1QZvXvVBgsSAu2NQSO10
         B/DILAntY+jQ/oLHWuvqq5Qw2yeAbvQeyX283sEfdTrPU4149L2hBmYgZDzehRhtHjFJ
         dZBfbTCEC9ZiZtWyNI8WONWo5PkwpXS7JkpNGdQKo5uY+zaKs6i/7WtyA6RnIEW6+t5W
         q5RCqaxla44/TDStSrf1TiNsmDJ/l1MWkUYi5dM760QnQ2KET45Squq2F1Z1zvYHiscZ
         d4JOE4wde5M61wrwymmhoramhSYPQHmmmVEEV6RVa5pqYkJ7WwcXuv9QqteijPPhWJ6W
         zA+g==
X-Gm-Message-State: AOAM532k11L/WiCCRhjcbX25xYRmaEIws8kuVrcjzYLKpS1nAZ7+7+nD
	fhzfdwXusekExKLzDIbPTh4uID+O32cYfTWn
X-Google-Smtp-Source: ABdhPJw7y7lZuDpxclxvWjSlUv2Q5VX2n9zq3ZfwXqso7rU4Py5iWVN1S/F2apwgbSuocRTfItHI1w==
X-Received: by 2002:a9d:458a:: with SMTP id x10mr5314438ote.267.1631026127793;
        Tue, 07 Sep 2021 07:48:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id t9sm2109421oie.20.2021.09.07.07.48.44
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:48:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: prepare for 3.1.11 release
Date: Tue,  7 Sep 2021 04:48:24 -1000
Message-Id: <bc884189c0c0caeeaf51460c244581aaf8076dcb.1631025999.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631025999.git.steve@sakoman.com>
References: <cover.1631025999.git.steve@sakoman.com>
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
index 82fa32554..6f10fc151 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.10"
+current_version = "3.1.11"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 590af46eb..17426567a 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.10"
+DISTRO : "3.1.11"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.10"
+YOCTO_DOC_VERSION : "3.1.11"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.10"
-POKYVERSION : "23.0.10"
+DISTRO_REL_TAG : "yocto-3.1.11"
+POKYVERSION : "23.0.11"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 78f604e2a..70393084c 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -19,6 +19,7 @@
 - :yocto_docs:`3.1.8 Documentation </3.1.8>`
 - :yocto_docs:`3.1.9 Documentation </3.1.9>`
 - :yocto_docs:`3.1.10 Documentation </3.1.10>`
+- :yocto_docs:`3.1.11 Documentation </3.1.11>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index a6432ae9b..fd5541696 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.1.10': '3.1.10',
+    '3.1.11': '3.1.11',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1

