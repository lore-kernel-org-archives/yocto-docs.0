Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.9599.1617811695979954786
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Apr 2021 09:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.100.75
Received: from fiqs.lan (80-110-100-75.cgn.dynamic.surfer.at [80.110.100.75])
	(Authenticated sender: foss@0leil.net)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPA id C0969FF808;
	Wed,  7 Apr 2021 16:08:13 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: replace anchor links
Date: Wed,  7 Apr 2021 18:07:24 +0200
Message-Id: <20210407160724.21593-1-foss@0leil.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Anchor links are treated by Sphinx as external links and are not checked
during build, meaning it is impossible to know if a link becomes broken or
not.

As a matter of fact, most of the anchor links replaced in this commit
were actually broken.

The README now states that anchor links are forbidden so that there's no
need to go through such a change later on.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/README                          |   3 +
 documentation/dev-manual/common-tasks.rst     | 241 ++++++++----------
 documentation/dev-manual/qemu.rst             |   6 +-
 documentation/dev-manual/start.rst            |  13 +-
 documentation/kernel-dev/advanced.rst         |  42 +--
 documentation/kernel-dev/common.rst           |  44 ++--
 documentation/kernel-dev/intro.rst            |   3 +-
 documentation/overview-manual/concepts.rst    |  93 +++----
 .../development-environment.rst               |  15 +-
 documentation/overview-manual/intro.rst       |  13 +-
 documentation/overview-manual/yp-intro.rst    |  45 ++--
 .../ref-manual/devtool-reference.rst          |   4 +-
 documentation/ref-manual/migration-1.5.rst    |   2 +-
 documentation/ref-manual/migration-2.1.rst    |   5 +-
 documentation/ref-manual/migration-2.2.rst    |   8 +-
 documentation/ref-manual/migration-2.6.rst    |   2 +-
 documentation/ref-manual/release-process.rst  |   5 +-
 .../sdk-manual/appendix-customizing.rst       |  25 +-
 documentation/sdk-manual/appendix-obtain.rst  |  16 +-
 documentation/sdk-manual/extensible.rst       |  11 +-
 documentation/sdk-manual/intro.rst            |   4 +-
 documentation/sdk-manual/using.rst            |  22 +-
 documentation/test-manual/test-process.rst    |   2 +-
 23 files changed, 301 insertions(+), 323 deletions(-)

diff --git a/documentation/README b/documentation/README
index b491e46a1..176c6db35 100644
--- a/documentation/README
+++ b/documentation/README
@@ -259,6 +259,9 @@ websites.
 More information can be found here:
 https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
 
+Anchor (<#link>) links are forbidden as they are not checked by Sphinx during
+the build and may be broken without knowing about it.
+
 References
 ==========
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 3f35dc636..176025f9e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -155,8 +155,8 @@ Follow these general steps to create your layer without using tools:
 5. *Optionally Test for Compatibility:* If you want permission to use
    the Yocto Project Compatibility logo with your layer or application
    that uses your layer, perform the steps to apply for compatibility.
-   See the "`Making Sure Your Layer is Compatible With Yocto
-   Project <#making-sure-your-layer-is-compatible-with-yocto-project>`__"
+   See the
+   ":ref:`dev-manual/common-tasks:making sure your layer is compatible with yocto project`"
    section for more information.
 
 Following Best Practices When Creating Layers
@@ -282,9 +282,8 @@ following list:
 -  *Perform Steps to Apply for Yocto Project Compatibility:* If you want
    permission to use the Yocto Project Compatibility logo with your
    layer or application that uses your layer, perform the steps to apply
-   for compatibility. See the "`Making Sure Your Layer is Compatible
-   With Yocto
-   Project <#making-sure-your-layer-is-compatible-with-yocto-project>`__"
+   for compatibility. See the
+   ":ref:`dev-manual/common-tasks:making sure your layer is compatible with yocto project`"
    section for more information.
 
 -  *Follow the Layer Naming Convention:* Store custom layers in a Git
@@ -1247,8 +1246,7 @@ the recipe.
    your layer such that it can be found.
 
    You can find more information on how layers are structured in the
-   "`Understanding and Creating
-   Layers <#understanding-and-creating-layers>`__" section.
+   ":ref:`dev-manual/common-tasks:understanding and creating layers`" section.
 
 -  *Naming Your Recipe:* When you name your recipe, you need to follow
    this naming convention:
@@ -1364,7 +1362,7 @@ extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
 forth), are automatically extracted during the
 :ref:`ref-tasks-unpack` task. For
 another example that specifies these types of files, see the
-"`Autotooled Package <#new-recipe-autotooled-package>`__" section.
+":ref:`dev-manual/common-tasks:autotooled package`" section.
 
 Another way of specifying source is from an SCM. For Git repositories,
 you must specify :term:`SRCREV` and
@@ -1445,15 +1443,14 @@ and searches specific directories in a certain order:
 ``${``\ :term:`BPN`\ ``}``, and
 ``files``. The directories are assumed to be subdirectories of the
 directory in which the recipe or append file resides. For another
-example that specifies these types of files, see the "`Single .c File
-Package (Hello
-World!) <#new-recipe-single-c-file-package-hello-world>`__" section.
+example that specifies these types of files, see the
+":ref:`dev-manual/common-tasks:single .c file package (hello world!)`" section.
 
 The previous example also specifies a patch file. Patch files are files
 whose names usually end in ``.patch`` or ``.diff`` but can end with
 compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
 The build system automatically applies patches as described in the
-"`Patching Code <#new-recipe-patching-code>`__" section.
+":ref:`dev-manual/common-tasks:patching code`" section.
 
 Unpacking Code
 --------------
@@ -1543,7 +1540,7 @@ variables:
    appropriate files in the ``LIC_FILES_CHKSUM`` variable with incorrect
    md5 strings, attempt to build the software, and then note the
    resulting error messages that will report the correct md5 strings.
-   See the "`Fetching Code <#new-recipe-fetching-code>`__" section for
+   See the ":ref:`dev-manual/common-tasks:fetching code`" section for
    additional information.
 
    Here is an example that assumes the software has a ``COPYING`` file:
@@ -1787,8 +1784,8 @@ Here are some common issues that cause failures.
 
       PARALLEL_MAKE = ""
 
-   For information on parallel Makefile issues, see the "`Debugging
-   Parallel Make Races <#debugging-parallel-make-races>`__" section.
+   For information on parallel Makefile issues, see the
+   ":ref:`dev-manual/common-tasks:debugging parallel make races`" section.
 
 -  *Improper host path usage:* This failure applies to recipes building
    for the target or ``nativesdk`` only. The failure occurs when the
@@ -1854,8 +1851,7 @@ the software being built:
    ``PREFIX=${D}``, ``INSTALLROOT=${D}``, and so forth).
 
    For an example recipe using ``make install``, see the
-   "`Makefile-Based Package <#new-recipe-makefile-based-package>`__"
-   section.
+   ":ref:`dev-manual/common-tasks:makefile-based package`" section.
 
 -  *Manual:* You need to define a ``do_install`` function in your
    recipe. The function must first use ``install -d`` to create the
@@ -1990,14 +1986,13 @@ take. The following list describes the process:
    ``do_install(_append)``, and so forth as needed.
 
 -  *Splitting an Application into Multiple Packages*: If you need to
-   split an application into several packages, see the "`Splitting an
-   Application into Multiple
-   Packages <#splitting-an-application-into-multiple-packages>`__"
+   split an application into several packages, see the
+   ":ref:`dev-manual/common-tasks:splitting an application into multiple packages`"
    section for an example.
 
 -  *Installing a Post-Installation Script*: For an example showing how
-   to install a post-installation script, see the "`Post-Installation
-   Scripts <#new-recipe-post-installation-scripts>`__" section.
+   to install a post-installation script, see the
+   ":ref:`dev-manual/common-tasks:post-installation scripts`" section.
 
 -  *Marking Package Architecture*: Depending on what your recipe is
    building and how it is configured, it might be important to mark the
@@ -2172,9 +2167,8 @@ Properly Versioning Pre-Release Recipes
 Sometimes the name of a recipe can lead to versioning problems when the
 recipe is upgraded to a final release. For example, consider the
 ``irssi_0.8.16-rc1.bb`` recipe file in the list of example recipes in
-the "`Storing and Naming the
-Recipe <#new-recipe-storing-and-naming-the-recipe>`__" section. This
-recipe is at a release candidate stage (i.e. "rc1"). When the recipe is
+the ":ref:`dev-manual/common-tasks:storing and naming the recipe`" section.
+This recipe is at a release candidate stage (i.e. "rc1"). When the recipe is
 released, the recipe filename becomes ``irssi_0.8.16.bb``. The version
 change from ``0.8.16-rc1`` to ``0.8.16`` is seen as a decrease by the
 build system and package managers, so the resulting packages will not
@@ -2258,8 +2252,7 @@ software you built runs correctly. To accomplish runtime testing, add
 the build's output packages to your image and test them on the target.
 
 For information on how to customize your image by adding specific
-packages, see the "`Customizing
-Images <#usingpoky-extend-customimage>`__" section.
+packages, see ":ref:`dev-manual/common-tasks:customizing images`" section.
 
 Examples
 --------
