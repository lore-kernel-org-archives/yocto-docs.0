Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
 by mx.groups.io with SMTP id smtpd.web10.206.1603213415468251978
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 10:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ldu3IDdt;
 spf=pass (domain: gmail.com, ip: 209.85.161.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f65.google.com with SMTP id f19so619166oot.4
        for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2020 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVilSn4t/1RIdiLQ1FgYChoCm8K83AIn3sgULANiHPk=;
        b=Ldu3IDdtzhN5ZOo6INAVf3s8aVKX/+xWpkss+qRCAaw5c1EBHsgYIKASm+KDiZg3vb
         HOwx3FhOrifxoQBu+pnn9inw5xAUAWzMys2mR05oP0u4+sVULTLclGbYUglwCBK30djp
         tq0/v/UJYr+m3vz9PgnMmwg5H+cL+mGBWwqvBqI4VNRxFbsyw9gMA7qTZdUMCrzH1H+Z
         /mtS9U3OTlIYemA7rhCunywpdrwJv3Y55hYTc/TuIyTDWNHO4PRVewJShSkpukAp2FyA
         f6h/oE0YlkZB0FDnRcW1Cc+SWvZcEcCsR9rzkoPk7LaM6Gdw2HluS/9V1alEmWwoylqo
         Vr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVilSn4t/1RIdiLQ1FgYChoCm8K83AIn3sgULANiHPk=;
        b=Abi20xoU/5fZwEkpqrAtuntCMJd0mLFzj5Ubeq7r8oFSK9kwwMX4qNYbbAqrGbi1+e
         +dEA+i8Ua9tDYJ57Xyt2x2sy1uzYJmKxVxAOWPVJj1jzlQDwGcGkPOUwQrlMljbsPyBH
         IiTzi91XqL7vlqnLtDOLzmp0/dm7hYlygrY44e108DTS+Y6STRbXkCT54nK4aEMdVisc
         0ECLA44Jl2vg3FQZVoVPimy3li88GYBBqH+JcCYyz7jKp8l18+TVFBWBcy5yezVjp7Pt
         LESGjJaoPVfThRGEYW0u4rDx/zcABbOqeOT8NjUnwEOw2M2dDlEnVNh1WgRiPFzhZgFG
         ZuJw==
X-Gm-Message-State: AOAM532SI933Yxcdh1xnus/KjSZHA5EtSWumMp8qzXczktK9yGxcp5p7
	MkY6BZhTLJTJ3cI2KvnNloRdBGzYWQo=
X-Google-Smtp-Source: ABdhPJzDQJ+mxhZ9575rJ8CKIMWOcMrP6daVMtgWXQbfCTxBTviNM8i7qdFLPp45SbOHwcKQIYy+xw==
X-Received: by 2002:a4a:cf09:: with SMTP id l9mr2595372oos.30.1603213414144;
        Tue, 20 Oct 2020 10:03:34 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id r21sm567931otd.78.2020.10.20.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 10:03:33 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	pbarker@konsulko.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] kernel-dev: Add FAQ for how to use a vanilla kernel
Date: Tue, 20 Oct 2020 12:03:26 -0500
Message-Id: <20201020170326.14313-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a FAQ with explicit directions about how to build a vanilla kernel
for a machine.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/kernel-dev/kernel-dev-faq.rst | 49 +++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index 70bf4a2d4..929cc4aad 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -79,3 +79,52 @@ following:
 
    APPEND += "printk.time=y initcall_debug debug"
 
+How do I use a vanilla Linux kernel with my machine?
+----------------------------------------------------
+
+The simplest way to use a vanilla kernel is with the ``linux-yocto`` kernel
+maintained by openembedded-core. Using this kernel is as simple as adding the
+following to your machine.conf file:
+::
+
+   # Use a defconfig provided by the kernel. If you are going to provide your
+   # own defconfig in SRC_URI as show below, you'll need to omit this line
+   KBUILD_DEFCONFIG = "multi_v7_defconfig"
+
+   # Use default value for all symbols. This is usually what you want when
+   # providing a defconfig
+   KCONFIG_MODE = "alldefconfig"
+
+   # Make linux-yocto provide the kernel
+   PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+
+   # If you want to use a specific version of the upstream kernel, uncomment
+   # and set this line, otherwise omit it to use the latest stable kernel
+   #PREFERRED_VERSION_linux-yocto = "5.8.%"
+
+You will also need to add a .bbappend in your BSP layer to amend the
+linux-yocto recipe (e.g. recipes-kernel/linux/linux-yocto_%.bbappend):
+::
+
+    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+    # Uncomment this line to provide your own defconfig file in your BSP layer:
+    # SRC_URI_append_my-machine = " file://defconfig"
+
+    # Marks the recipe as compatible with your machine. Be sure to replace
+    # my-machine with the name of your machine
+    COMPATIBLE_MACHINE .= "|my-machine"
+
+You can also apply patches and config fragements in the bbappend if desired,
+see :ref:`kernel-dev/kernel-dev-common:applying patches` and
+:ref:`kernel-dev/kernel-dev-common:changing the configuration` in the Kernel
+dev manual. It is recommended that you use ``_append_my-machine`` to prevent
+these changes from inadverently leaking into other machine configurations
+
+.. note::
+    You will notice that this is will still pull the kernel source from `the
+    Yocto Kernel git repo
+    <https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/>`_, however it is
+    using the default value for :term:`KBRANCH` (e.g. ``"v5.8/standard/base"``)
+    which is an exact mirror of the upstream kernel.
+
-- 
2.28.0

