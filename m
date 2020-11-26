Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.3002.1606384130505690532
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s9mFrYym;
 spf=pass (domain: linaro.org, ip: 209.85.221.45, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id k14so1445864wrn.1
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MlEjFBCZ55NhXukYOuoLBr10nT0wOmQBaBT3aO1csFg=;
        b=s9mFrYymgtcpOTJLqEN68/4Yo/0WBgxePobFCtbw+cHGIjFfKi5BJOd2L1RfnRT3e0
         ZD0eg3rP8PRcsAcvh849++F4fSfI7udd3gTAjKeQ+Xu+N8NflqUoG/RSNiCC9D/+jLux
         5NptcobRi+E8KXkLE9A7X9FRfMfKKmhELv3PnW4KLWHGDchHvMFq/p5jxXi6dMzUcCoa
         VpSYxFM6B0HO/zOhi2Wu/RgYIZLevLiqxh/J87s3CawIFPz30gD1rN3hVsEPFqFPk6GO
         8CyYCeSOLR7RkG0TH9MVrzMUcBh+8UWvWgk7k1awq/POJkxLeYBJ076f12SBSKM194A6
         vPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MlEjFBCZ55NhXukYOuoLBr10nT0wOmQBaBT3aO1csFg=;
        b=SRjo7tZyGmR8EVv4Emr/pOwIAe6YFaAVLwGdDwGtid9kpb6G4tsDN0dlVj0pYQnAVw
         hR81dB/zoE0Q7XnQBwdZoNPRuNtfhXM0afK1DBwp5fClrYwSFarBmjnXXUsWAg5GGdAG
         bK4GPt+6FIEqyVk+HpWMpWn4FvrGwZ7O9idBak3vCNwHHUTndmPNBIpr79GJ6A3X4qVi
         lTszYo98WddtvFX1i954O72ee+txwDwknQdIEn0gMjtXz8L3IsNb8kirvoG7/RvwwXpZ
         fM9py0xCxku3lFTkJRxSoRenuGESsQ8RndGJN1xFZpaV0qnWWVO1yBV2U70agTG1hlwm
         +3Iw==
X-Gm-Message-State: AOAM531PxtItz2DIDe4W3l9EGgI4scv9tDtD7K9VkGB9lZKT5wUhTveq
	QjMY+c8Hc4Z36VOvoS9seRcYuP3Hn7ivOLlp
X-Google-Smtp-Source: ABdhPJyfTUGWvEnME+mIm/uoNW7ZYeEHjzkdijTVHYIV9n4xaAp3fazXXSWtgzR9rn8E+aTaclPLfw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr2721249wru.241.1606384127346;
        Thu, 26 Nov 2020 01:48:47 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:46 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 7/7] dev-manual: remove unused labels
Date: Thu, 26 Nov 2020 10:48:27 +0100
Message-Id: <20201126094827.95641-8-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
References: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 220 ------------------
 documentation/dev-manual/dev-manual-intro.rst |   2 -
 documentation/dev-manual/dev-manual-qemu.rst  |  14 --
 documentation/dev-manual/dev-manual-start.rst |  10 -
 4 files changed, 246 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 23c2be4f4..706d5e7a6 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -160,8 +160,6 @@ Follow these general steps to create your layer without using tools:
    Project <#making-sure-your-layer-is-compatible-with-yocto-project>`__"
    section for more information.
 
-.. _best-practices-to-follow-when-creating-layers:
-
 Following Best Practices When Creating Layers
 ---------------------------------------------
 
@@ -457,8 +455,6 @@ file. During the processing of each ``conf/layer.conf`` file, BitBake
 adds the recipes, classes and configurations contained within the
 particular layer to the source directory.
 
-.. _using-bbappend-files:
-
 Using .bbappend Files in Your Layer
 -----------------------------------
 
@@ -839,16 +835,12 @@ enables the build system to locate the layer during the build.
    During a build, the OpenEmbedded build system looks in the layers
    from the top of the list down to the bottom in that order.
 
-.. _usingpoky-extend-customimage:
-
 Customizing Images
 ==================
 
 You can customize images to satisfy particular requirements. This
 section describes several methods and provides guidelines for each.
 
-.. _usingpoky-extend-customimage-localconf:
-
 Customizing Images Using ``local.conf``
 ---------------------------------------
 
@@ -891,8 +883,6 @@ You can add packages using a similar approach through the
 ``CORE_IMAGE_EXTRA_INSTALL`` variable. If you use this variable, only
 ``core-image-*`` images are affected.
 
-.. _usingpoky-extend-customimage-imagefeatures:
-
 Customizing Images Using Custom ``IMAGE_FEATURES`` and ``EXTRA_IMAGE_FEATURES``
 -------------------------------------------------------------------------------
 
@@ -949,8 +939,6 @@ configures the image you are working with to include
    Project Reference Manual for a complete list of image features that ship
    with the Yocto Project.
 
