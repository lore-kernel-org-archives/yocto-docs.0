Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4CBC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 12:32:31 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.105255.1712579547039807128
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 05:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q17x5LpY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e2c725e234so22407545ad.1
        for <docs@lists.yoctoproject.org>; Mon, 08 Apr 2024 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712579546; x=1713184346; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pGchJLxqeg5lrjNEx9SPB2BBnECVhVVeU7AGZR9B+A=;
        b=q17x5LpYrBTTI+oY/fhSGMyAx6GxkcSAGa52EMqsbLJFxFvbpHgKKEnJ3zK+MdZzZL
         cWDfO6QHKMR8j5yXHzYfkDn/DkhEg9QypVRgX9mnmnC26uSc9nHDlVc5/0mGM9Nn1ctO
         6YIwDc3ciP2S0hLlDdR32iXyCGfu/n3WWo3TjYJN0KWo/xoD4SGB+qACxGwg3ruqFMB2
         30CR1kXYfOuPRjvc2H/QbIOWc1TvkfcZ3g+6h/EYXm2+6ADirH9uJyttT0Oj0D+0uQxx
         vWaVkMtN7JgjKlvna7CVjz0KRQ3aC3muLnCakUfmAXMZC3ytpP7Ec6gR852WKYnQXIif
         LZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712579546; x=1713184346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pGchJLxqeg5lrjNEx9SPB2BBnECVhVVeU7AGZR9B+A=;
        b=BM5+QnQpFDBSXZ+/RlIjztq0J2lLrn4daV3zff2okVei6wpAFgk4GQdqSpEvdl9qQY
         lQkVU3VuDtgqbqw8KDJpgISg+f9/F8GJQO85ffebtBBQyt0nxy2RQlZFdv8XYVt9eV9y
         qWEnGp/3NgDMejObujkGj7Gg8aJThLGE4scRdtcW5b69S0HJE46hf+YxGU2MovVNq7/r
         TIBvMc2MLLYHg8tkTsRQClUCNhmGq3h3N5Ygjpw5X96h6AvpGxPA0jAFrJp1HZ3+trQP
         4j7AFsTkpe2/PxnZn8Bx4MV56dng6R7Lw8QeWMqWiGfVHz1RWN8HLi39MyoUYHldct1X
         ri7A==
X-Gm-Message-State: AOJu0YzbrT+LyPS4K5RBRiWPK0+EFUGVvsNMeULx6gZGOGZO31qKboCx
	MO0G3V1q5WZ53NyzonlEyiq3Yw2DjY9uK+r6l1HZBt77kS8dahIEFZaTBoI83IwMekkfMNzGqGm
	22xoIHg==
X-Google-Smtp-Source: AGHT+IFYlGVEeqLCSy/p7dBuNCcOuSUM3Bw66j3ZUmKIY70YFC/F6dYWmwULWmcsgtShbKb49KCkAA==
X-Received: by 2002:a17:902:c405:b0:1e2:a077:1c8e with SMTP id k5-20020a170902c40500b001e2a0771c8emr12916206plk.26.1712579546127;
        Mon, 08 Apr 2024 05:32:26 -0700 (PDT)
Received: from xps13.. ([209.237.86.100])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902cec800b001e41e968a61sm2311521plg.223.2024.04.08.05.32.25
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 05:32:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.33
Date: Mon,  8 Apr 2024 05:32:19 -0700
Message-Id: <6c5d42d99ea71333a13baa0e6be1bd45267d8b12.1712579371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712579371.git.steve@sakoman.com>
References: <cover.1712579371.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Apr 2024 12:32:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5090

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e41e355fa..0ab046428 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.32"
+DISTRO : "3.1.33"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.32"
+YOCTO_DOC_VERSION : "3.1.33"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.32"
-DOCCONF_VERSION : "3.1.32"
+DISTRO_REL_TAG : "yocto-3.1.33"
+DOCCONF_VERSION : "3.1.33"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.32"
+POKYVERSION : "23.0.33"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


