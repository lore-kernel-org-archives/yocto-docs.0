Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05350CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:14:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.15337.1758629671141142643
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 05:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFcjn3Dd;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so793451666b.2
        for <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758629669; x=1759234469; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRxTDebcP13SwHksgc7cjH5IYD/MvpSR3WzlHyJdMzU=;
        b=SFcjn3DdO34f+G9e5/IsjrrkBPSQS9SVUg4mxPp8+/bp81xikhu8gXpkQKx8657DXk
         OsXBLTqWubEl0cKDsRxrDAhZZSYWbgU1rd0JBC9afJh9dg9WD4GGFTDmHk5SfcZD2FlH
         dZEZ1u/i+Pi+qFuxMq/r0fMwfxvHii/CDU5la9W+dUP6dni/ykVSXaFxikIQRcdv50hf
         KysIh/ycaqOOLHP2NK3bxAijnhrRprfvpGX0Pr5NbngYzotLG/nTT3Idpp1FTwpNUh0M
         NK7bqrL+27uv4GYbn5iErYfIMfda/VPAFUr8WtyzlB9q8w2Lre0iSLLeey/iFI6jJgZB
         VWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758629669; x=1759234469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRxTDebcP13SwHksgc7cjH5IYD/MvpSR3WzlHyJdMzU=;
        b=M1mX4ITb5kw2ZFdtYU4gAWNl6QhM0MAyWTgaTqKzUvGLc5eP8JWZEhD5eIac9DGVNx
         eWF0S5DNz3afaSIYtHGHsiKnq5+ZmmCwjvoXeEKDcuaVSuyQH5Mf50XQ8jFRwkYTyymM
         81HgP5cmHqYYAmXM3R+jSgpINhhhGNCj9OWLeYDpDSngSiOu3VUrq67TK14CzIhwP2gB
         IdI7oPEy34FavujrNs8+dHf5kAsQ/hM6B++YmD7WNPoi4rT1+a93Ma6iIWntgz5ea3jL
         Ojjwx467g3dcX3G5lKpo48YrR9VuuOgBH35FefuufUVmhTnKjg9Lr9X55IYud24cgxce
         MmZw==
X-Gm-Message-State: AOJu0Yy1T0atxoJf1EccWLcE88d/TIqh21aSRFExaM3x1sDnGA1ly7z+
	Q7+fh8RvWMkikn/kZXPnYiZIc3TWeC64lnGKECjwvTSfJq9gvYE3tMlArbH+Tw==
X-Gm-Gg: ASbGncv6chTLrIlC2AbC07NOFfpEKNWPZNbmePqTWyU/qpS/9mjvQIxeWt8m2Wi3rY9
	WlrqvoA+kOTCn0YMFISCiG73pyJOp/vaR1Bi8p2PqONjRLN2EP+r9VDwhDQHpx2dA1McUT6WOho
	xcrNSc6Jrns3J4SHKw2mz+2IXyRO9+wS3hVVHSurpwPEI10u9TP96qmY0bisbxBUCftMckz9TU+
	txITfI90TKKrNRQd/781ZhI9bUYyoVX/DZ7t6TRdNzJAmOVUQJjLxTQZczonhQPzx7RiKMYPm7K
	fToeTEWIdPf20Mf3jzvE7Y61c3i4g3qJNyLvQiB9UpIUR/m8osFfwgu0L86ymMZY+69E30Kb+vm
	PbfzACcZB3ffOZWGiCt1B/3n4wC2RjA8025gDF4GvmhA=
X-Google-Smtp-Source: AGHT+IGmitQ5jlLwPpO4boGa6zlIlJniU3kJV/14BIi4XmU3MRJ7d3xoQLQDfsD2O5YIVj1vqtWl+A==
X-Received: by 2002:a17:907:928e:b0:b15:515d:e988 with SMTP id a640c23a62f3a-b302c4f610bmr212981566b.59.1758629669175;
        Tue, 23 Sep 2025 05:14:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:b152:c504:c01e:e617])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b31a562fe38sm19852466b.45.2025.09.23.05.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:14:28 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH 1/2] kernel-dev/common.rst: fix the in-tree defconfig description
Date: Tue, 23 Sep 2025 14:14:21 +0200
Message-ID: <20250923121422.24593-2-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923121422.24593-1-adam.blank.g@gmail.com>
References: <20250923121422.24593-1-adam.blank.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 12:14:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7581

The description of the relation between KBUILD_DEFCONFIG and
SRC_URI is reversed. In fact it is the SRC_URI provided
defconfig which will be dropped by the kernel-yocto class
if both are provided.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/kernel-dev/common.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 654c4e0a0..c7b25765a 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -655,7 +655,7 @@ Aside from modifying your kernel recipe and providing your own
 :term:`SRC_URI` to use a ``defconfig`` other than your "in-tree" file (e.g.
 a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
 build system detects a statement that identifies an "out-of-tree"
-``defconfig`` file, that statement will override your
+``defconfig`` file, that statement will be overriden by your
 :term:`KBUILD_DEFCONFIG` variable.
 
 See the

