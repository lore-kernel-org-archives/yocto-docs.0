Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.4193.1607031544476943647
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sibJOi1l;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id k14so3387407wrn.1
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMFHF0eRfY9KzkiTLItO2iepXTbwRf8AZSlIJ9lUd4E=;
        b=sibJOi1lxC/CE7c/APagEWuI0x9loN40qzfrLfACSJy7TA62/+VSnMUWMKyOP8PB9Q
         +AMnVZXhJjPrcFPrVGyb0ArkK5WuLoNUnrl9GI8zeYYeu1+yOqeYvIHKrQlLtu/Ql5GF
         P3PvMXU1FVmtGwWq0nUuPej68hPvL3zuWBRFwmqOyRba1/ie0i8J5YjopUPKn+XR0cEf
         RLMmc7SThU6koWcaxn2/ax/HBctTg/PIMHlrP49Dh76PLOI8FeOpluwI4OXAuSIIDLkY
         yrZG/0WUtITaxOIcKtYSUZKvRQ+COU0r4kEPcQ0yeBHuhD8gG/nhC8WsJ4/aWRBpnfjB
         D/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMFHF0eRfY9KzkiTLItO2iepXTbwRf8AZSlIJ9lUd4E=;
        b=Oyzg368H0pmmMYiQ5EQNjFhmgBGj7v8wHv+05z48inYocjCYPPhHBaHG2Cuky8p0VG
         09FsJBMcKL48Ze0b3yeKBy4KwxDpxNVIhDWiiyf8Hxh6/QKnW/q7WIm7fRYA63uuAdod
         GAw0Ysjn2q5et+3jHC5Fy+KNivhcJnPgELy3WfQ1WGJHVbkljie5YLlLVzRiVxumW73Y
         v0zW2GjRcUBgmCicKkCtPF5i5TAD9daWv1uTwFFVYckjOD9DV5kuOixl/Ks0R2XZFj2N
         AKgyl5hL6lap45eBjslqjdeAlXqAa9Sgcqe23bFRCxoHI2MQssY3O4CPCmXrHwhzXSXl
         cx0g==
X-Gm-Message-State: AOAM5322QfXN32C6JmtZd+PAzfeI4050P2UwE9/BRwgpgkVuk1ZDXqyX
	fIVv9GbQskRJ28afEuYlLRU/pi1IuJAga/DQ
X-Google-Smtp-Source: ABdhPJx7kZrbBYPnP51z2oz4bleuZIQLuEztW8ElpJEq/oF71HzYy2486n5QATUFSAxkMy0dTpkYcA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr1280399wrq.401.1607031541307;
        Thu, 03 Dec 2020 13:39:01 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:39:00 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 06/10] kernel-dev: remove 'kernel-dev' from filenames
Date: Thu,  3 Dec 2020 22:38:39 +0100
Message-Id: <20201203213843.347671-7-nicolas.dechesne@linaro.org>
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
 documentation/bsp-guide/bsp.rst               |  4 +-
 documentation/dev-manual/common-tasks.rst     |  4 +-
 documentation/dev-manual/start.rst            |  2 +-
 .../{kernel-dev-advanced.rst => advanced.rst} | 18 +++----
 .../{kernel-dev-common.rst => common.rst}     | 48 +++++++++----------
 ...ev-concepts-appx.rst => concepts-appx.rst} | 14 +++---
 .../{kernel-dev-faq.rst => faq.rst}           |  8 ++--
 documentation/kernel-dev/index.rst            | 12 ++---
 .../{kernel-dev-intro.rst => intro.rst}       | 16 +++----
 ...rnel-dev-maint-appx.rst => maint-appx.rst} |  2 +-
 .../overview-manual-concepts.rst              |  2 +-
 ...verview-manual-development-environment.rst |  2 +-
 documentation/ref-manual/ref-classes.rst      |  2 +-
 documentation/ref-manual/ref-tasks.rst        |  8 ++--
 documentation/ref-manual/ref-variables.rst    | 14 +++---
 15 files changed, 78 insertions(+), 78 deletions(-)
 rename documentation/kernel-dev/{kernel-dev-advanced.rst => advanced.rst} (97%)
 rename documentation/kernel-dev/{kernel-dev-common.rst => common.rst} (97%)
 rename documentation/kernel-dev/{kernel-dev-concepts-appx.rst => concepts-appx.rst} (97%)
 rename documentation/kernel-dev/{kernel-dev-faq.rst => faq.rst} (89%)
 rename documentation/kernel-dev/{kernel-dev-intro.rst => intro.rst} (91%)
 rename documentation/kernel-dev/{kernel-dev-maint-appx.rst => maint-appx.rst} (99%)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 6d3ccd49b..e20df3f6b 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -693,7 +693,7 @@ BSP settings to the kernel, thus configuring the kernel for your
 particular BSP.
 
 You can find more information on what your append file should contain in
