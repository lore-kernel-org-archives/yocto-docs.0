Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.1170.1616695963155997145
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 11:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=saw7dvS3;
 spf=pass (domain: linaro.org, ip: 209.85.128.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f41.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso3630581wmq.1
        for <docs@lists.yoctoproject.org>; Thu, 25 Mar 2021 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=otS5GJjAT+2ows4APZb/Dpz2aNuIs69lHbZZyhxzEYU=;
        b=saw7dvS3BtmBx46py1SK6rVbGnfzOvij4aAR0WLh2xd37C1QMpvyNWDO10yZQ1C8i4
         +g2O9Sj4wwzbWKCJJ/FFJ9/pU9j3FAq4XaLmKVgpnDxV7cYTc40kBigTupmpOmyQCawx
         g43/YXgXU1pO53xk/cLFVkO9IF46EYKVr3E0Ycq31CwEyFtPmTWPMgFVPDdmsV8ncyhq
         YOvSrx2p3uJIoGjYC8I9Ni+Pb0xz2mhqTuMdLqIxC7yQsIfei/FCiuJV7nm3PctcBwgx
         gT4sx9caYoBAe6OttXie/1jYW2Y9yS+acz+CD9j2rM1dCJ1zJIL/wrT/shC4ZMu7Uh8L
         A9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=otS5GJjAT+2ows4APZb/Dpz2aNuIs69lHbZZyhxzEYU=;
        b=ImL/qSetRRSUbeGukg20Q51Pm+23tq/w6UcdaQXccPKUq2gbZZEHz6do2SY8Kj8hIf
         TrKAXogXHsYGo+2IEL1ZHg3nmWYEkH6OGxF+CqwGU41Jh5ywGkphWqMyS/wamYm8anv8
         XdwIZTnRDML83GqkD/rZwSk1KuJ4mz8aJGCqfJdFKSMTDgMwun5y3I1OP+nCs8lV2MAs
         I2KGWpwyBzHzhpHqkaiuRqlPus5Xh2dOf7ZCC5WYR+SO5BUPBbdzkXRbUye9Kt9dCJ86
         LhJXuDJfQCeOFOVBM3kN6wvGqnx/dZpJvUP/r5wC5qBO/5PwgaRLEGOTceATIHV2CJQ2
         0Zag==
X-Gm-Message-State: AOAM530cKFVuB+fXaGuOilKTbSG+eInGIFeWfdiDL1lzdfbQBNFj61aR
	xUCpmIbYlkdlj5Szt7OwK0Rvog==
X-Google-Smtp-Source: ABdhPJzjA6aMn6O3xGQTx7IuJJVm66ogp7IY+OUwtCKJ/bLsuubBE07dAkxFl1A0/7egDY+rXbHLTQ==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr9205280wmj.122.1616695961276;
        Thu, 25 Mar 2021 11:12:41 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:bf7c:ed85:7b13:75ef])
        by smtp.gmail.com with ESMTPSA id c16sm9383506wrs.81.2021.03.25.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 11:12:40 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: yocto@lists.yoctoproject.org,
	richard.purdie@linuxfoundation.org
Cc: docs@lists.yoctoproject.org,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/2] scripts/run-docs-build: add for loop when publishing tags/branches
Date: Thu, 25 Mar 2021 19:12:10 +0100
Message-Id: <20210325181211.59332-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use for loop to avoid repeating the same pattern over and over.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/run-docs-build | 72 ++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 45 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 79b1edc..e8e081c 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -33,17 +33,14 @@ make publish
 mkdir $outputdir/bitbake/next
 cp -r ./_build/final/* $outputdir/bitbake/next
 
-git checkout 1.48
-make clean
-make publish
-mkdir $outputdir/bitbake/1.48
-cp -r ./_build/final/* $outputdir/bitbake/1.48
-
-git checkout 1.46
-make clean
-make publish
-mkdir $outputdir/bitbake/1.46
-cp -r ./_build/final/* $outputdir/bitbake/1.46
+# stable branches
+for branch in 1.46 1.48; do
+    git checkout $branch
+    make clean
+    make publish
+    mkdir $outputdir/bitbake/$branch
+    cp -r ./_build/final/* $outputdir/bitbake/$branch
+done
 
 # only sync bitbake folder for now. We need bitbake to be published first
 # since the bitbake intersphinx index will be downloaded to build yocto-docs
@@ -69,40 +66,25 @@ make publish
 mkdir $outputdir/next
 cp -r ./_build/final/* $outputdir/next
 
-cd $ypdocs
-git checkout gatesgarth
-make clean
-make publish
-mkdir $outputdir/gatesgarth
-cp -r ./_build/final/* $outputdir/gatesgarth
-
-cd $ypdocs
-git checkout dunfell
-make clean
-make publish
-mkdir $outputdir/dunfell
-cp -r ./_build/final/* $outputdir/dunfell
-
-cd $ypdocs
-git checkout yocto-3.2.1
-make clean
-make publish
-mkdir $outputdir/3.2.1
-cp -r ./_build/final/* $outputdir/3.2.1
-
-cd $ypdocs
-git checkout yocto-3.2
-make clean
-make publish
-mkdir $outputdir/3.2
-cp -r ./_build/final/* $outputdir/3.2
-
-cd $ypdocs
-git checkout yocto-3.1.5
-make clean
-make publish
-mkdir $outputdir/3.1.5
-cp -r ./_build/final/* $outputdir/3.1.5
+# stable branches
+for branch in dunfell gatesgarth; do
+    cd $ypdocs
+    git checkout $branch
+    make clean
+    make publish
+    mkdir $outputdir/$branch
+    cp -r ./_build/final/* $outputdir/$branch
+done
+
+# Yocto Project releases/tags
+for tag in 3.1.5 3.2 3.2.1; do
+    cd $ypdocs
+    git checkout yocto-$tag
+    make clean
+    make publish
+    mkdir $outputdir/$tag
+    cp -r ./_build/final/* $outputdir/$tag
+done
 
 # Update switchers.js with the copy from master ypdocs
 cd $outputdir
-- 
2.31.0

