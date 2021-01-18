Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.31997.1610969868995438543
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jan 2021 03:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=fsmM+NVK;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 190so13305655wmz.0
        for <docs@lists.yoctoproject.org>; Mon, 18 Jan 2021 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OjC1pMWDW9++4pkIVyVNT2H285ZODU7DWJBe7A2ZdVg=;
        b=fsmM+NVKQgtpORQt6wnhuRAkRPBY0gWjr+bEcB9KwGlx65KArBAJJESBADR+ZTSxtz
         RWmSauW61cvvV1TLVkpPtaXg+3/6bjHeqXjfJ4YqnVZv+7Z+0qy/d191qN2xdqeQJ0Io
         GQES//70l1JSbpG0bm6O5zPmqcPJYBUBdoF6gMu+gj4TwjnnnJT/S23Ne5q4mqZGIVl5
         jjZ48Hwt8wY0dhWGvwlAQJ4LUi0phbwxtpATih4Y2ilAupiXY8YwC76JC9Sk5mPNHJ0v
         rPODoFzd3Fj1iAEcx+M4hu9aJ8gqtS96ivy+IajHnVVTzqcoyfLqSZDXLNzhc9jRu/xU
         S2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OjC1pMWDW9++4pkIVyVNT2H285ZODU7DWJBe7A2ZdVg=;
        b=sh6xOIFHRa7B5h0g8YbNj0BY63PgsptKC5SOj2GHzNpqlAVwwRRMGJuqks0xfJSC4s
         9UjuIprSRq0PbVdi0ZLyD55wTULirFZJbtvp7jwtpMEiikCESLd7zy9GIOD3Lb0UQ2c5
         N9RdmceFdfQe0aFIkz85WeiF5qHPva7/GzWKJgbOOStGWIoq/ur+l0/L34Gc+3vvocYG
         ANEj6TvlcJUvKzxDITsDdrWua9vsJMWqmrRg+2o+nlUUV4lm/K2swx024d2MIEIJqbzg
         ELx2xAQRvg0OAGem9j+lxD/A5/95Ca/vm6SoGWERJr2+QSDYlDqKF61lZ2h3AtL6YxuX
         YBrA==
X-Gm-Message-State: AOAM531+xveSRKvfY77bPJbm2HO2PKhnZNFwdMMHg1u/hHR6D5s7gDW9
	QVJlX0EtXf1vvdAOWJRbHIjuLGh/NwOP8w==
X-Google-Smtp-Source: ABdhPJwnL7rHrthZO6elgN77CwdPO4Yls92qwr1Ir9koLw5MsqakT9VbP4DL8YDvxAEuJhCtjx7QZw==
X-Received: by 2002:a1c:2945:: with SMTP id p66mr14250951wmp.110.1610969867525;
        Mon, 18 Jan 2021 03:37:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from P-ASN-KEVALD.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c7sm31547326wro.16.2021.01.18.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 03:37:47 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] documentation: Prevent building documentation with an outdated version of sphinx
Date: Mon, 18 Jan 2021 12:37:35 +0100
Message-Id: <20210118113735.30131-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with a outdated version of Sphinx print warnings that does not
appear on up-to-date sphinx.

This patch prevent building the documentation with any version older
than 3.1 (First version to build without warnings in my tests)

See threads "documentation: Add a simple Sphinx extension to check its version"
    https://lists.yoctoproject.org/g/docs/topic/patch_documentation_add_a/79919516
and "toaster-manual: Fix a warning related to the code-block directive"
    https://lists.yoctoproject.org/g/docs/topic/patch_toaster_manual_fix_a/79656195

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/conf.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 407ea3292f..5a2e25f7b2 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -33,6 +33,9 @@ author = 'The Linux Foundation'
 
 # -- General configuration ---------------------------------------------------
 
+# Prevent building with an outdated version of sphinx
+needs_sphinx = "3.1"
+
 # to load local extension from the folder 'sphinx'
 sys.path.insert(0, os.path.abspath('sphinx'))
 
-- 
2.20.1

