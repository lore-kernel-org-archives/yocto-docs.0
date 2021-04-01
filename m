Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.2624.1617294397533530591
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Apr 2021 09:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eqJ5oQTh;
 spf=pass (domain: linaro.org, ip: 209.85.128.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f41.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so3136237wmd.4
        for <docs@lists.yoctoproject.org>; Thu, 01 Apr 2021 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+x1vXlRWaTQf24DYTNg85ZhVl0Z9Q2w9sZzhL4xqgU=;
        b=eqJ5oQThqyHRngAZ/FPQcOyK0pvX/QZmhem/7qsuyzmBfW3xz7IDWRbc5zxJFtt5jt
         k8CSyFp6j4iLuhmjyIiZIopeHzG3dToHohgFWT6zYr0Q/4QhYyUSt8nneDrAGb2FvLiQ
         viPE5K57iSPhRtno2cTFGsnjXLY8w6bO3hSJb9IKUT1ydbxYUBBxe+XZzmzkPziDhSpV
         JPA9YrY9Pry4QkeUnnXlWAl6osukzeB2jZwzlQse8Hvob89CDZyyrqd35lG6wilMrYmh
         LmugxCbXm/anTnBH6eAXkyfZXP4dZ6qZ2PrX/ER6Q4pbDNFgO065Q11u5HSC8n3RAe6x
         sTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d+x1vXlRWaTQf24DYTNg85ZhVl0Z9Q2w9sZzhL4xqgU=;
        b=UyUlc8cxESXRGrUnfXFu7aGjqyCPJ0bpHa5yXZBk5xrAY9CpqQuMr7riKEM3lWBIJF
         hV7gv4y7yv4yYKdNhCTu8v+ZA1XHLmlV6R5awzaQA+nKHUs5hTxg8MKwHV+dgzTQqB0c
         BKIuaM/ImKz0cV70pEi/v6uDF/LvVS9vxX3JcPdOah4v0MgER3hKgxZVPEKQbSe4s32f
         W0nAEQbtxE5bGw1T7r3SFd+Z4piyapICaOitMuwrTnSZ3WGy78h6fCdWCFK87dB50TKw
         WuOprpzTJRaAgyteMzDrqdBPyRconshCusGNjb0yZo5mCjX3kNTLLm8Hh7KBvQ6OlShF
         aNsQ==
X-Gm-Message-State: AOAM533eIOf4UvPN1UVPCAwzeEblTB93E4ta+hE3ydn+dt2N/ape9ECh
	QlyPJL5NE4yUR5zdEtwv21aI7g==
X-Google-Smtp-Source: ABdhPJxOnO+1bjWOEyfRuhGLb8bGkWE7azJg4HjbRD1q5oyy0Gtz0BXBKn4AGNP27CJS2abyH6tlog==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr8752921wmc.103.1617294395836;
        Thu, 01 Apr 2021 09:26:35 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:bf7c:ed85:7b13:75ef])
        by smtp.gmail.com with ESMTPSA id n8sm10012832wrm.70.2021.04.01.09.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:26:35 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: richard.purdie@linuxfoundation.org
Cc: docs@lists.yoctoproject.org,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] scripts/run-docs-build: build hardknott docs
Date: Thu,  1 Apr 2021 18:26:10 +0200
Message-Id: <20210401162610.591089-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The branches exist now, let's publish the corresponding docs.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/run-docs-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 9c7ec8d..4af23fd 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -34,7 +34,7 @@ mkdir $outputdir/bitbake/next
 cp -r ./_build/final/* $outputdir/bitbake/next
 
 # stable branches
-for branch in 1.46 1.48; do
+for branch in 1.46 1.48 1.50; do
     git checkout $branch
     make clean
     make publish
@@ -67,7 +67,7 @@ mkdir $outputdir/next
 cp -r ./_build/final/* $outputdir/next
 
 # stable branches
-for branch in dunfell gatesgarth; do
+for branch in dunfell gatesgarth hardknott; do
     cd $ypdocs
     git checkout $branch
     make clean
-- 
2.31.0

