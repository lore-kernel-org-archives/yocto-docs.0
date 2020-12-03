Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.4211.1607031539060237143
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bpVp+n88;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id t4so3342599wrr.12
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ag2FPZ0q41/1oi0fiKznpqBZsnnr9EKpQr126x4qIh0=;
        b=bpVp+n88RRE6C0/sWaGMQGOnrf1zfjVviPSEJY/MnIH4DLcl89Bteb47CVz5m8vKJI
         j/anSMo80NJLfZ89YXddzvXCPhOAqZ9u3Miv5UrszHiF1IvtN04aJQHPbh032MCIQ8R9
         Pe7R9QhwY+C+g60Ff6JMVeucrbKpv/pgTpskf0G1Wdk1RPxrHXoz22ANj4Fk0t+erqHr
         n2ufKdV4IWA1II0Bo6NFxp1AZ9MzXqiZ0zBg/s+l25VrbmObs/0gFM718+duTl3fivmc
         wsd5g816P7lAgmMkmcV7nGXz7feFdOsH/5IsRnAAgrlN99+HtFMf9wNV9FaP7FAo6dEx
         QrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ag2FPZ0q41/1oi0fiKznpqBZsnnr9EKpQr126x4qIh0=;
        b=kR5QWQdFw10OCSHkJidO1n/SERE9+TkHw6PAJdMhMad7eC+kyMTxNaZUdi0cL2+E/c
         SVVa9CXYlytCl1vEk6RKYEYM7zB7zph6RtlekDNRjmvrTuti3C+na/7SOstc+Sbm9D/Y
         VQhQit4wJ5kALjxR8a4S3BUUAzZzY2Nkm0rd0ATvIdxBXvS2Ur5xr0OirsfWgkttMaB6
         CxD8nXvRypjQ8dusSzUtAOdvo264K2uO3TX64scGSy3Eghw8tyWOgygz7/5ciV+/IAfU
         1kW4J8eL5+cItu/pYVrGXuDzddxiykHm/ZWO7n1vIF0cMNYRLH6nryyJJxxayj7MbMu0
         AxDg==
X-Gm-Message-State: AOAM532fvDQBBB+pS80Gp2WAOFnG04Bs0F9Jvka4iFOmJQN89lHxbX2b
	ps8a+Nv1bPbGL+giXvbzsJha5SLbCN9/U/8o
X-Google-Smtp-Source: ABdhPJzjERjXHOSlIUJGRb462IqqscEoWmxeRzAXqGcfJ/B2Sccxid2fX75z6F1DwPwM7dD8hvVYBg==
X-Received: by 2002:adf:f547:: with SMTP id j7mr1332207wrp.296.1607031536209;
        Thu, 03 Dec 2020 13:38:56 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:38:55 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH 02/10] sphinx: use absolute paths for :doc: references
Date: Thu,  3 Dec 2020 22:38:35 +0100
Message-Id: <20201203213843.347671-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
References: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

