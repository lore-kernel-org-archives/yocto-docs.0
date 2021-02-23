Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.520.1614105103205401732
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Feb 2021 10:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Oya42uiS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.176, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f176.google.com with SMTP id k22so10356016pll.6
        for <docs@lists.yoctoproject.org>; Tue, 23 Feb 2021 10:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VitTWdCVuHq/ihg7god8fN4eip8a0GP+XFZ00nSjalM=;
        b=Oya42uiSgJljQEhhoYZTVwwZhyGTj85Xbng54QTuJGskkKgNh0xpRZFByTdl4S93qe
         uxh0qIzwVU1wP8TUOLhV+Ukk80XGS/l1lw778NcjMps+YxRXzwukxo7wH5VdX/KISDfD
         c+szZx/C3WnrO3kjICVXtLaljlMb6ASMbvAkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VitTWdCVuHq/ihg7god8fN4eip8a0GP+XFZ00nSjalM=;
        b=JiuvOE1lwtaVx46XHqd4X+GYRjTW5waFCcArKjt7/5kS7P+lcqTjwF4yThOusbxlVW
         Oh9B9dwqowce06VSWDefz/rX+lri4Tg7KUatCHgwSFtjKG02uFT7UZ3sWaAul8m18uWA
         AANmDoiVuASXoYdN1zP8rhN0ZuQR3cRb4r1wfnVb4rwuS4UXcn8UPZOnLmFWLtBOOwaY
         HQ3ngFqpGS2ttm8CkRQE5sRxz/BIxTayZmKvZso7LzRp2RRcf4/rpplGxK07PuJkomwe
         goS9Icz+SJRjQ6q3jbDstbRjLsVKecQ1QzH7zDXVfKTzsdd6puGian3D0yVoDZgUsRlH
         6Yaw==
X-Gm-Message-State: AOAM531AcEGmdognTX8/GOeTn4uSnULQL+ye9cL9kYIWjJ61Ov0UlcUL
	ftqHIipUagkM8gjVI73mJfK48QVv3SuQFg==
X-Google-Smtp-Source: ABdhPJxzKQ3G9c/Gcp2a/PQOi1TaDFautJkSgkn7Isb5PL76XlefN9RF67mfCsUetddtqGtuBgVFOQ==
X-Received: by 2002:a17:902:d48f:b029:e3:fb7d:1fb1 with SMTP id c15-20020a170902d48fb02900e3fb7d1fb1mr3735853plg.83.1614105102167;
        Tue, 23 Feb 2021 10:31:42 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id v7sm23978310pfv.93.2021.02.23.10.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:31:41 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.2.2
Date: Tue, 23 Feb 2021 10:31:28 -0800
Message-Id: <20210223183128.225826-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 697c7b38d..8d189b5da 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.2.1"
+DISTRO : "3.2.2"
 DISTRO_NAME_NO_CAP : "gatesgarth"
 DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.2.1"
+YOCTO_DOC_VERSION : "3.2.2"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.1.5"
-DISTRO_REL_TAG : "yocto-3.2.1"
-POKYVERSION : "24.0.1"
+DISTRO_REL_TAG : "yocto-3.2.2"
+POKYVERSION : "24.0.2"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index e2ee3b087..74011d550 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -10,6 +10,7 @@
 
 - :yocto_docs:`3.2 Documentation </3.2>`
 - :yocto_docs:`3.2.1 Documentation </3.2.1>`
+- :yocto_docs:`3.2.2 Documentation </3.2.2>`
 
 ****************************
 3.1 'dunfell' Release Series
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index a997489aa..47dee6b04 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.2.1': '3.2.1',
+    '3.2.2': '3.2.2',
     '3.1.5': '3.1.5',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
-- 
2.29.2