-.. _usingpoky-extend-customimage-custombb:
-
 Customizing Images Using Custom .bb Files
 -----------------------------------------
 
@@ -977,8 +965,6 @@ image, copy the ``meta/recipes-sato/images/core-image-sato.bb`` to a new
 
    IMAGE_INSTALL += "strace"
 
-.. _usingpoky-extend-customimage-customtasks:
-
 Customizing Images Using Custom Package Groups
 ----------------------------------------------
 
@@ -1039,8 +1025,6 @@ build an image using these package group packages, you need to add
 ``IMAGE_INSTALL``. For other forms of image dependencies see the other
 areas of this section.
 
-.. _usingpoky-extend-customimage-image-name:
-
 Customizing an Image Hostname
 -----------------------------
 
@@ -1080,8 +1064,6 @@ unsets the variable in a configuration file:
 Having no default hostname in the filesystem is suitable for
 environments that use dynamic hostnames such as virtual machines.
 
-.. _new-recipe-writing-a-new-recipe:
-
 Writing a New Recipe
 ====================
 
@@ -1097,8 +1079,6 @@ how to create, write, and test a new recipe.
    ":ref:`ref-manual/ref-varlocality:recipes`" section of the Yocto Project
    Reference Manual.
 
-.. _new-recipe-overview:
-
 Overview
 --------
 
@@ -1108,8 +1088,6 @@ The remainder of the section provides details for the steps.
 .. image:: figures/recipe-workflow.png
    :align: center
 
-.. _new-recipe-locate-or-automatically-create-a-base-recipe:
-
 Locate or Automatically Create a Base Recipe
 --------------------------------------------
 
@@ -1130,8 +1108,6 @@ that can help you quickly get a start on a new recipe:
    For information on recipe syntax, see the
    ":ref:`dev-manual/dev-manual-common-tasks:recipe syntax`" section.
 
-.. _new-recipe-creating-the-base-recipe-using-devtool:
-
 Creating the Base Recipe Using ``devtool add``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -1147,8 +1123,6 @@ the ":ref:`sdk-manual/sdk-extensible:a closer look at \`\`devtool add\`\``" sect
 in the Yocto Project Application Development and the Extensible Software
 Development Kit (eSDK) manual.
 
-.. _new-recipe-creating-the-base-recipe-using-recipetool:
-
 Creating the Base Recipe Using ``recipetool create``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -1213,8 +1187,6 @@ Following are some syntax examples:
 
       recipetool create -d -o OUTFILE source
 
-.. _new-recipe-locating-and-using-a-similar-recipe:
-
 Locating and Using a Similar Recipe
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -1254,8 +1226,6 @@ get started. Here are some points on both methods:
 
       SRC_URI = ""
 
-.. _new-recipe-storing-and-naming-the-recipe:
-
 Storing and Naming the Recipe
 -----------------------------
 
@@ -1298,8 +1268,6 @@ the recipe.
       gawk_4.0.2.bb
       irssi_0.8.16-rc1.bb
 
-.. _new-recipe-running-a-build-on-the-recipe:
-
 Running a Build on the Recipe
 -----------------------------
 
@@ -1354,8 +1322,6 @@ You can find more information about the build process in
 ":doc:`../overview-manual/overview-manual-development-environment`"
 chapter of the Yocto Project Overview and Concepts Manual.
 
-.. _new-recipe-fetching-code:
-
 Fetching Code
 -------------
 
@@ -1490,8 +1456,6 @@ compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
 The build system automatically applies patches as described in the
 "`Patching Code <#new-recipe-patching-code>`__" section.
 
-.. _new-recipe-unpacking-code:
-
 Unpacking Code
 --------------
 
@@ -1512,8 +1476,6 @@ If processing your recipe using BitBake successfully unpacks the source
 files, you need to be sure that the directory pointed to by ``${S}``
 matches the structure of the source.
 
-.. _new-recipe-patching-code:
-
 Patching Code
 -------------
 
@@ -1539,8 +1501,6 @@ named the same as the base name of the recipe
 (:term:`BP` and
 :term:`BPN`) or "files".
 
-.. _new-recipe-licensing:
-
 Licensing
 ---------
 
@@ -1597,8 +1557,6 @@ variables:
    correct string that you can substitute into the recipe file for a
    subsequent build.
 
-.. _new-dependencies:
-
 Dependencies
 ------------
 
@@ -1645,8 +1603,6 @@ system will automatically add a runtime dependency to "mypackage" on
 section in the Yocto Project Overview and Concepts Manual for further
 details.
 
-.. _new-recipe-configuring-the-recipe:
-
 Configuring the Recipe
 ----------------------
 
@@ -1741,8 +1697,6 @@ the software you are building, you can consult the output of the
 ``./configure --help`` command within ``${S}`` or consult the software's
 upstream documentation.
 