-the ":ref:`kernel-dev/kernel-dev-common:creating the append file`" section
+the ":ref:`kernel-dev/common:creating the append file`" section
 in the Yocto Project Linux Kernel Development Manual.
 
 An alternate scenario is when you create your own kernel recipe for the
@@ -1197,7 +1197,7 @@ Use these steps to create a BSP layer:
    ``recipes-kernel/linux`` by either using a kernel append file or a
    new custom kernel recipe file (e.g. ``yocto-linux_4.12.bb``). The BSP
    layers mentioned in the previous step also contain different kernel
-   examples. See the ":ref:`kernel-dev/kernel-dev-common:modifying an existing recipe`"
+   examples. See the ":ref:`kernel-dev/common:modifying an existing recipe`"
    section in the Yocto Project Linux Kernel Development Manual for
    information on how to create a custom kernel.
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index c627491f3..fe3667bfb 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2874,7 +2874,7 @@ the ``SRC_URI`` and adding the machine to the expression in
    COMPATIBLE_MACHINE = '(qemux86|qemumips)'
 
 For more information on ``defconfig`` files, see the
-":ref:`kernel-dev/kernel-dev-common:changing the configuration`"
+":ref:`kernel-dev/common:changing the configuration`"
 section in the Yocto Project Linux Kernel Development Manual.
 
 Adding a Formfactor Configuration File
@@ -4084,7 +4084,7 @@ view file dependencies in a human-readable form:
    directory.
 
    For more information on configuration fragments, see the
-   ":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`"
+   ":ref:`kernel-dev/common:creating configuration fragments`"
    section in the Yocto Project Linux Kernel Development Manual.
 
 -  ``bitbake -u taskexp -g bitbake_target``: Using the BitBake command
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 85ec97b9e..8244d68ed 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -288,7 +288,7 @@ Package (BSP) development and kernel development:
    section in the Yocto Project Board Support Package (BSP) Developer's
    Guide.
 
--  *Kernel Development:* See the ":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
+-  *Kernel Development:* See the ":ref:`kernel-dev/common:preparing the build host to work on the kernel`"
    section in the Yocto Project Linux Kernel Development Manual.
 
 Setting Up a Native Linux Host
diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/advanced.rst
similarity index 97%
rename from documentation/kernel-dev/kernel-dev-advanced.rst
rename to documentation/kernel-dev/advanced.rst
index ddb31edca..163560b69 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -243,7 +243,7 @@ two files: ``smp.scc`` and ``smp.cfg``. You can find these files in the
       CONFIG_X86_BIGSMP=y
 
 You can find general information on configuration
-fragment files in the ":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`" section.
+fragment files in the ":ref:`kernel-dev/common:creating configuration fragments`" section.
 
 Within the ``smp.scc`` file, the
 :term:`KFEATURE_DESCRIPTION`
@@ -264,7 +264,7 @@ non-hardware fragment.
    fragment.
 
 As described in the
