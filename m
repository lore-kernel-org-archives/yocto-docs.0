Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.14778.1614367981612842339
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Feb 2021 11:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJyMliQM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.182, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pf1-f182.google.com with SMTP id t29so6912235pfg.11
        for <docs@lists.yoctoproject.org>; Fri, 26 Feb 2021 11:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dtaN9pTIoryVZFNH2MGhJVydM8x8xnleLWE8kjh0lcM=;
        b=NJyMliQMuAWv01rfvx19I3oc70nmSqT737nmf0Gujsnhzy55tBh3frJV1uEujB9LBd
         hHcCnCJfZkVee6DbF1Cb76tAEJeDQYdzWbVgbbM9xcpW3q182gNs2jCYZALZmB7dJY6c
         K3awYtRPv4JiDuaR5Ut0jWlt75jMtTe+DR7EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dtaN9pTIoryVZFNH2MGhJVydM8x8xnleLWE8kjh0lcM=;
        b=rNE6FcvHsbFrZC60VTZfOsGRc/Azq+wr51DMu6H0p8db1SIQd0FZSwSrqH5AWouH59
         OkXsyOXztBg/dukD7+/VoxlD0hwgMCNRek8Uw/x2gg4iPvAtbXsyAkZ/Qbx1JM1AgOht
         ZyESrUfEiq5k138lVuBggpSzKmsheKcAjkk3xfRJEsdzGL8ApcPp6+j9s5CLp+SezT4a
         CjhO93wF9bukGJrF/QwmOl2SxvLjpYHl7gaNhtcrcid3jK5TPwTqL+LZOTiaHiYSdXoU
         YarXt9MbHeFywJsVO75CvSOw1bk41iCjDgIosMjLG1F+398IL18sXzuq0cM3QU32lc+X
         uFqQ==
X-Gm-Message-State: AOAM531FSsGw2OP1XA/jqTUwx2Omo6MswYI4sKCA3K1bA0b6OXpz8yjH
	paR4ijCcrxJDFWr+nwT9k28tATXMl1uE8w==
X-Google-Smtp-Source: ABdhPJz2QuxPZX+anniLW1z21ORbNtdBrt4gZUTBh5jEJi37AFday9MBp8N09vNd51e1u/2hP+h18w==
X-Received: by 2002:a65:458e:: with SMTP id o14mr4207795pgq.444.1614367980610;
        Fri, 26 Feb 2021 11:33:00 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id j15sm10133547pjg.40.2021.02.26.11.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:33:00 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: rpurdie@linuxfoundation.org,
	nicolas.dechesne@linaro.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.1.6
Date: Fri, 26 Feb 2021 11:32:56 -0800
Message-Id: <20210226193256.175451-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 2 +-
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 8d189b5da..3c30c4430 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -4,7 +4,7 @@ DISTRO_NAME : "Gatesgarth"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.2.2"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.1.5"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
 DISTRO_REL_TAG : "yocto-3.2.2"
 POKYVERSION : "24.0.2"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 74011d550..c4865253f 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -22,6 +22,7 @@
 - :yocto_docs:`3.1.3 Documentation </3.1.3>`
 - :yocto_docs:`3.1.4 Documentation </3.1.4>`
 - :yocto_docs:`3.1.5 Documentation </3.1.5>`
+- :yocto_docs:`3.1.6 Documentation </3.1.6>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 47dee6b04..a7c348a7b 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -4,7 +4,7 @@
   var all_versions = {
     'dev': 'dev (3.3)',
     '3.2.2': '3.2.2',
-    '3.1.5': '3.1.5',
+    '3.1.6': '3.1.6',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.29.2

