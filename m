Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69C2C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 15:01:43 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.92512.1677510102537570071
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 07:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CTigcecc;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DD50A24001C;
	Mon, 27 Feb 2023 15:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677510100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kWrxzAxgjLyDQi7oMnLXJOx8MPeG8d14ZWJWQq9cRok=;
	b=CTigceccWsvDPcz8gJiXtKdrkPwblF3dKcIqA6OOIkO4akrh1Y2ZjyL89u+JpE5HRB6RmC
	C+XHnOxi0Rczc6gV529yaSKcEG+cvnP4mSwX9O0yk1iGIkEOw+JcvCKD8XjvDMcEu2nd8v
	dqPfnxGqM5r+wF9h/pLTXbGVz/E6/M0yYVmH5mkEf/FSoBuv76VMt5KoJxRCKtf8xaLfuJ
	BQW/Ixy4+A5U3sy/y70dlKfEpDXvA5Yx6Y1g3swhZP9RIRGvHZ/OJKvimhSjjcelyaJt9J
	qi/8m8LXOLVjDXX3BRvy5mIVBLVHj9bbGO0JNZPw/EuKqLJRMN5mAX3DuEi/LA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: simplify references within the same document
Date: Mon, 27 Feb 2023 16:01:37 +0100
Message-Id: <20230227150137.271106-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Feb 2023 15:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3745

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace :ref:`path/docname.rst:section title`
by `section title`_, which is much more compact and
doesn't need changing when you change the document file name.

There are drawbacks though:

- There are no warnings at compile time when the trailing
  `_` character is omitted. You just get plain italic text
  without a link. However, you do get an error if `_` is
  present and the text doesn't correspond to an existing target.

- The capitalization of the link text doesn't necessarily
  match the one in the target. You get the capitalization that you
  specify in the text between quotes (target matching is
  case insensitive).

  For example, take this section name:

  Description of the First Section
  ================================

  - With :ref:`path/docname:description of the First Section`,
    you get this link text:
    "Description of the First Section"

  - With `Description of the first section`_, you get this link text:
    "Description of the first section"

