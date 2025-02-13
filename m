Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF01CC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 22:04:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.6364.1739484260130640812
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 14:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3C+CzJF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4395dddb07dso14824245e9.2
        for <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 14:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739484258; x=1740089058; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsuRDn54P5d5kTIquC5K7FO4ESsPMqdeSFLXeXVtr6w=;
        b=K3C+CzJFq4tsayO+EVr3fpJKtOslCWYonbZjFlT6dplqJeS7z8FLjt+r5g+rxp+Vl6
         cu0HxQjig3740NccUULbzQJw4AbvajFN0vBFWOp8o0YIpuOxxlrhavKhw6/FzDYt1JJs
         VemP2srbo27oLLMhtOtIjXpcL9qiP4EDN2P5aYiZ55KMZiuPCb19riDAjw9W3UCFq96e
         RS1QPBlL7qDImc3FRyetSUXITcPWzj4KRn/6eNWTzS68SN18Y6BVmbg8I3mVuvRJp4g/
         xiCXbRpu/CWNQXkLqSqN4isKlzDICa831hMioxjwWbSgxWge2pyDlEY6K8cFuBEEpPhA
         cgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484258; x=1740089058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsuRDn54P5d5kTIquC5K7FO4ESsPMqdeSFLXeXVtr6w=;
        b=U+0W2TWachhlT+xIV7EuImmKqKfVCYfaFqomwzJBfgtZ2N4XtbI6f2njp3Z8k0Lmmb
         460p/uPmRk8nBUG0a9frc3i8rTgrLw4lUlw0pWzS5uB9hmQw+b4NKfS+1GaoC78W0y1e
         c97KQNfOlTo6R1XQxFnBJK/8yxEaVsxivsEOAtq+TNT/jTR/r8we5L751PLoZvYIJext
         //MriyUKMm8S9Rk/peLk7G4NxfVnb4AV+dLOx4+MbBn0LSSpDNoBNeHRI5hTXEzoWzUz
         sw5ruyiUIHBV14AoDj6lY/F1u2RqKuaBp6f9VszGc5oVl25rUqAk86jFfonxq/nwyGgI
         hpeA==
X-Gm-Message-State: AOJu0Ywj/hEuJZalZs0sXYruZ3zIXWoYCH6+KvV/h14TKp3Qel0VvKRQ
	Hn5m+ctEK0sJufJ2pSsHxlTm9082kBPWS+Xl2oJZSacJASSjKxqOVcN6Bw==
X-Gm-Gg: ASbGnct1+vMw1OAqyWANojOVEXK6F3h6QKMLodQJXVs8UeLvnMge/BlNuTIHujSd4ap
	afHJ2VvK20N4eVf1rmUVAtE0IDFv7IWmXY6V9dh29yvoEBVCT/3MjMAgdEnDYGZfEQsh6KcWCMa
	RFd5XhU+r55XUaGekfKswgxOqNEchsEGDDCRCWYJaRIWKcvWHxT4sTqRCkNa6OZ1euA3PMJkMIa
	sVPFNPfTuMipnPtF2Ggg11NXegfXK/liG3oLTDn661G+6NnkbBOYO7uL7a9oLAUbs0QeKtvj3/w
	tYUYgXgHXAQnsHK/QSM2nVYiFB2yym88jWnEKA==
X-Google-Smtp-Source: AGHT+IHOV1ZOND7ixyuI37ArfWvcidOg3cYEnG+mSMG6IaRwOo6eZmpfRil4ItMXQt9i/0EM/p4Fww==
X-Received: by 2002:a05:6000:1ac6:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-38dea1beadamr11254016f8f.0.1739484258037;
        Thu, 13 Feb 2025 14:04:18 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ee2sm2874191f8f.80.2025.02.13.14.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:04:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] ref-manual: cover UBOOT_ENV variables
Date: Thu, 13 Feb 2025 23:04:04 +0100
Message-ID: <20250213220405.3920122-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 22:04:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6364

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f3..e44a105c53e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3180,6 +3180,12 @@ system and gives an overview of their function and contents.
       The default value for this variable is set to "2048"
       by the :ref:`ref-classes-kernel-fitimage` class.
 
+   :term:`FIT_UBOOT_ENV`
+      This variable allows to add a u-boot script as a text file to the
+      fitImage. Such a script can be sourced from the u-boot shell, as
+      documented here:
+      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.f>`__
+
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`ref-classes-fontcache` class,
       this variable specifies the runtime dependencies for font packages.
@@ -9777,6 +9783,42 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
       used in creating the dtbo sections of Image Tree Source for the FIT image.
 
+   :term:`UBOOT_ENV`
+      Additional environment variables or a script can be installed alongside
+      U-Boot to be used automatically on boot.
+      This file, typically ``uEnv.txt`` or ``boot.cmd``, gets packaged along
+      with U-Boot (installed into /boot) as well as placed in the deploy
+      directory.
+
+      Machine configurations needing one of these files should include it in
+      the :term:`SRC_URI` of the U-Boot recipe.
+
+      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the script is
+      packaged as a uImage (``mkinage -T script..``) othersise it gets
+      installed as it is.
+      Some Examples:
+
+      -  Adding a script ``boot.cmd`` as an uImage to /boot::
+
+            UBOOT_ENV = "boot"
+            UBOOT_ENV_SUFFIX = "scr"
+            SRC_URI += "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
+
+      -  Adding a script ``uEnv.txt`` as a plain text file to /boot::
+
+            UBOOT_ENV = "uEnv"
+            SRC_URI += "file://${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+
+   :term:`UBOOT_ENV_SUFFIX`
+      If this variable is set to ``scr`` the script referred by
+      :term:`UBOOT_ENV` gets packaged as a uImage before it gets intalled.
+      The default is ``txt`` which means the script gets installed directly.
+
+   :term:`UBOOT_ENV_SRC_SUFFIX`
+      If :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` this is the suffix of the
+      plain text script file as it is referred by the :term:`SRC_URI` of the
+      U-Boot recipe.
+
    :term:`UBOOT_ENTRYPOINT`
       Specifies the entry point for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a
-- 
2.47.1


