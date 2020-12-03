Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.4189.1607031537700536599
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hUE72q8H;
 spf=pass (domain: linaro.org, ip: 209.85.221.49, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f49.google.com with SMTP id u12so3396224wrt.0
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vIAxQhGfTSx2HjmSHvVqFmvn9Mdi/QnkfjaFUZPACi4=;
        b=hUE72q8HCjxfyJ1BL29244wHFlBYl5W7EfoPLVm2jCo/vKKhkkfi7qY2b3wrMf+vaK
         Rq/3zwlDn5JSzMRuwIVtIHfqVcBb0BKVHfXJhV17DoCpTNWb8E558zOxiUi+PItvrgiT
         IArUoHPGsy4ZNGx8reT8b4emqX/eA73WVNBXqq21ZU14WV9IRolQjJmiyBkd9Ky9lkDB
         SbMYMknuS6GkWOy2VS7XJUnz8knjirfqPweNSDTgW/A7ue/DNItWEyvUXFBcHj9xCxBE
         iEtaWIfX3zzpLNHcKk0pucYbMYI0Qu3+QQwMzXhaQlIhUuELNIGyNfaRQwjC0mRh0Bvn
         FWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIAxQhGfTSx2HjmSHvVqFmvn9Mdi/QnkfjaFUZPACi4=;
        b=WXS0MfncHR/EPaOmXQs6XDR/i9INbyDD3fwEaHyO6yjtxcTqQVyrXF1fZxgnsJS7aR
         1giZjl7utIBESfeTigTnfeHqBiGgqbUblt92JWMfBUvBGKD0TrkJYNdwAWxRv20OJuei
         zbYQiOkTJTEycZG4x5bciQSPfw/kyCE990iedFX7Af+HY42i6VqEHr7m/y5t+KvAQoF3
         hO3WHfWmO3PP2Gdl8BpV9DVc8EGQ1rxZhHy5EgLxctr6Wg+FkEcpKTsOm2eXfIiBf7e3
         /QS2+pSX5vfQNMFEz3fLCfaVJpQqNtWC8eXqrKYx6pi0U3jEXkdNKXuk+HnN8Clp0Vvo
         wHdA==
X-Gm-Message-State: AOAM531RakBphab8lquX40DwfwD6QHcW8SE0SpDLkYRr730vBIwW0bal
	mS4uyewezuyrpV2E/JdclU1zhkA2IWxWjRZy
X-Google-Smtp-Source: ABdhPJzlD9cAAszR5xjsOK6xMCAB0ILHDbqDvr05fjGv4NIJZ2bxR/0jI6Z8DlbarDV0Rz907D4dRw==
X-Received: by 2002:a5d:604f:: with SMTP id j15mr1285005wrt.47.1607031534990;
        Thu, 03 Dec 2020 13:38:54 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:38:53 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 01/10] sphinx: rename top level document in each manual