-.. _new-recipe-using-headers-to-interface-with-devices:
-
 Using Headers to Interface with Devices
 ---------------------------------------
 
@@ -1802,8 +1756,6 @@ out-of-tree modules. Your recipe will also need the following:
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
-.. _new-recipe-compilation:
-
 Compilation
 -----------
 
@@ -1867,8 +1819,6 @@ Here are some common issues that cause failures.
    ``STAGING_BINDIR``, ``STAGING_INCDIR``, ``STAGING_DATADIR``, and so
    forth).
 
-.. _new-recipe-installing:
-
 Installing
 ----------
 
@@ -1956,8 +1906,6 @@ installed correctly.
       files to ``${D}${datadir}/cmake/Modules`` during
       :ref:`ref-tasks-install`.
 
-.. _new-recipe-enabling-system-services:
-
 Enabling System Services
 ------------------------
 
@@ -2009,8 +1957,6 @@ different ways:
    section for
    more information.
 
-.. _new-recipe-packaging:
-
 Packaging
 ---------
 
@@ -2089,8 +2035,6 @@ take. The following list describes the process:
    target machine, particularly if you run separate builds for more than
    one target machine.
 
-.. _new-sharing-files-between-recipes:
-
 Sharing Files Between Recipes
 -----------------------------
 
@@ -2137,8 +2081,6 @@ For a more complete description of the
 task and its associated functions, see the
 :ref:`staging <ref-classes-staging>` class.
 
-.. _metadata-virtual-providers:
-
 Using Virtual Providers
 -----------------------
 
@@ -2251,8 +2193,6 @@ example:
    REALPV = "0.8.16-rc1"
    PV = "0.8.15+${REALPV}"
 
-.. _new-recipe-post-installation-scripts:
-
 Post-Installation Scripts
 -------------------------
 
@@ -2313,8 +2253,6 @@ script to first boot is undesirable and for read-only rootfs impossible.
    because of when they run, they are not applicable to being run at image
    creation time like ``pkg_postinst``.
 
-.. _new-recipe-testing:
-
 Testing
 -------
 
@@ -2326,8 +2264,6 @@ For information on how to customize your image by adding specific
 packages, see the "`Customizing
 Images <#usingpoky-extend-customimage>`__" section.
 
-.. _new-recipe-testing-examples:
-
 Examples
 --------
 
@@ -2344,8 +2280,6 @@ examples given various scenarios:
 
 -  Adding binaries to an image
 
-.. _new-recipe-single-c-file-package-hello-world:
-
 Single .c File Package (Hello World!)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -2382,8 +2316,6 @@ customize the packaging process, see the "`Splitting an Application into
 Multiple Packages <#splitting-an-application-into-multiple-packages>`__"
 section.
 
-.. _new-recipe-autotooled-package:
-
 Autotooled Package
 ~~~~~~~~~~~~~~~~~~
 
@@ -2413,8 +2345,6 @@ changes as described in the
 the Yocto Project Overview and Concepts Manual. You can quickly create
 Autotool-based recipes in a manner similar to the previous example.
 
-.. _new-recipe-makefile-based-package:
-
 Makefile-Based Package
 ~~~~~~~~~~~~~~~~~~~~~~
 
@@ -2864,8 +2794,6 @@ in the BitBake User Manual.
    might wish to use. If in doubt, you should check with multiple
    implementations - including those from BusyBox.
 
-.. _platdev-newmachine:
-
 Adding a New Machine
 ====================
 
@@ -2885,8 +2813,6 @@ For a complete example that shows how to add a new machine, see the
 section in the Yocto Project Board Support Package (BSP) Developer's
 Guide.
 
-.. _platdev-newmachine-conffile:
-
 Adding the Machine Configuration File
 -------------------------------------
 
@@ -2920,8 +2846,6 @@ You can find full details on these variables in the reference section.
 You can leverage existing machine ``.conf`` files from
 ``meta-yocto-bsp/conf/machine/``.
 
-.. _platdev-newmachine-kernel:
-
 Adding a Kernel for the Machine
 -------------------------------
 
@@ -2956,8 +2880,6 @@ For more information on ``defconfig`` files, see the
 ":ref:`kernel-dev/kernel-dev-common:changing the configuration`"
 section in the Yocto Project Linux Kernel Development Manual.
 
-.. _platdev-newmachine-formfactor:
-
 Adding a Formfactor Configuration File
 --------------------------------------
 
@@ -2990,8 +2912,6 @@ Following is an example for "qemuarm" machine:
    DISPLAY_DPI=150
    DISPLAY_SUBPIXEL_ORDER=vrgb
 
-.. _gs-upgrading-recipes:
-
 Upgrading Recipes
 =================
 
@@ -3011,8 +2931,6 @@ automatic version upgrades. Alternatively, you can use
 ``devtool upgrade`` to set up semi-automatic version upgrades. Finally,
 you can manually upgrade a recipe by editing the recipe itself.
 