-":ref:`kernel-dev/kernel-dev-common:validating configuration`" section, you can
+":ref:`kernel-dev/common:validating configuration`" section, you can
 use the following BitBake command to audit your configuration:
 ::
 
@@ -325,8 +325,8 @@ for the five patches in the directory.
 
 You can create a typical ``.patch`` file using ``diff -Nurp`` or
 ``git format-patch`` commands. For information on how to create patches,
-see the ":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
-and ":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
+see the ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
+and ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 sections.
 
 Features
@@ -388,7 +388,7 @@ type as follows:
    You can find kernel recipes in the ``meta/recipes-kernel/linux`` directory
    of the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
    (e.g. ``poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb``). See the
-   ":ref:`kernel-dev/kernel-dev-advanced:using kernel metadata in a recipe`"
+   ":ref:`kernel-dev/advanced:using kernel metadata in a recipe`"
    section for more information.
 
 Three kernel types ("standard", "tiny", and "preempt-rt") are supported
@@ -453,7 +453,7 @@ and ``patch`` commands, respectively.
    It is not strictly necessary to create a kernel type ``.scc``
    file. The Board Support Package (BSP) file can implicitly define the
    kernel type using a ``define`` :term:`KTYPE` ``myktype`` line. See the
-   ":ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`" section for more
+   ":ref:`kernel-dev/advanced:bsp descriptions`" section for more
    information.
 
 BSP Descriptions
@@ -555,7 +555,7 @@ You can see that in the BeagleBone example with the following:
    include beaglebone.scc
 
 For information on how to break a complete ``.config`` file into the various
-configuration fragments, see the ":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`" section.
+configuration fragments, see the ":ref:`kernel-dev/common:creating configuration fragments`" section.
 
 Finally, if you have any configurations specific to the hardware that
 are not in a ``*.scc`` file, you can include them as follows:
@@ -696,7 +696,7 @@ good approach if you are working with Linux kernel sources you do not
 control or if you just do not want to maintain a Linux kernel Git
 repository on your own. For partial information on how you can define
 kernel Metadata in the recipe-space, see the
-":ref:`kernel-dev/kernel-dev-common:modifying an existing recipe`" section.
+":ref:`kernel-dev/common:modifying an existing recipe`" section.
 
 Conversely, if you are actively developing a kernel and are already
 maintaining a Linux kernel Git repository of your own, you might find it
@@ -716,7 +716,7 @@ modifying
 ``oe-core/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb`` to
 a recipe in your layer, ``FILESEXTRAPATHS`` is typically set to
 ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``.
-See the ":ref:`kernel-dev/kernel-dev-common:modifying an existing recipe`"
+See the ":ref:`kernel-dev/common:modifying an existing recipe`"
 section for more information.
 
 Here is an example that shows a trivial tree of kernel Metadata stored
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/common.rst
similarity index 97%
rename from documentation/kernel-dev/kernel-dev-common.rst
rename to documentation/kernel-dev/common.rst
index 4bb553f8d..403a63d58 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -49,7 +49,7 @@ Getting Ready to Develop Using ``devtool``
 Follow these steps to prepare to update the kernel image using
 ``devtool``. Completing this procedure leaves you with a clean kernel
 image and ready to make modifications as described in the
-":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section:
 
 1. *Initialize the BitBake Environment:* Before building an extensible
@@ -212,7 +212,7 @@ section:
 
 At this point you have set up to start making modifications to the
 kernel by using the extensible SDK. For a continued example, see the
-":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section.
 
 Getting Ready for Traditional Kernel Development
@@ -226,7 +226,7 @@ you will be editing these files.
 Follow these steps to prepare to update the kernel image using
 traditional kernel development flow with the Yocto Project. Completing
 this procedure leaves you ready to make modifications to the kernel
-source as described in the ":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
+source as described in the ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 section:
 
 1. *Initialize the BitBake Environment:* Before you can do anything
@@ -457,11 +457,11 @@ the :term:`Source Directory` in
 
 Modifying an existing recipe can consist of the following:
 
