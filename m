Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.1033.1603734651452248621
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 10:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.110.8
Received: from localhost.localdomain (80-110-110-8.cgn.dynamic.surfer.at [80.110.110.8])
	(Authenticated sender: foss@0leil.net)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPA id 1506620007;
	Mon, 26 Oct 2020 17:50:48 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/3] docs: kernel-dev: fix typos, highlights and links
Date: Mon, 26 Oct 2020 18:50:27 +0100
Message-Id: <20201026175029.22352-1-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 .../kernel-dev/kernel-dev-advanced.rst        |  96 ++---
 .../kernel-dev/kernel-dev-common.rst          | 333 ++++++++----------
 .../kernel-dev/kernel-dev-concepts-appx.rst   |  15 +-
 documentation/kernel-dev/kernel-dev-faq.rst   |  17 +-
 documentation/kernel-dev/kernel-dev-intro.rst |  17 +-
 .../kernel-dev/kernel-dev-maint-appx.rst      |  20 +-
 6 files changed, 211 insertions(+), 287 deletions(-)

diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index eeb8f8792..444037c3a 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -44,9 +44,7 @@ linux-yocto recipe.
 .. note::
 
    A Linux kernel recipe that contains kernel Metadata (e.g. inherits
-   from the
-   linux-yocto.inc
-   file) is said to be a "linux-yocto style" recipe.
+   from the ``linux-yocto.inc`` file) is said to be a "linux-yocto style" recipe.
 
 Every linux-yocto style recipe must define the
 :term:`KMACHINE` variable. This
@@ -70,12 +68,8 @@ to indicate the branch.
 
 .. note::
 
-   You can use the
-   KBRANCH
-   value to define an alternate branch typically with a machine override
-   as shown here from the
-   meta-yocto-bsp
-   layer:
+   You can use the ``KBRANCH`` value to define an alternate branch typically
+   with a machine override as shown here from the ``meta-yocto-bsp`` layer:
    ::
 
            KBRANCH_edgerouter = "standard/edgerouter"
@@ -101,7 +95,7 @@ section for more information on kernel types.
 During the build, the kern-tools search for the BSP description file
 that most closely matches the ``KMACHINE`` and ``LINUX_KERNEL_TYPE``
 variables passed in from the recipe. The tools use the first BSP
-description it finds that match both variables. If the tools cannot find
+description they find that matches both variables. If the tools cannot find
 a match, they issue a warning.
 
 The tools first search for the ``KMACHINE`` and then for the
@@ -251,8 +245,7 @@ two files: ``smp.scc`` and ``smp.cfg``. You can find these files in the
       CONFIG_X86_BIGSMP=y
 
 You can find general information on configuration
-fragment files in the "`Creating Configuration
-Fragments <#creating-config-fragments>`__" section.
+fragment files in the ":ref:`creating-config-fragments`" section.
 
 Within the ``smp.scc`` file, the
 :term:`KFEATURE_DESCRIPTION`
@@ -269,13 +262,12 @@ non-hardware fragment.
 
 .. note::
 
-   The description file can include multiple
-   kconf
-   statements, one per fragment.
+   The description file can include multiple ``kconf`` statements, one per
+   fragment.
 
-As described in the "`Validating
-Configuration <#validating-configuration>`__" section, you can use the
-following BitBake command to audit your configuration:
+As described in the
+":ref:`kernel-dev/kernel-dev-common:validating configuration`" section, you can
+use the following BitBake command to audit your configuration:
 ::
 
    $ bitbake linux-yocto -c kernel_configcheck -f
@@ -335,10 +327,8 @@ for the five patches in the directory.
 
 You can create a typical ``.patch`` file using ``diff -Nurp`` or
 ``git format-patch`` commands. For information on how to create patches,
-see the "`Using ``devtool`` to Patch the
-Kernel <#using-devtool-to-patch-the-kernel>`__" and "`Using Traditional
-Kernel Development to Patch the
-Kernel <#using-traditional-kernel-development-to-patch-the-kernel>`__"
+see the ":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+and ":ref:`kernel-dev/kernel-dev-common:using traditional kernel development to patch the kernel`"
 sections.
 
 Features
@@ -397,15 +387,11 @@ type as follows:
 
 .. note::
 
-   You can find kernel recipes in the
-   meta/recipes-kernel/linux
-   directory of the
-   Source Directory
-   (e.g.
-   poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb
-   ). See the "
-   Using Kernel Metadata in a Recipe
-   " section for more information.
+   You can find kernel recipes in the ``meta/recipes-kernel/linux`` directory
+   of the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+   (e.g. ``poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb``). See the
+   ":ref:`kernel-dev/kernel-dev-advanced:using kernel metadata in a recipe`"
+   section for more information.
 
 Three kernel types ("standard", "tiny", and "preempt-rt") are supported
 for Linux Yocto kernels:
@@ -466,16 +452,11 @@ and ``patch`` commands, respectively.
 
 .. note::
 
-   It is not strictly necessary to create a kernel type
-   .scc
+   It is not strictly necessary to create a kernel type ``.scc``
    file. The Board Support Package (BSP) file can implicitly define the
-   kernel type using a
-   define
-   KTYPE
-   myktype
-   line. See the "
-   BSP Descriptions
-   " section for more information.
+   kernel type using a ``define`` :term:`KTYPE` ``myktype`` line. See the
+   ":ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`" section for more
+   information.
 
 BSP Descriptions
 ----------------
@@ -488,13 +469,9 @@ supported kernel type.
 .. note::
 
    For BSPs supported by the Yocto Project, the BSP description files
