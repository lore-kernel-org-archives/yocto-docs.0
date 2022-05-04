Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28384C433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 17:34:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.341.1651685679734320864
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 10:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VOHi2qHH;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id i1so2033586plg.7
        for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pZMDDFkNEmOJ649FLGN190YWSHtBTE6A9t28DoyVlTQ=;
        b=VOHi2qHHQso/k/j4+2Qp+0D0BWriHJ0C1Fx/LYtk3Osw6TsmKvG6YxQsfp2MxDvroz
         mgyXYWUzmyOgiLx1vNvCRjucrTtf9EB9BD/os+uZUMzwfp+ZDRS9GGTnMd+2Y7V7Voik
         cJ2SSjxDkv/93nAB4F0Hy6r5PKULkMmzKhtEFdcKVhDeqKjEas7PeVpLvJ4QdGIQF+Rw
         withZpm/amhprfEA3e6Bfb9QUEItL8i93HbtmyNOj5H8h1zuK61cKraNvvOnSyros1ec
         F7sgvy2Zs3a8GEtQM/aw1sb3DezkbC/UBrXyXxYaJxKpdGcA9DD6Y7/BNA8Jy3hqp/49
         0GhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pZMDDFkNEmOJ649FLGN190YWSHtBTE6A9t28DoyVlTQ=;
        b=0iaUe5r0V9BpDPX+869foOYKvTWzQfArqGlMizWaP3VwMVWzVmgA+O4ndsGYfw2eup
         6CNHFXJ8orv4Ti/szBaHHp1N8PIZjG93d59yG6tQMvXi/EHWgWcDRvm3ROam1kfMKYne
         7xPtfT+U2egGICjeqj8wSvXbQ+LoRk+i3QX6UexuG6+pwUjs+XJb+ifZzLHvOLg8y9P8
         S9x7Q6237GVWwxgp95vCUAgcEvQq3HM5ZUPkZlxmVl+VwL9aUlWVdjeVu5y5snMG7o23
         JDPevof7qDyOvQEmFeMLEPs1rpyMPI7briYEzyB4dBR5d/CyJfvk7VtZES1iXJ1JiZRx
         OJkw==
X-Gm-Message-State: AOAM530wGNkgUi4NFM7I7GZn8E1otiaOqWIf7XYkW/jYaSWRJApb3hVj
	Wqf4r/1g6e6h0woc1yrCpL4ICfJlsr2Tzg==
X-Google-Smtp-Source: 
 ABdhPJxFvUM0LybYb/umqHKDV7CxFMsT3qogUIbPA51prvfGag+/T7R8uleIK21SXQRW96ARL402EQ==
X-Received: by 2002:a17:903:228f:b0:15e:be12:a181 with SMTP id
 b15-20020a170903228f00b0015ebe12a181mr7130055plh.21.1651685678721;
        Wed, 04 May 2022 10:34:38 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a170902cecb00b0015e8d4eb1d5sm8665180plg.31.2022.05.04.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:34:37 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: docs@lists.yoctoproject.org
Cc: rwmacleod@gmail.com,
	john.kaldas.enpj@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [docs][PATCH V4] Improvements for gdbserver configuration
Date: Wed,  4 May 2022 23:04:21 +0530
Message-Id: <20220504173421.41167-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 17:34:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2918

[Yocto #13722]
The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b228c75aa..c9fc585a0 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10177,10 +10177,9 @@ debugger.
 
 2. *Configure the system to include gdbserver in the target filesystem:*
 
-   Make the following addition in either your ``local.conf`` file or in
-   an image recipe::
+   Make the following addition in your ``local.conf`` file::
 
-      IMAGE_INSTALL:append = " gdbserver"
+      EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
    The change makes
    sure the ``gdbserver`` package is included.
@@ -10227,14 +10226,14 @@ debugger.
 
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
+   ``PATH`` environment variable and sets ``$GDB`` to the SDK's debugger.
 
    If you are using the build system, Gdb is located in
    `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``
-- 
2.25.1