Date: Thu,  3 Dec 2020 22:38:34 +0100
Message-Id: <20201203213843.347671-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
References: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is more common to call the top level document index.rst. This is
what this patch is doing, along with all required references fixup.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../{brief-yoctoprojectqs.rst => index.rst}   |  4 ++--
 .../bsp-guide/{bsp-guide.rst => index.rst}    |  0
 .../dev-manual/dev-manual-common-tasks.rst    |  6 +++---
 documentation/dev-manual/dev-manual-intro.rst |  6 +++---
 documentation/dev-manual/dev-manual-start.rst |  2 +-
 .../dev-manual/{dev-manual.rst => index.rst}  |  0
 documentation/index.rst                       | 20 +++++++++----------
 .../kernel-dev/{kernel-dev.rst => index.rst}  |  0
 .../kernel-dev/kernel-dev-advanced.rst        |  2 +-
 .../kernel-dev/kernel-dev-common.rst          |  2 +-
 documentation/kernel-dev/kernel-dev-intro.rst |  4 ++--
 .../{overview-manual.rst => index.rst}        |  0
 .../overview-manual-concepts.rst              |  6 +++---
 ...verview-manual-development-environment.rst |  6 +++---
 .../overview-manual/overview-manual-intro.rst | 10 +++++-----
 .../overview-manual-yp-intro.rst              | 10 +++++-----
 .../{profile-manual.rst => index.rst}         |  0
 documentation/ref-manual/faq.rst              |  2 +-
 .../ref-manual/{ref-manual.rst => index.rst}  |  0
 documentation/ref-manual/migration-2.1.rst    |  2 +-
 documentation/ref-manual/ref-features.rst     |  4 ++--
 documentation/ref-manual/ref-structure.rst    |  2 +-
 .../ref-manual/ref-system-requirements.rst    |  6 +++---
 documentation/ref-manual/ref-terms.rst        | 12 ++++-------
 documentation/ref-manual/ref-variables.rst    |  4 ++--
 documentation/ref-manual/resources.rst        | 16 +++++++--------
 .../sdk-manual/{sdk-manual.rst => index.rst}  |  0
 .../{test-manual.rst => index.rst}            |  0
 .../{toaster-manual.rst => index.rst}         |  0
 .../transitioning-to-a-custom-environment.rst |  2 +-
 documentation/what-i-wish-id-known.rst        | 14 ++++++-------
 31 files changed, 69 insertions(+), 73 deletions(-)
 rename documentation/brief-yoctoprojectqs/{brief-yoctoprojectqs.rst => index.rst} (99%)
 rename documentation/bsp-guide/{bsp-guide.rst => index.rst} (100%)
 rename documentation/dev-manual/{dev-manual.rst => index.rst} (100%)
 rename documentation/kernel-dev/{kernel-dev.rst => index.rst} (100%)
 rename documentation/overview-manual/{overview-manual.rst => index.rst} (100%)
 rename documentation/profile-manual/{profile-manual.rst => index.rst} (100%)
 rename documentation/ref-manual/{ref-manual.rst => index.rst} (100%)
 rename documentation/sdk-manual/{sdk-manual.rst => index.rst} (100%)
 rename documentation/test-manual/{test-manual.rst => index.rst} (100%)
 rename documentation/toaster-manual/{toaster-manual.rst => index.rst} (100%)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/index.rst
similarity index 99%
rename from documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
rename to documentation/brief-yoctoprojectqs/index.rst
index 8772812eb..e8912f07c 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -39,7 +39,7 @@ build a reference embedded OS called Poky.
       Tasks Manual for more information.
 
 If you want more conceptual or background information on the Yocto
-Project, see the :doc:`../overview-manual/overview-manual`.
+Project, see the :doc:`../overview-manual/index`.
 
 Compatible Linux Distribution
 =============================
@@ -404,7 +404,7 @@ information including the website, wiki pages, and user manuals:
    concepts are useful for the beginner.
 
 -  **Yocto Project Overview and Concepts Manual:** The
-   :doc:`../overview-manual/overview-manual` is a great
+   :doc:`../overview-manual/index` is a great
    place to start to learn about the Yocto Project. This manual
    introduces you to the Yocto Project and its development environment.
    The manual also provides conceptual information for various aspects
diff --git a/documentation/bsp-guide/bsp-guide.rst b/documentation/bsp-guide/index.rst
similarity index 100%
rename from documentation/bsp-guide/bsp-guide.rst
rename to documentation/bsp-guide/index.rst
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 891fd9b00..e22bcd50e 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -3644,7 +3644,7 @@ build host running Linux.
 
    -  For information on how to build an image using
       :term:`Toaster`, see the
-      :doc:`../toaster-manual/toaster-manual`.
+      :doc:`../toaster-manual/index`.
 
    -  For information on how to use ``devtool`` to build images, see the
       ":ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`"
@@ -3653,7 +3653,7 @@ build host running Linux.
 
    -  For a quick example on how to build an image using the
       OpenEmbedded build system, see the
-      :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
+      :doc:`../brief-yoctoprojectqs/index` document.
 
 The build process creates an entire Linux distribution from source and
 places it in your :term:`Build Directory` under
@@ -3728,7 +3728,7 @@ The following figure and list overviews the build process:
    kernels built by the OpenEmbedded build system are placed in the
    Build Directory in ``tmp/deploy/images``. For information on how to
    run pre-built images such as ``qemux86`` and ``qemuarm``, see the