-- :ref:`kernel-dev/kernel-dev-common:creating the append file`
+- :ref:`kernel-dev/common:creating the append file`
 
-- :ref:`kernel-dev/kernel-dev-common:applying patches`
+- :ref:`kernel-dev/common:applying patches`
 
-- :ref:`kernel-dev/kernel-dev-common:changing the configuration`
+- :ref:`kernel-dev/common:changing the configuration`
 
 Before modifying an existing recipe, be sure that you have created a
 minimal, custom layer from which you can work. See the "`Creating and
@@ -642,9 +642,9 @@ and applies the patches before building the kernel.
 
 For a detailed example showing how to patch the kernel using
 ``devtool``, see the
-":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 and
-":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
+":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 sections.
 
 Changing the Configuration
@@ -769,7 +769,7 @@ the extensible SDK and ``devtool``.
 
    Before attempting this procedure, be sure you have performed the
    steps to get ready for updating the kernel as described in the
-   ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
    section.
 
 Patching the kernel involves changing or adding configurations to an
@@ -782,7 +782,7 @@ output at boot time through ``printk`` statements in the kernel's
 ``calibrate.c`` source code file. Applying the patch and booting the
 modified image causes the added messages to appear on the emulator's
 console. The example is a continuation of the setup procedure found in
-the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``" Section.
+the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Section.
 
 1. *Check Out the Kernel Source Files:* First you must use ``devtool``
    to checkout the kernel source code in its workspace. Be sure you are
@@ -791,7 +791,7 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
    .. note::
 
       See this step in the
-      ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
       section for more information.
 
    Use the following ``devtool`` command to check out the code:
@@ -912,7 +912,7 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
    .. note::
 
       See Step 3 of the
-      ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
       section for information on setting up this layer.
 
    Once the command
