Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872D5C54E5B
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12659.1709042498461207114
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LDRNkHrS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCBADFF815;
	Tue, 27 Feb 2024 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5yyS+HQxV25hOaKExwfo/7iCWeT4yLLGdakRhdI8TKA=;
	b=LDRNkHrSnSwhArkeICuANrNse1n7enakvX3MkiFo9lZ8XhDPkpL2s2jb1VD54IKrHK5lnK
	L0krY2EsVe4OZuB6hQY9t0RZVVWh3CX62vm0QGfK3EX4Euxz0gmQ29fb4rsxiqz1QRP4bR
	p3zvr7HLNwpm9jSBhV2ZwlORCw00ghVdI9isKtq6ANS0+l5k+0zKITE9WMhgXPt5TYT9Iz
	d4nuF46VhJmOBxNq5L/BakBJDEym0GJOcjdW6jSBECoSX2c/tG3vKvwyEgOuB+naQrwfbc
	5aYU0n0JSaVejQpcdmksxqmrOOgGN7QjxfhBcmnG9tuQckwAGg2HpoRpyjt8aw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Daniel Ammann <daniel.ammann@bytesatwork.ch>
Subject: [kirkstone][PATCH 03/16] manuals: suppress excess use of "following" word
Date: Tue, 27 Feb 2024 15:01:15 +0100
Message-Id: <20240227140128.481522-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4894

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To simplify the style, replace "Following is" and "Following are"
by "here is" and "here are", sounding more natural.

In some cases, also go further by simplifying "Here are/is xxx"
by "xxx are/is" when the "are" or "is" are not two far at
the end of the sentence.

In some cases too, completely remove the sentence, when
it's redundant with the preceding title.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Daniel Ammann <daniel.ammann@bytesatwork.ch>

---

Changes in V2:

- Further simplication of some "Here are" and "Here is" statements
  as suggested by Daniel Ammann <daniel.ammann@bytesatwork.ch>

- Remove some sentences which were just repeating the
  preceding title.
---
 documentation/bsp-guide/bsp.rst               |  9 ++++----
 documentation/dev-manual/building.rst         |  2 +-
 documentation/dev-manual/debugging.rst        |  8 +++----
 .../dev-manual/development-shell.rst          |  2 +-
 documentation/dev-manual/layers.rst           |  8 +++----
 documentation/dev-manual/libraries.rst        |  4 ++--
 documentation/dev-manual/licenses.rst         |  2 +-
 documentation/dev-manual/new-machine.rst      |  2 +-
 documentation/dev-manual/new-recipe.rst       |  8 +++----
 documentation/dev-manual/packages.rst         |  4 ++--
 .../dev-manual/prebuilt-libraries.rst         |  4 ++--
 .../dev-manual/python-development-shell.rst   |  2 +-
 documentation/dev-manual/qemu.rst             |  4 ++--
 documentation/dev-manual/runtime-testing.rst  |  4 ++--
 .../dev-manual/speeding-up-build.rst          |  4 ++--
 documentation/dev-manual/start.rst            |  6 ++---
 documentation/kernel-dev/common.rst           |  4 ++--
 .../migration-guides/migration-1.5.rst        |  6 ++---
 .../migration-guides/migration-2.2.rst        | 16 ++++---------
 .../migration-guides/migration-2.4.rst        |  8 -------
 .../migration-guides/migration-2.5.rst        |  8 +------
 .../migration-guides/migration-4.0.rst        |  2 +-
 documentation/overview-manual/concepts.rst    | 23 +++++++++----------
 documentation/overview-manual/yp-intro.rst    |  2 +-
 documentation/ref-manual/classes.rst          |  8 +++----
 .../ref-manual/devtool-reference.rst          |  8 +++----
 documentation/ref-manual/faq.rst              |  4 ++--
 documentation/ref-manual/features.rst         |  2 +-
 documentation/ref-manual/images.rst           |  2 +-
 documentation/ref-manual/release-process.rst  |  6 ++---
 documentation/ref-manual/structure.rst        |  2 +-
 documentation/ref-manual/terms.rst            |  6 ++---
 documentation/ref-manual/variables.rst        |  8 +++----
 documentation/sdk-manual/appendix-obtain.rst  | 14 +++++------
 documentation/sdk-manual/intro.rst            |  2 +-
 .../toaster-manual/setup-and-use.rst          |  4 ++--
 36 files changed, 92 insertions(+), 116 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 6cb35ba6cc..1779f9e208 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -853,8 +853,7 @@ Before looking at BSP requirements, you should consider the following:
    dictating that a specific kernel or kernel version be used in a given
    BSP.
 
-Following are the requirements for a released BSP that conform to the
-Yocto Project:
+The requirements for a released BSP that conform to the Yocto Project are:
 
 -  *Layer Name:* The BSP must have a layer name that follows the Yocto
    Project standards. For information on BSP layer names, see the
@@ -958,7 +957,7 @@ Yocto Project:
 Released BSP Recommendations
 ----------------------------
 