-   :doc:`../sdk-manual/sdk-manual` manual. For
+   :doc:`../sdk-manual/index` manual. For
    information about how to install these images, see the documentation
    for your particular board or machine.
 
diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
index 9bbac9610..94c481b7d 100644
--- a/documentation/dev-manual/dev-manual-intro.rst
+++ b/documentation/dev-manual/dev-manual-intro.rst
@@ -31,13 +31,13 @@ This manual provides the following:
 This manual does not provide the following:
 
 -  Redundant Step-by-step Instructions: For example, the
-   :doc:`../sdk-manual/sdk-manual` manual contains detailed
+   :doc:`../sdk-manual/index` manual contains detailed
    instructions on how to install an SDK, which is used to develop
    applications for target hardware.
 
 -  Reference or Conceptual Material: This type of material resides in an
    appropriate reference manual. For example, system variables are
-   documented in the :doc:`../ref-manual/ref-manual`.
+   documented in the :doc:`../ref-manual/index`.
 
 -  Detailed Public Information Not Specific to the Yocto Project: For
    example, exhaustive information on how to use the Source Control
@@ -52,7 +52,7 @@ supplemental information is recommended for full comprehension. For
 introductory information on the Yocto Project, see the
 :yocto_home:`Yocto Project Website <>`. If you want to build an image with no
 knowledge of Yocto Project as a way of quickly testing it out, see the
-:doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
+:doc:`../brief-yoctoprojectqs/index` document.
 
 For a comprehensive list of links and other documentation, see the
 ":ref:`ref-manual/resources:links and related documentation`"
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index 1c2314c43..053f09cdc 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -344,7 +344,7 @@ going to use BitBake, see the
 section. If you are going
 to use the Extensible SDK, see the ":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
-Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`../kernel-dev/kernel-dev`. If you are going to use
+Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`../kernel-dev/index`. If you are going to use
 Toaster, see the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
 section in the Toaster User Manual.
 
diff --git a/documentation/dev-manual/dev-manual.rst b/documentation/dev-manual/index.rst
similarity index 100%
rename from documentation/dev-manual/dev-manual.rst
rename to documentation/dev-manual/index.rst
diff --git a/documentation/index.rst b/documentation/index.rst
index 2891a9862..9f41daf4b 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -14,7 +14,7 @@ Welcome to the Yocto Project Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Build <brief-yoctoprojectqs/brief-yoctoprojectqs>
+   Quick Build <brief-yoctoprojectqs/index>
    what-i-wish-id-known
    transitioning-to-a-custom-environment
    Yocto Project Software Overview <https://www.yoctoproject.org/software-overview/>
@@ -25,15 +25,15 @@ Welcome to the Yocto Project Documentation
    :maxdepth: 1
    :caption: Manuals
 
-   Overview and Concepts Manual <overview-manual/overview-manual>
-   Reference Manual <ref-manual/ref-manual>
-   Board Support Package (BSP) Developer's guide <bsp-guide/bsp-guide>
-   Development Tasks Manual <dev-manual/dev-manual>
-   Linux Kernel Development Manual <kernel-dev/kernel-dev>
-   Profile and Tracing Manual <profile-manual/profile-manual>
-   Application Development and the Extensible SDK (eSDK) <sdk-manual/sdk-manual>
-   Toaster Manual <toaster-manual/toaster-manual>
-   Test Environment Manual <test-manual/test-manual>
+   Overview and Concepts Manual <overview-manual/index>
+   Reference Manual <ref-manual/index>
+   Board Support Package (BSP) Developer's guide <bsp-guide/index>
+   Development Tasks Manual <dev-manual/index>
+   Linux Kernel Development Manual <kernel-dev/index>
+   Profile and Tracing Manual <profile-manual/index>
+   Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
+   Toaster Manual <toaster-manual/index>
+   Test Environment Manual <test-manual/index>
    Bitbake User Manual <https://docs.yoctoproject.org/bitbake>
 
 .. toctree::