-.. _gs-using-the-auto-upgrade-helper:
-
 Using the Auto Upgrade Helper (AUH)
 -----------------------------------
 
@@ -3207,8 +3125,6 @@ a cron job. See the
 :yocto_git:`weeklyjob.sh </cgit/cgit.cgi/auto-upgrade-helper/tree/weeklyjob.sh>`
 file distributed with the utility for an example.
 
-.. _gs-using-devtool-upgrade:
-
 Using ``devtool upgrade``
 -------------------------
 
@@ -3350,8 +3266,6 @@ Using the ``devtool finish`` command cleans up the workspace and creates a patch
 file based on your commits. The tool puts all patch files back into the
 source directory in a sub-directory named ``nano`` in this case.
 
-.. _dev-manually-upgrading-a-recipe:
-
 Manually Upgrading a Recipe
 ---------------------------
 
@@ -3419,8 +3333,6 @@ To manually upgrade recipe versions, follow these general steps:
    builds work and any testing is successful, you can create commits for
    any changes in the layer holding your upgraded recipe.
 
-.. _finding-the-temporary-source-code:
-
 Finding Temporary Source Code
 =============================
 
@@ -3491,8 +3403,6 @@ build system uses to build the package would be as follows:
 
    poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
-.. _using-a-quilt-workflow:
-
 Using Quilt in Your Workflow
 ============================
 
@@ -3587,8 +3497,6 @@ Follow these general steps:
 
       SRC_URI += "file://my_changes.patch"
 
-.. _platdev-appdev-devshell:
-
 Using a Development Shell
 =========================
 
@@ -3671,8 +3579,6 @@ terminal window.
    -  It is also worth noting that ``devshell`` still works over X11
       forwarding and similar situations.
 
-.. _platdev-appdev-devpyshell:
-
 Using a Development Python Shell
 ================================
 
@@ -3720,8 +3626,6 @@ controls what type of shell is opened.
 When you are finished using ``devpyshell``, you can exit the shell
 either by using Ctrl+d or closing the terminal window.
 
-.. _dev-building:
-
 Building
 ========
 
@@ -3729,8 +3633,6 @@ This section describes various build procedures. For example, the steps
 needed for a simple build, a target that uses multiple configurations,
 building an image for more than one machine, and so forth.
 
-.. _dev-building-a-simple-image:
-
 Building a Simple Image
 -----------------------
 
@@ -3833,8 +3735,6 @@ The following figure and list overviews the build process:
    information about how to install these images, see the documentation
    for your particular board or machine.
 
-.. _dev-building-images-for-multiple-targets-using-multiple-configurations:
-
 Building Images for Multiple Targets Using Multiple Configurations
 ------------------------------------------------------------------
 
@@ -3848,8 +3748,6 @@ This section describes how to set up for multiple configuration builds
 and how to account for cross-build dependencies between the
 multiconfigs.
 
-.. _dev-setting-up-and-running-a-multiple-configuration-build:
-
 Setting Up and Running a Multiple Configuration Build
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -3942,8 +3840,6 @@ Follow these steps to set up and execute multiple configuration builds:
    directories, the build either loads from an existing sstate cache for
    that build at the start or builds the object fresh.
 
-.. _dev-enabling-multiple-configuration-build-dependencies:
-
 Enabling Multiple Configuration Build Dependencies
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -4003,8 +3899,6 @@ and have separate configuration files, BitBake places the artifacts for
 each build in the respective temporary build directories (i.e.
 :term:`TMPDIR`).
 
-.. _building-an-initramfs-image:
-
 Building an Initial RAM Filesystem (initramfs) Image
 ----------------------------------------------------
 
@@ -4095,8 +3989,6 @@ distribution to even smaller sizes than the ``poky-tiny`` distribution,
 which is around 5 Mbytes, that can be built out-of-the-box using the
 Yocto Project.
 
-.. _tiny-system-overview:
-
 Tiny System Overview
 ~~~~~~~~~~~~~~~~~~~~
 
@@ -4145,8 +4037,6 @@ very small distributions:
    information on how to create layers, see the "`Understanding and
    Creating Layers <#understanding-and-creating-layers>`__" section.
 
-.. _understand-what-gives-your-image-size:
-
 Understand What Contributes to Your Image Size
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -4812,8 +4702,6 @@ that can help you speed up the build:
          the static libraries. If so, you might need to exclude them as
          well.
 
-.. _platdev-working-with-libraries:
-
 Working With Libraries
 ======================
 
@@ -4889,8 +4777,6 @@ how the static library files are defined:
    SECTION_${PN}-staticdev = "devel"
    RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
-.. _combining-multiple-versions-library-files-into-one-image:
-
 Combining Multiple Versions of Library Files into One Image
 -----------------------------------------------------------
 
