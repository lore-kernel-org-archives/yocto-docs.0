Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8BBC001DF
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 21:49:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.40426.1697752142408432443
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 14:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0/781KH;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40839652b97so1081005e9.3
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697752140; x=1698356940; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcnZ+7ws16kEUPU5ojRInJB5z/zHR+ctOrmMoU3lpIs=;
        b=h0/781KHiMM3x3G7P/s7m12FvLUINzg9rGaqUW38F6wOj08b3YSCYOaC1OcaeiSSbb
         FJbMN6oCz4cqoOKE7xKctWiIwmAJr02xOVMB5Hkrh2ex/t/5pp0ZKcdlqBc8pbTCj1jN
         qy9A3L+xzQQ8jUssaUlOCq+2d5AvfV/Cjm/ii2lUUeR+YURClOdBIsbv/yfsKftU8mj4
         GfrKr+S6U5nx5uqtQHHGD8j2oHyjuU+BWouSWJP2z3lBKp/vF4pWjZo1YRMQVZ2FMkAe
         jpRSPSoT3lzE+CZkZoSxreZxJA6sTVDIm4q+sXqaDxx0Yk5+G7dBTRCk7zZNHEe7+hXs
         Y7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697752140; x=1698356940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcnZ+7ws16kEUPU5ojRInJB5z/zHR+ctOrmMoU3lpIs=;
        b=WIjjGKiTRIhdqZsiAdFre/xWRjeTAVkSTwcCbVblW3wZhMozocDkFCKTFIKmON9K43
         5DMzpmaJiKSH6fzB1Z7ppVoiMAXN4MSTrBfHcthOhak2klaq+AMHZdc2nNynA9bFiWs1
         IcVcEE2IOPopDjkyrYGBILZP1G8ZLMpzYWoLQxim2lX7hhKdutSuGuueMEu8do5PpCuZ
         7+lCC6pG/W1Ii30hJIxXZnPR/NlwLQgeyYWhEovkYxheiW9MlBV6FQyr+bDeZMTLoO5o
         7+05mwKmeniQUs3tEKodMbu4PJBJ7qEOHNuz0tW0YSLZtXp8og+BSlkPP3+5+b2BS0V8
         FS3A==
X-Gm-Message-State: AOJu0Yzx4NulkwV0h1Dam9gqm99c+qL3NDLLcPWhx+Rx23AYMqbNNr7O
	ivC1TWeifo0ZMuLzVawndO5tk1u7lvc=
X-Google-Smtp-Source: AGHT+IEdRmJee6elr/cKivy6eYZKvqVdONeNIVqhGOZTTIwc2hCXC9WkcCytE/QgVkDWB6HbRaZTcQ==
X-Received: by 2002:a05:600c:138d:b0:3fe:dcd0:2e32 with SMTP id u13-20020a05600c138d00b003fedcd02e32mr91215wmf.19.1697752140240;
        Thu, 19 Oct 2023 14:49:00 -0700 (PDT)
Received: from localhost.localdomain ([197.27.108.75])
        by smtp.gmail.com with ESMTPSA id n15-20020a7bcbcf000000b004060f0a0fdbsm5341724wmi.41.2023.10.19.14.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:48:59 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 3/3] ref-manual: variables: Add example for SYSROOT_DIRS variable
Date: Thu, 19 Oct 2023 22:48:27 +0100
Message-Id: <20231019214827.405886-3-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019214827.405886-1-bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 21:49:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4432

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 958b98fd6..8f1abf43a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8474,6 +8474,35 @@ system and gives an overview of their function and contents.
              /sysroot-only \
              "
 
+      Consider the following example in which you need to manipulate this variable.
+      Assume you have a recipe ``A`` that provides a shared library ``.so.*`` that is
+      installed into a custom folder other than "``${libdir}``"
+      or "``${base_libdir}``", let's say "``/opt/lib``".
+
+      .. note::
+
+         This is not a recommended way to deal with shared libraries, but this
+         is just to show the usefulness of setting :term:`SYSROOT_DIRS`.
+
+      When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
+      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
+      into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
+
+      Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS`, it will never be copied to
+      ``A``'s :term:`RECIPE_SYSROOT`, which is "``${WORKDIR}/recipe-sysroot``". So,
+      the linking process will still fail.
+
+      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
+
+         SYSROOT_DIRS:append = " /opt/lib"
+
+      .. note::
+         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will fail
+         because the linker does not know that location since :term:`TARGET_LDFLAGS` (if your recipe
+         is for the target) doesn't contain it. Therefore, so you should add::
+
+            TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
+
    :term:`SYSROOT_DIRS_IGNORE`
       Directories that are not staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. You
-- 
2.25.1


