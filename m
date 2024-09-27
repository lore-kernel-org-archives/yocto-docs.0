Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009F7CF6487
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:00:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2612.1727474458196788947
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cmTLILRT;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so21926825e9.3
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474456; x=1728079256; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZ4RnXCQj7J/XdoI4UWYzulxD/KkWx/zF+vWW6eccyM=;
        b=cmTLILRTJaoSbRZKvaTDsiMQO+7gmDusPy24+P97MqyVDRD22eHOydVjAaq3t2Q+P0
         reWWuQlLgflx5Av4MGbGvSgXC8jvjrmQyb0bH2kq1ByycJqtjK7sY9EbbUkXgwd+fNYq
         kTtd5Ct/YZXp1ICqfrVi2+xi/3d0Y2VOxysu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474456; x=1728079256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZ4RnXCQj7J/XdoI4UWYzulxD/KkWx/zF+vWW6eccyM=;
        b=gLUcq0UQb1nD9Pwca9ahSmkbePCwenx3qO2xsjRLReGpMxB74M6EcHz9NtXMeo6eFN
         akbxz0GaAVuP3umBFXxTVi1gQEQBOQnrlKtbXSQHN4dWPCm98n5C8fRnvQISzoZiAWEc
         asZdV+ie3TIterFQk8albQ7kIP31R3TMG79cC93lRdU1cOeyqajmLeajmH9f1pe4kewB
         H+jI66Mpg2hgFXwyfiunAtqZ2TUtpD+JxPeFnnCR1LA4LRlWpEMeF8FlBnHWk0Xnm1Xc
         PdJSb1tLOxsP14GNBIQoqLNsK+ZqegjKeBbOYwmKp/6WtsHWYRC3GbXQpCwoNmzz/YVP
         4rdQ==
X-Gm-Message-State: AOJu0Yx8RCfKWQFuwXEMcRLyiEayqDlgd4+aClgm1CB3uxUsrh7cpWHj
	Rjk55yPZVv9/36/Cd+nzCBpcYwP9+8QBWCqD0IhnWS06m13qydtNAiT95hueK20ZCQgqzt+Maym
	8
X-Google-Smtp-Source: AGHT+IFjPi2BnK2ZN7Z1FriYpK8xQ0qgdufn4OJnmpLjqKeTOpzMwBdQF8hwPO4KsE1UGBaQJfXbTw==
X-Received: by 2002:a05:600c:3b92:b0:42e:93f4:5383 with SMTP id 5b1f17b1804b1-42f58487002mr29692275e9.23.1727474456269;
        Fri, 27 Sep 2024 15:00:56 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm3490712f8f.3.2024.09.27.15.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:00:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 4/4] release-notes-5.1: document spirv-tools reproducibility
Date: Sat, 28 Sep 2024 00:00:33 +0200
Message-Id: <20240927220033.3941455-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927220033.3941455-1-yoann.congal@smile.fr>
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5380

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits
47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Review from Quentin Schulz:
* simpler to avoid confusion.
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 75e57ea1f..9c375d7a8 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
 
 -  Miscellaneous changes:
 
+   -  Fix reproducibility for ``spriv-tools``
+
 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~
 

