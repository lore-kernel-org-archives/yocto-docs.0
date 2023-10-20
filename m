Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09005CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:42:07 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.50769.1697794916861393510
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqRAHuoW;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40806e40fccso4501045e9.2
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697794915; x=1698399715; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjufGrbZrsmMG/XF/+bgJjIbmpC6psLLpJu/Ox9OiXQ=;
        b=iqRAHuoWG0wbPa2V14x9v55ZQeun5Hjz8jC3Ofn2KVGX5YW/xz4NcFccgNJnJe6fH5
         cY1PWj/iw2g+jmxUIbCG9fInWmVtGmW4Ph3ed5EmHkHqgmB4bnkl3lE54aGKTQbNqccA
         f9i2YjYPFkLjc9TRYjMKPe8IiUn4T8IqqshC1zXPeUtNFfHYQvtqfQzh0FVIMJufPKCG
         Z9gId3Jbq0ewgFtJfewMl6hnw/WaTCNzSnX0cxWSgWXqcr6Xz3Abt22OixjWxGGN722c
         zWV+kWfDdewVgVioI+nKP/qQ4FYDtxC+EIin7BSVsqVa0xh0xkCYwy0ndtPsiZ9/ND1S
         5hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794915; x=1698399715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjufGrbZrsmMG/XF/+bgJjIbmpC6psLLpJu/Ox9OiXQ=;
        b=GWDxpdZ9VJtHoTRym01MMIwL/tlvbOQu0/+mALxdfSi4kp7GLQexgxg0PpXkPAa1n8
         NIHIqZu9NyY9XdvsTQryD3DN6MqcgVEWqm09jNJvcczcqaTOnRol5WfwjYqEAz/zdBNp
         QkM6QfnEKAsZHTBb7+weuNmxA9gZwOEOTbdpQwsdKWBXTCYwcXvuQg4TZ/sDLjyytLoN
         oBgwAExV4FDwSGidb69Ru+jfGMQquyL4jLbAvp5xmTK1wjay6uiGg6bgGRW+WB2VWmqn
         rMUFkRSmEItWeHa93JVF9ZV+zlRecnqFRLXwNYwzygw/JXkE7pgSCSdy1503b9auWgJ2
         yR3g==
X-Gm-Message-State: AOJu0Yznl8jcYkoBI6CakbQooIXf7vKI6BGtQ+Ld5Q6AmXkjH5dcaWQd
	jai3+jFktToU0XUSjAoSRiUjrZlpB/w=
X-Google-Smtp-Source: AGHT+IFjHqXtqH9bzg+XM2h+mwvgqhFSZ75VM1pBhHQC87/KdELOxsHqo7OAB9N0gpI93O7hg/4aYw==
X-Received: by 2002:a05:600c:3c8d:b0:408:434c:dae7 with SMTP id bg13-20020a05600c3c8d00b00408434cdae7mr1160483wmb.2.1697794914863;
        Fri, 20 Oct 2023 02:41:54 -0700 (PDT)
Received: from talel.sofia.local ([41.225.25.106])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm6433452wmf.5.2023.10.20.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:41:54 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 3/3] ref-manual: variables: Add example for SYSROOT_DIRS variable
Date: Fri, 20 Oct 2023 10:41:02 +0100
Message-Id: <20231020094102.414940-3-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020094102.414940-1-bhstalel@gmail.com>
References: <20231020094102.414940-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4439

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1fca913e2..3faa39704 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8498,6 +8498,35 @@ system and gives an overview of their function and contents.
              ${libdir}/${BPN}/ptest \
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
+      the linking process will fail.
+
+      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
+
+         SYSROOT_DIRS:append = " /opt/lib"
+
+      .. note::
+         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will still fail
+         because the linker does not know that location, since :term:`TARGET_LDFLAGS`
+         doesn't contain it (if your recipe is for the target). Therefore, so you should add::
+
+            TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
+
    :term:`SYSROOT_DIRS_NATIVE`
       Extra directories staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task for
-- 
2.25.1


