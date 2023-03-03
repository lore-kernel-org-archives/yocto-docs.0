Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB484C678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 14:45:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24912.1677854714563139905
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RWATPgGA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5B9931BF20E;
	Fri,  3 Mar 2023 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677854712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NiI036yt06QHTJhM13nH23favZjfc8pxlU3BUkK7xkg=;
	b=RWATPgGAYTCQqQx/RsLUbSQGQXLVc2J9bj9C5N6IplfUSXXVGP7JWK8VMidrU29gP6C0C0
	KhbLNHNz4K9TMZRX4N+LKhec+R7/9lPazRR3Y+Fsv7bI2IAP9PNXqSi+Svx7Y/jMJQSiDb
	TR2vB7TRsKCPDvsFyq7RGOZbcpxcXZGl9LtyA/Fs5cri0z7gDFMJphLbsPr94dsq1f5snn
	8vkV+vcaXiFnVJkjKtvV9fSZSym45tpEgZlPbnNm0C4q4PHB0SjL32AZT7xJyr4NFTAikl
	UsaxolSnE4+jqpTL9Om+NPRtRAS4PTq1wlz/dSV7mbFA+5uYK7R3rfdW5/RQ9w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] kernel-dev: simplify local references
Date: Fri,  3 Mar 2023 15:45:10 +0100
Message-Id: <20230303144510.542165-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Mar 2023 14:45:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3783

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Simplify references to sections within the same document
- Take advantage of this to fix line width in the modified
  paragraphs.

Signen-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/advanced.rst      | 43 +++++-------
 documentation/kernel-dev/common.rst        | 82 ++++++++--------------
 documentation/kernel-dev/concepts-appx.rst |  2 +-
 documentation/kernel-dev/intro.rst         |  2 +-
 4 files changed, 50 insertions(+), 79 deletions(-)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 35195135c4..d0632e333b 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -57,7 +57,7 @@ the same "intel-corei7-64" value for :term:`KMACHINE`. It is important to
 realize that :term:`KMACHINE` is just for kernel mapping, while :term:`MACHINE`
 is the machine type within a BSP Layer. Even with this distinction,
 however, these two variables can hold the same value. See the
-":ref:`kernel-dev/advanced:bsp descriptions`" section for more information.
+"`BSP Descriptions`_" section for more information.
 
 Every linux-yocto style recipe must also indicate the Linux kernel
 source repository branch used to build the Linux kernel. The
@@ -86,7 +86,7 @@ Together with :term:`KMACHINE`, :term:`LINUX_KERNEL_TYPE` defines the search
 arguments used by the kernel tools to find the appropriate description
 within the kernel Metadata with which to build out the sources and
 configuration. The linux-yocto recipes define "standard", "tiny", and
-"preempt-rt" kernel types. See the ":ref:`kernel-dev/advanced:kernel types`"
+"preempt-rt" kernel types. See the "`Kernel Types`_"
 section for more information on kernel types.
 
 During the build, the kern-tools search for the BSP description file
@@ -120,7 +120,7 @@ the entries in :term:`KERNEL_FEATURES` are dependent on their location
 within the kernel Metadata itself. The examples here are taken from the
 ``yocto-kernel-cache`` repository. Each branch of this repository
 contains "features" and "cfg" subdirectories at the top-level. For more
-information, see the ":ref:`kernel-dev/advanced:kernel metadata syntax`"
+information, see the "`Kernel Metadata Syntax`_"
 section.
 
 Kernel Metadata Syntax
@@ -145,7 +145,7 @@ Features aggregate sources in the form of patches and configuration
 fragments into a modular reusable unit. You can use features to
 implement conceptually separate kernel Metadata descriptions such as
 pure configuration fragments, simple patches, complex features, and
-kernel types. :ref:`kernel-dev/advanced:kernel types` define general kernel
+kernel types. `Kernel Types`_ define general kernel
 features and policy to be reused in the BSPs.
 
 BSPs define hardware-specific features and aggregate them with kernel
@@ -163,7 +163,7 @@ following Metadata file hierarchy is recommended::
       ktypes/
       patches/
 
-The ``bsp`` directory contains the :ref:`kernel-dev/advanced:bsp descriptions`.
+The ``bsp`` directory contains the `BSP Descriptions`_.
 The remaining directories all contain "features". Separating ``bsp`` from the
 rest of the structure aids conceptualizing intended usage.
 
