Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.14823.1629663308852847627
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Aug 2021 13:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WKRJz40A;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id i28so33415007lfl.2
        for <docs@lists.yoctoproject.org>; Sun, 22 Aug 2021 13:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1/PWVRovcrj26LR3onknnGV8+Q+jSizYJ97jiQ4XRM=;
        b=WKRJz40A3Vf+zLWxF/XpFFyyMrbcbvcylkfNG42tUDAleLEjtZwlB4pPe6/0Dhyez3
         O9KVkhJRClujP+kg9TF0kZkqMH8Mo/Robiaz0UiYmPPWCRe266sQ7zKWVbadV/Grvsj7
         j0Pr72CtvydRPecsIgH94dptVjvlZYSit5viz3U8GS55XgMAFe31MruQL55yPtOgsSPf
         8qAaeFgybpfCwoKW8VXqanODUyraEirIAbNunYl3x15KeDyX+D3KAWbEgQuAZQT6TAo3
         7jIOFu3+3RrV9JYEOgSqTjv2dQ08Scmm6g0v4T+Tr3aKptwRRxsbiGCXVEOdQR2VEsKF
         emBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1/PWVRovcrj26LR3onknnGV8+Q+jSizYJ97jiQ4XRM=;
        b=ZGrALmtpkquVhfXetcx/i9rcDSuFVfz6VrOsO7H1UWZwcN2COpB4E/3qh2Cn9xXtPW
         Dvoq39YmU+EzTeleBCj2W0n6Yh5YKBjBaYNPevvfGXaRM9PAZI5s5+i3mtNJ/9/oMA6F
         x7tjmQA+h8yc6pmZKTwOj2MNpW2yiXKsE+R6tdl2uukqeGMKUpIGr/o9s2QVY9yLpM9w
         pwXe5hl/sZlxvZDmajlWKzVwKUNkveAS3BluuY16SrJTyG8CncH5PRqUuYxo+wnH2DAO
         ttjrCHlntRB6OhdJdN3UNXEBUjVmGUY5NSyTaNjpr4UaaaULuxfIvPF+omTfhlSuVUJY
         GZlA==
X-Gm-Message-State: AOAM5335HefS/dUTFGmA7LGVrWsIM/4fwloQSCehK1rbiGoijBykSwHk
	tNwewPuzSZxaU4oZBEuxBtntMDU8Mlc7wg==
X-Google-Smtp-Source: ABdhPJwDqccfAqeAG6FBjQ9nOe7EkKaNW2ZesVSdkrMLN5GVMhYq1pGaKXrrwEyVZJ/Kn6FBf3v2lg==
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr21993593lfu.349.1629663306776;
        Sun, 22 Aug 2021 13:15:06 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id y3sm1067951ljy.60.2021.08.22.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 13:15:06 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2] ref-manual: add overlayfs class
Date: Sun, 22 Aug 2021 22:14:54 +0200
Message-Id: <20210822201454.125952-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3af023895..ca6430034 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1710,6 +1710,55 @@ one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
 
+.. _ref-classes-overlayfs:
+
+``overlayfs.bbclass``
+=======================
+
+It's often desired in Embedded System design to have a read-only rootfs.
+But a lot of different applications might want to have a read-write access to
+some parts of a filesystem. It can be especially useful when your update mechanism
+overwrites the whole rootfs, but you want your application data to be preserved
+between updates. The :ref:`overlayfs <ref-classes-overlayfs>` class provides a way
+to achieve that by means of ``overlayfs`` and at the same time keeping the base
+rootfs read-only.
+
+To use this class, set a mount point for a partition overlayfs is going to use as upper
+layer in your machine configuration. Underlying file system can be anything that
+is supported by overlayfs. This has to be done in your machine configuration::
+
+  OVERLAYFS_MOUNT_POINT[data] = "/data"
+
+.. note::
+
+  * QA check fails to catch file existence if you redefine this variable in your recipe!
+  * Only existence of the systemd mount unit file is checked, not its content.
+  * To get more details on overlayfs, its internals and supported operations, please refer
+    to the official documentation of the `Linux kernel <https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`_
+
+The class assumes you have a ``data.mount`` systemd unit defined elsewhere in your BSP
+(e.g. in ``systemd-machine-units`` recipe) and it's installed to the image.
+
+Then you can specify writable directories on a recipe basis (e.g. in my-application.bb)::
+
+  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+
+To support several mount points you can use a different variable flag. Assuming we
+want to have a writable location on the file system, but not interested where the data
+survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a ``tmpfs`` file system.
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
+   The class does not support ``/etc`` directory itself, because ``systemd`` depends on it
+
 .. _ref-classes-own-mirrors:
 
 ``own-mirrors.bbclass``
-- 
2.28.0