-   are located in the
-   bsp
-   directory of the
-   yocto-kernel-cache
+   are located in the ``bsp`` directory of the ``yocto-kernel-cache``
    repository organized under the "Yocto Linux Kernel" heading in the
-   Yocto Project Source Repositories
-   .
+   :yocto_git:`Yocto Project Source Repositories </>`.
 
 This section overviews the BSP description structure, the aggregation
 concepts, and presents a detailed example using a BSP supported by the
@@ -571,7 +548,7 @@ policy. See the "`Kernel Types <#kernel-types>`__" section for more
 information.
 
 To aggregate common configurations and features specific to the kernel
-for mybsp, use the following:
+for `mybsp`, use the following:
 ::
 
    include mybsp.scc
@@ -582,8 +559,7 @@ You can see that in the BeagleBone example with the following:
    include beaglebone.scc
 
 For information on how to break a complete ``.config`` file into the various
-configuration fragments, see the "`Creating Configuration
-Fragments <#creating-config-fragments>`__" section.
+configuration fragments, see the ":ref:`creating-config-fragments`" section.
 
 Finally, if you have any configurations specific to the hardware that
 are not in a ``*.scc`` file, you can include them as follows:
@@ -653,7 +629,7 @@ found on the machine. This ``minnow.scc`` description file is then
 included in each of the three "minnow" description files for the
 supported kernel types (i.e. "standard", "preempt-rt", and "tiny").
 Consider the "minnow" description for the "standard" kernel type (i.e.
-``minnow-standard.scc``:
+``minnow-standard.scc``):
 ::
 
    define KMACHINE minnow
@@ -725,8 +701,8 @@ others, the recipe-space method is recommended. This method is also a
 good approach if you are working with Linux kernel sources you do not
 control or if you just do not want to maintain a Linux kernel Git
 repository on your own. For partial information on how you can define
-kernel Metadata in the recipe-space, see the "`Modifying an Existing
-Recipe <#modifying-an-existing-recipe>`__" section.
+kernel Metadata in the recipe-space, see the
+":ref:`kernel-dev/kernel-dev-common:modifying an existing recipe`" section.
 
 Conversely, if you are actively developing a kernel and are already
 maintaining a Linux kernel Git repository of your own, you might find it
@@ -746,8 +722,8 @@ modifying
 ``oe-core/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb`` to
 a recipe in your layer, ``FILESEXTRAPATHS`` is typically set to
 ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``.
-See the "`Modifying an Existing
-Recipe <#modifying-an-existing-recipe>`__" section for more information.
+See the ":ref:`kernel-dev/kernel-dev-common:modifying an existing recipe`"
+section for more information.
 
 Here is an example that shows a trivial tree of kernel Metadata stored
 in recipe-space within a BSP layer:
@@ -849,7 +825,7 @@ best for your development model.
 Encapsulating Patches
 ---------------------
 
-if you are reusing patches from an external tree and are not working on
+If you are reusing patches from an external tree and are not working on
 the patches, you might find the encapsulated feature to be appropriate.
 Given this scenario, you do not need to create any branches in the
 source repository. Rather, you just take the static patches you need and
@@ -881,6 +857,7 @@ new branch as the ``KBRANCH`` to use for the board as follows:
 
 Another method is to use the ``branch`` command in the BSP
 description:
+::
 
    mybsp.scc:
       define KMACHINE mybsp
@@ -902,7 +879,7 @@ repositories use:
 If you had two kernel types, "standard" and "small" for instance, three
 machines, and common as ``mydir``, the branches in your Git repository
 might look like this:
-:
+::
 
    mydir/base
    mydir/standard/base
@@ -922,11 +899,8 @@ appropriate for the other branches.
 
    The "base" branches are an artifact of the way Git manages its data
    internally on the filesystem: Git will not allow you to use
-   mydir/standard
-   and
-   mydir/standard/machine_a
-   because it would have to create a file and a directory named
-   "standard".
+   ``mydir/standard`` and ``mydir/standard/machine_a`` because it would have to
+   create a file and a directory named "standard".
 
 Feature Branches
 ----------------
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 64235f380..370acf138 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -33,12 +33,10 @@ Source Directory.
 
    Be sure you check out the appropriate development branch or you
    create your local branch by checking out a specific tag to get the
-   desired version of Yocto Project. See the "
-   Checking Out by Branch in Poky
-   " and "
-   Checking Out by Tag in Poky
-   " sections in the Yocto Project Development Tasks Manual for more
-   information.
+   desired version of Yocto Project. See the
+   ":ref:`dev-manual/dev-manual-start:checking out by branch in poky`" and
+   ":ref:`dev-manual/dev-manual-start:checking out by tag in poky`"
+   sections in the Yocto Project Development Tasks Manual for more information.
 
 Kernel development is best accomplished using
 :ref:`devtool <sdk-manual/sdk-extensible:using \`\`devtool\`\` in your sdk workflow>`
@@ -50,8 +48,8 @@ Getting Ready to Develop Using ``devtool``
 
 Follow these steps to prepare to update the kernel image using
 ``devtool``. Completing this procedure leaves you with a clean kernel
-image and ready to make modifications as described in the "
-:ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
+image and ready to make modifications as described in the
+":ref:`kernel-dev/kernel-dev-common:using \`\`devtool\`\` to patch the kernel`"
 section:
 
 1. *Initialize the BitBake Environment:* Before building an extensible
@@ -65,10 +63,8 @@ section:
    .. note::
 
       The previous commands assume the
