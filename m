Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324A3C004C0
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 21:48:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.40363.1697752126239140149
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 14:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFcErR9Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: bhstalel@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so1941841fa.1
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697752124; x=1698356924; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a//i8T4GZn1VIkBQ9mAWQV7hfOQzpZLlcE2cN88gcCE=;
        b=VFcErR9YCySNtZDbRJezoHIvRnYAb+WQcKuV2mAYh1Te40TcjcFvl7wwYx0N2By9Nx
         5eOB7SKxkCS3+vB9H1eoV9RJcfYNqN8SbjPl2mlnaH6Gxq6PlCRdFMKIqjYXZfmSIMj8
         FB///3TSYqIKILZdNHtGujbxV7ATMKD6mxTC0t18FUIRSV9E0DQo76CMN6Mz6MRLaV6Q
         bmRiP3PRCszWX4jAh/ra9Hy33qCJUNFFhQrHskkVd6n2w1QaR+jXgexQwJbtiz7uyFJX
         MuzABX/yRal9UYmQlxm2sekr4OvKt0WpOU6O1fONqpbBJLTdpRj3+mLOQuz0nQnLTa4n
         hj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697752124; x=1698356924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a//i8T4GZn1VIkBQ9mAWQV7hfOQzpZLlcE2cN88gcCE=;
        b=Rybhf8mwRZGdbXDvVkDuND59mkplPs6PBRcYmnwuAW7ycgZ7v4aBwWQvjqUR271Z61
         KFCrfpwtSr/aQARiCx0hYYwwM3ihOZupSrFVNUdryvPsfFAehYt3YDBmelA0ZL2Wlngc
         tpDTWlQuvgSfLaGAXg6nBa9j9GFrR8zWOKiNdsLAVKcWx1Za0ayUbcLVNdyRzEQqwe0p
         BaBuWTwOwgDckc3c6qt4abrRYmA1u4c24T5s2UgfI/6D/pqqBrg8tpRk8MBKkbf/Q+aV
         KwCOiAizWS0q89jzVr25zVNl12uUigc30u7nynX7ogeZWc/56jMLZI07rKL/wesWeVy5
         czTA==
X-Gm-Message-State: AOJu0YwckaUnVl4SEkKrtS1Bqi4xR1qofYrwTqT0NDMG7Qj0inUNqpFQ
	A7jkBAW9PLqChFB5qahoSA+qhktNpas=
X-Google-Smtp-Source: AGHT+IF98D5P87+7KRnBLaYGqYsgIoJnedetZuT4c0IyCreTQNddmlQUfp5N150moZDcnTwVUuS2xA==
X-Received: by 2002:a2e:a4cb:0:b0:2c5:55a:b6b5 with SMTP id p11-20020a2ea4cb000000b002c5055ab6b5mr111750ljm.28.1697752123762;
        Thu, 19 Oct 2023 14:48:43 -0700 (PDT)
Received: from localhost.localdomain ([197.27.108.75])
        by smtp.gmail.com with ESMTPSA id n15-20020a7bcbcf000000b004060f0a0fdbsm5341724wmi.41.2023.10.19.14.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:48:43 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 1/3] ref-manual: variabls: Add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE variables
Date: Thu, 19 Oct 2023 22:48:25 +0100
Message-Id: <20231019214827.405886-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 21:48:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4430

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 26a5aed82..22787f3b4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6971,6 +6971,36 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`RECIPE_SYSROOT`
+      This variable points to the directory that holds all files populated from
+      recipes specified in :term:`DEPENDS`. As the name indicates,
+      think of this variable as a custom root ``/`` for the recipe that will be
+      used by the compiler in order to find headers and other needs to complete
+      its job.
+
+      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      according to the type of the recipe and the build target.
+
+      To understand more this variable, consider the following examples:
+
+      -  For ``#include <header.h>``, ``header.h`` should be in ``"${RECIPE_SYSROOT}/usr/include"``
+
+      -  For ``-lexample``, ``libexample.so`` should be in ``"${RECIPE_SYSROOT}/lib"``
+         or other library sysroot directories.
+
+      The default value is ``"${WORKDIR}/recipe-sysroot"``.
+      Do not modify it.
+
+   :term:`RECIPE_SYSROOT_NATIVE`
+      This is similar to :term:`RECIPE_SYSROOT` but the populated files are from
+      ``-native`` recipes. This allows a recipe built for the target machine to
+      use ``native`` tools.
+
+      This variable is related to :term:`STAGING_DIR_NATIVE`.
+
+      The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
+      Do not modify it.
+
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
@@ -8242,7 +8272,8 @@ system and gives an overview of their function and contents.
       the component is built to run (the system that hosts the component).
       For most recipes, this sysroot is the one in which that recipe's
       :ref:`ref-tasks-populate_sysroot` task copies
-      files. Exceptions include ``-native`` recipes, where the
+      files, check :term:`RECIPE_SYSROOT`.
+      Exceptions include ``-native`` recipes, where the
       :ref:`ref-tasks-populate_sysroot` task instead uses
       :term:`STAGING_DIR_NATIVE`. Depending on
       the type of recipe and the build target, :term:`STAGING_DIR_HOST` can
@@ -8279,6 +8310,9 @@ system and gives an overview of their function and contents.
       Specifies the path to the sysroot directory used when building
       components that run on the build host itself.
 
+      The default value is ``"${RECIPE_SYSROOT_NATIVE}"``,
+      check :term:`RECIPE_SYSROOT_NATIVE`.
+
    :term:`STAGING_DIR_TARGET`
       Specifies the path to the sysroot used for the system for which the
       component generates code. For components that do not generate code,
-- 
2.25.1