@@ -5299,8 +5185,6 @@ The following know issues exist for GObject Introspection Support:
    under 32-bit host machines. In particular, "qemumips64" is known to
    not work under i686.
 
-.. _dev-optionally-using-an-external-toolchain:
-
 Optionally Using an External Toolchain
 ======================================
 
@@ -5368,8 +5252,6 @@ you need to have in place to run the tool, provides instruction on how
 to use the Wic utility, provides information on using the Wic plugins
 interface, and provides several examples that show how to use Wic.
 
-.. _wic-background:
-
 Background
 ----------
 
@@ -5395,8 +5277,6 @@ this information is required to use Wic, you might find it interesting.
    general-purpose partitioning language, which is based on Redhat
    kickstart syntax.
 
-.. _wic-requirements:
-
 Requirements
 ------------
 
@@ -5435,8 +5315,6 @@ system needs to meet the following requirements:
 -  Include the name of the :ref:`wic kickstart file <openembedded-kickstart-wks-reference>`
    as part of the :term:`WKS_FILE` variable
 
-.. _wic-getting-help:
-
 Getting Help
 ------------
 
@@ -5610,8 +5488,6 @@ The general form of the ``wic`` command using Cooked Mode is as follows:
                                 name of the image to use the artifacts from e.g. core-
                                 image-sato
 
-.. _using-a-provided-kickstart-file:
-
 Using an Existing Kickstart File
 --------------------------------
 
@@ -5661,8 +5537,6 @@ Here are the actual partition language commands used in the
 
    bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
 
-.. _wic-using-the-wic-plugin-interface:
-
 Using the Wic Plugin Interface
 ------------------------------
 
@@ -5802,8 +5676,6 @@ by filling up a dict with keys that contain the method names of
 interest. On success, these will be filled in with the actual methods.
 See the Wic implementation for examples and details.
 
-.. _wic-usage-examples:
-
 Wic Examples
 ------------
 
@@ -5813,8 +5685,6 @@ utility. All the examples assume the list of requirements in the
 examples assume the previously generated image is
 ``core-image-minimal``.
 
-.. _generate-an-image-using-a-provided-kickstart-file:
-
 Generate an Image using an Existing Kickstart File
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -6495,8 +6365,6 @@ Changing the listed common targets is as easy as editing your version of
 ``conf-notes.txt`` in your custom template configuration directory and
 making sure you have ``TEMPLATECONF`` set to your directory.
 
-.. _dev-saving-memory-during-a-build:
-
 Conserving Disk Space During Builds
 ===================================
 
@@ -6573,8 +6441,6 @@ Yocto Project Reference Manual's glossary chapter.
    prevent the installation of a package whose presence is required by
    an installed package.
 
-.. _incrementing-a-binary-package-version:
-
 Incrementing a Package Version
 ------------------------------
 
@@ -6777,8 +6643,6 @@ Guidelines <https://www.debian.org/doc/debian-policy/ch-controlfields.html>`__.
 These guidelines define how versions are compared and what "increasing"
 a version means.
 
-.. _automatically-incrementing-a-binary-package-revision-number:
-
 Automatically Incrementing a Package Version Number
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -7077,8 +6941,6 @@ use of runtime package management, you need to do a couple things above
 and beyond the basics. The remainder of this section describes what you
 need to do.
 
-.. _runtime-package-management-build:
-
 Build Considerations
 ~~~~~~~~~~~~~~~~~~~~
 
@@ -7165,8 +7027,6 @@ When your build is complete, your packages reside in the
 ``tmp`` and your selected package type is RPM, then your RPM packages
 are available in ``tmp/deploy/rpm``.
 
-.. _runtime-package-management-server:
-
 Host or Server Machine Setup
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -7193,16 +7053,12 @@ setting of "package_rpm":
    $ cd ~/poky/build/tmp/deploy/rpm
    $ python3 -m http.server
 
-.. _runtime-package-management-target:
-
 Target Setup
 ~~~~~~~~~~~~
 
 Setting up the target differs depending on the package management
 system. This section provides information for RPM, IPK, and DEB.
 
-.. _runtime-package-management-target-rpm:
-
 Using RPM
 ^^^^^^^^^
 
@@ -7283,8 +7139,6 @@ upgrade packages from the specified repository or repositories.
    See the `DNF documentation <https://dnf.readthedocs.io/en/latest/>`__ for
    additional information.
 
-.. _runtime-package-management-target-ipk:
-
 Using IPK
 ^^^^^^^^^
 
@@ -7325,8 +7179,6 @@ repository information:
 The ``opkg`` application is now able to find, install, and upgrade packages
 from the specified repository.
 
-.. _runtime-package-management-target-deb:
-
 Using DEB
 ^^^^^^^^^
 
@@ -7583,8 +7435,6 @@ method.
 
 Additionally, some requirements and caveats exist.
 