@@ -2309,8 +2302,8 @@ directory BitBake uses for the build.
 
 By default, the ``helloworld``, ``helloworld-dbg``, and
 ``helloworld-dev`` packages are built. For information on how to
-customize the packaging process, see the "`Splitting an Application into
-Multiple Packages <#splitting-an-application-into-multiple-packages>`__"
+customize the packaging process, see the
+":ref:`dev-manual/common-tasks:splitting an application into multiple packages`"
 section.
 
 Autotooled Package
@@ -3423,9 +3416,8 @@ Follow these general steps:
 1. *Find the Source Code:* Temporary source code used by the
    OpenEmbedded build system is kept in the
    :term:`Build Directory`. See the
-   "`Finding Temporary Source
-   Code <#finding-the-temporary-source-code>`__" section to learn how to
-   locate the directory that has the temporary source code for a
+   ":ref:`dev-manual/common-tasks:finding temporary source code`" section to
+   learn how to locate the directory that has the temporary source code for a
    particular package.
 
 2. *Change Your Working Directory:* You need to be in the directory that
@@ -3994,24 +3986,21 @@ perform to create distributions with smaller root filesystems, achieve
 faster boot times, maintain your critical functionality, and avoid
 initial RAM disks:
 
--  `Determine your goals and guiding
-   principles. <#goals-and-guiding-principles>`__
+-  :ref:`Determine your goals and guiding principles
+   <dev-manual/common-tasks:goals and guiding principles>`
 
--  `Understand what contributes to your image
-   size. <#understand-what-gives-your-image-size>`__
+-  :ref:`dev-manual/common-tasks:understand what contributes to your image size`
 
--  `Reduce the size of the root
-   filesystem. <#trim-the-root-filesystem>`__
+-  :ref:`Reduce the size of the root filesystem
+   <dev-manual/common-tasks:trim the root filesystem>`
 
--  `Reduce the size of the kernel. <#trim-the-kernel>`__
+-  :ref:`Reduce the size of the kernel <dev-manual/common-tasks:trim the kernel>`
 
--  `Eliminate packaging
-   requirements. <#remove-package-management-requirements>`__
+-  :ref:`dev-manual/common-tasks:remove package management requirements`
 
--  `Look for other ways to minimize
-   size. <#look-for-other-ways-to-minimize-size>`__
+-  :ref:`dev-manual/common-tasks:look for other ways to minimize size`
 
--  `Iterate on the process. <#iterate-on-the-process>`__
+-  :ref:`dev-manual/common-tasks:iterate on the process`
 
 Goals and Guiding Principles
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -4031,8 +4020,8 @@ very small distributions:
 -  Leverage the device-specific options.
 
 -  Work in a separate layer so that you keep changes isolated. For
-   information on how to create layers, see the "`Understanding and
-   Creating Layers <#understanding-and-creating-layers>`__" section.
+   information on how to create layers, see the
+   ":ref:`dev-manual/common-tasks:understanding and creating layers`" section.
 
 Understand What Contributes to Your Image Size
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -4576,13 +4565,13 @@ directory:
       If you do have recipes that use ``AUTOREV``, you can take steps to
       still use the recipes in an offline build. Do the following:
 
-      1. Use a configuration generated by enabling `build
-         history <#maintaining-build-output-quality>`__.
+      1. Use a configuration generated by enabling :ref:`build
+         history <dev-manual/common-tasks:maintaining build output quality>`.
 
       2. Use the ``buildhistory-collect-srcrevs`` command to collect the
          stored ``SRCREV`` values from the build's history. For more
-         information on collecting these values, see the "`Build History
-         Package Information <#build-history-package-information>`__"
+         information on collecting these values, see the
+         ":ref:`dev-manual/common-tasks:build history package information`"
          section.
 
       3. Once you have the correct source revisions, you can modify
@@ -4706,16 +4695,16 @@ Libraries are an integral part of your system. This section describes
 some common practices you might find helpful when working with libraries
 to build your system:
 
--  `How to include static library
-   files <#including-static-library-files>`__
+-  :ref:`How to include static library files
+   <dev-manual/common-tasks:including static library files>`
 
--  `How to use the Multilib feature to combine multiple versions of
-   library files into a single
-   image <#combining-multiple-versions-library-files-into-one-image>`__
+-  :ref:`How to use the Multilib feature to combine multiple versions of
+   library files into a single image
+   <dev-manual/common-tasks:combining multiple versions of library files into one image>`
 
--  `How to install multiple versions of the same library in parallel on
-   the same
-   system <#installing-multiple-versions-of-the-same-library>`__
+-  :ref:`How to install multiple versions of the same library in parallel on
+   the same system
+   <dev-manual/common-tasks:installing multiple versions of the same library>`
 
 Including Static Library Files
 ------------------------------
@@ -5053,7 +5042,7 @@ because the library is produced for the target architecture, but its
 code needs to be executed on the build host. This problem is solved with
 the OpenEmbedded build system by running the code through QEMU, which
 allows precisely that. Unfortunately, QEMU does not always work
-perfectly as mentioned in the "`Known Issues <#known-issues>`__"
+perfectly as mentioned in the ":ref:`dev-manual/common-tasks:known issues`"
 section.
 
 Enabling the Generation of Introspection Data
@@ -5225,11 +5214,11 @@ OpenEmbedded build artifacts. Image generation is driven by partitioning
 commands contained in an Openembedded kickstart file (``.wks``)
 specified either directly on the command line or as one of a selection
 of canned kickstart files as shown with the ``wic list images`` command
-in the "`Using an Existing Kickstart
-File <#using-a-provided-kickstart-file>`__" section. When you apply the
-command to a given set of build artifacts, the result is an image or set
-of images that can be directly written onto media and used on a
-particular system.
+in the
+":ref:`dev-manual/common-tasks:generate an image using an existing kickstart file`"
+section. When you apply the command to a given set of build artifacts, the
+result is an image or set of images that can be directly written onto media and
+used on a particular system.
 
 .. note::
 
@@ -5240,8 +5229,8 @@ particular system.
 The ``wic`` command and the infrastructure it is based on is by
 definition incomplete. The purpose of the command is to allow the
 generation of customized images, and as such, was designed to be
-completely extensible through a plugin interface. See the "`Using the
-Wic PlugIn Interface <#wic-using-the-wic-plugin-interface>`__" section
+completely extensible through a plugin interface. See the
+":ref:`dev-manual/common-tasks:using the wic plugin interface`" section
 for information on these plugins.
 
 This section provides some background information on Wic, describes what
@@ -5678,7 +5667,7 @@ Wic Examples
 
 This section provides several examples that show how to use the Wic
 utility. All the examples assume the list of requirements in the
-"`Requirements <#wic-requirements>`__" section have been met. The
+":ref:`dev-manual/common-tasks:requirements`" section have been met. The
 examples assume the previously generated image is
 ``core-image-minimal``.
 
@@ -6093,8 +6082,7 @@ more secure:
 
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
-   "`Considerations Specific to the OpenEmbedded Build
-   System <#considerations-specific-to-the-openembedded-build-system>`__"
+   ":ref:`dev-manual/common-tasks:considerations specific to the openembedded build system`"
    section.
 
 -  Ensure you have no network services listening that are not needed.
@@ -6275,17 +6263,17 @@ layer. The following steps provide some more detail:
       distro-specific configuration files that are included by an
       existing recipe, you should add an append file (``.bbappend``) for
       those. For general information and recommendations on how to add
-      recipes to your layer, see the "`Creating Your Own
-      Layer <#creating-your-own-layer>`__" and "`Following Best
-      Practices When Creating
-      Layers <#best-practices-to-follow-when-creating-layers>`__"
+      recipes to your layer, see the
+      ":ref:`dev-manual/common-tasks:creating your own layer`" and
+      ":ref:`dev-manual/common-tasks:following best practices when creating layers`"
       sections.
 
    -  Add any image recipes that are specific to your distribution.
 
    -  Add a ``psplash`` append file for a branded splash screen. For
-      information on append files, see the "`Using .bbappend Files in
-      Your Layer <#using-bbappend-files>`__" section.
+      information on append files, see the
+      ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
+      section.
 
    -  Add any other append files to make custom changes that are
       specific to individual recipes.
@@ -6383,29 +6371,22 @@ Working with Packages
 
 This section describes a few tasks that involve packages:
 
--  `Excluding packages from an
-   image <#excluding-packages-from-an-image>`__
+-  :ref:`dev-manual/common-tasks:excluding packages from an image`
 
--  `Incrementing a binary package
-   version <#incrementing-a-binary-package-version>`__
+-  :ref:`dev-manual/common-tasks:incrementing a package version`
 
--  `Handling optional module
-   packaging <#handling-optional-module-packaging>`__
+-  :ref:`dev-manual/common-tasks:handling optional module packaging`
 
--  `Using runtime package
-   management <#using-runtime-package-management>`__
+-  :ref:`dev-manual/common-tasks:using runtime package management`
 
--  `Generating and using signed
-   packages <#generating-and-using-signed-packages>`__
+-  :ref:`dev-manual/common-tasks:generating and using signed packages`
 
