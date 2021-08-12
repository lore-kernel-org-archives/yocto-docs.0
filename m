Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.24233.1628784633668208413
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 09:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: tom.rini@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id bu14so486946qvb.1
        for <docs@lists.yoctoproject.org>; Thu, 12 Aug 2021 09:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VfClDZLt7Ldrrp0QihoOkWlm+sFVMoqoUNmYsVxECPQ=;
        b=oXFqGd1qniI/axEsGuLRGvfFul2fBAFtbCXw4m7qGH/OZCJLhhIg1InyUDx8Mgsw6/
         7QPtkNSINZfqC/KBqggpu2EImEwBO5MZcXj1wLohOXVlMX554cCUke3P5d3WIZqQAU4a
         iImrFY4kyc6LAzXAiiR4WG5uXe5Qd2lpLu+PTmlspD9uHepGy7iwCkVFdvE5JFmcxD3e
         O4N5XFTOOx4SrQUJqA7Imd6yc5E4Fkd91RgiJ4QgcclyCvtZEFsFMBfAZ3YJj96G1LGa
         c3BjtdgxIe9peLnGX6NwV9mavOczOfnd5yb6h4RttAxF091FR7axqp9qyMWmm2kbZg3x
         h/tg==
X-Gm-Message-State: AOAM532fiIPehzh61CGAvIfuzS3msjc7WPvJ/p9uGBharCyn77cq5Nq2
	VFBRodB64m+5FF6PH8MS9JUnYC2dng06
X-Google-Smtp-Source: ABdhPJx0OAMjEgcb5sgdjzI3RYqG0dVf6OLVkCbRHxxqPeNl7VT15HXUVk7zU6kETqO/u9kw0l2oXw==
X-Received: by 2002:a05:6214:1907:: with SMTP id er7mr4628727qvb.17.1628784632527;
        Thu, 12 Aug 2021 09:10:32 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-04e3-07fe-0933-9252.res6.spectrum.com. [2603:6081:7b01:cbda:4e3:7fe:933:9252])
        by smtp.gmail.com with ESMTPSA id h2sm1549773qko.127.2021.08.12.09.10.31
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 09:10:31 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/3] manuals: Rename the "Using .bbappend Files in Your Layer" section
Date: Thu, 12 Aug 2021 12:10:26 -0400
Message-Id: <20210812161027.580-2-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812161027.580-1-trini@konsulko.com>
References: <20210812161027.580-1-trini@konsulko.com>

To prepare to add another example bbappend, rename the current "Using
.bbappend Files in Your Layer" section to "Appending Other Layers With
Your Layer".  Name the current example as "Overlaying a File Using Your
Layer".

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 documentation/dev-manual/common-tasks.rst        | 9 ++++++---
 documentation/kernel-dev/common.rst              | 4 ++--
 documentation/kernel-dev/faq.rst                 | 2 +-
 documentation/migration-guides/migration-1.4.rst | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 2d8ef96e2600..f15e72887c04 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -443,8 +443,8 @@ file. During the processing of each ``conf/layer.conf`` file, BitBake
 adds the recipes, classes and configurations contained within the
 particular layer to the source directory.
 
-Using .bbappend Files in Your Layer
------------------------------------
+Appending Other Layers With Your Layer
+--------------------------------------
 
 A recipe that appends Metadata to another recipe is called a BitBake
 append file. A BitBake append file uses the ``.bbappend`` file type
@@ -474,6 +474,9 @@ does not have a corresponding recipe with a matching name. See the
 :term:`BB_DANGLINGAPPENDS_WARNONLY`
 variable for information on how to handle this error.
 
+Overlaying a File Using Your Layer
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 As an example, consider the main formfactor recipe and a corresponding
 formfactor append file both from the :term:`Source Directory`.
 Here is the main
@@ -6091,7 +6094,7 @@ layer. The following steps provide some more detail:
 
    -  Add a ``psplash`` append file for a branded splash screen. For
       information on append files, see the
-      ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
+      ":ref:`dev-manual/common-tasks:appending other layers with your layer`"
       section.
 
    -  Add any other append files to make custom changes that are
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index a97140b0b904..e0bc375f8247 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -425,7 +425,7 @@ home directory:
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
    information on using append files, see the
-   ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
+   ":ref:`dev-manual/common-tasks:appending other layers with your layer`"
    section in the Yocto Project Development Tasks Manual.
 
 Modifying an Existing Recipe
@@ -1070,7 +1070,7 @@ Section.
    For more information on append files and patches, see the
    ":ref:`kernel-dev/common:creating the append file`" and
    ":ref:`kernel-dev/common:applying patches`" sections. You can also see the
-   ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
+   ":ref:`dev-manual/common-tasks:appending other layers with your layer`"
    section in the Yocto Project Development Tasks Manual.
 
    .. note::
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index f0a7af37bb0b..2497145f26aa 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -38,7 +38,7 @@ The kernel image (e.g. ``vmlinuz``) is provided by the
 specify whether or not the kernel image is installed in the generated
 root filesystem, override ``RDEPENDS_${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
-":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
+":ref:`dev-manual/common-tasks:appending other layers with your layer`"
 section in the
 Yocto Project Development Tasks Manual for information on how to use an
 append file to override metadata.
diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
index 3f980915cf0c..81e8ccd03ba3 100644
--- a/documentation/migration-guides/migration-1.4.rst
+++ b/documentation/migration-guides/migration-1.4.rst
@@ -83,7 +83,7 @@ create an append file for the ``init-ifupdown`` recipe instead, which
 you can find in the :term:`Source Directory` at
 ``meta/recipes-core/init-ifupdown``. For information on how to use
 append files, see the
-":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
+":ref:`dev-manual/common-tasks:appending other layers with your layer`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.4-remote-debugging:
-- 
2.17.1