-Following are recommendations for released BSPs that conform to the
+Here are recommendations for released BSPs that conform to the
 Yocto Project:
 
 -  *Bootable Images:* Released BSPs can contain one or more bootable
@@ -1020,7 +1019,7 @@ the following:
    that additional hierarchy and the files would obviously not be able
    to reside in a machine-specific directory.
 
-Following is a specific example to help you better understand the
+Here is a specific example to help you better understand the
 process. This example customizes a recipe by adding a
 BSP-specific configuration file named ``interfaces`` to the
 ``init-ifupdown_1.0.bb`` recipe for machine "xyz" where the BSP layer
@@ -1443,7 +1442,7 @@ metadata used to build the kernel. In this case, a kernel append file
 kernel recipe (i.e. ``linux-yocto_5.15.bb``), which is located in
 :yocto_git:`/poky/tree/meta-yocto-bsp/recipes-kernel/linux`.
 
-Following is the contents of the append file::
+The contents of the append file are::
 
    KBRANCH:genericx86  = "v5.15/standard/base"
    KBRANCH:genericx86-64  = "v5.15/standard/base"
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index e964bd1aee..7fcac33b75 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -160,7 +160,7 @@ Follow these steps to set up and execute multiple configuration builds:
    The location for these multiconfig configuration files is specific.
    They must reside in the current :term:`Build Directory` in a sub-directory of
    ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
-   under a directory named ``multiconfig``. Following is an example that defines
+   under a directory named ``multiconfig``. Here is an example that defines
    two configuration files for the "x86" and "arm" multiconfigs:
 
    .. image:: figures/multiconfig_files.png
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index bd1e716b0b..71b5807f5a 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -170,7 +170,7 @@ You can use the ``oe-pkgdata-util`` command-line utility to query
 various package-related information. When you use the utility, you must
 use it to view information on packages that have already been built.
 
-Following are a few of the available ``oe-pkgdata-util`` subcommands.
+Here are a few of the available ``oe-pkgdata-util`` subcommands.
 
 .. note::
 
@@ -608,7 +608,7 @@ logs, keep in mind the goal is to have informative logs while keeping
 the console as "silent" as possible. Also, if you want status messages
 in the log, use the "debug" loglevel.
 
-Following is an example written in Python. The code handles logging for
+Here is an example written in Python. The code handles logging for
 a function that determines the number of tasks needed to be run. See the
 ":ref:`ref-tasks-listtasks`"
 section for additional information::
@@ -636,7 +636,7 @@ logs, you have the same goals --- informative with minimal console output.
 The syntax you use for recipes written in Bash is similar to that of
 recipes written in Python described in the previous section.
 
-Following is an example written in Bash. The code logs the progress of
+Here is an example written in Bash. The code logs the progress of
 the ``do_my_function`` function::
 
    do_my_function() {
@@ -1221,7 +1221,7 @@ Here are some other tips that you might find useful:
                "$@"
       }
 
-   Following are some usage examples::
+   Here are some usage examples::
 
       $ g FOO # Search recursively for "FOO"
       $ g -i foo # Search recursively for "foo", ignoring case
diff --git a/documentation/dev-manual/development-shell.rst b/documentation/dev-manual/development-shell.rst
index a18d792150..be26bcffc7 100644
--- a/documentation/dev-manual/development-shell.rst
+++ b/documentation/dev-manual/development-shell.rst
@@ -16,7 +16,7 @@ OpenEmbedded build system were executing them. Consequently, working
 this way can be helpful when debugging a build or preparing software to
 be used with the OpenEmbedded build system.
 
-Following is an example that uses ``devshell`` on a target named
+Here is an example that uses ``devshell`` on a target named
 ``matchbox-desktop``::
 
   $ bitbake matchbox-desktop -c devshell
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 2da5d9f93e..9bfbd726d9 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -82,7 +82,7 @@ Follow these general steps to create your layer without using tools:
       LAYERVERSION_yoctobsp = "4"
       LAYERSERIES_COMPAT_yoctobsp = "dunfell"
 
-   Following is an explanation of the layer configuration file:
+   Here is an explanation of the layer configuration file:
 
    -  :term:`BBPATH`: Adds the layer's
       root directory to BitBake's search path. Through the use of the
@@ -191,7 +191,7 @@ following list:
 -  *Structure Your Layers:* Proper use of overrides within append files
    and placement of machine-specific files within your layer can ensure
    that a build is not using the wrong Metadata and negatively impacting
-   a build for a different machine. Following are some examples:
+   a build for a different machine. Here are some examples:
 
    -  *Modify Variables to Support a Different Machine:* Suppose you
       have a layer named ``meta-one`` that adds support for building
@@ -513,7 +513,7 @@ In the main recipe, note the :term:`SRC_URI`
 variable, which tells the OpenEmbedded build system where to find files
 during the build.
 
-Following is the append file, which is named ``formfactor_0.0.bbappend``
+Here is the append file, which is named ``formfactor_0.0.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
 file is in the layer at ``recipes-bsp/formfactor``::
 