--  `Setting up and running package test
-   (ptest) <#testing-packages-with-ptest>`__
+-  :ref:`Setting up and running package test
+   (ptest) <dev-manual/common-tasks:testing packages with ptest>`
 
--  `Creating node package manager (NPM)
-   packages <#creating-node-package-manager-npm-packages>`__
+-  :ref:`dev-manual/common-tasks:creating node package manager (npm) packages`
 
--  `Adding custom metadata to
-   packages <#adding-custom-metadata-to-packages>`__
+-  :ref:`dev-manual/common-tasks:adding custom metadata to packages`
 
 Excluding Packages from an Image
 --------------------------------
@@ -6494,9 +6475,8 @@ much preferred over a manual system. In either system, the main
 requirement is that binary package version numbering increases in a
 linear fashion and that a number of version components exist that
 support that linear progression. For information on how to ensure
-package revisioning remains linear, see the "`Automatically Incrementing
-a Binary Package Revision
-Number <#automatically-incrementing-a-binary-package-revision-number>`__"
+package revisioning remains linear, see the
+":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
 section.
 
 The following three sections provide related information on the PR
@@ -6587,8 +6567,8 @@ each building system's ``local.conf`` file:
    BUILDHISTORY_COMMIT = "1"
 
 For information on build
-history, see the "`Maintaining Build Output
-Quality <#maintaining-build-output-quality>`__" section.
+history, see the
+":ref:`dev-manual/common-tasks:maintaining build output quality`" section.
 
 .. note::
 
@@ -8591,8 +8571,8 @@ options exist:
    it the same IP address for each reboot.
 
    If you choose "SystemdbootTarget", there are additional requirements
-   and considerations. See the "`Selecting
-   SystemdbootTarget <#selecting-systemdboottarget>`__" section, which
+   and considerations. See the
+   ":ref:`dev-manual/common-tasks:selecting systemdboottarget`" section, which
    follows, for more information.
 
 -  *"BeagleBoneTarget":* Choose "BeagleBoneTarget" if you are deploying
@@ -8624,7 +8604,7 @@ Selecting SystemdbootTarget
 
 If you did not set ``TEST_TARGET`` to "SystemdbootTarget", then you do
 not need any information in this section. You can skip down to the
-"`Running Tests <#qemu-image-running-tests>`__" section.
+":ref:`dev-manual/common-tasks:running tests`" section.
 
 If you did set ``TEST_TARGET`` to "SystemdbootTarget", you also need to
 perform a one-time setup of your master image by doing the following:
@@ -9090,13 +9070,11 @@ situations.
 The following list shows the debugging topics in the remainder of this
 section:
 
--  "`Viewing Logs from Failed
-   Tasks <#dev-debugging-viewing-logs-from-failed-tasks>`__" describes
+-  ":ref:`dev-manual/common-tasks:viewing logs from failed tasks`" describes
    how to find and view logs from tasks that failed during the build
    process.
 
--  "`Viewing Variable
-   Values <#dev-debugging-viewing-variable-values>`__" describes how to
+-  ":ref:`dev-manual/common-tasks:viewing variable values`" describes how to
    use the BitBake ``-e`` option to examine variable values after a
    recipe has been parsed.
 
@@ -9105,51 +9083,47 @@ section:
    :term:`PKGDATA_DIR` and
    display package-related information for built packages.
 
--  "`Viewing Dependencies Between Recipes and
-   Tasks <#dev-viewing-dependencies-between-recipes-and-tasks>`__"
+-  ":ref:`dev-manual/common-tasks:viewing dependencies between recipes and tasks`"
    describes how to use the BitBake ``-g`` option to display recipe
    dependency information used during the build.
 
--  "`Viewing Task Variable
-   Dependencies <#dev-viewing-task-variable-dependencies>`__" describes
+-  ":ref:`dev-manual/common-tasks:viewing task variable dependencies`" describes
    how to use the ``bitbake-dumpsig`` command in conjunction with key
    subdirectories in the
    :term:`Build Directory` to determine
    variable dependencies.
 
--  "`Running Specific Tasks <#dev-debugging-taskrunning>`__" describes
+-  ":ref:`dev-manual/common-tasks:running specific tasks`" describes
    how to use several BitBake options (e.g. ``-c``, ``-C``, and ``-f``)
    to run specific tasks in the build chain. It can be useful to run
    tasks "out-of-order" when trying isolate build issues.
 
--  "`General BitBake Problems <#dev-debugging-bitbake>`__" describes how
+-  ":ref:`dev-manual/common-tasks:general bitbake problems`" describes how
    to use BitBake's ``-D`` debug output option to reveal more about what
    BitBake is doing during the build.
 
--  "`Building with No Dependencies <#dev-debugging-buildfile>`__"
+-  ":ref:`dev-manual/common-tasks:building with no dependencies`"
    describes how to use the BitBake ``-b`` option to build a recipe
    while ignoring dependencies.
 
--  "`Recipe Logging Mechanisms <#recipe-logging-mechanisms>`__"
+-  ":ref:`dev-manual/common-tasks:recipe logging mechanisms`"
    describes how to use the many recipe logging functions to produce
    debugging output and report errors and warnings.
 
--  "`Debugging Parallel Make Races <#debugging-parallel-make-races>`__"
+-  ":ref:`dev-manual/common-tasks:debugging parallel make races`"
    describes how to debug situations where the build consists of several
    parts that are run simultaneously and when the output or result of
    one part is not ready for use with a different part of the build that
    depends on that output.
 
--  "`Debugging With the GNU Project Debugger (GDB)
-   Remotely <#platdev-gdb-remotedebug>`__" describes how to use GDB to
-   allow you to examine running programs, which can help you fix
-   problems.
+-  ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) remotely`"
+   describes how to use GDB to allow you to examine running programs, which can
+   help you fix problems.
 
--  "`Debugging with the GNU Project Debugger (GDB) on the
-   Target <#debugging-with-the-gnu-project-debugger-gdb-on-the-target>`__"
+-  ":ref:`dev-manual/common-tasks:debugging with the gnu project debugger (gdb) on the target`"
    describes how to use GDB directly on target hardware for debugging.
 
--  "`Other Debugging Tips <#dev-other-debugging-others>`__" describes
+-  ":ref:`dev-manual/common-tasks:other debugging tips`" describes
    miscellaneous debugging tips that can be useful.
 
 Viewing Logs from Failed Tasks
@@ -9457,8 +9431,8 @@ state (sstate) task can be a useful debugging aid. This information is
 available in signature information (``siginfo``) files in
 :term:`SSTATE_DIR`. For
 information on how to view and interpret information in ``siginfo``
-files, see the "`Viewing Task Variable
-Dependencies <#dev-viewing-task-variable-dependencies>`__" section.
+files, see the
+":ref:`dev-manual/common-tasks:viewing task variable dependencies`" section.
 
 For conceptual information on shared state, see the
 ":ref:`overview-manual/concepts:shared state`"
@@ -9877,9 +9851,8 @@ Once the local build for "neard" completes, start a ``devshell`` build:
 
    $ bitbake neard -c devshell
 
-For information on how to use a
-``devshell``, see the "`Using a Development
-Shell <#platdev-appdev-devshell>`__" section.
+For information on how to use a ``devshell``, see the
+":ref:`dev-manual/common-tasks:using a development shell`" section.
 
 In the ``devshell``, do the following:
 ::
@@ -9921,7 +9894,7 @@ to patch the ``Makefile.am`` file, which is generated from
    File Makefile.am added to patch patches/parallelmake.patch
 
 For more information on using Quilt, see the
-"`Using Quilt in Your Workflow <#using-a-quilt-workflow>`__" section.
+":ref:`dev-manual/common-tasks:using quilt in your workflow`" section.
 
 At this point you need to make the edits to ``Makefile.am`` to add the
 missing dependency. For our example, you have to add the following line
@@ -9987,9 +9960,9 @@ The build should work without issue.
 
 As with all solved problems, if they originated upstream, you need to
 submit the fix for the recipe in OE-Core and upstream so that the
-problem is taken care of at its source. See the "`Submitting a Change to
-the Yocto Project <#how-to-submit-a-change>`__" section for more
-information.
+problem is taken care of at its source. See the
+":ref:`dev-manual/common-tasks:submitting a change to the yocto project`"
+section for more information.
 
 Debugging With the GNU Project Debugger (GDB) Remotely
 ------------------------------------------------------
@@ -10363,8 +10336,9 @@ Here are some other tips that you might find useful:
    :yocto_bugs:`Bugzilla <>`. For information on
    how to submit a bug against the Yocto Project, see the Yocto Project
    Bugzilla :yocto_wiki:`wiki page </Bugzilla_Configuration_and_Bug_Tracking>`
-   and the "`Submitting a Defect Against the Yocto
-   Project <#submitting-a-defect-against-the-yocto-project>`__" section.
+   and the
+   ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
+   section.
 
    .. note::
 
@@ -10619,8 +10593,9 @@ Using Email to Submit a Patch
 
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
-see the `list <#figuring-out-the-mailing-list-to-use>`__ at the
-beginning of this section. For a description of all the available
+see the
+:ref:`list <dev-manual/common-tasks:submitting a change to the yocto project>`
+at the beginning of this section. For a description of all the available
 mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
 Yocto Project Reference Manual.
 