- There is no support for \`\` in the target name.
  For example, take this section name:

  ``runqemu`` Command-Line Options
  ================================

  A :ref: reference to it would be:
  :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options`

  A simpler reference to it would have to be:
  `runqemu command-line options`_

  Here, we're losing the special ``run-qemu`` fixed font in the
  link text, but it's usual not to have different fonts in the
  text of a link.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/build-quality.rst    |  8 +-
 documentation/dev-manual/building.rst         | 30 ++++----
 documentation/dev-manual/changes.rst          | 15 ++--
 documentation/dev-manual/debugging.rst        | 76 ++++++++-----------
 .../dev-manual/gobject-introspection.rst      |  3 +-
 documentation/dev-manual/layers.rst           | 12 ++-
 documentation/dev-manual/libraries.rst        | 11 +--
 documentation/dev-manual/licenses.rst         | 21 +++--
 documentation/dev-manual/new-recipe.rst       | 29 +++----
 documentation/dev-manual/packages.rst         | 20 +++--
 documentation/dev-manual/qemu.rst             |  6 +-
 documentation/dev-manual/runtime-testing.rst  |  5 +-
 documentation/dev-manual/securing-images.rst  |  2 +-
 documentation/dev-manual/start.rst            | 47 +++++-------
 14 files changed, 121 insertions(+), 164 deletions(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index 713ea3a48e..ad00ee59a5 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -22,13 +22,13 @@ information to a local Git repository where you can examine the information.
 
 The remainder of this section describes the following:
 
--  :ref:`How you can enable and disable build history <dev-manual/build-quality:enabling and disabling build history>`
+-  `Enabling and disabling build history`_
 
--  :ref:`How to understand what the build history contains <dev-manual/build-quality:understanding what the build history contains>`
+-  `Understanding what the build history contains`_
 
--  :ref:`How to limit the information used for build history <dev-manual/build-quality:using build history to gather image information only>`
+-  `Using build history to gather image information only`_
 
--  :ref:`How to examine the build history from both a command-line and web interface <dev-manual/build-quality:examining build history information>`
+-  `Examining build history information`_
 
 Enabling and Disabling Build History
 ====================================
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 1f1642e846..8458a22f9a 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -317,7 +317,7 @@ to override it.
 To achieve this, you need to perform some additional steps:
 
 #. *Create a multiconfig for your Initramfs image:* You can perform the steps
-   on ":ref:`dev-manual/building:building images for multiple targets using multiple configurations`" to create a separate multiconfig.
+   on "`Building Images for Multiple Targets Using Multiple Configurations`_" to create a separate multiconfig.
    For the sake of simplicity let's assume such multiconfig is called: ``initramfscfg.conf`` and
    contains the variables::
 
@@ -370,24 +370,22 @@ perform to create distributions with smaller root filesystems, achieve
 faster boot times, maintain your critical functionality, and avoid
 initial RAM disks:
 
--  :ref:`Determine your goals and guiding principles
-   <dev-manual/building:goals and guiding principles>`
+-  `Determine your goals and guiding principles`_
 
--  :ref:`dev-manual/building:understand what contributes to your image size`
+-  `Understand what contributes to your image size`_
 
--  :ref:`Reduce the size of the root filesystem
-   <dev-manual/building:trim the root filesystem>`
+-  `Reduce the size of the root filesystem`_
 
--  :ref:`Reduce the size of the kernel <dev-manual/building:trim the kernel>`
+-  `Reduce the size of the kernel`_
 
--  :ref:`dev-manual/building:remove package management requirements`
+-  `Remove package management requirements`_
 
--  :ref:`dev-manual/building:look for other ways to minimize size`
+-  `Look for other ways to minimize size`_
 
--  :ref:`dev-manual/building:iterate on the process`
+-  `Iterate on the process`_
 
-Goals and Guiding Principles
-----------------------------
+Determine your Goals and Guiding Principles
+-------------------------------------------
 
 Before you can reach your destination, you need to know where you are
 going. Here is an example list that you can use as a guide when creating
@@ -466,8 +464,8 @@ view file dependencies in a human-readable form:
    to make informed decisions when cutting out various pieces of the
    kernel and root filesystem.
 
-Trim the Root Filesystem
-------------------------
+Reduce the Size of the Root Filesystem
+--------------------------------------
 
 The root filesystem is made up of packages for booting, libraries, and
 applications. To change things, you can configure how the packaging
@@ -522,8 +520,8 @@ this journal.
    After each round of elimination, you need to rebuild your system and
    then use the tools to see the effects of your reductions.
 
-Trim the Kernel
----------------
+Reduce the Size of the Kernel
+-----------------------------
 
 The kernel is built by including policies for hardware-independent
 aspects. What subsystems do you enable? For what architecture are you
diff --git a/documentation/dev-manual/changes.rst b/documentation/dev-manual/changes.rst
index 9db6ce010c..2e19ebef5d 100644
--- a/documentation/dev-manual/changes.rst
+++ b/documentation/dev-manual/changes.rst
@@ -247,15 +247,14 @@ Using Email to Submit a Patch
 
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
-see the
-:ref:`list <dev-manual/changes:submitting a change to the yocto project>`
-at the beginning of this section. For a description of all the available
-mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
+see "`Submitting a Change to the Yocto Project`_" at the beginning of this
+section. For a description of all the available mailing lists, see the
+":ref:`Mailing Lists <resources-mailinglist>`" section in the
 Yocto Project Reference Manual.
 
 Here is the general procedure on how to submit a patch through email
 without using the scripts once the steps in
-:ref:`dev-manual/changes:preparing changes for submission` have been followed:
+"`Preparing Changes for Submission`_" have been followed:
 
 #. *Format the Commit:* Format the commit into an email message. To
    format commits, use the ``git format-patch`` command. When you
@@ -343,7 +342,7 @@ and ``send-pull-request`` scripts from openembedded-core to create and send a
 patch series with a link to the branch for review.
 
 Follow this procedure to push a change to an upstream "contrib" Git
-repository once the steps in :ref:`dev-manual/changes:preparing changes for submission` have
+repository once the steps in "`Preparing Changes for Submission`_" have
 been followed:
 
 .. note::
@@ -515,8 +514,8 @@ follows:
       a newer version of the software which includes an upstream fix for the
       issue or when the issue has been fixed on the master branch in a way
       that introduces backwards incompatible changes. In this case follow the
-      steps in :ref:`dev-manual/changes:preparing changes for submission` and
-      :ref:`dev-manual/changes:using email to submit a patch` but modify the subject header of your patch
+      steps in "`Preparing Changes for Submission`_" and
+      "`Using Email to Submit a Patch`_" but modify the subject header of your patch
       email to include the name of the stable branch which you are
       targetting. This can be done using the ``--subject-prefix`` argument to
       ``git format-patch``, for example to submit a patch to the dunfell
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 9fb159eae6..edf2997d1f 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -28,60 +28,51 @@ situations.
 The following list shows the debugging topics in the remainder of this
 section:
 
--  ":ref:`dev-manual/debugging:viewing logs from failed tasks`" describes
-   how to find and view logs from tasks that failed during the build
-   process.
+-  "`Viewing Logs from Failed Tasks`_" describes how to find and view logs from
+   tasks that failed during the build process.
 
--  ":ref:`dev-manual/debugging:viewing variable values`" describes how to
-   use the BitBake ``-e`` option to examine variable values after a
-   recipe has been parsed.
+-  "`Viewing Variable Values`_" describes how to use the BitBake ``-e`` option
+   to examine variable values after a recipe has been parsed.
 
--  ":ref:`dev-manual/debugging:viewing package information with \`\`oe-pkgdata-util\`\``"
-   describes how to use the ``oe-pkgdata-util`` utility to query
-   :term:`PKGDATA_DIR` and
+-  "`Viewing Package Information with oe-pkgdata-util`_" describes how
+   to use the ``oe-pkgdata-util`` utility to query :term:`PKGDATA_DIR` and
    display package-related information for built packages.
 
--  ":ref:`dev-manual/debugging:viewing dependencies between recipes and tasks`"
-   describes how to use the BitBake ``-g`` option to display recipe
-   dependency information used during the build.
+-  "`Viewing Dependencies Between Recipes and Tasks`_" describes how to use the
+   BitBake ``-g`` option to display recipe dependency information used during
+   the build.
 
--  ":ref:`dev-manual/debugging:viewing task variable dependencies`" describes
-   how to use the ``bitbake-dumpsig`` command in conjunction with key
-   subdirectories in the :term:`Build Directory` to determine variable
-   dependencies.
+-  "`Viewing Task Variable Dependencies`_" describes how to use the
+   ``bitbake-dumpsig`` command in conjunction with key subdirectories in the
+   :term:`Build Directory` to determine variable dependencies.
 
--  ":ref:`dev-manual/debugging:running specific tasks`" describes
-   how to use several BitBake options (e.g. ``-c``, ``-C``, and ``-f``)
-   to run specific tasks in the build chain. It can be useful to run
-   tasks "out-of-order" when trying isolate build issues.
+-  "`Running Specific Tasks`_" describes how to use several BitBake options
+   (e.g. ``-c``, ``-C``, and ``-f``) to run specific tasks in the build chain.
+   It can be useful to run tasks "out-of-order" when trying isolate build issues.
 
--  ":ref:`dev-manual/debugging:general BitBake problems`" describes how
-   to use BitBake's ``-D`` debug output option to reveal more about what
-   BitBake is doing during the build.
+-  "`General BitBake Problems`_" describes how to use BitBake's ``-D`` debug
+   output option to reveal more about what BitBake is doing during the build.
 
--  ":ref:`dev-manual/debugging:building with no dependencies`"
-   describes how to use the BitBake ``-b`` option to build a recipe
-   while ignoring dependencies.
+-  "`Building with No Dependencies`_" describes how to use the BitBake ``-b``
+   option to build a recipe while ignoring dependencies.
 
--  ":ref:`dev-manual/debugging:recipe logging mechanisms`"
-   describes how to use the many recipe logging functions to produce
-   debugging output and report errors and warnings.
+-  "`Recipe Logging Mechanisms`_" describes how to use the many recipe logging
+   functions to produce debugging output and report errors and warnings.
 
--  ":ref:`dev-manual/debugging:debugging parallel make races`"
-   describes how to debug situations where the build consists of several
-   parts that are run simultaneously and when the output or result of
-   one part is not ready for use with a different part of the build that
-   depends on that output.
+-  "`Debugging Parallel Make Races`_" describes how to debug situations where
+   the build consists of several parts that are run simultaneously and when the
+   output or result of one part is not ready for use with a different part of
+   the build that depends on that output.
 
--  ":ref:`dev-manual/debugging:debugging with the gnu project debugger (gdb) remotely`"
-   describes how to use GDB to allow you to examine running programs, which can
-   help you fix problems.
+-  "`Debugging With the GNU Project Debugger (GDB) Remotely`_" describes how to
+   use GDB to allow you to examine running programs, which can help you fix
+   problems.
 
--  ":ref:`dev-manual/debugging:debugging with the gnu project debugger (gdb) on the target`"
-   describes how to use GDB directly on target hardware for debugging.
+-  "`Debugging With the GNU Project Debugger (GDB) on the Target`_" describes
+   how to use GDB directly on target hardware for debugging.
 
--  ":ref:`dev-manual/debugging:other debugging tips`" describes
-   miscellaneous debugging tips that can be useful.
+-  "`Other Debugging Tips`_" describes miscellaneous debugging tips that can be
+   useful.
 
 Viewing Logs from Failed Tasks
 ==============================
@@ -372,8 +363,7 @@ state (sstate) task can be a useful debugging aid. This information is
 available in signature information (``siginfo``) files in
 :term:`SSTATE_DIR`. For
 information on how to view and interpret information in ``siginfo``
-files, see the
-":ref:`dev-manual/debugging:viewing task variable dependencies`" section.
+files, see the "`Viewing Task Variable Dependencies`" section.
 
 For conceptual information on shared state, see the
 ":ref:`overview-manual/concepts:shared state`"
diff --git a/documentation/dev-manual/gobject-introspection.rst b/documentation/dev-manual/gobject-introspection.rst
index f7206e6fae..cbb4291dac 100644
--- a/documentation/dev-manual/gobject-introspection.rst
+++ b/documentation/dev-manual/gobject-introspection.rst
@@ -30,8 +30,7 @@ because the library is produced for the target architecture, but its
 code needs to be executed on the build host. This problem is solved with
 the OpenEmbedded build system by running the code through QEMU, which
 allows precisely that. Unfortunately, QEMU does not always work
-perfectly as mentioned in the ":ref:`dev-manual/gobject-introspection:known issues`"
-section.
+perfectly as mentioned in the "`Known Issues`_" section.
 
 Enabling the Generation of Introspection Data
 =============================================
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 2d809562d1..a4801f275d 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -23,7 +23,7 @@ Creating Your Own Layer
    layer-creation tools, see the
    ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
    section in the Yocto Project Board Support Package (BSP) Developer's
-   Guide and the ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
+   Guide and the "`Creating a General Layer Using the bitbake-layers Script`_"
    section further down in this manual.
 
 Follow these general steps to create your layer without using tools:
@@ -144,8 +144,7 @@ Follow these general steps to create your layer without using tools:
 #. *Optionally Test for Compatibility:* If you want permission to use
    the Yocto Project Compatibility logo with your layer or application
    that uses your layer, perform the steps to apply for compatibility.
-   See the
-   ":ref:`dev-manual/layers:making sure your layer is compatible with yocto project`"
+   See the "`Making Sure Your Layer is Compatible With Yocto Project`_"
    section for more information.
 
 Following Best Practices When Creating Layers
@@ -261,8 +260,7 @@ following list:
 -  *Perform Steps to Apply for Yocto Project Compatibility:* If you want
    permission to use the Yocto Project Compatibility logo with your
    layer or application that uses your layer, perform the steps to apply
-   for compatibility. See the
-   ":ref:`dev-manual/layers:making sure your layer is compatible with yocto project`"
+   for compatibility. See the "`Making Sure Your Layer is Compatible with Yocto Project`_"
    section for more information.
 
 -  *Follow the Layer Naming Convention:* Store custom layers in a Git
@@ -726,7 +724,7 @@ The following list describes the available commands:
 
 -  ``create-layers-setup``: Writes out a configuration file and/or a script that
    can replicate the directory structure and revisions of the layers in a current build.
-   For more information, see ":ref:`dev-manual/layers:saving and restoring the layers setup`".
+   For more information, see "`Saving and Restoring the Layers Setup`_".
 
 Creating a General Layer Using the ``bitbake-layers`` Script
 ============================================================
@@ -742,7 +740,7 @@ simplifies creating a new general layer.
 
    -  In order to use a layer with the OpenEmbedded build system, you
       need to add the layer to your ``bblayers.conf`` configuration
-      file. See the ":ref:`dev-manual/layers:adding a layer using the \`\`bitbake-layers\`\` script`"
+      file. See the "`Adding a Layer Using the bitbake-layers Script`_"
       section for more information.
 
 The default mode of the script's operation with this subcommand is to
diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index ae4ca27209..748b3a3a3e 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -7,16 +7,11 @@ Libraries are an integral part of your system. This section describes
 some common practices you might find helpful when working with libraries
 to build your system:
 
--  :ref:`How to include static library files
-   <dev-manual/libraries:including static library files>`
+-  `Including static library files`_
 
--  :ref:`How to use the Multilib feature to combine multiple versions of
-   library files into a single image
-   <dev-manual/libraries:combining multiple versions of library files into one image>`
+-  `Combining multiple versions of library files into one image`_
 
--  :ref:`How to install multiple versions of the same library in parallel on
-   the same system
-   <dev-manual/libraries:installing multiple versions of the same library>`
+-  `Installing multiple versions of the same library`_
 
 Including Static Library Files
 ==============================
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 9629dc5329..bd07896cab 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -123,18 +123,15 @@ name and version (after variable expansion)::
 
    LICENSE_FLAGS = "license_${PN}_${PV}"
 
-In order for a component restricted by a
-:term:`LICENSE_FLAGS` definition to be enabled and included in an image, it
-needs to have a matching entry in the global
-:term:`LICENSE_FLAGS_ACCEPTED`
-variable, which is a variable typically defined in your ``local.conf``
-file. For example, to enable the
-``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
-could add either the string "commercial_gst-plugins-ugly" or the more
-general string "commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
-":ref:`dev-manual/licenses:license flag matching`" section for a full
-explanation of how :term:`LICENSE_FLAGS` matching works. Here is the
-example::
+In order for a component restricted by a :term:`LICENSE_FLAGS` definition to be
+enabled and included in an image, it needs to have a matching entry in the
+global :term:`LICENSE_FLAGS_ACCEPTED` variable, which is a variable typically
+defined in your ``local.conf`` file. For example, to enable the
+``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you could
+add either the string "commercial_gst-plugins-ugly" or the more general string
+"commercial" to :term:`LICENSE_FLAGS_ACCEPTED`. See the
+"`License Flag Matching`_" section for a full explanation of how
+:term:`LICENSE_FLAGS` matching works. Here is the example::
 
    LICENSE_FLAGS_ACCEPTED = "commercial_gst-plugins-ugly"
 
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 1ed217be7f..ba87a16870 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -42,8 +42,7 @@ that can help you quickly get started with a new recipe:
 
 .. note::
 
-   For information on recipe syntax, see the
-   ":ref:`dev-manual/new-recipe:recipe syntax`" section.
+   For information on recipe syntax, see the "`Recipe Syntax`_" section.
 
 Creating the Base Recipe Using ``devtool add``
 ----------------------------------------------
@@ -284,11 +283,10 @@ comes from a single tarball. Notice the use of the
    SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
 
 Files mentioned in :term:`SRC_URI` whose names end in a typical archive
-extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
-forth), are automatically extracted during the
-:ref:`ref-tasks-unpack` task. For
+extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so forth),
+are automatically extracted during the :ref:`ref-tasks-unpack` task. For
 another example that specifies these types of files, see the