@@ -588,7 +588,7 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
 	fi
    }
 
-Following is the append file, which is named ``xserver-xf86-config_%.bbappend``
+Here is the append file, which is named ``xserver-xf86-config_%.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
 file is in the layer at ``recipes-graphics/xorg-xserver``::
 
diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index ae4ca27209..521dbb9a7c 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -37,7 +37,7 @@ library files.
    Some previously released versions of the Yocto Project defined the
    static library files through ``${PN}-dev``.
 
-Following is part of the BitBake configuration file, where you can see
+Here is the part of the BitBake configuration file, where you can see
 how the static library files are defined::
 
    PACKAGE_BEFORE_PN ?= ""
@@ -177,7 +177,7 @@ Additional Implementation Details
 ---------------------------------
 
 There are generic implementation details as well as details that are specific to
-package management systems. Following are implementation details
+package management systems. Here are implementation details
 that exist regardless of the package management system:
 
 -  The typical convention used for the class extension code as used by
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 419af7c326..197712b68d 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -27,7 +27,7 @@ Specifying the ``LIC_FILES_CHKSUM`` Variable
 --------------------------------------------
 
 The :term:`LIC_FILES_CHKSUM` variable contains checksums of the license text
-in the source code for the recipe. Following is an example of how to
+in the source code for the recipe. Here is an example of how to
 specify :term:`LIC_FILES_CHKSUM`::
 
    LIC_FILES_CHKSUM = "file://COPYING;md5=xxxx \
diff --git a/documentation/dev-manual/new-machine.rst b/documentation/dev-manual/new-machine.rst
index b7978f4ba9..d007c1631f 100644
--- a/documentation/dev-manual/new-machine.rst
+++ b/documentation/dev-manual/new-machine.rst
@@ -104,7 +104,7 @@ contains directories for specific machines such as ``qemuarm`` and
 defaults, see the ``meta/recipes-bsp/formfactor/files/config`` file
 found in the same area.
 
-Following is an example for "qemuarm" machine::
+Here is an example for "qemuarm" machine::
 
    HAVE_TOUCHSCREEN=1
    HAVE_KEYBOARD=1
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ed87f9b2d0..be52610621 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -100,7 +100,7 @@ command::
 
 Running ``recipetool create -o OUTFILE`` creates the base recipe and
 locates it properly in the layer that contains your source files.
-Following are some syntax examples:
+Here are some syntax examples:
 
  - Use this syntax to generate a recipe based on source. Once generated,
    the recipe resides in the existing source code layer::
@@ -1233,7 +1233,7 @@ inherit the :ref:`ref-classes-autotools` class, which contains the definitions
 of all the steps needed to build an Autotool-based application. The result of
 the build is automatically packaged. And, if the application uses NLS for
 localization, packages with local information are generated (one package per
-language). Following is one example: (``hello_2.3.bb``)::
+language). Here is one example: (``hello_2.3.bb``)::
 
    SUMMARY = "GNU Helloworld application"
    SECTION = "examples"
@@ -1286,7 +1286,7 @@ Splitting an Application into Multiple Packages
 You can use the variables :term:`PACKAGES` and :term:`FILES` to split an
 application into multiple packages.
 
-Following is an example that uses the ``libxpm`` recipe. By default,
+Here is an example that uses the ``libxpm`` recipe. By default,
 this recipe generates a single package that contains the library along
 with a few binaries. You can modify the recipe to split the binaries
 into separate packages::
@@ -1511,7 +1511,7 @@ in the BitBake User Manual.
       when you make the assignment, but this is not generally needed.
 
 -  *Quote All Assignments ("value"):* Use double quotes around values in
-   all variable assignments (e.g. ``"value"``). Following is an example::
+   all variable assignments (e.g. ``"value"``). Here is an example::
 
       VAR1 = "${OTHERVAR}"
       VAR2 = "The version is ${PV}"
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 79f21d9f34..0e991e409a 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -365,7 +365,7 @@ For more examples that show how to use ``do_split_packages``, see the
 directory of the ``poky`` :ref:`source repository <overview-manual/development-environment:yocto project source repositories>`. You can
 also find examples in ``meta/classes-recipe/kernel.bbclass``.
 
-Following is a reference that shows ``do_split_packages`` mandatory and
+Here is a reference that shows ``do_split_packages`` mandatory and
 optional arguments::
 
    Mandatory arguments
@@ -1123,7 +1123,7 @@ The ``devtool edit-recipe`` command lets you take a look at the recipe::
    ...
    LICENSE:${PN}-vary = "MIT"
 
-Here are three key points in the previous example:
+Three key points in the previous example are:
 
 -  :term:`SRC_URI` uses the NPM
    scheme so that the NPM fetcher is used.
diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index b80a844e93..a05f39ca1e 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -148,8 +148,8 @@ recipe. By default, ``libfoo.so`` gets packaged into ``${PN}-dev``, which
 triggers a QA warning that a non-symlink library is in a ``-dev`` package,
 and binaries in the same recipe link to the library in ``${PN}-dev``,
 which triggers more QA warnings. To solve this problem, you need to package the
