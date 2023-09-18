Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDFDCD13D2
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 14:17:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.52275.1695046644048942607
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 07:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G7wF0m6r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F242F6000E;
	Mon, 18 Sep 2023 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695046642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnh+AnZoui7GxC2a4C8fCvohadaJxuZbidQ/VOhmm/4=;
	b=G7wF0m6r99LodtGrSCVbkuR5XLdyF4zxvMjTUMqDBKBIdqQUa4dUzOHvcDoY4ZrVUw3TWs
	wJnNH2UQY3tGF4Q52AtOB3cBdUUxgM6uUbptAwbWXXHWeExEJ6wxuP0I4o8WV7upx9+RMq
	TyFw6MPLMr4s7hPDkaJ3Kmi4pBULtJ3Sd78hlAxz7MkCghUyC+rH6JjHWB3SDQYmxgMo2X
	tOLhS+A6nI1acWO8D8owDQb9vQIFc69ZSYzqwEEBkv0CYWKKjN7+9xfei5MSs+U8BWMOX+
	LvFwHT3zmEidXKAaoRpl+K5WKQRjlK86z61XmH+dbtIfVQWNPOVxRjTRmdFcdw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 5/5] manuals: update former references to dev-manual/common-tasks
Date: Mon, 18 Sep 2023 16:17:04 +0200
Message-Id: <20230918141704.79680-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
References: <20230918141704.79680-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 14:17:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4223

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst  |   4 +-
 documentation/bsp-guide/bsp.rst               |  20 +--
 .../contributor-guide/recipe-style-guide.rst  |   4 +-
 .../contributor-guide/submit-changes.rst      |   4 +-
 documentation/dev-manual/start.rst            |   2 +-
 documentation/kernel-dev/common.rst           |  16 +--
 documentation/kernel-dev/faq.rst              |   2 +-
 documentation/kernel-dev/intro.rst            |   2 +-
 .../migration-guides/migration-1.4.rst        |   2 +-
 .../migration-guides/migration-1.5.rst        |   4 +-
 .../migration-guides/migration-1.6.rst        |   6 +-
 .../migration-guides/migration-1.7.rst        |   2 +-
 .../migration-guides/migration-2.1.rst        |   2 +-
 .../migration-guides/migration-2.3.rst        |   2 +-
 .../migration-guides/migration-2.5.rst        |   2 +-
 .../migration-guides/migration-2.6.rst        |   2 +-
 documentation/overview-manual/concepts.rst    |  22 +--
 .../development-environment.rst               |   4 +-
 documentation/overview-manual/yp-intro.rst    |  10 +-
 documentation/ref-manual/classes.rst          |  53 ++++---
 .../ref-manual/devtool-reference.rst          |   4 +-
 documentation/ref-manual/faq.rst              |   6 +-
 documentation/ref-manual/features.rst         |   6 +-
 documentation/ref-manual/images.rst           |   4 +-
 documentation/ref-manual/kickstart.rst        |   2 +-
 documentation/ref-manual/release-process.rst  |   4 +-
 documentation/ref-manual/structure.rst        |  12 +-
 documentation/ref-manual/tasks.rst            |  10 +-
 documentation/ref-manual/terms.rst            |   8 +-
 documentation/ref-manual/variables.rst        | 131 +++++++++---------
 documentation/sdk-manual/extensible.rst       |   4 +-
 documentation/test-manual/intro.rst           |   2 +-
 .../test-manual/yocto-project-compatible.rst  |   2 +-
 documentation/toaster-manual/reference.rst    |   2 +-
 .../transitioning-to-a-custom-environment.rst |   8 +-
 documentation/what-i-wish-id-known.rst        |   2 +-
 36 files changed, 184 insertions(+), 188 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index cef91c6476..545fa03f1e 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -370,7 +370,7 @@ Follow these steps to add a hardware layer:
 
    You can find
    more information on adding layers in the
-   :ref:`dev-manual/common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`
+   :ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\` script`
    section.
 
 Completing these steps has added the ``meta-altera`` layer to your Yocto
@@ -405,7 +405,7 @@ The following commands run the tool to create a layer named
 
 For more information
 on layers and how to create them, see the
-:ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`
+:ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`
 section in the Yocto Project Development Tasks Manual.
 
 Where To Go Next
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 67bcd08f2b..109811a0c4 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -128,7 +128,7 @@ you want to work with, such as::
 and so on.
 
 For more information on layers, see the
-":ref:`dev-manual/common-tasks:understanding and creating layers`"
+":ref:`dev-manual/layers:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
 Preparing Your Build Host to Work With BSP Layers
@@ -464,7 +464,7 @@ requirements are handled with the ``COPYING.MIT`` file.
 Licensing files can be MIT, BSD, GPLv*, and so forth. These files are
 recommended for the BSP but are optional and totally up to the BSP
 developer. For information on how to maintain license compliance, see
-the ":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
+the ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 README File
@@ -590,7 +590,7 @@ filenames correspond to the values to which users have set the
 
 These files define things such as the kernel package to use
 (:term:`PREFERRED_PROVIDER` of
-:ref:`virtual/kernel <dev-manual/common-tasks:using virtual providers>`),
+:ref:`virtual/kernel <dev-manual/new-recipe:using virtual providers>`),
 the hardware drivers to include in different types of images, any
 special software components that are needed, any bootloader information,
 and also any special image format requirements.
@@ -757,7 +757,7 @@ workflow.
    OpenEmbedded build system knows about. For more information on
    layers, see the ":ref:`overview-manual/yp-intro:the yocto project layer model`"
    section in the Yocto Project Overview and Concepts Manual. You can also
-   reference the ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+   reference the ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For more
    information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
    section.
@@ -816,7 +816,7 @@ workflow.
    key configuration files are configured appropriately: the
    ``conf/local.conf`` and the ``conf/bblayers.conf`` file. You must
    make the OpenEmbedded build system aware of your new layer. See the
-   ":ref:`dev-manual/common-tasks:enabling your layer`"
+   ":ref:`dev-manual/layers:enabling your layer`"
    section in the Yocto Project Development Tasks Manual for information
    on how to let the build system know about your new layer.
 
@@ -845,7 +845,7 @@ Before looking at BSP requirements, you should consider the following:
    layer that can be added to the Yocto Project. For guidelines on
    creating a layer that meets these base requirements, see the
    ":ref:`bsp-guide/bsp:bsp layers`" section in this manual and the
-   ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+   ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The requirements in this section apply regardless of how you package
@@ -1013,7 +1013,7 @@ the following:
 
 -  Create a ``*.bbappend`` file for the modified recipe. For information on using
    append files, see the
-   ":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
+   ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
    section in the Yocto Project Development Tasks Manual.
 
 -  Ensure your directory structure in the BSP layer that supports your
@@ -1117,7 +1117,7 @@ list describes them in order of preference:
    Specifying the matching license string signifies that you agree to
    the license. Thus, the build system can build the corresponding
    recipe and include the component in the image. See the
-   ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
+   ":ref:`dev-manual/licenses:enabling commercially licensed recipes`"
    section in the Yocto Project Development Tasks Manual for details on
    how to use these variables.
 
@@ -1169,7 +1169,7 @@ Use these steps to create a BSP layer:
    ``create-layer`` subcommand to create a new general layer. For
    instructions on how to create a general layer using the
    ``bitbake-layers`` script, see the
-   ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Create a Layer Configuration File:* Every layer needs a layer
@@ -1229,7 +1229,7 @@ configuration files is to examine various files for BSP from the
 :yocto_git:`Source Repositories <>`.
 
 For a detailed description of this particular layer configuration file,
-see ":ref:`step 3 <dev-manual/common-tasks:creating your own layer>`"
+see ":ref:`step 3 <dev-manual/layers:creating your own layer>`"
 in the discussion that describes how to create layers in the Yocto
 Project Development Tasks Manual.
 
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index c1a12f03ac..a0d513e8e9 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -231,13 +231,13 @@ Recipes need to define both the :term:`LICENSE` and
    differences result in an error with the message containing the
    current checksum. For more explanation and examples of how to set the
    :term:`LIC_FILES_CHKSUM` variable, see the
-   ":ref:`dev-manual/common-tasks:tracking license changes`" section.
+   ":ref:`dev-manual/licenses:tracking license changes`" section.
 
    To determine the correct checksum string, you can list the
    appropriate files in the :term:`LIC_FILES_CHKSUM` variable with incorrect
    md5 strings, attempt to build the software, and then note the
    resulting error messages that will report the correct md5 strings.
-   See the ":ref:`dev-manual/common-tasks:fetching code`" section for
+   See the ":ref:`dev-manual/new-recipe:fetching code`" section for
    additional information.
 
    Here is an example that assumes the software has a ``COPYING`` file::
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 65d8ea5343..cda2d12d25 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -377,7 +377,7 @@ mailing list, unless specified otherwise in the layer's ``README`` file.
 If you intend to submit a new recipe that neither fits into the core Metadata,
 nor into :oe_git:`meta-openembedded </meta-openembedded/>`, you should
 look for a suitable layer in https://layers.openembedded.org. If similar
