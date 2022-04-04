Return-Path: <abongwabonalais@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51519C4708C
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.33969.1649073526401189106
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 04:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LZMFUYAt;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: abongwabonalais@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r13so14097347wrr.9
        for <docs@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 04:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpPH8sF90Mg6UoOT9RucJpILAB966pwDrLTX6JXO3sw=;
        b=LZMFUYAtRkyCMl/BaJxu2byHFtCj/7rK1rEAZ58zViW/r7pBWzdalHOHFfSc4JXiy2
         q9bmxKuJSLjcAPgnUh7yYcPXxgUmRfP9SLiL7emJ1PGpvd+z636/9dpXL6YiFXmj8VvA
         E6KSQX4qf5DLkRG/pbNLQdA3JpS5Xm7tECROEgPQUU492ZgYiCb/WVxT31fhAP8PRAa7
         faokpScZaDZ3BExe0t93AU3HEYA0Psg6cHhoPiSBVzI2luwiS7VLVtAtfFldz/jQRyUX
         +Q1rSvR3bUVVc/KiX1iC+I7pVfHRs6VbuH0KTKi1YD49lVpdp3zRMz6gd81Lyx87ZUgx
         4kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpPH8sF90Mg6UoOT9RucJpILAB966pwDrLTX6JXO3sw=;
        b=5yxse+8Z7pel7KCUnKl0fvBSCE7TaQZ2aikmxPSVG2FRPnmibbYcPFzYnMQEfElzUR
         nEbyYmiNQFgJP7EWN1qjDaWyCx40zWREY/WQasAri2Qnvbf1Kc4x17KVyKP0un4Q4D+v
         cxoke+knfWxeY6kviP8eHpMRacrjFTQaKdSQeFX7id5b0grvSln9Rg2uAx6z4GGAQFye
         g+g+cwWSUbHqTjxXmYbXmiUpr0sZ7iFr0VEDhwke+2o/gf2xfLr/pPrsPk1QzbnO59C2
         dGR7qFTDL2by65o1Ie6FN4zIll36/2fYy5AUGowX4CYkkRWKnKJFPYmYDn3kVf7sJ7G8
         e+8A==
X-Gm-Message-State: AOAM530MGeaM4Pl7tRjMYC2a1Xu2ukeAYtjouaPDVYZExYBYCjpbJSjC
	8FX7D1tXMc/h0EC+vco6fbgsdrFYEj90jAlw
X-Google-Smtp-Source: 
 ABdhPJxeEwSdWatHwvrWNo+C2E77Fxm5J0MerRQSWyHSTAn1X4NJXornB8CMr6diFs6VvhQmKfmLrA==
X-Received: by 2002:a05:6000:144e:b0:205:9a80:b4c3 with SMTP id
 v14-20020a056000144e00b002059a80b4c3mr16716590wrx.179.1649073524633;
        Mon, 04 Apr 2022 04:58:44 -0700 (PDT)
Received: from localhost.localdomain ([154.72.153.150])
        by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c359300b0038c7d1086a7sm17056781wmq.1.2022.04.04.04.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 04:58:44 -0700 (PDT)
From: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
Subject: [PATCH] Add more precise directory for local.conf,
 changing it from local.conf to conf/local.conf
Date: Mon,  4 Apr 2022 12:58:12 +0100
Message-Id: <20220404115812.5145-1-abongwabonalais@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2750

Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index ad5d8a950..12cab1db7 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -250,7 +250,7 @@ an entire Linux distribution, including the toolchain, from source.
       This is relevant only when your network and the server that you use
       can download these artifacts faster than you would be able to build them.
 
-      To use such mirrors, uncomment the below lines in your ``local.conf``
+      To use such mirrors, uncomment the below lines in your ``conf/local.conf``
       file in the :term:`Build Directory`::
 
          BB_SIGNATURE_HANDLER = "OEEquivHash"
-- 
2.25.1


