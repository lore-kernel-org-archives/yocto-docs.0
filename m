Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A800D5A6FE
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:29:51 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.41370.1732609781556500547
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 00:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JGtI1Kha;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53dee064f00so107498e87.3
        for <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 00:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732609780; x=1733214580; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0S3pMLZq1PVyutMzEO6J9Rt32dMsY2xTDQTwZOaIa1o=;
        b=JGtI1KhatQyusAg83keCe2lWND64tPBMNLrg0ndK4JnljcQbUWHYeeqln3BQXBQndl
         +fGLMlO2Ca4QgCuEv9RsrAoknX676og57ggJdPFSP9OjdIPIlQtnQ0fiXdvQSwyKG9TQ
         GoSyG55u+Vo/IrH3718DP7frdJb8YDsIkG/UEwHUjkFn8t7Y/Dm3E4sP45uNyD/WCcqR
         nUDzUQgMfmzRe7NU8F+07KuHzblNJfent8aFiGSPKxNW37g0FJC+yZdqulyPS/RusFs1
         ZjQkti6yOtufjy6iRCyBbzUu0H5K3aUD58wiweylUbj+az1Y8WLFZlyZzhGIPys7+Pk+
         8pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732609780; x=1733214580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0S3pMLZq1PVyutMzEO6J9Rt32dMsY2xTDQTwZOaIa1o=;
        b=Zco/yEAfgsIgpnO9tm2gZhS5G+K7l05F/5c6Pc6RmOA1/2yR7ojyorMylI+EXNuLp9
         GWt6rWORnfHKIvblzw8UDOdeptVQw3iTLtYi3in8jaPJil8sRJsCMP7aCPj1BWt7sCxQ
         uuFWNKmr3+R/ON94u2cMJOO9WgnJvtXqMctBkVeDfyIpXkOrIlOVmqgCG4gKrJn/3WVQ
         nTfBnUjsxDsZsR9+VKUrAt9hTrHK7HbBp+RYuM7MEdou+byG+L5lSeGLRV/z5jHs64pq
         JkRzSiyRU5VshR+ICGm9hzSlUviPuutJEh/NkiBjh9wOIMTP65+45M1PKqbjEwB1jQCD
         fjmg==
X-Gm-Message-State: AOJu0YxUC8SZ+udK4i2Fuha4HV+/IfxI03j4eGzpWeMN65oGMxUP7SSp
	2iBNHzgMH4oPS0SYTgmoKYSXDc/8t1OsVPXj14cRyfnvdeI5psH403shdWOC9FRijJhNui9/PFN
	8
X-Gm-Gg: ASbGncvcvvwD2t5/LjNRjLpu7R27ZYvOhCcLvEvF/YkmB3XZeWe0r9yEsNvScGdeYdT
	Hy0tIe9a5GXxbrI44ADNFnSIn1QQvU0NE+gndzWJ7CQbmiY/zirhDN4jzyo7555NvL8OLcM5eJ4
	DeUqcwi7re5Gj5iu+y3zGj7mFGfP/5RIFYQUIoKIuOBIuDSzfEPc5siTHaZeQ2LJlXCx5aPmTTZ
	7wmc+xYIP5ofpPBlRburfUN/NGWfEPgRoV7G1XUTAJ/HBQDTASUbH5lrgrvVP6VlT9SIjgW3TtB
	7P/vOZ58v4MiRGczbJlUCxmBRtjXmGtN2Vb8QA==
X-Google-Smtp-Source: AGHT+IESKDxe3Lez9jKLei4A/SDDCmzAkDPeCECTmfXGmvO18RgsTBPqE2uYem0V5V8Ay+K6HKgVpg==
X-Received: by 2002:a05:6512:1051:b0:53d:ed45:45b3 with SMTP id 2adb3069b0e04-53ded454996mr450743e87.16.1732609779656;
        Tue, 26 Nov 2024 00:29:39 -0800 (PST)
Received: from localhost.localdomain (82-209-143-194.cust.bredband2.com. [82.209.143.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2445743sm1950145e87.1.2024.11.26.00.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 00:29:37 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] variables.rst: document uki.bbclass variables
Date: Tue, 26 Nov 2024 10:29:06 +0200
Message-ID: <20241126082906.291040-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 08:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5811

Documentation for the new class.

[YOCTO #15650]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ec4d7ab73f..9dac0b2d25 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9846,6 +9846,38 @@ system and gives an overview of their function and contents.
       passes and uses "all" for the target during the U-Boot building
       process.
 
+   :term:`UKIFY_CMD`
+      When inheriting the :ref:`ref-classes-uki` class,
+      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
+      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``ukify build``.
+
+   :term:`UKI_CONFIG_FILE`
+      When inheriting the :ref:`ref-classes-uki` class,
+      an optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command.
+
+   :term:`UKI_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the output file name for generated `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``uki.efi``.
+
+   :term:`UKI_KERNEL_FILENAME`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the kernel image file name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
+
+   :term:`UKI_CMDLINE`
+      When inheriting the :ref:`ref-classes-uki` class,
+      the kernel command line to use when booting the `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
+
+   :term:`UKI_SB_KEY`
+      When inheriting the :ref:`ref-classes-uki` class,
+      optional UEFI secureboot private key to sign `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+
+   :term:`UKI_SB_CERT`
+      When inheriting the :ref:`ref-classes-uki` class,
+      optional UEFI secureboot certificate mathing the private key in :term:`UKI_SB_KEY`.
+
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
-- 
2.43.0


