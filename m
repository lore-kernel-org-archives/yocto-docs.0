Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A566EC36008
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 22:53:51 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6372.1742684029612228413
 for <docs@lists.yoctoproject.org>;
 Sat, 22 Mar 2025 15:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=twQMrbhX;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc1f6so2617194f8f.1
        for <docs@lists.yoctoproject.org>; Sat, 22 Mar 2025 15:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742684028; x=1743288828; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nglams2utXO22ETdNaCCJf2vjVFHlUXvY/+4H6MiUbg=;
        b=twQMrbhXZy0CfbY9bWnf5T7xJJoeYTs67dS1kBOzsafxh4HqHjx0hqaTMKaW6eTbDK
         7mfDAB5OXgQpJjBIo6G5/e9LfkXx7aPtIjYqjuIQTB1JTX0uBY8PKYDukBOmvdlofBeD
         dDU5XLXe1gKUmymIaHAumf6HQTFDIarPE3cM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742684028; x=1743288828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nglams2utXO22ETdNaCCJf2vjVFHlUXvY/+4H6MiUbg=;
        b=tk4C55fuUd6MY1iVBlIQTXwm/UZJQpSo7jAicCoD4KwULmbXNSLjI6AYjNeOoBeupX
         incG95a8OpKS6P0CZzTERTLkv6/gkifdCAetchFpB0U5M95ULHKFO5I0jiOGOOeFF4i6
         URlRLMPENtyl1iieMrHJwM6j34JluRLUWqPIKz43gfvtKx23I9LZrN0i0XKaEsf1FnfA
         Znb/w9A5dWjWywqL8zM4xGCDL1SzvK661YsTGynieu7WCQ5yI9agXKjRn3GH61awUQq8
         hxCQyTD6T/7eg3uGDsXZNqPj/9CdJ/6zxI4UIyI6w7Tg7P5scD9q7tvYXswpExU4Tu8z
         U8+Q==
X-Gm-Message-State: AOJu0YxOse41tpS4gCfnTO/O9FfxY3ddbSzP5U9RXOdWtZUAOl/4GkPC
	CKbmBA+9ik1aVOjGoLTRCt5sX/kzaoL0YNG1yXmoP25Z5yvL3B6T4hjKXnfW/3m2Y8gviwT6wLL
	F
X-Gm-Gg: ASbGnctn45co+eRIH9m8PVEe+XUMzrDGrK9IhkSE7/9pTYStYx8pRhFZc15SjIHbqHg
	I1b6cE4kXXebW5fl7jLfPGFCNR9p1LPP/nNWvYoin8fESGKZ4zaQV+1wrXoi0c6/AlT+qY5RsXK
	VsJjxJeXQcx0PAPscFf6LPV25xmewaT241MLd9J4oeVDBh/44OAvn+vg4nZFF1x3iiT5rEk5t8Y
	R5oQFcMSUTNryrwgSVKhIvu7O2NtxAj29CRwVHa/KdRSSldLIQPukAzApaEuSyVNvZQxEwd7qiQ
	ToNmW2QAzkt1HiIjmsykfIq5ze5MwkdED1uNxsjgFlsLTuCo4UlHCA9NwQrELFiGAho0CktT4Xd
	1TqlW+AJDo1Kxg+p8UOGbsXgNDpWaL1o0Bb5L0o5+Tq/MANV1GYK0
X-Google-Smtp-Source: AGHT+IGtexr3GZS3IXK3VK4jPaZxG7dc7dJ9umeQis6iQ1GO9Q362c43F4nPlembO8GXKD6AQPG2WQ==
X-Received: by 2002:a05:6000:184b:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-3997f940541mr7274448f8f.45.1742684027651;
        Sat, 22 Mar 2025 15:53:47 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000f0da383060e5e6f8.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:f0da:3830:60e5:e6f8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b26a6sm6105406f8f.44.2025.03.22.15.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 15:53:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] poky.yaml.in: Raise minimum GCC version to 10.1
Date: Sat, 22 Mar 2025 23:53:37 +0100
Message-Id: <20250322225337.3981680-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Mar 2025 22:53:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6606

From: Yoann Congal <yoann.congal@smile.fr>

Since OE-Core commit 19004950ad56 ("sanity: Check if the C++ toolchain supports --std=gnu++20"),
host GCC must support "--std=gnu++20" for a Yocto build.
This option is available from 10.1.

This is related to [YOCTO #15804].

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index c93b78066..518e8917c 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -16,7 +16,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
-MIN_GCC_VERSION : "8.0"
+MIN_GCC_VERSION : "10.1"
 MIN_MAKE_VERSION : "4.0"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
 MIN_DISK_SPACE : "90"

