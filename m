Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.12202.1609759331858177863
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 03:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HqCF9NuC;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id i9so31798959wrc.4
        for <docs@lists.yoctoproject.org>; Mon, 04 Jan 2021 03:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MQYSEqWX5FhY15qc8W9fc0XACKLYhB+sSbzcsPKSbd4=;
        b=HqCF9NuCE1Dur1Bf4ujzSSk+qigyvGiKaPwIUaROjncOcSM6MB56AYLMK8iLhYVCI/
         WspW443Kc7qkH0muIPhR9ElvNHq4g79FC+nHvFk7yh8PmrGHI6sc6DbZ3XRmevrcLcO1
         +66uz12Rjhwnkl6dyqfRJaN3oXT0z0hrP4a1H+088xiwCto2RDcUScvPrDz7QKcTxs/u
         MLO9gskbXW1VuHCTwgz8ME+tE1EQ1+8pZNJSKL7Rg61y/oPSnpUmaqDK9sU367OB3qmk
         rxXJjcQBfzrZY8qWF3FnI+MGsouESOK01ZbHGGjA459rmL2oDv1B8XojT9c5SedPNBGr
         kI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MQYSEqWX5FhY15qc8W9fc0XACKLYhB+sSbzcsPKSbd4=;
        b=inkqvRW30JTQhG9pEJFn1LgJxwu92A6YiSZczD2+btlfgPg/drBVsuhu2B/uEJ2LLH
         FrrYFlAtrEiIc8L+PcXXX68paGExTrBCHytJFr3cbQroFqZs/FU/D/ftkdFth6lb1Zsb
         p5qRnj/KMyQo4LPV360wFgoKAMT1UhfmyOZPL0fuToWz2NHNPjYIS3iQv6XHnocCwNCF
         rqvy3edZhgeoShuVxQ+ejWDx66xPFJRUvP+F2S5kV1iJ4IO2Kny3423lpFbxtijj9/kj
         k32IAgZI17JXXjstsqDeDVRjpoDoMwEBqmGBEPNwY8M2k88J8XfQl213dc7edIOnt9Tt
         Bt2g==
X-Gm-Message-State: AOAM5307xMZWKqPHyJV4lv3jP+EuZVmdNUYl5q2a5nD/6bAcqeCs3D9h
	PROmCiH4mn7cDewJ8BR88GF+4HsPbEeKLQ==
X-Google-Smtp-Source: ABdhPJxKm0zLZvTIvdR4HxkqkLL1U8anRVwThElCYj3FCOlcU+o9iSDcCbp9drOjCXvOpYiKU/zEdg==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr79327759wrn.181.1609759330291;
        Mon, 04 Jan 2021 03:22:10 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id i16sm86648606wrx.89.2021.01.04.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:22:09 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [dunfell][PATCH] sphinx: update link to bitbake docs
Date: Mon,  4 Jan 2021 12:22:04 +0100
Message-Id: <20210104112204.23071-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sphinx based Bitbake documentation for dunfell release is published to
https://docs.yoctoproject.org/bitbake/1.46/.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/conf.py   | 2 +-
 documentation/index.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 33d0ddcfd..b6d8073ee 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -82,7 +82,7 @@ extlinks = {
 
 # Intersphinx config to use cross reference with Bitbake user manual
 intersphinx_mapping = {
-    'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
+    'bitbake': ('https://docs.yoctoproject.org/bitbake/1.46', None)
 }
 
 # -- Options for HTML output -------------------------------------------------
diff --git a/documentation/index.rst b/documentation/index.rst
index 937692ce0..71ed4e76f 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -33,7 +33,7 @@ Welcome to the Yocto Project Documentation
    Profile and Tracing Manual <profile-manual/profile-manual>
    Application Development and the Extensible SDK (eSDK) <sdk-manual/sdk-manual>
    Toaster Manual <toaster-manual/toaster-manual>
-   Bitbake User Manual <https://docs.yoctoproject.org/bitbake>
+   Bitbake User Manual <https://docs.yoctoproject.org/bitbake/1.46>
 
 .. toctree::
    :maxdepth: 1
-- 
2.30.0