@@ -11034,7 +11009,7 @@ file. For example, to enable the
 ``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
 could add either the string "commercial_gst-plugins-ugly" or the more
 general string "commercial" to ``LICENSE_FLAGS_WHITELIST``. See the
-"`License Flag Matching <#license-flag-matching>`__" section for a full
+":ref:`dev-manual/common-tasks:license flag matching`" section for a full
 explanation of how ``LICENSE_FLAGS`` matching works. Here is the
 example:
 ::
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index c6bb9e977..92799d6d2 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -306,8 +306,8 @@ present, the toolchain is also automatically used.
       tarball by using the ``runqemu-extract-sdk`` command. After
       running the command, you must then point the ``runqemu`` script to
       the extracted directory instead of a root filesystem image file.
-      See the "`Running Under a Network File System (NFS)
-      Server <#qemu-running-under-a-network-file-system-nfs-server>`__"
+      See the
+      ":ref:`dev-manual/qemu:running under a network file system (nfs) server`"
       section for more information.
 
 QEMU Command-Line Syntax
@@ -452,7 +452,7 @@ command line:
    or "qemux86-64" QEMU architectures. For KVM with VHOST to work, the
    following conditions must be met:
 
-   -  `kvm <#kvm-cond>`__ option conditions must be met.
+   -  ``kvm`` option conditions defined above must be met.
 
    -  Your build host has to have virtio net device, which are
       ``/dev/vhost-net``.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index efe369c75..39036183b 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -230,8 +230,8 @@ particular working environment and set of practices.
     -  Separate the project's Metadata and code by using separate Git
        repositories. See the ":ref:`overview-manual/development-environment:yocto project source repositories`"
        section in the Yocto Project Overview and Concepts Manual for
-       information on these repositories. See the "`Locating Yocto
-       Project Source Files <#locating-yocto-project-source-files>`__"
+       information on these repositories. See the
+       ":ref:`dev-manual/start:locating yocto project source files`"
        section for information on how to set up local Git repositories
        for related upstream Yocto Project Git repositories.
 
@@ -655,8 +655,7 @@ The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
 from which you can locate and download tarballs of any Yocto Project
 release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
-described in the "`Accessing Index of
-Releases <#accessing-index-of-releases>`__" section.
+described in the ":ref:`dev-manual/start:accessing index of releases`" section.
 
 .. note::
 
@@ -759,9 +758,9 @@ Follow these steps to create a local version of the upstream
    "master" branch, which results in a snapshot of the latest
    development changes for "master". For information on how to check out
    a specific development branch or on how to check out a local branch
-   based on a tag name, see the "`Checking Out By Branch in
-   Poky <#checking-out-by-branch-in-poky>`__" and `Checking Out By Tag
-   in Poky <#checkout-out-by-tag-in-poky>`__" sections, respectively.
+   based on a tag name, see the
+   ":ref:`dev-manual/start:checking out by branch in poky`" and
+   ":ref:`dev-manual/start:checking out by tag in poky`" sections, respectively.
 
    Once the local repository is created, you can change to that
    directory and check its status. Here, the single "master" branch
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index dd0b76bc3..fb6dfca85 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -56,8 +56,8 @@ using the same BSP description. Multiple Corei7-based BSPs could share
 the same "intel-corei7-64" value for ``KMACHINE``. It is important to
 realize that ``KMACHINE`` is just for kernel mapping, while ``MACHINE``
 is the machine type within a BSP Layer. Even with this distinction,
-however, these two variables can hold the same value. See the `BSP
-Descriptions <#bsp-descriptions>`__ section for more information.
+however, these two variables can hold the same value. See the
+":ref:`kernel-dev/advanced:bsp descriptions`" section for more information.
 
 Every linux-yocto style recipe must also indicate the Linux kernel
 source repository branch used to build the Linux kernel. The
@@ -87,7 +87,7 @@ Together with ``KMACHINE``, ``LINUX_KERNEL_TYPE`` defines the search
 arguments used by the kernel tools to find the appropriate description
 within the kernel Metadata with which to build out the sources and
 configuration. The linux-yocto recipes define "standard", "tiny", and
-"preempt-rt" kernel types. See the "`Kernel Types <#kernel-types>`__"
+"preempt-rt" kernel types. See the ":ref:`kernel-dev/advanced:kernel types`"
 section for more information on kernel types.
 
 During the build, the kern-tools search for the BSP description file
@@ -123,8 +123,8 @@ the entries in ``KERNEL_FEATURES`` are dependent on their location
 within the kernel Metadata itself. The examples here are taken from the
 ``yocto-kernel-cache`` repository. Each branch of this repository
 contains "features" and "cfg" subdirectories at the top-level. For more
-information, see the "`Kernel Metadata
-Syntax <#kernel-metadata-syntax>`__" section.
+information, see the ":ref:`kernel-dev/advanced:kernel metadata syntax`"
+section.
 
 Kernel Metadata Syntax
 ======================
@@ -148,7 +148,7 @@ Features aggregate sources in the form of patches and configuration
 fragments into a modular reusable unit. You can use features to
 implement conceptually separate kernel Metadata descriptions such as
 pure configuration fragments, simple patches, complex features, and
-kernel types. `Kernel types <#kernel-types>`__ define general kernel
+kernel types. :ref:`kernel-dev/advanced:kernel types` define general kernel
 features and policy to be reused in the BSPs.
 
 BSPs define hardware-specific features and aggregate them with kernel
@@ -167,10 +167,9 @@ following Metadata file hierarchy is recommended:
       ktypes/
       patches/
 
-The ``bsp`` directory contains the `BSP
-descriptions <#bsp-descriptions>`__. The remaining directories all
-contain "features". Separating ``bsp`` from the rest of the structure
-aids conceptualizing intended usage.
+The ``bsp`` directory contains the :ref:`kernel-dev/advanced:bsp descriptions`.
+The remaining directories all contain "features". Separating ``bsp`` from the
+rest of the structure aids conceptualizing intended usage.
 
 Use these guidelines to help place your ``scc`` description files within
 the structure:
@@ -198,11 +197,12 @@ contain "features" as far as the kernel tools are concerned.
 Paths used in kernel Metadata files are relative to base, which is
 either
 :term:`FILESEXTRAPATHS` if
-you are creating Metadata in `recipe-space <#recipe-space-metadata>`__,
+you are creating Metadata in
+:ref:`recipe-space <kernel-dev/advanced:recipe-space metadata>`,
 or the top level of
 :yocto_git:`yocto-kernel-cache </yocto-kernel-cache/tree/>`
-if you are creating `Metadata outside of the
-recipe-space <#metadata-outside-the-recipe-space>`__.
+if you are creating
+:ref:`kernel-dev/advanced:metadata outside the recipe-space`.
 
 .. [1]
    ``scc`` stands for Series Configuration Control, but the naming has
@@ -353,9 +353,9 @@ as how an additional feature description file is included with the
 Typically, features are less granular than configuration fragments and
 are more likely than configuration fragments and patches to be the types
 of things you want to specify in the ``KERNEL_FEATURES`` variable of the
-Linux kernel recipe. See the "`Using Kernel Metadata in a
-Recipe <#using-kernel-metadata-in-a-recipe>`__" section earlier in the
-manual.
+Linux kernel recipe. See the
+":ref:`kernel-dev/advanced:using kernel metadata in a recipe`" section earlier
+in the manual.
 
 Kernel Types
 ------------
@@ -364,7 +364,7 @@ A kernel type defines a high-level kernel policy by aggregating
 non-hardware configuration fragments with patches you want to use when
 building a Linux kernel of a specific type (e.g. a real-time kernel).
 Syntactically, kernel types are no different than features as described
-in the "`Features <#features>`__" section. The
+in the ":ref:`kernel-dev/advanced:features`" section. The
 :term:`LINUX_KERNEL_TYPE`
 variable in the kernel recipe selects the kernel type. For example, in
 the ``linux-yocto_4.12.bb`` kernel recipe found in
@@ -540,7 +540,7 @@ example, this is done using the following:
 
 This file aggregates all the configuration
 fragments, patches, and features that make up your standard kernel
-policy. See the "`Kernel Types <#kernel-types>`__" section for more
+policy. See the ":ref:`kernel-dev/advanced:kernel types`" section for more
 information.
 
 To aggregate common configurations and features specific to the kernel
@@ -825,11 +825,11 @@ Given this scenario, you do not need to create any branches in the
 source repository. Rather, you just take the static patches you need and
 encapsulate them within a feature description. Once you have the feature
 description, you simply include that into the BSP description as
-described in the "`BSP Descriptions <#bsp-descriptions>`__" section.
+described in the ":ref:`kernel-dev/advanced:bsp descriptions`" section.
 
 You can find information on how to create patches and BSP descriptions
