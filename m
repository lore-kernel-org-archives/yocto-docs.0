Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C212BCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:46:57 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.18325.1759326409474934842
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Oct 2025 06:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VcB/CPjN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7960d69f14bso39057176d6.2
        for <docs@lists.yoctoproject.org>; Wed, 01 Oct 2025 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326408; x=1759931208; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/J18el0xMEKwCJ9ium+LLjp90fvibgGgslt/cIitDIo=;
        b=VcB/CPjNoZ57xvUGWZXQ0LbATlscz98VwceETnMAlMIoITdC23OXoy8IBTa04uSy1G
         oVmwX0v58bHtj1bID2IgDMqCK26JRwTXTwnuxaQ5hBi/8OwUbgsw7ivGnC3M7qu2sYmS
         gUqStMPvb8oN7JP5Z8HM8zR9rDOrG9mdTxz7LLkPhAB2R3Jvhpp7hfN2OI8+ZmR+DL0d
         N+W0ddMZy1Af1mXt1EKcolhPFjPoDTAD3oL8EnuxQ/2Y32S5aSuedGNA8uMcKasXHqPk
         zOQFoAVo0WZQFbymTQvIeF+T1jCGLvwNvKcxIuYxFsVLSE0ossIjkq+R+j3e/9droj1a
         Ma6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326408; x=1759931208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/J18el0xMEKwCJ9ium+LLjp90fvibgGgslt/cIitDIo=;
        b=stOiAsiXt+pxMWqB4W+m9xWaWUYhU9GSPIZXjBRkpU4BbnbfFzJhuce4D1E8hiZzlh
         XOefX77LoEd/eQ7V82eKFH10bQHjmLR+tuWZAZuvxEqfWTAHRxBP9ygXxpyRjBBuRdAL
         cECqwkJVwpkmCI9jGvJX4zCgY8X1Jz11O2RsekrI6fmMrfcVBFwJl6+MIh7URmwAnUK+
         mvkz00pWDf+DScqarYupVX+H9SQ331cNrTtinE1OfvUMLa7lAsMc8nzQwXln8q5klQ/D
         8979LqhtSc6vkUMNViNUCU97ueV5KiwajmcAPUAo0kgm/q02kVNVtC1/SfOkhSmshhvt
         mTYw==
X-Gm-Message-State: AOJu0YxGKXMVTH9YFvppYbsnGfxrGo2nk6Jt3j1eZYrui+2u6lFCIqS0
	EWFxaJtTpUKh3ED0FsFw2lhKsOYywOlE5ZRPLuKEnbCf/3rfoFR5xD/XqGO0k1vL
X-Gm-Gg: ASbGncsYuq3elme6wpuZ9IEg5LE1lzmtMxcF2xrnDBNBl7gyozTfSbjPCPWHxgQrVXc
	S2MqjlfPU0MXjtY80GTy5sSsrxrd7YK/cyDnQmrY1xDY4vz7zhiiW3WbUXEBTzUsJ45E2zV42Bb
	pI2MUW/HVTTPcWgvaxObohYVdfFvDVgU3uY3s8Q8cHn/M7cTsC3nFK0UARaNHbTnz0b5TkzSM2Y
	9hmJjRkt65pvQncm19Ji8qNhLgF94KBeydTAQkqg/MoH4STd99/p9n2O20V5Xg3hylJo53TA1jW
	HoO8aZucw1ArVdrHIwvuXzAdsCOsTV7ij++ZH+6t5n8PjlZODBry3BK7XaKD0A/dBmBHp9G+SbA
	VsCyX4CTKBRMzuINLVQ1rlZSOEdrwOAeFS+dqWSJQYh44v10JIE9M4A+HeXFk82tNz1w=
X-Google-Smtp-Source: AGHT+IFGJF1cPmL5c5tMM23abBSfQUw3AziFF7uheBRgNO0uQEgkTCydn1GCbyjelAazIINJlvyVnQ==
X-Received: by 2002:ad4:5d45:0:b0:78e:7a30:4d62 with SMTP id 6a1803df08f44-8739c0fa850mr49198526d6.4.1759326408349;
        Wed, 01 Oct 2025 06:46:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:1161:4d76:e4be:ebaa])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8016e0bc852sm111464646d6.60.2025.10.01.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:46:48 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH] ref-manual/variables.rst: fix the description of STAGING_DIR
Date: Wed,  1 Oct 2025 15:46:35 +0200
Message-ID: <20251001134636.27829-1-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Oct 2025 13:46:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7631

There is no single "recipe-sysroots" directory, but rather many
"recipe-sysroot*" directories.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 18ead7d04..9dfc6f47c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9273,7 +9273,7 @@ system and gives an overview of their function and contents.
       directory for the build host.
 
    :term:`STAGING_DIR`
-      Helps construct the ``recipe-sysroots`` directory, which is used
+      Helps construct the ``recipe-sysroot*`` directories, which are used
       during packaging.
 
       For information on how staging for recipe-specific sysroots occurs,