-.. _npm-package-creation-requirements:
-
 Requirements and Caveats
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -7619,8 +7469,6 @@ NPM packages:
    useful to have NPM on your target. The NPM package name is
    ``nodejs-npm``.
 
-.. _npm-using-the-registry-modules-method:
-
 Using the Registry Modules Method
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -7731,8 +7579,6 @@ go to ``http://192.168.7.2:3000`` and you see the following:
 You can find the recipe in ``workspace/recipes/cute-files``. You can use
 the recipe in any layer you choose.
 
-.. _npm-using-the-npm-projects-method:
-
 Using the NPM Projects Code Method
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -7956,8 +7802,6 @@ image cannot use this package group. However, it can install SysVinit
 and the appropriate packages will have support for both systemd and
 SysVinit.
 
-.. _selecting-dev-manager:
-
 Selecting a Device Manager
 ==========================
 
@@ -7974,8 +7818,6 @@ The Yocto Project provides multiple ways to manage the device manager
    configuration of device nodes is done in user space by a device
    manager like ``udev`` or ``busybox-mdev``.
 
-.. _static-dev-management:
-
 Using Persistent and Pre-Populated\ ``/dev``
 --------------------------------------------
 
@@ -8002,8 +7844,6 @@ If you do not define the ``IMAGE_DEVICE_TABLES`` variable, the default
 The population is handled by the ``makedevs`` utility during image
 creation:
 
-.. _devtmpfs-dev-management:
-
 Using ``devtmpfs`` and a Device Manager
 ---------------------------------------
 
@@ -8036,8 +7876,6 @@ your ``local.conf`` configuration file:
    # VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
    # VIRTUAL-RUNTIME_dev_manager = "systemd"
 
-.. _platdev-appdev-srcrev:
-
 Using an External SCM
 =====================
 
@@ -8628,8 +8466,6 @@ hardware, you have to take different steps to enable the tests. See the
 following subsections for information on how to enable both types of
 tests.
 
-.. _qemu-image-enabling-tests:
-
 Enabling Runtime Tests on QEMU
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -8714,8 +8550,6 @@ Once you start running the tests, the following happens:
    You can find the output from the ``unittest`` in the task log at
    ``${WORKDIR}/temp/log.do_testimage``.
 
-.. _hardware-image-enabling-tests:
-
 Enabling Runtime Tests on Hardware
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -8931,8 +8765,6 @@ wrapper, simply prefix the terminal command with
 
    TEST_SERIALCONTROL_CMD = "${COREBASE}/scripts/contrib/serdevtry picocom -b 115200 /dev/ttyUSB0"
 
-.. _qemu-image-running-tests:
-
 Running Tests
 -------------
 
@@ -9077,8 +8909,6 @@ the build environment using the following:
    $ cd tmp/testexport/core-image-sato
    $ ./runexported.py testdata.json
 
-.. _qemu-image-writing-new-tests:
-
 Writing New Tests
 -----------------
 
@@ -9110,8 +8940,6 @@ You will notice that all test classes inherit ``oeRuntimeTest``, which
 is found in ``meta/lib/oetest.py``. This base class offers some helper
 attributes, which are described in the following sections:
 
-.. _qemu-image-writing-tests-class-methods:
-
 Class Methods
 ~~~~~~~~~~~~~
 
@@ -9125,8 +8953,6 @@ Class methods are as follows:
    :term:`IMAGE_FEATURES` or
    :term:`DISTRO_FEATURES`.
 
-.. _qemu-image-writing-tests-class-attributes:
-
 Class Attributes
 ~~~~~~~~~~~~~~~~
 
@@ -9174,8 +9000,6 @@ Class attributes are as follows:
       -  *copy_from(remotepath, localpath):*
          ``scp root@host:remotepath localpath``.
 
-.. _qemu-image-writing-tests-instance-attributes:
-
 Instance Attributes
 ~~~~~~~~~~~~~~~~~~~
 
@@ -9241,8 +9065,6 @@ Once the test is complete, the packages are removed from the DUT.
          ]
      }
 
-.. _usingpoky-debugging-tools-and-techniques:
-
 Debugging Tools and Techniques
 ==============================
 
@@ -9333,8 +9155,6 @@ section:
 -  "`Other Debugging Tips <#dev-other-debugging-others>`__" describes
    miscellaneous debugging tips that can be useful.
 
-.. _dev-debugging-viewing-logs-from-failed-tasks:
-
 Viewing Logs from Failed Tasks
 ------------------------------
 
@@ -9354,8 +9174,6 @@ links to ``log.do_``\ `taskname`\ ``.``\ `pid` and
 when it ran. The symlinks always point to the files corresponding to the
 most recent run.
 
-.. _dev-debugging-viewing-variable-values:
-
 Viewing Variable Values
 -----------------------
 
