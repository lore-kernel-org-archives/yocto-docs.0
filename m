Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CABDC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19195.1784899516062169208
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RdArbzM2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65CFC1A11E7
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AFA760395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB0A11C124F0;
	Fri, 24 Jul 2026 15:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LS3UJyfJEoTGzQ+s2HuTS5NN2puy22siusF1LUCEsR4=;
	b=RdArbzM2hixNdN8j3nh8qIaL5pcPPXIZRM6xICvgOMX2nLtmUnjt+yPtwGPe5QnU0fYzYM
	VZtde728euaPP48061rQxNP35/Z5zICI4rBO2ZljcAsDC9Vsy66A7FY59DSDU2gMBnOUgq
	5CwlTQ8YTFYz6vZd74b8S7xkyI+mxWu/nTmT8hkX5asv2Og7FeCc/S+qqb9xlrGHrI4Sn3
	zRrCSAo/PQizt3yiDPtmxbNzUICMKY0MveyTtu5tSTUhZIeQRgRGlWTj94CPsgTwfpQmrQ
	d7yKgVMZ2qsSHX/hftfoLl8CyZTM8oOCAULedoU3QhbZ6eVtz2j4nPnhWXgpLA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:03 +0200
Subject: [PATCH 6/9] bsp-guide: rename to bsp-manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-6-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=29674;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jbvdOTasGYoRr5Y/h5Sqd9oDYoa5qPyKIiias7jOZ48=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2eyXwt03Vioz1FLCEwa7ExhmRtUF0iAPU/EI
 jTyufnsbbyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnsgAKCRDRgEFAKaOo
 Nt/pEAC3sNpXvOM0wp/bl5SzFvPnc7qsNUNSyptwHyBBXsu2PgyF+05WAajMCAlq2VNIYWnQF8q
 90l/cPsA7I0LOWpHSr/7Lhm791V/gVh+/jjGV/+VNs8ePXyBJ9yBFYVqVKLF3AB0ZmsMOl4TGGE
 twmqNmSF6qyalJXgvsbLWJlU7A937aIZijFV2DN+BEabKCKbWUJ1sIkwoy1F+rArR6LMHR+bB/S
 T+UCTikoek+4dcv7yRHQonSXIAJXGKR12EyZOPzkYx7itvzisQk+ZgYt4/UMRGj7hhqVQxybxTM
 A/Uqjwqlg9VLwx/0BaxGy+fCGhd9JMtIKzwqSKXo+KCyMfD37r0WXw/HEJUMebxeb0hETAHu27P
 983peUrb9Gnr7PbtqoHjFDOPh4RPD2oFrhUDcUX77SKSkmzMaUenWrPBIPFwGf7tSG0UpZFHOW1
 ve4V3+All/y/Y8MqVP/Mm3EWGYYFV74T0/7CsXY76ewnJ8dVz603Civv7MpjJsReh6Hs+XTvAVN
 M1rVu0zqi8M/12l0SJUIzieInWoAVfXIGLPc4MeyRw/iYiyOszYrLJ2kUnjrEh7MRPyynNI+gAN
 PMyFYnfrJndXwN5/qETp/nbAVXrNyQoONbUcS3AcPG+2lEWgFRbpwiYJthHshImJZc9NF6fm53s
 S0zvDAznekaVXuw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10134

