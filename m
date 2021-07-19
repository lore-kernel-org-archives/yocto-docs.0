Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.449.1626713224422792443
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Jul 2021 09:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d7x/v6Aj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id y17so19540876pgf.12
        for <docs@lists.yoctoproject.org>; Mon, 19 Jul 2021 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=du5jkmIUMLugh7Wara4TR43nLylptM2cCevq2anKemg=;
        b=d7x/v6AjpEsSBNmJbt3n+YyypSW/0VI7IqTsJHaIfoe3tuZplMlBfrwe2ref6ZvmVi
         GWKg5foYm+KFGadY1G1VSSUQNFSnVj6aIP9qkzYUhrG+9NC88fd91it/fFgn2zP3uz8w
         /3lhNxW5qKJRNWn7FLxDb4mOhmluDLNd1VBMRRS1/IZnAQ3E8BRfFfL9B3hiIWKWq9gB
         2TGsWsTR4KEbiY8z8O67Xw+16O6xMKJb0F2VDC6MU1GvzsxXDYniImEVSTqJJR2ahDai
         KgJ8tv++zaQzyJBIhTL84CmkOTxpzUqBt+CSXVBIP913ldfb3cRtlInIVaKATXgdjRFx
         komg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=du5jkmIUMLugh7Wara4TR43nLylptM2cCevq2anKemg=;
        b=OWGulODCd2PnjT0vG8R/jGRd3IJOxTr8TABdAK7RvVtIJYumLZ2nVepRlVNZQ7smSd
         S8oQDeBsdvViw0kjln7I8OnZn+6qOlpRYgWGScundnib/sx+X3XCW1XkMABa2M35adto
         14Aq+jjCYyLQGqT3MoFVjrypdgyMN6wJ28mORLS54q7ahnJnrTzJT46NYZ8nHen7W81j
         mK4iDMDHV+ZkW+2CCEr8Y8DdPzPuDmxaxqBioowliNBCUzytrfu9ohBlB3+kHLWMZdVG
         qqTGPwo2JlYfJppf3giF0bzgPB6hDAXCRrdKkyFIX8EL8xaex7ocJ/0hdfKJhEVY0/Ch
         hoHw==
X-Gm-Message-State: AOAM530L8wQtNMA01T5XCrzll+jRCCPugOVawQPi/ZcxG5og//HRlno2
	7goaESB9e4d1L67eQGCNIc0ECWYnOqXlTQjl
X-Google-Smtp-Source: ABdhPJyc08YckX4yQqFh1rf9LxeS+NXJPiG7RYb/uD9MtNWscTVwfWiPBwEjKu8z8ZTce13GTEdxOg==
X-Received: by 2002:a05:6a00:1508:b029:332:3aab:d842 with SMTP id q8-20020a056a001508b02903323aabd842mr26838138pfu.59.1626713223547;
        Mon, 19 Jul 2021 09:47:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d15sm20066092pfl.82.2021.07.19.09.47.02
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 09:47:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: prepare for 3.1.10 release
Date: Mon, 19 Jul 2021 06:46:54 -1000
Message-Id: <180d5fcb893e8b2ebcd779d1b07f5c9e8e1bceca.1626713143.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626713143.git.steve@sakoman.com>
References: <cover.1626713143.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 3 ++-
 documentation/sphinx-static/switchers.js | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 99bf4b364..82fa32554 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.9"
+current_version = "3.1.10"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 999779e7c..590af46eb 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.9"
+DISTRO : "3.1.10"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.9"
+YOCTO_DOC_VERSION : "3.1.10"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.9"
-POKYVERSION : "23.0.9"
+DISTRO_REL_TAG : "yocto-3.1.10"
+POKYVERSION : "23.0.10"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index e272cdc72..78f604e2a 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -16,8 +16,9 @@
 - :yocto_docs:`3.1.5 Documentation </3.1.5>`
 - :yocto_docs:`3.1.6 Documentation </3.1.6>`
 - :yocto_docs:`3.1.7 Documentation </3.1.7>`
-- :yocto_docs:`3.1.7 Documentation </3.1.8>`
+- :yocto_docs:`3.1.8 Documentation </3.1.8>`
 - :yocto_docs:`3.1.9 Documentation </3.1.9>`
+- :yocto_docs:`3.1.10 Documentation </3.1.10>`
 
 ==========================
  Previous Release Manuals
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 06d4a8709..a6432ae9b 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -3,7 +3,7 @@
 
   var all_versions = {
     'dev': 'dev (3.3)',
-    '3.1.9': '3.1.9',
+    '3.1.10': '3.1.10',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
   };
-- 
2.25.1