:doc: references can be made with absolute path instead of relative
path. This patch was generated with this command:
sed -i 's!:doc:`\.\./!:doc:`/!g' */*.rst *.rst

And a few manual fixup we made for references such as:
:doc:"FOOBAR <../xxx>"

Suggested-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/brief-yoctoprojectqs/index.rst   |  4 ++--
 .../dev-manual/dev-manual-common-tasks.rst     | 14 +++++++-------
 documentation/dev-manual/dev-manual-intro.rst  |  6 +++---
 documentation/dev-manual/dev-manual-start.rst  | 14 +++++++-------
 .../kernel-dev/kernel-dev-advanced.rst         |  2 +-
 documentation/kernel-dev/kernel-dev-common.rst |  4 ++--
 documentation/kernel-dev/kernel-dev-intro.rst  |  6 +++---
 .../overview-manual-concepts.rst               |  8 ++++----
 ...overview-manual-development-environment.rst |  6 +++---
 .../overview-manual/overview-manual-intro.rst  | 10 +++++-----
 .../overview-manual-yp-intro.rst               | 18 +++++++++---------
 documentation/ref-manual/faq.rst               |  2 +-
 documentation/ref-manual/migration-2.1.rst     |  2 +-
 .../ref-manual/ref-devtool-reference.rst       |  2 +-
 documentation/ref-manual/ref-features.rst      |  4 ++--
 .../ref-manual/ref-release-process.rst         |  2 +-
 documentation/ref-manual/ref-structure.rst     |  2 +-
 .../ref-manual/ref-system-requirements.rst     |  6 +++---
 documentation/ref-manual/ref-terms.rst         |  2 +-
 documentation/ref-manual/ref-variables.rst     | 10 +++++-----
 documentation/ref-manual/resources.rst         | 18 +++++++++---------
 documentation/sdk-manual/sdk-intro.rst         |  2 +-
 documentation/what-i-wish-id-known.rst         | 14 +++++++-------
 23 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index e8912f07c..c1b78d0f5 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -39,7 +39,7 @@ build a reference embedded OS called Poky.
       Tasks Manual for more information.
 
 If you want more conceptual or background information on the Yocto
-Project, see the :doc:`../overview-manual/index`.
+Project, see the :doc:`/overview-manual/index`.
 
 Compatible Linux Distribution
 =============================
@@ -404,7 +404,7 @@ information including the website, wiki pages, and user manuals:
    concepts are useful for the beginner.
 
 -  **Yocto Project Overview and Concepts Manual:** The
-   :doc:`../overview-manual/index` is a great
+   :doc:`/overview-manual/index` is a great
    place to start to learn about the Yocto Project. This manual
    introduces you to the Yocto Project and its development environment.
    The manual also provides conceptual information for various aspects
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index e22bcd50e..0a2e6d9df 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -1319,7 +1319,7 @@ to determine how well the build went.
    ``log.do_fetch``, and ``log.do_compile``).
 
 You can find more information about the build process in
-":doc:`../overview-manual/overview-manual-development-environment`"
+":doc:`/overview-manual/overview-manual-development-environment`"
 chapter of the Yocto Project Overview and Concepts Manual.
 
 Fetching Code
@@ -3127,7 +3127,7 @@ Using ``devtool upgrade``
 
 As mentioned earlier, an alternative method for upgrading recipes to
 newer versions is to use
-:doc:`devtool upgrade <../ref-manual/ref-devtool-reference>`.
+:doc:`devtool upgrade </ref-manual/ref-devtool-reference>`.
 You can read about ``devtool upgrade`` in general in the
 ":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
@@ -3644,7 +3644,7 @@ build host running Linux.
 
    -  For information on how to build an image using
       :term:`Toaster`, see the
-      :doc:`../toaster-manual/index`.
+      :doc:`/toaster-manual/index`.
 
    -  For information on how to use ``devtool`` to build images, see the
       ":ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`"
@@ -3653,7 +3653,7 @@ build host running Linux.
 
    -  For a quick example on how to build an image using the
       OpenEmbedded build system, see the
-      :doc:`../brief-yoctoprojectqs/index` document.
+      :doc:`/brief-yoctoprojectqs/index` document.
 
 The build process creates an entire Linux distribution from source and
 places it in your :term:`Build Directory` under
@@ -3728,7 +3728,7 @@ The following figure and list overviews the build process:
    kernels built by the OpenEmbedded build system are placed in the
    Build Directory in ``tmp/deploy/images``. For information on how to
    run pre-built images such as ``qemux86`` and ``qemuarm``, see the
-   :doc:`../sdk-manual/index` manual. For
+   :doc:`/sdk-manual/index` manual. For
    information about how to install these images, see the documentation
    for your particular board or machine.
 
@@ -7418,7 +7418,7 @@ Creating Node Package Manager (NPM) Packages
 manager for the JavaScript programming language. The Yocto Project
 supports the NPM :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`. You can
 use this fetcher in combination with
-:doc:`devtool <../ref-manual/ref-devtool-reference>` to create
+:doc:`devtool </ref-manual/ref-devtool-reference>` to create
 recipes that produce NPM packages.
 
 Two workflows exist that allow you to create NPM packages using
@@ -7446,7 +7446,7 @@ NPM packages:
    is NPM's public registry.
 
 -  Be familiar with
-   :doc:`devtool <../ref-manual/ref-devtool-reference>`.
+   :doc:`devtool </ref-manual/ref-devtool-reference>`.
 
 -  The NPM host tools need the native ``nodejs-npm`` package, which is
    part of the OpenEmbedded environment. You need to get the package by
diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
index 94c481b7d..23c848e87 100644
--- a/documentation/dev-manual/dev-manual-intro.rst
+++ b/documentation/dev-manual/dev-manual-intro.rst
@@ -31,13 +31,13 @@ This manual provides the following:
 This manual does not provide the following:
 
 -  Redundant Step-by-step Instructions: For example, the
-   :doc:`../sdk-manual/index` manual contains detailed
+   :doc:`/sdk-manual/index` manual contains detailed
    instructions on how to install an SDK, which is used to develop
    applications for target hardware.
 
 -  Reference or Conceptual Material: This type of material resides in an
    appropriate reference manual. For example, system variables are
-   documented in the :doc:`../ref-manual/index`.
+   documented in the :doc:`/ref-manual/index`.
 
 -  Detailed Public Information Not Specific to the Yocto Project: For
    example, exhaustive information on how to use the Source Control
@@ -52,7 +52,7 @@ supplemental information is recommended for full comprehension. For
 introductory information on the Yocto Project, see the
 :yocto_home:`Yocto Project Website <>`. If you want to build an image with no
 knowledge of Yocto Project as a way of quickly testing it out, see the
-:doc:`../brief-yoctoprojectqs/index` document.
+:doc:`/brief-yoctoprojectqs/index` document.
 
 For a comprehensive list of links and other documentation, see the
 ":ref:`ref-manual/resources:links and related documentation`"
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index 053f09cdc..d4727a6f6 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -342,10 +342,10 @@ using a given development path on your native Linux machine. If you are
 going to use BitBake, see the
 ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
 section. If you are going
-to use the Extensible SDK, see the ":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
+to use the Extensible SDK, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
-Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`../kernel-dev/index`. If you are going to use
-Toaster, see the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
+Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/kernel-dev/index`. If you are going to use
+Toaster, see the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
 section in the Toaster User Manual.
 
 Setting Up to Use CROss PlatformS (CROPS)
@@ -442,10 +442,10 @@ as if you were running on a native Linux machine. If you are going to
 use the Poky container, see the
 ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
 section. If you are going to use the Extensible SDK container, see the
-":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
+":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
-the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
+the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
 section in the Toaster User Manual.
 
 Setting Up to Use Windows Subsystem For Linux (WSLv2)
@@ -557,10 +557,10 @@ your Yocto Project build host:
 
 Once you have WSLv2 set up, everything is in place to develop just as if
 you were running on a native Linux machine. If you are going to use the
-Extensible SDK container, see the ":doc:`../sdk-manual/sdk-extensible`" Chapter in the Yocto
+Extensible SDK container, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
-the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
+the ":doc:`/toaster-manual/toaster-manual-setup-and-use`"
 section in the Toaster User Manual.
 
 Locating Yocto Project Source Files
diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index cc4834325..ddb31edca 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -474,7 +474,7 @@ supported kernel type.
 This section overviews the BSP description structure, the aggregation
 concepts, and presents a detailed example using a BSP supported by the
 Yocto Project (i.e. BeagleBone Board). For complete information on BSP
-layer file hierarchy, see the :doc:`../bsp-guide/index`.
+layer file hierarchy, see the :doc:`/bsp-guide/index`.
 
 Description Overview
 ~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index c57025c67..8e9bc27bf 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -21,7 +21,7 @@ Preparing the Build Host to Work on the Kernel
 
 Before you can do any kernel development, you need to be sure your build
 host is set up to use the Yocto Project. For information on how to get
-set up, see the ":doc:`../dev-manual/dev-manual-start`" section in
+set up, see the ":doc:`/dev-manual/dev-manual-start`" section in
 the Yocto Project Development Tasks Manual. Part of preparing the system
 is creating a local Git repository of the
 :term:`Source Directory` (``poky``) on your system. Follow the steps in the
@@ -502,7 +502,7 @@ your layer in the following area:
 .. note::
 
    If you are working on a new machine Board Support Package (BSP), be
-   sure to refer to the :doc:`../bsp-guide/index`.
+   sure to refer to the :doc:`/bsp-guide/index`.
 
 As an example, consider the following append file used by the BSPs in
 ``meta-yocto-bsp``:
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index a2961d864..29d4516c5 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -79,9 +79,9 @@ facilitate the process of working with the kernel recipes. If you find
 you need some additional background, please be sure to review and
 understand the following documentation:
 
--  :doc:`../brief-yoctoprojectqs/index` document.
+-  :doc:`/brief-yoctoprojectqs/index` document.
 
--  :doc:`../overview-manual/index`.
+-  :doc:`/overview-manual/index`.
 
 -  :ref:`devtool
    workflow <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
@@ -111,7 +111,7 @@ general information and references for further information.
    :align: center
 
 1. *Set up Your Host Development System to Support Development Using the
-   Yocto Project*: See the ":doc:`../dev-manual/dev-manual-start`" section in
+   Yocto Project*: See the ":doc:`/dev-manual/dev-manual-start`" section in
    the Yocto Project Development Tasks Manual for options on how to get
    a build host ready to use the Yocto Project.
 
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index d79dacbfb..bbf2d0494 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -481,7 +481,7 @@ The BSP Layer provides machine configurations that target specific
 hardware. Everything in this layer is specific to the machine for which
 you are building the image or the SDK. A common structure or form is
 defined for BSP layers. You can learn more about this structure in the
-:doc:`../bsp-guide/index`.
+:doc:`/bsp-guide/index`.
 
 .. note::
 
@@ -1285,7 +1285,7 @@ this output:
 .. note::
 
    For a list of example images that the Yocto Project provides, see the
-   ":doc:`../ref-manual/ref-images`" chapter in the Yocto Project Reference
+   ":doc:`/ref-manual/ref-images`" chapter in the Yocto Project Reference
    Manual.
 
 The build process writes images out to the :term:`Build Directory`
@@ -1366,7 +1366,7 @@ can initialize the environment before using the tools.
       section.
 
    -  For information on setting up a cross-development environment, see
-      the :doc:`../sdk-manual/index` manual.
+      the :doc:`/sdk-manual/index` manual.
 
 All the output files for an SDK are written to the ``deploy/sdk`` folder
 inside the :term:`Build Directory` as
@@ -1446,7 +1446,7 @@ The Yocto Project does most of the work for you when it comes to
 creating :ref:`sdk-manual/sdk-intro:the cross-development toolchain`. This
 section provides some technical background on how cross-development
 toolchains are created and used. For more information on toolchains, you
-can also see the :doc:`../sdk-manual/index` manual.
+can also see the :doc:`/sdk-manual/index` manual.
 
 In the Yocto Project development environment, cross-development
 toolchains are used to build images and applications that run on the
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 36a246213..2421ec1a8 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -103,7 +103,7 @@ methods exist for you to do work in the Yocto Project environment:
    hardware. To development BSPs, you need to take some additional steps
    beyond what was described in setting up a development host.
 
-   The :doc:`../bsp-guide/index` provides BSP-related development
+   The :doc:`/bsp-guide/index` provides BSP-related development
    information. For specifics on development host preparation, see the
    ":ref:`bsp-guide/bsp:preparing your build host to work with bsp layers`"
    section in the Yocto Project Board Support Package (BSP) Developer's
@@ -114,7 +114,7 @@ methods exist for you to do work in the Yocto Project environment:
    using ``devtool`` makes kernel development quicker by reducing
    iteration cycle times.
 
-   The :doc:`../kernel-dev/index` provides kernel-related
+   The :doc:`/kernel-dev/index` provides kernel-related
    development information. For specifics on development host
    preparation, see the
    ":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
@@ -130,7 +130,7 @@ methods exist for you to do work in the Yocto Project environment:
 
    For steps that show you how to set up your development host to use
    Toaster and on how to use Toaster in general, see the
-   :doc:`../toaster-manual/index`.
+   :doc:`/toaster-manual/index`.
 
 Yocto Project Source Repositories
 =================================
diff --git a/documentation/overview-manual/overview-manual-intro.rst b/documentation/overview-manual/overview-manual-intro.rst
index c6fb53ca2..50c623c3b 100644
--- a/documentation/overview-manual/overview-manual-intro.rst
+++ b/documentation/overview-manual/overview-manual-intro.rst
@@ -37,17 +37,17 @@ This manual does not give you the following:
 
 -  *Step-by-step Instructions for Development Tasks:* Instructional
    procedures reside in other manuals within the Yocto Project
-   documentation set. For example, the :doc:`../dev-manual/index`
+   documentation set. For example, the :doc:`/dev-manual/index`
    provides examples on how to perform
    various development tasks. As another example, the 
-   :doc:`../sdk-manual/index` manual contains detailed
+   :doc:`/sdk-manual/index` manual contains detailed
    instructions on how to install an SDK, which is used to develop
    applications for target hardware.
 
 -  *Reference Material:* This type of material resides in an appropriate
    reference manual. For example, system variables are documented in the
-   :doc:`../ref-manual/index`. As another
-   example, the :doc:`../bsp-guide/index` contains reference information on
+   :doc:`/ref-manual/index`. As another
+   example, the :doc:`/bsp-guide/index` contains reference information on
    BSPs.
 
 -  *Detailed Public Information Not Specific to the Yocto Project:* For
@@ -63,7 +63,7 @@ supplemental information is recommended for full comprehension. For
 additional introductory information on the Yocto Project, see the
 :yocto_home:`Yocto Project Website <>`. If you want to build an image
 with no knowledge of Yocto Project as a way of quickly testing it out,
-see the :doc:`../brief-yoctoprojectqs/index` document.
+see the :doc:`/brief-yoctoprojectqs/index` document.
 For a comprehensive list of links and other documentation, see the
 ":ref:`Links and Related
 Documentation <resources-links-and-related-documentation>`"
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index bf12a673b..637d57abb 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -111,7 +111,7 @@ Project:
    development.
 
 -  *Releases According to a Strict Schedule:* Major releases occur on a
-   :doc:`six-month cycle <../ref-manual/ref-release-process>`
+   :doc:`six-month cycle </ref-manual/ref-release-process>`
    predictably in October and April. The most recent two releases
    support point releases to address common vulnerabilities and
    exposures. This predictability is crucial for projects based on the
@@ -251,7 +251,7 @@ accomplish this through a recipe that is a BitBake append
 .. note::
 
    For general information on BSP layer structure, see the
-   :doc:`../bsp-guide/index`
+   :doc:`/bsp-guide/index`
    .
 
 The :term:`Source Directory`
@@ -339,12 +339,12 @@ applications using the Yocto Project:
    experience supplemented with the powerful set of ``devtool`` commands
    tailored for the Yocto Project environment.
 
-   For information on the eSDK, see the :doc:`../sdk-manual/index` Manual.
+   For information on the eSDK, see the :doc:`/sdk-manual/index` Manual.
 
 -  *Toaster:* Toaster is a web interface to the Yocto Project
    OpenEmbedded build system. Toaster allows you to configure, run, and
    view information about builds. For information on Toaster, see the
-   :doc:`../toaster-manual/index`.
+   :doc:`/toaster-manual/index`.
 
 Production Tools
 ----------------
@@ -392,7 +392,7 @@ activities using the Yocto Project:
    benefit of the development community.
 
    You can learn more about the AutoBuilder used by the Yocto Project
-   Autobuilder :doc:`here <../test-manual/test-manual-understand-autobuilder>`.
+   Autobuilder :doc:`here </test-manual/test-manual-understand-autobuilder>`.
 
 -  *Cross-Prelink:* Prelinking is the process of pre-computing the load
    addresses and link tables generated by the dynamic linker as compared
@@ -650,7 +650,7 @@ Project.
    configure and start builds on multiple remote build servers.
 
    For information about and how to use Toaster, see the 
-   :doc:`../toaster-manual/index`.
+   :doc:`/toaster-manual/index`.
 
 Reference Embedded Distribution (Poky)
 ======================================
@@ -720,7 +720,7 @@ Poky has a regular, well established, six-month release cycle under its
 own version. Major releases occur at the same time major releases (point
 releases) occur for the Yocto Project, which are typically in the Spring
 and Fall. For more information on the Yocto Project release schedule and
-cadence, see the ":doc:`../ref-manual/ref-release-process`" chapter in the
+cadence, see the ":doc:`/ref-manual/ref-release-process`" chapter in the
 Yocto Project Reference Manual.
 
 Much has been said about Poky being a "default configuration". A default
@@ -798,7 +798,7 @@ Some Basic Terms
 
 It helps to understand some basic fundamental terms when learning the
 Yocto Project. Although a list of terms exists in the ":doc:`Yocto Project
-Terms <../ref-manual/ref-terms>`" section of the Yocto Project
+Terms </ref-manual/ref-terms>`" section of the Yocto Project
 Reference Manual, this section provides the definitions of some terms
 helpful for getting started:
 
@@ -812,7 +812,7 @@ helpful for getting started:
    application developers. This eSDK allows developers to incorporate
    their library and programming changes back into the image to make
    their code available to other application developers. For information
-   on the eSDK, see the :doc:`../sdk-manual/index` manual.
+   on the eSDK, see the :doc:`/sdk-manual/index` manual.
 
 -  *Layer:* A collection of related recipes. Layers allow you to
    consolidate related metadata to customize your build. Layers also
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 747561e06..819b6857d 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -47,7 +47,7 @@ Support Package (BSP) layer for it. For more information on how to
 create a BSP layer, see the
 ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual and the
-:doc:`../bsp-guide/index`.
+:doc:`/bsp-guide/index`.
 
 Usually, if the board is not completely exotic, adding support in the
 Yocto Project is fairly straightforward.
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 8ea1aa7f0..25ee21499 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -234,7 +234,7 @@ functionality almost completely overlapped with the :ref:`standard
 SDK <sdk-manual/sdk-using:using the standard sdk>` and the
 :ref:`extensible SDK <sdk-manual/sdk-extensible:using the extensible sdk>`. For
 information on these SDKs and how to build and use them, see the
-:doc:`../sdk-manual/index` manual.
+:doc:`/sdk-manual/index` manual.
 
 .. note::
 
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index a769b3bd4..83861d271 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -11,7 +11,7 @@ is a key part of the extensible SDK.
 
 This chapter provides a Quick Reference for the ``devtool`` command. For
 more information on how to apply the command when using the extensible
-SDK, see the ":doc:`../sdk-manual/sdk-extensible`" chapter in the Yocto
+SDK, see the ":doc:`/sdk-manual/sdk-extensible`" chapter in the Yocto
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual.
 
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index c9223e413..6c85c2418 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -261,7 +261,7 @@ these valid features is as follows:
 
 -  *perf:* Installs profiling tools such as ``perf``, ``systemtap``, and
    ``LTTng``. For general information on user-space tools, see the
-   :doc:`../sdk-manual/index` manual.
+   :doc:`/sdk-manual/index` manual.
 
 -  *ssh-server-dropbear:* Installs the Dropbear minimal SSH server.
 
@@ -275,7 +275,7 @@ these valid features is as follows:
    ``gdb``. For information on GDB, see the
    ":ref:`dev-manual/dev-manual-common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
    in the Yocto Project Development Tasks Manual. For information on
-   tracing and profiling, see the :doc:`../profile-manual/index`.
+   tracing and profiling, see the :doc:`/profile-manual/index`.
 
 -  *tools-sdk:* Installs a full SDK that runs on the device.
 
diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
index c77a3bcb1..ec6d23387 100644
--- a/documentation/ref-manual/ref-release-process.rst
+++ b/documentation/ref-manual/ref-release-process.rst
@@ -128,7 +128,7 @@ consists of the following pieces:
 
 -  :ref:`testimage.bbclass <ref-classes-testimage*>`: This class
    performs runtime testing of images after they are built. The tests
-   are usually used with :doc:`QEMU <../dev-manual/dev-manual-qemu>`
+   are usually used with :doc:`QEMU </dev-manual/dev-manual-qemu>`
    to boot the images and check the combined runtime result boot
    operation and functions. However, the test can also use the IP
    address of a machine to test.
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index a172a0b71..d3a231554 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -104,7 +104,7 @@ metadata to define the Poky reference distribution.
 
 This directory contains the Yocto Project reference hardware Board
 Support Packages (BSPs). For more information on BSPs, see the
-:doc:`../bsp-guide/index`.
+:doc:`/bsp-guide/index`.
 
 .. _structure-meta-selftest:
 
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 937cd0c70..2c7c1e075 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -20,9 +20,9 @@ chapter in the Yocto Project Overview and Concepts Manual.
 
 If you want to use the Yocto Project to quickly build an image without
 having to understand concepts, work through the
-:doc:`../brief-yoctoprojectqs/index` document. You can find "how-to"
-information in the :doc:`../dev-manual/index`. You can find Yocto Project overview
-and conceptual information in the :doc:`../overview-manual/index`.
+:doc:`/brief-yoctoprojectqs/index` document. You can find "how-to"
+information in the :doc:`/dev-manual/index`. You can find Yocto Project overview
+and conceptual information in the :doc:`/overview-manual/index`.
 
 .. note::
 
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index 3c12a2470..6f0facf72 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -380,7 +380,7 @@ universal, the list includes them just in case:
       The interface enables you to
       configure and run your builds. Information about builds is collected
       and stored in a database. For information on Toaster, see the
-      :doc:`../toaster-manual/index`.
+      :doc:`/toaster-manual/index`.
 
    :term:`Upstream`
       A reference to source code or repositories that are not
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 5a52833e8..8411989b6 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -2907,7 +2907,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
-      ":doc:`../ref-manual/ref-kickstart`" chapter.
+      ":doc:`/ref-manual/ref-kickstart`" chapter.
 
    :term:`IMAGE_BOOT_FILES`
       A space-separated list of files installed into the boot partition
@@ -2943,7 +2943,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
-      ":doc:`../ref-manual/ref-kickstart`" chapter.
+      ":doc:`/ref-manual/ref-kickstart`" chapter.
 
    :term:`IMAGE_CLASSES`
       A list of classes that all images should inherit. You typically use
@@ -8154,7 +8154,7 @@ system and gives an overview of their function and contents.
       ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
       section in the Yocto Project Overview and Concepts Manual. For
       information on setting up a cross-development environment, see the
-      :doc:`../sdk-manual/index` manual.
+      :doc:`/sdk-manual/index` manual.
 
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
@@ -8184,7 +8184,7 @@ system and gives an overview of their function and contents.
       ":ref:`sdk-manual/sdk-intro:the cross-development toolchain`"
       section in the Yocto Project Overview and Concepts Manual. For
       information on setting up a cross-development environment, see the
-      :doc:`../sdk-manual/index` manual.
+      :doc:`/sdk-manual/index` manual.
 
    :term:`TOPDIR`
       The top-level :term:`Build Directory`. BitBake
@@ -8737,7 +8737,7 @@ system and gives an overview of their function and contents.
       image, see the
       ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
       section in the Yocto Project Development Tasks Manual. For details on
-      the kickstart file format, see the ":doc:`../ref-manual/ref-kickstart`" Chapter.
+      the kickstart file format, see the ":doc:`/ref-manual/ref-kickstart`" Chapter.
 
    :term:`WKS_FILE_DEPENDS`
       When placed in the recipe that builds your image, this variable lists
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index e41ce95cf..fd04593d4 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -125,33 +125,33 @@ Here is a list of resources you might find helpful:
    guide to the BitBake tool. If you want information on BitBake, see
    this manual.
 
--  :doc:`../brief-yoctoprojectqs/index` *:* This
+-  :doc:`/brief-yoctoprojectqs/index` *:* This
    short document lets you experience building an image using the Yocto
    Project without having to understand any concepts or details.
 
--  :doc:`../overview-manual/index` *:* This manual provides overview
+-  :doc:`/overview-manual/index` *:* This manual provides overview
    and conceptual information about the Yocto Project.
 
--  :doc:`../dev-manual/index` *:* This manual is a "how-to" guide
+-  :doc:`/dev-manual/index` *:* This manual is a "how-to" guide
    that presents procedures useful to both application and system
    developers who use the Yocto Project.
 
--  :doc:`../sdk-manual/index` *manual :* This
+-  :doc:`/sdk-manual/index` *manual :* This
    guide provides information that lets you get going with the standard
    or extensible SDK. An SDK, with its cross-development toolchains,
    allows you to develop projects inside or outside of the Yocto Project
    environment.
 
--  :doc:`../bsp-guide/bsp` *:* This guide defines the structure
+-  :doc:`/bsp-guide/bsp` *:* This guide defines the structure
    for BSP components. Having a commonly understood structure encourages
    standardization.
 
--  :doc:`../kernel-dev/index` *:* This manual describes
+-  :doc:`/kernel-dev/index` *:* This manual describes
    how to work with Linux Yocto kernels as well as provides a bit of
    conceptual information on the construction of the Yocto Linux kernel
    tree.
 
--  :doc:`../ref-manual/index` *:* This
+-  :doc:`/ref-manual/index` *:* This
    manual provides reference material such as variable, task, and class
    descriptions.
 
@@ -161,11 +161,11 @@ Here is a list of resources you might find helpful:
    which you can easily search for phrases and terms used in the Yocto
    Project documentation set.
 
--  :doc:`../profile-manual/index` *:* This manual presents a set of
+-  :doc:`/profile-manual/index` *:* This manual presents a set of
    common and generally useful tracing and profiling schemes along with
    their applications (as appropriate) to each tool.
 
--  :doc:`../toaster-manual/index` *:* This manual
+-  :doc:`/toaster-manual/index` *:* This manual
    introduces and describes how to set up and use Toaster. Toaster is an
    Application Programming Interface (API) and web-based interface to
    the :term:`OpenEmbedded Build System`, which uses
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index bbd33b8a7..5514c6767 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -211,7 +211,7 @@ You just need to follow these general steps:
    tools to develop your application. If you need to separately install
    and use the QEMU emulator, you can go to `QEMU Home
    Page <http://wiki.qemu.org/Main_Page>`__ to download and learn about
-   the emulator. See the ":doc:`../dev-manual/dev-manual-qemu`" chapter in the
+   the emulator. See the ":doc:`/dev-manual/dev-manual-qemu`" chapter in the
    Yocto Project Development Tasks Manual for information on using QEMU
    within the Yocto Project.
 
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 3f9fdea5f..563594b52 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -190,28 +190,28 @@ contact us with other suggestions.
      contains procedural information grouped to help you get set up, work with
      layers, customize images, write new recipes, work with libraries, and use
      QEMU. The information is task-based and spans the breadth of the Yocto
-     Project. See the :doc:`../dev-manual/index`.
+     Project. See the :doc:`/dev-manual/index`.
 
    * **Look Through the Yocto Project Application Development and the Extensible
      Software Development Kit (eSDK) manual**: This manual describes how to use
      both the standard SDK and the extensible SDK, which are used primarily for
-     application development. The :doc:`../sdk-manual/sdk-extensible` also provides
+     application development. The :doc:`/sdk-manual/sdk-extensible` also provides
      example workflows that use devtool. See the section
      :ref:`sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow`
      for more information.
 
    * **Learn About Kernel Development**: If you want to see how to work with the
-     kernel and understand Yocto Linux kernels, see the :doc:`../kernel-dev/index`.
+     kernel and understand Yocto Linux kernels, see the :doc:`/kernel-dev/index`.
      This manual provides information on how to patch the kernel, modify kernel
      recipes, and configure the kernel.
 
    * **Learn About Board Support Packages (BSPs)**: If you want to learn about
-     BSPs, see the :doc:`../bsp-guide/index`. This manual also provides an
-     example BSP creation workflow. See the :doc:`../bsp-guide/bsp` section.
+     BSPs, see the :doc:`/bsp-guide/index`. This manual also provides an
+     example BSP creation workflow. See the :doc:`/bsp-guide/bsp` section.
 
    * **Learn About Toaster**: Toaster is a web interface to the Yocto Project's
      OpenEmbedded build system. If you are interested in using this type of
-     interface to create images, see the :doc:`../toaster-manual/index`.
+     interface to create images, see the :doc:`/toaster-manual/index`.
 
    * **Have Available the Yocto Project Reference Manual**: Unlike the rest of
      the Yocto Project manual set, this manual is comprised of material suited
@@ -219,7 +219,7 @@ contact us with other suggestions.
      look at how the pieces of the Yocto Project development environment work
      together, information on various technical details, guidance on migrating
      to a newer Yocto Project release, reference material on the directory
-     structure, classes, and tasks. The :doc:`../ref-manual/index` also
+     structure, classes, and tasks. The :doc:`/ref-manual/index` also
      contains a fairly comprehensive glossary of variables used within the Yocto
      Project.
 
-- 
2.29.2

