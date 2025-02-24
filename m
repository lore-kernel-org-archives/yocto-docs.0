Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B70BC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 22:17:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.103416.1740435437940704366
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 14:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7OFsZrc;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso30166005e9.0
        for <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 14:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740435436; x=1741040236; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7nwVtZhR3ZHdSTXfPhjHFfDig8wGhBYKA8zQ3qI1E0=;
        b=e7OFsZrcVbschcHUCHJhENKVLSUbAN2ruXIHCTgURZ7AW6F0Yd2ZHG/7051KMdJa+C
         9bguSyLqzueOw4LxFe+fzUKzMIQLI2mZUMqbzosF797afnNQxrKyi1zBehof8qchm+/C
         bnh8DMcjexSyt+amSAKbTXkfIsjH6d9z3CDVq/KsvhYKCaYYHJLmhkzsMIJFa2ddzE4c
         5b5zrHa+cZHskySaEWGS87u/V2LecY6EeuPz2Uk1wbtGGfIsBgLiq3B9kxyNYAdcfzv9
         a9EP/UsvnPhExSFq8AFV/CxmoSA29MUflXlM0RWXKbwL5FDRKSJ4PNW8PsPd6nNayaUm
         luWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740435436; x=1741040236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7nwVtZhR3ZHdSTXfPhjHFfDig8wGhBYKA8zQ3qI1E0=;
        b=iF95LcdrFLQHk3bzrdK3nSeH0D5rkbXVe39Y+P2ELxBa2oadvuBwG6+QDJATE4cpPp
         3bAp3/13BgUqXRpnrEuRSXts3HoVLtqV9CHHQJ6prKjKiDLXqxRxYh1mcciCP3EIn5L/
         p37oWTInFjpRbiwbNPDJymi9VyiG2M6WOZnrVKoblw4hDGNBt67wYQ4BqorURbLMdT/V
         RzJtgGBr9skWgOBMN5ouDGg5FZ7GrqNYV74AX6Ektb30CcIdHqhT8GZWM8vBde6tGLn5
         lAzOQ8J6u/0FAeGF5ObpscV5+kPC5DtG5vURUNfEpCYTn4OSrb3a110KPCSaOChgHEMQ
         bfdQ==
X-Gm-Message-State: AOJu0YzQs62gUnio0SCc3PHtmX8HhEQVxdFNgyteUcraonysIFlYksPv
	1xjPhGSwgaP+8bMOjjSrM9h8WlNK0c6qISvzaKgJIIK2tQpHqYD7fEspWCzF
X-Gm-Gg: ASbGncvPRBKDNJxibZ3/Exa8oJbnhvKSfsa+I9X1KInvdiqLyXjXYDDWO2jM7EGi4mM
	31D8ntanqlcCaQPzCA1lxWXwQUS+gzGcv6PE5PN/ed3AcWAykIvHm0gD/XHoySo9hc+f7HVtzOC
	iQZ4I4Y8lREzzJuT+vSpgNYdc+8M8SDxryGqr5L3tY1ecjOauiKLY84TG/5ys5Haeh2U79UmceF
	m5cq086ghxU3w8RW3yD9A7+ejeoC2vUBG6CIV02OV5qibsMy6m/JgOvC+q52KFPLvksmsImomXv
	WXlfDpU2x0hXmx3II/ZffB2+PAMf5yv4bzoKsX5QeZJYC5bM
X-Google-Smtp-Source: AGHT+IGVcQhEXDB3unks2JnxLKfX9vIFUUOk6QdxgALzKeE31vyrOLL/gu5rqAF1Z46oU6uhMfPmQw==
X-Received: by 2002:adf:fec2:0:b0:38d:dc4d:3476 with SMTP id ffacd0b85a97d-390cc63898cmr380801f8f.52.1740435435710;
        Mon, 24 Feb 2025 14:17:15 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86caa8sm260853f8f.25.2025.02.24.14.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:17:15 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3] ref-manual: cover UBOOT_ENV variables
Date: Mon, 24 Feb 2025 23:16:30 +0100
Message-ID: <20250224221630.3331182-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 22:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6442

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f3..b432488a012 100644
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
+      of the Linux kernel recipe.
+
+      Example:
+
+      -  Add a script ``boot.cmd`` to the Linux kernel recipe::
+
+            FIT_UBOOT_ENV = "boot.cmd"
+            SRC_URI += "file://${FIT_UBOOT_ENV}"
+
+      -  Use the script file from the U-Boot shell. This example loads the FIT
+         image from a TFTP server.::
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
@@ -9777,6 +9801,44 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
       used in creating the dtbo sections of Image Tree Source for the FIT image.
 
+   :term:`UBOOT_ENV`
+      This variable allows to add additional environment variables or a script
+      to be installed together with U-Boot.
+      This file, typically ``uEnv.txt`` or ``boot.cmd``, is installed in
+      ``/boot`` as well as copied to the deploy directory.
+
+      For machine configurations needing one of these files a ``.bbappend``
+      file should include it in the :term:`SRC_URI` of the U-Boot recipe.
+
+      If the variable :term:`UBOOT_ENV_SUFFIX` is set to ``scr`` the script is
+      packaged as a uImage (``mkimage -T script..``) otherwise it gets
+      installed as it is.
+
+      Some examples:
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