-      Source Repositories
-      (i.e.
-      poky
-      ) have been cloned using Git and the local repository is named
+      :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+      (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
 2. *Prepare Your local.conf File:* By default, the
@@ -107,18 +103,15 @@ section:
    .. note::
 
       For background information on working with common and BSP layers,
-      see the "
-      Understanding and Creating Layers
-      " section in the Yocto Project Development Tasks Manual and the "
-      BSP Layers
-      " section in the Yocto Project Board Support (BSP) Developer's
-      Guide, respectively. For information on how to use the
-      bitbake-layers create-layer
-      command to quickly set up a layer, see the "
-      Creating a General Layer Using the
-      bitbake-layers
-      Script
-      " section in the Yocto Project Development Tasks Manual.
+      see the
+      ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+      section in the Yocto Project Development Tasks Manual and the
+      ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
+      Support (BSP) Developer's Guide, respectively. For information on how to
+      use the ``bitbake-layers create-layer`` command to quickly set up a layer,
+      see the
+      ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      section in the Yocto Project Development Tasks Manual.
 
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
@@ -141,9 +134,12 @@ section:
    Once
    the build finishes, you can find the SDK installer file (i.e.
    ``*.sh`` file) in the following directory:
-   ~/poky/build/tmp/deploy/sdk For this example, the installer file is
-   named
-   ``poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-DISTRO.sh``
+   ::
+
+      ~/poky/build/tmp/deploy/sdk
+
+   For this example, the installer file is named
+   ``poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-DISTRO.sh``.
 
 6. *Install the Extensible SDK:* Use the following command to install
    the SDK. For this example, install the SDK in the default
@@ -211,7 +207,7 @@ section:
    building for actual hardware and not for emulation, you could flash
    the image to a USB stick on ``/dev/sdd`` and boot your device. For an
    example that uses a Minnowboard, see the
-   `TipsAndTricks/KernelDevelopmentWithEsdk <https://wiki.yoctoproject.org/wiki/TipsAndTricks/KernelDevelopmentWithEsdk>`__
+   :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </wiki/TipsAndTricks/KernelDevelopmentWithEsdk>`
    Wiki page.
 
 At this point you have set up to start making modifications to the
@@ -247,16 +243,14 @@ section:
       $ cd ~/poky
       $ git branch
       master
-      * &DISTRO_NAME;
+      * &DISTRO_NAME_NO_CAP;
       $ source oe-init-build-env
 
    .. note::
 
       The previous commands assume the
-      Source Repositories
-      (i.e.
-      poky
-      ) have been cloned using Git and the local repository is named
+      :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
+      (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
 2. *Prepare Your local.conf File:* By default, the
@@ -294,18 +288,15 @@ section:
    .. note::
 
       For background information on working with common and BSP layers,
-      see the "
-      Understanding and Creating Layers
-      " section in the Yocto Project Development Tasks Manual and the "
-      BSP Layers
-      " section in the Yocto Project Board Support (BSP) Developer's
-      Guide, respectively. For information on how to use the
-      bitbake-layers create-layer
-      command to quickly set up a layer, see the "
-      Creating a General Layer Using the
-      bitbake-layers
-      Script
-      " section in the Yocto Project Development Tasks Manual.
+      see the
+      ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
+      section in the Yocto Project Development Tasks Manual and the
+      ":ref:`bsp-guide/bsp:bsp layers`" section in the Yocto Project Board
+      Support (BSP) Developer's Guide, respectively. For information on how to
+      use the ``bitbake-layers create-layer`` command to quickly set up a layer,
+      see the
+      ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+      section in the Yocto Project Development Tasks Manual.
 
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
@@ -334,12 +325,10 @@ section:
 
    .. note::
 
-      The
-      linux-yocto-4.12
-      kernel can be used with the Yocto Project 2.4 release and forward.
-      You cannot use the
-      linux-yocto-4.12
-      kernel with releases prior to Yocto Project 2.4:
+      The ``linux-yocto-4.12`` kernel can be used with the Yocto Project 2.4
+      release and forward.
+      You cannot use the ``linux-yocto-4.12`` kernel with releases prior to
+      Yocto Project 2.4.
 
    ::
 
@@ -351,7 +340,7 @@ section:
       remote: Total 6097195 (delta 5152604), reused 6096847 (delta 5152256)
       Receiving objects: 100% (6097195/6097195), 1.24 GiB | 7.81 MiB/s, done.
       Resolving deltas: 100% (5152604/5152604), done. Checking connectivity... done.
-      Checking out   files: 100% (59846/59846), done.
+      Checking out files: 100% (59846/59846), done.
 
 6. *Create a Local Copy of the Kernel Cache Git Repository:* For
    simplicity, it is recommended that you create your copy of the kernel
@@ -395,13 +384,10 @@ section in the Yocto Project Development Tasks Manual.
 .. note::
 
    The Yocto Project comes with many tools that simplify tasks you need
-   to perform. One such tool is the
-   bitbake-layers create-layer
-   command, which simplifies creating a new layer. See the "
-   Creating a General Layer Using the
-   bitbake-layers
-   Script
-   " section in the Yocto Project Development Tasks Manual for
+   to perform. One such tool is the ``bitbake-layers create-layer``
+   command, which simplifies creating a new layer. See the
+   ":ref:`dev-manual/dev-manual-common-tasks:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   section in the Yocto Project Development Tasks Manual for
    information on how to use this script to quick set up a new layer.
 
 To better understand the layer you create for kernel development, the
@@ -471,11 +457,11 @@ the :term:`Source Directory` in
 
 Modifying an existing recipe can consist of the following:
 
--  Creating the append file
+- :ref:`kernel-dev/kernel-dev-common:creating the append file`
 
--  Applying patches
+- :ref:`kernel-dev/kernel-dev-common:applying patches`
 
--  Changing the configuration
+- :ref:`kernel-dev/kernel-dev-common:changing the configuration`
 
 Before modifying an existing recipe, be sure that you have created a
 minimal, custom layer from which you can work. See the "`Creating and
@@ -490,7 +476,8 @@ based on the linux-yocto recipe you are using. For example, if you are
 modifying the ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` recipe,
 the append file will typically be located as follows within your custom
 layer:
-::
+
+.. code-block:: none
 
    your-layer/recipes-kernel/linux/linux-yocto_4.12.bbappend
 
@@ -515,13 +502,12 @@ your layer in the following area:
 .. note::
 
    If you are working on a new machine Board Support Package (BSP), be
-   sure to refer to the
-   Yocto Project Board Support Package (BSP) Developer's Guide
-   .
+   sure to refer to the :doc:`../bsp-guide/bsp-guide`.
 
 As an example, consider the following append file used by the BSPs in
 ``meta-yocto-bsp``:
-::
+
+.. code-block:: none
 
    meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend
 
@@ -689,17 +675,13 @@ created to hold the configuration changes.
 
 .. note::
 
-   The build system applies the configurations from the
-   defconfig
+   The build system applies the configurations from the ``defconfig``
    file before applying any subsequent configuration fragments. The
    final kernel configuration is a combination of the configurations in
-   the
-   defconfig
-   file and any configuration fragments you provide. You need to realize
-   that if you have any configuration fragments, the build system
-   applies these on top of and after applying the existing
-   defconfig
-   file configurations.
+   the ``defconfig`` file and any configuration fragments you provide. You need
+   to realize that if you have any configuration fragments, the build system
+   applies these on top of and after applying the existing ``defconfig`` file
+   configurations.
 
 Generally speaking, the preferred approach is to determine the
 incremental change you want to make and add that as a configuration
@@ -755,7 +737,7 @@ To specify an "in-tree" ``defconfig`` file, use the following statement
 form:
 ::
 
-   KBUILD_DEFCONFIG_KMACHINE ?= defconfig_file
+   KBUILD_DEFCONFIG_KMACHINE ?= "defconfig_file"
 
 Here is an example
 that assigns the ``KBUILD_DEFCONFIG`` variable based on "raspberrypi2"
@@ -768,7 +750,7 @@ a Raspberry Pi 2, which is based on the Broadcom 2708/2709 chipset:
 Aside from modifying your kernel recipe and providing your own
 ``defconfig`` file, you need to be sure no files or statements set
 ``SRC_URI`` to use a ``defconfig`` other than your "in-tree" file (e.g.
-a kernel's ``linux-``\ machine\ ``.inc`` file). In other words, if the
+a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
 build system detects a statement that identifies an "out-of-tree"
 ``defconfig`` file, that statement will override your
 ``KBUILD_DEFCONFIG`` variable.
@@ -786,10 +768,9 @@ the extensible SDK and ``devtool``.
 .. note::
 
    Before attempting this procedure, be sure you have performed the
-   steps to get ready for updating the kernel as described in the "
-   Getting Ready to Develop Using
-   devtool
-   " section.
+   steps to get ready for updating the kernel as described in the
+   ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+   section.
 
 Patching the kernel involves changing or adding configurations to an
 existing kernel, changing or adding recipes to the kernel that are
@@ -809,12 +790,9 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
 
    .. note::
 
-      See this
-      step
-      in the "
-      Getting Ready to Develop Using
-      devtool
-      " section for more information.
+      See this step in the
+      ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+      section for more information.
 
    Use the following ``devtool`` command to check out the code:
    ::
@@ -825,7 +803,8 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
 
       During the checkout operation, a bug exists that could cause
       errors such as the following to appear:
-      ::
+
+      .. code-block:: none
 
               ERROR: Taskhash mismatch 2c793438c2d9f8c3681fd5f7bc819efa versus
                      be3a89ce7c47178880ba7bf6293d7404 for
@@ -883,7 +862,7 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
       If the image you originally created resulted in a Wic file, you
       can use an alternate method to create the new image with the
       updated kernel. For an example, see the steps in the
-      TipsAndTricks/KernelDevelopmentWithEsdk
+      :yocto_wiki:`TipsAndTricks/KernelDevelopmentWithEsdk </wiki/TipsAndTricks/KernelDevelopmentWithEsdk>`
       Wiki Page.
 
    ::
@@ -903,7 +882,8 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
    2. *Verify the changes*: Log into the machine using ``root`` with no
       password and then use the following shell command to scroll
       through the console's boot output.
-      ::
+
+      .. code-block:: none
 
          # dmesg | less
 
@@ -925,14 +905,15 @@ the ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devto
    commits as patches and create a ``.bbappend`` file, use the following
    command in the terminal used to work with the extensible SDK. This
    example uses the previously established layer named ``meta-mylayer``.
+   ::
 
-   .. note::
+      $ devtool finish linux-yocto ~/meta-mylayer
 
-      See Step 3 of the "
-      Getting Ready to Develop Using devtool
-      " section for information on setting up this layer.
+   .. note::
 
-   $ devtool finish linux-yocto ~/meta-mylayer
+      See Step 3 of the
+      ":ref:`kernel-dev/kernel-dev-common:getting ready to develop using \`\`devtool\`\``"
+      section for information on setting up this layer.
 
    Once the command
    finishes, the patches and the ``.bbappend`` file are located in the
@@ -960,9 +941,9 @@ section).
 .. note::
 
    Before attempting this procedure, be sure you have performed the
