Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E33D358D6
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17188.1769700252950660784
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2b6lubcR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F0AE1A2B09;
	Thu, 29 Jan 2026 15:24:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46743606FD;
	Thu, 29 Jan 2026 15:24:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0873E119A868E;
	Thu, 29 Jan 2026 16:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XyUJ6tzVSh5Qi9DwIKW9xkL57tSd2sm6bUF5hSTnACM=;
	b=2b6lubcR9xB24uZWyPybkhejnSOWM5W2VRUBSH1QNUYx4jhVQsVK1kI7SHKANGVlnS7jZ6
	2t7T025yJqZvKCGIWzfrCjH9qYqhaFFDqEMM1JRU8LD9q39WXcBSAOVgOd9UCrg4BLYEEe
	zAgYsyW5cbIAXrHosHAI/XT2o9bIJxhLQYM+zFqRI/a10fY/DJrKvSFguC/C1BYx4/hZ30
	EcFGdzfokUY5Sc2Hf6lkCqI9yyGP0XdDuhmfEYYIducHVN+kn05P2oanNey/gdlhZ/tbQC
	T7lP9IwVRHSRyUjJqu63Kuhp2+/3+h7BzCe4huAd2WGgqcY+c1BflcobFPg6ZA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:02 +0100
Subject: [PATCH v3 11/57] dev-manual/layers.rst: re-organize the document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-11-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=20382;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lh3xmZb4r12HR7D89r/yfXTY8lB43UsQCdKpB3ltHaE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uKQcQlDcUShScaRsVtNLa00lehAXDcTd1F6
 3bHjbSVc0uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7igAKCRDRgEFAKaOo
 NuRoD/9tm/iychNhVmGIZD4r1Y9BSMv1cqm21+lB3TyaD2lVPjV0TvqkE4ZJC3elkIKnoP1lQdO
 CLgNaoD1W/36qxfCYybzZbM3xjhKcAQSWfTI/WKuAt9AF60SDu8Yi+26X3J9boMi614pFIB6uTx
 faYyP6z/jRQ31xKeRfjmLuFnyYPly8nJ3Sg7/JxgGQ/e4bpJAlG3IPz4XaTK1SZzcO17JnycvIX
 Z8O23JpppqPPM6Si6+WffF5xlg1orkgquJE5UUUQVHnh7JpjkFSsG6fHoiVGRWTbn5O7k+cb97o
 W6HMVdA4V25VR2iO+Mo7BKntM7IvJ3b9KWB4M3xspSSnCcnW0EQ+pXM0Y3xcSqnKEye5skV5fCV
 qcTD5LtHYWmkot+sdz3KxxbSc7oHn/NDw7GvEeeymCtpIjUwOzq5b7DcI8u2i/3/sKJiW6ZYgCe
 WBP41rrMRX+XeKnB0HUPBfjQMKBR7F/6XZcB+rGhb81MNNaMhHX7iJuwW10z4C+NzOrsr6cDbUN
 Y4g7i015jtt/aBqWx1TIF3Lkvz12i+oGHeopVFqK03GqVj4CNVlQNWibp6F/0RFKgcwJB7HkrjB
 U2ISThID3RLZ81clCgejIjggptzPOkJ0ZNeBPvYxfpcXb8IEWcy7+AmvoBhneli7aXB8i4Inkby
 CX5GpLKbIJroodA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8797

The first section of the layers document shows how to manually create a
layer step-by-step, and references bitbake-layers create-layer at the
end. Change the approach of this section to show how to use the
bitbake-layers create-layer command to create a layer, and then explain
how a layer is organized and configured. This avoids repetition, and we
should encourage users to use pre-built tools when they can do things in
a less error-prone way.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    |   2 +-
 documentation/dev-manual/custom-distribution.rst   |   2 +-
 documentation/dev-manual/layers.rst                | 277 ++++++++-------------
 documentation/kernel-dev/common.rst                |   6 +-
 .../transitioning-to-a-custom-environment.rst      |   3 +-
 6 files changed, 110 insertions(+), 182 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 84eb63c937..903dc242eb 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -452,7 +452,7 @@ The following commands run the tool to create a layer named
 
 For more information
 on layers and how to create them, see the
-:ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`
+:ref:`dev-manual/layers:Creating Your Own Layer`
 section in the Yocto Project Development Tasks Manual.
 
 Where To Go Next
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 343b2753c0..4a89d691aa 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1155,7 +1155,7 @@ Use these steps to create a BSP layer:
    ``create-layer`` subcommand to create a new general layer. For
    instructions on how to create a general layer using the
    ``bitbake-layers`` script, see the
-   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/layers:Creating Your Own Layer`"
    section in the Yocto Project Development Tasks Manual.
 
 -  *Create a Layer Configuration File:* Every layer needs a layer
diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
index 0bc386d606..55854f00ea 100644
--- a/documentation/dev-manual/custom-distribution.rst
+++ b/documentation/dev-manual/custom-distribution.rst
@@ -27,7 +27,7 @@ layer. The following steps provide some more detail:
    just placing configurations in a ``local.conf`` configuration file
    makes it easier to reproduce the same build configuration when using
    multiple build machines. See the
-   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/layers:Creating Your Own Layer`"
    section for information on how to quickly set up a layer.
 
 -  *Create the distribution configuration file:* The distribution
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 667708e32b..5abd116be8 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -14,18 +14,6 @@ section in the Yocto Project Overview and Concepts Manual.
 Creating Your Own Layer
 =======================
 
-.. note::
-
-   It is very easy to create your own layers to use with the OpenEmbedded
-   build system, as the Yocto Project ships with tools that speed up creating
-   layers. This section describes the steps you perform by hand to create
-   layers so that you can better understand them. For information about the
-   layer-creation tools, see the
-   ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
-   section in the Yocto Project Board Support Package (BSP) Developer's
-   Guide and the ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
-   section further down in this manual.
-
 Follow these general steps to create your layer without using tools:
 
 #. *Check Existing Layers:* Before creating a new layer, you should be
@@ -35,10 +23,22 @@ Follow these general steps to create your layer without using tools:
    the Yocto Project. You could find a layer that is identical or close
    to what you need.
 
-#. *Create a Directory:* Create the directory for your layer. When you
-   create the layer, be sure to create the directory in an area not
-   associated with the Yocto Project :term:`Source Directory`
-   (e.g. the cloned ``poky`` repository).
+   .. note::
+
+      For information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
+      section in the Yocto Project Board Specific (BSP) Developer's Guide.
+
+#. *Create a new Layer:* Create the directory for your layer. The
+   ``bitbake-layers`` script with the ``create-layer`` subcommand simplifies
+   creating a new general layer. Place it next to the other layers in your
+   :term:`Source Directory`.
+
+   In its simplest form, you can use the following command to create a
+   layer named "your_layer_name" in the current directory:
+
+   .. code-block:: console
+
+      $ bitbake-layers create-layer your_layer_name
 
    While not strictly required, prepend the name of the directory with
    the string "meta-". For example::
@@ -58,88 +58,96 @@ Follow these general steps to create your layer without using tools:
    "meta-" string are appended to several variables used in the
    configuration.
 
-#. *Create a Layer Configuration File:* Inside your new layer folder,
-   you need to create a ``conf/layer.conf`` file. It is easiest to take
-   an existing layer configuration file and copy that to your layer's
-   ``conf`` directory and then modify the file as needed.
-
-   The ``meta-yocto-bsp/conf/layer.conf`` file in the Yocto Project
-   :yocto_git:`Source Repositories </poky/tree/meta-yocto-bsp/conf>`
-   demonstrates the required syntax. For your layer, you need to replace
-   "yoctobsp" with a unique identifier for your layer (e.g. "machinexyz"
-   for a layer named "meta-machinexyz")::
-
-      # We have a conf and classes directory, add to BBPATH
-      BBPATH .= ":${LAYERDIR}"
-
-      # We have recipes-* directories, add to BBFILES
-      BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-                  ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-      BBFILE_COLLECTIONS += "yoctobsp"
-      BBFILE_PATTERN_yoctobsp = "^${LAYERDIR}/"
-      BBFILE_PRIORITY_yoctobsp = "5"
-      LAYERVERSION_yoctobsp = "4"
-      LAYERSERIES_COMPAT_yoctobsp = "walnascar"
-
-   Here is an explanation of the layer configuration file:
-
-   -  :term:`BBPATH`: Adds the layer's
-      root directory to BitBake's search path. Through the use of the
-      :term:`BBPATH` variable, BitBake locates class files (``.bbclass``),
-      configuration files, and files that are included with ``include``
-      and ``require`` statements. For these cases, BitBake uses the
-      first file that matches the name found in :term:`BBPATH`. This is
-      similar to the way the ``PATH`` variable is used for binaries. It
-      is recommended, therefore, that you use unique class and
-      configuration filenames in your custom layer.
-
-   -  :term:`BBFILES`: Defines the
-      location for all recipes in the layer.
-
-   -  :term:`BBFILE_COLLECTIONS`:
-      Establishes the current layer through a unique identifier that is
-      used throughout the OpenEmbedded build system to refer to the
-      layer. In this example, the identifier "yoctobsp" is the
-      representation for the container layer named "meta-yocto-bsp".
-
-   -  :term:`BBFILE_PATTERN`:
-      Expands immediately during parsing to provide the directory of the
-      layer.
-
-   -  :term:`BBFILE_PRIORITY`:
-      Establishes a priority to use for recipes in the layer when the
-      OpenEmbedded build finds recipes of the same name in different
-      layers.
-
-   -  :term:`LAYERVERSION`:
-      Establishes a version number for the layer. You can use this
-      version number to specify this exact version of the layer as a
-      dependency when using the
-      :term:`LAYERDEPENDS`
-      variable.
-
-   -  :term:`LAYERDEPENDS`:
-      Lists all layers on which this layer depends (if any).
-
-   -  :term:`LAYERSERIES_COMPAT`:
-      Lists the :yocto_home:`Yocto Project releases </development/releases/>`
-      for which the current version is compatible. This variable is a good
-      way to indicate if your particular layer is current.
+   As an example, the following command creates a layer named ``meta-scottrif``
+   in your home directory:
 
+   .. code-block:: console
 
-   .. note::
+      $ bitbake-layers create-layer meta-scottrif
+      NOTE: Starting bitbake server...
+      Add your new layer with 'bitbake-layers add-layer meta-scottrif'
+
+   In order to use a layer with the :term:`OpenEmbedded Build System`, you
+   need to add the layer to your ``bblayers.conf`` configuration
+   file, as hinted by the previous command. See the
+   ":ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\`
+   script`" section for more information.
+
+   By default, the ``bitbake-layers create-layer`` command creates a layer
+   with the following:
+
+   -  A ``conf/layer.conf`` configuration file with default definitions.
+
+      Here is an explanation of the typical content of the layer configuration file:
+
+      -  :term:`BBPATH`: Adds the layer's root directory to BitBake's search
+         path. Through the use of the :term:`BBPATH` variable, BitBake locates
+         class files (``.bbclass``), configuration files, and files that are
+         included with ``include`` and ``require`` statements. For these cases,
+         BitBake uses the first file that matches the name found in
+         :term:`BBPATH`. This is similar to the way the ``PATH`` variable is
+         used for binaries. It is recommended, therefore, that you use unique
+         class and configuration filenames in your custom layer.
+
+         See the :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:Locating Include
+         Files` section of the BitBake User Manual for more details on how
+         files are included with :term:`BitBake`.
+
+      -  :term:`BBFILES`: Defines the location for all recipes in the layer.
+
+      -  :term:`BBFILE_COLLECTIONS`: Establishes the current layer through a
+         unique identifier that is used throughout the :term:`OpenEmbedded Build
+         System` to refer to the layer. In this example, the identifier
+         "yoctobsp" is the representation for the container layer named
+         "meta-yocto-bsp".
+
+         This name is used by other layers when specifying the layer
+         dependencies via the :term:`LAYERDEPENDS` variable.
+
+      -  :term:`BBFILE_PATTERN`: Expands immediately during parsing to provide
+         the directory of the layer.
+
+      -  :term:`BBFILE_PRIORITY`: Establishes a priority to use for recipes in
+         the layer when the :term:`OpenEmbedded Build System` finds recipes of
+         the same name in different layers.
+
+      -  :term:`LAYERVERSION`: Establishes a version number for the layer. You
+         can use this version number to specify this exact version of the layer
+         as a dependency when using the :term:`LAYERDEPENDS` variable.
+
+      -  :term:`LAYERDEPENDS`: Lists all layers on which this layer depends (if
+         any). It uses the layer names specified by the
+         :term:`BBFILE_COLLECTIONS` variable.
+
+      -  :term:`LAYERSERIES_COMPAT`: Lists the :yocto_home:`Yocto Project
+         release </development/releases/>` codenames (in lowercase) this layer is
+         compatible with. For example: "&DISTRO_NAME_NO_CAP;".
+
+         This variable is a good way to indicate if a particular layer is
+         current. 
+
+   -  A ``recipes-example`` subdirectory that itself contains a
+      subdirectory named ``example``, which contains an ``example.bb``
+      recipe file.
+
+   -  A ``COPYING.MIT``, which is the license statement for the layer. The
+      script assumes you want to use the MIT license, which is typical for
+      most layers, for the contents of the layer itself.
 
-      A layer does not have to contain only recipes ``.bb`` or append files
-      ``.bbappend``. Generally, developers create layers using
-      ``bitbake-layers create-layer``.
-      See ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`",
-      explaining how the ``layer.conf`` file is created from a template located in
-      ``meta/lib/bblayers/templates/layer.conf``.
-      In fact, none of the variables set in ``layer.conf`` are mandatory,
-      except when :term:`BBFILE_COLLECTIONS` is present. In this case
-      :term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` have to be
-      defined too.
+   -  A ``README`` file, which is a file describing the contents of your
+      new layer.
+
+
+   If you want to set the priority of the layer to other than the default value
+   of "6", you can either use the ``--priority`` option or you can edit the
+   :term:`BBFILE_PRIORITY` value in the ``conf/layer.conf`` after the script
+   creates it. Furthermore, if you want to give the example recipe file some
+   name other than the default, you can use the ``--example-recipe-name``
+   option.
+
+   The easiest way to see how the ``bitbake-layers create-layer`` command
+   works is to experiment with the script. You can also read the usage
+   information by running ``bitbake-layers create-layer --help``.
 
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
@@ -874,85 +882,6 @@ The following list describes the available commands:
 
 -  ``show-machines``: Lists the machines available in the currently configured layers.
 
-Creating a General Layer Using the ``bitbake-layers`` Script
-============================================================
-
-The ``bitbake-layers`` script with the ``create-layer`` subcommand
-simplifies creating a new general layer.
-
-.. note::
-
-   -  For information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
-      section in the Yocto
-      Project Board Specific (BSP) Developer's Guide.
-
-   -  In order to use a layer with the OpenEmbedded build system, you
-      need to add the layer to your ``bblayers.conf`` configuration
-      file. See the ":ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\` script`"
-      section for more information.
-
-The default mode of the script's operation with this subcommand is to
-create a layer with the following:
-
--  A layer priority of 6.
-
--  A ``conf`` subdirectory that contains a ``layer.conf`` file.
-
--  A ``recipes-example`` subdirectory that contains a further
-   subdirectory named ``example``, which contains an ``example.bb``
-   recipe file.
-
--  A ``COPYING.MIT``, which is the license statement for the layer. The
-   script assumes you want to use the MIT license, which is typical for
-   most layers, for the contents of the layer itself.
-
--  A ``README`` file, which is a file describing the contents of your
-   new layer.
-
-In its simplest form, you can use the following command form to create a
-layer. The command creates a layer whose name corresponds to
-"your_layer_name" in the current directory::
-
-   $ bitbake-layers create-layer your_layer_name
-
-As an example, the following command creates a layer named ``meta-scottrif``
-in your home directory::
-
-   $ cd /usr/home
-   $ bitbake-layers create-layer meta-scottrif
-   NOTE: Starting bitbake server...
-   Add your new layer with 'bitbake-layers add-layer meta-scottrif'
-
-If you want to set the priority of the layer to other than the default
-value of "6", you can either use the ``--priority`` option or you
-can edit the
-:term:`BBFILE_PRIORITY` value
-in the ``conf/layer.conf`` after the script creates it. Furthermore, if
-you want to give the example recipe file some name other than the
-default, you can use the ``--example-recipe-name`` option.
-
-The easiest way to see how the ``bitbake-layers create-layer`` command
-works is to experiment with the script. You can also read the usage
-information by entering the following::
-
-   $ bitbake-layers create-layer --help
-   NOTE: Starting bitbake server...
-   usage: bitbake-layers create-layer [-h] [--priority PRIORITY]
-                                      [--example-recipe-name EXAMPLERECIPE]
-                                      layerdir
-
-   Create a basic layer
-
-   positional arguments:
-     layerdir              Layer directory to create
-
-   optional arguments:
-     -h, --help            show this help message and exit
-     --priority PRIORITY, -p PRIORITY
-                           Layer directory to create
-     --example-recipe-name EXAMPLERECIPE, -e EXAMPLERECIPE
-                           Filename of the example recipe
-
 Adding a Layer Using the ``bitbake-layers`` Script
 ==================================================
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 1e098c158f..2142d31c09 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -95,7 +95,7 @@ section:
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
-      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/layers:Creating Your Own Layer`"
       section in the Yocto Project Development Tasks Manual.
 
 #. *Inform the BitBake Build Environment About Your Layer:* As directed
@@ -190,7 +190,7 @@ section:
       Support (BSP) Developer's Guide, respectively. For information on how to
       use the ``bitbake-layers create-layer`` command to quickly set up a layer,
       see the
-      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      ":ref:`dev-manual/layers:Creating Your Own Layer`"
       section in the Yocto Project Development Tasks Manual.
 
 #. *Inform the BitBake Build Environment About Your Layer:* As directed
@@ -276,7 +276,7 @@ section in the Yocto Project Development Tasks Manual.
    The Yocto Project comes with many tools that simplify tasks you need
    to perform. One such tool is the ``bitbake-layers create-layer``
    command, which simplifies creating a new layer. See the
-   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   ":ref:`dev-manual/layers:Creating Your Own Layer`"
    section in the Yocto Project Development Tasks Manual for
    information on how to use this script to quick set up a new layer.
 
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index e292399f43..bc37345b98 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -56,8 +56,7 @@ Transitioning to a custom environment for systems development
 #. **Add a new layer for any custom recipes and metadata you create**.
    Use the ``bitbake-layers create-layer`` command. The ``bitbake-layers`` tool
    also provides a number of other useful layer-related commands. See
-   :ref:`dev-manual/layers:creating a general layer using the
-   \`\`bitbake-layers\`\` script` section.
+   :ref:`dev-manual/layers:Creating Your Own Layer` section.
 
 #. **Create your own layer for the BSP you're going to use**.
    It is not common that you would need to create an entire BSP from scratch

-- 
2.52.0


