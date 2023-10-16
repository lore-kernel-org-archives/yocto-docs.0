Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771FBCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:55:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.181404.1697493301218894267
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2ByRVg6;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-405361bb94eso57717365e9.0
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697493299; x=1698098099; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8a1XK39egV0LBYk5QhbuPas515fS723o4Wkhwuf4J3A=;
        b=O2ByRVg6qKo0Yg4PtHEs5ZK8xKB9tTlIleQpw8sIvIQMvJgNgUFG969CDEM/hMIBxN
         cQUphSYXl/7wjxP4/FxiQtuzxwFm5cVBZ6UA6/MtpnRMO0LM8Wl/wrBpivSBHrmY6u6D
         ZW4rePFndFzCKbIopDMdYAeGOIp7EPmBaKCZxXZGo7hd/WMjJyrgMiNufNFrb8vpI/yC
         EFm23s6+d7xMeTubXdDmnUMqU6QLWGBMUM2THbBW+N8Rg7J0I7TNCN8Q6ftRW90j91c6
         NubV+ySZZ2Cs8UHOzolDNitbvasTKkrepEt7mA4tdfgrkp8R+RiVZAILcEbwKJqg49jI
         EORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697493299; x=1698098099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a1XK39egV0LBYk5QhbuPas515fS723o4Wkhwuf4J3A=;
        b=aPJaADpQL+CpAmFZWKFVf0n6FVfXpB3aj0J204GylpuuXqlqow1covjAKIs43Q+hoR
         SofjYoEgna2runYjS5yr4IvWLjK0uwIoXcCLCyWcnAxFwTu9Q4d0rRPpXJb+NkVJC9MN
         w1WPohluliwMhtI3AJvnkva5jfcu5gtpyiAFrnROL2AGfr4ibMpmzZr6fYdNRWg/U5lP
         dx18Cy7+aDnWaAJGZc1g9+7YPqyIyD8A7wsc//XBHec8Uv9kEF6LZ0/rxNUJQneFyZlF
         sf6RY3xlmLuvTngf0XnxjaaT3pu7fCkWzUWN9kGfyzdxIwkNVEgQdWgLJ172JsaYcTnK
         hwvQ==
X-Gm-Message-State: AOJu0YxM4zSwk6GY/Y6nyhVpxFNa7sSUjdoeZwTgKV6mK9xinXl9Qb6B
	AmZTBfxm3tKYRhNHR3fEi19hVT+apt8=
X-Google-Smtp-Source: AGHT+IGwuandTGyqQSwdJFASbQ6aydvV99JWULx2Iz9fE/AfUj6/bGWzIl4FKfBHu1sQaiESoFvcIQ==
X-Received: by 2002:a05:600c:4f51:b0:405:4a78:a892 with SMTP id m17-20020a05600c4f5100b004054a78a892mr337068wmq.9.1697493299124;
        Mon, 16 Oct 2023 14:54:59 -0700 (PDT)
Received: from localhost.localdomain ([197.27.115.232])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c230d00b004068495910csm8084663wmo.23.2023.10.16.14.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:54:58 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 2/3] ref-manual: Add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE variables
Date: Mon, 16 Oct 2023 22:54:50 +0100
Message-Id: <20231016215450.3090118-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:55:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4386

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 40 +++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index a6e550aa5..246584fc5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6945,6 +6945,40 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`RECIPE_SYSROOT`
+      This variable points to the directory that holds all files populated from
+      recipes specified in :term:`DEPENDS`. As the name indicates,
+      think of this variable as a custom root ``/`` for the recipe that will be
+      used by the compiler in order to find headers and other needs to complete
+      its job.
+
+      The value of this variable will be affected to :term:`TOOLCHAIN_OPTIONS`
+      as::
+         
+         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+
+      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      according to the type of the recipe and the build target.
+
+      To understand more this variable, consider the following examples:
+
+      - For ``#include <header.h>``, ``header.h`` should be in ``"${RECIPE_SYSROOT}/usr/include"``
+      - For ``-lexample``, ``libexample.so`` should be in ``"${RECIPE_SYSROOT}/lib"``
+        or other library sysroot directories.
+
+      The default value is ``"${WORKDIR}/recipe-sysroot"``.
+      Do not change the default value.
+
+   :term:`RECIPE_SYSROOT_NATIVE`
+      This is the same as :term:`RECIPE_SYSROOT` but the populated files are from
+      ``-native`` recipes. This makes a recipe built for the target machine
+      can use ``native`` tools.
+
+      This variable is related to :term:`STAGING_DIR_NATIVE`.
+
+      The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
+      Do not change the default value.
+
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
@@ -8216,7 +8250,8 @@ system and gives an overview of their function and contents.
       the component is built to run (the system that hosts the component).
       For most recipes, this sysroot is the one in which that recipe's
       :ref:`ref-tasks-populate_sysroot` task copies
-      files. Exceptions include ``-native`` recipes, where the
+      files, check :term:`RECIPE_SYSROOT`.
+      Exceptions include ``-native`` recipes, where the
       :ref:`ref-tasks-populate_sysroot` task instead uses
       :term:`STAGING_DIR_NATIVE`. Depending on
       the type of recipe and the build target, :term:`STAGING_DIR_HOST` can
@@ -8253,6 +8288,9 @@ system and gives an overview of their function and contents.
       Specifies the path to the sysroot directory used when building
       components that run on the build host itself.
 
+      The default value is ``"${RECIPE_SYSROOT_NATIVE}"``,
+      check :term:`RECIPE_SYSROOT_NATIVE`
+
    :term:`STAGING_DIR_TARGET`
       Specifies the path to the sysroot used for the system for which the
       component generates code. For components that do not generate code,
-- 
2.25.1