@@ -9477,8 +9295,6 @@ facility:
    $ oe-pkgdata-util --help
    $ oe-pkgdata-util subcommand --help
 
-.. _dev-viewing-dependencies-between-recipes-and-tasks:
-
 Viewing Dependencies Between Recipes and Tasks
 ----------------------------------------------
 
@@ -9545,8 +9361,6 @@ This command
 displays a GUI window from which you can view build-time and runtime
 dependencies for the recipes involved in building recipename.
 
-.. _dev-viewing-task-variable-dependencies:
-
 Viewing Task Variable Dependencies
 ----------------------------------
 
@@ -9638,8 +9452,6 @@ Using BitBake with either of these options causes BitBake to dump out
 ``sigdata`` files in the ``stamps`` directory for every task it would
 have executed instead of building the specified target package.
 
-.. _dev-viewing-metadata-used-to-create-the-input-signature-of-a-shared-state-task:
-
 Viewing Metadata Used to Create the Input Signature of a Shared State Task
 --------------------------------------------------------------------------
 
@@ -9655,8 +9467,6 @@ For conceptual information on shared state, see the
 ":ref:`overview-manual/overview-manual-concepts:shared state`"
 section in the Yocto Project Overview and Concepts Manual.
 
-.. _dev-invalidating-shared-state-to-force-a-task-to-run:
-
 Invalidating Shared State to Force a Task to Run
 ------------------------------------------------
 
@@ -9703,8 +9513,6 @@ the build system to run the task again.
    shared state, see this
    :yocto_git:`commit </cgit.cgi/poky/commit/meta/classes/package.bbclass?id=737f8bbb4f27b4837047cb9b4fbfe01dfde36d54>`.
 
-.. _dev-debugging-taskrunning:
-
 Running Specific Tasks
 ----------------------
 
@@ -9812,8 +9620,6 @@ You can view a list of tasks in a given package by running the
 The results appear as output to the console and are also in
 the file ``${WORKDIR}/temp/log.do_listtasks``.
 
-.. _dev-debugging-bitbake:
-
 General BitBake Problems
 ------------------------
 
@@ -9827,8 +9633,6 @@ chose a certain version of a package or why BitBake picked a certain
 provider. This command could also help you in a situation where you
 think BitBake did something unexpected.
 
-.. _dev-debugging-buildfile:
-
 Building with No Dependencies
 -----------------------------
 
@@ -10190,8 +9994,6 @@ problem is taken care of at its source. See the "`Submitting a Change to
 the Yocto Project <#how-to-submit-a-change>`__" section for more
 information.
 
-.. _platdev-gdb-remotedebug:
-
 Debugging With the GNU Project Debugger (GDB) Remotely
 ------------------------------------------------------
 
@@ -10453,8 +10255,6 @@ To support this kind of debugging, you need do the following:
    Consider that this will reduce the application's performance and is
    recommended only for debugging purposes.
 
-.. _dev-other-debugging-others:
-
 Other Debugging Tips
 --------------------
 
@@ -10596,8 +10396,6 @@ categorization, progress, or comments on the bug result in Bugzilla
 sending you an automated email concerning the particular change or
 progress to the bug.
 
-.. _how-to-submit-a-change:
-
 Submitting a Change to the Yocto Project
 ----------------------------------------
 
@@ -10691,8 +10489,6 @@ layers you are contributing to.
 
 The following sections provide procedures for submitting a change.
 
-.. _preparing-changes-for-submissions:
-
 Preparing Changes for Submission
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -10776,8 +10572,6 @@ Preparing Changes for Submission
 
          detailed description of change
 
-.. _submitting-a-patch:
-
 Using Email to Submit a Patch
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -10868,8 +10662,6 @@ reduce the burden of patch review on maintainers.
    Asking about the status of a patch or change is reasonable if the change
    has been idle for a while with no feedback.
 
-.. _pushing-a-change-upstream:
-
 Using Scripts to Push a Change Upstream and Request a Pull
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -11077,8 +10869,6 @@ licensing text and covers how to maintain open source license compliance
 during your project's lifecycle. The section also describes how to
 enable commercially licensed recipes, which by default are disabled.
 
-.. _usingpoky-configuring-LIC_FILES_CHKSUM:
-
 Tracking License Changes
 ------------------------
 
@@ -11089,8 +10879,6 @@ variable tracks changes to the license text. The checksums are validated
 at the end of the configure step, and if the checksums do not match, the
 build will fail.
 
-.. _usingpoky-specifying-LIC_FILES_CHKSUM:
-
 Specifying the ``LIC_FILES_CHKSUM`` Variable
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -11134,8 +10922,6 @@ five through 16 as license text. The second line refers to a file in
 Note that ``LIC_FILES_CHKSUM`` variable is mandatory for all recipes,
 unless the ``LICENSE`` variable is set to "CLOSED".
 
