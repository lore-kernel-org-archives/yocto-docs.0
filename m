Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.4194.1607031545909511611
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UVFXiDWH;
 spf=pass (domain: linaro.org, ip: 209.85.221.48, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f48.google.com with SMTP id 64so3350382wra.11
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NKEVE6ecqj3djkWidRwlue8urvRE1MDTo50o8GbYxco=;
        b=UVFXiDWHy7M7hzFSFxajNy7M8p+8NBz2DtKAXrHFEqrOTfK4yjQ/mwfssdrGTD+jP7
         pptnPXo7DtqdTUzQZfG8QBVQpwIobii13jBEWi6BfNki8eVygxEh4vGktevgS4nbBLaV
         X6BoeD42UjJ64fVWITx/TGaABbfdm3glTATP7I375S0ZDev0vMLMph+8Ho85iMfz0k0A
         D+MJOrZ9/n6Nyij0RSWhiz+d8sXEu5Ma1V+LXvaWND43mzFyTow68XFB1Uw3sZaHWzht
         +7ekP5NTqmYbVcJghxS8rnHCuM0PB0V1s+0OhJjJLt8KA1Nyjinhe8WzqBGkqSdwHggI
         RqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NKEVE6ecqj3djkWidRwlue8urvRE1MDTo50o8GbYxco=;
        b=SaOTdT38l5Zkm0YvnXkCVYQsGPeTNv9nvQzLa9aCn9Vj50ZNy3pCxOEEVx6pJ44T/V
         HaPajMCugu5pSI3QZJrWEuZWPhckG7LT0EPYkVTBW0G0gKqcqtuN1173Lll7qQzjIN24
         RM8ZEjheLROjAMFmFas0XNmQ/09bVUIgExymjclKuMyay7yj2BLOhD9Avri/LjTP6apB
         7gVqXRa8lyMcU63RLnmByFZaW+jguq3niuPrYjR0erU/9yCOQUmULQ6AcOsKDXZL+4/r
         zgFkdabJ2eAlvvqImbXnyJ0ffQeBL+3OaarsK5nPRugD9/lctcvMl3Fsa3r/69eJ2Xzk
         SsMA==
X-Gm-Message-State: AOAM533Wxy8qlw6cKALn8ZLW8Celt1FEmUYuc9YWRR4Iw94ItNONo1L8
	Xv99Z/+AcnZgO0AgskOvvfeGO9m23TPWFpir
X-Google-Smtp-Source: ABdhPJyynnPZlXfbPtNRgbg5qp77DkmdfbsXh1ntc7chSS96TO4EIpmW65iQlbkGXw9Uqa6YQ522sg==
X-Received: by 2002:a05:6000:82:: with SMTP id m2mr1293316wrx.314.1607031540215;
        Thu, 03 Dec 2020 13:39:00 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:38:59 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 05/10] dev-manual: remove 'dev-manual' from filenames
Date: Thu,  3 Dec 2020 22:38:38 +0100
Message-Id: <20201203213843.347671-6-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
References: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All filenames duplicate the 'manual name', which is not needed, and
make all references longer than they should. Rename all files to be as
consise as possible, and fix all references

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/brief-yoctoprojectqs/index.rst  |  14 +--
 documentation/bsp-guide/bsp.rst               |  36 +++---
 ...nual-common-tasks.rst => common-tasks.rst} |  54 ++++-----
 documentation/dev-manual/index.rst            |   8 +-
 .../{dev-manual-intro.rst => intro.rst}       |   0
 .../{dev-manual-qemu.rst => qemu.rst}         |   0
 .../{dev-manual-start.rst => start.rst}       |  20 ++--
 .../kernel-dev/kernel-dev-common.rst          |  26 ++---
 documentation/kernel-dev/kernel-dev-faq.rst   |   2 +-
 documentation/kernel-dev/kernel-dev-intro.rst |   4 +-
 .../overview-manual-concepts.rst              |  20 ++--
 ...verview-manual-development-environment.rst |  26 ++---
 .../overview-manual-yp-intro.rst              |  16 +--
 documentation/ref-manual/faq.rst              |   6 +-
 documentation/ref-manual/migration-1.4.rst    |   2 +-
 documentation/ref-manual/migration-1.5.rst    |   4 +-
 documentation/ref-manual/migration-1.6.rst    |   6 +-
 documentation/ref-manual/migration-1.7.rst    |   2 +-
 documentation/ref-manual/migration-2.1.rst    |   2 +-
 documentation/ref-manual/migration-2.3.rst    |   2 +-
 documentation/ref-manual/migration-2.5.rst    |   2 +-
 documentation/ref-manual/migration-2.6.rst    |   2 +-
 documentation/ref-manual/ref-classes.rst      |  34 +++---
 .../ref-manual/ref-devtool-reference.rst      |   4 +-
 documentation/ref-manual/ref-features.rst     |   6 +-
 documentation/ref-manual/ref-images.rst       |   4 +-
 documentation/ref-manual/ref-kickstart.rst    |   2 +-
 .../ref-manual/ref-release-process.rst        |   6 +-
 documentation/ref-manual/ref-structure.rst    |  14 +--
 .../ref-manual/ref-system-requirements.rst    |   2 +-
 documentation/ref-manual/ref-tasks.rst        |  10 +-
 documentation/ref-manual/ref-terms.rst        |   4 +-
 documentation/ref-manual/ref-variables.rst    | 104 +++++++++---------
 documentation/ref-manual/resources.rst        |   4 +-
 .../sdk-manual/sdk-appendix-obtain.rst        |   8 +-
 documentation/sdk-manual/sdk-intro.rst        |   2 +-
 documentation/test-manual/intro.rst           |   2 +-
 documentation/toaster-manual/reference.rst    |   2 +-
 documentation/toaster-manual/start.rst        |   2 +-
 .../transitioning-to-a-custom-environment.rst |   8 +-
 documentation/what-i-wish-id-known.rst        |   2 +-
 41 files changed, 237 insertions(+), 237 deletions(-)
 rename documentation/dev-manual/{dev-manual-common-tasks.rst => common-tasks.rst} (99%)
 rename documentation/dev-manual/{dev-manual-intro.rst => intro.rst} (100%)
 rename documentation/dev-manual/{dev-manual-qemu.rst => qemu.rst} (100%)
 rename documentation/dev-manual/{dev-manual-start.rst => start.rst} (97%)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index c1b78d0f5..51f684af0 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -20,7 +20,7 @@ build a reference embedded OS called Poky.
       (:term:`Build Host`) is not
       a native Linux system, you can still perform these steps by using
       CROss PlatformS (CROPS) and setting up a Poky container. See the
-      :ref:`dev-manual/dev-manual-start:setting up to use cross platforms (crops)`
+      :ref:`dev-manual/start:setting up to use cross platforms (crops)`
       section
       in the Yocto Project Development Tasks Manual for more
       information.
@@ -34,7 +34,7 @@ build a reference embedded OS called Poky.
          compatible but not officially supported nor validated with
          WSLv2, if you still decide to use WSL please upgrade to WSLv2.
 
-      See the :ref:`dev-manual/dev-manual-start:setting up to use windows
+      See the :ref:`dev-manual/start:setting up to use windows
       subsystem for linux (wslv2)` section in the Yocto Project Development
       Tasks Manual for more information.
 
@@ -55,7 +55,7 @@ following requirements:
    :ref:`ref-manual/ref-system-requirements:supported linux distributions`
    section in the Yocto Project Reference Manual. For detailed
    information on preparing your build host, see the
-   :ref:`dev-manual/dev-manual-start:preparing the build host`
+   :ref:`dev-manual/start:preparing the build host`
    section in the Yocto Project Development Tasks Manual.
 
 -
@@ -145,7 +145,7 @@ branch at the time of the Yocto Project &DISTRO_REL_TAG; release.
 
 For more options and information about accessing Yocto Project related
 repositories, see the
-:ref:`dev-manual/dev-manual-start:locating yocto project source files`
+:ref:`dev-manual/start:locating yocto project source files`
 section in the Yocto Project Development Tasks Manual.
 
 Building Your Image
@@ -257,7 +257,7 @@ an entire Linux distribution, including the toolchain, from source.
       $ runqemu qemux86-64
 
    If you want to learn more about running QEMU, see the
-   :ref:`dev-manual/dev-manual-qemu:using the quick emulator (qemu)` chapter in
+   :ref:`dev-manual/qemu:using the quick emulator (qemu)` chapter in
    the Yocto Project Development Tasks Manual.
 
 #. **Exit QEMU:** Exit QEMU by either clicking on the shutdown icon or by typing
@@ -346,7 +346,7 @@ Follow these steps to add a hardware layer:
 
    You can find
    more information on adding layers in the
-   :ref:`dev-manual/dev-manual-common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`
+   :ref:`dev-manual/common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`
    section.
 
 Completing these steps has added the ``meta-altera`` layer to your Yocto
@@ -381,7 +381,7 @@ The following commands run the tool to create a layer named
 
 For more information
 on layers and how to create them, see the
-:ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`
+:ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`
 section in the Yocto Project Development Tasks Manual.
 
 Where To Go Next
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 357e740a5..6d3ccd49b 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -72,7 +72,7 @@ For information on typical BSP development workflow, see the
 section. For more
 information on how to set up a local copy of source files from a Git
 repository, see the
-:ref:`dev-manual/dev-manual-start:locating yocto project source files`
+:ref:`dev-manual/start:locating yocto project source files`
 section in the Yocto Project Development Tasks Manual.
 
 The BSP layer's base directory (``meta-bsp_root_name``) is the root
@@ -128,7 +128,7 @@ you want to work with, such as: ::
 and so on.
 
 For more information on layers, see the
-":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
 Preparing Your Build Host to Work With BSP Layers
@@ -146,7 +146,7 @@ section.
    :ref:`bsp-guide/bsp:example filesystem layout` section.
 
 #. *Set Up the Build Environment:* Be sure you are set up to use BitBake
-   in a shell. See the ":ref:`dev-manual/dev-manual-start:preparing the build host`"
+   in a shell. See the ":ref:`dev-manual/start:preparing the build host`"
    section in the Yocto Project Development Tasks Manual for information on how
    to get a build host ready that is either a native Linux machine or a machine
    that uses CROPS.
@@ -154,10 +154,10 @@ section.
 #. *Clone the poky Repository:* You need to have a local copy of the
    Yocto Project :term:`Source Directory` (i.e. a local
    ``poky`` repository). See the
-   ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`" and
+   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" and
    possibly the
-   ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`" or
-   ":ref:`dev-manual/dev-manual-start:checking out by tag in poky`"
+   ":ref:`dev-manual/start:checking out by branch in poky`" or
+   ":ref:`dev-manual/start:checking out by tag in poky`"
    sections
    all in the Yocto Project Development Tasks Manual for information on
    how to clone the ``poky`` repository and check out the appropriate
@@ -205,7 +205,7 @@ section.
 
          To see the available branch names in a cloned repository, use the ``git
          branch -al`` command. See the
-         ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`"
+         ":ref:`dev-manual/start:checking out by branch in poky`"
          section in the Yocto Project Development Tasks Manual for more
          information.
 
@@ -463,7 +463,7 @@ requirements are handled with the ``COPYING.MIT`` file.
 Licensing files can be MIT, BSD, GPLv*, and so forth. These files are
 recommended for the BSP but are optional and totally up to the BSP
 developer. For information on how to maintain license compliance, see
-the ":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
+the ":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 README File
@@ -589,7 +589,7 @@ filenames correspond to the values to which users have set the
 
 These files define things such as the kernel package to use
 (:term:`PREFERRED_PROVIDER` of
-:ref:`virtual/kernel <dev-manual/dev-manual-common-tasks:using virtual providers>`),
+:ref:`virtual/kernel <dev-manual/common-tasks:using virtual providers>`),
 the hardware drivers to include in different types of images, any
 special software components that are needed, any bootloader information,
 and also any special image format requirements.
@@ -726,7 +726,7 @@ workflow.
    :align: center
 
 #. *Set up Your Host Development System to Support Development Using the
