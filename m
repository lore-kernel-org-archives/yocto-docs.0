Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D055BC83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 11:45:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.15289.1693309555715983847
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 04:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Z3PKSt0q;
 spf=pass (domain: snapchat.com, ip: 209.85.218.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c136ee106so554643366b.1
        for <docs@lists.yoctoproject.org>; Tue, 29 Aug 2023 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1693309554; x=1693914354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6HNi987H8NoDPsSgUx4MKdltbw7uaNbKB8/mh8CV/I=;
        b=Z3PKSt0qzw7hLQyM8rkxCv9ZPEvUVb9NUxZZCp+W9bjHCpxD0rP7o2GxKHlG6iTJxg
         wC8v79clH/i8oDQMNpfGO0olKlgLu9IxsHdHfo2ENYmM+4KPHDwsinSIWdq2mMwbUC/Q
         uPMcDm9WuBp0RddjwgjF+6ZhclZEwAa4xUfzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693309554; x=1693914354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6HNi987H8NoDPsSgUx4MKdltbw7uaNbKB8/mh8CV/I=;
        b=BSUrUAVV1UDwqC/Ns3tKoBsTxTNLhmdawQXh3zPjioPLKR6v7tydhQ9Zub2k2V4S+a
         aCH6cl5x1uIBtDK47mRdT8GYkFimULtupftkSY4HiKc+6EE4LIy3jN8iJvzvVecak2Y0
         yeuevHEehYs8e4H+X/gUK++MtOpR0TgRm32n+9byPd3HaABkZOkcLartFLcQTmYZVnL0
         0k1zyCXSnuikzzamztUng3ziyGPRO4KMTVyk5HNpTrxRScHmFIEGLjKWkwa/AUpXV+pB
         /3o3c1w5U97t+k95jZWsq8MmRnCRk1MqRjxqVcEF1KBPbQPtd4K41XUDAjIkHNa/23H6
         E/tg==
X-Gm-Message-State: AOJu0Yz06W7nlTR+CkIH1IgaZDS1yfj5EOyyo+TDJHcT9p8O4Dyrgk6K
	dpyxXG+CAaQmKTfh5iS3HtEft7aoxE6ATKr9oowsdQ==
X-Google-Smtp-Source: AGHT+IFf7ao7/AiLrh3DTfhgdsZCScNg8PbO4RROzvbWIAwQSUix/ncAsWAfeM4MPxFd/Lg3H2lKyw==
X-Received: by 2002:a17:907:c297:b0:9a5:d657:47e1 with SMTP id tk23-20020a170907c29700b009a5d65747e1mr546227ejc.43.1693309553894;
        Tue, 29 Aug 2023 04:45:53 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709066d4800b0098e422d6758sm5817667ejt.219.2023.08.29.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 04:45:53 -0700 (PDT)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] migration-guides: system-conf -> systemd-conf
Date: Tue, 29 Aug 2023 13:45:47 +0200
Message-Id: <20230829114547.3763369-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Aug 2023 11:45:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4178

From: Etienne Cordonnier <ecordonnier@snap.com>

Fix this typo. There is no system-conf recipe.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/migration-guides/migration-2.6.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index dd21eb3ba..ecb559dd4 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -277,13 +277,13 @@ The following changes have occurred:
    See the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`"
    section in the BitBake User Manual for a detailed example.
 
-.. _migration-2.6-systemd-configuration-now-split-out-to-system-conf:
+.. _migration-2.6-systemd-configuration-now-split-out-to-systemd-conf:
 
 ``systemd`` Configuration is Now Split Into ``systemd-conf``
 ------------------------------------------------------------
 
 The configuration for the ``systemd`` recipe has been moved into a
-``system-conf`` recipe. Moving this configuration to a separate recipe
+``systemd-conf`` recipe. Moving this configuration to a separate recipe
 avoids the ``systemd`` recipe from becoming machine-specific for cases
 where machine-specific configurations need to be applied (e.g. for
 ``qemu*`` machines).
-- 
2.36.1.vfs.0.0