-":ref:`dev-manual/new-recipe:building an autotooled package`" section.
+"`Building an Autotooled Package`_" section.
 
 Another way of specifying source is from an SCM. For Git repositories,
 you must specify :term:`SRCREV` and you should specify :term:`PV` to include
@@ -367,7 +365,7 @@ The previous example also specifies a patch file. Patch files are files
 whose names usually end in ``.patch`` or ``.diff`` but can end with
 compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
 The build system automatically applies patches as described in the
-":ref:`dev-manual/new-recipe:patching code`" section.
+"`Patching Code`_" section.
 
 Fetching Code Through Firewalls
 -------------------------------
@@ -472,8 +470,7 @@ variables:
    appropriate files in the :term:`LIC_FILES_CHKSUM` variable with incorrect
    md5 strings, attempt to build the software, and then note the
    resulting error messages that will report the correct md5 strings.
-   See the ":ref:`dev-manual/new-recipe:fetching code`" section for
-   additional information.
+   See the "`Fetching Code`_" section for additional information.
 
    Here is an example that assumes the software has a ``COPYING`` file::
 
@@ -692,7 +689,7 @@ Here are some common issues that cause failures.
    For cases where improper paths are detected for configuration files
    or for when libraries/headers cannot be found, be sure you are using
    the more robust ``pkg-config``. See the note in section