-   steps to get ready for updating the kernel as described in the "
-   Getting Ready for Traditional Kernel Development
-   " section.
+   steps to get ready for updating the kernel as described in the
+   ":ref:`kernel-dev/kernel-dev-common:getting ready for traditional kernel development`"
+   section.
 
 Patching the kernel involves changing or adding configurations to an
 existing kernel, changing or adding recipes to the kernel that are
@@ -986,7 +967,7 @@ Section.
    section, use the following commands to edit the ``calibrate.c`` file:
 
    1. *Change the working directory*: You need to locate the source
-      files in the local copy of the kernel Git repository: Change to
+      files in the local copy of the kernel Git repository. Change to
       where the kernel source code is before making your edits to the
       ``calibrate.c`` file:
       ::
@@ -1046,13 +1027,10 @@ Section.
 
    .. note::
 
-      Be sure to replace
-      path-to
+      Be sure to replace `path-to`
       with the pathname to your local Git repositories. Also, you must
       be sure to specify the correct branch and machine types. For this
-      example, the branch is
-      standard/base
-      and the machine is "qemux86".
+      example, the branch is ``standard/base`` and the machine is ``qemux86``.
 
 4. *Build the Image:* With the source modified, your changes staged and
    committed, and the ``local.conf`` file pointing to the kernel files,
