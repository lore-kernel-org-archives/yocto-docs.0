Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.1927.1621894902994790814
 for <docs@lists.yoctoproject.org>;
 Mon, 24 May 2021 15:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RvvfIHGa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.171, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f171.google.com with SMTP id m190so21156359pga.2
        for <docs@lists.yoctoproject.org>; Mon, 24 May 2021 15:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOVzwHZGy6ZCp2hI7+s1q9Rm/gVK5F5x20N4VK+HwHI=;
        b=RvvfIHGaAEdqrtTfVNtaQeb1i3WjJzhMO+xD/7lda/Se5hOY3ex7nuYkfGK5S6HR5Z
         l79NNaXa5rYYPsD9uWb5UDp318TYVXCZzTKPM57B/Mc9SbOXj2aAeGbxUtr+nQfBvfrB
         AfXKqPFO+T5ijwup0U5zDBGEkuoDdtFd/8FR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOVzwHZGy6ZCp2hI7+s1q9Rm/gVK5F5x20N4VK+HwHI=;
        b=VCi0UHlrvJc3lCN6EVxYrPf5d1POwYhRZy7wDpe8xpx82d2xrlo866kxpR434kWv3O
         dBPvq3mXQpcRmzYOZZuR5nQGzQAAAAkYL3Vd+BYlw0pfahKxfXOoe0fWB+ie6LKYgZtN
         wHDuVqflZWH9KFhs1taQKL5v3ZIUIZaw7ErDjaOON1DXyvWC5nxj75UjnAAGE0Tl5vpS
         jgpSUKhyns8SDf7o6fzTeu+qPN6z5H71uWP4M92OY6oUa+l59Wi8JnyZ5GAAzNJjtUB3
         HwEij9ePmeuKkc5Ql20CC50Kz3XcV2HMqLyGEQoYtjclMKpqdf7jPmrH9M3P6/T9+KAP
         tFfw==
X-Gm-Message-State: AOAM5315IcOWMfJ5B2fLUDEd0XPWtEr4s130NzkJNSJJLCD5KHwLER9H
	W4F1Epu6aESqyPdwTQ8us48TcaMAbwWceA==
X-Google-Smtp-Source: ABdhPJzxnC8cshD8xHTBa5ZwpKQZfvYa91nnHl7f5RlWfaJa8khK5UXUWsQVeiClmWYYPFmAmB9cJw==
X-Received: by 2002:a63:465f:: with SMTP id v31mr15811508pgk.6.1621894901993;
        Mon, 24 May 2021 15:21:41 -0700 (PDT)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id b1sm13583412pgf.84.2021.05.24.15.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 15:21:41 -0700 (PDT)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.3.1
Date: Mon, 24 May 2021 15:21:36 -0700
Message-Id: <20210524222136.696844-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding 3.3.1 to documentation switcher and release list.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 0bae76f1b..3bfc35b6f 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,12 +1,12 @@
-DISTRO : "3.3"
+DISTRO : "3.3.1"
 DISTRO_NAME_NO_CAP : "hardknott"
 DISTRO_NAME : "Hardknott"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "3.3"
+YOCTO_DOC_VERSION : "3.3.1"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
-DISTRO_REL_TAG : "yocto-3.3"
-POKYVERSION : "25.0.0"
+DISTRO_REL_TAG : "yocto-3.3.1"
+POKYVERSION : "25.0.1"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 39722671c..f278e2159 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -9,6 +9,7 @@
 *******************************
 
 - :yocto_docs:`3.3 Documentation </3.3>`
+- :yocto_docs:`3.3.1 Documentation </3.3.1>`
 
 *******************************
 3.2 'gatesgarth' Release Series
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 0e68ad3c9..a32d87236 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.4)',
-    '3.3': '3.3',
+    '3.3.1': '3.3.1',
     '3.2.4': '3.2.4',
     '3.1.7': '3.1.7',
     '3.0.4': '3.0.4',
-- 
2.31.1