Rename the "Yocto Project Board Support Package (BSP) Developer's Guide"
section to "Yocto Project Board Support Package (BSP) Manual" to align
with other subsections of the "Manuals" section.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README                               |   8 ++---
 documentation/bsp-guide/index.rst                  |  15 ---------
 documentation/{bsp-guide => bsp-manual}/bsp.rst    |  34 ++++++++++-----------
 .../figures/bsp-dev-flow.png                       | Bin
 documentation/bsp-manual/index.rst                 |  15 +++++++++
 documentation/dev-manual/layers.rst                |   4 +--
 documentation/dev-manual/new-machine.rst           |   2 +-
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/index.rst                            |   2 +-
 documentation/kernel-dev/advanced.rst              |   2 +-
 documentation/kernel-dev/common.rst                |   6 ++--
 documentation/migration-guides/migration-2.5.rst   |   2 +-
 documentation/overview-manual/concepts.rst         |   2 +-
 .../overview-manual/development-environment.rst    |   4 +--
 documentation/overview-manual/index.rst            |   2 +-
 documentation/overview-manual/yp-intro.rst         |   4 +--
 documentation/ref-manual/faq.rst                   |   6 ++--
 documentation/ref-manual/resources.rst             |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/terms.rst                 |   4 +--
 documentation/standards.md                         |   6 ++--
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 documentation/what-i-wish-id-known.rst             |   6 ++--
 24 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/documentation/README b/documentation/README
index 326930932..1a148df7b 100644
--- a/documentation/README
+++ b/documentation/README
@@ -19,7 +19,7 @@ Here the folders corresponding to individual manuals:
 * overview-manual      - Yocto Project Overview and Concepts Manual
 * contributor-guide    - Yocto Project and OpenEmbedded Contributor Guide
 * ref-manual           - Yocto Project Reference Manual
-* bsp-guide            - Yocto Project Board Support Package (BSP) Developer's Guide
+* bsp-manual           - Yocto Project Board Support Package (BSP) Manual
 * dev-manual           - Yocto Project Development Tasks Manual
 * kernel-dev           - Yocto Project Linux Kernel Development Manual
 * profile-manual       - Yocto Project Profiling and Tracing Manual