@@ -1073,7 +1051,8 @@ Section.
 6. *Look for Your Changes:* As QEMU booted, you might have seen your
    changes rapidly scroll by. If not, use these commands to see your
    changes:
-   ::
+
+   .. code-block:: none
 
       # dmesg | less
 
@@ -1134,13 +1113,10 @@ Section.
 
    .. note::
 
-      To build
-      core-image-minimal
-      again and see the effects of your patch, you can essentially
-      eliminate the temporary source files saved in
-      poky/build/tmp/work/...
-      and residual effects of the build by entering the following
-      sequence of commands:
+      To build ``core-image-minimal`` again and see the effects of your patch,
+      you can essentially eliminate the temporary source files saved in
+      ``poky/build/tmp/work/...`` and residual effects of the build by entering
+      the following sequence of commands:
       ::
 
               $ cd ~/poky/build
@@ -1174,7 +1150,7 @@ Using  ``menuconfig``
 The easiest way to define kernel configurations is to set them through
 the ``menuconfig`` tool. This tool provides an interactive method with
 which to set kernel configurations. For general information on
-``menuconfig``, see http://en.wikipedia.org/wiki/Menuconfig.
+``menuconfig``, see https://en.wikipedia.org/wiki/Menuconfig.
 
 To use the ``menuconfig`` tool in the Yocto Project development
 environment, you must do the following:
@@ -1212,35 +1188,20 @@ the tool and save your changes to create an updated version of the
 
 .. note::
 
-   You can use the entire
-   .config
-   file as the
-   defconfig
-   file. For information on
-   defconfig
-   files, see the "
-   Changing the Configuration
-   ", "
-   Using an In-Tree
-   defconfig
-   File
-   , and "
-   Creating a
-   defconfig
-   File
-   " sections.
+   You can use the entire ``.config`` file as the ``defconfig`` file. For
+   information on ``defconfig`` files, see the
+   ":ref:`kernel-dev/kernel-dev-common:changing the configuration`",
+   ":ref:`kernel-dev/kernel-dev-common:using an "in-tree" \`\`defconfig\`\` file`",
+   and ":ref:`kernel-dev/kernel-dev-common:creating a \`\`defconfig\`\` file`"
+   sections.
 
 Consider an example that configures the "CONFIG_SMP" setting for the
 ``linux-yocto-4.12`` kernel.
 
 .. note::
 
-   The OpenEmbedded build system recognizes this kernel as
-   linux-yocto
-   through Metadata (e.g.
-   PREFERRED_VERSION
-   \_linux-yocto ?= "12.4%"
-   ).
+   The OpenEmbedded build system recognizes this kernel as ``linux-yocto``
+   through Metadata (e.g. :term:`PREFERRED_VERSION`\ ``_linux-yocto ?= "12.4%"``).
 
 Once ``menuconfig`` launches, use the interface to navigate through the
 selections to find the configuration settings in which you are
@@ -1259,7 +1220,8 @@ area where the specific kernel is built. For example, if you were
 building a Linux Yocto kernel based on the ``linux-yocto-4.12`` kernel
 and you were building a QEMU image targeted for ``x86`` architecture,
 the ``.config`` file would be:
-::
+
+.. code-block:: none
 
    poky/build/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+gitAUTOINC+eda4d18...
    ...967-r0/linux-qemux86-standard-build/.config
@@ -1289,11 +1251,8 @@ kernel layer.
 
 .. note::
 
-   Be sure to make a copy of the
-   .config
-   file and do not just rename it. The build system needs an existing
-   .config
-   file from which to work.
+   Be sure to make a copy of the ``.config`` file and do not just rename it.
+   The build system needs an existing ``.config`` file from which to work.
 
 Creating a  ``defconfig`` File
 ------------------------------
@@ -1307,13 +1266,9 @@ which the OpenEmbedded build system can draw to create the final
 
 .. note::
 
-   Out-of-the-box, the Yocto Project never ships a
-   defconfig
-   or
-   .config
-   file. The OpenEmbedded build system creates the final
-   .config
-   file used to configure the kernel.
+   Out-of-the-box, the Yocto Project never ships a ``defconfig`` or ``.config``
+   file. The OpenEmbedded build system creates the final ``.config`` file used
+   to configure the kernel.
 
 To create a ``defconfig``, start with a complete, working Linux kernel
 ``.config`` file. Copy that file to the appropriate
