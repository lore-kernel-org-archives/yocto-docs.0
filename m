Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.23580.1617402629646112736
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 15:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VN1Qrh+T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.54, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f54.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso3139786pjh.2
        for <docs@lists.yoctoproject.org>; Fri, 02 Apr 2021 15:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3KtKKS1jL4G6kcUr41GuAZRKWEb84/nxfnz+e0O7JWM=;
        b=VN1Qrh+T2sGBOmnt33rvQA9yi1E5cmwYEyqnUYjH9N9QPz71OaOmiougE0DkDc6SXs
         JD2NKN/bBiPr2+LZt0WH1ynlOyJthqht3e4s1Ve8D9AelD2q1KpvrMc7rHeOPXjZAPbW
         OeoqOY13bqq6qCELBmxapL76sTVJMrM75M8Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3KtKKS1jL4G6kcUr41GuAZRKWEb84/nxfnz+e0O7JWM=;
        b=lW7+zF/3GQ2nu45eDyEpnDzwGrZPOXPVd1ym1bv3BLPSFESOMbML0Ignc7XdATS57L
         ZXJAL+DkV07EH2QTsVIoA+2R/Bv84voTYAhbsSAOeWkuoCmR82PiI+HID45JjfEFb4jU
         13qFkCQ8U2y6ihK2NOVRsbHM4BYdt4UPxmNFz9o5vJV8/IunLWt5fy4w0nw4VlOnOqc2
         LKvHDraWhc6x3RHWNEs9LbEG5yq4d0afb4BeQbQexMSzHYqz/vwQQoFxItB8t8nx2kz5
         lsxQkl8GNcKueiUXJ1UY46X/KEetThQX60NdKxUH7vHTOUnJ6XCgrV4u7QAJHvPi+coc
         OCEA==
X-Gm-Message-State: AOAM530gTh5ZEoo+oyxfK3yQLc24KYJzvJ4hoQMPke5xBDHI9R1k0i4K
	u8fzmwxJVqhteNttdSnf5R5Pl4nxldPygw==
X-Google-Smtp-Source: ABdhPJw0r9Rf1uFa8X/bmEcy5Boj5TvKfmkippOlJ6awxg0/FL119rYL3pXJ/89LNzGZn9YlRCF16g==
X-Received: by 2002:a17:902:d78a:b029:e6:e1f:f695 with SMTP id z10-20020a170902d78ab02900e60e1ff695mr14184320ply.82.1617402628698;
        Fri, 02 Apr 2021 15:30:28 -0700 (PDT)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id n2sm8541614pga.57.2021.04.02.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:30:26 -0700 (PDT)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.2.3
Date: Fri,  2 Apr 2021 15:30:11 -0700
Message-Id: <20210402223011.309701-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updating to build 3.2.3 docs and add missing 3.0.4 release line.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 6 +++---
 documentation/releases.rst               | 2 ++
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 3c30c4430..de264c963 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.2.2"
+DISTRO : "3.2.3"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.2.2"
+YOCTO_DOC_VERSION : "3.2.3"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
 DISTRO_REL_TAG : "yocto-3.2.2"
-POKYVERSION : "24.0.2"
+POKYVERSION : "24.0.3"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index c4865253f..6a65b9fb3 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -11,6 +11,7 @@
 - :yocto_docs:`3.2 Documentation </3.2>`
 - :yocto_docs:`3.2.1 Documentation </3.2.1>`
 - :yocto_docs:`3.2.2 Documentation </3.2.2>`
+- :yocto_docs:`3.2.3 Documentation </3.2.3>`
 
 ****************************
 3.1 'dunfell' Release Series
@@ -36,6 +37,7 @@
 - :yocto_docs:`3.0.1 Documentation </3.0.1>`
 - :yocto_docs:`3.0.2 Documentation </3.0.2>`
 - :yocto_docs:`3.0.3 Documentation </3.0.3>`
+- :yocto_docs:`3.0.4 Documentation </3.0.4>`
 
 ****************************
 2.7 'warrior' Release Series
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index a7c348a7b..7a4edc9e7 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.2.2': '3.2.2',
+    '3.2.3': '3.2.3',
     '3.1.6': '3.1.6',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
-- 
2.30.2

