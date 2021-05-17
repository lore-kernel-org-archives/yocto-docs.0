Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.64.1621288841552273256
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 15:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=To5K/fPq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.173, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f173.google.com with SMTP id f22so4628017pgb.9
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c/8mRiIK2gNesFKYL2qWpwKg9F/qominzafd6QbwiXo=;
        b=To5K/fPqSF28fTVrjstMtyrbgmM7nz+W9uoX+JicwzNyGLZiHRftGbQ/iSNl1CQQv+
         gl67BUdllmNf4KJsli+Kic1Z5jWurJ0mWOACvmVGfmk7zm0myfHI6xZAuJP6niEA39wJ
         JKRZHu6loqi3H56VpwSuIvEHd8P1RpAweErvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c/8mRiIK2gNesFKYL2qWpwKg9F/qominzafd6QbwiXo=;
        b=bfaJ94w4/whX37Ar9+By8fh+fbvRXJmNsFtkPQW0BmO7WE15d4Vj7eyYbCxsINp1I/
         4lsZ4oqjqBpT0mCuafE4hPLrZBYLrzdE+j3vltc1kEF4qqaQJMGgHgZ2OAjGwnxke1n9
         U4lxUdDURHuLYJyPqArXpFL2tx+Esta9j7a1vDFcZ6J3g5X945VSLKAkrx/BZeAKXbEv
         +oXtV1q6IlTH8Bcz+k/CoMwZu10e/vmPhSwyk1I8k1S2fzXAAbeZUyBGwzHUI6WNr9Cf
         0cVR6j3OtXTytASTW/C/PFob1/VRKjqeln+cuzCqLpzVLOVVjFffSAumGvCRWge3B1Sz
         EQjA==
X-Gm-Message-State: AOAM5325t9776LRSzS5xJVG9KGxi8KveARiI7rPddzqm2g3Y2MIySVjS
	DVTiywNiEUqB1sRwyXLndlIeZVtjZblg2Q==
X-Google-Smtp-Source: ABdhPJwpnIL4jxp9pfF1IbjXU5iSb7J8HFdn44te0PAwkGFkjLQsilyui6rQEEdRQgLCyzYLE9I+7Q==
X-Received: by 2002:a62:60c2:0:b029:2cb:70a7:a8ce with SMTP id u185-20020a6260c20000b02902cb70a7a8cemr1757174pfb.77.1621288840449;
        Mon, 17 May 2021 15:00:40 -0700 (PDT)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id i197sm10823940pgc.13.2021.05.17.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:00:39 -0700 (PDT)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] releases: update to include 3.2.4
Date: Mon, 17 May 2021 15:00:31 -0700
Message-Id: <20210517220031.40908-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    Adding 3.2.4 to documentation switcher and release list.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml                  | 2 +-
 documentation/releases.rst               | 1 +
 documentation/sphinx-static/switchers.js | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 22706a0fb..c9b87de47 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -4,7 +4,7 @@ DISTRO_NAME : "Hardknott"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "gatesgarth"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.3"
-YOCTO_DOC_VERSION_MINUS_ONE : "3.2.3"
+YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
 DISTRO_REL_TAG : "yocto-3.3"
 POKYVERSION : "25.0.0"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
diff --git a/documentation/releases.rst b/documentation/releases.rst
index b95a6edf5..39722671c 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -18,6 +18,7 @@
 - :yocto_docs:`3.2.1 Documentation </3.2.1>`
 - :yocto_docs:`3.2.2 Documentation </3.2.2>`
 - :yocto_docs:`3.2.3 Documentation </3.2.3>`
+- :yocto_docs:`3.2.4 Documentation </3.2.4>`
 
 ****************************
 3.1 'dunfell' Release Series
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
index 3f62e29b9..0e68ad3c9 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -4,7 +4,7 @@
   var all_versions = {
     'dev': 'dev (3.4)',
     '3.3': '3.3',
-    '3.2.3': '3.2.3',
+    '3.2.4': '3.2.4',
     '3.1.7': '3.1.7',
     '3.0.4': '3.0.4',
     '2.7.4': '2.7.4',
-- 
2.31.1

