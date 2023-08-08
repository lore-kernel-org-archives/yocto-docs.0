Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49D7C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 08:49:58 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.57106.1691484597865126587
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 01:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20221208.gappssmtp.com header.s=20221208 header.b=gVrlt1ue;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.179, mailfrom: dse@thaumatec.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso82974421fa.3
        for <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 01:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1691484596; x=1692089396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1JwLXR+Jpa2s7ZCzwnnZmUQEQvO6pDmAbrX8cepaiw=;
        b=gVrlt1ueUhCJFvgWPqQIM+0wmDYxeZHWRQ1W2YmgOm/n2K+Qmz+Hjo+J3CDNXtN4cl
         ENIa2JXmvCs4Rdjpu2J4CNMKzEzO7QIrTSTqMD71n6EAbdQ7AeO+Ib8802Vm1bzw0abw
         EU0pgCfEnYOSVt703IwTzvblL/1u+Szl20Uow1wytmQSth4SE/Xtbggzzz2+7BHz8ZWY
         nH3XPQT3WeteX3+XYo0rN9auqIlyGfRt1vqzplrljaQwDNKLKun6T7+vw9NYPtsGGH5v
         vWxSx8fR5VVl4u/bVS6Cgeszh7xGUVXT9GYy9oj16beVzYR9BSA2amVHH9Zi0RFy3RXi
         i7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691484596; x=1692089396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1JwLXR+Jpa2s7ZCzwnnZmUQEQvO6pDmAbrX8cepaiw=;
        b=MLT3UiXYW0vzB4oygDdSYvbGA2RLXrtzwIgfDgFg/9wQknuRJj7ApHn/mADoXM6gew
         Ii4dW7+Zilj1ZE0bblns8FsbeNSZ88+iP0J4gfImwGijUpIxv7iRGSqhtOUr6lTqedDl
         jLR8cmzQK43afQKoAIl0n1wQKT88qOFj+LCIuPwyVpd9vXe9HytEtgY2DzSvC8zwW4k7
         a6ZeMJed4h/dkxXZTH87QJ2jbFtCbjaePv1++O0HKWc2z8QP2bcLlnGpUdt0sJZQ6dRm
         6BEgC4ABtL6a1AFxZ88GBTuJR93SeZE9+icXk0a7RObpac9+BRVpPE/74J/8Gb7TSHgp
         NxYw==
X-Gm-Message-State: AOJu0YyyFUmcSAUghB7U99CxRvXv8yuxZgNJfqweAxobOmq4xWTfQhed
	vgMZPJWEK61Pg+wkCLl7xh9LbihOO37Qq5/IslvRhQ==
X-Google-Smtp-Source: AGHT+IH54xbHd4KM9Nhg8gE8BfCAV5qXlFxYCfFiOmICIZXigLigVv3GyorATs7o9ZJruvW90dZHeA==
X-Received: by 2002:a2e:3219:0:b0:2b6:cc93:4ecb with SMTP id y25-20020a2e3219000000b002b6cc934ecbmr8780497ljy.43.1691484595934;
        Tue, 08 Aug 2023 01:49:55 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id m21-20020a2e8715000000b002b6ea79c613sm2196173lji.94.2023.08.08.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:49:55 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: docs@lists.yoctoproject.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] dev-manual: wic.rst: Update native tools build command
Date: Tue,  8 Aug 2023 10:49:32 +0200
Message-ID: <20230808084945.24457-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 08:49:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4111

Requirements list seems to be outdated. It is not possible to follow
instructions for Raw Mode as not all of the native tools are available.
All wic dependencies are gathered under wic-tools package. Some commands
in the instruction already use wic-tools native sysroot, but this
dependency is not specified in the requirements.
Update the command for building native tools to use wic-tools instead
of the seperate packages.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 documentation/dev-manual/wic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 2a4408cdb..664f07a21 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -92,7 +92,7 @@ system needs to meet the following requirements:
 -  You must build several native tools, which are built to run on the
    build system::
 
-      $ bitbake parted-native dosfstools-native mtools-native
+      $ bitbake wic-tools
 
 -  Include "wic" as part of the
    :term:`IMAGE_FSTYPES`
-- 
2.41.0