-   Yocto Project*: See the ":ref:`dev-manual/dev-manual-start:preparing the build host`"
+   Yocto Project*: See the ":ref:`dev-manual/start:preparing the build host`"
    section in the Yocto Project Development Tasks Manual for options on how to
    get a system ready to use the Yocto Project.
 
@@ -756,7 +756,7 @@ workflow.
    OpenEmbedded build system knows about. For more information on
    layers, see the ":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
    section in the Yocto Project Overview and Concepts Manual. You can also
-   reference the ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+   reference the ":ref:`dev-manual/common-tasks:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For more
    information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
    section.
@@ -815,7 +815,7 @@ workflow.
    key configuration files are configured appropriately: the
    ``conf/local.conf`` and the ``conf/bblayers.conf`` file. You must
    make the OpenEmbedded build system aware of your new layer. See the
-   ":ref:`dev-manual/dev-manual-common-tasks:enabling your layer`"
+   ":ref:`dev-manual/common-tasks:enabling your layer`"
    section in the Yocto Project Development Tasks Manual for information
    on how to let the build system know about your new layer.
 
@@ -846,7 +846,7 @@ Before looking at BSP requirements, you should consider the following:
    layer that can be added to the Yocto Project. For guidelines on
    creating a layer that meets these base requirements, see the
    ":ref:`bsp-guide/bsp:bsp layers`" section in this manual and the
-   ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+   ":ref:`dev-manual/common-tasks:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The requirements in this section apply regardless of how you package
@@ -928,7 +928,7 @@ Yocto Project:
    -  The name and contact information for the BSP layer maintainer.
       This is the person to whom patches and questions should be sent.
       For information on how to find the right person, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
+      ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
       section in the Yocto Project Development Tasks Manual.
 
    -  Instructions on how to build the BSP using the BSP layer.
@@ -1013,7 +1013,7 @@ If you plan on customizing a recipe for a particular BSP, you need to do
 the following:
 
 -  Create a ``*.bbappend`` file for the modified recipe. For information on using
-   append files, see the ":ref:`dev-manual/dev-manual-common-tasks:using
+   append files, see the ":ref:`dev-manual/common-tasks:using
    .bbappend files in your layer`" section in the Yocto Project Development
    Tasks Manual.
 
@@ -1118,7 +1118,7 @@ list describes them in order of preference:
    Specifying the matching license string signifies that you agree to
    the license. Thus, the build system can build the corresponding
    recipe and include the component in the image. See the
-   ":ref:`dev-manual/dev-manual-common-tasks:enabling commercially licensed recipes`"
+   ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
    section in the Yocto Project Development Tasks Manual for details on
    how to use these variables.
 
@@ -1170,7 +1170,7 @@ Use these steps to create a BSP layer:
    ``create-layer`` subcommand to create a new general layer. For
    instructions on how to create a general layer using the
    ``bitbake-layers`` script, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Create a Layer Configuration File:* Every layer needs a layer
@@ -1230,7 +1230,7 @@ configuration files is to examine various files for BSP from the
 :yocto_git:`Source Repositories <>`.
 
 For a detailed description of this particular layer configuration file,
-see ":ref:`step 3 <dev-manual/dev-manual-common-tasks:creating your own layer>`"
+see ":ref:`step 3 <dev-manual/common-tasks:creating your own layer>`"
 in the discussion that describes how to create layers in the Yocto
 Project Development Tasks Manual.
 
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/common-tasks.rst
similarity index 99%
rename from documentation/dev-manual/dev-manual-common-tasks.rst
rename to documentation/dev-manual/common-tasks.rst
index 0a2e6d9df..c627491f3 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -31,7 +31,7 @@ layers so that you can better understand them. For information about the
 layer-creation tools, see the
 ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
 section in the Yocto Project Board Support Package (BSP) Developer's
-Guide and the ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+Guide and the ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
 section further down in this manual.
 
 Follow these general steps to create your layer without using tools:
@@ -725,7 +725,7 @@ simplifies creating a new general layer.
 
    -  In order to use a layer with the OpenEmbedded build system, you
       need to add the layer to your ``bblayers.conf`` configuration
-      file. See the ":ref:`dev-manual/dev-manual-common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`"
+      file. See the ":ref:`dev-manual/common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`"
       section for more information.
 
 The default mode of the script's operation with this subcommand is to
@@ -1106,7 +1106,7 @@ that can help you quickly get a start on a new recipe:
 .. note::
 
    For information on recipe syntax, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:recipe syntax`" section.
+   ":ref:`dev-manual/common-tasks:recipe syntax`" section.
 
 Creating the Base Recipe Using ``devtool add``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -1538,7 +1538,7 @@ variables:
    differences result in an error with the message containing the
    current checksum. For more explanation and examples of how to set the
    ``LIC_FILES_CHKSUM`` variable, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:tracking license changes`" section.
+   ":ref:`dev-manual/common-tasks:tracking license changes`" section.
 
    To determine the correct checksum string, you can list the
    appropriate files in the ``LIC_FILES_CHKSUM`` variable with incorrect
@@ -1771,7 +1771,7 @@ Here are some common issues that cause failures.
    For cases where improper paths are detected for configuration files
    or for when libraries/headers cannot be found, be sure you are using
    the more robust ``pkg-config``. See the note in section
-   ":ref:`dev-manual/dev-manual-common-tasks:Configuring the Recipe`" for additional information.
+   ":ref:`dev-manual/common-tasks:Configuring the Recipe`" for additional information.
 
 -  *Parallel build failures:* These failures manifest themselves as
    intermittent errors, or errors reporting that a file or directory
@@ -2338,7 +2338,7 @@ Following is one example: (``hello_2.3.bb``)
 
 The variable ``LIC_FILES_CHKSUM`` is used to track source license
 changes as described in the
-":ref:`dev-manual/dev-manual-common-tasks:tracking license changes`" section in
+":ref:`dev-manual/common-tasks:tracking license changes`" section in
 the Yocto Project Overview and Concepts Manual. You can quickly create
 Autotool-based recipes in a manner similar to the previous example.
 
@@ -2963,7 +2963,7 @@ The following steps describe how to set up the AUH utility:
 1. *Be Sure the Development Host is Set Up:* You need to be sure that
    your development host is set up to use the Yocto Project. For
    information on how to set up your host, see the
-   ":ref:`dev-manual/dev-manual-start:Preparing the Build Host`" section.
+   ":ref:`dev-manual/start:Preparing the Build Host`" section.
 
 2. *Make Sure Git is Configured:* The AUH utility requires Git to be
    configured because AUH uses Git to save upgrades. Thus, you must have
@@ -3015,7 +3015,7 @@ The following steps describe how to set up the AUH utility:
    configurations:
 
    -  If you want to enable :ref:`Build
-      History <dev-manual/dev-manual-common-tasks:maintaining build output quality>`,
+      History <dev-manual/common-tasks:maintaining build output quality>`,
       which is optional, you need the following lines in the
       ``conf/local.conf`` file:
       ::
@@ -3267,8 +3267,8 @@ Manually Upgrading a Recipe
 ---------------------------
 
 If for some reason you choose not to upgrade recipes using
-:ref:`dev-manual/dev-manual-common-tasks:Using the Auto Upgrade Helper (AUH)` or
-by :ref:`dev-manual/dev-manual-common-tasks:Using \`\`devtool upgrade\`\``,
+:ref:`dev-manual/common-tasks:Using the Auto Upgrade Helper (AUH)` or
+by :ref:`dev-manual/common-tasks:Using \`\`devtool upgrade\`\``,
 you can manually edit the recipe files to upgrade the versions.
 
 .. note::
@@ -3467,7 +3467,7 @@ Follow these general steps:
       (i.e. ``bitbake -c clean package`` and ``bitbake -c cleanall package``).
       Modifications will also disappear if you use the ``rm_work`` feature as
       described in the
-      ":ref:`dev-manual/dev-manual-common-tasks:conserving disk space during builds`"
+      ":ref:`dev-manual/common-tasks:conserving disk space during builds`"
       section.
 
 7. *Generate the Patch:* Once your changes work as expected, you need to
@@ -3667,7 +3667,7 @@ The following figure and list overviews the build process:
    :align: center
 
 1. *Set up Your Host Development System to Support Development Using the
-   Yocto Project*: See the ":doc:`dev-manual-start`" section for options on how to get a
+   Yocto Project*: See the ":doc:`start`" section for options on how to get a
    build host ready to use the Yocto Project.
 
 2. *Initialize the Build Environment:* Initialize the build environment
@@ -4046,7 +4046,7 @@ your own distribution that are likely modeled after ``poky-tiny``.
 
    To use ``poky-tiny`` in your build, set the ``DISTRO`` variable in your
    ``local.conf`` file to "poky-tiny" as described in the
-   ":ref:`dev-manual/dev-manual-common-tasks:creating your own distribution`"
+   ":ref:`dev-manual/common-tasks:creating your own distribution`"
    section.
 
 Understanding some memory concepts will help you reduce the system size.
@@ -5736,7 +5736,7 @@ or ::
 
    For more information on how to use the ``bmaptool``
    to flash a device with an image, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:flashing images using \`\`bmaptool\`\``"
+   ":ref:`dev-manual/common-tasks:flashing images using \`\`bmaptool\`\``"
    section.
 
 Using a Modified Kickstart File
@@ -5956,7 +5956,7 @@ the existing kernel, and then inserts a new kernel:
 
    Once the new kernel is added back into the image, you can use the
    ``dd`` command or :ref:`bmaptool
-   <dev-manual/dev-manual-common-tasks:flashing images using \`\`bmaptool\`\`>`
+   <dev-manual/common-tasks:flashing images using \`\`bmaptool\`\`>`
    to flash your wic image onto an SD card or USB stick and test your
    target.
 
@@ -6202,7 +6202,7 @@ layer. The following steps provide some more detail:
    just placing configurations in a ``local.conf`` configuration file
    makes it easier to reproduce the same build configuration when using
    multiple build machines. See the
-   ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
    section for information on how to quickly set up a layer.
 
 -  *Create the distribution configuration file:* The distribution
@@ -7979,7 +7979,7 @@ associated ``EXTRA_IMAGE_FEATURES`` variable, as in:
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
 
 For more information on how to use these variables, see the
-":ref:`dev-manual/dev-manual-common-tasks:Customizing Images Using Custom \`\`IMAGE_FEATURES\`\` and \`\`EXTRA_IMAGE_FEATURES\`\``"
+":ref:`dev-manual/common-tasks:Customizing Images Using Custom \`\`IMAGE_FEATURES\`\` and \`\`EXTRA_IMAGE_FEATURES\`\``"
 section. For information on the variables, see
 :term:`IMAGE_FEATURES` and
 :term:`EXTRA_IMAGE_FEATURES`.
@@ -8056,13 +8056,13 @@ the information.
 
 The remainder of this section describes the following:
 
--  :ref:`How you can enable and disable build history <dev-manual/dev-manual-common-tasks:enabling and disabling build history>`
+-  :ref:`How you can enable and disable build history <dev-manual/common-tasks:enabling and disabling build history>`
 
--  :ref:`How to understand what the build history contains <dev-manual/dev-manual-common-tasks:understanding what the build history contains>`
+-  :ref:`How to understand what the build history contains <dev-manual/common-tasks:understanding what the build history contains>`
 
--  :ref:`How to limit the information used for build history <dev-manual/dev-manual-common-tasks:using build history to gather image information only>`
+-  :ref:`How to limit the information used for build history <dev-manual/common-tasks:using build history to gather image information only>`
 
--  :ref:`How to examine the build history from both a command-line and web interface <dev-manual/dev-manual-common-tasks:examining build history information>`
+-  :ref:`How to examine the build history from both a command-line and web interface <dev-manual/common-tasks:examining build history information>`
 
 Enabling and Disabling Build History
 ------------------------------------
