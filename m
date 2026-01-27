Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE51CCA6C8A
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6047.1769501970209328204
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XY5W3KLl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7636FC211CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C247606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59B69119A867A;
	Tue, 27 Jan 2026 09:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OzQrupztVInijv7pj6J/aVTic657EiRdHmrAd7y5Y+Q=;
	b=XY5W3KLl0/9ulPi0/MCaFXaDgwboxZpNk61bFXsnwSgRidq+9vP2bpP1lGar7ZLDNOubhj
	s9Z3JtQ/KyPk7agNm0pTR4ZDHQIbD/VwFhXhWYzYTzL5KkiD8YlVaqUCszseZzKcO28nbH
	GFGXDLCJcWnnV7sOqj40X5ybjMbAOlARUkpMgwNGVaPqh2PcS4K9rr2/8uMRcaTwLN2kHe
	LLRKYSqukNZDqreIfdkPOAyoMcTzZPOGZ47jH6Z4mQxzjbDsmLW8HxfQxUJ8AUyamrsvIf
	UH12Ln+PnYlDR8FppSHJL6/LSWsSoP39d1VHOz1ERndYokL9fWX4xrxR/jdXMA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:06 +0100
Subject: [PATCH v2 11/56] dev-manual/layers.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-11-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=20358;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0U903F6BtcvOV0k8SZ9iIA8f88D0pasVWAwq/LXDf24=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUAC0jG2fa7QjBHRi4/I3FzmkCbJ4DFrNwtq
 JFiITyakuGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 NipsEACllFl8htkvmWntXi3Z9fRKUGrxvyfcAF7Ik8R9d1bEWXCuWZemOMIZfcSofojJopJFSy8
 GuRy2ZcI5fZ/MVo1mHBRr9Z39emcMNxGVWiBSKk+C0ax1ju3yAaZZMjNyin7k0jkvK9AUiYAkbv
 q1LL96dZwg0Xyx+dr0B6j6K7GsH/7IL4h+PwKcZhJ6eJwZq3bRsOTJuVpC+ReIVO0F9PlDytQ2b
 K/U2bao12ZQ1n/+FVBzDvzval5xTC0XDr7/J8eePYUh5t7yIoxALNbInonLmkw3T+05U4C46s8L
 vNDr6NhiB/twat4LTBNu3h8xu8rPv3/EGiRwxfeh92uRsBpXLMDjGKqMLvSvm/B6mC9R0XBOFCM
 2cPXMZp4ec80QVPBnEdXlMBOuIJ3XAVC5DLc2r1IqtqdxtVdVEaFdZaChDkdMty6o7fkxqkLkrz
 wmbSmfJZKACeN0HDaLr4qUdbZTSU4wD9Y5A23sjID1D0CNSV/IcLyMj8HXL4YUyluO1xv/Wvh1o
 Gp7h443wknWXD7icoZe9OFU52Ud3lqraYF3+lU3ZQhKhpQm7UvT1F44FBlgDchPdcR4hH3CVqgc
 tW9Asa6L8PBA4FcDCC3EjEtP+nB6qFSee3jY7U/WdQ2PY8vrYvDz2qTBLddUm7w0Fyd7kGoVoNt
 XCISu9DznmynxtA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8672

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
index 49527f45d1..4c0939ab0b 100644
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
index 667708e32b..456e72f4f3 100644
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
+   layer named "your_layer_name" in the current directory.
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
+   The default mode of the script's operation with this subcommand is to
+   create a layer with the following:
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
+         releases </development/releases/>` codenames (in lowercase) for which
+         the current version is compatible. For example: "&DISTRO_NAME_NO_CAP;".
+
+         This variable is a good way to indicate if your particular layer is
+         current. 
+
+   -  A ``recipes-example`` subdirectory that contains a further
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