-.. _usingpoky-LIC_FILES_CHKSUM-explanation-of-syntax:
-
 Explanation of Syntax
 ~~~~~~~~~~~~~~~~~~~~~
 
@@ -11704,8 +11490,6 @@ If you want to set up your own error reporting server, you can obtain
 the code from the Git repository at :yocto_git:`/cgit/cgit.cgi/error-report-web/`.
 Instructions on how to set it up are in the README document.
 
-.. _dev-using-wayland-and-weston:
-
 Using Wayland and Weston
 ========================
 
@@ -11748,8 +11532,6 @@ Enabling Wayland in an Image
 To enable Wayland, you need to enable it to be built and enable it to be
 included (installed) in the image.
 
-.. _enable-building:
-
 Building Wayland
 ~~~~~~~~~~~~~~~~
 
@@ -11768,8 +11550,6 @@ statement in your ``local.conf`` file:
    If X11 has been enabled elsewhere, Weston will build Wayland with X11
    support
 
-.. _enable-installation-in-an-image:
-
 Installing Wayland and Weston
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
index 05136f735..9bbac9610 100644
--- a/documentation/dev-manual/dev-manual-intro.rst
+++ b/documentation/dev-manual/dev-manual-intro.rst
@@ -4,8 +4,6 @@
 The Yocto Project Development Tasks Manual
 ******************************************
 
-.. _dev-welcome:
-
 Welcome
 =======
 
diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index 63640411d..4e58fc1b6 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -10,8 +10,6 @@ This chapter provides both procedures that show you how to use the Quick
 EMUlator (QEMU) and other QEMU information helpful for development
 purposes.
 
-.. _qemu-dev-overview:
-
 Overview
 ========
 
@@ -39,8 +37,6 @@ following references:
 -  `Documentation <https://wiki.qemu.org/Manual>`__\ *:* The QEMU user
    manual.
 
-.. _qemu-running-qemu:
-
 Running QEMU
 ============
 
@@ -187,8 +183,6 @@ allow input of absolute coordinates. This default means that the mouse
 can enter and leave the main window without the grab taking effect
 leading to a better user experience.
 
-.. _qemu-running-under-a-network-file-system-nfs-server:
-
 Running Under a Network File System (NFS) Server
 ================================================
 
@@ -243,8 +237,6 @@ using an NFS server.
 
          runqemu-export-rootfs restart file-system-location
 
-.. _qemu-kvm-cpu-compatibility:
-
 QEMU CPU Compatibility Under KVM
 ================================
 
@@ -266,8 +258,6 @@ directory. This setting specifies a ``-cpu`` option passed into QEMU in
 the ``runqemu`` script. Running ``qemu -cpu help`` returns a list of
 available supported CPU types.
 
-.. _qemu-dev-performance:
-
 QEMU Performance
 ================
 
@@ -320,8 +310,6 @@ present, the toolchain is also automatically used.
       Server <#qemu-running-under-a-network-file-system-nfs-server>`__"
       section for more information.
 
-.. _qemu-dev-command-line-syntax:
-
 QEMU Command-Line Syntax
 ========================
 
@@ -377,8 +365,6 @@ Following is the command-line help output for the ``runqemu`` command:
      runqemu path/to/<image>-<machine>.wic
      runqemu path/to/<image>-<machine>.wic.vmdk
 
-.. _qemu-dev-runqemu-command-line-options:
-
 ``runqemu`` Command-Line Options
 ================================
 
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index a85b86fbf..f768f092b 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -11,8 +11,6 @@ host <dev-manual/dev-manual-start:preparing the build host>`, how to locate
 Yocto Project source repositories, and how to create local Git
 repositories.
 
-.. _usingpoky-changes-collaborate:
-
 Creating a Team Development Environment
 =======================================
 
@@ -261,8 +259,6 @@ particular working environment and set of practices.
        of the available mailing lists, see the ":ref:`resources-mailinglist`" section in
        the Yocto Project Reference Manual.
 
-.. _dev-preparing-the-build-host:
-
 Preparing the Build Host
 ========================
 
@@ -352,8 +348,6 @@ Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`../kernel-de
 Toaster, see the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
 section in the Toaster User Manual.
 
-.. _setting-up-to-use-crops:
-
 Setting Up to Use CROss PlatformS (CROPS)
 -----------------------------------------
 
@@ -454,8 +448,6 @@ Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`../toaster-manual/toaster-manual-setup-and-use`"
 section in the Toaster User Manual.
 
-.. _setting-up-to-use-wsl:
-
 Setting Up to Use Windows Subsystem For Linux (WSLv2)
 -----------------------------------------------------
 
@@ -855,8 +847,6 @@ and then specifically check out that development branch.
         master
         * &DISTRO_NAME_NO_CAP;
 
-.. _checkout-out-by-tag-in-poky:
-
 Checking Out by Tag in Poky
 ---------------------------
 
-- 
2.29.2

