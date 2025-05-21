Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80900C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 10:16:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.7840.1747822607722989280
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 03:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/ciJDqS;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso60541081fa.3
        for <docs@lists.yoctoproject.org>; Wed, 21 May 2025 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747822605; x=1748427405; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Evj3lOm29Wv3hU2ZsdWVyHQ2OhX/Y3JOsFgcFlO1uNM=;
        b=V/ciJDqSV7+zrRKTM0CxQS48FgZ7ldAbIVohXMiAhCbvhbJqKGm404A8ZETlKbKttK
         bnacGvm2KUfasCJPiM/vcyLRWZDKkuttogKtE28Cpwn4Z3I1MpiR/zOTmtzgisekX1CP
         KMiwv2Xy7EM0iCNjKan8eB76hoTY7bqMeLvp+M+eTkvyECsiQkPYiN+HH7EJEAu/XaMa
         SP3pnyeHJXI8Jekl1W/e5kITSeVwIKBb3r+4MM76wEfJVX0q+f/L6sNJY/0lTOy0eeC4
         FWpr7p6RI7BGoIa7Sdt8DUs9CAnBOy/4hPcvkW9XDAlFoFiJ/gdnxPut+Mlm5wv80Tfn
         kw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822605; x=1748427405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Evj3lOm29Wv3hU2ZsdWVyHQ2OhX/Y3JOsFgcFlO1uNM=;
        b=RZlpXN6397V0j94vjvGxiRpG2M80uwLAkHX8bHKziCoBMWHS/fVQ6FL//0+Nwdk/Rq
         65aKukW+6tG1KoVJT+Hl5hYz9FUZj5JasUkqbx8DUTprj1WAaknHFg5iX8gwW98pOTDQ
         I+eweAPo23Cvs+VS6yQUKLDJC1k2DOcn/P6USawHiDdFNi/N8EQ716GTeNMdITnbw/gN
         vQ0jpzoSC8Vm58lATVjIIg6Ewv+Phmo6U0WZeX2p8cSuX/0oVrpolzf/b1HrqWWYxhoM
         U8S3vukDHHOWtCu1g4U4BJ82BdEo+kBXKK/lprVY1Ba+EZOedzyzIZT8r1l9ExnoAKf1
         FBWw==
X-Gm-Message-State: AOJu0YweqDjUaH3ISC0oYk4r21FqjithPPz5O9kE1hybsomjUKOe+JSl
	aXHaKntHaEjPO2tn3CB3JD4LpijTwOfc1WD3nXTdFUEJW27r7wa630erKnQcSs2x
X-Gm-Gg: ASbGnctp/uN7kzfz0np4I6QAbuKMfWR7Nx3dh0yktSmKxPme/iJmDP4r5xyOBxXMtWO
	BVist/0bkgBB+imIRzdfT3OjXQXviSZz5/1eeuk/ztkvpcZDNUjqsnUTA8G887h/XvL/ImbNSMG
	bRS+PWmQ/m62gtqk4oQ7K4BRHGOQrWShIGk5olWf5exCQc3rd5qQQX6JbC0ntQ+zfVR+nov2vDj
	A6WK1MBQTv94ZtLOUsI1dLMH3hCc2bjVm4nAo4VoVjBbycjGYla0NwJTruWfZufK5Om1liHw+vV
	ZkZWK9yzciySttmeJpQUV+0LO0CZK6/cTINOAlQSUkLXY+lCnHTUS6LEc9Zcy6wZ81VN
X-Google-Smtp-Source: AGHT+IENO/xp4wMrs6FGnvH545fso7wWQ02DfE+zGzst4L7NCUJY9azVIwBK7QXeerMilRycbhyfJw==
X-Received: by 2002:a05:651c:4087:b0:329:799:5eb8 with SMTP id 38308e7fff4ca-32907995f3dmr39863281fa.36.1747822604969;
        Wed, 21 May 2025 03:16:44 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.152])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca1fesm28725701fa.31.2025.05.21.03.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:16:44 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] ref-manual/variables.rst: document INHIBIT_DEFAULT_RUST_DEPS
Date: Wed, 21 May 2025 13:16:29 +0300
Message-ID: <20250521101629.38006-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 10:16:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6859

Fix [YOCTO #15755]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 documentation/ref-manual/variables.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..d74ad508c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4496,6 +4496,23 @@ system and gives an overview of their function and contents.
       Set the variable to "1" to prevent the default dependencies from
       being added.
 
+   :term:`INHIBIT_DEFAULT_RUST_DEPS`
+      Prevents the :ref:`ref-classes-rust` class from automatically adding
+      its default build-time dependencies.
+
+      When a recipe inherits the :ref:`ref-classes-rust` class, several
+      tools such as ``rust-native`` and ``${RUSTLIB_DEP}`` (only added when cross-compiling) are added
+      to :term:`DEPENDS` to support the ``rust`` build process.
+
+      To prevent the build system from adding these dependencies automatically,
+      set the :term:`INHIBIT_DEFAULT_RUST_DEPS` variable as follows::
+
+         INHIBIT_DEFAULT_RUST_DEPS = "1"
+
+      By default, the value of :term:`INHIBIT_DEFAULT_RUST_DEPS` is empty. Setting
+      it to "0" does not disable inhibition. Only the empty string will disable
+      inhibition.
+
    :term:`INHIBIT_PACKAGE_DEBUG_SPLIT`
       Prevents the OpenEmbedded build system from splitting out debug
       information during packaging. By default, the build system splits out
-- 
2.43.0