-   ":ref:`dev-manual/new-recipe:Configuring the Recipe`" for additional information.
+   "`Configuring the Recipe`_" for additional information.
 
 -  *Parallel build failures:* These failures manifest themselves as
    intermittent errors, or errors reporting that a file or directory
@@ -776,7 +773,7 @@ the software being built:
    ``PREFIX=${D}``, ``INSTALLROOT=${D}``, and so forth).
 
    For an example recipe using ``make install``, see the
-   ":ref:`dev-manual/new-recipe:building a makefile-based package`" section.
+   "`Building a Makefile-based Package`_" section.
 
 -  *Manual:* You need to define a :ref:`ref-tasks-install` function in your
    recipe. The function must first use ``install -d`` to create the
@@ -905,12 +902,11 @@ take. The following list describes the process:
 
 -  *Splitting an Application into Multiple Packages*: If you need to
    split an application into several packages, see the
-   ":ref:`dev-manual/new-recipe:splitting an application into multiple packages`"
-   section for an example.
+   "`Splitting an Application Into Multiple Packages`_" section for an example.
 
 -  *Installing a Post-Installation Script*: For an example showing how
    to install a post-installation script, see the
-   ":ref:`dev-manual/new-recipe:post-installation scripts`" section.
+   "`Post-Installation Scripts`_" section.
 
 -  *Marking Package Architecture*: Depending on what your recipe is
    building and how it is configured, it might be important to mark the