@@ -935,14 +935,14 @@ Using Traditional Kernel Development to Patch the Kernel
 The steps in this procedure show you how you can patch the kernel using
 traditional kernel development (i.e. not using ``devtool`` and the
 extensible SDK as described in the
-":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 section).
 
 .. note::
 
    Before attempting this procedure, be sure you have performed the
    steps to get ready for updating the kernel as described in the
-   ":ref:`kernel-dev/kernel-dev-common:getting ready for traditional kernel development`"
+   ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
    section.
 
 Patching the kernel involves changing or adding configurations to an
@@ -1190,9 +1190,9 @@ the tool and save your changes to create an updated version of the
 
    You can use the entire ``.config`` file as the ``defconfig`` file. For
    information on ``defconfig`` files, see the
-   ":ref:`kernel-dev/kernel-dev-common:changing the configuration`",
-   ":ref:`kernel-dev/kernel-dev-common:using an "in-tree" \`\`defconfig\`\` file`",
-   and ":ref:`kernel-dev/kernel-dev-common:creating a \`\`defconfig\`\` file`"
+   ":ref:`kernel-dev/common:changing the configuration`",
+   ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`",
+   and ":ref:`kernel-dev/common:creating a \`\`defconfig\`\` file`"
    sections.
 
 Consider an example that configures the "CONFIG_SMP" setting for the
@@ -1320,7 +1320,7 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 
    For more information about where the ``.config`` file is located, see the
    example in the
-   ":ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\``"
+   ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
    section.
 
 It is simple to create a configuration fragment. One method is to use
@@ -1377,7 +1377,7 @@ information on how to use the output as a configuration fragment.
 .. note::
 
    You can also use this method to create configuration fragments for a
-   BSP. See the ":ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`"
+   BSP. See the ":ref:`kernel-dev/advanced:bsp descriptions`"
    section for more information.
 
 Where do you put your configuration fragment files? You can place these
@@ -1423,7 +1423,7 @@ when you override a policy configuration in a hardware configuration
 fragment.
 
 In order to run this task, you must have an existing ``.config`` file.
-See the ":ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\``" section for
+See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``" section for
 information on how to create a configuration file.
 
 Following is sample output from the ``do_kernel_configcheck`` task:
@@ -1496,7 +1496,7 @@ and
 tasks until they produce no warnings.
 
 For more information on how to use the ``menuconfig`` tool, see the
-:ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\`` section.
+:ref:`kernel-dev/common:using \`\`menuconfig\`\`` section.
 
 Fine-Tuning the Kernel Configuration File
 -----------------------------------------
@@ -1612,7 +1612,7 @@ source directory. Follow these steps to clean up the version string:
    Depending on your particular kernel development workflow, the
    commands you use to rebuild the kernel might differ. For information
    on building the kernel image when using ``devtool``, see the
-   ":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+   ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
    section. For
    information on building the kernel image when using Bitbake, see the
    "`Using Traditional Kernel Development to Patch the
@@ -1942,7 +1942,7 @@ Adding Recipe-Space Kernel Features
 ===================================
 
 You can add kernel features in the
-:ref:`recipe-space <kernel-dev/kernel-dev-advanced:recipe-space metadata>`
+:ref:`recipe-space <kernel-dev/advanced:recipe-space metadata>`
 by using the :term:`KERNEL_FEATURES`
 variable and by specifying the feature's ``.scc`` file path in the
 :term:`SRC_URI` statement. When you
@@ -1961,7 +1961,7 @@ OpenEmbedded build system searches all forms of kernel Metadata on the
 ``SRC_URI`` statement regardless of whether the Metadata is in the
 "kernel-cache", system kernel Metadata, or a recipe-space Metadata (i.e.
 part of the kernel recipe). See the
-":ref:`kernel-dev/kernel-dev-advanced:kernel metadata location`" section for
+":ref:`kernel-dev/advanced:kernel metadata location`" section for
 additional information.
 
 When you specify the feature's ``.scc`` file on the ``SRC_URI``
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
similarity index 97%
rename from documentation/kernel-dev/kernel-dev-concepts-appx.rst
rename to documentation/kernel-dev/concepts-appx.rst
index 470d6ce1c..865f6d8be 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -71,7 +71,7 @@ and included with Yocto Project releases:
    and configurations for the linux-yocto kernel tree. This repository
    is useful when working on the linux-yocto kernel. For more
    information on this "Advanced Kernel Metadata", see the
-   ":doc:`kernel-dev-advanced`" Chapter.
+   ":doc:`/kernel-dev/advanced`" Chapter.
 
 -  *linux-yocto-dev:* A development kernel based on the latest
    upstream release candidate available.
@@ -293,13 +293,13 @@ ways:
 
 -  *Files Accessed While using devtool:* ``devtool``, which is
    available with the Yocto Project, is the preferred method by which to
-   modify the kernel. See the ":ref:`kernel-dev/kernel-dev-intro:kernel modification workflow`" section.
+   modify the kernel. See the ":ref:`kernel-dev/intro:kernel modification workflow`" section.
 
 -  *Cloned Repository:* If you are working in the kernel all the time,
    you probably would want to set up your own local Git repository of
    the Yocto Linux kernel tree. For information on how to clone a Yocto
    Linux kernel Git repository, see the
-   ":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
+   ":ref:`kernel-dev/common:preparing the build host to work on the kernel`"
    section.
 
 -  *Temporary Source Files from a Build:* If you just need to make some
@@ -327,11 +327,11 @@ source files used during the build.
 
 Again, for additional information on the Yocto Project kernel's
 architecture and its branching strategy, see the
-":ref:`kernel-dev/kernel-dev-concepts-appx:yocto linux kernel architecture and branching strategies`"
+":ref:`kernel-dev/concepts-appx:yocto linux kernel architecture and branching strategies`"
 section. You can also reference the
-":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 and
-":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
+":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 sections for detailed example that modifies the kernel.
 
 Determining Hardware and Non-Hardware Features for the Kernel Configuration Audit Phase
@@ -341,7 +341,7 @@ This section describes part of the kernel configuration audit phase that
 most developers can ignore. For general information on kernel
 configuration including ``menuconfig``, ``defconfig`` files, and
 configuration fragments, see the
-":ref:`kernel-dev/kernel-dev-common:configuring the kernel`" section.
+":ref:`kernel-dev/common:configuring the kernel`" section.
 
 During this part of the audit phase, the contents of the final
 ``.config`` file are compared against the fragments specified by the
diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/faq.rst
similarity index 89%
rename from documentation/kernel-dev/kernel-dev-faq.rst
rename to documentation/kernel-dev/faq.rst
index 54623453a..c2106f81e 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -13,21 +13,21 @@ How do I use my own Linux kernel ``.config`` file?
 --------------------------------------------------
 
 Refer to the
-":ref:`kernel-dev/kernel-dev-common:changing the configuration`"
+":ref:`kernel-dev/common:changing the configuration`"
 section for information.
 
 How do I create configuration fragments?
 ----------------------------------------
 
 A: Refer to the
-":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`"
+":ref:`kernel-dev/common:creating configuration fragments`"
 section for information.
 
 How do I use my own Linux kernel sources?
 -----------------------------------------
 
 Refer to the
-":ref:`kernel-dev/kernel-dev-common:working with your own sources`"
+":ref:`kernel-dev/common:working with your own sources`"
 section for information.
 
 How do I install/not-install the kernel image on the rootfs?
@@ -63,7 +63,7 @@ machine:
    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-ab123"
 
 For more information, see the
-":ref:`kernel-dev/kernel-dev-common:incorporating out-of-tree modules`" section.
+":ref:`kernel-dev/common:incorporating out-of-tree modules`" section.
 
 How do I change the Linux kernel command line?
 ----------------------------------------------
diff --git a/documentation/kernel-dev/index.rst b/documentation/kernel-dev/index.rst
index 55b42ed99..a8848ec8c 100644
--- a/documentation/kernel-dev/index.rst
+++ b/documentation/kernel-dev/index.rst
@@ -10,12 +10,12 @@ Yocto Project Linux Kernel Development Manual
    :caption: Table of Contents
    :numbered:
 
-   kernel-dev-intro
-   kernel-dev-common
-   kernel-dev-advanced
-   kernel-dev-concepts-appx
-   kernel-dev-maint-appx
-   kernel-dev-faq
+   intro
+   common
+   advanced
+   concepts-appx
+   maint-appx
+   faq
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/intro.rst
similarity index 91%
rename from documentation/kernel-dev/kernel-dev-intro.rst
rename to documentation/kernel-dev/intro.rst
index 3987b0e59..2b60616df 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -27,7 +27,7 @@ and supported for at least one additional Yocto Project release. As they
 align, these previous releases are updated to include the latest from
 the Long Term Support Initiative (LTSI) project. You can learn more
 about Yocto Linux kernels and LTSI in the
-":ref:`kernel-dev/kernel-dev-concepts-appx:yocto project kernel development and maintenance`" section.
+":ref:`kernel-dev/concepts-appx:yocto project kernel development and maintenance`" section.
 
 Also included is a Yocto Linux kernel development recipe
 (``linux-yocto-dev.bb``) should you want to work with the very latest in
@@ -36,7 +36,7 @@ upstream Yocto Linux kernel development and kernel Metadata development.
 .. note::
 
    For more on Yocto Linux kernels, see the
-   ":ref:`kernel-dev/kernel-dev-concepts-appx:yocto project kernel development and maintenance`"
+   ":ref:`kernel-dev/concepts-appx:yocto project kernel development and maintenance`"
    section.
 
 The Yocto Project also provides a powerful set of kernel tools for
@@ -124,13 +124,13 @@ general information and references for further information.
    Using ``devtool`` and the eSDK requires that you have a clean build
    of the image and that you are set up with the appropriate eSDK. For
    more information, see the
-   ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
    section.
 
    Using traditional kernel development requires that you have the
    kernel source available in an isolated local Git repository. For more
    information, see the
-   ":ref:`kernel-dev/kernel-dev-common:getting ready for traditional kernel development`"
+   ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
    section.
 
 3. *Make Changes to the Kernel Source Code if applicable:* Modifying the
@@ -138,17 +138,17 @@ general information and references for further information.
    if you have to do this, you make the changes to the files in the
    eSDK's Build Directory if you are using ``devtool``. For more
    information, see the
-   ":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+   ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
    section.
 
    If you are using traditional kernel development, you edit the source
    files in the kernel's local Git repository. For more information, see the
-   ":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
+   ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
    section.
 
 4. *Make Kernel Configuration Changes if Applicable:* If your situation
    calls for changing the kernel's configuration, you can use
-   :ref:`menuconfig <kernel-dev/kernel-dev-common:using \`\`menuconfig\`\`>`,
+   :ref:`menuconfig <kernel-dev/common:using \`\`menuconfig\`\`>`,
    which allows you to
    interactively develop and test the configuration changes you are
    making to the kernel. Saving changes you make with ``menuconfig``
@@ -165,7 +165,7 @@ general information and references for further information.
    ``menuconfig`` and you have saved them, you can directly compare the
    resulting ``.config`` file against an existing original and gather
    those changes into a
-   :ref:`configuration fragment file <kernel-dev/kernel-dev-common:creating configuration fragments>` to be
+   :ref:`configuration fragment file <kernel-dev/common:creating configuration fragments>` to be
    referenced from within the kernel's ``.bbappend`` file.
 
    Additionally, if you are working in a BSP layer and need to modify
diff --git a/documentation/kernel-dev/kernel-dev-maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
similarity index 99%
rename from documentation/kernel-dev/kernel-dev-maint-appx.rst
rename to documentation/kernel-dev/maint-appx.rst
index ec1c0ac03..89f4b4334 100644
--- a/documentation/kernel-dev/kernel-dev-maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -37,7 +37,7 @@ kernel that branches off ``linux.org`` version 4.12 and the
 For more information on
 how to set up a local Git repository of the Yocto Project Linux kernel
 files, see the
-":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
+":ref:`kernel-dev/common:preparing the build host to work on the kernel`"
 section.
 
 Once you have cloned the kernel Git repository and the cache of Metadata
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index d2e335e80..a10670fc5 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -833,7 +833,7 @@ Yocto Project Development Tasks Manual. You can also see the
 ":ref:`sdk-manual/sdk-extensible:use \`\`devtool modify\`\` to modify the source of an existing component`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (SDK) manual and the
-":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
+":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 section in the Yocto Project Linux Kernel Development Manual.
 
 Configuration, Compilation, and Staging
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index e03b4cdc6..9a2997d9f 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -117,7 +117,7 @@ methods exist for you to do work in the Yocto Project environment:
    The :doc:`/kernel-dev/index` provides kernel-related
    development information. For specifics on development host
    preparation, see the
-   ":ref:`kernel-dev/kernel-dev-common:preparing the build host to work on the kernel`"
+   ":ref:`kernel-dev/common:preparing the build host to work on the kernel`"
    section in the Yocto Project Linux Kernel Development Manual.
 
 -  *Using Toaster:* The other Yocto Project development method that
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 4147044ea..914ca4232 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1596,7 +1596,7 @@ and implements the :ref:`ref-tasks-compile` and
 everything needed to build and package a kernel module.
 
 For general information on out-of-tree Linux kernel modules, see the
-":ref:`kernel-dev/kernel-dev-common:incorporating out-of-tree modules`"
+":ref:`kernel-dev/common:incorporating out-of-tree modules`"
 section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-classes-module-base:
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 89731d459..768c10eeb 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -693,7 +693,7 @@ from the command line as follows:
    $ bitbake linux-yocto -c diffconfig
 
 For more information, see the
-":ref:`kernel-dev/kernel-dev-common:creating configuration fragments`"
+":ref:`kernel-dev/common:creating configuration fragments`"
 section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-tasks-kernel_checkout:
@@ -724,7 +724,7 @@ following command:
    $ bitbake linux-yocto -c kernel_configcheck -f
 
 For more information, see the
-":ref:`kernel-dev/kernel-dev-common:validating configuration`"
+":ref:`kernel-dev/common:validating configuration`"
 section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-tasks-kernel_configme:
@@ -756,7 +756,7 @@ tool, which you then use to modify the kernel configuration.
            $ bitbake linux-yocto -c menuconfig
 
 
-See the ":ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\``"
+See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
 section in the Yocto Project Linux Kernel Development Manual for more
 information on this configuration tool.
 
@@ -780,7 +780,7 @@ which can then be applied by subsequent tasks such as
 
 Runs ``make menuconfig`` for the kernel. For information on
 ``menuconfig``, see the
-":ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\``"
+":ref:`kernel-dev/common:using \`\`menuconfig\`\``"
 section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-tasks-savedefconfig:
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 65f64b91a..d98e35817 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -3723,7 +3723,7 @@ system and gives an overview of their function and contents.
       - qemu
       - mips
 
-      You define the ``KARCH`` variable in the :ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`.
+      You define the ``KARCH`` variable in the :ref:`kernel-dev/advanced:bsp descriptions`.
 
    :term:`KBRANCH`
       A regular expression used by the build process to explicitly identify
@@ -3793,7 +3793,7 @@ system and gives an overview of their function and contents.
 
       For more
       information on how to use the ``KBUILD_DEFCONFIG`` variable, see the
-      ":ref:`kernel-dev/kernel-dev-common:using an "in-tree" \`\`defconfig\`\` file`"
+      ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`"
       section in the Yocto Project Linux Kernel Development Manual.
 
    :term:`KERNEL_ALT_IMAGETYPE`
@@ -4029,7 +4029,7 @@ system and gives an overview of their function and contents.
       of the :term:`STAGING_KERNEL_DIR` within
       the :ref:`module <ref-classes-module>` class. For information on
       how this variable is used, see the
-      ":ref:`kernel-dev/kernel-dev-common:incorporating out-of-tree modules`"
+      ":ref:`kernel-dev/common:incorporating out-of-tree modules`"
       section in the Yocto Project Linux Kernel Development Manual.
 
       To help maximize compatibility with out-of-tree drivers used to build
@@ -4043,7 +4043,7 @@ system and gives an overview of their function and contents.
       of the :term:`STAGING_KERNEL_DIR` within
       the :ref:`module <ref-classes-module>` class. For information on
       how this variable is used, see the
-      ":ref:`kernel-dev/kernel-dev-common:incorporating out-of-tree modules`"
+      ":ref:`kernel-dev/common:incorporating out-of-tree modules`"
       section in the Yocto Project Linux Kernel Development Manual.
 
       To help maximize compatibility with out-of-tree drivers used to build
@@ -4108,13 +4108,13 @@ system and gives an overview of their function and contents.
    :term:`KTYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"
-      kernel types. See the ":ref:`kernel-dev/kernel-dev-advanced:kernel types`"
+      kernel types. See the ":ref:`kernel-dev/advanced:kernel types`"
       section in the
       Yocto Project Linux Kernel Development Manual for more information on
       kernel types.
 
       You define the ``KTYPE`` variable in the
-      :ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`. The
+      :ref:`kernel-dev/advanced:bsp descriptions`. The
       value you use must match the value used for the
       :term:`LINUX_KERNEL_TYPE` value used by the
       kernel recipe.
@@ -4343,7 +4343,7 @@ system and gives an overview of their function and contents.
    :term:`LINUX_KERNEL_TYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"
-      kernel types. See the ":ref:`kernel-dev/kernel-dev-advanced:kernel types`"
+      kernel types. See the ":ref:`kernel-dev/advanced:kernel types`"
       section in the
       Yocto Project Linux Kernel Development Manual for more information on
       kernel types.
-- 
2.29.2

