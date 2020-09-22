Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5202.1600770662292172212
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 03:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PrpxYZ9Y;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id x14so16427643wrl.12
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2020 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbkOznhXrEXEipqt46ZqLIYjzFeZWNH5mxol513/ONU=;
        b=PrpxYZ9YFIxIs8SAffa/Be4t6v3ssVpUiUIEET18gXi1ew5XuzOGCuKY3e9R4PsiCh
         HS1wNNe7AYqCDdmxuVW4N1OLsZIguDPjsIRu+qlQQofc5VA5kvE5dr1je0OIjBXEyIqC
         pSeWsvVZzO+re7xEmagrxRf0xoe5d9Oa4yE/qRtf4Xs05/zgGwAAeaR+z+4CmLxvXxuU
         kcWQy8piP+Zyakwe8oGSfUKcaNueyHjQKRvoU+3w3qEBTlJJRBw24I2nqee64nPdHQVt
         twz3YltSNyfT8M/WVUb6n2gRvhFhfaBKei+6JomVJ08loqYsDdm9StNqW8vhagx5Oqji
         Y7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbkOznhXrEXEipqt46ZqLIYjzFeZWNH5mxol513/ONU=;
        b=DyESflWX2AHg+wyD3GS9y0mzY6TLWGkJIX3F0hYUrHrk0TVtPJvOuTqL+YF3eyCdcX
         maICNzzMn7vNZCLv9wyHEwd1CwWtomh5M1X+4insGks6/nqosybUMZn8cVrGr39lu2JC
         E5mjEEISdae/D+XGIYph8iNlAmds1Vct1HznMfrTRSZEYNzkdo6d5+WmcRyv4/BflCBS
         7OwYrqISyme/p9RH9aRdV7yk9Rse0gm8C3lXSEFav/9c71TCi64v9FwnMCBvho8chn8S
         mT1GukIPCYjGrQfCg9HuiepjepfK138KFjqaq91/Rc615uG8img973M+Ah9FNvcxvA1E
         czlg==
X-Gm-Message-State: AOAM533K1WF9KOy9IuB0ZoKb8KZ89xkLh+nkdZ0xbXbukx01DJZhGf8c
	A6g7JmQmSW/soDPcJO88w9dS5jf+/yj+GA==
X-Google-Smtp-Source: ABdhPJwBgwzwotKpZDOWp8Xdwv4W60YzsCjSJyDMlTBxSfWC4HDT7EBOnLZDlDqjLZEGlIveCxptlQ==
X-Received: by 2002:adf:f04c:: with SMTP id t12mr4624122wro.121.1600770660269;
        Tue, 22 Sep 2020 03:31:00 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from localhost.localdomain (82-64-249-211.subs.proxad.net. [82.64.249.211])
        by smtp.gmail.com with ESMTPSA id m185sm4041408wmf.5.2020.09.22.03.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 03:30:59 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Tracey Erway <tracey.m.erway@intel.com>
Subject: [PATCH] sphinx: fix up some trademark and branding issues
Date: Tue, 22 Sep 2020 12:30:49 +0200
Message-Id: <20200922103049.659574-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were required after a review of trademark and
branding guidelines:

1. add (R) to 'Yocto Project' on the top left (above the logo)
2. Fix up the capitalization of the  main page title
3. Add the copyright/legal blurb at the bottom of the page

For 3. it turned out to be simpler to override the whole footer.html
template, and maintain our own version. Also I took the liberty to
remove the 'next' and 'previous' buttons since I believe they are not
especially useful, given the navigation bar on the left side.

Reported-by: Tracey Erway <tracey.m.erway@intel.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/_templates/footer.html | 12 ++++++++++++
 documentation/conf.py                |  2 +-
 documentation/index.rst              |  4 ++--
 3 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 documentation/_templates/footer.html

diff --git a/documentation/_templates/footer.html b/documentation/_templates/footer.html
new file mode 100644
index 000000000..508129ede
--- /dev/null
+++ b/documentation/_templates/footer.html
@@ -0,0 +1,12 @@
+<footer>
+  <hr/>
+  <div role="contentinfo">
+    <p> A Linux Foundation Collaborative Project.
+        <br> All Rights Reserved. Linux Foundation&reg; and Yocto Project&reg; are registered trademarks of the Linux Foundation.
+        <br>Linux&reg; is a registered trademark of Linus Torvalds.
+        <br>&copy; Copyright {{ copyright }}
+        <br>Last updated on {{ last_updated }}
+    </p>
+  </div>
+</footer>
+
diff --git a/documentation/conf.py b/documentation/conf.py
index f2dd2556f..80d5e8e83 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -27,7 +27,7 @@ release = current_version
 
 
 # -- Project information -----------------------------------------------------
-project = 'The Yocto Project'
+project = 'The Yocto Project \xae'
 copyright = '2010-%s, The Linux Foundation' % datetime.datetime.now().year
 author = 'The Linux Foundation'
 
diff --git a/documentation/index.rst b/documentation/index.rst
index 258ecb81a..821316915 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -5,8 +5,8 @@
    You can adapt this file completely to your liking, but it should at least
    contain the root `toctree` directive.
 
-Welcome to The Yocto Project's documentation!
-=============================================
+Welcome to the Yocto Project Documentation
+==========================================
 
 |
 
-- 
2.28.0

