Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC0EC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 10:37:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.5040.1648550240132822728
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 03:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20210112.gappssmtp.com header.s=20210112
 header.b=0z4dGTn9;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.45,
 mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f45.google.com with SMTP id c10so15779503ejs.13
        for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3njpHE7JOm5eWR5fBHTf4Imv0/Zh1I4JXm5hmsM7aTo=;
        b=0z4dGTn9QPkZZGu2BFlgfoloPC5FASR7q9c58acBm30kG7R+MkRRcv4wnU6BjbbOCF
         2wooGlEFzPlTH9oMeKm5ZQWS2uS8LCGPU8PeOurxYTqvguVysbIzomCxmcFldpakRRmh
         SoVSsnbEoxpiXQo2xgMXP84vNRrzawY0NdtcD8KuiLW2b/nJfpzzYim6j15zrTeyaD8n
         65g6tZ2faG2LGj/jS48KZc+Ot6e5CrNAFvHwM+GvjmNk/avV8L5kj7GZuj5Lg4a1c02d
         2GHWMViocGSvqBkLj1A+3TXrbmKeAdVXi+Vdm1SLtEB8rZLbmdJ9MIM1Tzho49+ETCV4
         u2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3njpHE7JOm5eWR5fBHTf4Imv0/Zh1I4JXm5hmsM7aTo=;
        b=UL9xWo1//B3S2TkUO6egAnAfpK8en//cq7zAbQetNvhLsjele6muf08c3RV8IsycWa
         2XjvapoQ9zbEdxjEgx+2tpkejvatzSP5T+4A6RHeUgANNbKk7bYyDJUbdkyCzossVkIc
         +DD3BxcR6QG77eNNCV0RBMmW4k73UXgO8EFm5oufnU1fPLcbUzzj/fWvdvtoh/CJD9xT
         x2HrhC5VT0H2Kh4rn+vUzb13NwVCrMMy/5BsBe4tYosOwh/zsSnIruUFFifj+ebJve6l
         U6yGCk+1gBfmXCtj868FwV6C3zMtHsphMGIc7acl0DXe/5zUUUVExDrqmaBX1dQkZ7CK
         oHpA==
X-Gm-Message-State: AOAM530ev1UvBS8EyKSQbJLMgQywvDEoqfgW6VTAp6P2f/06AyNbt017
	tEa8J7tHVXnMFbiGiU3SZrtr3T5oT7B6lg==
X-Google-Smtp-Source: 
 ABdhPJxjQJ1AEU9N6oS3Ansd7yt/IV2OLg45NHqKsIyBzHq/Jfv3hNo+QYiUjf+TJVF45L9W22kiEw==
X-Received: by 2002:a17:907:8a25:b0:6d7:d59:6912 with SMTP id
 sc37-20020a1709078a2500b006d70d596912mr33537076ejc.259.1648550238141;
        Tue, 29 Mar 2022 03:37:18 -0700 (PDT)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net.
 [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id
 sb15-20020a1709076d8f00b006dfe4cda58fsm6948329ejc.95.2022.03.29.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:37:17 -0700 (PDT)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: docs@lists.yoctoproject.org
Subject: [PATCH] overview-manual: Fix reference
Date: Tue, 29 Mar 2022 12:36:57 +0200
Message-Id: <20220329103657.52364-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 10:37:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2725

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 documentation/overview-manual/yp-intro.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index a863a7d16..86a8bf2b0 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -151,7 +151,7 @@ Here are challenges you might encounter when developing using the Yocto Project:
    ":ref:`transitioning-to-a-custom-environment:transitioning to a custom environment for systems development`"
    documents on the Yocto Project website.
 
--  *Project Workflow Could Be Confusing:* The `Yocto Project
+-  *Project Workflow Could Be Confusing:* The :ref:`Yocto Project
    workflow <overview-manual/development-environment:the yocto project development environment>`
    could be confusing if you are used to traditional desktop and server
    software development.
-- 
2.30.2


