Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F58C5AD5A
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 00:06:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19688.1786320397575259023
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Aug 2026 17:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hqd1aVgi;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-471eeac43bfso957207f8f.3
        for <docs@lists.yoctoproject.org>; Sun, 09 Aug 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786320396; x=1786925196; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkDN+IO054SyGCjI3DYoL+XXVxgwzORLlkQOvD8Ax/w=;
        b=hqd1aVgiOjun662FZRZNeV2eHIy0m3Ow+HjCWvGT4aBao2CCxuSziBMxhypsBKI904
         sHGkMtn2VOgzL1UuaxSpnWwg3CylDQckvex03EmLOzYUtTxBVBmez2g/NgyyivyPXmBx
         E29nziVr5zn6L5ttoz9kdCwX02Q+9eV/4M8iBjMNscS5cvFPwdtkdbXNg331DeeiwbT7
         1pqT933HiOwlQt0HumOHvg+u/YAwKuWLvLuQ72nDoH3sEkX8pCWeRD55WPnZY4HqiSpw
         ulkPyQnivtbSGT/JW2B2ZJzDL7iHryLCw93GXtjiCr+4Jls/2oG/IyzCoOnHI8kWjme5
         WK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786320396; x=1786925196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkDN+IO054SyGCjI3DYoL+XXVxgwzORLlkQOvD8Ax/w=;
        b=SkRS7fNUtqw3ZOwkACHE5vU/9IQt5lmnAH6LhQr3h6OgRhUKRpBaq0gyCwSNdbOLqh
         AA/7H1qU9Mf/eAAUvYnCz7RS4HFnMMlZxUaEMEAHBYt8Y1q74t05FDWXY+LA6W7E7Oa6
         Y4QQeDU9kFBQdukpgx+sLIc7oLRSpaQeXI33nuBHAr/4fdYxYm+lAjX4uGHnZhWStC0o
         i4cP0tHNg74yK+A1jE5401oxZ82f+b+T9neXsavh1VgIlNrfdH1JOw1H7alx0OHUuWFh
         jiTGMkPxeFH+GZHQoH11rNoNJZ5dabcZCOCNySTJdtYvuyYR5zYcC3AB7PwbIANUqLtT
         MKgA==
X-Gm-Message-State: AOJu0YzSLytXDHaYT4jub3oRNlSaAUna14xoTMCg5SrHE9WuZkHoRxRU
	kBGKtNNb7ky2qpkEt25X8LOnfvMCUgYZ1HVIIMPlkXyTS7ACKbF4/4jA/K+sTfUC6tg=
X-Gm-Gg: AR+sD110bONJyjx5lmoW+HYe/UwZZmoouDv4fNQrG6e0ymebQQ6xVQITwA3GRY4aZJ1
	mxyOWU5wy3u1DHXPhsQv9rFosmAR/+kpVgnwk/Ol7BGfM62kadBFJS9IequWFTKe+uBW6u1i/ER
	sLbqc/ZbyVsSPzqmUzuVKGPEXxOOQQjrSKNOkJb96KGidGlztnh9v7+2fA792+/si1PMW1nOkVT
	8FYDHGMhGlBqJX8/3LlRCw+3S2wumkHHGLdzg0Swe/aMsla90v45ZXXtPli6h14DVGXVCnnpo8U
	c74+WyvtHpqWB5qn1pOSAvdaVe0+fTw2xMn43GpPmgkSWK6Henpc12w/v47C6m9xntdE5vk1fDX
	bkXBCMYsXEdl7tbtlsYuWDFxbajiYne9qKMuiu+hG+3ZsM4l9R1sqF6cmk+D4W53oVmFerAWcBy
	kUjdxqijK8WD7ntIs6eJWP/YjUqgUz6IpJ+mOUlQKjmJciLvjV159qVlSzErJehQqT5aUGj62jz
	eyAjemAEsp+q/za31DLpOtyFAiZW+YVJeOKX+EhRCuDNv+ZWmwDKPPhk23lJMOih561tNyzSIbc
	CnXUsQE0MdOB/fM1K55kh+4utjBmO6x6
X-Received: by 2002:a05:6000:290a:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-47fec478c10mr58092814f8f.0.1786320395551;
        Sun, 09 Aug 2026 17:06:35 -0700 (PDT)
Received: from aniss-macbook-air.home ([2a01:cb15:80cf:2100:b451:7f4c:a226:efb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021fd392sm26616440f8f.31.2026.08.09.17.06.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 17:06:35 -0700 (PDT)
From: anis <anis.bougrine10@gmail.com>
To: docs@lists.yoctoproject.org
Cc: anis <anis.bougrine10@gmail.com>
Subject: [PATCH] ref-manual/tasks.rst: Make do_clean description more explicit
Date: Mon, 10 Aug 2026 02:06:33 +0200
Message-ID: <20260810000633.51112-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Aug 2026 00:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10245

The current do_clean task description is generic and does not
specify which files will be removed.

This branch adds details about the files that are removed by
explicitly listing the affected subdirectories.

Signed-off-by: anis <anis.bougrine10@gmail.com>
---
 documentation/ref-manual/tasks.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 3517d0b91..28de10d56 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -17,7 +17,7 @@ you can run:
    $ bitbake -c listtasks recipename
    do_build                              Default task for a recipe - depends on all other normal tasks required to 'build' a recipe
    do_checkuri                           Validates the SRC_URI value
-   do_clean                              Removes all output files for a target
+   do_clean                              Removes all output files for a target (``${WORKDIR}``, sstate manifests and stamps)
    do_cleanall                           Removes all output files, shared state cache, and downloaded source files for a target
    do_cleansstate                        Removes all output files and shared state cache for a target
    do_compile                            Compiles the source in the compilation directory
@@ -501,9 +501,10 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c clean recipe
 
-Running this task does not remove the
-:ref:`sstate <overview-manual/concepts:shared state cache>` cache files.
-Consequently, if no changes have been made and the recipe is rebuilt
+Running this task does remove the ``${``\ :term:`WORKDIR`\ ``}``, the sstate manifests
+and the stamps.
+However, it does not remove the :ref:`sstate <overview-manual/concepts:shared state cache>`
+cache files. Consequently, if no changes have been made and the recipe is rebuilt
 after cleaning, output files are simply restored from the sstate cache.
 If you want to remove the sstate cache files for the recipe, you need to
 use the :ref:`ref-tasks-cleansstate` task instead
-- 
2.50.1 (Apple Git-155)