@@ -1335,16 +1290,13 @@ created to hold the configuration changes.
 
 .. note::
 
-   The build system applies the configurations from the
-   defconfig
+   The build system applies the configurations from the ``defconfig``
    file before applying any subsequent configuration fragments. The
    final kernel configuration is a combination of the configurations in
-   the
-   defconfig
-   file and any configuration fragments you provide. You need to realize
-   that if you have any configuration fragments, the build system
-   applies these on top of and after applying the existing defconfig
-   file configurations.
+   the ``defconfig`` file and any configuration fragments you provide. You need
+   to realize that if you have any configuration fragments, the build system
+   applies these on top of and after applying the existing ``defconfig`` file
+   configurations.
 
 For more information on configuring the kernel, see the "`Changing the
 Configuration <#changing-the-configuration>`__" section.
@@ -1368,9 +1320,8 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 
 .. note::
 
-   For more information about where the
-   .config
-   file is located, see the example in the
+   For more information about where the ``.config`` file is located, see the
+   example in the
    ":ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\``"
    section.
 
@@ -1384,10 +1335,9 @@ multi-processor support within the kernel:
 
 .. note::
 
-   All configuration fragment files must use the
-   .cfg
-   extension in order for the OpenEmbedded build system to recognize
-   them as a configuration fragment.
+   All configuration fragment files must use the ``.cfg`` extension in order
+   for the OpenEmbedded build system to recognize them as a configuration
+   fragment.
 
 Another method is to create a configuration fragment using the
 differences between two configuration files: one previously created and
@@ -1429,9 +1379,8 @@ information on how to use the output as a configuration fragment.
 .. note::
 
    You can also use this method to create configuration fragments for a
-   BSP. See the "
-   BSP Descriptions
-   " section for more information.
+   BSP. See the ":ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`"
+   section for more information.
 
 Where do you put your configuration fragment files? You can place these
 files in an area pointed to by
@@ -1480,7 +1429,8 @@ See the ":ref:`kernel-dev/kernel-dev-common:using \`\`menuconfig\`\``" section f
 information on how to create a configuration file.
 
 Following is sample output from the ``do_kernel_configcheck`` task:
-::
+
+.. code-block:: none
 
    Loading cache: 100% |########################################################| Time: 0:00:00
    Loaded 1275 entries from dependency cache.
@@ -1577,10 +1527,8 @@ produces warning messages for the following issues:
 
 .. note::
 
-   The
-   do_kernel_configcheck
-   task can also optionally report if an option is overridden during
-   processing.
+   The :ref:`ref-tasks-kernel_configcheck` task can also optionally report if
+   an option is overridden during processing.
 
 For each output warning, a message points to the file that contains a
 list of the options and a pointer to the configuration fragment that
@@ -1627,7 +1575,7 @@ Expanding Variables
 ===================
 
 Sometimes it is helpful to determine what a variable expands to during a
-build. You can do examine the values of variables by examining the
+build. You can examine the values of variables by examining the
 output of the ``bitbake -e`` command. The output is long and is more
 easily managed in a text file, which allows for easy searches:
 ::
@@ -1767,7 +1715,10 @@ Here are some basic steps you can use to work with your own sources:
       as derived from the :term:`SRCPV`
       variable. The combined results are a string with the following
       form:
-      3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8d2022b9852c60d32f0d770931e3cf343e2
+      ::
+
+         3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8d2022b9852c60d32f0d770931e3cf343e2
+
       While lengthy, the extra verbosity in ``PV`` helps ensure you are
       using the exact sources from which you intend to build.
 
@@ -1778,7 +1729,10 @@ Here are some basic steps you can use to work with your own sources:
       triggers an explicit build failure. You must change it to match a
       list of the machines that your new recipe supports. For example,
       to support the ``qemux86`` and ``qemux86-64`` machines, use the
-      following form: COMPATIBLE_MACHINE = "qemux86|qemux86-64"
+      following form:
+      ::
+
+         COMPATIBLE_MACHINE = "qemux86|qemux86-64"
 
 5. *Customize Your Recipe as Needed:* Provide further customizations to
    your recipe as needed just as you would customize an existing
@@ -1813,7 +1767,8 @@ is running that image.
 Prior to attempting to build the out-of-tree modules, you need to be on
 the target as root and you need to change to the ``/usr/src/kernel``
 directory. Next, ``make`` the scripts:
-::
+
+.. code-block:: none
 
    # cd /usr/src/kernel
    # make scripts
@@ -1835,7 +1790,8 @@ create your own out-of-tree Linux kernel module recipe.
 
 This template recipe is located in the ``poky`` Git repository of the
 Yocto Project :yocto_git:`Source Repository <>` at:
-::
+
+.. code-block:: none
 
    poky/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
 
@@ -1925,17 +1881,15 @@ changes.
 
 .. note::
 
-   In the following examples, unless you provide a commit range,
-   kernel.org
+   In the following examples, unless you provide a commit range, ``kernel.org``
    history is blended with Yocto Project kernel changes. You can form
    ranges by using branch names from the kernel tree as the upper and
    lower commit markers with the Git commands. You can see the branch
    names through the web interface to the Yocto Project source
-   repositories at
-   .
+   repositories at :yocto_git:`/`.
 
 To see a full range of the changes, use the ``git whatchanged`` command