diff --git a/documentation/kernel-dev/kernel-dev.rst b/documentation/kernel-dev/index.rst
similarity index 100%
rename from documentation/kernel-dev/kernel-dev.rst
rename to documentation/kernel-dev/index.rst
diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index db0a1eb2e..cc4834325 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -474,7 +474,7 @@ supported kernel type.
 This section overviews the BSP description structure, the aggregation
 concepts, and presents a detailed example using a BSP supported by the
 Yocto Project (i.e. BeagleBone Board). For complete information on BSP
-layer file hierarchy, see the :doc:`../bsp-guide/bsp-guide`.
+layer file hierarchy, see the :doc:`../bsp-guide/index`.
 
 Description Overview
 ~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 5115f65f4..c57025c67 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -502,7 +502,7 @@ your layer in the following area:
 .. note::
 
    If you are working on a new machine Board Support Package (BSP), be
-   sure to refer to the :doc:`../bsp-guide/bsp-guide`.
+   sure to refer to the :doc:`../bsp-guide/index`.
 
 As an example, consider the following append file used by the BSPs in
 ``meta-yocto-bsp``:
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index 309c65b4d..a2961d864 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -79,9 +79,9 @@ facilitate the process of working with the kernel recipes. If you find
 you need some additional background, please be sure to review and
 understand the following documentation:
 
--  :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
+-  :doc:`../brief-yoctoprojectqs/index` document.
 