-unversioned library into ``${PN}`` where it belongs. The following are the abridged
-default :term:`FILES` variables in ``bitbake.conf``::
+unversioned library into ``${PN}`` where it belongs. The abridged
+default :term:`FILES` variables in ``bitbake.conf`` are::
 
    SOLIBS = ".so.*"
    SOLIBSDEV = ".so"
diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 2dc6a3f138..81a5c43472 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -35,7 +35,7 @@ system were executing them. Consequently, working this way can be
 helpful when debugging a build or preparing software to be used with the
 OpenEmbedded build system.
 
-Following is an example that uses ``pydevshell`` on a target named
+Here is an example that uses ``pydevshell`` on a target named
 ``matchbox-desktop``::
 
    $ bitbake matchbox-desktop -c pydevshell
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 88a63c1808..f998e47934 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -318,7 +318,7 @@ timestamp when it needs to look for an image. Minimally, through the use
 of options, you must provide either a machine name, a virtual machine
 image (``*wic.vmdk``), or a kernel image (``*.bin``).
 
-Following is the command-line help output for the ``runqemu`` command::
+Here is the command-line help output for the ``runqemu`` command::
 
    $ runqemu --help
 
@@ -360,7 +360,7 @@ Following is the command-line help output for the ``runqemu`` command::
 ``runqemu`` Command-Line Options
 ================================
 
-Following is a description of ``runqemu`` options you can provide on the
+Here is a description of ``runqemu`` options you can provide on the
 command line:
 
 .. note::
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 7b9345fb79..bd3f42ac09 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -199,7 +199,7 @@ perform a one-time setup of your controller image by doing the following:
    "controller" image and you can customize the image recipe as you would
    any other recipe.
 
-   Here are the image recipe requirements:
+   Image recipe requirements are:
 
    -  Inherits ``core-image`` so that kernel modules are installed.
 
@@ -578,7 +578,7 @@ data:
    When set to "true", the package is not automatically installed into
    the DUT.
 
-Following is an example JSON file that handles test "foo" installing
+Here is an example JSON file that handles test "foo" installing
 package "bar" and test "foobar" installing packages "foo" and "bar".
 Once the test is complete, the packages are removed from the DUT::
 
diff --git a/documentation/dev-manual/speeding-up-build.rst b/documentation/dev-manual/speeding-up-build.rst
index 31b6f75ab0..6e0d7873ac 100644
--- a/documentation/dev-manual/speeding-up-build.rst
+++ b/documentation/dev-manual/speeding-up-build.rst
@@ -33,7 +33,7 @@ auto-scaling ensures that the build system fundamentally takes advantage
 of potential parallel operations during the build based on the build
 machine's capabilities.
 
-Following are additional factors that can affect build speed:
+Additional factors that can affect build speed are:
 
 -  File system type: The file system type that the build is being
    performed on can also influence performance. Using ``ext4`` is
@@ -88,7 +88,7 @@ that can help you speed up the build:
    variable to "1".
 
 -  Disable static library generation for recipes derived from
-   ``autoconf`` or ``libtool``: Following is an example showing how to
+   ``autoconf`` or ``libtool``: Here is an example showing how to
    disable static libraries and still provide an override to handle
    exceptions::
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 794da1e672..9dc9b855b3 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -36,7 +36,7 @@ particular working environment and set of practices.
     equipment together and set up your development environment's
     hardware topology.
 
-    Here are possible roles:
+    Possible roles are:
 
     -  *Application Developer:* This type of developer does application
        level work on top of an existing software stack.
@@ -99,7 +99,7 @@ particular working environment and set of practices.
 
 5.  *Set up the Application Development Machines:* As mentioned earlier,
     application developers are creating applications on top of existing
-    software stacks. Following are some best practices for setting up
+    software stacks. Here are some best practices for setting up
     machines used for application development:
 
     -  Use a pre-built toolchain that contains the software stack
@@ -118,7 +118,7 @@ particular working environment and set of practices.
 
 6.  *Set up the Core Development Machines:* As mentioned earlier, core
     developers work on the contents of the operating system itself.
-    Following are some best practices for setting up machines used for
+    Here are some best practices for setting up machines used for
     developing images:
 
     -  Have the :term:`OpenEmbedded Build System` available on
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 3e1ef389b8..cbcb30281a 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1376,7 +1376,7 @@ In order to run this task, you must have an existing ``.config`` file.
 See the ":ref:`kernel-dev/common:using \`\`menuconfig\`\``" section for
 information on how to create a configuration file.
 
-Following is sample output from the ``do_kernel_configcheck`` task:
+Here is sample output from the ``do_kernel_configcheck`` task:
 
 .. code-block:: none
 
@@ -1809,7 +1809,7 @@ tree. Using Git is an efficient way to see what has changed in the tree.
 What Changed in a Kernel?
 -------------------------
 
