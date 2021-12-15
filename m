Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7024DC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1155.1639588350705190696
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 09:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6Yv6W0W;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso3539320wme.1
        for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 09:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AamTlBz9kQQJ4qBYVeRFwxY6cKhipupqcXotJCECE/s=;
        b=K6Yv6W0WS/Dwxs/g15JtjBhEPgBWpRcNSHZsSAgUeuoazBoAWzP3xYYakUKY7LwaXZ
         +2uZSby+lKTY45hI8CUmSEpviX908j3Vk319IQMo6NirwmgcA6/TUvPDJcFZdbR5mYdM
         t+Nx+FzBKOb7xOVsMDVEeM14RabKsOKCeChpTzG1xaRmtAucU6Lb+gsqnHA2cNzR1nvj
         f10Tf74GVBjvd1OYof9BVOxlTgLMEvKLxOk/J68wb+dNjhUO+8Qj+147IrkHbgSDuWUJ
         B+lTrlDtmUfLP3PdoJHHLEihIcAQxHicOqymh1hJaFlejr4ggcYXFbZ8X/EStuCcZKjY
         Nklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AamTlBz9kQQJ4qBYVeRFwxY6cKhipupqcXotJCECE/s=;
        b=BjnNlSGr7FxYd7PCv+4mQe/rUcv0Isg+S+jjqreKEmEByNEMaVDz2ckTAXOKQ5I5PR
         QPAOMXrvfGaSYJnZgelFscqor1q08FW1mKs9b997K5ypUyOYne6ncTr0e9QGpnkbrmFg
         9PfkxNOH/oloJKbx4589j4FOmU3+OueV59y8QyL775faHKqZnDG9oNFy7rvEr/waH2fC
         mk9GaK/3MPdY02CGY9r6mv046r70IzwRhQdVYrmzIwfF8aCtJuV/5pICNGq1DvxqmrTo
         DLzDAqXqs1E3ScyoDkN7g7CAIyrKAo7o7Jy1fxQTHG5WBBXU3XdTmZIJwd2RsIZ5aBC/
         jA5g==
X-Gm-Message-State: AOAM5326lIKVnDuvIR+SNP5Xd+S3viMpi0EvO/uM48kTQe3E9X6rjmrV
	D2iWtqz4r++OC1vT65u5d/bSEBF5ENaY6g==
X-Google-Smtp-Source: 
 ABdhPJwAAJUNup3/WwBvCZvRqzEjcjiNHaHmzYsmSW+YZQ6sJeFj17NtRNp4JzxaOYqd0OQjKNfWlg==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr882009wmc.58.1639588348612;
        Wed, 15 Dec 2021 09:12:28 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id 5sm880460wmk.0.2021.12.15.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 09:12:27 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 1/2] ref-manual: add overlayfs-etc class
Date: Wed, 15 Dec 2021 18:11:37 +0100
Message-Id: <20211215171138.127272-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2276

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2c191f407..a5b01c2cf 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1769,6 +1769,47 @@ to the unit the following::
 .. note::
 
    The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
+   In order to get ``/etc`` in overlayfs see :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` 
+
+.. _ref-classes-overlayfs-etc:
+
+``overlayfs-etc.bbclass``
+=========================
+
+In order to have ``/etc`` directory in overlayfs a special handling at early 
+boot stage is required.  The idea is to supply a custom init script that mounts
+``/etc`` before launching actual init program, because the latter already
+requires ``/etc`` to be mounted
+
+.. note::
+
+   This class must not be inherited directly. Use corresponding IMAGE_FEATURE
+
+Your machine configuration should define at least device, mount point, and file system type
+you are going to use for ``overlayfs``::
+
+  OVERLAYFS_ETC_MOUNT_POINT = "/data"
+  OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
+  OVERLAYFS_ETC_FSTYPE ?= "ext4"
+
+To control more mount options you should consider setting mount options
+(``defaults`` is used by default)::
+
+  OVERLAYFS_ETC_MOUNT_OPTIONS = "wsync"
+
+The class provides two options for ``/sbin/init`` generation:
+
+* Default option is to rename original ``/sbin/init`` to ``/sbin/init.orig`` and
+  place generated init under original name, i.e. ``/sbin/init``. It has an advantage
+  that you won't need to change any kernel parameters in order to make it work,
+  but it poses a restriction that package-management can't be used, becaause updating
+  init manager would remove generated script
+* If you are would like to keep original init as is, you can set::
+
+   OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "0"
+
+  Then generated init will be named ``/sbin/preinit`` and you would need to extend your
+  kernel parameters manually in your bootloader configuration.
 
 .. _ref-classes-own-mirrors:
 
-- 
2.28.0