@@ -309,11 +309,11 @@ It is also possible to refer to another document within yocto-docs with the
 :doc: directive (c.f.
 https://www.sphinx-doc.org/en/master/usage/referencing.html#role-doc), e.g.:
 
-  For more information, read :doc:`/bsp-guide/index`.
+  For more information, read :doc:`/bsp-manual/index`.
 
 Note that only "absolute" paths (starting with a '/') are allowed. The root
-directory of that path is documentation/, that is, :doc:`/bsp-guide/index`
-points at documentation/bsp-guide/index.rst.
+directory of that path is documentation/, that is, :doc:`/bsp-manual/index`
+points at documentation/bsp-manual/index.rst.
 
 References
 ==========
diff --git a/documentation/bsp-guide/index.rst b/documentation/bsp-guide/index.rst
deleted file mode 100644
index 9a8e034ae..000000000
--- a/documentation/bsp-guide/index.rst
+++ /dev/null
@@ -1,15 +0,0 @@
-.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
-
-=====================================================
-Yocto Project Board Support Package Developer's Guide
-=====================================================
-
-|
-
-.. toctree::
-   :caption: Table of Contents
-   :numbered:
-
-   bsp
-
-.. include:: /boilerplate.rst
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-manual/bsp.rst
similarity index 98%
rename from documentation/bsp-guide/bsp.rst
rename to documentation/bsp-manual/bsp.rst
index 9cf0642d7..25c1a2eb6 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
-**************************************************
-Board Support Packages (BSP) --- Developer's Guide
-**************************************************
+************************************************
+Yocto Project Board Support Package (BSP) Manual
+************************************************
 
 A Board Support Package (BSP) is a collection of information that
 defines how to support a particular hardware device, set of devices, or
@@ -16,7 +16,7 @@ This guide presents information about BSP layers, defines a structure
 for components so that BSPs follow a commonly understood layout,
 discusses how to customize a recipe for a BSP, addresses BSP licensing,
 and provides information that shows you how to create a BSP
-Layer using the :ref:`bitbake-layers <bsp-guide/bsp:Creating a new BSP Layer Using the \`\`bitbake-layers\`\` Script>`
+Layer using the :ref:`bitbake-layers <bsp-manual/bsp:Creating a new BSP Layer Using the \`\`bitbake-layers\`\` Script>`
 tool.
 
 BSP Layers
@@ -68,7 +68,7 @@ several "reference" BSPs including the ARM-based Beaglebone and generic
 versions of both 32-bit and 64-bit IA machines.
 
 For information on typical BSP development workflow, see the
-:ref:`bsp-guide/bsp:developing a board support package (bsp)`
+:ref:`bsp-manual/bsp:developing a board support package (bsp)`
 section. For more
 information on how to set up a local copy of source files from a Git
 repository, see the
@@ -136,13 +136,13 @@ Preparing Your Build Host to Work With BSP Layers
 This section describes how to get your build host ready to work with BSP
 layers. Once you have the host set up, you can create the layer as
 described in the
-":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
+":ref:`bsp-manual/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
 section.
 
 .. note::
 
    For structural information on BSPs, see the
-   :ref:`bsp-guide/bsp:example filesystem layout` section.
+   :ref:`bsp-manual/bsp:example filesystem layout` section.
 
 #. *Set Up the Build Environment:* Be sure you are set up to use BitBake
    in a shell. See the ":ref:`dev-manual/start:preparing the build host`"
@@ -266,7 +266,7 @@ Before looking at the recommended form for the directory structure
 inside a BSP layer, you should be aware that there are some requirements
 in order for a BSP layer to be considered compliant with the Yocto
 Project. For that list of requirements, see the
-":ref:`bsp-guide/bsp:released bsp requirements`" section.
+":ref:`bsp-manual/bsp:released bsp requirements`" section.
 
 Below is the typical directory structure for a BSP layer. While this
 basic form represents the standard, realize that the actual layout for
@@ -513,10 +513,10 @@ use these kernels and images to get a system running and quickly get
 started on development tasks.
 
 The exact types of binaries present are highly hardware-dependent. The
-:ref:`README <bsp-guide/bsp:readme file>` file should be present in the
+:ref:`README <bsp-manual/bsp:readme file>` file should be present in the
 BSP Layer and it explains how to use the images with the target
 hardware. Additionally, the
-:ref:`README.sources <bsp-guide/bsp:readme.sources file>` file should be
+:ref:`README.sources <bsp-manual/bsp:readme.sources file>` file should be
 present to locate the sources used to build the images and provide
 information on the Metadata.
 
@@ -718,7 +718,7 @@ repository, which contains many BSPs supported by the Yocto Project, is
 part of the example.
 
 For an example that shows how to create a new layer using the tools, see
-the ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
+the ":ref:`bsp-manual/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
 section.
 
 The following illustration and list summarize the BSP creation general
@@ -737,7 +737,7 @@ workflow.
    local copies of these supported BSP layers on your system gives you
    access to layers you might be able to leverage when creating your
    BSP. For information on how to get these files, see the
-   ":ref:`bsp-guide/bsp:preparing your build host to work with bsp layers`"
+   ":ref:`bsp-manual/bsp:preparing your build host to work with bsp layers`"
    section.
 
 #. *Create Your Own BSP Layer Using the bitbake-layers Script:*
@@ -747,7 +747,7 @@ workflow.
    in itself, a special type of layer. The simplest way to create a new
    BSP layer that is compliant with the Yocto Project is to use the
    ``bitbake-layers`` script. For information about that script, see the
-   ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`bsp-manual/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
    section.
 
    Another example that illustrates a layer is an application. Suppose
@@ -761,7 +761,7 @@ workflow.
    section in the Yocto Project Overview and Concepts Manual. You can also
    reference the ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For more
-   information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
+   information on BSP layers, see the ":ref:`bsp-manual/bsp:bsp layers`"
    section.
 
    .. note::
@@ -778,7 +778,7 @@ workflow.
          -  A generic ARM 64 platform (``genericarm64``)
 
    When you set up a layer for a new BSP, you should follow a standard
-   layout. This layout is described in the ":ref:`bsp-guide/bsp:example filesystem layout`"
+   layout. This layout is described in the ":ref:`bsp-manual/bsp:example filesystem layout`"
    section. In the standard layout, notice
    the suggested structure for recipes and configuration information.
    You can see the standard layout for a BSP by examining any supported
@@ -833,7 +833,7 @@ Before looking at BSP requirements, you should consider the following:
 -  The requirements here assume the BSP layer is a well-formed, "legal"
    layer that can be added to the Yocto Project. For guidelines on
    creating a layer that meets these base requirements, see the
-   ":ref:`bsp-guide/bsp:bsp layers`" section in this manual and the
+   ":ref:`bsp-manual/bsp:bsp layers`" section in this manual and the
    ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
@@ -860,7 +860,7 @@ The requirements for a released BSP that conform to the Yocto Project are:
 
 -  *Layer Name:* The BSP must have a layer name that follows the Yocto
    Project standards. For information on BSP layer names, see the
-   ":ref:`bsp-guide/bsp:bsp layers`" section.
+   ":ref:`bsp-manual/bsp:bsp layers`" section.
 
 -  *File System Layout:* When possible, use the same directory names in
    your BSP layer as listed in the ``recipes.txt`` file, which is found
diff --git a/documentation/bsp-guide/figures/bsp-dev-flow.png b/documentation/bsp-manual/figures/bsp-dev-flow.png
similarity index 100%
rename from documentation/bsp-guide/figures/bsp-dev-flow.png
rename to documentation/bsp-manual/figures/bsp-dev-flow.png
diff --git a/documentation/bsp-manual/index.rst b/documentation/bsp-manual/index.rst
new file mode 100644
index 000000000..37469184e
--- /dev/null
+++ b/documentation/bsp-manual/index.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+================================================
+Yocto Project Board Support Package (BSP) Manual
+================================================
+
+|
+
+.. toctree::
+   :caption: Table of Contents
+   :numbered:
+
+   bsp
+
+.. include:: /boilerplate.rst
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index dc63478a3..c078d5499 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -32,7 +32,7 @@ Follow these general steps to create your layer without using tools:
 
    .. note::
 
-      For information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
+      For information on BSP layers, see the ":ref:`bsp-manual/bsp:bsp layers`"
       section in the Yocto Project Board Specific (BSP) Developer's Guide.
 
 #. *Create a new Layer:* Create the directory for your layer. The
@@ -166,7 +166,7 @@ Follow these general steps to create your layer without using tools:
    .. note::
 
       For an explanation of layer hierarchy that is compliant with the
-      Yocto Project, see the ":ref:`bsp-guide/bsp:example filesystem layout`"
+      Yocto Project, see the ":ref:`bsp-manual/bsp:example filesystem layout`"
       section in the Yocto Project Board Support Package (BSP) Developer's Guide.
 
 #. *Optionally Test for Compatibility:* If you want permission to use
diff --git a/documentation/dev-manual/new-machine.rst b/documentation/dev-manual/new-machine.rst
index 469b2d395..b4d29027b 100644
--- a/documentation/dev-manual/new-machine.rst
+++ b/documentation/dev-manual/new-machine.rst
@@ -15,7 +15,7 @@ that the Yocto Project already supports.
    manual.
 
 For a complete example that shows how to add a new machine, see the
-":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
+":ref:`bsp-manual/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
 section in the Yocto Project Board Support Package (BSP) Developer's
 Guide.
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 8fa7f8f38..44604595a 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -280,7 +280,7 @@ are necessary depending on what you want to accomplish. See the
 following references for information on how to prepare for Board Support
 Package (BSP) development and kernel development:
 
--  *BSP Development:* See the ":ref:`bsp-guide/bsp:preparing your build host to work with bsp layers`"
+-  *BSP Development:* See the ":ref:`bsp-manual/bsp:preparing your build host to work with bsp layers`"
    section in the Yocto Project Board Support Package (BSP) Developer's
    Guide.
 
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index d0c322546..cc984bbcc 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -237,7 +237,7 @@ repository that you use during build operations. Because you have built the
 recipe in the past, the layer is likely added to your
 configuration already. If for some reason, the layer is not added, you
 could add it easily using the
-":ref:`bitbake-layers <bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script>`"
+":ref:`bitbake-layers <bsp-manual/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script>`"
 script. For example, suppose you use the ``nano.bb`` recipe from the
 ``meta-oe`` layer in the ``meta-openembedded`` repository. For this
 example, assume that the layer has been cloned into following area::
diff --git a/documentation/index.rst b/documentation/index.rst
index 4cc9d4582..a1a4b5048 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -62,7 +62,7 @@ infrastructure.
    :caption: Manuals
 
    Reference Manual <ref-manual/index>
-   Board Support Package (BSP) Developer's guide <bsp-guide/index>
+   Board Support Package (BSP) Manual <bsp-manual/index>
    Development Tasks Manual <dev-manual/index>
    Linux Kernel Development Manual <kernel-dev/index>
    Security Manual <security-manual/index>
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 9db142a12..b36bea67c 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -458,7 +458,7 @@ supported kernel type.
 This section overviews the BSP description structure, the aggregation
 concepts, and presents a detailed example using a BSP supported by the
 Yocto Project (i.e. BeagleBone Board). For complete information on BSP
-layer file hierarchy, see the :doc:`/bsp-guide/index`.
+layer file hierarchy, see the :doc:`/bsp-manual/index`.
 
 Description Overview
 ~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 136524e63..c2fc3e1fa 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -81,7 +81,7 @@ section:
       see the
       ":ref:`dev-manual/layers:understanding and creating layers`"
       section in the Yocto Project Development Tasks Manual and the
-      ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
+      ":ref:`bsp-manual/bsp:bsp layers`" section in the Yocto Project Board
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
@@ -176,7 +176,7 @@ section:
       see the
       ":ref:`dev-manual/layers:understanding and creating layers`"
       section in the Yocto Project Development Tasks Manual and the
-      ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
+      ":ref:`bsp-manual/bsp:bsp layers`" section in the Yocto Project Board
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
@@ -369,7 +369,7 @@ your layer in the following area::
 .. note::
 
    If you are working on a new machine Board Support Package (BSP), be
-   sure to refer to the :doc:`/bsp-guide/index`.
+   sure to refer to the :doc:`/bsp-manual/index`.
 
 As an example, consider the following append file used by the BSPs in
 ``meta-yocto-bsp``:
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index facf5110b..8e182cd2b 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -94,7 +94,7 @@ Scripts and Tools Changes
    cases, they are also limited in scope. The
    ``bitbake-layers create-layer`` command is a direct replacement for
    ``yocto-layer``. See the documentation to create a BSP or kernel
-   recipe in the ":ref:`bsp-guide/bsp:bsp kernel recipe example`" section.
+   recipe in the ":ref:`bsp-manual/bsp:bsp kernel recipe example`" section.
 
 -  ``devtool finish``: ``devtool finish`` now exits with an error if
    there are uncommitted changes or a rebase/am in progress in the
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index b23e0d2b6..73a24d8d3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -435,7 +435,7 @@ A BSP layer provides machine configurations that target specific
 hardware. Everything in this layer is specific to the machine for which
 you are building the image or the SDK. A common structure or form is
 defined for BSP layers. You can learn more about this structure in the
-:doc:`/bsp-guide/index`.
+:doc:`/bsp-manual/index`.
 
 .. note::
 
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 0daaf1c1a..0921139bd 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -102,9 +102,9 @@ are several ways of working in the Yocto Project environment:
    hardware. To development BSPs, you need to take some additional steps
    beyond what was described in setting up a development host.
 
-   The :doc:`/bsp-guide/index` provides BSP-related development
+   The :doc:`/bsp-manual/index` provides BSP-related development
    information. For specifics on development host preparation, see the
-   ":ref:`bsp-guide/bsp:preparing your build host to work with bsp layers`"
+   ":ref:`bsp-manual/bsp:preparing your build host to work with bsp layers`"
    section in the Yocto Project Board Support Package (BSP) Developer's
    Guide.
 
diff --git a/documentation/overview-manual/index.rst b/documentation/overview-manual/index.rst
index 7d96881b9..0061d1a18 100644
--- a/documentation/overview-manual/index.rst
+++ b/documentation/overview-manual/index.rst
@@ -43,7 +43,7 @@ This manual does not give you the following:
 -  *Reference Material:* This type of material resides in an appropriate
    reference manual. For example, system variables are documented in the
    :doc:`/ref-manual/index`. As another
-   example, the :doc:`/bsp-guide/index` contains reference information on
+   example, the :doc:`/bsp-manual/index` contains reference information on
    BSPs.
 
 -  *Detailed Public Information Not Specific to the Yocto Project:* For
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 8c0918943..6e8b72249 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -245,7 +245,7 @@ accomplish this through a recipe that is a BitBake append
 .. note::
 
    For general information on BSP layer structure, see the
-   :doc:`/bsp-guide/index`.
+   :doc:`/bsp-manual/index`.
 
 The :term:`Source Directory`
 contains both general layers and BSP layers right out of the box. You
@@ -690,7 +690,7 @@ helpful for getting started:
    ":ref:`dev-manual/layers:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual. For a
    discussion specifically on BSP Layers, see the
-   ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto
+   ":ref:`bsp-manual/bsp:bsp layers`" section in the Yocto
    Project Board Support Packages (BSP) Developer's Guide.
 
 -  *Metadata:* A key element of the Yocto Project is the Metadata that
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 65d5db5d2..01bea4d57 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -363,7 +363,7 @@ Support Package (BSP) layer for it. For more information on how to
 create a BSP layer, see the
 ":ref:`dev-manual/layers:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual and the
-:doc:`/bsp-guide/index`.
+:doc:`/bsp-manual/index`.
 
 Usually, if the board is not completely exotic, adding support in the
 Yocto Project is fairly straightforward.
@@ -519,7 +519,7 @@ How do I disable the cursor on my touchscreen device?
 -----------------------------------------------------
 
 You need to create a form factor file as described in the
-":ref:`bsp-guide/bsp:miscellaneous bsp-specific recipe files`" section in
+":ref:`bsp-manual/bsp:miscellaneous bsp-specific recipe files`" section in
 the Yocto Project Board Support Packages (BSP) Developer's Guide. Set
 the ``HAVE_TOUCHSCREEN`` variable equal to one as follows::
 
@@ -531,7 +531,7 @@ How to always bring up connected network interfaces?
 The default interfaces file provided by the netbase recipe does
 not automatically bring up network interfaces. Therefore, you will need
 to add a BSP-specific netbase that includes an interfaces file. See the
-":ref:`bsp-guide/bsp:miscellaneous bsp-specific recipe files`" section in
+":ref:`bsp-manual/bsp:miscellaneous bsp-specific recipe files`" section in
 the Yocto Project Board Support Packages (BSP) Developer's Guide for
 information on creating these types of miscellaneous recipe files.
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index bcbc7ebac..d91eec5e0 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -144,7 +144,7 @@ Here is a list of resources you might find helpful:
    allows you to develop projects inside or outside of the Yocto Project
    environment.
 
--  :doc:`/bsp-guide/bsp`: This guide defines the structure
+-  :doc:`/bsp-manual/bsp`: This guide defines the structure
    for BSP components. Having a commonly understood structure encourages
    standardization.
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 315a078f7..2886713d4 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -243,7 +243,7 @@ Namely, it contains the distro :term:`configuration file` for Poky:
 
 This directory contains the Yocto Project reference hardware Board
 Support Packages (BSPs). For more information on BSPs, see the
-:doc:`/bsp-guide/index`.
+:doc:`/bsp-manual/index`.
 
 .. _structure-build:
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index cbe7c88e6..8087dd26b 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -57,7 +57,7 @@ universal, the list includes them just in case:
    :term:`Board Support Package (BSP)`
       A group of drivers, definitions, and other components that provide support
       for a specific hardware configuration. For more information on BSPs, see
-      the :doc:`/bsp-guide/index`.
+      the :doc:`/bsp-manual/index`.
 
    :term:`Build Directory`
       This term refers to the area used by the OpenEmbedded build system for
@@ -365,7 +365,7 @@ universal, the list includes them just in case:
       more detailed information on layers, see the
       ":ref:`dev-manual/layers:Understanding and Creating
       Layers`" section in the Yocto Project Development Tasks Manual. For a
-      discussion specifically on BSP Layers, see the ":ref:`bsp-guide/bsp:BSP
+      discussion specifically on BSP Layers, see the ":ref:`bsp-manual/bsp:BSP
       Layers`" section in the Yocto Project Board Support Packages (BSP)
       Developer's Guide.
 
diff --git a/documentation/standards.md b/documentation/standards.md
index 801efe345..30d48a5bb 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -131,11 +131,11 @@ that most themes only style these two admonitions.
 The [doc directive](https://www.sphinx-doc.org/en/master/usage/referencing.html#role-doc)
 allows to refer to another document within yocto-docs, like:
 
-    For more information, read :doc:`/bsp-guide/index`.
+    For more information, read :doc:`/bsp-manual/index`.
 
 Note that only "absolute" paths (starting with a '/') are allowed. The root
-directory of that path is documentation/, that is, :doc:`/bsp-guide/index`
-points at documentation/bsp-guide/index.rst.
+directory of that path is documentation/, that is, :doc:`/bsp-manual/index`
+points at documentation/bsp-manual/index.rst.
 
 ## Adding screenshots
 
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index c69ab5361..0fd7c950e 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -61,7 +61,7 @@ Transitioning to a custom environment for systems development
 #. **Create your own layer for the BSP you're going to use**.
    It is not common that you would need to create an entire BSP from scratch
    unless you have a *really* special device. Even if you are using an existing
-   BSP, :ref:`create your own layer for the BSP <bsp-guide/bsp:creating a new
+   BSP, :ref:`create your own layer for the BSP <bsp-manual/bsp:creating a new
    bsp layer using the \`\`bitbake-layers\`\` script>`. For example, given a
    64-bit x86-based machine, copy the conf/intel-corei7-64 definition and give
    the machine a relevant name (think board name, not product name). Make sure
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index d89f43304..e2ed9aa32 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -49,7 +49,7 @@ contact us with other suggestions.
    their silicon. These layers have names such as "meta-intel" or "meta-ti". Try
    not to build layers from scratch. If you do have custom silicon, use one of
    these layers as a guide or template and familiarize yourself with the
-   :doc:`/bsp-guide/index`.
+   :doc:`/bsp-manual/index`.
 
 #. **Do not put everything into one layer:**
    Use different layers to logically separate information in your build. As an
@@ -208,8 +208,8 @@ contact us with other suggestions.
      recipes, and configure the kernel.
 
    * **Learn About Board Support Packages (BSPs)**: If you want to learn about
-     BSPs, see the :doc:`/bsp-guide/index`. This manual also provides an
-     example BSP creation workflow. See the :doc:`/bsp-guide/bsp` section.
+     BSPs, see the :doc:`/bsp-manual/index`. This manual also provides an
+     example BSP creation workflow. See the :doc:`/bsp-manual/bsp` section.
 
    * **Learn About Toaster**: Toaster is a web interface to the Yocto Project's
      OpenEmbedded build system. If you are interested in using this type of

-- 
2.55.0