-Following are a few examples that show how to use Git commands to
+Here are a few examples that show how to use Git commands to
 examine changes. These examples are by no means the only way to see
 changes.
 
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 6affe68b58..81a434d5b7 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -252,7 +252,7 @@ section in the Yocto Project Development Tasks Manual.
 Build History
 -------------
 
-Following are changes to Build History:
+The changes to Build History are:
 
 -  Installed package sizes: ``installed-package-sizes.txt`` for an image
    now records the size of the files installed by each package instead
@@ -275,7 +275,7 @@ section in the Yocto Project Development Tasks Manual.
 ``udev``
 --------
 
-Following are changes to ``udev``:
+The changes to ``udev`` are:
 
 -  ``udev`` no longer brings in ``udev-extraconf`` automatically through
    :term:`RRECOMMENDS`, since this was originally
@@ -319,7 +319,7 @@ Removed and Renamed Recipes
 Other Changes
 -------------
 
-Following is a list of short entries describing other changes:
+Here is a list of short entries describing other changes:
 
 -  ``run-postinsts``: Make this generic.
 
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index 40e3b5cb2b..49cd9b9ae0 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -70,9 +70,9 @@ Metadata Must Now Use Python 3 Syntax
 
 The metadata is now required to use Python 3 syntax. For help preparing
 metadata, see any of the many Python 3 porting guides available.
-Alternatively, you can reference the conversion commits for Bitbake and
-you can use :term:`OpenEmbedded-Core (OE-Core)` as a guide for changes. Following are
-particular areas of interest:
+Alternatively, you can reference the conversion commits for BitBake and
+you can use :term:`OpenEmbedded-Core (OE-Core)` as a guide for changes.
+Particular areas of interest are:
 
   - subprocess command-line pipes needing locale decoding
 
@@ -181,14 +181,8 @@ root filesystem, provides an image, and uses the ``nographic`` option::
 
    $ runqemu qemux86-64 tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4 tmp/deploy/images/qemux86-64/bzImage nographic
 
-Following is a list of variables that can be set in configuration files
-such as ``bsp.conf`` to enable the BSP to be booted by ``runqemu``:
-
-.. note::
-
-   "QB" means "QEMU Boot".
-
-::
+Here is a list of variables that can be set in configuration files
+such as ``bsp.conf`` to enable the BSP to be booted by ``runqemu``::
 
    QB_SYSTEM_NAME: QEMU name (e.g. "qemu-system-i386")
    QB_OPT_APPEND: Options to append to QEMU (e.g. "-show-cursor")
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index 964ed92937..66dfc20d95 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -89,8 +89,6 @@ occurred:
 Removed Recipes
 ---------------
 
-The following recipes have been removed:
-
 -  ``acpitests``: This recipe is not maintained.
 
 -  ``autogen-native``: No longer required by Grub, oe-core, or
@@ -213,8 +211,6 @@ recipes you might have. This will avoid breakage in post 2.4 releases.
 Package QA Changes
 ------------------
 
-The following package QA changes took place:
-
 -  The "unsafe-references-in-scripts" QA check has been removed.
 
 -  If you refer to ``${COREBASE}/LICENSE`` within
@@ -229,8 +225,6 @@ The following package QA changes took place:
 ``README`` File Changes
 -----------------------
 
-The following are changes to ``README`` files:
-
 -  The main Poky ``README`` file has been moved to the ``meta-poky``
    layer and has been renamed ``README.poky``. A symlink has been
    created so that references to the old location work.
@@ -246,8 +240,6 @@ The following are changes to ``README`` files:
 Miscellaneous Changes
 ---------------------
 
-The following are additional changes:
-
 -  The ``ROOTFS_PKGMANAGE_BOOTSTRAP`` variable and any references to it
    have been removed. You should remove this variable from any custom
    recipes.
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index fdbf2f3da3..03ecb16dc6 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -85,8 +85,6 @@ The following recipes have been removed:
 Scripts and Tools Changes
 -------------------------
 
-The following are changes to scripts and tools:
-
 -  ``yocto-bsp``, ``yocto-kernel``, and ``yocto-layer``: The
    ``yocto-bsp``, ``yocto-kernel``, and ``yocto-layer`` scripts
    previously shipped with poky but not in OpenEmbedded-Core have been
@@ -117,8 +115,6 @@ The following are changes to scripts and tools:
 BitBake Changes
 ---------------
 
-The following are BitBake changes:
-
 -  The ``--runall`` option has changed. There are two different
    behaviors people might want:
 
@@ -151,7 +147,7 @@ The following are BitBake changes:
 Python and Python 3 Changes
 ---------------------------
 
-The following are auto-packaging changes to Python and Python 3:
+Here are auto-packaging changes to Python and Python 3:
 
 The script-managed ``python-*-manifest.inc`` files that were previously
 used to generate Python and Python 3 packages have been replaced with a