-and specify a commit range for the branch (commit\ ``..``\ commit).
+and specify a commit range for the branch (`commit`\ ``..``\ `commit`).
 
 Here is an example that looks at what has changed in the ``emenlow``
 branch of the ``linux-yocto-3.19`` kernel. The lower commit range is the
@@ -1990,8 +1944,8 @@ Adding Recipe-Space Kernel Features
 ===================================
 
 You can add kernel features in the
-`recipe-space <#recipe-space-metadata>`__ by using the
-:term:`KERNEL_FEATURES`
+:ref:`recipe-space <kernel-dev/kernel-dev-advanced:recipe-space metadata>`
+by using the :term:`KERNEL_FEATURES`
 variable and by specifying the feature's ``.scc`` file path in the
 :term:`SRC_URI` statement. When you
 add features using this method, the OpenEmbedded build system checks to
@@ -2008,9 +1962,9 @@ You add a kernel feature by providing the feature as part of the
 OpenEmbedded build system searches all forms of kernel Metadata on the
 ``SRC_URI`` statement regardless of whether the Metadata is in the
 "kernel-cache", system kernel Metadata, or a recipe-space Metadata (i.e.
-part of the kernel recipe). See the "`Kernel Metadata
-Location <#kernel-metadata-location>`__" section for additional
-information.
+part of the kernel recipe). See the
+":ref:`kernel-dev/kernel-dev-advanced:kernel metadata location`" section for
+additional information.
 
 When you specify the feature's ``.scc`` file on the ``SRC_URI``
 statement, the OpenEmbedded build system adds the directory of that
@@ -2073,6 +2027,5 @@ build.
    .. note::
 
       If other features are contained below "test.scc", then their
-      directories are relative to the directory containing the
-      test.scc
+      directories are relative to the directory containing the ``test.scc``
       file.
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.rst b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
index 5b6ebef5a..681faee52 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
@@ -11,7 +11,7 @@ Yocto Project Kernel Development and Maintenance
 
 Kernels available through the Yocto Project (Yocto Linux kernels), like
 other kernels, are based off the Linux kernel releases from
-http://www.kernel.org. At the beginning of a major Linux kernel
+https://www.kernel.org. At the beginning of a major Linux kernel
 development cycle, the Yocto Project team chooses a Linux kernel based
 on factors such as release timing, the anticipated release timing of
 final upstream ``kernel.org`` versions, and Yocto Project feature
@@ -119,7 +119,7 @@ upstream Linux kernel development and are managed by the Yocto Project
 team's Yocto Linux kernel development strategy. It is the Yocto Project
 team's policy to not back-port minor features to the released Yocto
 Linux kernel. They only consider back-porting significant technological
-jumps DASH and, that is done after a complete gap analysis. The reason
+jumps - and, that is done after a complete gap analysis. The reason
 for this policy is that back-porting any small to medium sized change
 from an evolving Linux kernel can easily create mismatches,
 incompatibilities and very subtle errors.
@@ -129,7 +129,7 @@ cutting edge Yocto Linux kernel that mixes forward ports of existing
 Linux kernel features and significant and critical new functionality.
 Forward porting Linux kernel functionality into the Yocto Linux kernels
 available through the Yocto Project can be thought of as a "micro
-uprev." The many "micro uprevs" produce a Yocto Linux kernel version
+uprev". The many "micro uprevs" produce a Yocto Linux kernel version
 with a mix of important new mainline, non-mainline, BSP developments and
 feature integrations. This Yocto Linux kernel gives insight into new
 features and allows focused amounts of testing to be done on the kernel,
@@ -160,9 +160,8 @@ implemented by the Yocto Project team using the Source Code Manager
       but, Git continues to grow in popularity and supports many
       different work flows, front-ends and management techniques.
 
-   -  You can find documentation on Git at
-      http://git-scm.com/documentation. You can also get an
-      introduction to Git as it applies to the Yocto Project in the
+   -  You can find documentation on Git at https://git-scm.com/doc. You can
+      also get an introduction to Git as it applies to the Yocto Project in the
       ":ref:`overview-manual/overview-manual-development-environment:git`" section in the Yocto Project
       Overview and Concepts Manual. The latter reference provides an
       overview of Git and presents a minimal set of Git commands that
@@ -260,8 +259,8 @@ Yocto Linux kernel needed for any given set of requirements.
    Keep in mind the figure does not take into account all the supported
    Yocto Linux kernels, but rather shows a single generic kernel just
    for conceptual purposes. Also keep in mind that this structure
-   represents the Yocto Project
-   Source Repositories
+   represents the
+   :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories`
    that are either pulled from during the build or established on the
    host development system prior to the build by either cloning a
    particular kernel's Git repository or by downloading and unpacking a
diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index 70bf4a2d4..c9f2102c7 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -50,13 +50,13 @@ How do I install a specific kernel module?
 
 Linux kernel modules are packaged individually. To ensure a
 specific kernel module is included in an image, include it in the
-appropriate machine
-:term:`RRECOMMENDS` variable.
+appropriate machine :term:`RRECOMMENDS` variable.
 These other variables are useful for installing specific modules:
-:term:`MACHINE_ESSENTIAL_EXTRA_RDEPENDS`
-:term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS`
-:term:`MACHINE_EXTRA_RDEPENDS`
-:term:`MACHINE_EXTRA_RRECOMMENDS`
+- :term:`MACHINE_ESSENTIAL_EXTRA_RDEPENDS`
+- :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS`
+- :term:`MACHINE_EXTRA_RDEPENDS`
+- :term:`MACHINE_EXTRA_RRECOMMENDS`
+
 For example, set the following in the ``qemux86.conf`` file to include
 the ``ab123`` kernel modules with images built for the ``qemux86``
 machine:
@@ -64,9 +64,8 @@ machine:
 
    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-ab123"
 
-For more
-information, see the "`Incorporating Out-of-Tree
-Modules <#incorporating-out-of-tree-modules>`__" section.
+For more information, see the
+":ref:`kernel-dev/kernel-dev-common:incorporating out-of-tree modules`" section.
 
 How do I change the Linux kernel command line?
 ----------------------------------------------
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index 447cddba2..5679a0ab8 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -23,7 +23,7 @@ Each Yocto Project release has a set of Yocto Linux kernel recipes,
 whose Git repositories you can view in the Yocto
 :yocto_git:`Source Repositories <>` under the "Yocto Linux Kernel"
 heading. New recipes for the release track the latest Linux kernel