@@ -9084,7 +9084,7 @@ situations.
    completes to log error information into a common database, that can
    help you figure out what might be going wrong. For information on how
    to enable and use this feature, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:using the error reporting tool`"
+   ":ref:`dev-manual/common-tasks:using the error reporting tool`"
    section.
 
 The following list shows the debugging topics in the remainder of this
@@ -9100,7 +9100,7 @@ section:
    use the BitBake ``-e`` option to examine variable values after a
    recipe has been parsed.
 
--  ":ref:`dev-manual/dev-manual-common-tasks:viewing package information with \`\`oe-pkgdata-util\`\``"
+-  ":ref:`dev-manual/common-tasks:viewing package information with \`\`oe-pkgdata-util\`\``"
    describes how to use the ``oe-pkgdata-util`` utility to query
    :term:`PKGDATA_DIR` and
    display package-related information for built packages.
@@ -10581,7 +10581,7 @@ Yocto Project Reference Manual.
 
 Here is the general procedure on how to submit a patch through email
 without using the scripts once the steps in
-:ref:`dev-manual/dev-manual-common-tasks:preparing changes for submission` have been followed:
+:ref:`dev-manual/common-tasks:preparing changes for submission` have been followed:
 
 1. *Format the Commit:* Format the commit into an email message. To
    format commits, use the ``git format-patch`` command. When you
@@ -10670,7 +10670,7 @@ and ``send-pull-request`` scripts from openembedded-core to create and send a
 patch series with a link to the branch for review.
 
 Follow this procedure to push a change to an upstream "contrib" Git
-repository once the steps in :ref:`dev-manual/dev-manual-common-tasks:preparing changes for submission` have
+repository once the steps in :ref:`dev-manual/common-tasks:preparing changes for submission` have
 been followed:
 
 .. note::
@@ -10845,8 +10845,8 @@ follows:
       a newer version of the software which includes an upstream fix for the
       issue or when the issue has been fixed on the master branch in a way
       that introduces backwards incompatible changes. In this case follow the
-      steps in :ref:`dev-manual/dev-manual-common-tasks:preparing changes for submission` and
-      :ref:`dev-manual/dev-manual-common-tasks:using email to submit a patch` but modify the subject header of your patch
+      steps in :ref:`dev-manual/common-tasks:preparing changes for submission` and
+      :ref:`dev-manual/common-tasks:using email to submit a patch` but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
       ``git format-patch``, for example to submit a patch to the dunfell
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 8f09224fe..941db2df8 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -10,10 +10,10 @@ Yocto Project Development Tasks Manual
    :caption: Table of Contents
    :numbered:
 
-   dev-manual-intro
-   dev-manual-start
-   dev-manual-common-tasks
-   dev-manual-qemu
+   intro
+   start
+   common-tasks
+   qemu
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/intro.rst
similarity index 100%
rename from documentation/dev-manual/dev-manual-intro.rst
rename to documentation/dev-manual/intro.rst
diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/qemu.rst
similarity index 100%
rename from documentation/dev-manual/dev-manual-qemu.rst
rename to documentation/dev-manual/qemu.rst
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/start.rst
similarity index 97%
rename from documentation/dev-manual/dev-manual-start.rst
rename to documentation/dev-manual/start.rst
index 75b5d7b5f..85ec97b9e 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/start.rst
@@ -7,7 +7,7 @@ Setting Up to Use the Yocto Project
 This chapter provides guidance on how to prepare to use the Yocto
 Project. You can learn about creating a team environment to develop
 using the Yocto Project, how to set up a :ref:`build
-host <dev-manual/dev-manual-start:preparing the build host>`, how to locate
+host <dev-manual/start:preparing the build host>`, how to locate
 Yocto Project source repositories, and how to create local Git
 repositories.
 
@@ -224,7 +224,7 @@ particular working environment and set of practices.
     -  Maintain your Metadata in layers that make sense for your
        situation. See the ":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
        section in the Yocto Project Overview and Concepts Manual and the
-       ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+       ":ref:`dev-manual/common-tasks:understanding and creating layers`"
        section for more information on layers.
 
     -  Separate the project's Metadata and code by using separate Git
@@ -248,13 +248,13 @@ particular working environment and set of practices.
        project to fix bugs or add features. If you do submit patches,
        follow the project commit guidelines for writing good commit
        messages. See the
-       ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
+       ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
        section.
 
     -  Send changes to the core sooner than later as others are likely
        to run into the same issues. For some guidance on mailing lists
        to use, see the list in the
-       ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
+       ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
        section. For a description
        of the available mailing lists, see the ":ref:`resources-mailinglist`" section in
        the Yocto Project Reference Manual.
@@ -340,7 +340,7 @@ Project Build Host:
 Once you have completed the previous steps, you are ready to continue
 using a given development path on your native Linux machine. If you are
 going to use BitBake, see the
-":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
+":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
 section. If you are going
 to use the Extensible SDK, see the ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
@@ -440,7 +440,7 @@ as your Yocto Project build host:
 Once you have a container set up, everything is in place to develop just
 as if you were running on a native Linux machine. If you are going to
 use the Poky container, see the
-":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
+":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
 section. If you are going to use the Extensible SDK container, see the
 ":doc:`/sdk-manual/sdk-extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
@@ -582,7 +582,7 @@ files you'll need to work with the Yocto Project.
 Accessing Source Repositories
 -----------------------------
 
-Working from a copy of the upstream :ref:`dev-manual/dev-manual-start:accessing source repositories` is the
+Working from a copy of the upstream :ref:`dev-manual/start:accessing source repositories` is the
 preferred method for obtaining and using a Yocto Project release. You
 can view the Yocto Project Source Repositories at
 :yocto_git:`/`. In particular, you can find the ``poky``
@@ -605,7 +605,7 @@ Use the following procedure to locate the latest upstream copy of the
    .. note::
 
       For information on cloning a repository, see the
-      ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`" section.
+      ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" section.
 
 Accessing Index of Releases
 ---------------------------
@@ -801,7 +801,7 @@ and then specifically check out that development branch.
 1. *Switch to the Poky Directory:* If you have a local poky Git
    repository, switch to that directory. If you do not have the local
    copy of poky, see the
-   ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
+   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
    section.
 
 2. *Determine Existing Branch Names:*
@@ -864,7 +864,7 @@ similar to checking out by branch name except you use tag names.
 1. *Switch to the Poky Directory:* If you have a local poky Git
    repository, switch to that directory. If you do not have the local
    copy of poky, see the
-   ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
+   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
    section.
 
 2. *Fetch the Tag Names:* To checkout the branch based on a tag name,
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 8e9bc27bf..4bb553f8d 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -21,11 +21,11 @@ Preparing the Build Host to Work on the Kernel
 
 Before you can do any kernel development, you need to be sure your build
 host is set up to use the Yocto Project. For information on how to get
-set up, see the ":doc:`/dev-manual/dev-manual-start`" section in
+set up, see the ":doc:`/dev-manual/start`" section in
 the Yocto Project Development Tasks Manual. Part of preparing the system
 is creating a local Git repository of the
 :term:`Source Directory` (``poky``) on your system. Follow the steps in the
-":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`"
+":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
 section in the Yocto Project Development Tasks Manual to set up your
 Source Directory.
 
@@ -34,8 +34,8 @@ Source Directory.
    Be sure you check out the appropriate development branch or you
    create your local branch by checking out a specific tag to get the
    desired version of Yocto Project. See the
-   ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`" and
-   ":ref:`dev-manual/dev-manual-start:checking out by tag in poky`"
+   ":ref:`dev-manual/start:checking out by branch in poky`" and
+   ":ref:`dev-manual/start:checking out by tag in poky`"
    sections in the Yocto Project Development Tasks Manual for more information.
 
 Kernel development is best accomplished using
@@ -104,13 +104,13 @@ section:
 
       For background information on working with common and BSP layers,
       see the
-      ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+      ":ref:`dev-manual/common-tasks:understanding and creating layers`"
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
-      ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Development Tasks Manual.
 
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
@@ -236,7 +236,7 @@ section:
    Also, for this example, be sure that the local branch you have
    checked out for ``poky`` is the Yocto Project &DISTRO_NAME; branch. If
    you need to checkout out the &DISTRO_NAME; branch, see the
-   ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`"
+   ":ref:`dev-manual/start:checking out by branch in poky`"
    section in the Yocto Project Development Tasks Manual.
    ::
 
@@ -289,13 +289,13 @@ section:
 
       For background information on working with common and BSP layers,
       see the
-      ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+      ":ref:`dev-manual/common-tasks:understanding and creating layers`"
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
-      ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Development Tasks Manual.
 
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
@@ -378,7 +378,7 @@ layer contains its own :term:`BitBake`
 append files (``.bbappend``) and provides a convenient mechanism to
 create your own recipe files (``.bb``) as well as store and use kernel
 patch files. For background information on working with layers, see the
-":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 .. note::
@@ -386,7 +386,7 @@ section in the Yocto Project Development Tasks Manual.
    The Yocto Project comes with many tools that simplify tasks you need
    to perform. One such tool is the ``bitbake-layers create-layer``
    command, which simplifies creating a new layer. See the
-   ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
    section in the Yocto Project Development Tasks Manual for
    information on how to use this script to quick set up a new layer.
 
@@ -443,7 +443,7 @@ home directory:
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
    information on using append files, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:using .bbappend files in your layer`"
+   ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
    section in the Yocto Project Development Tasks Manual.
 
 Modifying an Existing Recipe
@@ -1108,7 +1108,7 @@ Section.
    For more information on append files and patches, see the "`Creating
    the Append File <#creating-the-append-file>`__" and "`Applying
    Patches <#applying-patches>`__" sections. You can also see the
-   ":ref:`dev-manual/dev-manual-common-tasks:using .bbappend files in your layer`"
+   ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
    section in the Yocto Project Development Tasks Manual.
 
    .. note::
diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index 424e62617..54623453a 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -38,7 +38,7 @@ The kernel image (e.g. ``vmlinuz``) is provided by the
 specify whether or not the kernel image is installed in the generated
 root filesystem, override ``RDEPENDS_${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
-":ref:`dev-manual/dev-manual-common-tasks:using .bbappend files in your layer`"
+":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
 section in the
 Yocto Project Development Tasks Manual for information on how to use an
 append file to override metadata.
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index 29d4516c5..3987b0e59 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -88,7 +88,7 @@ understand the following documentation:
    as described in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
 
--  The ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+-  The ":ref:`dev-manual/common-tasks:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The "`Kernel Modification
@@ -111,7 +111,7 @@ general information and references for further information.
    :align: center
 
 1. *Set up Your Host Development System to Support Development Using the
-   Yocto Project*: See the ":doc:`/dev-manual/dev-manual-start`" section in
+   Yocto Project*: See the ":doc:`/dev-manual/start`" section in
    the Yocto Project Development Tasks Manual for options on how to get
    a build host ready to use the Yocto Project.
 
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index bbf2d0494..d2e335e80 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -34,7 +34,7 @@ itself is of various types:
 
 BitBake knows how to combine multiple data sources together and refers
 to each data source as a layer. For information on layers, see the
-":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
 Following are some brief details on these core components. For
@@ -153,7 +153,7 @@ Conforming to a known structure allows BitBake to make assumptions
 during builds on where to find types of metadata. You can find
 procedures and learn about tools (i.e. ``bitbake-layers``) for creating
 layers suitable for the Yocto Project in the
-":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
 OpenEmbedded Build System Concepts
@@ -317,7 +317,7 @@ during the build. By default, the layers listed in this file include
 layers minimally needed by the build system. However, you must manually
 add any custom layers you have created. You can find more information on
 working with the ``bblayers.conf`` file in the
-":ref:`dev-manual/dev-manual-common-tasks:enabling your layer`"
+":ref:`dev-manual/common-tasks:enabling your layer`"
 section in the Yocto Project Development Tasks Manual.
 
 The files ``site.conf`` and ``auto.conf`` are not created by the
@@ -418,7 +418,7 @@ a ``README`` file as good practice and especially if the layer is to be
 distributed, a configuration directory, and recipe directories. You can
 learn about the general structure for layers used with the Yocto Project
 in the
-":ref:`dev-manual/dev-manual-common-tasks:creating your own layer`"
+":ref:`dev-manual/common-tasks:creating your own layer`"
 section in the
 Yocto Project Development Tasks Manual. For a general discussion on
 layers and the many layers from which you can draw, see the
@@ -827,7 +827,7 @@ For more information on how the source directories are created, see the
 "`Source Fetching <#source-fetching-dev-environment>`__" section. For
 more information on how to create patches and how the build system
 processes patches, see the
-":ref:`dev-manual/dev-manual-common-tasks:patching code`"
+":ref:`dev-manual/common-tasks:patching code`"
 section in the
 Yocto Project Development Tasks Manual. You can also see the
 ":ref:`sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component`"
@@ -1029,7 +1029,7 @@ stage of package installation, post installation scripts that are part
 of the packages are run. Any scripts that fail to run on the build host
 are run on the target when the target system is first booted. If you are
 using a 
-:ref:`read-only root filesystem <dev-manual/dev-manual-common-tasks:creating a read-only root filesystem>`,
+:ref:`read-only root filesystem <dev-manual/common-tasks:creating a read-only root filesystem>`,
 all the post installation scripts must succeed on the build host during
 the package installation phase since the root filesystem on the target
 is read-only.
@@ -1192,7 +1192,7 @@ varflag. If some other task depends on such a task, then that task will
 also always be considered out of date, which might not be what you want.
 
 For details on how to view information about a task's signature, see the
-":ref:`dev-manual/dev-manual-common-tasks:viewing task variable dependencies`"
+":ref:`dev-manual/common-tasks:viewing task variable dependencies`"
 section in the Yocto Project Development Tasks Manual.
 
 Setscene Tasks and Shared State
@@ -1626,15 +1626,15 @@ them if they are deemed to be valid.
       the shared state packages. Consequently, considerations exist that
       affect maintaining shared state feeds. For information on how the
       build system works with packages and can track incrementing ``PR``
-      information, see the ":ref:`dev-manual/dev-manual-common-tasks:automatically incrementing a package version number`"
+      information, see the ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
    -  The code in the build system that supports incremental builds is
       not simple code. For techniques that help you work around issues
       related to shared state code, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:viewing metadata used to create the input signature of a shared state task`"
+      ":ref:`dev-manual/common-tasks:viewing metadata used to create the input signature of a shared state task`"
       and
-      ":ref:`dev-manual/dev-manual-common-tasks:invalidating shared state to force a task to run`"
+      ":ref:`dev-manual/common-tasks:invalidating shared state to force a task to run`"
       sections both in the Yocto Project Development Tasks Manual.
 
 The rest of this section goes into detail about the overall incremental
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 2421ec1a8..e03b4cdc6 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -66,7 +66,7 @@ to set up a CROPS machine, you effectively have access to a shell
 environment that is similar to what you see when using a Linux-based
 development host. For the steps needed to set up a system using CROPS,
 see the
-":ref:`dev-manual/dev-manual-start:setting up to use cross platforms (crops)`"
+":ref:`dev-manual/start:setting up to use cross platforms (crops)`"
 section in
 the Yocto Project Development Tasks Manual.
 
@@ -77,7 +77,7 @@ distribution on the system is one that supports the Yocto Project. You
 also need to be sure that the correct set of host packages are installed
 that allow development using the Yocto Project. For the steps needed to
 set up a development host that runs Linux, see the
-":ref:`dev-manual/dev-manual-start:setting up a native linux host`"
+":ref:`dev-manual/start:setting up a native linux host`"
 section in the Yocto Project Development Tasks Manual.
 
 Once your development host is set up to use the Yocto Project, several
@@ -94,7 +94,7 @@ methods exist for you to do work in the Yocto Project environment:
    through your Linux distribution and the Yocto Project.
 
    For a general flow of the build procedures, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:building a simple image`"
+   ":ref:`dev-manual/common-tasks:building a simple image`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Board Support Package (BSP) Development:* Development of BSPs
@@ -178,7 +178,7 @@ development:
       :align: center
 
    For steps on how to view and access these upstream Git repositories,
-   see the ":ref:`dev-manual/dev-manual-start:accessing source repositories`"
+   see the ":ref:`dev-manual/start:accessing source repositories`"
    Section in the Yocto Project Development Tasks Manual.
 
 -  :yocto_dl:`Index of /releases: </releases>` This is an index
@@ -192,7 +192,7 @@ development:
       :align: center
 
    For steps on how to view and access these files, see the
-   ":ref:`dev-manual/dev-manual-start:accessing index of releases`"
+   ":ref:`dev-manual/start:accessing index of releases`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *"DOWNLOADS" page for the* :yocto_home:`Yocto Project Website <>` *:*
@@ -207,7 +207,7 @@ development:
       :align: center
 
    For steps on how to use the "DOWNLOADS" page, see the
-   ":ref:`dev-manual/dev-manual-start:using the downloads page`"
+   ":ref:`dev-manual/start:using the downloads page`"
    section in the Yocto Project Development Tasks Manual.
 
 Git Workflows and the Yocto Project
@@ -242,7 +242,7 @@ and so forth.
 
    For information on finding out who is responsible for (maintains) a
    particular area of code in the Yocto Project, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
+   ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
    section of the Yocto Project Development Tasks Manual.
 
 The Yocto Project ``poky`` Git repository also has an upstream
@@ -274,7 +274,7 @@ push them into the "contrib" area and subsequently request that the
 maintainer include them into an upstream branch. This process is called
 "submitting a patch" or "submitting a change." For information on
 submitting patches and changes, see the
-":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
+":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
 section in the Yocto Project Development Tasks Manual.
 
 In summary, a single point of entry exists for changes into a "master"
@@ -341,7 +341,7 @@ Book <http://book.git-scm.com>`__.
    the ``scripts`` folder of the
    :term:`Source Directory`. For information
    on how to use these scripts, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:using scripts to push a change upstream and request a pull`"
+   ":ref:`dev-manual/common-tasks:using scripts to push a change upstream and request a pull`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Patch Workflow:* This workflow allows you to notify the maintainer
@@ -350,7 +350,7 @@ Book <http://book.git-scm.com>`__.
    this type of change, you format the patch and then send the email
    using the Git commands ``git format-patch`` and ``git send-email``.
    For information on how to use these scripts, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`"
+   ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
    section in the Yocto Project Development Tasks Manual.
 
 Git
@@ -376,7 +376,7 @@ commands.
       page, see http://git-scm.com/download.
 
    -  For information beyond the introductory nature in this section,
-      see the ":ref:`dev-manual/dev-manual-start:locating yocto project source files`"
+      see the ":ref:`dev-manual/start:locating yocto project source files`"
       section in the Yocto Project Development Tasks Manual.
 
 Repositories, Tags, and Branches
@@ -408,7 +408,7 @@ You can create a local copy of any repository by "cloning" it with the
 an identical copy of the repository on your development system. Once you
 have a local copy of a repository, you can take steps to develop
 locally. For examples on how to clone Git repositories, see the
-":ref:`dev-manual/dev-manual-start:locating yocto project source files`"
+":ref:`dev-manual/start:locating yocto project source files`"
 section in the Yocto Project Development Tasks Manual.
 
 It is important to understand that Git tracks content change and not
@@ -661,5 +661,5 @@ Project uses in the ``meta/files/common-licenses`` directory in your
 For information that can help you maintain compliance with various open
 source licensing during the lifecycle of a product created using the
 Yocto Project, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index d6488c621..a6568d1c8 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -130,7 +130,7 @@ Project:
    arbitrarily include packages.
 
 -  *License Manifest:* The Yocto Project provides a :ref:`license
-   manifest <dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle>`
+   manifest <dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle>`
    for review by people who need to track the use of open source
    licenses (e.g. legal teams).
 
@@ -228,7 +228,7 @@ your Metadata, the easier it is to cope with future changes.
 
    -  Layers support the inclusion of technologies, hardware components,
       and software components. The :ref:`Yocto Project
-      Compatible <dev-manual/dev-manual-common-tasks:making sure your layer is compatible with yocto project>`
+      Compatible <dev-manual/common-tasks:making sure your layer is compatible with yocto project>`
       designation provides a minimum level of standardization that
       contributes to a strong ecosystem. "YP Compatible" is applied to
       appropriate products and software components such as BSPs, other
@@ -274,7 +274,7 @@ of the ``poky`` repository, you will see several layers: ``meta``,
 layer.
 
 For procedures on how to create layers, see the 
-":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 Components and Tools
@@ -357,7 +357,7 @@ activities using the Yocto Project:
    (BitBake and
    OE-Core) automatically generates upgrades for recipes that are based
    on new versions of the recipes published upstream. See
-   :ref:`dev-manual/dev-manual-common-tasks:using the auto upgrade helper (auh)`
+   :ref:`dev-manual/common-tasks:using the auto upgrade helper (auh)`
    for how to set it up.
 
 -  *Recipe Reporting System:* The Recipe Reporting System tracks recipe
@@ -601,7 +601,7 @@ Project.
 
    For information on how to set up a Build Host on a system running
    Linux as its native operating system, see the 
-   ":ref:`dev-manual/dev-manual-start:setting up a native linux host`"
+   ":ref:`dev-manual/start:setting up a native linux host`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *CROss PlatformS (CROPS):* Typically, you use
@@ -621,7 +621,7 @@ Project.
    system natively running Linux.
 
    For information on how to set up a Build Host with CROPS, see the
-   ":ref:`dev-manual/dev-manual-start:setting up to use cross platforms (crops)`"
+   ":ref:`dev-manual/start:setting up to use cross platforms (crops)`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Windows Subsystem For Linux (WSLv2):* You may use Windows Subsystem
@@ -638,7 +638,7 @@ Project.
    virtualization technology.
 
    For information on how to set up a Build Host with WSLv2, see the
-   ":ref:`dev-manual/dev-manual-start:setting up to use windows subsystem for linux (wslv2)`"
+   ":ref:`dev-manual/start:setting up to use windows subsystem for linux (wslv2)`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Toaster:* Regardless of what your Build Host is running, you can use
@@ -824,7 +824,7 @@ helpful for getting started:
    Project.
 
    For more detailed information on layers, see the 
-   ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+   ":ref:`dev-manual/common-tasks:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For a
    discussion specifically on BSP Layers, see the 
    ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 819b6857d..5b9fcc191 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -45,7 +45,7 @@ section for steps on how to update your build tools.
 **A:** Support for an additional board is added by creating a Board
 Support Package (BSP) layer for it. For more information on how to
 create a BSP layer, see the
-":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual and the
 :doc:`/bsp-guide/index`.
 
@@ -73,7 +73,7 @@ device.
 
 **A:** To add a package, you need to create a BitBake recipe. For
 information on how to create a BitBake recipe, see the
-":ref:`dev-manual/dev-manual-common-tasks:writing a new recipe`"
+":ref:`dev-manual/common-tasks:writing a new recipe`"
 section in the Yocto Project Development Tasks Manual.
 
 **Q:** Do I have to reflash my entire board with a new Yocto Project
@@ -201,7 +201,7 @@ You can find more information on licensing in the
 ":ref:`overview-manual/overview-manual-development-environment:licensing`"
 section in the Yocto
 Project Overview and Concepts Manual and also in the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 **Q:** How do I disable the cursor on my touchscreen device?
diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/ref-manual/migration-1.4.rst
index daaea0ffa..0b7e86117 100644
--- a/documentation/ref-manual/migration-1.4.rst
+++ b/documentation/ref-manual/migration-1.4.rst
@@ -84,7 +84,7 @@ create an append file for the ``init-ifupdown`` recipe instead, which
 you can find in the :term:`Source Directory` at
 ``meta/recipes-core/init-ifupdown``. For information on how to use
 append files, see the
-":ref:`dev-manual/dev-manual-common-tasks:using .bbappend files in your layer`"
+":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.4-remote-debugging:
diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
index 5e1e23f21..b5e4bb1fd 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/ref-manual/migration-1.5.rst
@@ -246,7 +246,7 @@ A new automated image testing framework has been added through the
 framework replaces the older ``imagetest-qemu`` framework.
 
 You can learn more about performing automated image tests in the
-":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/common-tasks:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.5-build-history:
@@ -269,7 +269,7 @@ Following are changes to Build History:
    option for each utility for more information on the new syntax.
 
 For more information on Build History, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining build output quality`"
+":ref:`dev-manual/common-tasks:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.5-udev:
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index 822d5cfa0..f95f45ec9 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/ref-manual/migration-1.6.rst
@@ -12,7 +12,7 @@ Project 1.6 Release from the prior release.
 The :ref:`archiver <ref-classes-archiver>` class has been rewritten
 and its configuration has been simplified. For more details on the
 source archiver, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.6-packaging-changes:
@@ -148,7 +148,7 @@ NFS mount, an error occurs.
 The ``PRINC`` variable has been deprecated and triggers a warning if
 detected during a build. For :term:`PR` increments on changes,
 use the PR service instead. You can find out more about this service in
-the ":ref:`dev-manual/dev-manual-common-tasks:working with a pr service`"
+the ":ref:`dev-manual/common-tasks:working with a pr service`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.6-variable-changes-IMAGE_TYPES:
@@ -221,7 +221,7 @@ Package Test (ptest)
 
 Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
-":ref:`dev-manual/dev-manual-common-tasks:testing packages with ptest`"
+":ref:`dev-manual/common-tasks:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual. For information on the
 ``ptest`` class, see the ":ref:`ptest.bbclass <ref-classes-ptest>`"
 section.
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index c3f9469da..85894d9df 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -217,7 +217,7 @@ The following miscellaneous change occurred:
    should manually remove old "build-id" files from your existing build
    history repositories to avoid confusion. For information on the build
    history feature, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:maintaining build output quality`"
+   ":ref:`dev-manual/common-tasks:maintaining build output quality`"
    section in the Yocto Project Development Tasks Manual.
 
 
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index ada9d2986..678a767e1 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -346,7 +346,7 @@ This release supports generation of GLib Introspective Repository (GIR)
 files through GObject introspection, which is the standard mechanism for
 accessing GObject-based software from runtime environments. You can
 enable, disable, and test the generation of this data. See the
-":ref:`dev-manual/dev-manual-common-tasks:enabling gobject introspection support`"
+":ref:`dev-manual/common-tasks:enabling gobject introspection support`"
 section in the Yocto Project Development Tasks Manual for more
 information.
 
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index c0a8f0419..9e95f45e1 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -366,7 +366,7 @@ The following changes have been made to Wic:
 .. note::
 
    For more information on Wic, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
+   ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Default Output Directory Changed:* Wic's default output directory is
diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
index 7f1b80938..9f45ffce7 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/ref-manual/migration-2.5.rst
@@ -266,7 +266,7 @@ The following are additional changes:
    will trigger a warning during ``do_rootfs``.
 
    For more information, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:post-installation scripts`"
+   ":ref:`dev-manual/common-tasks:post-installation scripts`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The ``elf`` image type has been removed. This image type was removed
diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
index cc7c24c5b..5d524f381 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/ref-manual/migration-2.6.rst
@@ -372,7 +372,7 @@ Any failure of a ``pkg_postinst()`` script (including exit 1) triggers
 an error during the :ref:`ref-tasks-rootfs` task.
 
 For more information on post-installation behavior, see the
-":ref:`dev-manual/dev-manual-common-tasks:post-installation scripts`"
+":ref:`dev-manual/common-tasks:post-installation scripts`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-2.6-python-3-profile-guided-optimizations:
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index e0cdbe87f..4147044ea 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -68,7 +68,7 @@ The ``archiver`` class supports releasing source code and other
 materials with the binaries.
 
 For more details on the source archiver, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual. You can also see
 the :term:`ARCHIVER_MODE` variable for information
 about the variable flags (varflags) that help control archive creation.
@@ -86,7 +86,7 @@ standardization. This class defines a set of tasks (e.g. ``configure``,
 should usually be enough to define a few standard variables and then
 simply ``inherit autotools``. These classes can also work with software
 that emulates Autotools. For more information, see the
-":ref:`dev-manual/dev-manual-common-tasks:autotooled package`" section
+":ref:`dev-manual/common-tasks:autotooled package`" section
 in the Yocto Project Development Tasks Manual.
 
 By default, the ``autotools*`` classes use out-of-tree builds (i.e.
@@ -236,7 +236,7 @@ The ``buildhistory`` class records a history of build output metadata,
 which can be used to detect possible regressions as well as used for
 analysis of the build output. For more information on using Build
 History, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining build output quality`"
+":ref:`dev-manual/common-tasks:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-buildstats:
@@ -458,7 +458,7 @@ staging the files from ``DEPLOYDIR`` to ``DEPLOY_DIR_IMAGE``.
 ====================
 
 The ``devshell`` class adds the ``do_devshell`` task. Distribution
-policy dictates whether to include this class. See the ":ref:`dev-manual/dev-manual-common-tasks:using a development shell`"
+policy dictates whether to include this class. See the ":ref:`dev-manual/common-tasks:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
 information about using ``devshell``.
 
@@ -586,7 +586,7 @@ For more information on the ``externalsrc`` class, see the comments in
 ``meta/classes/externalsrc.bbclass`` in the :term:`Source Directory`.
 For information on how to use the
 ``externalsrc`` class, see the
-":ref:`dev-manual/dev-manual-common-tasks:building software from an external source`"
+":ref:`dev-manual/common-tasks:building software from an external source`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-extrausers:
@@ -927,7 +927,7 @@ then one or more image files are created.
    install into the image.
 
 For information on customizing images, see the
-":ref:`dev-manual/dev-manual-common-tasks:customizing images`" section
+":ref:`dev-manual/common-tasks:customizing images`" section
 in the Yocto Project Development Tasks Manual. For information on how
 images are created, see the
 ":ref:`overview-manual/overview-manual-concepts:images`" section in the
@@ -1344,7 +1344,7 @@ packages such as ``kernel-vmlinux``.
 The ``kernel`` class contains logic that allows you to embed an initial
 RAM filesystem (initramfs) image when you build the kernel image. For
 information on how to build an initramfs, see the
-":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section in
+":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section in
 the Yocto Project Development Tasks Manual.
 
 Various other classes are used by the ``kernel`` and ``module`` classes
@@ -1620,7 +1620,7 @@ different target optimizations or target architectures and installing
 them side-by-side in the same image.
 
 For more information on using the Multilib feature, see the
-":ref:`dev-manual/dev-manual-common-tasks:combining multiple versions of library files into one image`"
+":ref:`dev-manual/common-tasks:combining multiple versions of library files into one image`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-native:
@@ -1732,7 +1732,7 @@ package manager (NPM) <https://en.wikipedia.org/wiki/Npm_(software)>`__.
    fetcher to have dependencies fetched and packaged automatically.
 
 For information on how to create NPM packages, see the
-":ref:`dev-manual/dev-manual-common-tasks:creating node package manager (npm) packages`"
+":ref:`dev-manual/common-tasks:creating node package manager (npm) packages`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-oelint:
@@ -1802,7 +1802,7 @@ If you take the optional step to set up a repository (package feed) on
 the development host that can be used by DNF, you can install packages
 from the feed while you are running the image on the target (i.e.
 runtime installation of packages). For more information, see the
-":ref:`dev-manual/dev-manual-common-tasks:using runtime package management`"
+":ref:`dev-manual/common-tasks:using runtime package management`"
 section in the Yocto Project Development Tasks Manual.
 
 The package-specific class you choose can affect build-time performance
@@ -1921,7 +1921,7 @@ so forth). It is highly recommended that all package group recipes
 inherit this class.
 
 For information on how to use this class, see the
-":ref:`dev-manual/dev-manual-common-tasks:customizing images using custom package groups`"
+":ref:`dev-manual/common-tasks:customizing images using custom package groups`"
 section in the Yocto Project Development Tasks Manual.
 
 Previously, this class was called the ``task`` class.
@@ -2080,7 +2080,7 @@ The ``primport`` class provides functionality for importing
 ==================
 
 The ``prserv`` class provides functionality for using a :ref:`PR
-service <dev-manual/dev-manual-common-tasks:working with a pr service>` in order to
+service <dev-manual/common-tasks:working with a pr service>` in order to
 automatically manage the incrementing of the :term:`PR`
 variable for each recipe.
 
@@ -2100,7 +2100,7 @@ runtime tests for recipes that build software that provides these tests.
 This class is intended to be inherited by individual recipes. However,
 the class' functionality is largely disabled unless "ptest" appears in
 :term:`DISTRO_FEATURES`. See the
-":ref:`dev-manual/dev-manual-common-tasks:testing packages with ptest`"
+":ref:`dev-manual/common-tasks:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual for more information
 on ptest.
 
@@ -2113,7 +2113,7 @@ Enables package tests (ptests) specifically for GNOME packages, which
 have tests intended to be executed with ``gnome-desktop-testing``.
 
 For information on setting up and running ptests, see the
-":ref:`dev-manual/dev-manual-common-tasks:testing packages with ptest`"
+":ref:`dev-manual/common-tasks:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-python-dir:
@@ -2199,7 +2199,7 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows:
 ========================
 
 The ``report-error`` class supports enabling the :ref:`error reporting
-tool <dev-manual/dev-manual-common-tasks:using the error reporting tool>`",
+tool <dev-manual/common-tasks:using the error reporting tool>`",
 which allows you to submit build error information to a central database.
 
 The class collects debug information for recipe, recipe version, task,
@@ -2554,7 +2554,7 @@ unless you have set
 :term:`SYSTEMD_AUTO_ENABLE` to "disable".
 
 For more information on ``systemd``, see the
-":ref:`dev-manual/dev-manual-common-tasks:selecting an initialization manager`"
+":ref:`dev-manual/common-tasks:selecting an initialization manager`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-systemd-boot:
@@ -2631,7 +2631,7 @@ runs tests on an image after the image is constructed (i.e.
 :term:`TESTIMAGE_AUTO` must be set to "1").
 
 For information on how to enable, run, and create new tests, see the
-":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/common-tasks:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-testsdk:
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index 83861d271..11b4cb5d5 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -413,7 +413,7 @@ Upgrading a Recipe
 As software matures, upstream recipes are upgraded to newer versions. As
 a developer, you need to keep your local recipes up-to-date with the
 upstream version releases. Several methods exist by which you can
-upgrade recipes. You can read about them in the ":ref:`dev-manual/dev-manual-common-tasks:upgrading recipes`"
+upgrade recipes. You can read about them in the ":ref:`dev-manual/common-tasks:upgrading recipes`"
 section of the Yocto Project Development Tasks Manual. This section
 overviews the ``devtool upgrade`` command.
 
@@ -441,7 +441,7 @@ You can read more on the ``devtool upgrade`` workflow in the
 ":ref:`sdk-manual/sdk-extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
-how to use ``devtool upgrade`` in the ":ref:`dev-manual/dev-manual-common-tasks:using \`\`devtool upgrade\`\``"
+how to use ``devtool upgrade`` in the ":ref:`dev-manual/common-tasks:using \`\`devtool upgrade\`\``"
 section in the Yocto Project Development Tasks Manual.
 
 .. _devtool-resetting-a-recipe:
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index 6c85c2418..cb4b57436 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -156,7 +156,7 @@ metadata:
 
 -  *ptest:* Enables building the package tests where supported by
    individual recipes. For more information on package tests, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:testing packages with ptest`" section
+   ":ref:`dev-manual/common-tasks:testing packages with ptest`" section
    in the Yocto Project Development Tasks Manual.
 
 -  *smbfs:* Include SMB networks client support (for mounting
@@ -236,7 +236,7 @@ The following image features are available for all images:
 
 -  *read-only-rootfs:* Creates an image whose root filesystem is
    read-only. See the
-   ":ref:`dev-manual/dev-manual-common-tasks:creating a read-only root filesystem`"
+   ":ref:`dev-manual/common-tasks:creating a read-only root filesystem`"
    section in the Yocto Project Development Tasks Manual for more
    information.
 
@@ -273,7 +273,7 @@ these valid features is as follows:
 
 -  *tools-debug:* Installs debugging tools such as ``strace`` and
    ``gdb``. For information on GDB, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
+   ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
    in the Yocto Project Development Tasks Manual. For information on
    tracing and profiling, see the :doc:`/profile-manual/index`.
 
diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/ref-images.rst
index 56ec8562f..5e9374eae 100644
--- a/documentation/ref-manual/ref-images.rst
+++ b/documentation/ref-manual/ref-images.rst
@@ -122,7 +122,7 @@ Following is a list of supported recipes:
    deployed to a separate partition so that you can boot into it and use
    it to deploy a second image to be tested. You can find more
    information about runtime testing in the
-   ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+   ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
    section in the Yocto Project Development Tasks Manual.
 
 -  ``core-image-testmaster-initramfs``: A RAM-based Initial Root
@@ -132,7 +132,7 @@ Following is a list of supported recipes:
 -  ``core-image-weston``: A very basic Wayland image with a terminal.
    This image provides the Wayland protocol libraries and the reference
    Weston compositor. For more information, see the
-   ":ref:`dev-manual/dev-manual-common-tasks:using wayland and weston`"
+   ":ref:`dev-manual/common-tasks:using wayland and weston`"
    section in the Yocto Project Development Tasks Manual.
 
 -  ``core-image-x11``: A very basic X11 image with a terminal.
diff --git a/documentation/ref-manual/ref-kickstart.rst b/documentation/ref-manual/ref-kickstart.rst
index 7f6d4ebe1..bb9c0460f 100644
--- a/documentation/ref-manual/ref-kickstart.rst
+++ b/documentation/ref-manual/ref-kickstart.rst
@@ -79,7 +79,7 @@ the ``part`` and ``partition`` commands:
    source of the data that populates the partition. The most common
    value for this option is "rootfs", but you can use any value that
    maps to a valid source plugin. For information on the source plugins,
-   see the ":ref:`dev-manual/dev-manual-common-tasks:using the wic plugin interface`"
+   see the ":ref:`dev-manual/common-tasks:using the wic plugin interface`"
    section in the Yocto Project Development Tasks Manual.
 
    If you use ``--source rootfs``, Wic creates a partition as large as
diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
index ec6d23387..54cd9510f 100644
--- a/documentation/ref-manual/ref-release-process.rst
+++ b/documentation/ref-manual/ref-release-process.rst
@@ -106,7 +106,7 @@ Additionally, because the test strategies are visible to you as a
 developer, you can validate your projects. This section overviews the
 available test infrastructure used in the Yocto Project. For information
 on how to run available tests on your projects, see the
-":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/common-tasks:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 The QA/testing infrastructure is woven into the project to the point
@@ -128,12 +128,12 @@ consists of the following pieces:
 
 -  :ref:`testimage.bbclass <ref-classes-testimage*>`: This class
    performs runtime testing of images after they are built. The tests
-   are usually used with :doc:`QEMU </dev-manual/dev-manual-qemu>`
+   are usually used with :doc:`QEMU </dev-manual/qemu>`
    to boot the images and check the combined runtime result boot
    operation and functions. However, the test can also use the IP
    address of a machine to test.
 
--  :ref:`ptest <dev-manual/dev-manual-common-tasks:testing packages with ptest>`:
+-  :ref:`ptest <dev-manual/common-tasks:testing packages with ptest>`:
    Runs tests against packages produced during the build for a given
    piece of software. The test allows the packages to be be run within a
    target image.
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index d3a231554..b681e8233 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -12,7 +12,7 @@ and directories.
 
 For information on how to establish a local Source Directory on your
 development system, see the
-":ref:`dev-manual/dev-manual-start:locating yocto project source files`"
+":ref:`dev-manual/start:locating yocto project source files`"
 section in the Yocto Project Development Tasks Manual.
 
 .. note::
@@ -176,7 +176,7 @@ within the :term:`Source Directory`. If you design a
 custom distribution, you can include your own version of this
 configuration file to mention the targets defined by your distribution.
 See the
-":ref:`dev-manual/dev-manual-common-tasks:creating a custom template configuration directory`"
+":ref:`dev-manual/common-tasks:creating a custom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
 information.
 
@@ -193,7 +193,7 @@ Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`:
 The OpenEmbedded build system uses the template configuration files, which
 are found by default in the ``meta-poky/conf/`` directory in the Source
 Directory. See the
-":ref:`dev-manual/dev-manual-common-tasks:creating a custom template configuration directory`"
+":ref:`dev-manual/common-tasks:creating a custom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
 information.
 
@@ -236,7 +236,7 @@ The OpenEmbedded build system creates this directory when you enable
 build history via the ``buildhistory`` class file. The directory
 organizes build information into image, packages, and SDK
 subdirectories. For information on the build history feature, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining build output quality`"
+":ref:`dev-manual/common-tasks:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _structure-build-conf-local.conf:
@@ -292,7 +292,7 @@ file, it uses ``sed`` to substitute final
 ----------------------------
 
 This configuration file defines
-:ref:`layers <dev-manual/dev-manual-common-tasks:understanding and creating layers>`,
+:ref:`layers <dev-manual/common-tasks:understanding and creating layers>`,
 which are directory trees, traversed (or walked) by BitBake. The
 ``bblayers.conf`` file uses the :term:`BBLAYERS`
 variable to list the layers BitBake tries to find.
@@ -438,7 +438,7 @@ directory contains sub-directories for ``bash``, ``busybox``, and
 ``glibc`` (among others) that in turn contain appropriate ``COPYING``
 license files with other licensing information. For information on
 licensing, see the
-":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _structure-build-tmp-deploy-images:
@@ -577,7 +577,7 @@ built within the Yocto Project. For this package, a work directory of
 ``tmp/work/qemux86-poky-linux/linux-yocto/3.0+git1+<.....>``, referred
 to as the ``WORKDIR``, is created. Within this directory, the source is
 unpacked to ``linux-qemux86-standard-build`` and then patched by Quilt.
-(See the ":ref:`dev-manual/dev-manual-common-tasks:using quilt in your workflow`" section in
+(See the ":ref:`dev-manual/common-tasks:using quilt in your workflow`" section in
 the Yocto Project Development Tasks Manual for more information.) Within
 the ``linux-qemux86-standard-build`` directory, standard Quilt
 directories ``linux-3.0/patches`` and ``linux-3.0/.pc`` are created, and
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 2c7c1e075..d162c9bad 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -94,7 +94,7 @@ distributions:
       interested in hearing about your experience. For information on
       how to submit a bug, see the Yocto Project
       :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-      and the ":ref:`dev-manual/dev-manual-common-tasks:submitting a defect against the yocto project`"
+      and the ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
       section in the Yocto Project Development Tasks Manual.
 
 
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 9fde9a837..89731d459 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -351,7 +351,7 @@ applied as a patch by default except for the ``patch_file5`` patch.
 You can find out more about the patching process in the
 ":ref:`overview-manual/overview-manual-concepts:patching`" section in
 the Yocto Project Overview and Concepts Manual and the
-":ref:`dev-manual/dev-manual-common-tasks:patching code`" section in the
+":ref:`dev-manual/common-tasks:patching code`" section in the
 Yocto Project Development Tasks Manual.
 
 .. _ref-tasks-populate_lic:
@@ -567,7 +567,7 @@ scratch is guaranteed.
 Starts a shell in which an interactive Python interpreter allows you to
 interact with the BitBake build environment. From within this shell, you
 can directly examine and set bits from the data store and execute
-functions as if within the BitBake environment. See the ":ref:`dev-manual/dev-manual-common-tasks:using a development python shell`" section in
+functions as if within the BitBake environment. See the ":ref:`dev-manual/common-tasks:using a development python shell`" section in
 the Yocto Project Development Tasks Manual for more information about
 using ``devpyshell``.
 
@@ -577,7 +577,7 @@ using ``devpyshell``.
 ---------------
 
 Starts a shell whose environment is set up for development, debugging,
-or both. See the ":ref:`dev-manual/dev-manual-common-tasks:using a development shell`" section in the
+or both. See the ":ref:`dev-manual/common-tasks:using a development shell`" section in the
 Yocto Project Development Tasks Manual for more information about using
 ``devshell``.
 
@@ -642,7 +642,7 @@ information on how the root filesystem is created.
 
 Boots an image and performs runtime tests within the image. For
 information on automatically testing images, see the
-":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/common-tasks:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-tasks-testimage_auto:
@@ -655,7 +655,7 @@ after it has been built. This task is enabled when you set
 :term:`TESTIMAGE_AUTO` equal to "1".
 
 For information on automatically testing images, see the
-":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/common-tasks:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 Kernel-Related Tasks
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index 6f0facf72..ba1930ebd 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -21,7 +21,7 @@ universal, the list includes them just in case:
 
       Information in append files extends or overrides the information in the
       similarly-named recipe file. For an example of an append file in use, see
-      the ":ref:`dev-manual/dev-manual-common-tasks:Using .bbappend Files in
+      the ":ref:`dev-manual/common-tasks:Using .bbappend Files in
       Your Layer`" section in the Yocto Project Development Tasks Manual.
 
       When you name an append file, you can use the "``%``" wildcard character
@@ -192,7 +192,7 @@ universal, the list includes them just in case:
       ":ref:`overview-manual/overview-manual-yp-intro:The Yocto Project Layer
       Model`" section in the Yocto Project Overview and Concepts Manual. For
       more detailed information on layers, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:Understanding and Creating
+      ":ref:`dev-manual/common-tasks:Understanding and Creating
       Layers`" section in the Yocto Project Development Tasks Manual. For a
       discussion specifically on BSP Layers, see the ":ref:`bsp-guide/bsp:BSP
       Layers`" section in the Yocto Project Board Support Packages (BSP)
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 8411989b6..65f64b91a 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -239,7 +239,7 @@ system and gives an overview of their function and contents.
       so that it does contain ``${SRCPV}``.
 
       For more information see the
-      ":ref:`dev-manual/dev-manual-common-tasks:automatically incrementing a package version number`"
+      ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`AVAILABLE_LICENSES`
@@ -261,7 +261,7 @@ system and gives an overview of their function and contents.
       The list simply presents the tunes that are available. Not all tunes
       may be compatible with a particular machine configuration, or with
       each other in a
-      :ref:`Multilib <dev-manual/dev-manual-common-tasks:combining multiple versions of library files into one image>`
+      :ref:`Multilib <dev-manual/common-tasks:combining multiple versions of library files into one image>`
       configuration.
 
       To add a tune to the list, be sure to append it with spaces using the
@@ -317,7 +317,7 @@ system and gives an overview of their function and contents.
    :term:`BASE_LIB`
       The library directory name for the CPU or Application Binary
       Interface (ABI) tune. The ``BASE_LIB`` applies only in the Multilib
-      context. See the ":ref:`dev-manual/dev-manual-common-tasks:combining multiple versions of library files into one image`"
+      context. See the ":ref:`dev-manual/common-tasks:combining multiple versions of library files into one image`"
       section in the Yocto Project Development Tasks Manual for information
       on Multilib.
 
@@ -545,7 +545,7 @@ system and gives an overview of their function and contents.
       is not set higher than "20".
 
       For more information on speeding up builds, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:speeding up a build`"
+      ":ref:`dev-manual/common-tasks:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`BB_SERVER_TIMEOUT`
@@ -746,7 +746,7 @@ system and gives an overview of their function and contents.
 
       For information on how to use ``BBMULTICONFIG`` in an environment
       that supports building targets with multiple configurations, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:building images for multiple targets using multiple configurations`"
+      ":ref:`dev-manual/common-tasks:building images for multiple targets using multiple configurations`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`BBPATH`
@@ -1002,7 +1002,7 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the build history features to be
       enabled. For more information on how build history works, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:maintaining build output quality`"
+      ":ref:`dev-manual/common-tasks:maintaining build output quality`"
       section in the Yocto Project Development Tasks Manual.
 
       You can specify these features in the form of a space-separated list:
@@ -1299,7 +1299,7 @@ system and gives an overview of their function and contents.
       will be the aggregate of all of them.
 
       For information on creating an initramfs, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
+      ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`CONFIG_SITE`
@@ -1402,7 +1402,7 @@ system and gives an overview of their function and contents.
          newly installed packages to an image, which might be most suitable for
          read-only filesystems that cannot be upgraded. See the
          :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
-         You can also reference the ":ref:`dev-manual/dev-manual-common-tasks:providing license text`"
+         You can also reference the ":ref:`dev-manual/common-tasks:providing license text`"
          section in the Yocto Project Development Tasks Manual for
          information on providing license text.
 
@@ -1418,7 +1418,7 @@ system and gives an overview of their function and contents.
          newly installed packages to an image, which might be most suitable for
          read-only filesystems that cannot be upgraded. See the
          :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
-         You can also reference the ":ref:`dev-manual/dev-manual-common-tasks:providing license text`"
+         You can also reference the ":ref:`dev-manual/common-tasks:providing license text`"
          section in the Yocto Project Development Tasks Manual for
          information on providing license text.
 
@@ -2029,7 +2029,7 @@ system and gives an overview of their function and contents.
       When used with the :ref:`report-error <ref-classes-report-error>`
       class, specifies the path used for storing the debug files created by
       the :ref:`error reporting
-      tool <dev-manual/dev-manual-common-tasks:using the error reporting tool>`, which
+      tool <dev-manual/common-tasks:using the error reporting tool>`, which
       allows you to submit build errors you encounter to a central
       database. By default, the value of this variable is
       ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
@@ -2129,7 +2129,7 @@ system and gives an overview of their function and contents.
       For more information on ``externalsrc.bbclass``, see the
       ":ref:`externalsrc.bbclass <ref-classes-externalsrc>`" section. You
       can also find information on how to use this variable in the
-      ":ref:`dev-manual/dev-manual-common-tasks:building software from an external source`"
+      ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTERNALSRC_BUILD`
@@ -2143,7 +2143,7 @@ system and gives an overview of their function and contents.
       For more information on ``externalsrc.bbclass``, see the
       ":ref:`externalsrc.bbclass <ref-classes-externalsrc>`" section. You
       can also find information on how to use this variable in the
-      ":ref:`dev-manual/dev-manual-common-tasks:building software from an external source`"
+      ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTRA_AUTORECONF`
@@ -2181,7 +2181,7 @@ system and gives an overview of their function and contents.
           useful if you want to develop against the libraries in the image.
         - "read-only-rootfs" - Creates an image whose root filesystem is
           read-only. See the
-          ":ref:`dev-manual/dev-manual-common-tasks:creating a read-only root filesystem`"
+          ":ref:`dev-manual/common-tasks:creating a read-only root filesystem`"
           section in the Yocto Project Development Tasks Manual for more
           information
         - "tools-debug" - Adds debugging tools such as gdb and strace.
@@ -2194,7 +2194,7 @@ system and gives an overview of their function and contents.
       Project, see the ":ref:`ref-features-image`" section.
 
       For an example that shows how to customize your image by using this
-      variable, see the ":ref:`dev-manual/dev-manual-common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
+      variable, see the ":ref:`dev-manual/common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTRA_IMAGECMD`
@@ -2511,7 +2511,7 @@ system and gives an overview of their function and contents.
       You can find out more about the patching process in the
       ":ref:`overview-manual/overview-manual-concepts:patching`" section
       in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/dev-manual-common-tasks:patching code`" section in
+      ":ref:`dev-manual/common-tasks:patching code`" section in
       the Yocto Project Development Tasks Manual. See the
       :ref:`ref-tasks-patch` task as well.
 
@@ -2904,7 +2904,7 @@ system and gives an overview of their function and contents.
       the same files into a ``boot`` directory within the target partition.
 
       You can find information on how to use the Wic tool in the
-      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
+      ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
       ":doc:`/ref-manual/ref-kickstart`" chapter.
@@ -2940,7 +2940,7 @@ system and gives an overview of their function and contents.
       the same files into a ``boot`` directory within the target partition.
 
       You can find information on how to use the Wic tool in the
-      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
+      ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
       ":doc:`/ref-manual/ref-kickstart`" chapter.
@@ -3000,7 +3000,7 @@ system and gives an overview of their function and contents.
       the ":ref:`ref-features-image`" section.
 
       For an example that shows how to customize your image by using this
-      variable, see the ":ref:`dev-manual/dev-manual-common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
+      variable, see the ":ref:`dev-manual/common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`IMAGE_FSTYPES`
@@ -3058,7 +3058,7 @@ system and gives an overview of their function and contents.
             allows the initial RAM filesystem (initramfs) recipe to use a
             fixed set of packages and not be affected by ``IMAGE_INSTALL``.
             For information on creating an initramfs, see the
-            ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`"
+            ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`"
             section in the Yocto Project Development Tasks Manual.
 
          -  Using ``IMAGE_INSTALL`` with the
@@ -3554,7 +3554,7 @@ system and gives an overview of their function and contents.
       :term:`INITRAMFS_IMAGE_BUNDLE`
       variable, which allows the generated image to be bundled inside the
       kernel image. Additionally, for information on creating an initramfs
-      image, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
+      image, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_IMAGE_BUNDLE`
@@ -3602,7 +3602,7 @@ system and gives an overview of their function and contents.
       See the
       :yocto_git:`local.conf.sample.extended </poky/tree/meta-poky/conf/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
-      initramfs, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
+      initramfs, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_LINK_NAME`
@@ -4191,7 +4191,7 @@ system and gives an overview of their function and contents.
          The OpenEmbedded build system produces a warning if the variable
          is not set for any given layer.
 
-      See the ":ref:`dev-manual/dev-manual-common-tasks:creating your own layer`"
+      See the ":ref:`dev-manual/common-tasks:creating your own layer`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LAYERVERSION`
@@ -4240,7 +4240,7 @@ system and gives an overview of their function and contents.
       This variable must be defined for all recipes (unless
       :term:`LICENSE` is set to "CLOSED").
 
-      For more information, see the ":ref:`dev-manual/dev-manual-common-tasks:tracking license changes`"
+      For more information, see the ":ref:`dev-manual/common-tasks:tracking license changes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE`
@@ -4306,7 +4306,7 @@ system and gives an overview of their function and contents.
       For related information on providing license text, see the
       :term:`COPY_LIC_DIRS` variable, the
       :term:`COPY_LIC_MANIFEST` variable, and the
-      ":ref:`dev-manual/dev-manual-common-tasks:providing license text`"
+      ":ref:`dev-manual/common-tasks:providing license text`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_FLAGS`
@@ -4319,7 +4319,7 @@ system and gives an overview of their function and contents.
       typically used to mark recipes that might require additional licenses
       in order to be used in a commercial product. For more information,
       see the
-      ":ref:`dev-manual/dev-manual-common-tasks:enabling commercially licensed recipes`"
+      ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_FLAGS_WHITELIST`
@@ -4327,7 +4327,7 @@ system and gives an overview of their function and contents.
       :term:`LICENSE_FLAGS` within a recipe should not
       prevent that recipe from being built. This practice is otherwise
       known as "whitelisting" license flags. For more information, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:enabling commercially licensed recipes`"
+      ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_PATH`
@@ -4890,7 +4890,7 @@ system and gives an overview of their function and contents.
       Controls how the OpenEmbedded build system spawns interactive
       terminals on the host development system (e.g. using the BitBake
       command with the ``-c devshell`` command-line option). For more
-      information, see the ":ref:`dev-manual/dev-manual-common-tasks:using a development shell`" section in
+      information, see the ":ref:`dev-manual/common-tasks:using a development shell`" section in
       the Yocto Project Development Tasks Manual.
 
       You can use the following values for the ``OE_TERMINAL`` variable:
@@ -4959,7 +4959,7 @@ system and gives an overview of their function and contents.
 
          An easy way to see what overrides apply is to search for ``OVERRIDES``
          in the output of the ``bitbake -e`` command. See the
-         ":ref:`dev-manual/dev-manual-common-tasks:viewing variable values`" section in the Yocto
+         ":ref:`dev-manual/common-tasks:viewing variable values`" section in the Yocto
          Project Development Tasks Manual for more information.
 
    :term:`P`
@@ -4981,7 +4981,7 @@ system and gives an overview of their function and contents.
       specific by using the package name as a suffix.
 
       You can find out more about applying this variable in the
-      ":ref:`dev-manual/dev-manual-common-tasks:adding custom metadata to packages`"
+      ":ref:`dev-manual/common-tasks:adding custom metadata to packages`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_ARCH`
@@ -5079,7 +5079,7 @@ system and gives an overview of their function and contents.
          separate ``*-src`` pkg. This is the default behavior.
 
       You can find out more about debugging using GDB by reading the
-      ":ref:`dev-manual/dev-manual-common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
+      ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_EXCLUDE_COMPLEMENTARY`
@@ -5243,7 +5243,7 @@ system and gives an overview of their function and contents.
       the :ref:`core-image-minimal-initramfs <ref-manual/ref-images:images>`
       image. When working with an initial RAM filesystem (initramfs) image,
       use the ``PACKAGE_INSTALL`` variable. For information on creating an
-      initramfs, see the ":ref:`dev-manual/dev-manual-common-tasks:building an initial ram filesystem (initramfs) image`" section
+      initramfs, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_INSTALL_ATTEMPTONLY`
@@ -5266,7 +5266,7 @@ system and gives an overview of their function and contents.
       ``PACKAGE_WRITE_DEPS``.
 
       For information on running post-installation scripts, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:post-installation scripts`"
+      ":ref:`dev-manual/common-tasks:post-installation scripts`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGECONFIG`
@@ -5423,7 +5423,7 @@ system and gives an overview of their function and contents.
 
       For an example of how to use the ``PACKAGES_DYNAMIC`` variable when
       you are splitting packages, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:handling optional module packaging`"
+      ":ref:`dev-manual/common-tasks:handling optional module packaging`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGESPLITFUNCS`
@@ -5458,7 +5458,7 @@ system and gives an overview of their function and contents.
          the ``do_compile`` task that result in race conditions, you can clear
          the ``PARALLEL_MAKE`` variable within the recipe as a workaround. For
          information on addressing race conditions, see the
-         ":ref:`dev-manual/dev-manual-common-tasks:debugging parallel make races`"
+         ":ref:`dev-manual/common-tasks:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
 
       For single socket systems (i.e. one CPU), you should not have to
@@ -5468,7 +5468,7 @@ system and gives an overview of their function and contents.
       not set higher than "-j 20".
 
       For more information on speeding up builds, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:speeding up a build`"
+      ":ref:`dev-manual/common-tasks:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PARALLEL_MAKEINST`
@@ -5488,7 +5488,7 @@ system and gives an overview of their function and contents.
          the ``do_install`` task that result in race conditions, you can
          clear the ``PARALLEL_MAKEINST`` variable within the recipe as a
          workaround. For information on addressing race conditions, see the
-         ":ref:`dev-manual/dev-manual-common-tasks:debugging parallel make races`"
+         ":ref:`dev-manual/common-tasks:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
 
    :term:`PATCHRESOLVE`
@@ -5580,7 +5580,7 @@ system and gives an overview of their function and contents.
       For examples of how this data is used, see the
       ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/dev-manual-common-tasks:viewing package information with \`\`oe-pkgdata-util\`\``"
+      ":ref:`dev-manual/common-tasks:viewing package information with \`\`oe-pkgdata-util\`\``"
       section in the Yocto Project Development Tasks Manual. For more
       information on the shared, global-state directory, see
       :term:`STAGING_DIR_HOST`.
@@ -5713,7 +5713,7 @@ system and gives an overview of their function and contents.
 
       Because manually managing ``PR`` can be cumbersome and error-prone,
       an automated solution exists. See the
-      ":ref:`dev-manual/dev-manual-common-tasks:working with a pr service`" section
+      ":ref:`dev-manual/common-tasks:working with a pr service`" section
       in the Yocto Project Development Tasks Manual for more information.
 
    :term:`PREFERRED_PROVIDER`
@@ -5738,7 +5738,7 @@ system and gives an overview of their function and contents.
          PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 
       For more
-      information, see the ":ref:`dev-manual/dev-manual-common-tasks:using virtual providers`"
+      information, see the ":ref:`dev-manual/common-tasks:using virtual providers`"
       section in the Yocto Project Development Tasks Manual.
 
       .. note::
@@ -5951,7 +5951,7 @@ system and gives an overview of their function and contents.
 
       You must
       set the variable if you want to automatically start a local :ref:`PR
-      service <dev-manual/dev-manual-common-tasks:working with a pr service>`. You can
+      service <dev-manual/common-tasks:working with a pr service>`. You can
       set ``PRSERV_HOST`` to other values to use a remote PR service.
 
 
@@ -5965,7 +5965,7 @@ system and gives an overview of their function and contents.
 
    :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package
-      Test <dev-manual/dev-manual-common-tasks:testing packages with ptest>` (ptest)
+      Test <dev-manual/common-tasks:testing packages with ptest>` (ptest)
       functionality is enabled when building a recipe. You should not set
       this variable directly. Enabling and disabling building Package Tests
       at build time should be done by adding "ptest" to (or removing it
@@ -7000,7 +7000,7 @@ system and gives an overview of their function and contents.
       various ``SPL_*`` variables used by the OpenEmbedded build system.
 
       See the BeagleBone machine configuration example in the
-      ":ref:`dev-manual/dev-manual-common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
@@ -7200,7 +7200,7 @@ system and gives an overview of their function and contents.
          For information on limitations when inheriting the latest revision
          of software using ``SRCREV``, see the :term:`AUTOREV` variable
          description and the
-         ":ref:`dev-manual/dev-manual-common-tasks:automatically incrementing a package version number`"
+         ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
          section, which is in the Yocto Project Development Tasks Manual.
 
    :term:`SSTATE_DIR`
@@ -7660,7 +7660,7 @@ system and gives an overview of their function and contents.
 
    :term:`SYSVINIT_ENABLED_GETTYS`
       When using
-      :ref:`SysVinit <dev-manual/dev-manual-common-tasks:enabling system services>`,
+      :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,
       specifies a space-separated list of the virtual terminals that should
       run a `getty <http://en.wikipedia.org/wiki/Getty_%28Unix%29>`__
       (allowing login), assuming :term:`USE_VT` is not set to
@@ -7946,7 +7946,7 @@ system and gives an overview of their function and contents.
       file.
 
       For more information on testing images, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+      ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_SERIALCONTROL_CMD`
@@ -8022,7 +8022,7 @@ system and gives an overview of their function and contents.
          TEST_SUITES = "test_A test_B"
 
       For more information on testing images, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+      ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_TARGET`
@@ -8042,7 +8042,7 @@ system and gives an overview of their function and contents.
       You can provide the following arguments with ``TEST_TARGET``:
 
       -  *"qemu":* Boots a QEMU image and runs the tests. See the
-         ":ref:`dev-manual/dev-manual-common-tasks:enabling runtime tests on qemu`" section
+         ":ref:`dev-manual/common-tasks:enabling runtime tests on qemu`" section
          in the Yocto Project Development Tasks Manual for more
          information.
 
@@ -8058,7 +8058,7 @@ system and gives an overview of their function and contents.
             ``meta/lib/oeqa/controllers/simpleremote.py``.
 
       For information on running tests on hardware, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:enabling runtime tests on hardware`"
+      ":ref:`dev-manual/common-tasks:enabling runtime tests on hardware`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_TARGET_IP`
@@ -8096,7 +8096,7 @@ system and gives an overview of their function and contents.
 
       For more information
       on enabling, running, and writing these tests, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
+      ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`testimage*.bbclass <ref-classes-testimage*>`" section.
 
@@ -8554,13 +8554,13 @@ system and gives an overview of their function and contents.
       specifically set. Typically, you would set ``USE_DEVFS`` to "0" for a
       statically populated ``/dev`` directory.
 
-      See the ":ref:`dev-manual/dev-manual-common-tasks:selecting a device manager`" section in
+      See the ":ref:`dev-manual/common-tasks:selecting a device manager`" section in
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
    :term:`USE_VT`
       When using
-      :ref:`SysVinit <dev-manual/dev-manual-common-tasks:enabling system services>`,
+      :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,
       determines whether or not to run a
       `getty <http://en.wikipedia.org/wiki/Getty_%28Unix%29>`__ on any
       virtual terminals in order to enable logging in through those
@@ -8735,7 +8735,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system to create a partitioned image
       (image\ ``.wic``). For information on how to create a partitioned
       image, see the
-      ":ref:`dev-manual/dev-manual-common-tasks:creating partitioned images using wic`"
+      ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
       section in the Yocto Project Development Tasks Manual. For details on
       the kickstart file format, see the ":doc:`/ref-manual/ref-kickstart`" Chapter.
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index fd04593d4..77c367809 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -23,7 +23,7 @@ The Yocto Project gladly accepts contributions. You can submit changes
 to the project either by creating and sending pull requests, or by
 submitting patches through email. For information on how to do both as
 well as information on how to identify the maintainer for each area of
-code, see the ":ref:`dev-manual/dev-manual-common-tasks:submitting a change to the yocto project`" section in the
+code, see the ":ref:`dev-manual/common-tasks:submitting a change to the yocto project`" section in the
 Yocto Project Development Tasks Manual.
 
 .. _resources-bugtracker:
@@ -47,7 +47,7 @@ A general procedure and guidelines exist for when you use Bugzilla to
 submit a bug. For information on how to use Bugzilla to submit a bug
 against the Yocto Project, see the following:
 
--  The ":ref:`dev-manual/dev-manual-common-tasks:submitting a defect against the yocto project`"
+-  The ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The Yocto Project :yocto_wiki:`Bugzilla wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index 6b7128c27..8d4fe0964 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -81,7 +81,7 @@ As an alternative to locating and downloading an SDK installer, you can
 build the SDK installer. Follow these steps:
 
 1. *Set Up the Build Environment:* Be sure you are set up to use BitBake
-   in a shell. See the ":ref:`dev-manual/dev-manual-start:preparing the build host`" section
+   in a shell. See the ":ref:`dev-manual/start:preparing the build host`" section
    in the Yocto Project Development Tasks Manual for information on how
    to get a build host ready that is either a native Linux machine or a
    machine that uses CROPS.
@@ -89,9 +89,9 @@ build the SDK installer. Follow these steps:
 2. *Clone the ``poky`` Repository:* You need to have a local copy of the
    Yocto Project :term:`Source Directory`
    (i.e. a local
-   ``poky`` repository). See the ":ref:`dev-manual/dev-manual-start:cloning the \`\`poky\`\` repository`" and
-   possibly the ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`" and
-   ":ref:`dev-manual/dev-manual-start:checking out by tag in poky`" sections
+   ``poky`` repository). See the ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" and
+   possibly the ":ref:`dev-manual/start:checking out by branch in poky`" and
+   ":ref:`dev-manual/start:checking out by tag in poky`" sections
    all in the Yocto Project Development Tasks Manual for information on
    how to clone the ``poky`` repository and check out the appropriate
    branch for your work.
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index 5514c6767..66b12cdff 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -211,7 +211,7 @@ You just need to follow these general steps:
    tools to develop your application. If you need to separately install
    and use the QEMU emulator, you can go to `QEMU Home
    Page <http://wiki.qemu.org/Main_Page>`__ to download and learn about
-   the emulator. See the ":doc:`/dev-manual/dev-manual-qemu`" chapter in the
+   the emulator. See the ":doc:`/dev-manual/qemu`" chapter in the
    Yocto Project Development Tasks Manual for information on using QEMU
    within the Yocto Project.
 
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 6168ad770..3dc64bcd4 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -142,7 +142,7 @@ thefollowing types of tests:
 -  *Package Testing:* A Package Test (ptest) runs tests against packages
    built by the OpenEmbedded build system on the target machine. See the
    :ref:`Testing Packages With
-   ptest <dev-manual/dev-manual-common-tasks:Testing Packages With ptest>` section
+   ptest <dev-manual/common-tasks:Testing Packages With ptest>` section
    in the Yocto Project Development Tasks Manual and the
    ":yocto_wiki:`Ptest </Ptest>`" Wiki page for more
    information on Ptest.
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index c3f0fef0a..4da415d86 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -67,7 +67,7 @@ layers.
 For general information on layers, see the
 ":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
 section in the Yocto Project Overview and Concepts Manual. For information on how
-to create layers, see the ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+to create layers, see the ":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 Configuring Toaster to Hook Into Your Layer Index
diff --git a/documentation/toaster-manual/start.rst b/documentation/toaster-manual/start.rst
index 888337416..c687a8253 100644
--- a/documentation/toaster-manual/start.rst
+++ b/documentation/toaster-manual/start.rst
@@ -14,7 +14,7 @@ Setting Up the Basic System Requirements
 
 Before you can use Toaster, you need to first set up your build system
 to run the Yocto Project. To do this, follow the instructions in the
-":ref:`dev-manual/dev-manual-start:preparing the build host`" section of
+":ref:`dev-manual/start:preparing the build host`" section of
 the Yocto Project Development Tasks Manual. For Ubuntu/Debian, you might
 also need to do an additional install of pip3. ::
 
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 3663f5336..997f599f5 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -42,7 +42,7 @@ Transitioning to a custom environment for systems development
    You might want to start with the build specification that Poky provides
    (which is reference embedded distribution) and then add your newly chosen
    layers to that. Here is the information :ref:`about adding layers
-   <dev-manual/dev-manual-common-tasks:Understanding and Creating Layers>`.
+   <dev-manual/common-tasks:Understanding and Creating Layers>`.
 
 #. **Based on the layers you've chosen, make needed changes in your
    configuration**.
@@ -58,7 +58,7 @@ Transitioning to a custom environment for systems development
    releases. If you are using a Yocto Project release earlier than 2.4, use the
    ``yocto-layer create`` tool. The ``bitbake-layers`` tool also provides a number
    of other useful layer-related commands. See
-   :ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the
+   :ref:`dev-manual/common-tasks:creating a general layer using the
    \`\`bitbake-layers\`\` script` section.
 
 #. **Create your own layer for the BSP you're going to use**.
@@ -79,7 +79,7 @@ Transitioning to a custom environment for systems development
    process of refinement. Start by getting each step of the build process
    working beginning with fetching all the way through packaging. Next, run the
    software on your target and refine further as needed. See :ref:`Writing a New
-   Recipe <dev-manual/dev-manual-common-tasks:writing a new recipe>` in the
+   Recipe <dev-manual/common-tasks:writing a new recipe>` in the
    Yocto Project Development Tasks Manual for more information.
 
 #. **Now you're ready to create an image recipe**.
@@ -103,7 +103,7 @@ Transitioning to a custom environment for systems development
    needs to change for your distribution. If you find yourself adding a lot of
    configuration to your local.conf file aside from paths and other typical
    local settings, it's time to :ref:`consider creating your own distribution
-   <dev-manual/dev-manual-common-tasks:creating your own distribution>`.
+   <dev-manual/common-tasks:creating your own distribution>`.
 
    You can add product specifications that can customize the distribution if
    needed in other layers. You can also add other functionality specific to the
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 563594b52..a8902c0be 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -132,7 +132,7 @@ contact us with other suggestions.
    say "bitbake foo" where "foo" is the name for a specific recipe.  As you
    become more advanced using the Yocto Project, and if builds are failing, it
    can be useful to make sure the fetch itself works as desired. Here are some
-   valuable links: :ref:`dev-manual/dev-manual-common-tasks:Using a Development
+   valuable links: :ref:`dev-manual/common-tasks:Using a Development
    Shell` for information on how to build and run a specific task using
    devshell. Also, the :ref:`SDK manual shows how to build out a specific recipe
    <sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`.
-- 
2.29.2