--  :doc:`../overview-manual/overview-manual`.
+-  :doc:`../overview-manual/index`.
 
 -  :ref:`devtool
    workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
diff --git a/documentation/overview-manual/overview-manual.rst b/documentation/overview-manual/index.rst
similarity index 100%
rename from documentation/overview-manual/overview-manual.rst
rename to documentation/overview-manual/index.rst
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 1b522910d..d79dacbfb 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -481,7 +481,7 @@ The BSP Layer provides machine configurations that target specific
 hardware. Everything in this layer is specific to the machine for which
 you are building the image or the SDK. A common structure or form is
 defined for BSP layers. You can learn more about this structure in the
-:doc:`../bsp-guide/bsp-guide`.
+:doc:`../bsp-guide/index`.
 
 .. note::
 
@@ -1366,7 +1366,7 @@ can initialize the environment before using the tools.
       section.
 
    -  For information on setting up a cross-development environment, see
-      the :doc:`../sdk-manual/sdk-manual` manual.
+      the :doc:`../sdk-manual/index` manual.
 
 All the output files for an SDK are written to the ``deploy/sdk`` folder
 inside the :term:`Build Directory` as
@@ -1446,7 +1446,7 @@ The Yocto Project does most of the work for you when it comes to
 creating :ref:`sdk-manual/sdk-intro:the cross-development toolchain`. This
 section provides some technical background on how cross-development
 toolchains are created and used. For more information on toolchains, you
-can also see the :doc:`../sdk-manual/sdk-manual` manual.
+can also see the :doc:`../sdk-manual/index` manual.
 
 In the Yocto Project development environment, cross-development
 toolchains are used to build images and applications that run on the
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 5baf08946..36a246213 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -103,7 +103,7 @@ methods exist for you to do work in the Yocto Project environment:
    hardware. To development BSPs, you need to take some additional steps
    beyond what was described in setting up a development host.
 
-   The :doc:`../bsp-guide/bsp-guide` provides BSP-related development
+   The :doc:`../bsp-guide/index` provides BSP-related development
    information. For specifics on development host preparation, see the
    ":ref:`bsp-guide/bsp:preparing your build host to work with bsp layers`"
    section in the Yocto Project Board Support Package (BSP) Developer's
@@ -114,7 +114,7 @@ methods exist for you to do work in the Yocto Project environment:
    using ``devtool`` makes kernel development quicker by reducing
    iteration cycle times.
 
-   The :doc:`../kernel-dev/kernel-dev` provides kernel-related
+   The :doc:`../kernel-dev/index` provides kernel-related
    development information. For specifics on development host
    preparation, see the
    ":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
@@ -130,7 +130,7 @@ methods exist for you to do work in the Yocto Project environment:
 
    For steps that show you how to set up your development host to use
    Toaster and on how to use Toaster in general, see the
-   :doc:`../toaster-manual/toaster-manual`.
+   :doc:`../toaster-manual/index`.
 
 Yocto Project Source Repositories
 =================================
diff --git a/documentation/overview-manual/overview-manual-intro.rst b/documentation/overview-manual/overview-manual-intro.rst
index f69824da9..c6fb53ca2 100644
--- a/documentation/overview-manual/overview-manual-intro.rst
+++ b/documentation/overview-manual/overview-manual-intro.rst
@@ -37,17 +37,17 @@ This manual does not give you the following:
 
 -  *Step-by-step Instructions for Development Tasks:* Instructional
    procedures reside in other manuals within the Yocto Project
-   documentation set. For example, the :doc:`../dev-manual/dev-manual`
+   documentation set. For example, the :doc:`../dev-manual/index`
    provides examples on how to perform
    various development tasks. As another example, the 
-   :doc:`../sdk-manual/sdk-manual` manual contains detailed
+   :doc:`../sdk-manual/index` manual contains detailed
    instructions on how to install an SDK, which is used to develop
    applications for target hardware.
 
 -  *Reference Material:* This type of material resides in an appropriate
    reference manual. For example, system variables are documented in the
-   :doc:`../ref-manual/ref-manual`. As another
-   example, the :doc:`../bsp-guide/bsp-guide` contains reference information on
+   :doc:`../ref-manual/index`. As another
+   example, the :doc:`../bsp-guide/index` contains reference information on
    BSPs.
 
 -  *Detailed Public Information Not Specific to the Yocto Project:* For
@@ -63,7 +63,7 @@ supplemental information is recommended for full comprehension. For
 additional introductory information on the Yocto Project, see the
 :yocto_home:`Yocto Project Website <>`. If you want to build an image
 with no knowledge of Yocto Project as a way of quickly testing it out,
-see the :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document.
+see the :doc:`../brief-yoctoprojectqs/index` document.
 For a comprehensive list of links and other documentation, see the
 ":ref:`Links and Related
 Documentation <resources-links-and-related-documentation>`"
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 2b9ea9149..bf12a673b 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -251,7 +251,7 @@ accomplish this through a recipe that is a BitBake append
 .. note::
 
    For general information on BSP layer structure, see the
-   :doc:`../bsp-guide/bsp-guide`
+   :doc:`../bsp-guide/index`
    .
 
 The :term:`Source Directory`
@@ -339,12 +339,12 @@ applications using the Yocto Project:
    experience supplemented with the powerful set of ``devtool`` commands
    tailored for the Yocto Project environment.
 
-   For information on the eSDK, see the :doc:`../sdk-manual/sdk-manual` Manual.
+   For information on the eSDK, see the :doc:`../sdk-manual/index` Manual.
 
 -  *Toaster:* Toaster is a web interface to the Yocto Project
    OpenEmbedded build system. Toaster allows you to configure, run, and
    view information about builds. For information on Toaster, see the
-   :doc:`../toaster-manual/toaster-manual`.
+   :doc:`../toaster-manual/index`.
 
 Production Tools
 ----------------
@@ -650,7 +650,7 @@ Project.
    configure and start builds on multiple remote build servers.
 
    For information about and how to use Toaster, see the 
-   :doc:`../toaster-manual/toaster-manual`.
+   :doc:`../toaster-manual/index`.
 
 Reference Embedded Distribution (Poky)
 ======================================
@@ -812,7 +812,7 @@ helpful for getting started:
    application developers. This eSDK allows developers to incorporate
    their library and programming changes back into the image to make
    their code available to other application developers. For information
-   on the eSDK, see the :doc:`../sdk-manual/sdk-manual` manual.
+   on the eSDK, see the :doc:`../sdk-manual/index` manual.
 
 -  *Layer:* A collection of related recipes. Layers allow you to
    consolidate related metadata to customize your build. Layers also
diff --git a/documentation/profile-manual/profile-manual.rst b/documentation/profile-manual/index.rst
similarity index 100%
rename from documentation/profile-manual/profile-manual.rst
rename to documentation/profile-manual/index.rst
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 3ffc1f2c4..747561e06 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -47,7 +47,7 @@ Support Package (BSP) layer for it. For more information on how to
 create a BSP layer, see the
 ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual and the
-:doc:`../bsp-guide/bsp-guide`.
+:doc:`../bsp-guide/index`.
 
 Usually, if the board is not completely exotic, adding support in the
 Yocto Project is fairly straightforward.
diff --git a/documentation/ref-manual/ref-manual.rst b/documentation/ref-manual/index.rst
similarity index 100%
rename from documentation/ref-manual/ref-manual.rst
rename to documentation/ref-manual/index.rst
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 0220221e0..8ea1aa7f0 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -234,7 +234,7 @@ functionality almost completely overlapped with the :ref:`standard
 SDK <sdk-manual/sdk-using:using the standard sdk>` and the
 :ref:`extensible SDK <sdk-manual/sdk-extensible:using the extensible sdk>`. For
 information on these SDKs and how to build and use them, see the
-:doc:`../sdk-manual/sdk-manual` manual.
+:doc:`../sdk-manual/index` manual.
 
 .. note::
 
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index a16460e91..c9223e413 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -261,7 +261,7 @@ these valid features is as follows:
 
 -  *perf:* Installs profiling tools such as ``perf``, ``systemtap``, and
    ``LTTng``. For general information on user-space tools, see the
-   :doc:`../sdk-manual/sdk-manual` manual.
+   :doc:`../sdk-manual/index` manual.
 
 -  *ssh-server-dropbear:* Installs the Dropbear minimal SSH server.
 
@@ -275,7 +275,7 @@ these valid features is as follows:
    ``gdb``. For information on GDB, see the
    ":ref:`dev-manual/dev-manual-common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
    in the Yocto Project Development Tasks Manual. For information on
