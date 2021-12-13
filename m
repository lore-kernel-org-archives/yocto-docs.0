Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6350C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:24:24 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.12339.1639409063900793411
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 07:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RpQOTNUy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id v23so12078565pjr.5
        for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A34YZt3ajwyxIk3h5F582CfBsDwMTeHLO2THOIUT0OA=;
        b=RpQOTNUyf5P38YlfwjB/c0oeWcMP3+lJON9zG0fvHthFj2aZwOaofBBDCCC/thWDel
         iYNeFyRPOriu3cP1KxtgBQl0lMAm+xNsl8nH5lXpnNdSqagJyaGFCJ+LcGF04//725uo
         MmyYs3b65LHTb6dqg9QuQYpfY24HMFfalcmAqojsY4YjOBgAvZFgx6rSqZJO02a3KGak
         Y0VPY9ii5MCatgLZQicN5fAwi2sHZn+ZCNGWqfqJ326JabKchwRqKmD+DAtL+ov4b3mT
         ED7RXqNbmYXfIq4EZ4716Zh0UXOUWpI+KQcAfponyhO43z3mEOQ9BBDJ7Hk9rrG9kgxJ
         E85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A34YZt3ajwyxIk3h5F582CfBsDwMTeHLO2THOIUT0OA=;
        b=UPwGGY1KeD+4vzgG/gSey8GuXXd9PjXudbtoKgTlELE1jskPnN4CNg8UU+BzOHGpJK
         zk9vjo1UqAcYQRodS+4/izlNsYxJuAaIAXfBAUz3PV7KfcKQ52x4eGOGbjjxKnD1mEF2
         MVAMBMGe0zfexj009QN1EUwY1dZv8++iPQKik9GIJOvTJT2d5PK+burtsRe5AKO7gg1V
         WMXjiEnbxvjt2f2byW5QEx8UVmVAKdw6hpY/XYCDFtPRrRPaCKSQXqM1bVfH5AFUUzXz
         C8gx9NpGT5JpgkEde90Vk/R0nKTNyBV6AC+urWH8YrePNdyKvRMEXM1Qg6DICalDdMQR
         tl5A==
X-Gm-Message-State: AOAM532lpSAX1Zcondjbes5b2YTaIIraGMfEAa7HfvIYfY87iEkVzAtM
	MeQHdx2jrMoDttUmgT4M5AfbO4ju3E3NcyYk
X-Google-Smtp-Source: 
 ABdhPJyCY4V4GPfFCxy12hf0zv2rIl0YmLK68XlTH/Fst69F95pAmXDTzM8A7T5WoTYuKpVzkxXFBQ==
X-Received: by 2002:a17:90b:4d85:: with SMTP id
 oj5mr44507735pjb.188.1639409062616;
        Mon, 13 Dec 2021 07:24:22 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o6sm12705128pfh.70.2021.12.13.07.24.20
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:24:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/1] documentation: prepare for 3.1.13 release
Date: Mon, 13 Dec 2021 05:24:05 -1000
Message-Id: 
 <ab25582a2b64f294bc397894113a3438b48ad544.1639408799.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639408799.git.steve@sakoman.com>
References: <cover.1639408799.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 15:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2244

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 0790b50a7..0d61afc9d 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.12"
+current_version = "3.1.13"
 bitbake_version = "1.46"
 
 # String used in sidebar
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index af041e373..ec0ecadb1 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.12"
+DISTRO : "3.1.13"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.12"
+YOCTO_DOC_VERSION : "3.1.13"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.12"
-POKYVERSION : "23.0.12"
+DISTRO_REL_TAG : "yocto-3.1.13"
+POKYVERSION : "23.0.13"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 3e27406ea..50803e383 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -21,6 +21,7 @@
 - :yocto_docs:`3.1.10 Documentation </3.1.10>`
 - :yocto_docs:`3.1.11 Documentation </3.1.11>`
 - :yocto_docs:`3.1.12 Documentation </3.1.12>`
+- :yocto_docs:`3.1.13 Documentation </3.1.13>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 87160d8ba..65e4d261f 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.1.12': '3.1.12',
+    '3.1.13': '3.1.13',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1