-in the "`Patches <#patches>`__" and "`BSP
-Descriptions <#bsp-descriptions>`__" sections.
+in the ":ref:`kernel-dev/advanced:patches`" and
+":ref:`kernel-dev/advanced:bsp descriptions`" sections.
 
 Machine Branches
 ----------------
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 3878f831b..56217b9d3 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -365,8 +365,7 @@ section:
 
 At this point, you are ready to start making modifications to the kernel
 using traditional kernel development steps. For a continued example, see
-the "`Using Traditional Kernel Development to Patch the
-Kernel <#using-traditional-kernel-development-to-patch-the-kernel>`__"
+the ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
 section.
 
 Creating and Preparing a Layer
@@ -463,8 +462,8 @@ Modifying an existing recipe can consist of the following:
 - :ref:`kernel-dev/common:changing the configuration`
 
 Before modifying an existing recipe, be sure that you have created a
-minimal, custom layer from which you can work. See the "`Creating and
-Preparing a Layer <#creating-and-preparing-a-layer>`__" section for
+minimal, custom layer from which you can work. See the
+":ref:`kernel-dev/common:creating and preparing a layer`" section for
 information.
 
 Creating the Append File
@@ -710,7 +709,7 @@ Linux kernel, BitBake detects the change in the recipe and fetches and
 applies the new configuration before building the kernel.
 
 For a detailed example showing how to configure the kernel, see the
-"`Configuring the Kernel <#configuring-the-kernel>`__" section.
+":ref:`kernel-dev/common:configuring the kernel`" section.
 
 Using an "In-Tree"  ``defconfig`` File
 --------------------------------------
@@ -954,15 +953,14 @@ emulator console output at boot time through ``printk`` statements in
 the kernel's ``calibrate.c`` source code file. Applying the patch and
 booting the modified image causes the added messages to appear on the
 emulator's console. The example is a continuation of the setup procedure
-found in the "`Getting Ready for Traditional Kernel
-Development <#getting-ready-for-traditional-kernel-development>`__"
+found in the
+":ref:`kernel-dev/common:getting ready for traditional kernel development`"
 Section.
 
 1. *Edit the Source Files* Prior to this step, you should have used Git
    to create a local copy of the repository for your kernel. Assuming
-   you created the repository as directed in the "`Getting Ready for
-   Traditional Kernel
-   Development <#getting-ready-for-traditional-kernel-development>`__"
+   you created the repository as directed in the
+   ":ref:`kernel-dev/common:getting ready for traditional kernel development`"
    section, use the following commands to edit the ``calibrate.c`` file:
 
    1. *Change the working directory*: You need to locate the source
@@ -1104,9 +1102,9 @@ Section.
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find the patch file.
 
-   For more information on append files and patches, see the "`Creating
-   the Append File <#creating-the-append-file>`__" and "`Applying
-   Patches <#applying-patches>`__" sections. You can also see the
+   For more information on append files and patches, see the
+   ":ref:`kernel-dev/common:creating the append file`" and
+   ":ref:`kernel-dev/common:applying patches`" sections. You can also see the
    ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
    section in the Yocto Project Development Tasks Manual.
 
@@ -1140,8 +1138,8 @@ configuration fragments, and how to interactively modify your
 ``.config`` file to create the leanest kernel configuration file
 possible.
 
-For more information on kernel configuration, see the "`Changing the
-Configuration <#changing-the-configuration>`__" section.
+For more information on kernel configuration, see the
+":ref:`kernel-dev/common:changing the configuration`" section.
 
 Using  ``menuconfig``
 ---------------------
@@ -1297,8 +1295,8 @@ created to hold the configuration changes.
    applies these on top of and after applying the existing ``defconfig`` file
    configurations.
 
-For more information on configuring the kernel, see the "`Changing the
-Configuration <#changing-the-configuration>`__" section.
+For more information on configuring the kernel, see the
+":ref:`kernel-dev/common:changing the configuration`" section.
 
 Creating Configuration Fragments
 --------------------------------
@@ -1369,8 +1367,8 @@ steps:
       $ bitbake linux-yocto -c diffconfig
 
 The ``diffconfig`` command creates a file that is a list of Linux kernel
-``CONFIG_`` assignments. See the "`Changing the
-Configuration <#changing-the-configuration>`__" section for additional
+``CONFIG_`` assignments. See the
+":ref:`kernel-dev/common:changing the configuration`" section for additional
 information on how to use the output as a configuration fragment.
 
 .. note::
@@ -1614,8 +1612,7 @@ source directory. Follow these steps to clean up the version string:
    ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
    section. For
    information on building the kernel image when using Bitbake, see the
-   "`Using Traditional Kernel Development to Patch the
-   Kernel <#using-traditional-kernel-development-to-patch-the-kernel>`__"
+   ":ref:`kernel-dev/common:using traditional kernel development to patch the kernel`"
    section.
 
 Working With Your Own Sources
@@ -1733,8 +1730,9 @@ Here are some basic steps you can use to work with your own sources:
 
 5. *Customize Your Recipe as Needed:* Provide further customizations to
    your recipe as needed just as you would customize an existing
-   linux-yocto recipe. See the "`Modifying an Existing
-   Recipe <#modifying-an-existing-recipe>`__" section for information.
+   linux-yocto recipe. See the
+   ":ref:`ref-manual/devtool-reference:modifying an existing recipe`" section
+   for information.
 
 Working with Out-of-Tree Modules
 ================================
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index f6c9b9713..5592f74c8 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -90,8 +90,7 @@ understand the following documentation:
 -  The ":ref:`dev-manual/common-tasks:understanding and creating layers`"
    section in the Yocto Project Development Tasks Manual.
 
--  The "`Kernel Modification
-   Workflow <#kernel-modification-workflow>`__" section.
+-  The ":ref:`kernel-dev/intro:kernel modification workflow`" section.
 
 Kernel Modification Workflow
 ============================
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index f0c7dab4c..ada5143b2 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -132,7 +132,7 @@ Layers
 
 Layers are repositories that contain related metadata (i.e. sets of
 instructions) that tell the OpenEmbedded build system how to build a
-target. Yocto Project's `layer model <#the-yocto-project-layer-model>`__
+target. :ref:`overview-manual/yp-intro:the yocto project layer model`
 facilitates collaboration, sharing, customization, and reuse within the
 Yocto Project development environment. Layers logically separate
 information for your project. For example, you can use a layer to hold
@@ -207,8 +207,8 @@ you can tell BitBake the target architecture for which you are building
 the image, where to store downloaded source, and other build properties.
 
 The following figure shows an expanded representation of the "User
-Configuration" box of the `general workflow
-figure <#general-workflow-figure>`__:
+Configuration" box of the :ref:`general workflow
+figure <overview-manual/concepts:openembedded build system concepts>`:
 
 .. image:: figures/user-configuration.png
    :align: center
@@ -374,7 +374,7 @@ provide Metadata for the software, machine, and policies.
 
 In general, three types of layer input exists. You can see them below
 the "User Configuration" box in the `general workflow
-figure <#general-workflow-figure>`__:
+figure <overview-manual/concepts:openembedded build system concepts>`:
 
 -  *Metadata (.bb + Patches):* Software layers containing
    user-supplied recipe files, patches, and append files. A good example
@@ -387,8 +387,8 @@ figure <#general-workflow-figure>`__:
 -  *Machine BSP Configuration:* Board Support Package (BSP) layers (i.e.
    "BSP Layer" in the following figure) providing machine-specific
    configurations. This type of information is specific to a particular
-   target architecture. A good example of a BSP layer from the `Poky
-   Reference Distribution <#gs-reference-distribution-poky>`__ is the
+   target architecture. A good example of a BSP layer from the
+   :ref:`overview-manual/yp-intro:reference distribution (poky)` is the
    :yocto_git:`meta-yocto-bsp </poky/tree/meta-yocto-bsp>`
    layer.
 
@@ -403,7 +403,8 @@ figure <#general-workflow-figure>`__:
    that contain many policy configurations for the Poky distribution.
 
 The following figure shows an expanded representation of these three
-layers from the `general workflow figure <#general-workflow-figure>`__:
+layers from the :ref:`general workflow figure
+<overview-manual/concepts:openembedded build system concepts>`:
 
 .. image:: figures/layer-input.png
    :align: center
@@ -418,9 +419,9 @@ in the
 section in the
 Yocto Project Development Tasks Manual. For a general discussion on
 layers and the many layers from which you can draw, see the
-"`Layers <#overview-layers>`__" and "`The Yocto Project Layer
-Model <#the-yocto-project-layer-model>`__" sections both earlier in this
-manual.
+":ref:`overview-manual/concepts:layers`" and
+":ref:`overview-manual/yp-intro:the yocto project layer model`" sections both
+earlier in this manual.
 
 If you explored the previous links, you discovered some areas where many
 layers that work with the Yocto Project exist. The :yocto_git:`Source
@@ -514,11 +515,12 @@ Sources
 -------
 
 In order for the OpenEmbedded build system to create an image or any
-target, it must be able to access source files. The `general workflow
-figure <#general-workflow-figure>`__ represents source files using the
-"Upstream Project Releases", "Local Projects", and "SCMs (optional)"
-boxes. The figure represents mirrors, which also play a role in locating
-source files, with the "Source Materials" box.
+target, it must be able to access source files. The :ref:`general workflow
+figure <overview-manual/concepts:openembedded build system concepts>`
+represents source files using the "Upstream Project Releases", "Local
+Projects", and "SCMs (optional)" boxes. The figure represents mirrors,
+which also play a role in locating source files, with the "Source
+Materials" box.
 
 The method by which source files are ultimately organized is a function
 of the project. For example, for released software, projects tend to use