@@ -185,8 +181,6 @@ change please see :yocto_git:`this commit
 Miscellaneous Changes
 ---------------------
 
-The following are additional changes:
-
 -  The :ref:`kernel <ref-classes-kernel>` class supports building packages for multiple kernels.
    If your kernel recipe or ``.bbappend`` file mentions packaging at
    all, you should replace references to the kernel in package names
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index fc801144b1..9e78fc709f 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -140,7 +140,7 @@ Python changes
   classes should be updated to inherit ``setuptools*`` equivalents instead.
   
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__.
-  Here are the new Python packaging classes that should be used:
+  The new Python packaging classes that should be used are
   :ref:`python_flit_core <ref-classes-python_flit_core>`,
   :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>`
   and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.  
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 371c73418a..3e80d6fddd 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -37,7 +37,7 @@ to each data source as a layer. For information on layers, see the
 ":ref:`dev-manual/layers:understanding and creating layers`"
 section of the Yocto Project Development Tasks Manual.
 
-Following are some brief details on these core components. For
+Here are some brief details on these core components. For
 additional information on how these components interact during a build,
 see the
 ":ref:`overview-manual/concepts:openembedded build system concepts`"
@@ -1351,10 +1351,9 @@ can initialize the environment before using the tools.
       the :doc:`/sdk-manual/index` manual.
 
 All the output files for an SDK are written to the ``deploy/sdk`` folder
-inside the :term:`Build Directory` as
-shown in the previous figure. Depending on the type of SDK, there are
-several variables to configure these files. Here are the variables
-associated with an extensible SDK:
+inside the :term:`Build Directory` as shown in the previous figure. Depending
+on the type of SDK, there are several variables to configure these files.
+The variables associated with an extensible SDK are:
 
 -  :term:`DEPLOY_DIR`: Points to
    the ``deploy`` directory.
@@ -2279,7 +2278,7 @@ which is integrating ``sayhello`` in our root file system:
 #.  Add ``sayhello`` to :term:`IMAGE_INSTALL` to integrate it into
     the root file system
 
-The following are the contents of ``libhello/Makefile``::
+The contents of ``libhello/Makefile`` are::
 
    LIB=libhello.so
 
@@ -2307,7 +2306,7 @@ The following are the contents of ``libhello/Makefile``::
    and ``CFLAGS`` as BitBake will set them as environment variables according
    to your build configuration.
 
-The following are the contents of ``libhello/hellolib.h``::
+The contents of ``libhello/hellolib.h`` are::
 
    #ifndef HELLOLIB_H
    #define HELLOLIB_H
@@ -2316,7 +2315,7 @@ The following are the contents of ``libhello/hellolib.h``::
 
    #endif
 
-The following are the contents of ``libhello/hellolib.c``::
+The contents of ``libhello/hellolib.c`` are::
 
    #include <stdio.h>
 
@@ -2324,7 +2323,7 @@ The following are the contents of ``libhello/hellolib.c``::
       puts("Hello from a Yocto demo \n");
    }
 
-The following are the contents of ``sayhello/Makefile``::
+The contents of ``sayhello/Makefile`` are::
 
    EXEC=sayhello
    LDFLAGS += -lhello
@@ -2337,7 +2336,7 @@ The following are the contents of ``sayhello/Makefile``::
    clean:
       rm -rf $(EXEC) *.o
 
-The following are the contents of ``sayhello/sayhello.c``::
+The contents of ``sayhello/sayhello.c`` are::
 
    #include <hellolib.h>
 
@@ -2346,7 +2345,7 @@ The following are the contents of ``sayhello/sayhello.c``::
       return 0;
    }
 
-The following are the contents of ``libhello_0.1.bb``::
+The contents of ``libhello_0.1.bb`` are::
 
    SUMMARY = "Hello demo library"
    DESCRIPTION = "Hello shared library used in Yocto demo"
@@ -2369,7 +2368,7 @@ The following are the contents of ``libhello_0.1.bb``::
       oe_soinstall ${PN}.so.${PV} ${D}${libdir}
    }
 
-The following are the contents of ``sayhello_0.1.bb``::
+The contents of ``sayhello_0.1.bb`` are::
 
    SUMMARY = "SayHello demo"
    DESCRIPTION = "SayHello project used in Yocto demo"
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index f7cd2486af..3dc8ae5519 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -742,7 +742,7 @@ workflow:
 .. image:: figures/YP-flow-diagram.png
     :align: center
 
-Following is a brief summary of the "workflow":
+Here is a brief summary of the "workflow":
 
 1. Developers specify architecture, policies, patches and configuration
    details.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 216b236e33..05473edcca 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -616,7 +616,7 @@ information about using :ref:`ref-classes-devshell`.
 The :ref:`ref-classes-devupstream` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
-tarball. Following is an example::
+tarball. Here is an example::
 
    BBCLASSEXTEND = "devupstream:target"
    SRC_URI:class-devupstream = "git://git.example.com/example;branch=main"
@@ -1141,8 +1141,8 @@ Please keep in mind that the QA checks
 are meant to detect real or potential problems in the packaged
 output. So exercise caution when disabling these checks.
 
