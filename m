Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.46254.1628915323841660356
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 21:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pji21iX7;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id n6so18665046ljp.9
        for <docs@lists.yoctoproject.org>; Fri, 13 Aug 2021 21:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgTQYSQsVQaJWWT3gs8sBM8Va0cNUup406EKnbJU7pg=;
        b=pji21iX7K2+ikRB5XhrHJUXw/RsFYdTUTFYLcMYd//WbpjH8I7VsrRs/Hht3AjajUI
         RCqOT8f3MaGns8icUFwTzvBc/TdfsnHVoUO0J2zophLqyvP28sFOGuis//9RRpKS3Qgq
         gCsAqWmHtywvVWf9fksAkodKdFL2DctkOqNe44QVV0CQSXKeRTU3/R1OmxbHa7Qvz5tE
         VzO1xIpthnz80C1KQMNqS+SWN6tfe/MVopb1IAShHLAIObJlhIlsoBxJYSFs4Gc1bI0r
         VJPv1QDzqJABB45fSN3l7CLkfRXjd9dgq4ZSxBkM4OYPKrkZ9Jaw7a6l1AXD4Je1/iZ2
         65rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WgTQYSQsVQaJWWT3gs8sBM8Va0cNUup406EKnbJU7pg=;
        b=jXFOBD6a0jSww1SuTxCLJhrEFYLDw0s7f39+YejOLnfeful8EIxQp5Z4tkumO6dhab
         U8bt1+kbnED3sMccEG1Z7A+XUWjm6qIhEQVZO4Leh/b63w60nbN6pRM6AvnPXmZJGjLy
         9maIo/AfPhlP5TY6wvPiwRPXlh4pju2CVK4J2HOr4TBA3EaEPjWc/mZR3a5ehcKGm9Qi
         iIu92ku7nqunEQsdE2FEkvCRxuQOfCrfCWBMs5qSRyoR1leyv0OKDho0f8hM3nQMHVoH
         5caOAThgtHF02iATIQrvufIW/aMC6c+jBH06xPKsOZeXdgcoPkAsduea0Fowfy1rLqmd
         23Zg==
X-Gm-Message-State: AOAM532sZGaFKFvFrnnW4CbF2YyCx7reRf8/BItkcNuqPlyQVEGcTEzh
	gUreylWxjztbrUpBfzmW0Bt1kf+JyEFk/V/irf0=
X-Google-Smtp-Source: ABdhPJz0VTnwyxC89Dl/goB1JGySZ+geQ+ZyOdxEI9fv/FtCiKB1M1BT/kU/RTCUmMxF7Vfp6fyR9g==
X-Received: by 2002:a2e:a90b:: with SMTP id j11mr4072019ljq.475.1628915321768;
        Fri, 13 Aug 2021 21:28:41 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([185.253.97.10])
        by smtp.gmail.com with ESMTPSA id y20sm383771lji.126.2021.08.13.21.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 21:28:41 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH] ref-manual: add overlayfs class
Date: Sat, 14 Aug 2021 06:28:25 +0200
Message-Id: <20210814042825.124630-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a98a64c43..5d33e81a1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1710,6 +1710,52 @@ one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
 
+.. _ref-classes-overlayfs:
+
+``overlayfs.bbclass``
+=======================
+
+
+It's often desired in Embedded System design to have a read-only rootfs.
+But a lot of different applications might want to have a read-write access to
+some parts of a filesystem. It can be especially useful when your update mechanism
+overwrites the whole rootfs, but you want your application data to be preserved
+between updates. The ``overlayfs`` class provides a way to achieve that by means
+of overlayfs and at the same time keeping the base rootfs read-only.
+
+To use this class, set a mount point for a partition overlayfs is going to use as upper
+layer in your machine configuration. Underlying file system can be anything that
+is supported by overlayfs. This has to be done in your machine configuration::
+
+  OVERLAYFS_MOUNT_POINT[data] = "/data"
+
+.. note::
+
+  QA check fails to catch file existence if you redefine this variable in your recipe!
+
+The class assumes you have a data.mount systemd unit defined elsewhere in your BSP
+(e.g. in systemd-machine-units recipe) and it's installed to the image.
+
+Then you can specify writable directories on a recipe basis::
+
+  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+
+To support several mount points you can use a different variable flag. Assume we
+want to have a writable location on the file system, but not interested where the data
+survive a reboot. Then we could have a mnt-overlay.mount unit for a tmpfs file system.
+
+In your machine configuration::
+
+  OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+
+and then in your recipe::
+
+  OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
+
+.. note::
+
+   The class does not support /etc directory itself, because systemd depends on it
+
 .. _ref-classes-own-mirrors:
 
 ``own-mirrors.bbclass``
-- 
2.28.0

