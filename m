Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5961DCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:55:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.181421.1697493331071840416
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jgRyY7nO;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-405505b07dfso37605965e9.0
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697493329; x=1698098129; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBskgLKfER2kcvXXKQdp+NLGxcHAacu4bLwkk1L2NoA=;
        b=jgRyY7nOAjPHZ0jz4FMg/GxOWjZRCN1QkVaXi8144ajFjTEqFQ8qH8zON0/arJYv3B
         usYOYCQ+4BMZtUlrz8ZxVGS7DwwpgmPjYM1mwWO2fsbmpqmQesQobor6JVimHllnmsJg
         qpzQ09uoXj/prJ9a5+kK5KluGFehQz01jkNwaKW28ypJMbTEywRXlLjzcMArMJ0ygl8X
         3ehkA1JB1CL6SaPvSz0BjfuXeImh1ZDxbUG3q3XnxccIMnat+XZRFRj6svdCAktqKUAU
         gAWHRzFBbZGJOuN9F4vfo36oZju0CtUUT0RVkc5QvTZWruu4VBFtTMlwnIYSlKzW5Pn8
         W89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697493329; x=1698098129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBskgLKfER2kcvXXKQdp+NLGxcHAacu4bLwkk1L2NoA=;
        b=MKPe3gYyKZB2UI/rXSHv+6xEWGXesps5cyf2oa3gyxekkmSNEK5zUKMb+LT6MI8fTY
         LM/gNud3PxHG8CSxRRFNjuiCVxJ5DChUvXfLzWDmjRk74WkAMNPvNQy1oRWKuQd4Cj4S
         aG6LhRoLysSg7ivOHGBi+wRSUpk09erwjgVwV45o/OVrU6bvvCCfaIM3asAxDmdak+/L
         iCn6S79+t5LAJMj7S3YhDSehvkSQnX0qhxZY/6X+HJHrP3GQCsoVFDvKqKHa0aDbpaCs
         t+4UBeEwKYuGroIAxo1qIFDIWqPA841HW36A1WW/QLhSQ4SOJjH5nUU7RobiXX2tRjDB
         pLJg==
X-Gm-Message-State: AOJu0Yzg+owxzQaUGXcnRzg6mmL7lhWkvOBv5Yf5YJCV6ZzmTk+/MpL5
	sJg5u0TkkwPdVqF+PBQryBYgOyhzrz8=
X-Google-Smtp-Source: AGHT+IGlYB9hpUOpfDe21hIBWTyWnWTrDWh4/AnmS6D4pnKYnQ3DfUEHpGvqbcxisCe/eIpYKWnZSQ==
X-Received: by 2002:a05:600c:1f8e:b0:403:c70b:b688 with SMTP id je14-20020a05600c1f8e00b00403c70bb688mr17951wmb.6.1697493328873;
        Mon, 16 Oct 2023 14:55:28 -0700 (PDT)
Received: from localhost.localdomain ([197.27.115.232])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c4e4d00b004065daba6casm8194123wmq.46.2023.10.16.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:55:28 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 1/3] ref-manual: Add example for SYSROOT_DIRS
Date: Mon, 16 Oct 2023 22:55:24 +0100
Message-Id: <20231016215524.3090203-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4387

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c52271e8b..a6e550aa5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8414,6 +8414,35 @@ system and gives an overview of their function and contents.
              /sysroot-only \
              "
 
+      Consider the following example in which you need to manipulate this variable.
+      If you have a recipe ``A`` that provides a shared library ``.so.*`` with all
+      required symbolic links for it, specially the ``.so`` link, into custom folder
+      other than "``${libdir}``", or "``${base_libdir}``" (example: "``/opt/lib``").
+
+      .. note::
+
+         This is not recommended when working with provided shared libraries,
+         but this is for the goal of understanding an example for :term:`SYSROOT_DIRS`.
+
+      When a recipe ``B`` :term:`DEPENDS` on ``A`` it means what is in
+      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
+      into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
+
+      Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS` it will never be copied to
+      ``A``'s :term:`RECIPE_SYSROOT` which is "``${WORKDIR}/recipe-sysroot``". So,
+      the linking process will fail.
+
+      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
+
+         SYSROOT_DIRS:append = " /opt/lib"
+
+      .. note::
+         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will fail
+         because the linker does not know that location since :term:`TARGET_LDFLAGS` (if your recipe
+         is for target) doesn't contain it, so you should add that::
+
+            TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
+
    :term:`SYSROOT_DIRS_IGNORE`
       Directories that are not staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. You
-- 
2.25.1


