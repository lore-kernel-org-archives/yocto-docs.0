Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8D5C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:57:31 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.3157.1642715849906187859
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 13:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BHY0uTfQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id r29so1423963pfl.11
        for <docs@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=itkbO2wysRJNu3GqJx7IDwfgxjfWxnXdHOkxPcFCsYs=;
        b=BHY0uTfQOMp39YLrUVS9BaVsXM86GgTaR26HaB7QBDpbIFjBoH8goR7SgO6+m7arFd
         Zc6y7GtkDtY68Pq9c0JY60rHYCI6d5DojyM3AT/QY2VfJ1iH//KoXH1HRZM7UJzFTgaW
         QlBFB7YN520qY3Bf3Wo4MZYBY19rHEwX9+reFH+UnTj/zadE57+bHarsNxLFvMOTLOOA
         QzIrJdQAPkn7hBx1QxWyOzo5kHjs38FVYPCsekevDpYysmFX6b2nml1BhLEFKnGbtnnH
         /AA9cOOXyPm/fvyBNG+8ovllQR0waA2Hb9rTv5klug/OULx+vzbpl4qQcuVpn6+ASZpi
         Akgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=itkbO2wysRJNu3GqJx7IDwfgxjfWxnXdHOkxPcFCsYs=;
        b=jVZwkNt4wZz1MxukUZfrjJWPDppDZXBVEKBiLXhma6nnoPQBvn4ekNCMAnvSx6aCXx
         7In4BYz12ZeBBbSzJ2yNoW6RlNtPvMzKWKF61ksMpbmMyphPpDk1yUuDcl7SvqW+ZFyt
         XUVL2NN7hf6HN+xBEHeV5PXHmHMgG+jqXX+sY+hIitfuRC7YHwgVxH1F7tzAPTRGuwC2
         nxorhMiE/Jlve965lAc1Kk+PE1Pmw9YhVPLU3upNVP9vKXPpmvMs6VaCFLqrWaFHNtUu
         k1vmOHVRXQI3tIl4VXpiABXIddlIa5SpI3V99aXaEdBAyEoq5XgX5JcUyU4oIbuSc8SX
         k/LQ==
X-Gm-Message-State: AOAM530HUDiuRBBzkIMZPnjbWM8UrRYCvUw3Gt7suChhBAqg83QiBjyy
	4DerF94zlcpq654Kc3UMe86Vl3BMSsl5CJVW6bk=
X-Google-Smtp-Source: 
 ABdhPJxnW+eqammzA89TSyaPsiZp0rF9He1sJE9j4sOVP4H56A5hEzr6J0RrRGpCvAx69KHAX8PvfA==
X-Received: by 2002:a63:86c6:: with SMTP id x189mr638208pgd.20.1642715848782;
        Thu, 20 Jan 2022 13:57:28 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 rm12sm235715pjb.13.2022.01.20.13.57.27
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:57:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/1] documentation: update for 3.1.14 release
Date: Thu, 20 Jan 2022 11:57:18 -1000
Message-Id: 
 <e94c4c7d7103b8af5a332e53afb1e0c5d848695b.1642715781.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642715781.git.steve@sakoman.com>
References: <cover.1642715781.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jan 2022 21:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2441

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 0d61afc9d..01d5e00c1 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.13"
+current_version = "3.1.14"
 bitbake_version = "1.46"
 
 # String used in sidebar
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 8da5f5915..e37ea420a 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.13"
+DISTRO : "3.1.14"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.13"
+YOCTO_DOC_VERSION : "3.1.14"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.13"
-POKYVERSION : "23.0.13"
+DISTRO_REL_TAG : "yocto-3.1.14"
+POKYVERSION : "23.0.14"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 57e4566e1..affe63403 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -39,6 +39,7 @@ Release Series 3.1 (dunfell)
 - :yocto_docs:`3.1.11 Documentation </3.1.11>`
 - :yocto_docs:`3.1.12 Documentation </3.1.12>`
 - :yocto_docs:`3.1.13 Documentation </3.1.13>`
+- :yocto_docs:`3.1.14 Documentation </3.1.14>`
 
 ==========================
  Outdated Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index bda15485c..1d65fa7fa 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -6,7 +6,7 @@
     '3.4.1': '3.4.1',
     '3.3.4': '3.3.4',
     '3.2.4': '3.2.4',
-    '3.1.13': '3.1.13',
+    '3.1.14': '3.1.14',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1


