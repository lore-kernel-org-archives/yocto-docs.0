Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E7AE776E4
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123720.1766593916205837905
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g8P1XiDI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE37F1A23E2
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 86D846073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57E7A10AB1373;
	Wed, 24 Dec 2025 17:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YdutaXlj/mRa99wKdt0cx5Pc+lKMOqeDC4EoqhQRvMc=;
	b=g8P1XiDIjnqp9dKzf3+MkJvmn08gSCN65Ul91eZkd5aOrReM1fD0t+do9OqVElfjC0ZHR9
	0yBtrP6ioeXPV/YoXlbneEKnJpGue+LM/jsD6SyBJSiOjs0n+wrWyFgBb8JAMBWbMYhnyg
	ztB0w2t0W8mmdNoG/R504IdiAas2Rss66DU0LoqmSx/umatjObMXJIn21EEJbAWxKrRfSy
	UB81vCCGYHhV+bMp5fS6ccsWOyh89yz5us8PeS0jFGMq+ZZAo0Pv2w5xbJ1Z0gub5FxuV9
	aOgvnS00qqDbd9QJY9vVCDumf7RqmLpGyrnY+1u9cwZ2Q6vh9u2pHzaScGNr1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:37 +0100
Subject: [PATCH 11/53] dev-manual/layers.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-11-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=19764;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=g9raN+ku2/HXwZ+UHBlN0+i6NIJXqX+/M75SZ6ynZuc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVo5+ucx5MqaHkC7xGLGFh6uaRnt8LI+ncpk
 1hZyfK5GS6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaAAKCRDRgEFAKaOo
 NqM1EACj2LZV75v/I3HhDJ8l7qibpFrfusx+BEpbptEGwJTP6Uw9slJDdwumldD5VWimUzLWPtC
 OrcZe6aiFHz04Nu8P5t0n0ta7QB7Eh/bK1Cy7tL6om9FheI2BZveuQnSSLMVe+mXPioweT3kFSl
 yJcYJ/FvCBnyUf2bmydxYtGrG78anyQ35XJ4kTu+zcuF0i94Y0tyZM9mdzVZfPMdNLhutlfsdi6
 BI4mHvrtlNRFkHNLz2+G2EYJGYyHE05Cb2Rbq1cpAqclLUZqwa4YVB2XIBKcedn1CdKHJqbRKFp
 RwgkxS+2MRrGy5ToInWkMm2cneMKjBa2Qf4slqHlo4vaBmMN9MRlyFWlpp7AEGznVYLk1Dldm1j
 hdEfOJCSG/dKunsEKUiXb0+5feMBsHhvJt7sGR7SKis/0WnyaSX+24y2lFOH4Mn8DrdyUH0euQY
 wX/kXQGoACK81M299rTW9ERgK6t1h9v+ykXkx98L5rxYSRJaF23KhhuVrK1R9EnTXkCznArILSW
 xpoIX0xisN1d+4Rfr70pdW/CwIBnlKD8KvweBWK81QJvLK7G2Tx+VjA6rdtoE+P5NPGa0SuSYOU
 hD5JEyRoN6TWanFphgEZflDeGdQiEsm5jMIcUm+SpnPBMSIAj+2WwySQmMx2NUkJpzFizeJ75xq
 EKdm9d3ugTs+6/w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8340

The first section of the layers document shows how to manually create a
layer step-by-step, and references bitbake-layers create-layer at the
end. Change the approach of this section to show how to use the
bitbake-layers create-layer command to create a layer, and then explain
how a layer is organized and configured. This avoids repetition, and we
should encourage users to use pre-built tools when they can do things in
a less error-prone way.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    |   2 +-
 documentation/dev-manual/custom-distribution.rst   |   2 +-
 documentation/dev-manual/layers.rst                | 266 +++++++--------------
 documentation/kernel-dev/common.rst                |   6 +-
 .../transitioning-to-a-custom-environment.rst      |   3 +-
 6 files changed, 99 insertions(+), 182 deletions(-)

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
index 2a451b2139..8e332aec07 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1154,7 +1154,7 @@ Use these steps to create a BSP layer:
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
index 667708e32b..15d54cc021 100644
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
@@ -35,10 +23,23 @@ Follow these general steps to create your layer without using tools:
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
+   In its simplest form, you can use the following command form to create a
+   layer. The command creates a layer whose name corresponds to
+   "your_layer_name" in the current directory:
+
+   .. code-block:: console
+
+      $ bitbake-layers create-layer your_layer_name
 
    While not strictly required, prepend the name of the directory with
    the string "meta-". For example::
@@ -58,88 +59,84 @@ Follow these general steps to create your layer without using tools:
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
+
+      $ bitbake-layers create-layer meta-scottrif
+      NOTE: Starting bitbake server...
+      Add your new layer with 'bitbake-layers add-layer meta-scottrif'
+
+   In order to use a layer with the OpenEmbedded build system, you
+   need to add the layer to your ``bblayers.conf`` configuration
+   file. See the ":ref:`dev-manual/layers:adding a layer using the
+   \`\`bitbake-layers\`\` script`" section for more information.
+
+   The default mode of the script's operation with this subcommand is to
+   create a layer with the following:
+
+   -  A ``conf/layer.conf`` configuration file with default definitions.
+
+      Here is an explanation of the layer configuration file:
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
+      -  :term:`BBFILES`: Defines the location for all recipes in the layer.
+
+      -  :term:`BBFILE_COLLECTIONS`: Establishes the current layer through a
+         unique identifier that is used throughout the OpenEmbedded build system
+         to refer to the layer. In this example, the identifier "yoctobsp" is
+         the representation for the container layer named "meta-yocto-bsp".
+
+      -  :term:`BBFILE_PATTERN`: Expands immediately during parsing to provide
+         the directory of the layer.
+
+      -  :term:`BBFILE_PRIORITY`: Establishes a priority to use for recipes in
+         the layer when the OpenEmbedded build finds recipes of the same name in
+         different layers.
+
+      -  :term:`LAYERVERSION`: Establishes a version number for the layer. You
+         can use this version number to specify this exact version of the layer
+         as a dependency when using the :term:`LAYERDEPENDS` variable.
+
+      -  :term:`LAYERDEPENDS`: Lists all layers on which this layer depends (if
+         any).
+
+      -  :term:`LAYERSERIES_COMPAT`: Lists the :yocto_home:`Yocto Project
+         releases </development/releases/>` for which the current version is
+         compatible. This variable is a good way to indicate if your particular
+         layer is current.
+
+   -  A ``recipes-example`` subdirectory that contains a further
+      subdirectory named ``example``, which contains an ``example.bb``
+      recipe file.
+
+   -  A ``COPYING.MIT``, which is the license statement for the layer. The
+      script assumes you want to use the MIT license, which is typical for
+      most layers, for the contents of the layer itself.
+
+   -  A ``README`` file, which is a file describing the contents of your
+      new layer.
 
-   .. note::
 
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
+   If you want to set the priority of the layer to other than the default value
+   of "6", you can either use the ``--priority`` option or you can edit the
+   :term:`BBFILE_PRIORITY` value in the ``conf/layer.conf`` after the script
+   creates it. Furthermore, if you want to give the example recipe file some
+   name other than the default, you can use the ``--example-recipe-name``
+   option.
+
+   The easiest way to see how the ``bitbake-layers create-layer`` command
+   works is to experiment with the script. You can also read the usage
+   information by running ``bitbake-layers --help``.
 
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
@@ -874,85 +871,6 @@ The following list describes the available commands:
 
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
2.51.0


