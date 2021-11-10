Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AC5C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 17:09:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.1113.1636564141482913215
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zRJb/Cvx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id h24so2086104pjq.2
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cey6nB65RNnhvOiofhfvUfdTDSrpiYaQbvxww/lE1fk=;
        b=zRJb/CvxxigbX0/ZlJ3H5r1TTQFO7c0d6Taxm4G/2npn13i/PU5x5O8aP8Gl/KbGrU
         CWVVhBqQgByw59gVhLot50diwF5jrQUWhbMmUymuoArYiCqR4kuV2uEDLFYVjceHrrFE
         cQfNzrHjmVefUoNzlPB1irAQZ3h6H/LKcB9jCJibm+AxdjQKfo+4KHzLmjpIYLwDcSJw
         dHYfoA9Iq3JMy7oWD/gzwp8OvNIhAKN+b7tKqHGEdKtGEPsoEL7fcmIPt6KVkXzduceo
         Ac/B3RNg/zh1Lf7XWSmXG0BUG3/YH8rTt1Fqh4MhnjBU8SlhVikR68Qnpby6lDiva9QM
         XznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cey6nB65RNnhvOiofhfvUfdTDSrpiYaQbvxww/lE1fk=;
        b=WdVbkZtiEHFScMcyFR6y+/uUJf7ULC58gprwc1t4aJ3gfRXLjSE2YO05/h+YUll5P9
         GxOQ1oJzMBhlNuyeyK6SUfWW3qZNUDPICaJ6KMmczaD/N8KI/E2a0Ab7yXiSR7/A5itR
         fYiOiFGdTJeNqrCgjVqCHIw7rCbFwOIxk1Ev5nfhBR5isuMZgUcGMXLEIL6MtLa6LN9P
         siBhLQ2+YWMEytpFVT9dGcggz0zFDpwlhX1KHMmtJFTUr90c4stqiFl3BmhOzGNDgIyR
         uolLpewy7ECaLLH9wKrGKn/62Ic7zxMr2h/BYCzYJqrfEzXU9g+A2FpKoApInQtV7I0L
         clwQ==
X-Gm-Message-State: AOAM5327TC7OL2dGNMiR5PFtAlJlNpIXK0mfjO3/24TRR0yUISnDjqRD
	xta4jRWCqrRakl8g0tz27MjNmur/6Nc0cYFPhRI=
X-Google-Smtp-Source: 
 ABdhPJxlUlKFElc1pDm13F0c6aQtW6r75RLrj8ZK5EGHJe7qkDIauP9/kAaGBmTQIJ0/e2QnDtlvTg==
X-Received: by 2002:a17:90b:1e02:: with SMTP id
 pg2mr18776641pjb.148.1636564140522;
        Wed, 10 Nov 2021 09:09:00 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m6sm164595pgc.17.2021.11.10.09.08.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 09:09:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 3/3] documentation: prepare for 3.1.12 release
Date: Wed, 10 Nov 2021 07:08:39 -1000
Message-Id: 
 <c3b650f759d7983db563500d52ad5b68f18728e7.1636564016.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636564016.git.steve@sakoman.com>
References: <cover.1636564016.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 17:09:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2118

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 6f10fc151..6eb284e65 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.11"
+current_version = "3.1.12"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index bda8ff123..af041e373 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.11"
+DISTRO : "3.1.12"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.11"
+YOCTO_DOC_VERSION : "3.1.12"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.11"
-POKYVERSION : "23.0.11"
+DISTRO_REL_TAG : "yocto-3.1.12"
+POKYVERSION : "23.0.12"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 70393084c..60872cca2 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -20,6 +20,7 @@
 - :yocto_docs:`3.1.9 Documentation </3.1.9>`
 - :yocto_docs:`3.1.10 Documentation </3.1.10>`
 - :yocto_docs:`3.1.11 Documentation </3.1.11>`
+- :yocto_docs:`3.1.11 Documentation </3.1.12>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index fd5541696..87160d8ba 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.1.11': '3.1.11',
+    '3.1.12': '3.1.12',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1