-Here are the tests you can list with the :term:`WARN_QA` and
-:term:`ERROR_QA` variables:
+The tests you can list with the :term:`WARN_QA` and
+:term:`ERROR_QA` variables are:
 
 -  ``already-stripped:`` Checks that produced binaries have not
    already been stripped prior to the build system extracting debug
@@ -3148,7 +3148,7 @@ information.
 The :ref:`ref-classes-uboot-sign` class provides support for U-Boot verified boot.
 It is intended to be inherited from U-Boot recipes.
 
-Here are variables used by this class:
+The variables used by this class are:
 
 -  :term:`SPL_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
    building the FIT image.
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index ba0385c4c8..4144277e88 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -379,16 +379,14 @@ command::
 Unless you provide a specific recipe name on the command line, the
 command checks all recipes in all configured layers.
 
-Following is a partial example table that reports on all the recipes.
+Here is a partial example table that reports on all the recipes.
 Notice the reported reason for not upgrading the ``base-passwd`` recipe.
 In this example, while a new version is available upstream, you do not
 want to use it because the dependency on ``cdebconf`` is not easily
 satisfied. Maintainers can explicit the reason that is shown by adding
 the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
 See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
-for an example.
-
-::
+for an example::
 
    $ devtool check-upgrade-status
    ...
@@ -599,7 +597,7 @@ The ``devtool status`` command has no command-line options::
 
    $ devtool status
 
-Following is sample output after using
+Here is sample output after using
 :ref:`devtool add <ref-manual/devtool-reference:adding a new recipe to the workspace layer>`
 to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index b428dc2db6..9fb60899c9 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -312,7 +312,7 @@ HTTPS requests and direct them to the ``http://`` sources mirror. You
 can use ``file://`` URLs to point to local directories or network shares
 as well.
 
-Here are other options::
+Another option is to set::
 
    BB_NO_NETWORK = "1"
 
@@ -328,7 +328,7 @@ This statement
 limits the build system to pulling source from the :term:`PREMIRRORS` only.
 Again, this technique is useful for reproducing builds.
 
-Here is another technique::
+Here is yet another technique::
 
    BB_GENERATE_MIRROR_TARBALLS = "1"
 
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index a7078c7f3a..4f0366eeb6 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -198,7 +198,7 @@ you can add several different predefined packages such as development
 utilities or packages with debug information needed to investigate
 application problems or profile applications.
 
-Here are the image features available for all images:
+The image features available for all images are:
 
 -  *allow-empty-password:* Allows Dropbear and OpenSSH to accept root
    logins and logins from accounts having an empty password string.
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index da27512855..f875633128 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -32,7 +32,7 @@ that contain image recipe files::
 
    $ ls meta*/recipes*/images/*.bb
 
-Following is a list of supported recipes:
+Here is a list of supported recipes:
 
 -  ``build-appliance-image``: An example virtual machine that contains
    all the pieces required to run builds using the build system as well
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 2393ac8d81..2913a4d4eb 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -14,7 +14,7 @@ Major and Minor Release Cadence
 
 The Yocto Project delivers major releases (e.g. &DISTRO;) using a six
 month cadence roughly timed each April and October of the year.
-Following are examples of some major YP releases with their codenames
+Here are examples of some major YP releases with their codenames
 also shown. See the ":ref:`ref-manual/release-process:major release codenames`"
 section for information on codenames used with major releases.
 
@@ -29,8 +29,8 @@ major holidays in various geographies.
 
 The Yocto project delivers minor (point) releases on an unscheduled
 basis and are usually driven by the accumulation of enough significant
-fixes or enhancements to the associated major release. Following are
-some example past point releases:
+fixes or enhancements to the associated major release.
+Some example past point releases are:
 
   - 4.1.3
   - 4.0.8
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index d21134fd7f..021e49e9d7 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -530,7 +530,7 @@ recipe-specific :term:`WORKDIR` directories. Thus, the
 This directory holds information that BitBake uses for accounting
 purposes to track what tasks have run and when they have run. The
 directory is sub-divided by architecture, package name, and version.
-Following is an example::
+Here is an example::
 
       stamps/all-poky-linux/distcc-config/1.0-r0.do_build-2fdd....2do
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 2a5baa4cbf..d602f7ea36 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -4,7 +4,7 @@
 Yocto Project Terms
 *******************
 
-Following is a list of terms and definitions users new to the Yocto Project
+Here is a list of terms and definitions users new to the Yocto Project
 development environment might find helpful. While some of these terms are
 universal, the list includes them just in case:
 
@@ -66,8 +66,8 @@ universal, the list includes them just in case:
       (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``). The
       :term:`TOPDIR` variable points to the Build Directory.
 
-      You have a lot of flexibility when creating the Build Directory.
-      Following are some examples that show how to create the directory.  The
+      You have a lot of flexibility when creating the :term:`Build Directory`.
+      Here are some examples that show how to create the directory.  The
       examples assume your :term:`Source Directory` is named ``poky``:
 
          -  Create the Build Directory inside your Source Directory and let
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ae14c450dd..691a0cdc1a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -318,7 +318,7 @@ system and gives an overview of their function and contents.
 
    :term:`BB_ALLOWED_NETWORKS`
       Specifies a space-delimited list of hosts that the fetcher is allowed
-      to use to obtain the required source code. Following are
+      to use to obtain the required source code. Here are
       considerations surrounding this variable:
 
       -  This host list is only used if :term:`BB_NO_NETWORK` is either not set
@@ -6174,7 +6174,7 @@ system and gives an overview of their function and contents.
       The :term:`PREFERRED_PROVIDER` variable is set with the name (:term:`PN`) of
       the recipe you prefer to provide "virtual/kernel".
 
-      Following are more examples::
+      Here are more examples::
 
          PREFERRED_PROVIDER_virtual/xserver = "xserver-xf86"
          PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
@@ -8940,7 +8940,7 @@ system and gives an overview of their function and contents.
       configuration can define the :term:`UBOOT_MACHINE` and optionally the
       :term:`IMAGE_FSTYPES` and the :term:`UBOOT_BINARY`.
 
-      Following is an example from the ``meta-freescale`` layer. ::
+      Here is an example from the ``meta-freescale`` layer. ::
 
          UBOOT_CONFIG ??= "sdcard-ifc-secure-boot sdcard-ifc sdcard-qspi lpuart qspi secure-boot nor"
          UBOOT_CONFIG[nor] = "ls1021atwr_nor_defconfig"
@@ -9413,7 +9413,7 @@ system and gives an overview of their function and contents.
       With the :term:`WKS_FILE_DEPENDS` variable, you have the possibility to
       specify a list of additional dependencies (e.g. native tools,
       bootloaders, and so forth), that are required to build Wic images.
-      Following is an example::
+      Here is an example::
 
          WKS_FILE_DEPENDS = "some-native-tool"
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 7b458f281b..d384b4916a 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -51,8 +51,8 @@ Follow these steps to locate and hand-install the toolchain:
 
       poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
 
-4. *Run the Installer:* Be sure you have execution privileges and run
-   the installer. Following is an example from the ``Downloads``
+#. *Run the Installer:* Be sure you have execution privileges and run
+   the installer. Here is an example from the ``Downloads``
    directory::
 
       $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-qemux86-64-toolchain-&DISTRO;.sh
@@ -155,12 +155,12 @@ build the SDK installer. Follow these steps:
          variable inside your ``local.conf`` file before building the
          SDK installer. Doing so ensures that the eventual SDK
          installation process installs the appropriate library packages
-         as part of the SDK. Following is an example using ``libc``
+         as part of the SDK. Here is an example using ``libc``
          static development libraries: TOOLCHAIN_TARGET_TASK:append = "
          libc-staticdev"
 
-7. *Run the Installer:* You can now run the SDK installer from
-   ``tmp/deploy/sdk`` in the Build Directory. Following is an example::
+#. *Run the Installer:* You can now run the SDK installer from
+   ``tmp/deploy/sdk`` in the :term:`Build Directory`. Here is an example::
 
       $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
@@ -225,7 +225,7 @@ Follow these steps to extract the root filesystem:
    This script is located in the top-level directory in which you
    installed the toolchain (e.g. ``poky_sdk``).
 
-   Following is an example based on the toolchain installed in the
+   Here is an example based on the toolchain installed in the
    ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section::
 
       $ source poky_sdk/environment-setup-core2-64-poky-linux
@@ -233,7 +233,7 @@ Follow these steps to extract the root filesystem:
 3. *Extract the Root Filesystem:* Use the ``runqemu-extract-sdk``
    command and provide the root filesystem image.
 
-   Following is an example command that extracts the root filesystem
+   Here is an example command that extracts the root filesystem
    from a previously built root filesystem image that was downloaded
    from the :yocto_dl:`Index of Releases </releases/yocto/yocto-&DISTRO;/machines/>`.
    This command extracts the root filesystem into the ``core2-64-sato``
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 802d3f3d42..4310e133fb 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -66,7 +66,7 @@ The SDK development environment consists of the following:
 
 In summary, the extensible and standard SDK share many features.
 However, the extensible SDK has powerful development tools to help you
-more quickly develop applications. Following is a table that summarizes
+more quickly develop applications. Here is a table that summarizes
 the primary differences between the standard and extensible SDK types
 when considering which to build:
 
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index 1e1a314d66..69155bdeb7 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -366,7 +366,7 @@ Perform the following steps to install Toaster:
 
       /etc/apache2/conf.d/toaster.conf
 
-    Following is a sample Apache configuration for Toaster you can follow:
+    Here is a sample Apache configuration for Toaster you can follow:
 
     .. code-block:: apache
 
@@ -496,7 +496,7 @@ The Toaster web interface allows you to do the following:
 Toaster Web Interface Videos
 ----------------------------
 
-Following are several videos that show how to use the Toaster GUI:
+Here are several videos that show how to use the Toaster GUI:
 
 -  *Build Configuration:* This
    `video <https://www.youtube.com/watch?v=qYgDZ8YzV6w>`__ overviews and
-- 
2.34.1


