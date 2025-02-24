Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701E3C021B5
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 08:28:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.84499.1740385675785110538
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 00:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gEZFAWB5;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43995b907cfso24254785e9.3
        for <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 00:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740385674; x=1740990474; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJrzrsguWUqYwLLbRjbzeIYnrRK95m0sF11Scmuu47c=;
        b=gEZFAWB5KgI8Q73a2MZS9cpESeMuQRzgIdELen8/+JgCX+Ce7Sv8s/IkMqu/+DaFQ1
         Fi7L2GZOVQQbMVyGtubNK1DxTRliCMzT8PJIPP9N+tutLrcCyqRfyg+bfQEIcDRv1cBa
         3hl6thBewWq2oS9gJbMwF8fEPuFFCBJczd2Z7ODjiT7LF/uEK2Eu64csHNDEWNJLXvrh
         2q3rybjc3IFCl9OiO8Z+58lYxF7i1GQvlloqjw/5ZOASB7K1ps7Sc9oTXnFy3F6/rhXU
         wHptx5LWzNH721jmKHw81ut9I6RbxIN7NbqdeBhEvlK4Asszgre+z9YXrV336Tk3RYCm
         nY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740385674; x=1740990474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJrzrsguWUqYwLLbRjbzeIYnrRK95m0sF11Scmuu47c=;
        b=DqYaFn66kD0qZwnINr3NQAO/PbBZvOw7PAPAU4cdhLBpm4gLb4m0uawHOdRu+tWUjV
         LboihhSmatMmp09uPZ3dV0EcCGOJtWRzXV09Uv+zURGRLhHKpwtVFnLl2zW5Vvs36RN4
         BVX6CAWCZ7hoafr2AQUd7OryCAv9ucl90q4FgZIw08a8fJ8Hk41qSeBHlTESYoLkpZ+I
         wykV1NrVg1w9kxmEIPmMd3yQgndR+txfPY4n+H64B54F1vKYHSsjgdm65X/c6hOqVTZ7
         QhKpXreSWj8jTwfIGI+4RPz86vHq38kLm6FDDjvcugACEdaNdFkQGsu8Ztsk1bMK2S0F
         E39g==
X-Gm-Message-State: AOJu0YzWCX4hCgWYGEaiJ2H07oMD70K9c177loiU07v6u4JQLcyM40t4
	tnfplapMDi7I6v4xIQZyknP8296i4gVf0GZMWHBHPD0ae2zX1CdM2LbSe/6B
X-Gm-Gg: ASbGncuamiMbBe2SJ7izyZVf2fuF6TlNT2VHeLE6PWbLSTmHuk98NaR92Hx+UnnRPWt
	YF6lrdwKxDFINcSLNRsKD6PYKATFVmRY0PGUGzwWKXOzuavBS3OJwBwR8CvLZkBep5/ftFwp4JH
	pn0Oi4tokOHJvtpXK3m5yL9Qc0rNDxB3sB8qjfYp8XnS0w0ob9LwyHWXqQ82EhPqEm/0PCwWFN/
	hja75xhCtm0sUdBT8RsYBwnHK/Z/djG5JZkPd8wWhzjRk1TGcHxQwerVF27+sXaJqH7WnuZeGwi
	f78bJNRQYEcB2ez50e1AX3CYD5fzx1mk28cNcJBtpye7AE8b
X-Google-Smtp-Source: AGHT+IF5afqruk3ASrM1EPOvHv8u3EEEzpH3Wtxs69wyFDPj1DN/jqGdtTP+gDn37HPhw3OwhKLjuQ==
X-Received: by 2002:a05:600c:1ca0:b0:439:9e8b:228d with SMTP id 5b1f17b1804b1-439ae218a14mr92907725e9.19.1740385671999;
        Mon, 24 Feb 2025 00:27:51 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915719sm31279407f8f.60.2025.02.24.00.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:27:51 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/2] ref-manual: cover UBOOT_ENV variables
Date: Mon, 24 Feb 2025 09:27:28 +0100
Message-ID: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 08:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6431

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f3..82dd80ca130 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3180,6 +3180,30 @@ system and gives an overview of their function and contents.
       The default value for this variable is set to "2048"
       by the :ref:`ref-classes-kernel-fitimage` class.
 
+   :term:`FIT_UBOOT_ENV`
+      This variable allows to add a U-Boot script as a text file to the
+      FIT image. Such a script can be sourced from the U-Boot shell.
+
+      For machine configurations needing such a script a
+      ``linux-yocto_%.bbappend`` file should include it in the :term:`SRC_URI`
+      of the kernel recipe.
+
+      Example:
+
+      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
+
+            FIT_UBOOT_ENV = "boot.cmd"
+            SRC_URI += "file://${FIT_UBOOT_ENV}"
+
+      -  Use the script file from the U-Boot shell. This example loads the FIT
+         image from a TFP server.::
+
+            tftp $loadaddr $fit_url
+            source $loadaddr#bootscr-boot.cmd
+
+      More information can be found in the official U-Boot documentation:
+      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.f>`__
+
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`ref-classes-fontcache` class,
       this variable specifies the runtime dependencies for font packages.
@@ -9777,6 +9801,46 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
       used in creating the dtbo sections of Image Tree Source for the FIT image.
 
+   :term:`UBOOT_ENV`
+      Additional environment variables or a script can be installed alongside
+      U-Boot to be used automatically on boot.
+      This file, typically ``uEnv.txt`` or ``boot.cmd``, gets packaged along
+      with U-Boot (installed into ``/boot``) as well as placed in the deploy
+      directory.
+
+      For machine configurations needing one of these files a
+      ``u-boot_%.bbappend`` file should include it in the :term:`SRC_URI` of
+      the U-Boot recipe.
+
+      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the script is
+      packaged as a uImage (``mkimage -T script..``) otherwise it gets
+      installed as it is.
+
+      Some Examples:
+
+      -  Adding a script ``boot.cmd`` as an uImage to ``/boot``::
+
+            UBOOT_ENV = "boot"
+            UBOOT_ENV_SUFFIX = "scr"
+            SRC_URI += "file://${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
+
+      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``::
+
+            UBOOT_ENV = "uEnv"
+            UBOOT_ENV_SUFFIX = "txt"
+            SRC_URI += "file://${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
+
+   :term:`UBOOT_ENV_SUFFIX`
+      If this variable is set to ``scr`` the script referred by
+      :term:`UBOOT_ENV` gets packaged as a uImage before it gets installed.
+      The default is ``txt`` which means the script is installed as-is, with
+      no modification.
+
+   :term:`UBOOT_ENV_SRC_SUFFIX`
+      If :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` this is the suffix of the
+      plain text script file as is it specified in the :term:`SRC_URI` of the
+      U-Boot recipe.
+
    :term:`UBOOT_ENTRYPOINT`
       Specifies the entry point for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a
-- 
2.47.1