@@ -554,7 +556,7 @@ Directory if needed without fear of removing any downloaded source file.
 
 The remainder of this section provides a deeper look into the source
 files and the mirrors. Here is a more detailed look at the source file
-area of the `general workflow figure <#general-workflow-figure>`__:
+area of the :ref:`general workflow figure <overview-manual/concepts:openembedded build system concepts>`:
 
 .. image:: figures/source-input.png
    :align: center
@@ -628,9 +630,9 @@ Package Feeds
 
 When the OpenEmbedded build system generates an image or an SDK, it gets
 the packages from a package feed area located in the
-:term:`Build Directory`. The `general
-workflow figure <#general-workflow-figure>`__ shows this package feeds
-area in the upper-right corner.
+:term:`Build Directory`. The :ref:`general workflow figure
+<overview-manual/concepts:openembedded build system concepts>`
+shows this package feeds area in the upper-right corner.
 
 This section looks a little closer into the package feeds area used by
 the build system. Here is a more detailed look at the area:
@@ -691,10 +693,10 @@ BitBake Tool
 
 The OpenEmbedded build system uses
 :term:`BitBake` to produce images and
-Software Development Kits (SDKs). You can see from the `general workflow
-figure <#general-workflow-figure>`__, the BitBake area consists of
-several functional areas. This section takes a closer look at each of
-those areas.
+Software Development Kits (SDKs). You can see from the :ref:`general workflow
+figure <overview-manual/concepts:openembedded build system concepts>`,
+the BitBake area consists of several functional areas. This section takes a
+closer look at each of those areas.
 
 .. note::
 
@@ -820,7 +822,7 @@ source files, which are located in the
 :term:`S` directory.
 
 For more information on how the source directories are created, see the
-"`Source Fetching <#source-fetching-dev-environment>`__" section. For
+":ref:`overview-manual/concepts:source fetching`" section. For
 more information on how to create patches and how the build system
 processes patches, see the
 ":ref:`dev-manual/common-tasks:patching code`"
@@ -957,8 +959,8 @@ details on how this is accomplished, you can look at
 Depending on the type of packages being created (RPM, DEB, or IPK), the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`
 task creates the actual packages and places them in the Package Feed
-area, which is ``${TMPDIR}/deploy``. You can see the "`Package
-Feeds <#package-feeds-dev-environment>`__" section for more detail on
+area, which is ``${TMPDIR}/deploy``. You can see the
+":ref:`overview-manual/concepts:package feeds`" section for more detail on
 that part of the build process.
 
 .. note::
@@ -1119,7 +1121,7 @@ and
 :ref:`ref-tasks-populate_sdk_ext`
 tasks use these key variables to help create the list of packages to
 actually install. For information on the variables listed in the figure,
-see the "`Application Development SDK <#sdk-dev-environment>`__"
+see the ":ref:`overview-manual/concepts:application development sdk`"
 section.
 
 The ``do_populate_sdk`` task helps create the standard SDK and handles
@@ -1147,8 +1149,8 @@ For each task that completes successfully, BitBake writes a stamp file
 into the :term:`STAMPS_DIR`
 directory. The beginning of the stamp file's filename is determined by
 the :term:`STAMP` variable, and the end
-of the name consists of the task's name and current `input
-checksum <#overview-checksums>`__.
+of the name consists of the task's name and current :ref:`input
+checksum <overview-manual/concepts:checksums (signatures)>`.
 
 .. note::
 
@@ -1165,10 +1167,10 @@ file does not exist, the task is rerun.
 .. note::
 
    The stamp mechanism is more general than the shared state (sstate)
-   cache mechanism described in the "`Setscene Tasks and Shared
-   State <#setscene-tasks-and-shared-state>`__" section. BitBake avoids
-   rerunning any task that has a valid stamp file, not just tasks that
-   can be accelerated through the sstate cache.
+   cache mechanism described in the
+   ":ref:`overview-manual/concepts:setscene tasks and shared state`" section.
+   BitBake avoids rerunning any task that has a valid stamp file, not just
+   tasks that can be accelerated through the sstate cache.
 
    However, you should realize that stamp files only serve as a marker
    that some work has been done and that these files do not record task
@@ -1271,7 +1273,8 @@ Images
 
 The images produced by the build system are compressed forms of the root
 filesystem and are ready to boot on a target device. You can see from
-the `general workflow figure <#general-workflow-figure>`__ that BitBake
+the :ref:`general workflow figure
+<overview-manual/concepts:openembedded build system concepts>` that BitBake
 output, in part, consists of images. This section takes a closer look at
 this output:
 
@@ -1327,7 +1330,8 @@ current configuration.
 Application Development SDK
 ---------------------------
 
-In the `general workflow figure <#general-workflow-figure>`__, the
+In the :ref:`general workflow figure
+<overview-manual/concepts:openembedded build system concepts>`, the
 output labeled "Application Development SDK" represents an SDK. The SDK
 generation process differs depending on whether you build an extensible
 SDK (e.g. ``bitbake -c populate_sdk_ext`` imagename) or a standard SDK
@@ -1357,8 +1361,8 @@ can initialize the environment before using the tools.
       your own SDK installer.
 
    -  For background information on cross-development toolchains in the
-      Yocto Project development environment, see the "`Cross-Development
-      Toolchain Generation <#cross-development-toolchain-generation>`__"
+      Yocto Project development environment, see the
+      ":ref:`overview-manual/concepts:cross-development toolchain generation`"
       section.
 
    -  For information on setting up a cross-development environment, see
@@ -1773,10 +1777,10 @@ through this setting in the ``bitbake.conf`` file:
    BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 
 The "OEBasicHash" ``BB_SIGNATURE_HANDLER`` is the same
-as the "OEBasic" version but adds the task hash to the `stamp
-files <#stamp-files-and-the-rerunning-of-tasks>`__. This results in any
-metadata change that changes the task hash, automatically causing the
-task to be run again. This removes the need to bump
+as the "OEBasic" version but adds the task hash to the :ref:`stamp
+files <overview-manual/concepts:stamp files and the rerunning of tasks>`. This
+results in any metadata change that changes the task hash, automatically causing
+the task to be run again. This removes the need to bump
 :term:`PR` values, and changes to metadata
 automatically ripple across the build.
 
@@ -1901,9 +1905,10 @@ The following list explains the previous example:
 
 
 -  The ``do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"`` line appends
-   extra metadata to the `stamp
-   file <#stamp-files-and-the-rerunning-of-tasks>`__. In this case, the
-   metadata makes the task specific to a machine's architecture. See
+   extra metadata to the :ref:`stamp
+   file <overview-manual/concepts:stamp files and the rerunning of tasks>`. In
+   this case, the metadata makes the task specific to a machine's architecture.
+   See
    ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:the task list`"
    section in the BitBake User Manual for more information on the
    ``stamp-extra-info`` flag.
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 011a47957..6d1dbfcc7 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -157,7 +157,8 @@ these tarballs gives you a snapshot of the released files.
 
    -  The recommended method for setting up the Yocto Project
       :term:`Source Directory` and the files
-      for supported BSPs (e.g., ``meta-intel``) is to use `Git <#git>`__
+      for supported BSPs (e.g., ``meta-intel``) is to use
+      :ref:`overview-manual/development-environment:git`
       to create a local copy of the upstream repositories.
 
    -  Be sure to always work in matching branches for both the selected
@@ -214,7 +215,8 @@ Git Workflows and the Yocto Project
 ===================================
 
 Developing using the Yocto Project likely requires the use of
-`Git <#git>`__. Git is a free, open source distributed version control
+:ref:`overview-manual/development-environment:git`.
+Git is a free, open source distributed version control
 system used as part of many collaborative design environments. This
 section provides workflow concepts using the Yocto Project and Git. In
 particular, the information covers basic practices that describe roles
@@ -382,11 +384,10 @@ commands.
 Repositories, Tags, and Branches
 --------------------------------
 
