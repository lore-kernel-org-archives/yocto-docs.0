Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.14749.1610479934465414258
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 11:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YILxt2Qw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id my11so1195087pjb.1
        for <docs@lists.yoctoproject.org>; Tue, 12 Jan 2021 11:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Qleyic1JCVxDzXKsBJJ5H6j4AernKH2M2eELT0IBNIU=;
        b=YILxt2Qw544l77tnU79a5LhrZaXzkm7ogSCsXXMyt1Z/2PkMtG9VQFUw7+4Zu0yizZ
         6RKqLdgmE4O9XuVFvfa3/Jp4GtP8QZRdOWhS9lNyWgEL1KxZMmrkvbSnn3Btr3hS67DY
         CEA/Apn6A5IEWvPLFxxS18P/xdvcl6AsYCLsw8dM6Em7NhxdIRRka2wnZC5WUOW/BAqn
         C9VfuuV3EqQTVf0m6oXanBUv/QCNXKIdJDBn0GJBjwrPmLXgt8J9oTgOKXs9On9jZwlf
         nyOC356ccbVYtC8kEtN6mpfofU+DIIysspbmPBK59EK4XFBpBVXqRztH0fplMo9h1ItE
         oWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Qleyic1JCVxDzXKsBJJ5H6j4AernKH2M2eELT0IBNIU=;
        b=L2h5jR9i/ovLJqZa93XwXMjOS4Sx75zs6OPBbBuu48C4VDgM5BfopnVmjuRoov9lAq
         FYMYahoXevV2iQBxWplAb8qDBXdbvX83ISIMgWnmn5Vqta7699xzZGmoknFvEukeGSTg
         WuNEJJvvwNLQJjMk9xCQh9lgiL+1BiJJPJ+tAPKDRlPbjLYWUGw/5/bgW2vtmDvpLhYM
         tjpyyEjLvrzk2b04uIJfeBb38dA28qkvq3DUQnCALgdyYVm6wcMN+Uux0OugM/sDf3L0
         XlAbrjDT6dMjrVyRnxzdFetKvVVdQXztE3NU4lAcNuo6DrNyQIPpM21zCWvy1BVPtwLU
         YszQ==
X-Gm-Message-State: AOAM5305wXqBShyyEsdhDTX7UGSQephhHI+XQ8mGHOMCxBkwsj33Zntz
	Cu0mZ8svAQFHv0J5Qvsnu6kmRe+UCrTvtj1Ke6Q=
X-Google-Smtp-Source: ABdhPJzN0LAheQegmsHdHqGOyvrhLc23z0Ix85Xou4sjIzNwuD9wrwsgACZZirrXQImdJeaD7+J7yg==
X-Received: by 2002:a17:902:be02:b029:da:c6c9:c9db with SMTP id r2-20020a170902be02b02900dac6c9c9dbmr614796pls.69.1610479933326;
        Tue, 12 Jan 2021 11:32:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id t15sm3976455pfc.12.2021.01.12.11.32.11
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 11:32:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: prepare for 3.1.5 release
Date: Tue, 12 Jan 2021 09:31:58 -1000
Message-Id: <77b07d3787bad9d26a079a1573089d3465b19a5e.1610479839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610479839.git.steve@sakoman.com>
References: <cover.1610479839.git.steve@sakoman.com>

Bump the current version to 3.1.5

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py   | 2 +-
 documentation/poky.yaml | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index b6d8073ee..518ebb480 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.4"
+current_version = "3.1.5"
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 9917dc784..71cb29822 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.4"
+DISTRO : "3.1.5"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.4"
+YOCTO_DOC_VERSION : "3.1.5"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.2"
-DISTRO_REL_TAG : "yocto-3.1.4"
-POKYVERSION : "23.0.4"
+DISTRO_REL_TAG : "yocto-3.1.5"
+POKYVERSION : "23.0.5"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.17.1