@@ -190,15 +190,11 @@ impact on the functionality of the kernel Metadata. There is no impact
 because all of ``cfg``, ``features``, ``patches``, and ``ktypes``,
 contain "features" as far as the kernel tools are concerned.
 
-Paths used in kernel Metadata files are relative to base, which is
-either
-:term:`FILESEXTRAPATHS` if
-you are creating Metadata in
-:ref:`recipe-space <kernel-dev/advanced:recipe-space metadata>`,
-or the top level of
+Paths used in kernel Metadata files are relative to base, which is either
+:term:`FILESEXTRAPATHS` if you are creating Metadata in
+`Recipe-Space Metadata`_, or the top level of
 :yocto_git:`yocto-kernel-cache </yocto-kernel-cache/tree/>`
-if you are creating
-:ref:`kernel-dev/advanced:metadata outside the recipe-space`.
+if you are creating `Metadata Outside the Recipe-Space`_.
 
 .. [1]
    ``scc`` stands for Series Configuration Control, but the naming has
@@ -345,9 +341,8 @@ as how an additional feature description file is included with the
 Typically, features are less granular than configuration fragments and
 are more likely than configuration fragments and patches to be the types
 of things you want to specify in the :term:`KERNEL_FEATURES` variable of the
-Linux kernel recipe. See the
-":ref:`kernel-dev/advanced:using kernel metadata in a recipe`" section earlier
-in the manual.
+Linux kernel recipe. See the "`Using Kernel Metadata in a Recipe`_" section
+earlier in the manual.
 
 Kernel Types
 ------------
@@ -356,7 +351,7 @@ A kernel type defines a high-level kernel policy by aggregating non-hardware
 configuration fragments with patches you want to use when building a Linux
 kernel of a specific type (e.g. a real-time kernel). Syntactically, kernel
 types are no different than features as described in the
-":ref:`kernel-dev/advanced:features`" section. The :term:`LINUX_KERNEL_TYPE`
+"`Features`_" section. The :term:`LINUX_KERNEL_TYPE`
 variable in the kernel recipe selects the kernel type. For example, in the
 ``linux-yocto_4.12.bb`` kernel recipe found in ``poky/meta/recipes-kernel/linux``, a
 :ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
@@ -376,8 +371,7 @@ type as follows::
    You can find kernel recipes in the ``meta/recipes-kernel/linux`` directory
    of the :ref:`overview-manual/development-environment:yocto project source repositories`
    (e.g. ``poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb``). See the
-   ":ref:`kernel-dev/advanced:using kernel metadata in a recipe`"
-   section for more information.
+   "`Using Kernel Metadata in a Recipe`_" section for more information.
 
 Three kernel types ("standard", "tiny", and "preempt-rt") are supported
 for Linux Yocto kernels:
@@ -440,8 +434,7 @@ and ``patch`` commands, respectively.
    It is not strictly necessary to create a kernel type ``.scc``
    file. The Board Support Package (BSP) file can implicitly define the
    kernel type using a ``define`` :term:`KTYPE` ``myktype`` line. See the
-   ":ref:`kernel-dev/advanced:bsp descriptions`" section for more
-   information.
+   "`BSP descriptions`_" section for more information.
 
 BSP Descriptions
 ----------------
@@ -523,8 +516,7 @@ example, this is done using the following::
 
 This file aggregates all the configuration
 fragments, patches, and features that make up your standard kernel
-policy. See the ":ref:`kernel-dev/advanced:kernel types`" section for more
-information.
+policy. See the "`Kernel Types`_" section for more information.
 
 To aggregate common configurations and features specific to the kernel
 for `mybsp`, use the following::
@@ -795,11 +787,10 @@ Given this scenario, you do not need to create any branches in the
 source repository. Rather, you just take the static patches you need and
 encapsulate them within a feature description. Once you have the feature
 description, you simply include that into the BSP description as
-described in the ":ref:`kernel-dev/advanced:bsp descriptions`" section.
+described in the "`BSP Descriptions`_" section.
 
 You can find information on how to create patches and BSP descriptions
-in the ":ref:`kernel-dev/advanced:patches`" and
-":ref:`kernel-dev/advanced:bsp descriptions`" sections.
+in the "`Patches`_" and "`BSP Descriptions`_" sections.
 
 Machine Branches
 ----------------
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index e0a85575c1..bda1e56860 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -49,8 +49,7 @@ Getting Ready to Develop Using ``devtool``
 Follow these steps to prepare to update the kernel image using
 ``devtool``. Completing this procedure leaves you with a clean kernel
 image and ready to make modifications as described in the
