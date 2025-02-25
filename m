Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49C6C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:24:54 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.945.1740522293651637891
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 14:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MAI3Z1SU;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso54753866b.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 14:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522292; x=1741127092; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK3/huLF4x9GIwZR6fLEudcjZQpWcoV0PF1l1+59G78=;
        b=MAI3Z1SUFi/jUv/mmMFY3s2dqw5ZGO2Tr6CguI9q0Sog2WltNGagR55I/qy+G2IIcW
         R4TfHDO87fe0W0JCt/CmU7DZu9G73ji+xBO/aCimkwW9ZwDa5wBK4cfcoSO3X0W19pog
         mKcBLSzEDwjnWWiQLujQuJaCE8NyL57JoiO/nGQbW89BQudeQHPAVtkYG1+3MLX1JzTq
         mAs50AHXeWqpDhzoomPRrbPQQfK0rjBEQ5/bKYdwYTfURlhFebYqisZzoS9FidC0FNpo
         z/12eyZ3UJbxUZIOMnQpxn7+tFCrcXYDYKKlNNaRmHC752znqVFFR5fbxuidpts84uGf
         seKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522292; x=1741127092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jK3/huLF4x9GIwZR6fLEudcjZQpWcoV0PF1l1+59G78=;
        b=PtUMMZMPNI50d98Gr5BS0mqzNEqrCXiZKT3VVmUZnFM+J3qvccizKFxpK52bAJOyNp
         cE3dENYnL8TxnV94Ow5qecWifIhdGkx0R2eu4J0uVrQLiw9jofRcFiHhNIkzOIajtGwq
         D0HA3F2HdBBPxwGwXK+rDB2x5xQvhzU1IgU+s93sjuKDFO9dabuVVWnJRoV0S5gBvrUt
         OLmEl0MZ4U1P41F+kKmkrPrPMNK5izAhI8aJjb4buQKjG4OjIW0hBiX6qAwKprf6i+ha
         KA20sIPFuSzs2A4Lek4hFCaRmCY55Ler2QtFMdNAD+z0DBIlHfKlyTrKeNWQZpA81YnW
         lCQQ==
X-Gm-Message-State: AOJu0YwkDi5fZMz0L924AzPofAkA3iewL+Z0YRvk9mT06a6MEuYuYlyb
	dflxyfr6G9ZTCH8I+sE6ZX/gyZKUWp7DTjdk1unhHZSrYStEuV712Y5WfTGg
X-Gm-Gg: ASbGncsvSJDEzIRlaamwRvWNIUJ+S7AqqV+UUL1bHz1NZVUytWCmx+i4fX9c7J+ww8p
	v9U7XltygZtR/ABRmNFpHp8q3SCRZhpgjBAC3m2GvuLFtFgUGXoQMysui3L/CAAYYBbkm3X17do
	7hRdN8qUxDWjJKdLAVx1W5AjeOdiq0IVyFUJyJQxWEOTPjcETXox+DGMyThwDBvowjkqNalkHzO
	xcDTWa7exrUGiwADUzlEcp0G+vOJLc+1HaZvsxAymHRc9hOROQBbZWdDmzoA8jI3U9jZGY3HOM7
	X3UZ4Ucub+9laiG5jhNiOuNaLgexErWrd7HWHGb077f06pVU
X-Google-Smtp-Source: AGHT+IHMihw9KyRCrjercIu4B6SVv9DIf0lPSSK/RgTWA3EC4CmOEAS9YamkO0O7ZMXA9rETkkaL4Q==
X-Received: by 2002:a17:906:3151:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abc0b037859mr1449128266b.24.1740522291398;
        Tue, 25 Feb 2025 14:24:51 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbfb4sm212193466b.27.2025.02.25.14.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:24:50 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4] ref-manual: cover UBOOT_ENV variables
Date: Tue, 25 Feb 2025 23:24:42 +0100
Message-ID: <20250225222442.3347665-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 22:24:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6456

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 63 ++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f3..a3d59390cd1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3180,6 +3180,31 @@ system and gives an overview of their function and contents.
       The default value for this variable is set to "2048"
       by the :ref:`ref-classes-kernel-fitimage` class.
 
+   :term:`FIT_UBOOT_ENV`
+      This variable allows to add a U-Boot script as a text file to the
+      FIT image. Such a script can be sourced from the U-Boot shell.
+
+      When inheriting the :ref:`ref-classes-kernel-fitimage` class a
+      script file should be included in the :term:`SRC_URI` of the Linux
+      kernel recipe.
+
+      Example:
+
+      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
+
+            FIT_UBOOT_ENV = "boot.cmd"
+            SRC_URI += "file://${FIT_UBOOT_ENV}"
+
+      -  Use the script file from the U-Boot shell. The name of the script in
+         FIT image is ``bootscr-${FIT_UBOOT_ENV}``. This example loads the FIT
+         image from a TFTP server::
+
+            tftp $loadaddr $fit_tftp_path
+            source $loadaddr#bootscr-boot.cmd
+
+      More information can be found in the official U-Boot documentation:
+      `U-Boot source command <https://docs.u-boot.org/en/latest/usage/cmd/source.html#fit-image.f>`__
+
    :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`ref-classes-fontcache` class,
       this variable specifies the runtime dependencies for font packages.
@@ -9791,6 +9816,44 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
       classes.
 
+   :term:`UBOOT_ENV`
+      This variable allows to add additional environment variables or a script
+      to be installed together with U-Boot.
+      This file, typically ``uEnv.txt`` or ``boot.cmd``, is installed in
+      ``/boot`` as well as copied to the :term:`DEPLOYDIR` directory.
+
+      For machine configurations needing one of these files a ``.bbappend``
+      file should include it in the :term:`SRC_URI` of the U-Boot recipe.
+
+      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the script is
+      packaged as a uImage (``mkimage -T script..``) otherwise it gets
+      installed verbatim.
+
+      Some examples:
+
+      -  Adding a script ``boot.cmd`` as a uImage to ``/boot``::
+
+            UBOOT_ENV = "boot"
+            UBOOT_ENV_SUFFIX = "scr"
+            SRC_URI += "file://${UBOOT_ENV_SRC}"
+
+      -  Adding a script ``uEnv.txt`` as a plain text file to ``/boot``::
+
+            UBOOT_ENV = "uEnv"
+            UBOOT_ENV_SUFFIX = "txt"
+            SRC_URI += "file://${UBOOT_ENV_BINARY}"
+
+   :term:`UBOOT_ENV_SRC_SUFFIX`
+      If :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` this is the suffix of the
+      plain text script file as it is specified in the :term:`SRC_URI` of the
+      U-Boot recipe. It defaults to ``cmd``.
+
+   :term:`UBOOT_ENV_SUFFIX`
+      If this variable is set to ``scr`` the script referred to by
+      :term:`UBOOT_ENV` gets packaged as a uImage before it gets installed.
+      The default is ``txt`` which means the script is installed as-is, with
+      no modification.
+
    :term:`UBOOT_FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
       description of the U-Boot FIT image.
-- 
2.47.1