-upstream developments from http://www.kernel.org> and introduce
+upstream developments from https://www.kernel.org and introduce
 newly-supported platforms. Previous recipes in the release are refreshed
 and supported for at least one additional Yocto Project release. As they
 align, these previous releases are updated to include the latest from
@@ -37,8 +37,8 @@ upstream Yocto Linux kernel development and kernel Metadata development.
 
 .. note::
 
-   For more on Yocto Linux kernels, see the "
-   Yocto Project Kernel Development and Maintenance
+   For more on Yocto Linux kernels, see the
+   ":ref:`Yocto Project Kernel Development and Maintenance <kernel-big-picture>`"
    section.
 
 The Yocto Project also provides a powerful set of kernel tools for
@@ -75,7 +75,7 @@ tools with your own kernel sources.
 The remainder of this manual provides instructions for completing
 specific Linux kernel development tasks. These instructions assume you
 are comfortable working with
-`BitBake <http://openembedded.org/wiki/Bitbake>`__ recipes and basic
+`BitBake <https://openembedded.org/wiki/Bitbake>`__ recipes and basic
 open-source development tools. Understanding these concepts will
 facilitate the process of working with the kernel recipes. If you find
 you need some additional background, please be sure to review and
@@ -158,8 +158,7 @@ general information and references for further information.
 
    .. note::
 
-      Try to resist the temptation to directly edit an existing
-      .config
+      Try to resist the temptation to directly edit an existing ``.config``
       file, which is found in the Build Directory among the source code
       used for the build. Doing so, can produce unexpected results when
       the OpenEmbedded build system regenerates the configuration file.
@@ -167,9 +166,9 @@ general information and references for further information.
    Once you are satisfied with the configuration changes made using
    ``menuconfig`` and you have saved them, you can directly compare the
    resulting ``.config`` file against an existing original and gather
-   those changes into a `configuration fragment
-   file <#creating-config-fragments>`__ to be referenced from within the
-   kernel's ``.bbappend`` file.
+   those changes into a
+   :ref:`configuration fragment file <creating-config-fragments>` to be
+   referenced from within the kernel's ``.bbappend`` file.
 
    Additionally, if you are working in a BSP layer and need to modify
    the BSP's kernel's configuration, you can use ``menuconfig``.
diff --git a/documentation/kernel-dev/kernel-dev-maint-appx.rst b/documentation/kernel-dev/kernel-dev-maint-appx.rst
index 17883327d..69f680688 100644
--- a/documentation/kernel-dev/kernel-dev-maint-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-maint-appx.rst
@@ -42,7 +42,11 @@ section.
 
 Once you have cloned the kernel Git repository and the cache of Metadata
 on your local machine, you can discover the branches that are available
-in the repository using the following Git command: $ git branch -a
+in the repository using the following Git command:
+::
+
+   $ git branch -a
+
 Checking out a branch allows you to work with a particular Yocto Linux
 kernel. For example, the following commands check out the
 "standard/beagleboard" branch of the Yocto Linux kernel repository and
@@ -56,10 +60,8 @@ the "yocto-4.12" branch of the ``yocto-kernel-cache`` repository:
 
 .. note::
 
-   Branches in the
-   yocto-kernel-cache
-   repository correspond to Yocto Linux kernel versions (e.g.
-   "yocto-4.12", "yocto-4.10", "yocto-4.9", and so forth).
+   Branches in the ``yocto-kernel-cache`` repository correspond to Yocto Linux
+   kernel versions (e.g. "yocto-4.12", "yocto-4.10", "yocto-4.9", and so forth).
 
 Once you have checked out and switched to appropriate branches, you can
 see a snapshot of all the kernel source files used to used to build that
@@ -105,7 +107,7 @@ patch, or BSP:
       repository organized under the "Yocto Linux Kernel" heading in the
       :yocto_git:`Yocto Project Source Repositories <>`.
 
-   -  Areas pointed to by ``SRC_URI`` statements found in kernel recipes
+   -  Areas pointed to by ``SRC_URI`` statements found in kernel recipes.
 
    For a typical build, the target of the search is a feature
    description in an ``.scc`` file whose name follows this format (e.g.
@@ -194,12 +196,10 @@ the build process before compilation starts:
    .. note::
 
       In the previous example, the "yocto-4.12" branch is checked out in
-      the
-      yocto-kernel-cache
-      repository.
+      the ``yocto-kernel-cache`` repository.
 
 The OpenEmbedded build system makes sure these conditions exist before
-attempting compilation. Other means, however, do exist, such as as
+attempting compilation. Other means, however, do exist, such as
 bootstrapping a BSP.
 
 Before building a kernel, the build process verifies the tree and
-- 
2.26.2