@@ -1075,7 +1071,7 @@ Properly Versioning Pre-Release Recipes
 Sometimes the name of a recipe can lead to versioning problems when the
 recipe is upgraded to a final release. For example, consider the
 ``irssi_0.8.16-rc1.bb`` recipe file in the list of example recipes in
-the ":ref:`dev-manual/new-recipe:storing and naming the recipe`" section.
+the "`Storing and Naming the Recipe`_" section.
 This recipe is at a release candidate stage (i.e. "rc1"). When the recipe is
 released, the recipe filename becomes ``irssi_0.8.16.bb``. The version
 change from ``0.8.16-rc1`` to ``0.8.16`` is seen as a decrease by the
@@ -1209,8 +1205,7 @@ case --- the directory BitBake uses for the build::
 
 By default, the ``helloworld``, ``helloworld-dbg``, and ``helloworld-dev`` packages
 are built. For information on how to customize the packaging process, see the
-":ref:`dev-manual/new-recipe:splitting an application into multiple packages`"
-section.
+"`Splitting an Application Into Multiple Packages`_" section.
 
 Building a Makefile-Based Package
 ---------------------------------
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 0c584c177a..0b7f3d716a 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -5,22 +5,21 @@ Working with Packages
 
 This section describes a few tasks that involve packages:
 
