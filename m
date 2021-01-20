Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.34923.1611178841886924642
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 13:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PpAYm3hD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.172, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f172.google.com with SMTP id e9so9096371plh.3
        for <docs@lists.yoctoproject.org>; Wed, 20 Jan 2021 13:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IElZOSVMa2aUVafBsi8kDsk6AQuNLCyTe0Y94wqTHOY=;
        b=PpAYm3hDkD2YozbFyxKFdPUkAxdpjmb+qCftDJLuO7cPImOyIyyZJAsBhQ9H0zDtE5
         qQVvvbEDAZoUtO+BS6swwfEZKngORYQq0zjPPXTc7npzgj/6JUTcXPAFELtDAIiHFcRU
         Ks+JT8SOSoPZ+JgUwchdKrKDGCsjMGVBc+Ch0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IElZOSVMa2aUVafBsi8kDsk6AQuNLCyTe0Y94wqTHOY=;
        b=X+7wwY2ambF+01yPTnLIDAQTkmmyDJRLAAAAsM3BO8AUMZ+OkhSBtSQHoasBtWzyyB
         BYeJirLdotRKcYx5ioQcOBbOfUMZoOeUOLqOEQrF4f9VzXddDUy6/lMpzXE5o7150g5G
         2qDkZiBohaeQ34Ynum7pxf7/9i4Btu8dCHm1JDcV2zIBirEvFDV2/GrmcfMoiBnu9sJ1
         aab2D51vXDzi0ABaYY1dzOe4OKfAf3NyS1hXKvcxr4mTNxImvqYSjWw9I0bvHSNAzcZn
         ypEF+T577gvOZ4iK7PxgL7m5jOzzgIBiucctxgTithPCVUEN9hHRNIHPabx5tu0DcY7E
         cHvQ==
X-Gm-Message-State: AOAM533A0DC+ZAKQfNDG1wfFktW+ZNXYjUDgh6Obzo9HEsvDTC0ULZdo
	4F5MfcMFUz6gSAjMes+rvyR1+zbFg6jrd93fM8s=
X-Google-Smtp-Source: ABdhPJz3/EgJ5MjWbCbNCgLvBWRV3FY9raP8n6pidVCZ2N5ORNu4MsAzPGMqe0bG2C1rmIzXdMx0NA==
X-Received: by 2002:a17:902:ee02:b029:db:c0d6:57f9 with SMTP id z2-20020a170902ee02b02900dbc0d657f9mr11694745plb.65.1611178840910;
        Wed, 20 Jan 2021 13:40:40 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org ([156.146.48.217])
        by smtp.gmail.com with ESMTPSA id e21sm3148259pgv.74.2021.01.20.13.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:40:40 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: conf: add link to 3.1.5, update to include 3.2.1 & 3.1.5
Date: Wed, 20 Jan 2021 13:38:23 -0800
Message-Id: <20210120213823.262616-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 10 +++++-----
 documentation/releases.rst               |  1 +
 documentation/sphinx-static/switchers.js |  2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index c1340c25e..697c7b38d 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.2"
+DISTRO : "3.2.1"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.2"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.4"
-DISTRO_REL_TAG : "yocto-3.2"
-POKYVERSION : "24.0.0"
+YOCTO_DOC_VERSION : "3.2.1"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.5"
+DISTRO_REL_TAG : "yocto-3.2.1"
+POKYVERSION : "24.0.1"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index b40907202..e2ee3b087 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -20,6 +20,7 @@
 - :yocto_docs:`3.1.2 Documentation </3.1.2>`
 - :yocto_docs:`3.1.3 Documentation </3.1.3>`
 - :yocto_docs:`3.1.4 Documentation </3.1.4>`
+- :yocto_docs:`3.1.5 Documentation </3.1.5>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 754de2e6a..a997489aa 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -4,7 +4,7 @@
   var all_versions = {
     'dev': 'dev (3.3)',
     '3.2.1': '3.2.1',
-    '3.1.4': '3.1.4',
+    '3.1.5': '3.1.5',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.29.2

