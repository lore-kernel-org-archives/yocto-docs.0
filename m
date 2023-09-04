Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D52C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:22:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.44759.1693822923629538239
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 03:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=iqp2Fb11;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401d24f1f27so12612305e9.1
        for <docs@lists.yoctoproject.org>; Mon, 04 Sep 2023 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1693822921; x=1694427721; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V34Mc640gc9ylgz1RtsHgvrbMao4be2Zbf2E6EFsvs8=;
        b=iqp2Fb11UcfT4xq1eV61vaFB5umjJ+wcrFUmXDNR6AtAJy8JxLQ95GNb0N/vYSi/MC
         qCoQy8bEQnaHuojpw1gVz+7fAqsDbK4YwiD+Vf9TB+lUKskJb541H7tS4c5xA4DEf97u
         6CoH3hzQjWGx+NHTJShzfZVTig1WNj64gMvoewXViMPYYEL30Qi7oEhVp5hYLfKesAAj
         Muviq0KKptksk33i0z+hzlDo/4qY4APgPtAG5ktk4hioudhgCqUXPwwXBuD948OYvDnz
         0Tos5YOD2G5HQ/RkOO8N3IbDEyDgBL8mphUKTiUoQ8F64NrzE5czXA0J/exFvWbDDFGy
         bSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693822921; x=1694427721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V34Mc640gc9ylgz1RtsHgvrbMao4be2Zbf2E6EFsvs8=;
        b=Gpy1Q0swBDgZnHKhtL32k/z5UdZ7TYjVlpNpmEOqP5LsowFTZNYbO6+2eixfitVGwO
         pEHL+dahmb6eC4a6qxido4GVwngk72jZ6BKq2169yWV+qg/ep8ih69/s7qe8s5ShLDgJ
         o4LVWO7LTQqSErIDcSBqwE/WwAeEqzDv7pEp6UxW6r5JgvMTbNxssUqE8m3a32zNdzbZ
         RVkGSWLttoaZvxrk7QItZV0GE7hbbYRgZoTJpruoTGnRbSFf7yMsEigVb4SGeLW1/6ny
         If06w5S/juZOx9JnXeYojOSCSb0IPjoIP+YDEV2tBMxh6hC2R40MF+DRzMi5MhpHa1C+
         Pltw==
X-Gm-Message-State: AOJu0YwwL3xY9YP81cgBKFkgvaplxNpHAkq24uGJpkN6RCEVaES7Nk2e
	z1NoHnsnlUqMYU59khqltcNc94mLYV4SE3lPDMM=
X-Google-Smtp-Source: AGHT+IG5sE/0WYh1WVKuW4F/Ez8yl6HE+sAEQ1ENB9wxv+anq1NSWXOxXZy/SElGHhSN06kdlnYw6A==
X-Received: by 2002:a05:600c:298:b0:401:bd2e:49f7 with SMTP id 24-20020a05600c029800b00401bd2e49f7mr6953674wmk.21.1693822921550;
        Mon, 04 Sep 2023 03:22:01 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c00d300b003fe17901fcdsm16698066wmm.32.2023.09.04.03.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 03:22:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] dev-manual: remove unsupported :term: markup inside markup
Date: Mon,  4 Sep 2023 12:21:12 +0200
Message-Id: <20230904102111.472125-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Sep 2023 10:22:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4183

":term:`Initramfs`" in bold text appears verbatim (no link is created).

The term link is present elsewhere in the text so remove the extra
markup.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/dev-manual/building.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 1f1642e84..a39579349 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -273,12 +273,12 @@ loading modules needed to locate and mount the final root filesystem.
 
 Follow these steps to create an :term:`Initramfs` image:
 
-#. *Create the :term:`Initramfs` Image Recipe:* You can reference the
+#. *Create the Initramfs Image Recipe:* You can reference the
    ``core-image-minimal-initramfs.bb`` recipe found in the
    ``meta/recipes-core`` directory of the :term:`Source Directory`
    as an example from which to work.
 
-#. *Decide if You Need to Bundle the :term:`Initramfs` Image Into the Kernel
+#. *Decide if You Need to Bundle the Initramfs Image Into the Kernel
    Image:* If you want the :term:`Initramfs` image that is built to be bundled
    in with the kernel image, set the :term:`INITRAMFS_IMAGE_BUNDLE`
    variable to ``"1"`` in your ``local.conf`` configuration file and set the
-- 
2.30.2


