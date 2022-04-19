Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B01C352A7
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.3155.1650368764694802189
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 04:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LHQ9EBGg;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id j71so9728849pge.11
        for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wrEJtiuwUznmqiod1UoTwKWjINM8bUM4v3JixUb3knU=;
        b=LHQ9EBGgTTZHD9oRAPPU2NyoRo9ALoYlI/W7hz6kBWTVQO75n+0AkaGwnJnUsiLVgr
         dPCpmNeIzw+e+ZI/PSr/IWlZpjNsWvxghikNlRjh50ZcayhusHXSNVinsbIesXzV1xB0
         0P8r/DK1HLoewFrnb2EfL3F8YFNNmJ6vGP3uNwhGUvD93SdyplctQDjai+GXLTDaEbK/
         VC6TXg+zItxjP4JDbZzcr5Z2LAHOn+JQVIDemQbTz0SSwtpR+sTYPLnF1N4gtEvjj4Ax
         K7LdJBTNqdML8DUMN8v+JN8MDvJcSHus+sFAgWoYedV0g2isO2BLxQKjquH+W0lq5aFX
         wMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wrEJtiuwUznmqiod1UoTwKWjINM8bUM4v3JixUb3knU=;
        b=YaOpbMxMR9XTF4Zn9LSjlPVP+MDk5RGGT89r7/Cg52+Ge8b1cmoSMrEazch0tGWBVo
         /L/q1BIT5fnvj24aafoGv9KKBBAi1c0CgAmo99FhLqZYXfEIevCivz4PG6lsLmBrS1oD
         nOr+zvHPcqHsW4bmsCEYQUYdTVPzJ5NV6tHWb3Odqvtvb45P+rv1apKqckUAmrWPvdQa
         OIg+JGkP1o7JfEMx99QucztKdCw8E9NlIpWj9bR6CFMW7bkeAWU6dOHWMaBaqPfqjNhA
         4aTkCSgKuLJWnH0JLHRYN4FvGMA70yggcM3afBimWL2CQiBt94810+7i6/uCxAToSKSk
         E+MA==
X-Gm-Message-State: AOAM530ikHBN9xPNw0xWCky4LD/znrWB2Pxl576BWo+LpsoJ2Ykbo0Uy
	6SC339pEchPUO/JLOmk5jitM8o3FRxWYNKmU
X-Google-Smtp-Source: 
 ABdhPJxcra2Nwo8N0a7RdM9gNycoyXwNY9/ADI8Q1/6n5DNq2RD/Ewb4aDYFkx5nc93qvqmP62X5VA==
X-Received: by 2002:a63:8f45:0:b0:398:d78:142f with SMTP id
 r5-20020a638f45000000b003980d78142fmr14547551pgn.162.1650368763560;
        Tue, 19 Apr 2022 04:46:03 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 f4-20020aa79d84000000b00505f920ffb8sm16608358pfq.179.2022.04.19.04.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:46:02 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: docs@lists.yoctoproject.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	john.kaldas.enpj@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [docs][PATCH V3] Improvements for gdbserver configuration
Date: Tue, 19 Apr 2022 17:15:48 +0530
Message-Id: <20220419114548.12921-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2786

[Yocto #13722]
The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9d4aaa5a6..5c4f0028a 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10181,6 +10181,7 @@ debugger.
    an image recipe::
 
       IMAGE_INSTALL:append = " gdbserver"
+      EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
    The change makes
    sure the ``gdbserver`` package is included.
@@ -10227,14 +10228,14 @@ debugger.
 
       $ mkdir debugfs
       $ cd debugfs
-      $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image.rootfs.tar.bz2
-      $ tar xvfj build-dir/tmp-glibc/deploy/images/machine/image-dbg.rootfs.tar.bz2
+      $ tar xvfj build-dir/tmp/deploy/images/machine/image.rootfs.tar.bz2
+      $ tar xvfj build-dir/tmp/deploy/images/machine/image-dbg.rootfs.tar.bz2
 
 5. *Set up GDB:*
 
    Install the SDK (if you built one) and then source the correct
    environment file. Sourcing the environment file puts the SDK in your
-   ``PATH`` environment variable.
+   ``PATH`` environment variable variable and sets ``$GDB`` to the SDK's debugger.
 
    If you are using the build system, Gdb is located in
    `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``
-- 
2.25.1


