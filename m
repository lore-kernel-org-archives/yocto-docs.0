Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7ECC83028
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.8565.1650036566744585026
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 08:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QRkYGIKk;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso7334157pjv.0
        for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rs7rqh22IL32pltiNPrVailgbTKxC3eomW3fGpV9tgo=;
        b=QRkYGIKkSGRSCuuLsZJ6YIdWmc7TbVJxYZ8r8158+23FVzaoAbXMBO6+Z4nAh+O3xD
         1w9t5svMBcmEUFMXxABHXJyH10f9Evi8+/iBt461aNEgOatm/Do1qOOt+W5ZZlTdpfH3
         sd34bkBMesJIOXB1oNLBDgFke6iWjVRlrBBLKiWigOWowZ4TUVYQ1N0aiCm4ZcjoykEM
         3p7GUXVTEVrxRCQd6PZ1HEC+GwvhBX+nKQcncdNyKaGCTeCVIeORAJN8e7QnutnjswCj
         4DM6L6HTawwf/qzmeg8u98g7V9wShirb92fc53uBnocHqvCSBh1iwoTyOuB47fEX4n2P
         j3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rs7rqh22IL32pltiNPrVailgbTKxC3eomW3fGpV9tgo=;
        b=4DwbPIjmlpsnla6gU5AHz6f6ooVBtPGlbuQHs8l/pnOjVb1x3ZL1eBcHgq0E40UTVi
         6er0uNsrEf2myDdF0O+jCI43QWwu4gclUd2l+slFqOQuJhkeA4UI6KEffPMqXpVru2+s
         XGfQWlo4hMnMoCLBppdQ/CYToxX9qxv9dCBFdVwLSlS2DzWMfKCrN7kQE6GQ6gHtYXZ3
         /YzodaSQr2KlHpoex751/i81DFOjiOCZWgJNv48S5pEyLAhhZaYnzf61cWmQrr7jbNZF
         XptpdMkLJyackpfj3DylidR5DH/rZVcul4MXB6UXXV3EcT7HidckIiOL4dsSrrtl85oB
         APVQ==
X-Gm-Message-State: AOAM531WJ+OKn/MQqv8nBAlOzhJS3RkuKR+F9+QBbR5YV8tsiybgsiT5
	5AuVBymWQ7HsvOrXuT7or0XZrhPGKuUcjqxO
X-Google-Smtp-Source: 
 ABdhPJwwFg0x0qH99kk9l+icFUmk3Z2QqtV1x8+NtLEvLmVMzYXarseFMziEz6YZQb+cMcxA7Xvgtg==
X-Received: by 2002:a17:902:e38c:b0:158:a037:c4d0 with SMTP id
 g12-20020a170902e38c00b00158a037c4d0mr13031097ple.75.1650036565787;
        Fri, 15 Apr 2022 08:29:25 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b0050591e66508sm3563528pfj.220.2022.04.15.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 08:29:25 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: docs@lists.yoctoproject.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	john.kaldas.enpj@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [docs][PATCH] Improvements for gdbserver configuration
Date: Fri, 15 Apr 2022 20:58:48 +0530
Message-Id: <20220415152848.364686-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2776

[Yocto #13722]
The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 9d4aaa5a6..0e989f78e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10181,6 +10181,7 @@ debugger.
    an image recipe::
 
       IMAGE_INSTALL:append = " gdbserver"
+      EXTRA_IMAGE_FEATURES_append = " tools-debug"
 
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
+   ``PATH`` environment variable and sets $GDB to the SDK's debugger.
 
    If you are using the build system, Gdb is located in
    `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``
-- 
2.25.1