-recipes can be expected, you may consider :ref:`dev-manual/common-tasks:creating your own layer`.
+recipes can be expected, you may consider :ref:`dev-manual/layers:creating your own layer`.
 
 If in doubt, please ask on the :yocto_lists:`yocto </g/yocto/>` general mailing list
 or on the :oe_lists:`openembedded-devel </g/openembedded-devel>` mailing list.
@@ -625,7 +625,7 @@ follows:
 #. *Identify the bug or CVE to be fixed:* This information should be
    collected so that it can be included in your submission.
 
-   See :ref:`dev-manual/common-tasks:checking for vulnerabilities`
+   See :ref:`dev-manual/vulnerabilities:checking for vulnerabilities`
    for details about CVE tracking.
 
 #. *Check if the fix is already present in the master branch:* This will
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index d5e702a5a4..8938f0d772 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -223,7 +223,7 @@ particular working environment and set of practices.
     -  Maintain your Metadata in layers that make sense for your
        situation. See the ":ref:`overview-manual/yp-intro:the yocto project layer model`"
        section in the Yocto Project Overview and Concepts Manual and the
-       ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+       ":ref:`dev-manual/layers:understanding and creating layers`"
        section for more information on layers.
 
     -  Separate the project's Metadata and code by using separate Git
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index a5dd02ccf2..4279cbb707 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -101,13 +101,13 @@ section:
 
       For background information on working with common and BSP layers,
       see the
-      ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+      ":ref:`dev-manual/layers:understanding and creating layers`"
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
-      ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Development Tasks Manual.
 
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
@@ -278,13 +278,13 @@ section:
 
       For background information on working with common and BSP layers,
       see the
-      ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+      ":ref:`dev-manual/layers:understanding and creating layers`"
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
-      ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Development Tasks Manual.
 
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
@@ -364,7 +364,7 @@ layer contains its own :term:`BitBake`
 append files (``.bbappend``) and provides a convenient mechanism to
 create your own recipe files (``.bb``) as well as store and use kernel
 patch files. For background information on working with layers, see the
-":ref:`dev-manual/common-tasks:understanding and creating layers`"
+":ref:`dev-manual/layers:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 .. note::
@@ -372,7 +372,7 @@ section in the Yocto Project Development Tasks Manual.
    The Yocto Project comes with many tools that simplify tasks you need
    to perform. One such tool is the ``bitbake-layers create-layer``
    command, which simplifies creating a new layer. See the
-   ":ref:`dev-manual/common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
    section in the Yocto Project Development Tasks Manual for
    information on how to use this script to quick set up a new layer.
 
@@ -425,7 +425,7 @@ home directory:
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
    information on using append files, see the
-   ":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
+   ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
    section in the Yocto Project Development Tasks Manual.
 
 Modifying an Existing Recipe
@@ -1070,7 +1070,7 @@ Section.
    For more information on append files and patches, see the
    ":ref:`kernel-dev/common:creating the append file`" and
    ":ref:`kernel-dev/common:applying patches`" sections. You can also see the
-   ":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
+   ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
    section in the Yocto Project Development Tasks Manual.
 
    .. note::
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index 76923f6104..4dffa90dbd 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -38,7 +38,7 @@ The kernel image (e.g. ``vmlinuz``) is provided by the
 specify whether or not the kernel image is installed in the generated
 root filesystem, override ``RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
-":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
+":ref:`dev-manual/layers:appending other layers metadata with your layer`"
 section in the
 Yocto Project Development Tasks Manual for information on how to use an
 append file to override metadata.
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index e406f6e47f..cc879db887 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -87,7 +87,7 @@ understand the following documentation:
    as described in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual.
 
--  The ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+-  The ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The ":ref:`kernel-dev/intro:kernel modification workflow`" section.
diff --git a/documentation/migration-guides/migration-1.4.rst b/documentation/migration-guides/migration-1.4.rst
index baf3c08379..471bfb0f2a 100644
--- a/documentation/migration-guides/migration-1.4.rst
+++ b/documentation/migration-guides/migration-1.4.rst
@@ -83,7 +83,7 @@ create an append file for the ``init-ifupdown`` recipe instead, which
 you can find in the :term:`Source Directory` at
 ``meta/recipes-core/init-ifupdown``. For information on how to use
 append files, see the
-":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
+":ref:`dev-manual/layers:appending other layers metadata with your layer`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.4-remote-debugging:
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 93db14c3ba..31943fc701 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -244,7 +244,7 @@ A new automated image testing framework has been added through the
 framework replaces the older ``imagetest-qemu`` framework.
 
 You can learn more about performing automated image tests in the
-":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.5-build-history:
@@ -267,7 +267,7 @@ Following are changes to Build History:
    option for each utility for more information on the new syntax.
 
 For more information on Build History, see the
-":ref:`dev-manual/common-tasks:maintaining build output quality`"
+":ref:`dev-manual/build-quality:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.5-udev:
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index 358086560b..6ba52998de 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -12,7 +12,7 @@ Project 1.6 Release (codename "daisy") from the prior release.
 The :ref:`archiver <ref-classes-archiver>` class has been rewritten
 and its configuration has been simplified. For more details on the
 source archiver, see the
-":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.6-packaging-changes:
@@ -147,7 +147,7 @@ NFS mount, an error occurs.
 The ``PRINC`` variable has been deprecated and triggers a warning if
 detected during a build. For :term:`PR` increments on changes,
 use the PR service instead. You can find out more about this service in
-the ":ref:`dev-manual/common-tasks:working with a pr service`"
+the ":ref:`dev-manual/packages:working with a pr service`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-1.6-variable-changes-IMAGE_TYPES:
@@ -220,7 +220,7 @@ Package Test (ptest)
 
 Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
-":ref:`dev-manual/common-tasks:testing packages with ptest`"
+":ref:`dev-manual/packages:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual. For information on the
 ``ptest`` class, see the ":ref:`ref-classes-ptest`" section.
 
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 88a6855d50..d4af1277e9 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -217,7 +217,7 @@ The following miscellaneous change occurred:
    should manually remove old "build-id" files from your existing build
    history repositories to avoid confusion. For information on the build
    history feature, see the
-   ":ref:`dev-manual/common-tasks:maintaining build output quality`"
+   ":ref:`dev-manual/build-quality:maintaining build output quality`"
    section in the Yocto Project Development Tasks Manual.
 
 
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index ae6268d509..6ef3adb443 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -343,7 +343,7 @@ This release supports generation of GLib Introspective Repository (GIR)
 files through GObject introspection, which is the standard mechanism for
 accessing GObject-based software from runtime environments. You can
 enable, disable, and test the generation of this data. See the
-":ref:`dev-manual/common-tasks:enabling gobject introspection support`"
+":ref:`dev-manual/gobject-introspection:enabling gobject introspection support`"
 section in the Yocto Project Development Tasks Manual for more
 information.
 
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index d49ed474ca..b3428039b8 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -363,7 +363,7 @@ The following changes have been made to Wic:
 .. note::
 
    For more information on Wic, see the
-   ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
+   ":ref:`dev-manual/wic:creating partitioned images using wic`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Default Output Directory Changed:* Wic's default output directory is
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index abd26809df..fdbf2f3da3 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -264,7 +264,7 @@ The following are additional changes:
    will trigger a warning during ``do_rootfs``.
 
    For more information, see the
-   ":ref:`dev-manual/common-tasks:post-installation scripts`"
+   ":ref:`dev-manual/new-recipe:post-installation scripts`"
    section in the Yocto Project Development Tasks Manual.
 
 -  The ``elf`` image type has been removed. This image type was removed
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 11e659de7c..647ef83bc6 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -368,7 +368,7 @@ Any failure of a ``pkg_postinst()`` script (including exit 1) triggers
 an error during the :ref:`ref-tasks-rootfs` task.
 
 For more information on post-installation behavior, see the
-":ref:`dev-manual/common-tasks:post-installation scripts`"
+":ref:`dev-manual/new-recipe:post-installation scripts`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _migration-2.6-python-3-profile-guided-optimizations:
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 2631e412e5..7ad21e0d7d 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -34,7 +34,7 @@ itself is of various types:
 
 BitBake knows how to combine multiple data sources together and refers
 to each data source as a layer. For information on layers, see the
-":ref:`dev-manual/common-tasks:understanding and creating layers`"
+":ref:`dev-manual/layers:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
 Following are some brief details on these core components. For
@@ -149,7 +149,7 @@ Conforming to a known structure allows BitBake to make assumptions
 during builds on where to find types of metadata. You can find
 procedures and learn about tools (i.e. ``bitbake-layers``) for creating
 layers suitable for the Yocto Project in the