--  :ref:`dev-manual/packages:excluding packages from an image`
+-  `Excluding packages from an image`_
 
--  :ref:`dev-manual/packages:incrementing a package version`
+-  `Incrementing a package version`_
 
--  :ref:`dev-manual/packages:handling optional module packaging`
+-  `Handling optional module packaging`_
 
--  :ref:`dev-manual/packages:using runtime package management`
+-  `Using runtime package management`_
 
--  :ref:`dev-manual/packages:generating and using signed packages`
+-  `Generating and using signed packages`_
 
--  :ref:`Setting up and running package test
-   (ptest) <dev-manual/packages:testing packages with ptest>`
+-  `Testing packages with ptest`_
 
--  :ref:`dev-manual/packages:creating node package manager (npm) packages`
+-  `Creating Node Package Manager (NPM) packages`_
 
--  :ref:`dev-manual/packages:adding custom metadata to packages`
+-  `Adding custom metadata to packages`_
 
 Excluding Packages from an Image
 ================================
@@ -110,8 +109,7 @@ requirement is that binary package version numbering increases in a
 linear fashion and that there is a number of version components that
 support that linear progression. For information on how to ensure
 package revisioning remains linear, see the
-":ref:`dev-manual/packages:automatically incrementing a package version number`"
-section.
+"`Automatically Incrementing a Package Version Number`_" section.
 
 The following three sections provide related information on the PR
 Service, the manual method for "bumping" :term:`PR` and/or :term:`PV`, and on
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index d431ea4b99..fe117984fd 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -123,8 +123,7 @@ available. Follow these general steps to run QEMU:
       enable audio in QEMU. For this case, ``runqemu`` sets the internal
       variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
       an appropriate driver must be installed (see the ``audio`` option
-      in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options`
-      for more information)::
+      in "`runqemu Command-Line Options`_" for more information)::
 
          $ runqemu qemux86-64 ramfs audio
 
@@ -293,8 +292,7 @@ present, the toolchain is also automatically used.
       tarball by using the ``runqemu-extract-sdk`` command. After
       running the command, you must then point the ``runqemu`` script to
       the extracted directory instead of a root filesystem image file.
-      See the
-      ":ref:`dev-manual/qemu:running under a network file system (nfs) server`"
+      See the "`Running Under a Network File System (NFS) Server`_"
       section for more information.
 
 QEMU Command-Line Syntax
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index c5c5653bef..98822b0f0e 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -150,8 +150,7 @@ options are available:
    it the same IP address for each reboot.
 
    If you choose "SystemdbootTarget", there are additional requirements
-   and considerations. See the
-   ":ref:`dev-manual/runtime-testing:selecting systemdboottarget`" section, which
+   and considerations. See the "`Selecting systemdboottarget`_" section, which
    follows, for more information.
 
 -  *"BeagleBoneTarget":* Choose "BeagleBoneTarget" if you are deploying
@@ -183,7 +182,7 @@ Selecting SystemdbootTarget
 
 If you did not set :term:`TEST_TARGET` to "SystemdbootTarget", then you do
 not need any information in this section. You can skip down to the
-":ref:`dev-manual/runtime-testing:running tests`" section.
+"`Running Tests`_" section.
 
 If you did set :term:`TEST_TARGET` to "SystemdbootTarget", you also need to
 perform a one-time setup of your controller image by doing the following:
diff --git a/documentation/dev-manual/securing-images.rst b/documentation/dev-manual/securing-images.rst
index 6a9223c19c..3bbae8a31c 100644
--- a/documentation/dev-manual/securing-images.rst
+++ b/documentation/dev-manual/securing-images.rst
@@ -72,7 +72,7 @@ more secure:
 
 -  Ensure you remove or disable debugging functionality before producing
    the final image. For information on how to do this, see the
-   ":ref:`dev-manual/securing-images:considerations specific to the openembedded build system`"
+   "`Considerations Specific to the OpenEmbedded Build System`_"
    section.
 
 -  Ensure you have no network services listening that are not needed.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 498734a04d..8aeb2aef07 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -6,8 +6,7 @@ Setting Up to Use the Yocto Project
 
 This chapter provides guidance on how to prepare to use the Yocto
 Project. You can learn about creating a team environment to develop
-using the Yocto Project, how to set up a :ref:`build
-host <dev-manual/start:preparing the build host>`, how to locate
+using the Yocto Project, about `preparing the build host`_, how to locate
 Yocto Project source repositories, and how to create local Git
 repositories.
 
@@ -228,9 +227,8 @@ particular working environment and set of practices.
 
     -  Separate the project's Metadata and code by using separate Git
        repositories. See the ":ref:`overview-manual/development-environment:yocto project source repositories`"
-       section in the Yocto Project Overview and Concepts Manual for
-       information on these repositories. See the
-       ":ref:`dev-manual/start:locating yocto project source files`"
+       section in the Yocto Project Overview and Concepts Manual for information
+       on these repositories. See the "`Locating Yocto Project Source Files`_"
        section for information on how to set up local Git repositories
        for related upstream Yocto Project Git repositories.
 
@@ -338,16 +336,14 @@ Project Build Host:
    ":ref:`ref-manual/system-requirements:required packages for the build host`"
    section in the Yocto Project Reference Manual.
 
-Once you have completed the previous steps, you are ready to continue
-using a given development path on your native Linux machine. If you are
-going to use BitBake, see the
-":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
-section. If you are going
-to use the Extensible SDK, see the ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
-Project Application Development and the Extensible Software Development
-Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/kernel-dev/index`. If you are going to use
-Toaster, see the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+Once you have completed the previous steps, you are ready to continue using a
+given development path on your native Linux machine. If you are going to use
+BitBake, see the "`Cloning the poky Repository`_" section. If you are going
+to use the Extensible SDK, see the ":doc:`/sdk-manual/extensible`" Chapter in
+the Yocto Project Application Development and the Extensible Software
+Development Kit (eSDK) manual. If you want to work on the kernel, see the
+:doc:`/kernel-dev/index`. If you are going to use Toaster, see the
+":doc:`/toaster-manual/setup-and-use`" section in the Toaster User Manual.
 
 Setting Up to Use CROss PlatformS (CROPS)
 -----------------------------------------
@@ -432,8 +428,7 @@ as your Yocto Project build host:
 
 Once you have a container set up, everything is in place to develop just
 as if you were running on a native Linux machine. If you are going to
-use the Poky container, see the
-":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
+use the Poky container, see the "`Cloning the poky Repository`_"
 section. If you are going to use the Extensible SDK container, see the
 ":doc:`/sdk-manual/extensible`" Chapter in the Yocto
 Project Application Development and the Extensible Software Development
@@ -588,7 +583,7 @@ files you'll need to work with the Yocto Project.
 Accessing Source Repositories
 -----------------------------
 
-Working from a copy of the upstream :ref:`dev-manual/start:accessing source repositories` is the
+Working from a copy of the upstream source repositories is the
 preferred method for obtaining and using a Yocto Project release. You
 can view the Yocto Project Source Repositories at
 :yocto_git:`/`. In particular, you can find the ``poky``
@@ -611,7 +606,7 @@ Use the following procedure to locate the latest upstream copy of the
    .. note::
 
       For information on cloning a repository, see the
-      ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`" section.
+      "`Cloning the poky Repository`_" section.
 
 Accessing Index of Releases
 ---------------------------
@@ -659,7 +654,7 @@ The :yocto_home:`Yocto Project Website <>` uses a "DOWNLOADS" page
 from which you can locate and download tarballs of any Yocto Project
 release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
-described in the ":ref:`dev-manual/start:accessing index of releases`" section.
+described in the "`Accessing Index of Releases`_" section.
 
 #. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
@@ -728,9 +723,8 @@ Follow these steps to create a local version of the upstream
    "master" branch, which results in a snapshot of the latest
    development changes for "master". For information on how to check out
    a specific development branch or on how to check out a local branch
-   based on a tag name, see the
-   ":ref:`dev-manual/start:checking out by branch in poky`" and
-   ":ref:`dev-manual/start:checking out by tag in poky`" sections, respectively.
+   based on a tag name, see the "`Checking Out by Branch in Poky`_" and
+   "`Checking Out by Tag in Poky`_" sections, respectively.
 
    Once the local repository is created, you can change to that
    directory and check its status. The ``master`` branch is checked out
@@ -768,9 +762,7 @@ and then specifically check out that development branch.
 
 #. *Switch to the Poky Directory:* If you have a local poky Git
    repository, switch to that directory. If you do not have the local
-   copy of poky, see the
-   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
-   section.
+   copy of poky, see the "`Cloning the poky Repository`_" section.
 
 #. *Determine Existing Branch Names:*
    ::
@@ -829,8 +821,7 @@ similar to checking out by branch name except you use tag names.
 
 #. *Switch to the Poky Directory:* If you have a local poky Git
    repository, switch to that directory. If you do not have the local
-   copy of poky, see the
-   ":ref:`dev-manual/start:cloning the \`\`poky\`\` repository`"
+   copy of poky, see the "`Cloning the poky Repository`_"
    section.
 
 #. *Fetch the Tag Names:* To checkout the branch based on a tag name,
-- 
2.37.2


