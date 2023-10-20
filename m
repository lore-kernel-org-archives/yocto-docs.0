Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CA6CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:41:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.50762.1697794891025678906
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q26mU6gc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40651a72807so4583555e9.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697794889; x=1698399689; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUGM0SFW8d2ocIocFdgFtMCyCwUYtBf0kbINboCyB3A=;
        b=Q26mU6gcDqQs6iepmMDffMBYfx0R4bigk3mSZ19NVIbT3kZR980QlTZs7iPW9AD80r
         9TupihVAhFjXyeOezz5NeimYJbyj5Tro9sO9aZaVOJHrDpWWWLUH3UwzImde9eC2Sdqb
         BJiO/RMAICWXAc+bzm9Yn/FycpXcuBdwgcpltqWDyDASRWXI3LR+Zq3M2v8jcqzN7c56
         zc7phH6w2ZbeZFo8vJEY3n+uPUQBqRKqcbZyRJ0UZg98XzHVWNYYBn79Fvy6t+MCSBVH
         biHtig/tODReGCgtw4FeVWX/EMTmk6sJpf+JtGgXgTX6NZ/rcwmulCzCnaqQxzxamonb
         4l/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794889; x=1698399689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUGM0SFW8d2ocIocFdgFtMCyCwUYtBf0kbINboCyB3A=;
        b=tGBySj3t6ynXsN1stIQjE9qHeKdgd1N6r9ka2R2iGUGPzJsDiHriCvgiF1nrulQmEE
         F5WCZqt/eVOzftbUOzLCmRyIjKIcM8CbvAiOhBrD5Y3e9TeIic3sqStjjUpLfAD01HKr
         3tXiHeoW35ALTb3exPRT5ugAtgi9GVmnnyQQikFfmv4slyR8eU7hNvqCL4/1Fc67jta/
         ZUSzW1GUFaMqPBQ+Gl0bsV+rRVnjN2QRumeNqncSKDjiy8D7NuSY+fIoozRq6F14/H7q
         i9THoIINe2ZnTDw6z3+jlcDHGRcw7YKPGSvEMWKErr65V9sea0/A7jANFwNrV+fsLEyA
         EmkQ==
X-Gm-Message-State: AOJu0Yz9O8Q+zkFoOVpRHUoGRFUoVcZL1ql70ebjEuIkQ/JPPD/rgTWA
	XSLdxCueGGT/prQQjLWFWWSjApNMwXw=
X-Google-Smtp-Source: AGHT+IFv7C8Ob+gQcFzu1PTGMXOSTYmxAu3R+a0o569iu4MhN4NQYhd9sJv3/631fUB8iwA6B/4/cQ==
X-Received: by 2002:a05:600c:1c01:b0:405:1c14:9227 with SMTP id j1-20020a05600c1c0100b004051c149227mr1053696wms.33.1697794888880;
        Fri, 20 Oct 2023 02:41:28 -0700 (PDT)
Received: from talel.sofia.local ([41.225.25.106])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm6433452wmf.5.2023.10.20.02.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:41:28 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 1/3] ref-manual: variables: Add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE
Date: Fri, 20 Oct 2023 10:41:00 +0100
Message-Id: <20231020094102.414940-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:41:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4437

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 26a5aed82..b00445946 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6971,6 +6971,36 @@ system and gives an overview of their function and contents.
       in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
       section.
 
+   :term:`RECIPE_SYSROOT`
+      This variable points to the directory that holds all files populated from
+      recipes specified in :term:`DEPENDS`. As the name indicates,
+      think of this variable as a custom root ``/`` for the recipe that will be
+      used by the compiler in order to find headers and other files needed to complete
+      its job.
+
+      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      according to the type of the recipe and the build target.
+
+      To better understand this variable, consider the following examples:
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
 
@@ -8275,10 +8305,15 @@ system and gives an overview of their function and contents.
             for ``-native`` recipes, as they make use of host headers and
             libraries.
 
+      Check :term:`RECIPE_SYSROOT` and :term:`RECIPE_SYSROOT_NATIVE`.
+
    :term:`STAGING_DIR_NATIVE`
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