-":ref:`dev-manual/common-tasks:understanding and creating layers`"
+":ref:`dev-manual/layers:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
 OpenEmbedded Build System Concepts
@@ -308,7 +308,7 @@ during the build. By default, the layers listed in this file include
 layers minimally needed by the build system. However, you must manually
 add any custom layers you have created. You can find more information on
 working with the ``bblayers.conf`` file in the
-":ref:`dev-manual/common-tasks:enabling your layer`"
+":ref:`dev-manual/layers:enabling your layer`"
 section in the Yocto Project Development Tasks Manual.
 
 The files ``site.conf`` and ``auto.conf`` are not created by the
@@ -408,7 +408,7 @@ a ``README`` file as good practice and especially if the layer is to be
 distributed, a configuration directory, and recipe directories. You can
 learn about the general structure for layers used with the Yocto Project
 in the
-":ref:`dev-manual/common-tasks:creating your own layer`"
+":ref:`dev-manual/layers:creating your own layer`"
 section in the
 Yocto Project Development Tasks Manual. For a general discussion on
 layers and the many layers from which you can draw, see the
@@ -814,7 +814,7 @@ For more information on how the source directories are created, see the
 ":ref:`overview-manual/concepts:source fetching`" section. For
 more information on how to create patches and how the build system
 processes patches, see the
-":ref:`dev-manual/common-tasks:patching code`"
+":ref:`dev-manual/new-recipe:patching code`"
 section in the
 Yocto Project Development Tasks Manual. You can also see the
 ":ref:`sdk-manual/extensible:use \`\`devtool modify\`\` to modify the source of an existing component`"
@@ -1014,8 +1014,8 @@ data files are deleted from the root filesystem. As part of the final
 stage of package installation, post installation scripts that are part
 of the packages are run. Any scripts that fail to run on the build host
 are run on the target when the target system is first booted. If you are
-using a 
-:ref:`read-only root filesystem <dev-manual/common-tasks:creating a read-only root filesystem>`,
+using a
+:ref:`read-only root filesystem <dev-manual/read-only-rootfs:creating a read-only root filesystem>`,
 all the post installation scripts must succeed on the build host during
 the package installation phase since the root filesystem on the target
 is read-only.
@@ -1174,7 +1174,7 @@ varflag. If some other task depends on such a task, then that task will
 also always be considered out of date, which might not be what you want.
 
 For details on how to view information about a task's signature, see the
-":ref:`dev-manual/common-tasks:viewing task variable dependencies`"
+":ref:`dev-manual/debugging:viewing task variable dependencies`"
 section in the Yocto Project Development Tasks Manual.
 
 Setscene Tasks and Shared State
@@ -1603,15 +1603,15 @@ them if they are deemed to be valid.
       the shared state packages. Consequently, there are considerations that
       affect maintaining shared state feeds. For information on how the
       build system works with packages and can track incrementing :term:`PR`
-      information, see the ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
+      information, see the ":ref:`dev-manual/packages:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
    -  The code in the build system that supports incremental builds is
       complex. For techniques that help you work around issues
       related to shared state code, see the
-      ":ref:`dev-manual/common-tasks:viewing metadata used to create the input signature of a shared state task`"
+      ":ref:`dev-manual/debugging:viewing metadata used to create the input signature of a shared state task`"
       and
-      ":ref:`dev-manual/common-tasks:invalidating shared state to force a task to run`"
+      ":ref:`dev-manual/debugging:invalidating shared state to force a task to run`"
       sections both in the Yocto Project Development Tasks Manual.
 
 The rest of this section goes into detail about the overall incremental
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 5b182e70e3..332cea836d 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -94,7 +94,7 @@ are several ways of working in the Yocto Project environment:
    through your Linux distribution and the Yocto Project.
 
    For a general flow of the build procedures, see the
-   ":ref:`dev-manual/common-tasks:building a simple image`"
+   ":ref:`dev-manual/building:building a simple image`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Board Support Package (BSP) Development:* Development of BSPs
@@ -654,5 +654,5 @@ Project uses in the ``meta/files/common-licenses`` directory in your
 For information that can help you maintain compliance with various open
 source licensing during the lifecycle of a product created using the
 Yocto Project, see the
-":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 6fd6177503..25dc08b09d 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -129,7 +129,7 @@ Here are features and advantages of the Yocto Project:
    arbitrarily include packages.
 
 -  *License Manifest:* The Yocto Project provides a :ref:`license
-   manifest <dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle>`
+   manifest <dev-manual/licenses:maintaining open source license compliance during your product's lifecycle>`
    for review by people who need to track the use of open source
    licenses (e.g. legal teams).
 
@@ -225,7 +225,7 @@ your Metadata, the easier it is to cope with future changes.
 
    -  Layers support the inclusion of technologies, hardware components,
       and software components. The :ref:`Yocto Project
-      Compatible <dev-manual/common-tasks:making sure your layer is compatible with yocto project>`
+      Compatible <dev-manual/layers:making sure your layer is compatible with yocto project>`
       designation provides a minimum level of standardization that
       contributes to a strong ecosystem. "YP Compatible" is applied to
       appropriate products and software components such as BSPs, other
@@ -269,7 +269,7 @@ of the ``poky`` repository, you will see several layers: ``meta``,
 layer.
 
 For procedures on how to create layers, see the
-":ref:`dev-manual/common-tasks:understanding and creating layers`"
+":ref:`dev-manual/layers:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 Components and Tools
@@ -351,7 +351,7 @@ Yocto Project:
    (BitBake and
    OE-Core) automatically generates upgrades for recipes that are based
    on new versions of the recipes published upstream. See
-   :ref:`dev-manual/common-tasks:using the auto upgrade helper (auh)`
+   :ref:`dev-manual/upgrading-recipes:using the auto upgrade helper (auh)`
    for how to set it up.
 
 -  *Recipe Reporting System:* The Recipe Reporting System tracks recipe
@@ -781,7 +781,7 @@ helpful for getting started:
    Yocto Project.
 
    For more detailed information on layers, see the
-   ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+   ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For a
    discussion specifically on BSP Layers, see the
    ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 04afd3acf7..d27deb8c08 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -67,8 +67,8 @@ inherit the ``allarch`` class.
 The ``archiver`` class supports releasing source code and other
 materials with the binaries.
 
-For more details on the source archiver, see the
-":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
+For more details on the source :ref:`ref-classes-archiver`, see the
+":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual. You can also see
 the :term:`ARCHIVER_MODE` variable for information
 about the variable flags (varflags) that help control archive creation.
