Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C3EC5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 15:49:16 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.8960.1748706555667425890
 for <docs@lists.yoctoproject.org>;
 Sat, 31 May 2025 08:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XKIGRWKk;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55324e35f49so3730519e87.3
        for <docs@lists.yoctoproject.org>; Sat, 31 May 2025 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748706553; x=1749311353; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39m0hNQiVxMEXxuElmxI8357OHwHYjkNM1Hm96tsr4g=;
        b=XKIGRWKkobSjqKslFl9FqxbrZ7EB2MUVb7G5BkILI3C/yUAzqIARjZyUbK1G89ldIm
         67gamCO0aivQcfd/VR1YJPjvkVZCTPVekSdHBGcgqW6WjWhJre0267jXWiphHBrXsgPb
         N9kf+3PJyY98PRLgxPuEKyZwCqRuYyqReZZOU8fuICxrBxmH/hYsvzAUgaG+BcKT0euo
         RP9p1S9QgFvpmJQQYef25wmt/xUihh/sU2ZRkO2AnaYcW0SqOPNw5KmR0BNCPdRhJi2a
         JZQKd/GAlZxSwVsE5RhY6kbDDd24HJxiYHEkwKyReOnUfofzDoMCoQzW/vR6syat2xrW
         qmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748706553; x=1749311353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39m0hNQiVxMEXxuElmxI8357OHwHYjkNM1Hm96tsr4g=;
        b=QrysehfuI0YQqLg5Dqfx9dmnHeswp7ZvxM69+E9ynVKyiF5o6SHtd07gQRUpcD6hl5
         GcURpdEX285JL5xw2ERp57KImV3iuRuNn9dcJ46IlXPg35GyxomfrlKLMGEPc0kTsZQY
         ofhngHT/al4NrxJlFLy2AIXGfWIMK+BG2eBMxes3ZSxEDX9OkfzEM2+e1DexmMizSBGC
         MbDDSKZ5F0XK5pZpaqAHfzKai/FnruoC5SpG1YI42frA00Vq/pf9rwkO1Ur1qSOPOBCt
         lytTZ9Jj5IBLvdGCm2iFie1T5qjzfvccY1SviLKee6+H8JCTQ5hlr3Y/oAbas7TARshk
         6WDw==
X-Gm-Message-State: AOJu0YwIF+sHeDwluhfQaHkXO29t3hu9PcwTaOk1OOB2iqvyQMPWu7Wj
	eAjlbaTogf0yI90cygRn7t/TP+rxhK0EYQxD0WrfLWCCbzJrgGAd5IXa9lL96Gnd
X-Gm-Gg: ASbGncv8p12GJ89ehczMeEDr5UCmI/pIisccPLGT0y5jmMjiOpxftdT5h3pZtzF3IlG
	+38Z7Le8u7YuZb9WBNblo+f9dUB6AHGSrzymoCpOnVPmiUFBYQCQGYGLfTcLD4BycdP8r4Wa2Sd
	mumgNx7YSWgw4gDdLF0wPwiazd35+R9yuf82rb8bGKY+AxIuZBKkfHjmGF7gNDYZaWX0nrvDg+x
	9ZQD0HLRvs29juwwAyaIs7hw6lsaBINv7O5F9oOMY02N4dn+wHii1XhW/saecIoiJ0nLYVrcXPs
	u7g5fxwCNIeZvu7jdI5OohYuxSrjpUPihBRTW9knq47PTtuzAZPEGXxOD720Qd9NHfzbJEVLOj+
	5m8c=
X-Google-Smtp-Source: AGHT+IGl18Zz8iUWRlSr+aUsGDuhvxKkgAM6PPWjNMqyQPMIDRbyOAiQ3lkNrGGxtoqx4ZuBILkG9g==
X-Received: by 2002:a05:6512:3984:b0:553:267e:914c with SMTP id 2adb3069b0e04-5533b937b9dmr2438686e87.46.1748706553097;
        Sat, 31 May 2025 08:49:13 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.128])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910f02sm1056705e87.129.2025.05.31.08.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 08:49:12 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] ref-manual/variables.rst: document KERNEL_EXTRA_FEATURES
Date: Sat, 31 May 2025 18:49:00 +0300
Message-ID: <20250531154900.53941-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 31 May 2025 15:49:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6951

Fix [YOCTO #15751]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c697bdbbb..2f0925b15 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5202,6 +5202,24 @@ system and gives an overview of their function and contents.
       Specifies additional ``make`` command-line arguments the OpenEmbedded
       build system passes on when compiling the kernel.
 
+   :term:`KERNEL_EXTRA_FEATURES`
+      Specifies optional kernel features to be added on top of the base
+      configuration in kernel recipes that inherit the :ref:`ref-classes-kernel-yocto` class.
+
+      This variable complements :term:`KERNEL_FEATURES` by allowing layers
+      to include or override additional features without requiring Python code or
+      recipe finalize hooks.
+
+      Features are defined in ``.scc`` files, which serve as kernel :term:`Metadata` and usually include patches
+      and configuration fragments to be used during the kernel build process to modify the Linux kernel.
+      For example::
+
+         KERNEL_EXTRA_FEATURES = "features/netfilter/netfilter.scc"
+         KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+
+      By default, :term:`KERNEL_EXTRA_FEATURES` is empty. But, some distributions
+      such as Poky may set a default value using a soft assignment (``?=``).
+
    :term:`KERNEL_FEATURES`
       Includes additional kernel metadata. In the OpenEmbedded build
       system, the default Board Support Packages (BSPs)
-- 
2.43.0


