Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447EAC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 11:22:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.9403.1639653771039805779
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 03:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mSUQx/cs;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j9so11444720wrc.0
        for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwqZaBAE84VmZtOv7qtNysWeyG5fO935/U6fMa8y7k0=;
        b=mSUQx/csqdQ8Z2WiG8rbfwAGy5dta5ZZaTh5ilXIfoPWzAmgkvzeBpuKhfpN3dZhhz
         dR3DDiyacoZ5DTJNaSLc6KOzB04dMvHUkjldw0kqJNLDsNrz2agKtj4EefISO8lK8fZB
         JIp45S68D/7q9cW7jBsw6xfceRehx9DMcI3BxqBK2YcD74BlTtUjk+WrI7G47AYBILuG
         GtXX2TPMuvCatiuJ6LkMerYL2DwKIOm23gTUMDNhBHtmB9W7Y4b/FBRvHr8CWOoFspZu
         xE3yjGYGsmIdrJXJ3/M+VxRNS6EjC4FfWxOIbP/rdYY0QGmhe60B7bvgJ2vRZFmkJQvr
         hMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gwqZaBAE84VmZtOv7qtNysWeyG5fO935/U6fMa8y7k0=;
        b=DefKzPIiaWQIJt1BcpycStsw7m34fjf5UsEUE7qPy51qS0MBBi/LqZE9B1h5OStyRx
         DWU7Ww2Vd3F9iK2maQW8wIh3xKk9Y4tkXY8BmQbi4lJvTw3dvgSKfOoJiU3jf/ZUjCCf
         H1jW4EAjk/q2ofa2xh/9uiJYRNvPh4Ep6wALP1wivYNEeY/Vnujr5ZMsbJ0S5chKaoAZ
         /kBW1PHp6jyrmfS8C8h9MZAlkE6KtrjCsgVV9MZjm7q0RzNN8aTheWUUbsUPVMqJdZH7
         qatBV+o6xzkQL49aFPMhkw7W1GSuxnGoyf3fb6LkTRga0SAtyvmsfP/lqi2YPQt3zgHR
         2c6w==
X-Gm-Message-State: AOAM5323jdjp4R7ijP5PttiQLn3un6t5+wny41UZRhrYQ8Hf4HXhmXxQ
	sl/lUsu/dSc9m5lLyiThmuNCw5SVHojXxA==
X-Google-Smtp-Source: 
 ABdhPJyZlTXRTuNJcowRjbEsyWrtRpnZGmIzpul6UbgvHEoDZ/YG8GiA8v3HjJgdzUsz8HeZW6uZCw==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr8374721wri.372.1639653769089;
        Thu, 16 Dec 2021 03:22:49 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id
 az38sm3936626wmb.42.2021.12.16.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:22:48 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 1/2] ref-manual: add overlayfs-etc class
Date: Thu, 16 Dec 2021 12:22:34 +0100
Message-Id: <20211216112235.129737-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 11:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2286

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/classes.rst | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2c191f407..b9baa0004 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1769,6 +1769,51 @@ to the unit the following::
 .. note::
 
    The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
+   In order to get ``/etc`` in overlayfs see :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` 
+
+.. _ref-classes-overlayfs-etc:
+
+``overlayfs-etc.bbclass``
+=========================
+
+In order to have the ``/etc`` directory in overlayfs a special handling at early 
+boot stage is required. The idea is to supply a custom init script that mounts
+``/etc`` before launching the actual init program, because the latter already
+requires ``/etc`` to be mounted
+
+Example usage in image recipe::
+
+   IMAGE_FEATURES += "overlayfs-etc"
+
+.. note::
+
+   This class must not be inherited directly. Use :term:`IMAGE_FEATURES` or :term:`EXTRA_IMAGE_FEATURES`
+
+Your machine configuration should define at least the device, mount point, and file system type
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
+* The default option is to rename the original ``/sbin/init`` to ``/sbin/init.orig`` 
+  and place generated init under original name, i.e. ``/sbin/init``. It has an advantage
+  that you won't need to change any kernel parameters in order to make it work,
+  but it poses a restriction that package-management can't be used, because updating
+  init manager would remove the generated script
+* If you wish to keep original init as is, you can set::
+
+   OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "0"
+
+  Then the generated init will be named ``/sbin/preinit`` and you would need to extend your
+  kernel parameters manually in your bootloader configuration.
 
 .. _ref-classes-own-mirrors:
 
-- 
2.28.0


