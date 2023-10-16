Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70178CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:53:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.181674.1697493194805110654
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXpr0CLG;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4066692ad35so51451285e9.1
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697493193; x=1698097993; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gldh/j79a+aq6nwRavL3biHMJkarZ55wSlyl/ooIgi4=;
        b=cXpr0CLG49XNmrJCvBenJvtxKdFd8u7KO9neZxiaZakAQIIvrw9u/VgJ6pv1P0I6aY
         8VSj5wHVUnll6fvpOJfK2HeDPQGk8f/GPsUngK7PAmb3idhQCM9jTKB6vpEsVn40ytym
         xm6jcQ39S6gLK4BZ0rk6wg8gdA49FwLULhmQmcLlaAfRBaPE/3oNGwXdFrlO4/IX+kWk
         edDLXZONdjjl/k750ZZJYRqfgDu2id3L4hksDrhkPD4U7gDn4qGc0dosUVcbqrR8win4
         BF7SIHS6fRdQceRslZZ8UElkktSzK4IMLu2OAXvDX2xFuqDefBeqxzzQBHlgrs3N52M1
         XXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697493193; x=1698097993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gldh/j79a+aq6nwRavL3biHMJkarZ55wSlyl/ooIgi4=;
        b=mN1nlKcVOHXcWElT7LgMmT0NSNuN7WI6qroH+Zx5P96W3LQf0H9h513Qv+tsM7Bj5i
         ruwlwexTfSpgeF5nOGDD52EC+D6rrzkLfwCr+AA6WxJCH1w1EyyXkH2WsNf1xkkUHLQt
         9kV/zJzJIGDpDb/PpY5IqgSv7Nxfm8m+AmoA8Hte9Gt7xhoekMZJyFeQedzlX82vsMuH
         4SWKPit9Aw5ozarP2S0W4BkqWbStRmPS5bigu2PLXh7c/nycGpG4RJiP9Ii1YHnRxcp2
         AtIp4RfyLUUXLrsKrfdKHEcTabcIlD2kv0iDNb0kyfMHzwmktACRoCcE6u9h8M2ZFs5g
         EZyw==
X-Gm-Message-State: AOJu0YznCgsWYhNIMnSztq08UOAPYZUhOO5Qd9+/Cqv9S3t26lfRTpfl
	O7zRNS89LG5RQ2L3dPeUD4T8lu9UM3g=
X-Google-Smtp-Source: AGHT+IEXlRHEPvNCNx+ujTCm1RkhXf2DiEIZPf/EJDVkmAmVE/r5igW3rc6nDsjvEgx2uRmr+MZocg==
X-Received: by 2002:a05:600c:470a:b0:401:b53e:6c40 with SMTP id v10-20020a05600c470a00b00401b53e6c40mr288017wmo.10.1697493192713;
        Mon, 16 Oct 2023 14:53:12 -0700 (PDT)
Received: from localhost.localdomain ([197.27.115.232])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c290c00b0040588d85b3asm8051962wmd.15.2023.10.16.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:53:12 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 3/3] ref-manual: Add TOOLCHAIN_OPTIONS variable
Date: Mon, 16 Oct 2023 22:53:02 +0100
Message-Id: <20231016215302.3089907-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4385

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 246584fc5..6cb4efff5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6952,13 +6952,9 @@ system and gives an overview of their function and contents.
       used by the compiler in order to find headers and other needs to complete
       its job.
 
-      The value of this variable will be affected to :term:`TOOLCHAIN_OPTIONS`
-      as::
-         
-         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
-
       This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
-      according to the type of the recipe and the build target.
+      according to the type of the recipe and the build target and also related to
+      :term:`TOOLCHAIN_OPTIONS`.
 
       To understand more this variable, consider the following examples:
 
@@ -9141,6 +9137,16 @@ system and gives an overview of their function and contents.
       portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
       applying to SDKs.
 
+   :term:`TOOLCHAIN_OPTIONS`
+      This variable holds extra options passed to the compiler and the linker
+      for non ``-native`` recipes as they have to point to their custom
+      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
+
+         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+
+      As ``-native`` recipes are built for the ``HOST`` itself this variable
+      is not used, thus it is empty.
+
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-- 
2.25.1