-":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
-section:
+"`Using devtool to Patch the Kernel`_" section:
 
 #. *Initialize the BitBake Environment:*
    you need to initialize the BitBake build environment by sourcing
@@ -139,10 +138,8 @@ section:
    :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </TipsAndTricks/KernelDevelopmentWithEsdk>`
    Wiki page.
 
-At this point you have set up to start making modifications to the
-kernel. For a continued example, see the
-":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
-section.
+At this point you have set up to start making modifications to the kernel. For
+a continued example, see the "`Using devtool to Patch the Kernel`_" section.
 
 Getting Ready for Traditional Kernel Development
 ------------------------------------------------
@@ -152,11 +149,10 @@ involves many of the same steps as described in the previous section.
 However, you need to establish a local copy of the kernel source since
 you will be editing these files.
 
-Follow these steps to prepare to update the kernel image using
-traditional kernel development flow with the Yocto Project. Completing
-this procedure leaves you ready to make modifications to the kernel
-source as described in the ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
-section:
+Follow these steps to prepare to update the kernel image using traditional
+kernel development flow with the Yocto Project. Completing this procedure
+leaves you ready to make modifications to the kernel source as described in the
+"`Using Traditional Kernel Development to Patch the Kernel`_" section:
 
 #. *Initialize the BitBake Environment:* Before you can do anything
    using BitBake, you need to initialize the BitBake build environment
@@ -284,8 +280,7 @@ section:
 
 At this point, you are ready to start making modifications to the kernel
 using traditional kernel development steps. For a continued example, see
-the ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
-section.
+the "`Using Traditional Kernel Development to Patch the Kernel`_" section.
 
 Creating and Preparing a Layer
 ==============================
@@ -371,16 +366,15 @@ the :term:`Source Directory` in
 
 Modifying an existing recipe can consist of the following:
 
-- :ref:`kernel-dev/common:creating the append file`
+- `Creating the append file`_
 
-- :ref:`kernel-dev/common:applying patches`
+- `Applying patches`_
 
-- :ref:`kernel-dev/common:changing the configuration`
+- `Changing the configuration`_
 
 Before modifying an existing recipe, be sure that you have created a
 minimal, custom layer from which you can work. See the
-":ref:`kernel-dev/common:creating and preparing a layer`" section for
-information.
+"`Creating and Preparing a Layer`_" section for information.
 
 Creating the Append File
 ------------------------
@@ -548,12 +542,9 @@ The next time you run BitBake to build
 the Linux kernel, BitBake detects the change in the recipe and fetches
 and applies the patches before building the kernel.
 
-For a detailed example showing how to patch the kernel using
-``devtool``, see the
-":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
-and
-":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
-sections.
+For a detailed example showing how to patch the kernel using ``devtool``,
+see the "`Using devtool to Patch the Kernel`_" and
+"`Using Traditional Kernel Development to Patch the Kernel`_" sections.
 
 Changing the Configuration
 --------------------------
@@ -625,10 +616,10 @@ Linux kernel, BitBake detects the change in the recipe and fetches and
 applies the new configuration before building the kernel.
 
 For a detailed example showing how to configure the kernel, see the
-":ref:`kernel-dev/common:configuring the kernel`" section.
+"`Configuring the Kernel`_" section.
 
-Using an "In-Tree"  ``defconfig`` File
---------------------------------------
+Using an "In-Tree" ``defconfig`` File
+-------------------------------------
 
 It might be desirable to have kernel configuration fragment support
 through a ``defconfig`` file that is pulled from the kernel source tree
@@ -680,8 +671,7 @@ The steps in this procedure show you how you can patch the kernel using
 
    Before attempting this procedure, be sure you have performed the
    steps to get ready for updating the kernel as described in the
-   ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
-   section.
+   "`Getting Ready to Develop Using devtool`_" section.
 
 Patching the kernel involves changing or adding configurations to an
 existing kernel, changing or adding recipes to the kernel that are
@@ -693,15 +683,14 @@ output at boot time through ``printk`` statements in the kernel's
 ``calibrate.c`` source code file. Applying the patch and booting the
 modified image causes the added messages to appear on the emulator's
 console. The example is a continuation of the setup procedure found in
-the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Section.
+the "`Getting Ready to Develop Using devtool`_" section.
 
 #. *Check Out the Kernel Source Files:* First you must use ``devtool``
    to checkout the kernel source code in its workspace.
 
    .. note::
 
-      See this step in the
-      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+      See this step in the "`Getting Ready to Develop Using devtool`_"
       section for more information.
 
    Use the following ``devtool`` command to check out the code::
@@ -811,8 +800,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
    .. note::
 
-      See Step 3 of the
-      ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
+      See Step 3 of the "`Getting Ready to Develop Using devtool`_"
       section for information on setting up this layer.
 
    Once the command
@@ -831,17 +819,14 @@ Using Traditional Kernel Development to Patch the Kernel
 ========================================================
 
 The steps in this procedure show you how you can patch the kernel using
-traditional kernel development (i.e. not using ``devtool``
-as described in the
-":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
-section).
+traditional kernel development (i.e. not using ``devtool`` as described
+in the "`Using devtool to Patch the Kernel`_" section).
 
 .. note::
 
    Before attempting this procedure, be sure you have performed the
    steps to get ready for updating the kernel as described in the
-   ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
-   section.
+   "`Getting Ready for Traditional Kernel Development`_" section.
 
 Patching the kernel involves changing or adding configurations to an
 existing kernel, changing or adding recipes to the kernel that are
@@ -853,14 +838,12 @@ emulator console output at boot time through ``printk`` statements in
 the kernel's ``calibrate.c`` source code file. Applying the patch and
 booting the modified image causes the added messages to appear on the
 emulator's console. The example is a continuation of the setup procedure
-found in the
-":ref:`kernel-dev/common:getting ready for traditional kernel development`"
-Section.
+found in the "`Getting Ready for Traditional Kernel Development`_" section.
 
 #. *Edit the Source Files* Prior to this step, you should have used Git
    to create a local copy of the repository for your kernel. Assuming
    you created the repository as directed in the
-   ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
+   "`Getting Ready for Traditional Kernel Development`_"
    section, use the following commands to edit the ``calibrate.c`` file:
 
    #. *Change the working directory*: You need to locate the source
@@ -992,8 +975,7 @@ Section.
    enable the OpenEmbedded build system to find the patch file.
 
    For more information on append files and patches, see the
-   ":ref:`kernel-dev/common:creating the append file`" and
-   ":ref:`kernel-dev/common:applying patches`" sections. You can also see the
+   "`Creating the Append File`_" and "`Applying Patches`_" sections. You can also see the
    ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
    section in the Yocto Project Development Tasks Manual.
 
@@ -1027,7 +1009,7 @@ configuration fragments, and how to interactively modify your
 possible.
 
 For more information on kernel configuration, see the
-":ref:`kernel-dev/common:changing the configuration`" section.
+"`Changing the Configuration`_" section.
 
 Using  ``menuconfig``
 ---------------------
@@ -1072,10 +1054,8 @@ the tool and save your changes to create an updated version of the
 
    You can use the entire ``.config`` file as the ``defconfig`` file. For
    information on ``defconfig`` files, see the
-   ":ref:`kernel-dev/common:changing the configuration`",
-   ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`",
-   and ":ref:`kernel-dev/common:creating a \`\`defconfig\`\` file`"
-   sections.
+   "`Changing the Configuration`_", "`Using an "In-Tree" defconfig File`_",
+   and "`Creating a defconfig File`_" sections.
 
 Consider an example that configures the "CONFIG_SMP" setting for the
 ``linux-yocto-4.12`` kernel.
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 6a2fe4bb0b..bcac7effe6 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -327,7 +327,7 @@ host system when you build the kernel using BitBake. This
 
 Again, for additional information on the Yocto Project kernel's
 architecture and its branching strategy, see the
-":ref:`kernel-dev/concepts-appx:yocto linux kernel architecture and branching strategies`"
+"`Yocto Linux Kernel Architecture and Branching Strategies`_"
 section. You can also reference the
 ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
 and
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index a663733a1d..564247afeb 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -90,7 +90,7 @@ understand the following documentation:
 -  The ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
--  The ":ref:`kernel-dev/intro:kernel modification workflow`" section.
+-  The "`Kernel Modification Workflow`_" section.
 
 Kernel Modification Workflow
 ============================
-- 
2.37.2


