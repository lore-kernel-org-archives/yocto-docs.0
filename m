Return-Path: <johan.korsnes@remarkable.no>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45A0C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 07:31:00 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web08.3711.1663745458465105096
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 00:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=EQg2a8XB;
 spf=pass (domain: remarkable.no, ip: 209.85.167.68,
 mailfrom: johan.korsnes@remarkable.no)
Received: by mail-lf1-f68.google.com with SMTP id z25so7796468lfr.2
        for <docs@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=PL1mMs7q/R2yauRqWZ/xBzcyTwsPwA6ux2L1OOMvmAA=;
        b=EQg2a8XBaUXirkpQaeq8qNxh7Gs3OQ4w7MNsY1wB35XZW4/WnD1CZhagUogw4G5Ybt
         FDyqjZ2bu6/6m4XhZZqM1xZvIVKNV4u59ONUeB+nNoGWvcC/G3oQfNUAx6cG3TjsyZuf
         FzU4zaUHx+oUP8SeSq9zEfhSEmwvND1Wqo9JaFDiTtPuDDmKpiGqShCwiBv4UKKTyC8Y
         j/G7xODfHDQ9MNkrq0typk+vhZuif64p+wPLqjtBg97J3exzYm3/lgMAFJ0CNAr7ZWuH
         HNg4CRM8EfOr37/8ePnb849K73anj4e9mUb808ZGKUOp8KpgJzKVu7GpLL1nGGDJfAQk
         PITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=PL1mMs7q/R2yauRqWZ/xBzcyTwsPwA6ux2L1OOMvmAA=;
        b=67QuSiydx7suzjSnueQA0YKwgDTpUJQYLBnAxRb7UqVQ28JsPtN5fXgDjIlRpM4snt
         fl5ic62Nv+oDaP63e1FVUBEyyKk7xfep33tk3F2DP1hzodCE6M2tHYCmK8d/VsS1t2rl
         1zlRl9N2fObHeHEhdSj4Mv+hLsTHVLz9MCDbw2jTTtbVXiuGbxQlAJGHXJhGLFkTr5wK
         qx8rA4GLQ9Uoxgv3HEJTQ1KP/+i/7Vx/9wwJ1h41ckr5W6w9I8Or8QpMBlqWpLsv11QT
         S6tsYY2hHrWqXhnkqfX6mVGzn5/paWCTufehcYTKCWhKmRnIyuG3LQ7MyI5lTtV3BRMR
         unpA==
X-Gm-Message-State: ACrzQf0jlg+XTeSwj5HzxRmcFt1JL5i/S6GAUaXLjmYb82nHei4zuZaa
	wQUPxdWNRQ1I54NZYS44G62TgAhb3i9Jdng=
X-Google-Smtp-Source: 
 AMsMyM5apa7UXhfIk7PWGzZlRiKstipjk61emWUq0c/n/+3QUK3gipqwl0bk6A3gN+iQHPrSSfpghg==
X-Received: by 2002:a05:6512:39d6:b0:498:f615:df07 with SMTP id
 k22-20020a05651239d600b00498f615df07mr9239763lfu.387.1663745456032;
        Wed, 21 Sep 2022 00:30:56 -0700 (PDT)
Received: from localhost.localdomain (157.81-167-121.customer.lyse.net.
 [81.167.121.157])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a05651203e500b004948b667d95sm309007lfq.265.2022.09.21.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:30:55 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: docs@lists.yoctoproject.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	He Zhe <zhe.he@windriver.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] ref-manual: variables: document KERNEL_IMAGETYPES
Date: Wed, 21 Sep 2022 09:30:35 +0200
Message-Id: <20220921073035.11141-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Sep 2022 07:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3194

Cc: He Zhe <zhe.he@windriver.com>
Cc: Ross Burton <ross.burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>

---
v1 -> v2
 * remove a reference to `KERNEL_ALT_IMAGETYPE`
---
 documentation/ref-manual/variables.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cf817e954..fea88fdf8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3984,11 +3984,10 @@ system and gives an overview of their function and contents.
 
          KCONFIG_MODE = "alldefconfig"
 
-
    :term:`KERNEL_ALT_IMAGETYPE`
       Specifies an alternate kernel image type for creation in addition to
-      the kernel image type specified using the
-      :term:`KERNEL_IMAGETYPE` variable.
+      the kernel image type specified using the :term:`KERNEL_IMAGETYPE` and
+      :term:`KERNEL_IMAGETYPES` variables.
 
    :term:`KERNEL_ARTIFACT_NAME`
       Specifies the name of all of the build artifacts. You can change the
@@ -4172,9 +4171,12 @@ system and gives an overview of their function and contents.
       when building the kernel and is passed to ``make`` as the target to
       build.
 
-      If you want to build an alternate kernel image type in addition to that
-      specified by :term:`KERNEL_IMAGETYPE`, use the :term:`KERNEL_ALT_IMAGETYPE`
-      variable.
+      To build additional kernel image types, use :term:`KERNEL_IMAGETYPES`.
+
+   :term:`KERNEL_IMAGETYPES`
+      Lists additional types of kernel images to build for a device in addition
+      to image type specified in :term:`KERNEL_IMAGETYPE`. Usually set by the
+      machine configuration files.
 
    :term:`KERNEL_MODULE_AUTOLOAD`
       Lists kernel modules that need to be auto-loaded during boot.
-- 
2.37.3