-   tracing and profiling, see the :doc:`../profile-manual/profile-manual`.
+   tracing and profiling, see the :doc:`../profile-manual/index`.
 
 -  *tools-sdk:* Installs a full SDK that runs on the device.
 
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index 5d17f0e5c..a172a0b71 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -104,7 +104,7 @@ metadata to define the Poky reference distribution.
 
 This directory contains the Yocto Project reference hardware Board
 Support Packages (BSPs). For more information on BSPs, see the
-:doc:`../bsp-guide/bsp-guide`.
+:doc:`../bsp-guide/index`.
 
 .. _structure-meta-selftest:
 
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index af8663a5b..937cd0c70 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -20,9 +20,9 @@ chapter in the Yocto Project Overview and Concepts Manual.
 
 If you want to use the Yocto Project to quickly build an image without
 having to understand concepts, work through the
-:doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` document. You can find "how-to"
-information in the :doc:`../dev-manual/dev-manual`. You can find Yocto Project overview
-and conceptual information in the :doc:`../overview-manual/overview-manual`.
+:doc:`../brief-yoctoprojectqs/index` document. You can find "how-to"
+information in the :doc:`../dev-manual/index`. You can find Yocto Project overview
+and conceptual information in the :doc:`../overview-manual/index`.
 
 .. note::
 
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index f59aaf278..3c12a2470 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -58,8 +58,7 @@ universal, the list includes them just in case:
    :term:`Board Support Package (BSP)`
       A group of drivers, definitions, and other components that provide support
       for a specific hardware configuration. For more information on BSPs, see
-      the :ref:`bsp-guide/bsp-guide:Yocto Project Board Support Package
-      Developer's Guide`.
+      the :doc:`/bsp-guide/index`.
 
    :term:`Build Directory`
       This term refers to the area used by the OpenEmbedded build system for