@@ -86,7 +86,7 @@ standardization. This class defines a set of tasks (e.g. ``configure``,
 should usually be enough to define a few standard variables and then
 simply ``inherit autotools``. These classes can also work with software
 that emulates Autotools. For more information, see the
-":ref:`dev-manual/common-tasks:autotooled package`" section
+":ref:`dev-manual/new-recipe:building an autotooled package`" section
 in the Yocto Project Development Tasks Manual.
 
 By default, the ``autotools*`` classes use out-of-tree builds (i.e.
@@ -216,7 +216,7 @@ The ``buildhistory`` class records a history of build output metadata,
 which can be used to detect possible regressions as well as used for
 analysis of the build output. For more information on using Build
 History, see the
-":ref:`dev-manual/common-tasks:maintaining build output quality`"
+":ref:`dev-manual/build-quality:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-buildstats:
@@ -384,7 +384,7 @@ by the :term:`SPDX_PRETTY`, :term:`SPDX_ARCHIVE_PACKAGED`,
 :term:`SPDX_ARCHIVE_SOURCES` and :term:`SPDX_INCLUDE_SOURCES` variables.
 
 See the description of these variables and the
-":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+":ref:`dev-manual/sbom:creating a software bill of materials`"
 section in the Yocto Project Development Manual for more details.
 
 .. _ref-classes-cross:
@@ -478,7 +478,7 @@ These can only be detected by reviewing the details of the issues and iterating
 and following what happens in other Linux distributions and in the greater open source community.
 
 You will find some more details in the
-":ref:`dev-manual/common-tasks:checking for vulnerabilities`"
+":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
 .. _ref-classes-debian:
@@ -517,10 +517,10 @@ staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 ``devshell.bbclass``
 ====================
 
-The ``devshell`` class adds the ``do_devshell`` task. Distribution
-policy dictates whether to include this class. See the ":ref:`dev-manual/common-tasks:using a development shell`"
+The :ref:`ref-classes-devshell` class adds the :ref:`ref-tasks-devshell` task. Distribution
+policy dictates whether to include this class. See the ":ref:`dev-manual/development-shell:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
-information about using ``devshell``.
+information about using :ref:`ref-classes-devshell`.
 
 .. _ref-classes-devupstream:
 
@@ -591,9 +591,8 @@ See these variables for more information:
 
 For more information on the ``externalsrc`` class, see the comments in
 ``meta/classes/externalsrc.bbclass`` in the :term:`Source Directory`.
-For information on how to use the
-``externalsrc`` class, see the
-":ref:`dev-manual/common-tasks:building software from an external source`"
+For information on how to use the :ref:`ref-classes-externalsrc` class, see the
+":ref:`dev-manual/building:building software from an external source`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-extrausers:
@@ -942,7 +941,7 @@ then one or more image files are created.
    install into the image.
 
 For information on customizing images, see the
-":ref:`dev-manual/common-tasks:customizing images`" section
+":ref:`dev-manual/customizing-images:customizing images`" section
 in the Yocto Project Development Tasks Manual. For information on how
 images are created, see the
 ":ref:`overview-manual/concepts:images`" section in the
@@ -1330,7 +1329,7 @@ packages such as ``kernel-vmlinux``.
 The ``kernel`` class contains logic that allows you to embed an initial
 RAM filesystem (initramfs) image when you build the kernel image. For
 information on how to build an initramfs, see the
-":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section in
+":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section in
 the Yocto Project Development Tasks Manual.
 
 Various other classes are used by the ``kernel`` and ``module`` classes
@@ -1629,7 +1628,7 @@ different target optimizations or target architectures and installing
 them side-by-side in the same image.
 
 For more information on using the Multilib feature, see the
-":ref:`dev-manual/common-tasks:combining multiple versions of library files into one image`"
+":ref:`dev-manual/libraries:combining multiple versions of library files into one image`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-native:
@@ -1737,7 +1736,7 @@ package manager (NPM) <https://en.wikipedia.org/wiki/Npm_(software)>`__.
    fetcher to have dependencies fetched and packaged automatically.
 
 For information on how to create NPM packages, see the
-":ref:`dev-manual/common-tasks:creating node package manager (npm) packages`"
+":ref:`dev-manual/packages:creating node package manager (npm) packages`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-oelint:
@@ -1915,7 +1914,7 @@ If you take the optional step to set up a repository (package feed) on
 the development host that can be used by DNF, you can install packages
 from the feed while you are running the image on the target (i.e.
 runtime installation of packages). For more information, see the
-":ref:`dev-manual/common-tasks:using runtime package management`"
+":ref:`dev-manual/packages:using runtime package management`"
 section in the Yocto Project Development Tasks Manual.
 
 The package-specific class you choose can affect build-time performance
@@ -2034,7 +2033,7 @@ so forth). It is highly recommended that all package group recipes
 inherit this class.
 
 For information on how to use this class, see the
-":ref:`dev-manual/common-tasks:customizing images using custom package groups`"
+":ref:`dev-manual/customizing-images:customizing images using custom package groups`"
 section in the Yocto Project Development Tasks Manual.
 
 Previously, this class was called the ``task`` class.
@@ -2250,8 +2249,8 @@ The ``primport`` class provides functionality for importing
 ``prserv.bbclass``
 ==================
 
-The ``prserv`` class provides functionality for using a :ref:`PR
-service <dev-manual/common-tasks:working with a pr service>` in order to
+The :ref:`ref-classes-prserv` class provides functionality for using a :ref:`PR
+service <dev-manual/packages:working with a pr service>` in order to
 automatically manage the incrementing of the :term:`PR`
 variable for each recipe.
 
@@ -2271,7 +2270,7 @@ runtime tests for recipes that build software that provides these tests.
 This class is intended to be inherited by individual recipes. However,
 the class' functionality is largely disabled unless "ptest" appears in
 :term:`DISTRO_FEATURES`. See the
-":ref:`dev-manual/common-tasks:testing packages with ptest`"
+":ref:`dev-manual/packages:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual for more information
 on ptest.
 
@@ -2284,7 +2283,7 @@ Enables package tests (ptests) specifically for GNOME packages, which
 have tests intended to be executed with ``gnome-desktop-testing``.
 
 For information on setting up and running ptests, see the
-":ref:`dev-manual/common-tasks:testing packages with ptest`"
+":ref:`dev-manual/packages:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-python3-dir:
@@ -2371,8 +2370,8 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
 ``report-error.bbclass``
 ========================
 
-The ``report-error`` class supports enabling the :ref:`error reporting
-tool <dev-manual/common-tasks:using the error reporting tool>`",
+The :ref:`ref-classes-report-error` class supports enabling the :ref:`error reporting
+tool <dev-manual/error-reporting-tool:using the error reporting tool>`",
 which allows you to submit build error information to a central database.
 
 The class collects debug information for recipe, recipe version, task,
@@ -2776,8 +2775,8 @@ Services are set up to start on boot automatically
 unless you have set
 :term:`SYSTEMD_AUTO_ENABLE` to "disable".
 
-For more information on ``systemd``, see the
-":ref:`dev-manual/common-tasks:selecting an initialization manager`"
+For more information on :ref:`ref-classes-systemd`, see the
+":ref:`dev-manual/init-manager:selecting an initialization manager`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-systemd-boot:
@@ -2853,7 +2852,7 @@ runs tests on an image after the image is constructed (i.e.
 :term:`TESTIMAGE_AUTO` must be set to "1").
 
 For information on how to enable, run, and create new tests, see the
-":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-testsdk:
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index a1a8bcdc98..ba0385c4c8 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -411,7 +411,7 @@ Upgrading a Recipe
 As software matures, upstream recipes are upgraded to newer versions. As
 a developer, you need to keep your local recipes up-to-date with the
 upstream version releases. There are several ways of upgrading recipes.
-You can read about them in the ":ref:`dev-manual/common-tasks:upgrading recipes`"
+You can read about them in the ":ref:`dev-manual/upgrading-recipes:upgrading recipes`"
 section of the Yocto Project Development Tasks Manual. This section
 overviews the ``devtool upgrade`` command.
 
@@ -439,7 +439,7 @@ You can read more on the ``devtool upgrade`` workflow in the
 ":ref:`sdk-manual/extensible:use \`\`devtool upgrade\`\` to create a version of the recipe that supports a newer version of the software`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual. You can also see an example of
-how to use ``devtool upgrade`` in the ":ref:`dev-manual/common-tasks:using \`\`devtool upgrade\`\``"
+how to use ``devtool upgrade`` in the ":ref:`dev-manual/upgrading-recipes:using \`\`devtool upgrade\`\``"
 section in the Yocto Project Development Tasks Manual.
 
 .. _devtool-resetting-a-recipe:
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index e06b5e6caa..b428dc2db6 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -45,7 +45,7 @@ section for steps on how to update your build tools.
 **A:** Support for an additional board is added by creating a Board
 Support Package (BSP) layer for it. For more information on how to
 create a BSP layer, see the
-":ref:`dev-manual/common-tasks:understanding and creating layers`"
+":ref:`dev-manual/layers:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual and the
 :doc:`/bsp-guide/index`.
 
@@ -73,7 +73,7 @@ device.
 
 **A:** To add a package, you need to create a BitBake recipe. For
 information on how to create a BitBake recipe, see the
-":ref:`dev-manual/common-tasks:writing a new recipe`"
+":ref:`dev-manual/new-recipe:writing a new recipe`"
 section in the Yocto Project Development Tasks Manual.
 
 **Q:** Do I have to reflash my entire board with a new Yocto Project
@@ -201,7 +201,7 @@ You can find more information on licensing in the
 ":ref:`overview-manual/development-environment:licensing`"
 section in the Yocto
 Project Overview and Concepts Manual and also in the
-":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 **Q:** How do I disable the cursor on my touchscreen device?
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 89aeb989c1..a7078c7f3a 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -157,7 +157,7 @@ metadata:
 
 -  *ptest:* Enables building the package tests where supported by
    individual recipes. For more information on package tests, see the
-   ":ref:`dev-manual/common-tasks:testing packages with ptest`" section
+   ":ref:`dev-manual/packages:testing packages with ptest`" section
    in the Yocto Project Development Tasks Manual.
 
 -  *smbfs:* Include SMB networks client support (for mounting
@@ -241,7 +241,7 @@ Here are the image features available for all images:
 
 -  *read-only-rootfs:* Creates an image whose root filesystem is
    read-only. See the
-   ":ref:`dev-manual/common-tasks:creating a read-only root filesystem`"
+   ":ref:`dev-manual/read-only-rootfs:creating a read-only root filesystem`"
    section in the Yocto Project Development Tasks Manual for more
    information.
 
@@ -278,7 +278,7 @@ these valid features is as follows:
 
 -  *tools-debug:* Installs debugging tools such as ``strace`` and
    ``gdb``. For information on GDB, see the
-   ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
+   ":ref:`dev-manual/debugging:debugging with the gnu project debugger (gdb) remotely`" section
    in the Yocto Project Development Tasks Manual. For information on
    tracing and profiling, see the :doc:`/profile-manual/index`.
 
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index 33e5b53d9f..da27512855 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -119,7 +119,7 @@ Following is a list of supported recipes:
    deployed to a separate partition so that you can boot into it and use
    it to deploy a second image to be tested. You can find more
    information about runtime testing in the
-   ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+   ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
    section in the Yocto Project Development Tasks Manual.
 
 -  ``core-image-testmaster-initramfs``: A RAM-based Initial Root
@@ -129,7 +129,7 @@ Following is a list of supported recipes:
 -  ``core-image-weston``: A very basic Wayland image with a terminal.
    This image provides the Wayland protocol libraries and the reference
    Weston compositor. For more information, see the
-   ":ref:`dev-manual/common-tasks:using wayland and weston`"
+   ":ref:`dev-manual/wayland:using wayland and weston`"
    section in the Yocto Project Development Tasks Manual.
 
 -  ``core-image-x11``: A very basic X11 image with a terminal.
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index d82da0ee75..c7766a2dfd 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -82,7 +82,7 @@ the ``part`` and ``partition`` commands:
    source of the data that populates the partition. The most common
    value for this option is "rootfs", but you can use any value that
    maps to a valid source plugin. For information on the source plugins,
-   see the ":ref:`dev-manual/common-tasks:using the wic plugin interface`"
+   see the ":ref:`dev-manual/wic:using the wic plugin interface`"
    section in the Yocto Project Development Tasks Manual.
 
    If you use ``--source rootfs``, Wic creates a partition as large as
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index d376d51bd2..bf803a3db1 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -143,7 +143,7 @@ Additionally, because the test strategies are visible to you as a
 developer, you can validate your projects. This section overviews the
 available test infrastructure used in the Yocto Project. For information
 on how to run available tests on your projects, see the
-":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 The QA/testing infrastructure is woven into the project to the point
@@ -170,7 +170,7 @@ consists of the following pieces:
    operation and functions. However, the test can also use the IP
    address of a machine to test.
 
--  :ref:`ptest <dev-manual/common-tasks:testing packages with ptest>`:
+-  :ref:`ptest <dev-manual/packages:testing packages with ptest>`:
    Runs tests against packages produced during the build for a given
    piece of software. The test allows the packages to be run within a
    target image.
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 262b041ea6..d21134fd7f 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -175,7 +175,7 @@ within the :term:`Source Directory`. If you design a
 custom distribution, you can include your own version of this
 configuration file to mention the targets defined by your distribution.
 See the
-":ref:`dev-manual/common-tasks:creating a custom template configuration directory`"
+":ref:`dev-manual/custom-template-configuration-directory:creating a custom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
 information.
 
@@ -191,7 +191,7 @@ Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`::
 The OpenEmbedded build system uses the template configuration files, which
 are found by default in the ``meta-poky/conf/`` directory in the Source
 Directory. See the
-":ref:`dev-manual/common-tasks:creating a custom template configuration directory`"
+":ref:`dev-manual/custom-template-configuration-directory:creating a custom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
 information.
 
@@ -234,7 +234,7 @@ The OpenEmbedded build system creates this directory when you enable
 build history via the :ref:`buildhistory <ref-classes-buildhistory>` class file. The directory
 organizes build information into image, packages, and SDK
 subdirectories. For information on the build history feature, see the
-":ref:`dev-manual/common-tasks:maintaining build output quality`"
+":ref:`dev-manual/build-quality:maintaining build output quality`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _structure-build-conf-local.conf:
@@ -289,7 +289,7 @@ file, it uses ``sed`` to substitute final
 ----------------------------
 
 This configuration file defines
-:ref:`layers <dev-manual/common-tasks:understanding and creating layers>`,
+:ref:`layers <dev-manual/layers:understanding and creating layers>`,
 which are directory trees, traversed (or walked) by BitBake. The
 ``bblayers.conf`` file uses the :term:`BBLAYERS`
 variable to list the layers BitBake tries to find.
@@ -434,7 +434,7 @@ directory contains sub-directories for ``bash``, ``busybox``, and
 ``glibc`` (among others) that in turn contain appropriate ``COPYING``
 license files with other licensing information. For information on
 licensing, see the
-":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
+":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _structure-build-tmp-deploy-images:
@@ -571,7 +571,7 @@ built within the Yocto Project. For this package, a work directory of
 ``tmp/work/qemux86-poky-linux/linux-yocto/3.0+git1+<.....>``, referred
 to as the :term:`WORKDIR`, is created. Within this directory, the source is
 unpacked to ``linux-qemux86-standard-build`` and then patched by Quilt.
-(See the ":ref:`dev-manual/common-tasks:using quilt in your workflow`" section in
+(See the ":ref:`dev-manual/quilt:using quilt in your workflow`" section in
 the Yocto Project Development Tasks Manual for more information.) Within
 the ``linux-qemux86-standard-build`` directory, standard Quilt
 directories ``linux-3.0/patches`` and ``linux-3.0/.pc`` are created, and
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index a2b8763e7c..e61f6659eb 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -343,7 +343,7 @@ while ``file2.patch`` would not be applied.
 You can find out more about the patching process in the
 ":ref:`overview-manual/concepts:patching`" section in
 the Yocto Project Overview and Concepts Manual and the
-":ref:`dev-manual/common-tasks:patching code`" section in the
+":ref:`dev-manual/new-recipe:patching code`" section in the
 Yocto Project Development Tasks Manual.
 
 .. _ref-tasks-populate_lic:
@@ -522,7 +522,7 @@ scratch is guaranteed.
 Starts a shell in which an interactive Python interpreter allows you to
 interact with the BitBake build environment. From within this shell, you
 can directly examine and set bits from the data store and execute
-functions as if within the BitBake environment. See the ":ref:`dev-manual/common-tasks:using a python development shell`" section in
+functions as if within the BitBake environment. See the ":ref:`dev-manual/python-development-shell:using a Python development shell`" section in
 the Yocto Project Development Tasks Manual for more information about
 using ``pydevshell``.
 
@@ -532,7 +532,7 @@ using ``pydevshell``.
 ---------------
 
 Starts a shell whose environment is set up for development, debugging,
-or both. See the ":ref:`dev-manual/common-tasks:using a development shell`" section in the
+or both. See the ":ref:`dev-manual/development-shell:using a development shell`" section in the
 Yocto Project Development Tasks Manual for more information about using
 ``devshell``.
 
@@ -597,7 +597,7 @@ information on how the root filesystem is created.
 
 Boots an image and performs runtime tests within the image. For
 information on automatically testing images, see the
-":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _ref-tasks-testimage_auto:
@@ -610,7 +610,7 @@ after it has been built. This task is enabled when you set
 :term:`TESTIMAGE_AUTO` equal to "1".
 
 For information on automatically testing images, see the
-":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
 section in the Yocto Project Development Tasks Manual.
 
 Kernel-Related Tasks
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index a7ae8e1801..2a5baa4cbf 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -21,7 +21,7 @@ universal, the list includes them just in case:
 
       Information in append files extends or overrides the information in the
       similarly-named recipe file. For an example of an append file in use, see
-      the    ":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
+      the    ":ref:`dev-manual/layers:appending other layers metadata with your layer`"
       section in the Yocto Project Development Tasks Manual.
 
       When you name an append file, you can use the "``%``" wildcard character
@@ -247,7 +247,7 @@ universal, the list includes them just in case:
       ":ref:`overview-manual/yp-intro:The Yocto Project Layer
       Model`" section in the Yocto Project Overview and Concepts Manual. For
       more detailed information on layers, see the
-      ":ref:`dev-manual/common-tasks:Understanding and Creating
+      ":ref:`dev-manual/layers:Understanding and Creating
       Layers`" section in the Yocto Project Development Tasks Manual. For a
       discussion specifically on BSP Layers, see the ":ref:`bsp-guide/bsp:BSP
       Layers`" section in the Yocto Project Board Support Packages (BSP)
@@ -391,7 +391,7 @@ universal, the list includes them just in case:
 
       The OpenEmbedded Build System can generate such documentation for your
       project, in :term:`SPDX` format, based on all the metadata it used to
-      build the software images. See the ":ref:`dev-manual/common-tasks:creating
+      build the software images. See the ":ref:`dev-manual/sbom:creating
       a software bill of materials`" section of the Development Tasks manual.
 
    :term:`Source Directory`
@@ -462,7 +462,7 @@ universal, the list includes them just in case:
       provide an :term:`SBOM` associated to each software image.
 
       For details, see Wikipedia's :wikipedia:`SPDX page <Software_Package_Data_Exchange>`
-      and the ":ref:`dev-manual/common-tasks:creating a software bill of materials`"
+      and the ":ref:`dev-manual/sbom:creating a software bill of materials`"
       section of the Development Tasks manual.
 
    :term:`Task`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 78cad25ca3..a043d20494 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -223,7 +223,7 @@ system and gives an overview of their function and contents.
       so that it does contain ``${SRCPV}``.
 
       For more information see the
-      ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
+      ":ref:`dev-manual/packages:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`AUTO_SYSLINUXMENU`
@@ -239,7 +239,7 @@ system and gives an overview of their function and contents.
       The list simply presents the tunes that are available. Not all tunes
       may be compatible with a particular machine configuration, or with
       each other in a
-      :ref:`Multilib <dev-manual/common-tasks:combining multiple versions of library files into one image>`
+      :ref:`Multilib <dev-manual/libraries:combining multiple versions of library files into one image>`
       configuration.
 
       To add a tune to the list, be sure to append it with spaces using the
@@ -304,7 +304,7 @@ system and gives an overview of their function and contents.
    :term:`BASE_LIB`
       The library directory name for the CPU or Application Binary
       Interface (ABI) tune. The :term:`BASE_LIB` applies only in the Multilib
-      context. See the ":ref:`dev-manual/common-tasks:combining multiple versions of library files into one image`"
+      context. See the ":ref:`dev-manual/libraries:combining multiple versions of library files into one image`"
       section in the Yocto Project Development Tasks Manual for information
       on Multilib.
 
@@ -528,7 +528,7 @@ system and gives an overview of their function and contents.
       is not set higher than "20".
 
       For more information on speeding up builds, see the
-      ":ref:`dev-manual/common-tasks:speeding up a build`"
+      ":ref:`dev-manual/speeding-up-build:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`BB_SERVER_TIMEOUT`
@@ -725,7 +725,7 @@ system and gives an overview of their function and contents.
 
       For information on how to use :term:`BBMULTICONFIG` in an environment
       that supports building targets with multiple configurations, see the
-      ":ref:`dev-manual/common-tasks:building images for multiple targets using multiple configurations`"
+      ":ref:`dev-manual/building:building images for multiple targets using multiple configurations`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`BBPATH`
@@ -971,7 +971,7 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the build history features to be
       enabled. For more information on how build history works, see the
-      ":ref:`dev-manual/common-tasks:maintaining build output quality`"
+      ":ref:`dev-manual/build-quality:maintaining build output quality`"
       section in the Yocto Project Development Tasks Manual.
 
       You can specify these features in the form of a space-separated list:
@@ -1294,8 +1294,8 @@ system and gives an overview of their function and contents.
       If you specify multiple directories and files, the initramfs image
       will be the aggregate of all of them.
 
-      For information on creating an initramfs, see the
-      ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
+      For information on creating an :term:`Initramfs`, see the
+      ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`CONFIG_SITE`
@@ -1330,7 +1330,7 @@ system and gives an overview of their function and contents.
          newly installed packages to an image, which might be most suitable for
          read-only filesystems that cannot be upgraded. See the
          :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
-         You can also reference the ":ref:`dev-manual/common-tasks:providing license text`"
+         You can also reference the ":ref:`dev-manual/licenses:providing license text`"
          section in the Yocto Project Development Tasks Manual for
          information on providing license text.
 
@@ -1346,7 +1346,7 @@ system and gives an overview of their function and contents.
          newly installed packages to an image, which might be most suitable for
          read-only filesystems that cannot be upgraded. See the
          :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
-         You can also reference the ":ref:`dev-manual/common-tasks:providing license text`"
+         You can also reference the ":ref:`dev-manual/licenses:providing license text`"
          section in the Yocto Project Development Tasks Manual for
          information on providing license text.
 
@@ -2091,11 +2091,10 @@ system and gives an overview of their function and contents.
       less).
 
    :term:`ERR_REPORT_DIR`
-      When used with the :ref:`report-error <ref-classes-report-error>`
-      class, specifies the path used for storing the debug files created by
-      the :ref:`error reporting
-      tool <dev-manual/common-tasks:using the error reporting tool>`, which
-      allows you to submit build errors you encounter to a central
+      When used with the :ref:`ref-classes-report-error` class, specifies the
+      path used for storing the debug files created by the :ref:`error reporting
+      tool <dev-manual/error-reporting-tool:using the error reporting tool>`,
+      which allows you to submit build errors you encounter to a central
       database. By default, the value of this variable is
       ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
@@ -2258,7 +2257,7 @@ system and gives an overview of their function and contents.
 
       See the ":ref:`ref-classes-externalsrc`" section for details. You
       can also find information on how to use this variable in the
-      ":ref:`dev-manual/common-tasks:building software from an external source`"
+      ":ref:`dev-manual/building:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTERNALSRC_BUILD`
@@ -2271,11 +2270,11 @@ system and gives an overview of their function and contents.
 
       See the ":ref:`ref-classes-externalsrc`" section for details. You
       can also find information on how to use this variable in the
-      ":ref:`dev-manual/common-tasks:building software from an external source`"
+      ":ref:`dev-manual/building:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTRA_AUTORECONF`
-      For recipes inheriting the :ref:`autotools <ref-classes-autotools>`
+      For recipes inheriting the :ref:`ref-classes-autotools`
       class, you can use :term:`EXTRA_AUTORECONF` to specify extra options to
       pass to the ``autoreconf`` command that is executed during the
       :ref:`ref-tasks-configure` task.
@@ -2309,7 +2308,7 @@ system and gives an overview of their function and contents.
           useful if you want to develop against the libraries in the image.
         - "read-only-rootfs" - Creates an image whose root filesystem is
           read-only. See the
-          ":ref:`dev-manual/common-tasks:creating a read-only root filesystem`"
+          ":ref:`dev-manual/read-only-rootfs:creating a read-only root filesystem`"
           section in the Yocto Project Development Tasks Manual for more
           information
         - "tools-debug" - Adds debugging tools such as gdb and strace.
@@ -2322,7 +2321,7 @@ system and gives an overview of their function and contents.
       Project, see the ":ref:`ref-features-image`" section.
 
       For an example that shows how to customize your image by using this
-      variable, see the ":ref:`dev-manual/common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
+      variable, see the ":ref:`dev-manual/customizing-images:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTRA_IMAGECMD`
@@ -2681,7 +2680,7 @@ system and gives an overview of their function and contents.
       You can find out more about the patching process in the
       ":ref:`overview-manual/concepts:patching`" section
       in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/common-tasks:patching code`" section in
+      ":ref:`dev-manual/new-recipe:patching code`" section in
       the Yocto Project Development Tasks Manual. See the
       :ref:`ref-tasks-patch` task as well.
 
@@ -2813,7 +2812,7 @@ system and gives an overview of their function and contents.
       Allows to specify an extra search path for ``.so`` files
       in GLib related recipes using GObject introspection,
       and which do not compile without this setting.
-      See the ":ref:`dev-manual/common-tasks:enabling gobject introspection support`"
+      See the ":ref:`dev-manual/gobject-introspection:enabling gobject introspection support`"
       section for details.
 
    :term:`GITDIR`
@@ -3098,7 +3097,7 @@ system and gives an overview of their function and contents.
       the same files into a ``boot`` directory within the target partition.
 
       You can find information on how to use the Wic tool in the
-      ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
+      ":ref:`dev-manual/wic:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
@@ -3170,7 +3169,7 @@ system and gives an overview of their function and contents.
       the same files into a ``boot`` directory within the target partition.
 
       You can find information on how to use the Wic tool in the
-      ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
+      ":ref:`dev-manual/wic:creating partitioned images using wic`"
       section of the Yocto Project Development Tasks Manual. Reference
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
@@ -3191,7 +3190,7 @@ system and gives an overview of their function and contents.
       the ":ref:`ref-features-image`" section.
 
       For an example that shows how to customize your image by using this
-      variable, see the ":ref:`dev-manual/common-tasks:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
+      variable, see the ":ref:`dev-manual/customizing-images:customizing images using custom \`\`image_features\`\` and \`\`extra_image_features\`\``"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`IMAGE_FSTYPES`
@@ -3246,8 +3245,8 @@ system and gives an overview of their function and contents.
             :term:`PACKAGE_INSTALL` variable, which
             allows the initial RAM filesystem (initramfs) recipe to use a
             fixed set of packages and not be affected by :term:`IMAGE_INSTALL`.
-            For information on creating an initramfs, see the
-            ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`"
+            For information on creating an :term:`Initramfs`, see the
+            ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`"
             section in the Yocto Project Development Tasks Manual.
 
          -  Using :term:`IMAGE_INSTALL` with the
@@ -3749,8 +3748,8 @@ system and gives an overview of their function and contents.
       For more information, you can also see the
       :term:`INITRAMFS_IMAGE_BUNDLE`
       variable, which allows the generated image to be bundled inside the
-      kernel image. Additionally, for information on creating an initramfs
-      image, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
+      kernel image. Additionally, for information on creating an :term:`Initramfs`
+      image, see the ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_IMAGE_BUNDLE`
@@ -3802,7 +3801,7 @@ system and gives an overview of their function and contents.
       See the
       :yocto_git:`local.conf.sample.extended </poky/tree/meta-poky/conf/local.conf.sample.extended>`
       file for additional information. Also, for information on creating an
-      initramfs, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
+      :term:`Initramfs`, see the ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_LINK_NAME`
@@ -3827,8 +3826,8 @@ system and gives an overview of their function and contents.
       This allows the kernel to bundle an :term:`INITRAMFS_IMAGE` coming from
       a separate multiconfig, this is meant to be used in addition to :term:`INITRAMFS_DEPLOY_DIR_IMAGE`.
 
-      For more information on how to bundle an initramfs image from a separate
-      multiconfig see the ":ref:`dev-manual/common-tasks:Bundling an Initramfs Image From a Separate Multiconfig`"
+      For more information on how to bundle an :term:`Initramfs` image from a separate
+      multiconfig see the ":ref:`dev-manual/building:Bundling an Initramfs Image From a Separate Multiconfig`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_NAME`
@@ -4422,7 +4421,7 @@ system and gives an overview of their function and contents.
          The OpenEmbedded build system produces a warning if the variable
          is not set for any given layer.
 
-      See the ":ref:`dev-manual/common-tasks:creating your own layer`"
+      See the ":ref:`dev-manual/layers:creating your own layer`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LAYERVERSION`
@@ -4471,7 +4470,7 @@ system and gives an overview of their function and contents.
       This variable must be defined for all recipes (unless
       :term:`LICENSE` is set to "CLOSED").
 
-      For more information, see the ":ref:`dev-manual/common-tasks:tracking license changes`"
+      For more information, see the ":ref:`dev-manual/licenses:tracking license changes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE`
@@ -4535,7 +4534,7 @@ system and gives an overview of their function and contents.
       For related information on providing license text, see the
       :term:`COPY_LIC_DIRS` variable, the
       :term:`COPY_LIC_MANIFEST` variable, and the
-      ":ref:`dev-manual/common-tasks:providing license text`"
+      ":ref:`dev-manual/licenses:providing license text`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_FLAGS`
@@ -4548,14 +4547,14 @@ system and gives an overview of their function and contents.
       typically used to mark recipes that might require additional licenses
       in order to be used in a commercial product. For more information,
       see the
-      ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
+      ":ref:`dev-manual/licenses:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_FLAGS_ACCEPTED`
       Lists license flags that when specified in
       :term:`LICENSE_FLAGS` within a recipe should not
       prevent that recipe from being built.  For more information, see the
-      ":ref:`dev-manual/common-tasks:enabling commercially licensed recipes`"
+      ":ref:`dev-manual/licenses:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`LICENSE_PATH`
@@ -5115,7 +5114,7 @@ system and gives an overview of their function and contents.
       Controls how the OpenEmbedded build system spawns interactive
       terminals on the host development system (e.g. using the BitBake
       command with the ``-c devshell`` command-line option). For more
-      information, see the ":ref:`dev-manual/common-tasks:using a development shell`" section in
+      information, see the ":ref:`dev-manual/development-shell:using a development shell`" section in
       the Yocto Project Development Tasks Manual.
 
       You can use the following values for the :term:`OE_TERMINAL` variable:
@@ -5182,7 +5181,7 @@ system and gives an overview of their function and contents.
 
          An easy way to see what overrides apply is to search for :term:`OVERRIDES`
          in the output of the ``bitbake -e`` command. See the
-         ":ref:`dev-manual/common-tasks:viewing variable values`" section in the Yocto
+         ":ref:`dev-manual/debugging:viewing variable values`" section in the Yocto
          Project Development Tasks Manual for more information.
 
    :term:`P`
@@ -5203,7 +5202,7 @@ system and gives an overview of their function and contents.
       specific by using the package name as a suffix.
 
       You can find out more about applying this variable in the
-      ":ref:`dev-manual/common-tasks:adding custom metadata to packages`"
+      ":ref:`dev-manual/packages:adding custom metadata to packages`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_ARCH`
@@ -5310,7 +5309,7 @@ system and gives an overview of their function and contents.
          use of the :term:`INHIBIT_PACKAGE_DEBUG_SPLIT` variable.
 
       You can find out more about debugging using GDB by reading the
-      ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`" section
+      ":ref:`dev-manual/debugging:debugging with the gnu project debugger (gdb) remotely`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_EXCLUDE`
@@ -5469,7 +5468,7 @@ system and gives an overview of their function and contents.
       the :ref:`core-image-minimal-initramfs <ref-manual/images:images>`
       image. When working with an initial RAM filesystem (initramfs) image,
       use the :term:`PACKAGE_INSTALL` variable. For information on creating an
-      initramfs, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
+      :term:`Initramfs`, see the ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGE_INSTALL_ATTEMPTONLY`
@@ -5492,7 +5491,7 @@ system and gives an overview of their function and contents.
       :term:`PACKAGE_WRITE_DEPS`.
 
       For information on running post-installation scripts, see the
-      ":ref:`dev-manual/common-tasks:post-installation scripts`"
+      ":ref:`dev-manual/new-recipe:post-installation scripts`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGECONFIG`
@@ -5643,7 +5642,7 @@ system and gives an overview of their function and contents.
 
       For an example of how to use the :term:`PACKAGES_DYNAMIC` variable when
       you are splitting packages, see the
-      ":ref:`dev-manual/common-tasks:handling optional module packaging`"
+      ":ref:`dev-manual/packages:handling optional module packaging`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PACKAGESPLITFUNCS`
@@ -5678,7 +5677,7 @@ system and gives an overview of their function and contents.
          the ``do_compile`` task that result in race conditions, you can clear
          the :term:`PARALLEL_MAKE` variable within the recipe as a workaround. For
          information on addressing race conditions, see the
-         ":ref:`dev-manual/common-tasks:debugging parallel make races`"
+         ":ref:`dev-manual/debugging:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
 
       For single socket systems (i.e. one CPU), you should not have to
@@ -5688,7 +5687,7 @@ system and gives an overview of their function and contents.
       not set higher than "-j 20".
 
       For more information on speeding up builds, see the
-      ":ref:`dev-manual/common-tasks:speeding up a build`"
+      ":ref:`dev-manual/speeding-up-build:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`PARALLEL_MAKEINST`
@@ -5708,7 +5707,7 @@ system and gives an overview of their function and contents.
          the ``do_install`` task that result in race conditions, you can
          clear the :term:`PARALLEL_MAKEINST` variable within the recipe as a
          workaround. For information on addressing race conditions, see the
-         ":ref:`dev-manual/common-tasks:debugging parallel make races`"
+         ":ref:`dev-manual/debugging:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
 
    :term:`PATCHRESOLVE`
@@ -5808,7 +5807,7 @@ system and gives an overview of their function and contents.
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
-      ":ref:`dev-manual/common-tasks:viewing package information with \`\`oe-pkgdata-util\`\``"
+      ":ref:`dev-manual/debugging:viewing package information with \`\`oe-pkgdata-util\`\``"
       section in the Yocto Project Development Tasks Manual. For more
       information on the shared, global-state directory, see
       :term:`STAGING_DIR_HOST`.
@@ -5924,7 +5923,7 @@ system and gives an overview of their function and contents.
 
       Because manually managing :term:`PR` can be cumbersome and error-prone,
       an automated solution exists. See the
-      ":ref:`dev-manual/common-tasks:working with a pr service`" section
+      ":ref:`dev-manual/packages:working with a pr service`" section
       in the Yocto Project Development Tasks Manual for more information.
 
    :term:`PREFERRED_PROVIDER`
@@ -5947,7 +5946,7 @@ system and gives an overview of their function and contents.
          PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 
       For more
-      information, see the ":ref:`dev-manual/common-tasks:using virtual providers`"
+      information, see the ":ref:`dev-manual/new-recipe:using virtual providers`"
       section in the Yocto Project Development Tasks Manual.
 
       .. note::
@@ -6147,7 +6146,7 @@ system and gives an overview of their function and contents.
 
       You must
       set the variable if you want to automatically start a local :ref:`PR
-      service <dev-manual/common-tasks:working with a pr service>`. You can
+      service <dev-manual/packages:working with a pr service>`. You can
       set :term:`PRSERV_HOST` to other values to use a remote PR service.
 
 
@@ -6161,7 +6160,7 @@ system and gives an overview of their function and contents.
 
    :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package
-      Test <dev-manual/common-tasks:testing packages with ptest>` (ptest)
+      Test <dev-manual/packages:testing packages with ptest>` (ptest)
       functionality is enabled when building a recipe. You should not set
       this variable directly. Enabling and disabling building Package Tests
       at build time should be done by adding "ptest" to (or removing it
@@ -7273,7 +7272,7 @@ system and gives an overview of their function and contents.
       various ``SPL_*`` variables used by the OpenEmbedded build system.
 
       See the BeagleBone machine configuration example in the
-      ":ref:`dev-manual/common-tasks:adding a layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\` script`"
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
@@ -7397,7 +7396,7 @@ system and gives an overview of their function and contents.
          For information on limitations when inheriting the latest revision
          of software using :term:`SRCREV`, see the :term:`AUTOREV` variable
          description and the
-         ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
+         ":ref:`dev-manual/packages:automatically incrementing a package version number`"
          section, which is in the Yocto Project Development Tasks Manual.
 
    :term:`SRCTREECOVEREDTASKS`
@@ -7899,8 +7898,7 @@ system and gives an overview of their function and contents.
          SYSTEMD_SERVICE:${PN} = "connman.service"
 
    :term:`SYSVINIT_ENABLED_GETTYS`
-      When using
-      :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,
+      When using :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
       specifies a space-separated list of the virtual terminals that should
       run a `getty <https://en.wikipedia.org/wiki/Getty_%28Unix%29>`__
       (allowing login), assuming :term:`USE_VT` is not set to
@@ -8182,7 +8180,7 @@ system and gives an overview of their function and contents.
       file.
 
       For more information on testing images, see the
-      ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+      ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_SERIALCONTROL_CMD`
@@ -8255,7 +8253,7 @@ system and gives an overview of their function and contents.
          TEST_SUITES = "test_A test_B"
 
       For more information on testing images, see the
-      ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+      ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_TARGET`
@@ -8274,7 +8272,7 @@ system and gives an overview of their function and contents.
       You can provide the following arguments with :term:`TEST_TARGET`:
 
       -  *"qemu":* Boots a QEMU image and runs the tests. See the
-         ":ref:`dev-manual/common-tasks:enabling runtime tests on qemu`" section
+         ":ref:`dev-manual/runtime-testing:enabling runtime tests on qemu`" section
          in the Yocto Project Development Tasks Manual for more
          information.
 
@@ -8290,7 +8288,7 @@ system and gives an overview of their function and contents.
             ``meta/lib/oeqa/controllers/simpleremote.py``.
 
       For information on running tests on hardware, see the
-      ":ref:`dev-manual/common-tasks:enabling runtime tests on hardware`"
+      ":ref:`dev-manual/runtime-testing:enabling runtime tests on hardware`"
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_TARGET_IP`
@@ -8327,7 +8325,7 @@ system and gives an overview of their function and contents.
 
       For more information
       on enabling, running, and writing these tests, see the
-      ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
+      ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`ref-classes-testimage*`" section.
 
@@ -8786,16 +8784,15 @@ system and gives an overview of their function and contents.
       specifically set. Typically, you would set :term:`USE_DEVFS` to "0" for a
       statically populated ``/dev`` directory.
 
-      See the ":ref:`dev-manual/common-tasks:selecting a device manager`" section in
+      See the ":ref:`dev-manual/device-manager:selecting a device manager`" section in
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
    :term:`USE_VT`
       When using
-      :ref:`SysVinit <dev-manual/common-tasks:enabling system services>`,
-      determines whether or not to run a
-      `getty <https://en.wikipedia.org/wiki/Getty_%28Unix%29>`__ on any
-      virtual terminals in order to enable logging in through those
+      :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
+      determines whether or not to run a :wikipedia:`getty <Getty_(Unix)>`
+      on any virtual terminals in order to enable logging in through those
       terminals.
 
       The default value used for :term:`USE_VT` is "1" when no default value is
@@ -8960,7 +8957,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system to create a partitioned image
       (``image.wic``). For information on how to create a partitioned
       image, see the
-      ":ref:`dev-manual/common-tasks:creating partitioned images using wic`"
+      ":ref:`dev-manual/wic:creating partitioned images using wic`"
       section in the Yocto Project Development Tasks Manual. For details on
       the kickstart file format, see the ":doc:`/ref-manual/kickstart`" Chapter.
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index c5970f74fa..18a2b59c96 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -606,7 +606,7 @@ counterparts.
    ``devtool upgrade``
    happens to be one. You can read about all the methods by which you
    can upgrade recipes in the
-   :ref:`dev-manual/common-tasks:upgrading recipes` section
+   :ref:`dev-manual/upgrading-recipes:upgrading recipes` section
    of the Yocto Project Development Tasks Manual.
 
 The ``devtool upgrade`` command is flexible enough to allow you to
@@ -1068,7 +1068,7 @@ links created within the source tree:
    -  ``sysroot-destdir/``: Contains a subset of files installed within
       ``do_install`` that have been put into the shared sysroot. For
       more information, see the
-      ":ref:`dev-manual/common-tasks:sharing files between recipes`" section.
+      ":ref:`dev-manual/new-recipe:sharing files between recipes`" section.
 
    -  ``packages-split/``: Contains subdirectories for each package
       produced by the recipe. For more information, see the
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 9c1a93cd40..2180eb939c 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -142,7 +142,7 @@ the following types of tests:
 -  *Package Testing:* A Package Test (ptest) runs tests against packages
    built by the OpenEmbedded build system on the target machine. See the
    :ref:`Testing Packages With
-   ptest <dev-manual/common-tasks:Testing Packages With ptest>` section
+   ptest <dev-manual/packages:Testing Packages With ptest>` section
    in the Yocto Project Development Tasks Manual and the
    ":yocto_wiki:`Ptest </Ptest>`" Wiki page for more
    information on Ptest.
diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
index 96c12ac083..65d924fad9 100644
--- a/documentation/test-manual/yocto-project-compatible.rst
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -27,7 +27,7 @@ In the second version of the program, a script was added to make validation
 easier and clearer, the script is called  ``yocto-check-layer`` and is
 available in :term:`OpenEmbedded-Core (OE-Core)`.
 
-See :ref:`dev-manual/common-tasks:making sure your layer is compatible with yocto project`
+See :ref:`dev-manual/layers:making sure your layer is compatible with yocto project`
 for details.
 
 ========
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 1bb9f98cca..927699d2a8 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -66,7 +66,7 @@ layers.
 For general information on layers, see the
 ":ref:`overview-manual/yp-intro:the yocto project layer model`"
 section in the Yocto Project Overview and Concepts Manual. For information on how
-to create layers, see the ":ref:`dev-manual/common-tasks:understanding and creating layers`"
+to create layers, see the ":ref:`dev-manual/layers:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 Configuring Toaster to Hook Into Your Layer Index
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index f0035bd3af..d7fe415cb0 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -42,7 +42,7 @@ Transitioning to a custom environment for systems development
    You might want to start with the build specification that Poky provides
    (which is reference embedded distribution) and then add your newly chosen
    layers to that. Here is the information :ref:`about adding layers
-   <dev-manual/common-tasks:Understanding and Creating Layers>`.
+   <dev-manual/layers:Understanding and Creating Layers>`.
 
 #. **Based on the layers you've chosen, make needed changes in your
    configuration**.
@@ -58,7 +58,7 @@ Transitioning to a custom environment for systems development
    releases. If you are using a Yocto Project release earlier than 2.4, use the
    ``yocto-layer create`` tool. The ``bitbake-layers`` tool also provides a number
    of other useful layer-related commands. See
-   :ref:`dev-manual/common-tasks:creating a general layer using the
+   :ref:`dev-manual/layers:creating a general layer using the
    \`\`bitbake-layers\`\` script` section.
 
 #. **Create your own layer for the BSP you're going to use**.
@@ -79,7 +79,7 @@ Transitioning to a custom environment for systems development
    process of refinement. Start by getting each step of the build process
    working beginning with fetching all the way through packaging. Next, run the
    software on your target and refine further as needed. See :ref:`Writing a New
-   Recipe <dev-manual/common-tasks:writing a new recipe>` in the
+   Recipe <dev-manual/new-recipe:writing a new recipe>` in the
    Yocto Project Development Tasks Manual for more information.
 
 #. **Now you're ready to create an image recipe**.
@@ -103,7 +103,7 @@ Transitioning to a custom environment for systems development
    needs to change for your distribution. If you find yourself adding a lot of
    configuration to your local.conf file aside from paths and other typical
    local settings, it's time to :ref:`consider creating your own distribution
-   <dev-manual/common-tasks:creating your own distribution>`.
+   <dev-manual/custom-distribution:creating your own distribution>`.
 
    You can add product specifications that can customize the distribution if
    needed in other layers. You can also add other functionality specific to the
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index dec5617173..fa5d55ff41 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -131,7 +131,7 @@ contact us with other suggestions.
    say "bitbake foo" where "foo" is the name for a specific recipe.  As you
    become more advanced using the Yocto Project, and if builds are failing, it
    can be useful to make sure the fetch itself works as desired. Here are some
-   valuable links: :ref:`dev-manual/common-tasks:Using a Development
+   valuable links: :ref:`dev-manual/development-shell:Using a Development
    Shell` for information on how to build and run a specific task using
    devshell. Also, the :ref:`SDK manual shows how to build out a specific recipe
    <sdk-manual/extensible:use \`\`devtool modify\`\` to modify the source of an existing component>`.
-- 
2.34.1