-As mentioned briefly in the previous section and also in the "`Git
-Workflows and the Yocto
-Project <#gs-git-workflows-and-the-yocto-project>`__" section, the Yocto
-Project maintains source repositories at :yocto_git:`/`. If you
-look at this web-interface of the repositories, each item is a separate
+As mentioned briefly in the previous section and also in the
+":ref:`overview-manual/development-environment:git workflows and the yocto project`"
+section, the Yocto Project maintains source repositories at :yocto_git:`/`.
+If you look at this web-interface of the repositories, each item is a separate
 Git repository.
 
 Git repositories use branching techniques that track content change (not
diff --git a/documentation/overview-manual/intro.rst b/documentation/overview-manual/intro.rst
index bd247dd45..a2afe7756 100644
--- a/documentation/overview-manual/intro.rst
+++ b/documentation/overview-manual/intro.rst
@@ -14,17 +14,16 @@ information suitable for a new Yocto Project user.
 
 The following list describes what you can get from this manual:
 
--  `Introducing the Yocto Project <#overview-yp>`__\ *:* This chapter
-   provides an introduction to the Yocto Project. You will learn about
-   features and challenges of the Yocto Project, the layer model,
+-  :ref:`overview-manual/yp-intro:introducing the yocto project`\ *:*
+   This chapter provides an introduction to the Yocto Project. You will learn
+   about features and challenges of the Yocto Project, the layer model,
    components and tools, development methods, the
    :term:`Poky` reference distribution, the
    OpenEmbedded build system workflow, and some basic Yocto terms.
 
--  `The Yocto Project Development
-   Environment <#overview-development-environment>`__\ *:* This chapter
-   helps you get started understanding the Yocto Project development
-   environment. You will learn about open source, development hosts,
+-  :ref:`overview-manual/development-environment:the yocto project development environment`\ *:*
+   This chapter helps you get started understanding the Yocto Project
+   development environment. You will learn about open source, development hosts,
    Yocto Project source repositories, workflows using Git and the Yocto
    Project, a Git primer, and information about licensing.
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index b01b4e6a8..fca02e4ce 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -96,18 +96,18 @@ Project:
    of your design instead of adopting decisions enforced by some system
    software provider.
 
--  *Uses a Layer Model:* The Yocto Project `layer
-   infrastructure <#the-yocto-project-layer-model>`__ groups related
-   functionality into separate bundles. You can incrementally add these
-   grouped functionalities to your project as needed. Using layers to
+-  *Uses a Layer Model:* The Yocto Project :ref:`layer
+   infrastructure <overview-manual/yp-intro:the yocto project layer model>`
+   groups related functionality into separate bundles. You can incrementally
+   add these grouped functionalities to your project as needed. Using layers to
    isolate and group functionality reduces project complexity and
    redundancy, allows you to easily extend the system, make
    customizations, and keep functionality organized.
 
 -  *Supports Partial Builds:* You can build and rebuild individual
    packages as needed. Yocto Project accomplishes this through its
-   `shared-state cache <#shared-state-cache>`__ (sstate) scheme. Being
-   able to build and debug components individually eases project
+   :ref:`overview-manual/concepts:shared state cache` (sstate) scheme.
+   Being able to build and debug components individually eases project
    development.
 
 -  *Releases According to a Strict Schedule:* Major releases occur on a
@@ -155,8 +155,9 @@ developing using the Yocto Project:
    documents on the Yocto Project website.
 
 -  *Project Workflow Could Be Confusing:* The `Yocto Project
-   workflow <#overview-development-environment>`__ could be confusing if
-   you are used to traditional desktop and server software development.
+   workflow <overview-manual/development-environment:the yocto project development environment>`
+   could be confusing if you are used to traditional desktop and server
+   software development.
    In a desktop development environment, mechanisms exist to easily pull
    and install new packages, which are typically pre-compiled binaries
    from servers accessible over the Internet. Using the Yocto Project,
@@ -437,8 +438,8 @@ activities using the Yocto Project:
    Thanks to Pseudo, the Yocto Project never needs root privileges to
    build images for your target system.
 
-   You can read more about Pseudo in the "`Fakeroot and
-   Pseudo <#fakeroot-and-pseudo>`__" section.
+   You can read more about Pseudo in the
+   ":ref:`overview-manual/concepts:fakeroot and pseudo`" section.
 
 Open-Embedded Build System Components
 -------------------------------------
@@ -480,9 +481,9 @@ The following list consists of components associated with the
 
    Sharing a core set of metadata results in Poky as an integration
    layer on top of OE-Core. You can see that in this
-   `figure <#yp-key-dev-elements>`__. The Yocto Project combines various
-   components such as BitBake, OE-Core, script "glue", and documentation
-   for its build system.
+   :ref:`figure <overview-manual/yp-intro:what is the yocto project?>`.
+   The Yocto Project combines various components such as BitBake, OE-Core,
+   script "glue", and documentation for its build system.
 
 Reference Distribution (Poky)
 -----------------------------
@@ -490,8 +491,8 @@ Reference Distribution (Poky)
 Poky is the Yocto Project reference distribution. It contains the
 :term:`OpenEmbedded Build System`
 (BitBake and OE-Core) as well as a set of metadata to get you started
-building your own distribution. See the
-`figure <#what-is-the-yocto-project>`__ in "What is the Yocto Project?"
+building your own distribution. See the figure in
+":ref:`overview-manual/yp-intro:what is the yocto project?`"
 section for an illustration that shows Poky and its relationship with
 other parts of the Yocto Project.
 
@@ -503,8 +504,9 @@ To use the Yocto Project tools and components, you can download
    Poky does not contain binary files. It is a working example of how to
    build your own custom Linux distribution from source.
 
-You can read more about Poky in the "`Reference Embedded Distribution
-(Poky) <#reference-embedded-distribution>`__" section.
+You can read more about Poky in the
+":ref:`overview-manual/yp-intro:reference embedded distribution (poky)`"
+section.
 
 Packages for Finished Targets
 -----------------------------
@@ -567,7 +569,7 @@ Linux.
 
 3. *CROPS:* The final and best solution available now for developing
    using the Yocto Project on a system not native to Linux is with
-   `CROPS <#gs-crops-overview>`__.
+   :ref:`CROPS <overview-manual/yp-intro:development tools>`.
 
 Development Methods
 ===================
@@ -727,7 +729,8 @@ Sato.
 One of the most powerful properties of Poky is that every aspect of a
 build is controlled by the metadata. You can use metadata to augment
 these base image types by adding metadata
-`layers <#the-yocto-project-layer-model>`__ that extend functionality.
+`layers <overview-manual/yp-intro:the yocto project layer model>` that extend
+functionality.
 These layers can provide, for example, an additional software stack for
 an image type, add a board support package (BSP) for additional
 hardware, or even create a new image type.
@@ -784,8 +787,8 @@ Following is a brief summary of the "workflow":
 7. The build system generates the file system image and a customized
    Extensible SDK (eSDK) for application development in parallel.
 
-For a very detailed look at this workflow, see the "`OpenEmbedded Build
-System Concepts <#openembedded-build-system-build-concepts>`__" section.
+For a very detailed look at this workflow, see the
+":ref:`overview-manual/concepts:openembedded build system concepts`" section.
 
 Some Basic Terms
 ================
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5075f0c22..629aa2ffb 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -178,8 +178,8 @@ resides in ``/home/user/sources/jackson``:
    $ devtool add jackson /home/user/sources/jackson
 
 If you add a recipe and the workspace layer does not exist, the command
-creates the layer and populates it as described in "`The Workspace Layer
-Structure <#devtool-the-workspace-layer-structure>`__" section.
+creates the layer and populates it as described in
+":ref:`devtool-the-workspace-layer-structure`" section.
 
 Running ``devtool add`` when the workspace layer exists causes the tool
 to add the recipe, append files, and source files into the existing
diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
index 2716bc9cf..2d638f92b 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/ref-manual/migration-1.5.rst
@@ -298,7 +298,7 @@ Removed and Renamed Recipes
 -  ``libtool-nativesdk`` has been renamed to ``nativesdk-libtool``.
 
 -  ``tinylogin`` has been removed. It has been replaced by a suid
-   portion of Busybox. See the "`BusyBox <#busybox>`__"
+   portion of Busybox. See the ":ref:`migration-1.5-busybox`"
    section for more information.
 
 -  ``external-python-tarball`` has been renamed to
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 4a5acc45c..b7bac0c0d 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -179,9 +179,8 @@ The following recipes have been removed in the 2.1 release:
 
 -  ``python-pygtk``: Recipe became obsolete.
 
--  ``adt-installer``: Recipe became obsolete. See the "`ADT
-   Removed <#adt-removed>`__" section for more
-   information.
+-  ``adt-installer``: Recipe became obsolete. See the
+   ":ref:`ref-manual/migration-2.1:adt removed`" section for more information.
 
 .. _migration-2.1-class-changes:
 
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index 5c6fecf32..8b3c5d671 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -367,8 +367,8 @@ The following recipes have been removed:
 
 -  ``sato-icon-theme``: Became obsolete.
 
--  ``swabber-native``: Swabber has been removed. See the `entry on
-   Swabber <#swabber-has-been-removed>`__.
+-  ``swabber-native``: Swabber has been removed. See the :ref:`entry on
+   Swabber <ref-manual/migration-2.2:swabber has been removed>`.
 
 -  ``tslib``: No longer needed and has been moved to ``meta-oe``.
 
@@ -393,8 +393,8 @@ The following classes have been removed:
 
 -  ``sip``: Mostly unused.
 
--  ``swabber``: See the `entry on
-   Swabber <#swabber-has-been-removed>`__.
+-  ``swabber``: See the :ref:`entry on
+   Swabber <ref-manual/migration-2.2:swabber has been removed>`.
 
 .. _migration-2.2-minor-packaging-changes:
 
diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
index 5d524f381..0517b0a2b 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/ref-manual/migration-2.6.rst
@@ -110,7 +110,7 @@ upon the older ``*proto`` recipes need to be changed to depend on the
 newer ``xorgproto`` recipe instead.
 
 For names of recipes removed because of this repository change, see the
-`Removed Recipes <#removed-recipes>`__ section.
+:ref:`ref-manual/migration-2.6:removed recipes` section.
 
 .. _migration-2.6-distutils-distutils3-fetching-dependencies:
 
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 107d06c76..93ab6ed08 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -15,9 +15,8 @@ Major and Minor Release Cadence
 The Yocto Project delivers major releases (e.g. &DISTRO;) using a six
 month cadence roughly timed each April and October of the year.
 Following are examples of some major YP releases with their codenames
-also shown. See the "`Major Release
-Codenames <#major-release-codenames>`__" section for information on
-codenames used with major releases.
+also shown. See the ":ref:`ref-manual/release-process:major release codenames`"
+section for information on codenames used with major releases.
 
   - 2.2 (Morty) 
   - 2.1 (Krogoth)
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index cdfde8b4b..8e7115046 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -101,17 +101,15 @@ adjustments:
 
 -  Generally, you want to have a shared state mirror set up so users of
    the SDK can add additional items to the SDK after installation
-   without needing to build the items from source. See the "`Providing
-   Additional Installable Extensible SDK
-   Content <#sdk-providing-additional-installable-extensible-sdk-content>`__"
+   without needing to build the items from source. See the
+   ":ref:`sdk-manual/appendix-customizing:providing additional installable extensible sdk content`"
    section for information.
 
 -  If you want users of the SDK to be able to easily update the SDK, you
    need to set the
    :term:`SDK_UPDATE_URL`
-   variable. For more information, see the "`Providing Updates to the
-   Extensible SDK After
-   Installation <#sdk-providing-updates-to-the-extensible-sdk-after-installation>`__"
+   variable. For more information, see the
+   ":ref:`sdk-manual/appendix-customizing:providing updates to the extensible sdk after installation`"
    section.
 
 -  If you have adjusted the list of files and directories that appear in
@@ -140,8 +138,8 @@ Changing the Extensible SDK Installer Title
 You can change the displayed title for the SDK installer by setting the
 :term:`SDK_TITLE` variable and then
 rebuilding the SDK installer. For information on how to build an SDK
-installer, see the "`Building an SDK
-Installer <#sdk-building-an-sdk-installer>`__" section.
+installer, see the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
+section.
 
 By default, this title is derived from
 :term:`DISTRO_NAME` when it is
@@ -189,9 +187,8 @@ the installed SDKs to update the installed SDKs by using the
    variable to point to the corresponding HTTP or HTTPS URL. Setting
    this variable causes any SDK built to default to that URL and thus,
    the user does not have to pass the URL to the ``devtool sdk-update``
-   command as described in the "`Applying Updates to an Installed
-   Extensible
-   SDK <#sdk-applying-updates-to-an-installed-extensible-sdk>`__"
+   command as described in the
+   ":ref:`sdk-manual/extensible:applying updates to an installed extensible sdk`"
    section.
 
 3. Build the extensible SDK normally (i.e., use the
@@ -208,9 +205,9 @@ the installed SDKs to update the installed SDKs by using the
 
 Completing the above steps allows users of the existing installed SDKs
 to simply run ``devtool sdk-update`` to retrieve and apply the latest
-updates. See the "`Applying Updates to an Installed Extensible
-SDK <#sdk-applying-updates-to-an-installed-extensible-sdk>`__" section
-for further information.
+updates. See the
+":ref:`sdk-manual/extensible:applying updates to an installed extensible sdk`"
+section for further information.
 
 Changing the Default SDK Installation Directory
 ===============================================
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 395102c3b..16427a920 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -68,10 +68,10 @@ Follow these steps to locate and hand-install the toolchain:
       $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
-   toolchain. See the "`Installed Standard SDK Directory
-   Structure <#sdk-installed-standard-sdk-directory-structure>`__"
-   section and the "`Installed Extensible SDK Directory
-   Structure <#sdk-installed-extensible-sdk-directory-structure>`__"
+   toolchain. See the
+   ":ref:`sdk-manual/appendix-obtain:installed standard sdk directory structure`"
+   section and the
+   ":ref:`sdk-manual/appendix-obtain:installed extensible sdk directory structure`"
    section for more information.
 
 Building an SDK Installer
@@ -177,10 +177,10 @@ build the SDK installer. Follow these steps:
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the
-   toolchain. See the "`Installed Standard SDK Directory
-   Structure <#sdk-installed-standard-sdk-directory-structure>`__"
-   section and the "`Installed Extensible SDK Directory
-   Structure <#sdk-installed-extensible-sdk-directory-structure>`__"
+   toolchain. See the
+   ":ref:`sdk-manual/appendix-obtain:installed standard sdk directory structure`"
+   section and the
+   ":ref:`sdk-manual/appendix-obtain:installed extensible sdk directory structure`"
    section for more information.
 
 Extracting the Root Filesystem
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index f1a114368..baa432ef3 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -21,8 +21,9 @@ hardware, and ease integration into the rest of the
 
 In addition to the functionality available through ``devtool``, you can
 alternatively make use of the toolchain directly, for example from
-Makefile and Autotools. See the "`Using the SDK Toolchain
-Directly <#sdk-working-projects>`__" chapter for more information.
+Makefile and Autotools. See the
+":ref:`sdk-manual/working-projects:using the sdk toolchain directly`" chapter
+for more information.
 
 Why use the Extensible SDK and What is in It?
 =============================================
@@ -1087,12 +1088,12 @@ links created within the source tree:
 
    -  ``sysroot-destdir/``: Contains a subset of files installed within
       ``do_install`` that have been put into the shared sysroot. For
-      more information, see the "`Sharing Files Between
-      Recipes <#sdk-sharing-files-between-recipes>`__" section.
+      more information, see the
+      ":ref:`dev-manual/common-tasks:sharing files between recipes`" section.
 
    -  ``packages-split/``: Contains subdirectories for each package
       produced by the recipe. For more information, see the
-      "`Packaging <#sdk-packaging>`__" section.
+      ":ref:`sdk-manual/extensible:packaging`" section.
 
 You can use these links to get more information on what is happening at
 each build step.
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index e4b9b05ba..d966efea7 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -176,8 +176,8 @@ image.
 You just need to follow these general steps:
 
 1. *Install the SDK for your target hardware:* For information on how to
-   install the SDK, see the "`Installing the
-   SDK <#sdk-installing-the-sdk>`__" section.
+   install the SDK, see the ":ref:`sdk-manual/using:installing the sdk`"
+   section.
 
 2. *Download or Build the Target Image:* The Yocto Project supports
    several target architectures and has many pre-built kernel images and
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index 29fb50465..62967f557 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -16,8 +16,9 @@ standard SDK.
    " section.
 
 You can use a standard SDK to work on Makefile and Autotools-based
-projects. See the "`Using the SDK Toolchain
-Directly <#sdk-working-projects>`__" chapter for more information.
+projects. See the
+":ref:`sdk-manual/working-projects:using the sdk toolchain directly`" chapter
+for more information.
 
 Why use the Standard SDK and What is in It?
 ===========================================
@@ -31,9 +32,9 @@ the extensible SDK, which provides an internal build system and the
 The installed Standard SDK consists of several files and directories.
 Basically, it contains an SDK environment setup script, some
 configuration files, and host and target root filesystems to support
-usage. You can see the directory structure in the "`Installed Standard
-SDK Directory
-Structure <#sdk-installed-standard-sdk-directory-structure>`__" section.
+usage. You can see the directory structure in the
+":ref:`sdk-manual/appendix-obtain:installed standard sdk directory structure`"
+section.
 
 Installing the SDK
 ==================
@@ -120,9 +121,9 @@ architecture. The example assumes the SDK installer is located in
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
     $ . /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
-Again, reference the "`Installed Standard SDK Directory
-Structure <#sdk-installed-standard-sdk-directory-structure>`__" section
-for more details on the resulting directory structure of the installed
+Again, reference the
+":ref:`sdk-manual/appendix-obtain:installed standard sdk directory structure`"
+section for more details on the resulting directory structure of the installed
 SDK.
 
 Running the SDK Environment Setup Script
@@ -147,7 +148,6 @@ script is for an IA-based target machine using i586 tuning:
 
 When you run the
 setup script, the same environment variables are defined as are when you
-run the setup script for an extensible SDK. See the "`Running the
-Extensible SDK Environment Setup
-Script <#sdk-running-the-extensible-sdk-environment-setup-script>`__"
+run the setup script for an extensible SDK. See the
+":ref:`sdk-manual/appendix-obtain:installed extensible sdk directory structure`"
 section for more information.
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 508ead5fa..4c3b32bfe 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -63,7 +63,7 @@ milestone releases (usually four) with the final one being stabilization
 only along with point releases of our stable branches.
 
 The build and release process for these project releases is similar to
-that in `Day to Day Development <#test-daily-devel>`__, in that the
+that in :ref:`test-manual/test-process:day to day development`, in that the
 a-full target of the Autobuilder is used but in addition the form is
 configured to generate and publish artifacts and the milestone number,
 version, release candidate number and other information is entered. The
-- 
2.30.2