@@ -164,17 +163,14 @@ universal, the list includes them just in case:
       ":ref:`overview-manual/overview-manual-concepts:Cross-Development
       Toolchain Generation`" section in the Yocto Project Overview and Concepts
       Manual. You can also find more information on using the relocatable
-      toolchain in the :ref:`sdk-manual/sdk-manual:Yocto Project Application
-      Development and the Extensible Software Development Kit (eSDK)` manual.
+      toolchain in the :doc:`/sdk-manual/index` manual.
 
    :term:`Extensible Software Development Kit (eSDK)`
       A custom SDK for application developers. This eSDK allows developers to
       incorporate their library and programming changes back into the image to
       make their code available to other application developers.
 
-      For information on the eSDK, see the :ref:`sdk-manual/sdk-manual:Yocto
-      Project Application Development and the Extensible Software Development
-      Kit (eSDK)` manual.
+      For information on the eSDK, see the :doc:`/sdk-manual/index` manual.
 
    :term:`Image`
       An image is an artifact of the BitBake build process given a collection of
@@ -384,7 +380,7 @@ universal, the list includes them just in case:
       The interface enables you to
       configure and run your builds. Information about builds is collected
       and stored in a database. For information on Toaster, see the
-      :doc:`../toaster-manual/toaster-manual`.
+      :doc:`../toaster-manual/index`.
 
    :term:`Upstream`
       A reference to source code or repositories that are not
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index f8cd5416d..5a52833e8 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -8154,7 +8154,7 @@ system and gives an overview of their function and contents.
       ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
       section in the Yocto Project Overview and Concepts Manual. For
       information on setting up a cross-development environment, see the
-      :doc:`../sdk-manual/sdk-manual` manual.
+      :doc:`../sdk-manual/index` manual.
 
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
@@ -8184,7 +8184,7 @@ system and gives an overview of their function and contents.
       ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
       section in the Yocto Project Overview and Concepts Manual. For
       information on setting up a cross-development environment, see the
-      :doc:`../sdk-manual/sdk-manual` manual.
+      :doc:`../sdk-manual/index` manual.
 
    :term:`TOPDIR`
       The top-level :term:`Build Directory`. BitBake
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 70ba8e7be..e41ce95cf 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -125,18 +125,18 @@ Here is a list of resources you might find helpful:
    guide to the BitBake tool. If you want information on BitBake, see
    this manual.
 
--  :doc:`../brief-yoctoprojectqs/brief-yoctoprojectqs` *:* This
+-  :doc:`../brief-yoctoprojectqs/index` *:* This
    short document lets you experience building an image using the Yocto
    Project without having to understand any concepts or details.
 
--  :doc:`../overview-manual/overview-manual` *:* This manual provides overview
+-  :doc:`../overview-manual/index` *:* This manual provides overview
    and conceptual information about the Yocto Project.
 
--  :doc:`../dev-manual/dev-manual` *:* This manual is a "how-to" guide
+-  :doc:`../dev-manual/index` *:* This manual is a "how-to" guide
    that presents procedures useful to both application and system
    developers who use the Yocto Project.
 
--  :doc:`../sdk-manual/sdk-manual` *manual :* This
+-  :doc:`../sdk-manual/index` *manual :* This
    guide provides information that lets you get going with the standard
    or extensible SDK. An SDK, with its cross-development toolchains,
    allows you to develop projects inside or outside of the Yocto Project
@@ -146,12 +146,12 @@ Here is a list of resources you might find helpful:
    for BSP components. Having a commonly understood structure encourages
    standardization.
 
--  :doc:`../kernel-dev/kernel-dev` *:* This manual describes
+-  :doc:`../kernel-dev/index` *:* This manual describes
    how to work with Linux Yocto kernels as well as provides a bit of
    conceptual information on the construction of the Yocto Linux kernel
    tree.
 
--  :doc:`../ref-manual/ref-manual` *:* This
+-  :doc:`../ref-manual/index` *:* This
    manual provides reference material such as variable, task, and class
    descriptions.
 
@@ -161,11 +161,11 @@ Here is a list of resources you might find helpful:
    which you can easily search for phrases and terms used in the Yocto
    Project documentation set.
 
--  :doc:`../profile-manual/profile-manual` *:* This manual presents a set of
+-  :doc:`../profile-manual/index` *:* This manual presents a set of
    common and generally useful tracing and profiling schemes along with
    their applications (as appropriate) to each tool.
 
--  :doc:`../toaster-manual/toaster-manual` *:* This manual
+-  :doc:`../toaster-manual/index` *:* This manual
    introduces and describes how to set up and use Toaster. Toaster is an
    Application Programming Interface (API) and web-based interface to
    the :term:`OpenEmbedded Build System`, which uses
diff --git a/documentation/sdk-manual/sdk-manual.rst b/documentation/sdk-manual/index.rst
similarity index 100%
rename from documentation/sdk-manual/sdk-manual.rst
rename to documentation/sdk-manual/index.rst
diff --git a/documentation/test-manual/test-manual.rst b/documentation/test-manual/index.rst
similarity index 100%
rename from documentation/test-manual/test-manual.rst
rename to documentation/test-manual/index.rst
diff --git a/documentation/toaster-manual/toaster-manual.rst b/documentation/toaster-manual/index.rst
similarity index 100%
rename from documentation/toaster-manual/toaster-manual.rst
rename to documentation/toaster-manual/index.rst
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index b87fec689..3663f5336 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -8,7 +8,7 @@ Transitioning to a custom environment for systems development
 
 .. note::
 
-   So you've finished the :doc:`brief-yoctoprojectqs/brief-yoctoprojectqs` and
+   So you've finished the :doc:`brief-yoctoprojectqs/index` and
    glanced over the document :doc:`what-i-wish-id-known`, the latter contains
    important information learned from other users. You're well prepared. But
    now, as you are starting your own project, it isn't exactly straightforward what
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index afc126382..3f9fdea5f 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -49,7 +49,7 @@ contact us with other suggestions.
    their silicon. These layers have names such as "meta-intel" or "meta-ti". Try
    not to build layers from scratch. If you do have custom silicon, use one of
    these layers as a guide or template and familiarize yourself with the
-   :doc:`bsp-guide/bsp-guide`.
+   :doc:`bsp-guide/index`.
 
 #. **Do not put everything into one layer:**
    Use different layers to logically separate information in your build. As an
@@ -126,7 +126,7 @@ contact us with other suggestions.
    You can build and run a specific task for a specific package (including
    devshell) or even a single recipe. When developers first start using the
    Yocto Project, the instructions found in the
-   :doc:`brief-yoctoprojectqs/brief-yoctoprojectqs` show how to create an image
+   :doc:`brief-yoctoprojectqs/index` show how to create an image
    and then run or flash that image.  However, you can actually build just a
    single recipe. Thus, if some dependency or recipe isn't working, you can just
    say "bitbake foo" where "foo" is the name for a specific recipe.  As you
@@ -190,7 +190,7 @@ contact us with other suggestions.
      contains procedural information grouped to help you get set up, work with
      layers, customize images, write new recipes, work with libraries, and use
      QEMU. The information is task-based and spans the breadth of the Yocto
-     Project. See the :doc:`../dev-manual/dev-manual`.
+     Project. See the :doc:`../dev-manual/index`.
 
    * **Look Through the Yocto Project Application Development and the Extensible
      Software Development Kit (eSDK) manual**: This manual describes how to use
@@ -201,17 +201,17 @@ contact us with other suggestions.
      for more information.
 
    * **Learn About Kernel Development**: If you want to see how to work with the
-     kernel and understand Yocto Linux kernels, see the :doc:`../kernel-dev/kernel-dev`.
+     kernel and understand Yocto Linux kernels, see the :doc:`../kernel-dev/index`.
      This manual provides information on how to patch the kernel, modify kernel
      recipes, and configure the kernel.
 
    * **Learn About Board Support Packages (BSPs)**: If you want to learn about
-     BSPs, see the :doc:`../bsp-guide/bsp-guide`. This manual also provides an
+     BSPs, see the :doc:`../bsp-guide/index`. This manual also provides an
      example BSP creation workflow. See the :doc:`../bsp-guide/bsp` section.
 
    * **Learn About Toaster**: Toaster is a web interface to the Yocto Project's
      OpenEmbedded build system. If you are interested in using this type of
-     interface to create images, see the :doc:`../toaster-manual/toaster-manual`.
+     interface to create images, see the :doc:`../toaster-manual/index`.
 
    * **Have Available the Yocto Project Reference Manual**: Unlike the rest of
      the Yocto Project manual set, this manual is comprised of material suited
@@ -219,7 +219,7 @@ contact us with other suggestions.
      look at how the pieces of the Yocto Project development environment work
      together, information on various technical details, guidance on migrating
      to a newer Yocto Project release, reference material on the directory
-     structure, classes, and tasks. The :doc:`../ref-manual/ref-manual` also
+     structure, classes, and tasks. The :doc:`../ref-manual/index` also
      contains a fairly comprehensive glossary of variables used within the Yocto
      Project.
 
-- 
2.29.2

