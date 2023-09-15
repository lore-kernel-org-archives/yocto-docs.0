Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FFFEE645C
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 13:05:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.20001.1694783123702663974
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 06:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XBQm37RB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22CAC1C0004;
	Fri, 15 Sep 2023 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694783121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=56T5X20c9fU5Z/CVQ8tTEuL1sEw/zwPE9PMaVpGyohM=;
	b=XBQm37RBcSB/E92JxPR3+qhgLNMfIqspdJt5GTs2oxlhWSGyTy/yNbz/D3petNqaRaok5+
	BIcQkmmtQ6nMVhIUv+k7K6II6OWD8r43fVrGLUpP4cWpD9yQuWetkXwfkavbhF0PA4v01E
	05Mp/ytxcy7doyB37fEM4kKqZJiJGOEzfOCClRx1aBsLHsmXnLm21AeeP/Uvpay1AZZDLj
	Me7nIkGcMLn/kxLL6jNdqnaDl8Y14Rc3dAFNjGftrkPBM3KcUqUNc+C52O9RFpNNH9oySZ
	tofQ/uW5O1+6iFvbKEwMppiLBe3uTwmos2ROSQ3CRcR0AcOz3oFdOJlQyksxBA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] sdk-manual: extensible.rst: fix multiple formatting issues
Date: Fri, 15 Sep 2023 15:05:18 +0200
Message-Id: <20230915130518.3272212-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Sep 2023 13:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4217

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Take advantage of this edit to also fix alignment
issues in the sources.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/extensible.rst | 254 ++++++++++--------------
 1 file changed, 108 insertions(+), 146 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 9e08e57a4e..355c6cb0e4 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -48,18 +48,20 @@ Extensible SDK can be installed in two different ways, and both have
 their own pros and cons:
 
 #. *Setting up the Extensible SDK environment directly in a Yocto build*. This
-avoids having to produce, test, distribute and maintain separate SDK installer
-archives, which can get very large. There is only one environment for the regular
-Yocto build and the SDK and less code paths where things can go not according to plan.
-It's easier to update the SDK: it simply means updating the Yocto layers with
-git fetch or layer management tooling. The SDK extensibility is better than in the
-second option: just run ``bitbake`` again to add more things to the sysroot, or add layers
-if even more things are required.
-
-#. *Setting up the Extensible SDK from a standalone installer*. This has the benefit of
-having a single, self-contained archive that includes all the needed binary artifacts.
-So nothing needs to be rebuilt, and there is no need to provide a well-functioning
-binary artefact cache over the network for developers with underpowered laptops.
+   avoids having to produce, test, distribute and maintain separate SDK
+   installer archives, which can get very large. There is only one environment
+   for the regular Yocto build and the SDK and less code paths where things can
+   go not according to plan. It's easier to update the SDK: it simply means
+   updating the Yocto layers with git fetch or layer management tooling. The
+   SDK extensibility is better than in the second option: just run ``bitbake``
+   again to add more things to the sysroot, or add layers if even more things
+   are required.
+
+#. *Setting up the Extensible SDK from a standalone installer*. This has the
+   benefit of having a single, self-contained archive that includes all the
+   needed binary artifacts. So nothing needs to be rebuilt, and there is no
+   need to provide a well-functioning binary artefact cache over the network
+   for developers with underpowered laptops.
 
 Setting up the Extensible SDK environment directly in a Yocto build
 -------------------------------------------------------------------
@@ -67,12 +69,12 @@ Setting up the Extensible SDK environment directly in a Yocto build
 #. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
    build where ``bitbake`` can be executed.
 
-#. Run:
-    $ bitbake meta-ide-support
-    $ bitbake -c populate_sysroot gtk+3
-    (or any other target or native item that the application developer would need)
-    $ bitbake build-sysroots
+#. Run::
 
+      $ bitbake meta-ide-support
+      $ bitbake -c populate_sysroot gtk+3
+      # or any other target or native item that the application developer would need
+      $ bitbake build-sysroots
 
 Setting up the Extensible SDK from a standalone installer
 ---------------------------------------------------------
@@ -194,15 +196,13 @@ script is for an IA-based target machine using i586 tuning::
    Run devtool --help for further details.
 
 When using the environment script directly in a Yocto build, it can
-be run similarly:
+be run similarly::
 
    $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
 
-Running the setup script defines many environment variables needed in
-order to use the SDK (e.g. ``PATH``,
-:term:`CC`,
-:term:`LD`, and so forth). If you want to
-see all the environment variables the script exports, examine the
+Running the setup script defines many environment variables needed in order to
+use the SDK (e.g. ``PATH``, :term:`CC`, :term:`LD`, and so forth). If you want
+to see all the environment variables the script exports, examine the
 installation file itself.
 
 Using ``devtool`` in Your SDK Workflow
@@ -216,11 +216,8 @@ system.
 
 .. note::
 
-   The use of
-   devtool
-   is not limited to the extensible SDK. You can use
-   devtool
-   to help you easily develop any project whose build output must be
+   The use of ``devtool`` is not limited to the extensible SDK. You can use
+   ``devtool`` to help you easily develop any project whose build output must be
    part of an image built using the build system.
 
 The ``devtool`` command line is organized similarly to
@@ -230,15 +227,10 @@ all the commands.
 
 .. note::
 
-   See the "
-   devtool
-    Quick Reference
-   " in the Yocto Project Reference Manual for a
-   devtool
-   quick reference.
+   See the ":doc:`/ref-manual/devtool-reference`"
+   section in the Yocto Project Reference Manual.
 
-Three ``devtool`` subcommands provide entry-points into
-development:
+Three ``devtool`` subcommands provide entry-points into development:
 
 -  *devtool add*: Assists in adding new software to be built.
 
@@ -315,9 +307,8 @@ command:
 
       .. note::
 
-         If required,
-         devtool
-         always creates a Git repository locally during the extraction.
+         If required, ``devtool`` always creates a Git repository locally
+         during the extraction.
 
       Furthermore, the first positional argument ``srctree`` in this case
       identifies where the ``devtool add`` command will locate the
@@ -326,8 +317,7 @@ command:
 
          $ devtool add recipe srctree fetchuri
 
-      In summary,
-      the source code is pulled from fetchuri and extracted into the
+      In summary, the source code is pulled from fetchuri and extracted into the
       location defined by ``srctree`` as a local Git repository.
 
       Within workspace, ``devtool`` creates a recipe named recipe along
@@ -358,16 +348,14 @@ command:
 
       $ devtool edit-recipe recipe
 
-   From within the editor, you
-   can make modifications to the recipe that take effect when you build
-   it later.
+   From within the editor, you can make modifications to the recipe that
+   take effect when you build it later.
 
 #. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
-   hardware, use the following ``devtool`` command:
-   :;
+   hardware, use the following ``devtool`` command::
 
       $ devtool build recipe
 
@@ -392,8 +380,11 @@ command:
       development machine.
 
    You can deploy your build output to that target hardware by using the
-   ``devtool deploy-target`` command: $ devtool deploy-target recipe
-   target The target is a live target machine running as an SSH server.
+   ``devtool deploy-target`` command::
+
+      $ devtool deploy-target recipe target
+
+   The target is a live target machine running as an SSH server.
 
    You can, of course, also deploy the image you build to actual
    hardware by using the ``devtool build-image`` command. However,
@@ -422,11 +413,9 @@ command:
 
    .. note::
 
-      You can use the
-      devtool reset
-      command to put things back should you decide you do not want to
-      proceed with your work. If you do use this command, realize that
-      the source tree is preserved.
+      You can use the ``devtool reset`` command to put things back should you
+      decide you do not want to proceed with your work. If you do use this
+      command, realize that the source tree is preserved.
 
 Use ``devtool modify`` to Modify the Source of an Existing Component
 --------------------------------------------------------------------
@@ -473,11 +462,9 @@ command:
 
          $ devtool modify recipe
 
-      Once
-      ``devtool``\ locates the recipe, ``devtool`` uses the recipe's
-      :term:`SRC_URI` statements to
-      locate the source code and any local patch files from other
-      developers.
+      Once ``devtool`` locates the recipe, ``devtool`` uses the recipe's
+      :term:`SRC_URI` statements to locate the source code and any local
+      patch files from other developers.
 
       With this scenario, there is no ``srctree`` argument. Consequently, the
       default behavior of the ``devtool modify`` command is to extract
@@ -513,11 +500,7 @@ command:
 
       .. note::
 
-         You cannot provide a URL for
-         srctree
-         using the
-         devtool
-         command.
+         You cannot provide a URL for ``srctree`` using the ``devtool`` command.
 
       As with all extractions, the command uses the recipe's :term:`SRC_URI`
       statements to locate the source files and any associated patch
@@ -570,7 +553,9 @@ command:
    On the other hand, if you want an image to contain the recipe's
    packages from the workspace for immediate deployment onto a device
    (e.g. for testing purposes), you can use the ``devtool build-image``
-   command: $ devtool build-image image
+   command::
+
+      $ devtool build-image image
 
 #. *Deploy the Build Output*: When you use the ``devtool build`` command
    to build out your recipe, you probably want to see if the resulting
@@ -610,8 +595,7 @@ command:
 
       Any changes you want to turn into patches must be staged and
       committed within the local Git repository before you use the
-      devtool finish
-      command.
+      ``devtool finish`` command.
 
    Because there is no need to move the recipe, ``devtool finish``
    either updates the original recipe in the original layer or the
@@ -626,11 +610,9 @@ command:
 
    .. note::
 
-      You can use the
-      devtool reset
-      command to put things back should you decide you do not want to
-      proceed with your work. If you do use this command, realize that
-      the source tree is preserved.
+      You can use the ``devtool reset`` command to put things back should you
+      decide you do not want to proceed with your work. If you do use this
+      command, realize that the source tree is preserved.
 
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
@@ -644,12 +626,11 @@ counterparts.
 
 .. note::
 
-   Several methods exist by which you can upgrade recipes -
-   ``devtool upgrade``
-   happens to be one. You can read about all the methods by which you
-   can upgrade recipes in the
-   :ref:`dev-manual/upgrading-recipes:upgrading recipes` section
-   of the Yocto Project Development Tasks Manual.
+   Several methods exist by which you can upgrade recipes ---
+   ``devtool upgrade`` happens to be one. You can read about all the methods by
+   which you can upgrade recipes in the
+   :ref:`dev-manual/upgrading-recipes:upgrading recipes` section of the Yocto
+   Project Development Tasks Manual.
 
 The ``devtool upgrade`` command is flexible enough to allow you to specify
 source code revision and versioning schemes, extract code into or out of the
@@ -755,8 +736,11 @@ The following diagram shows the common development flow used with the
       development machine.
 
    You can deploy your build output to that target hardware by using the
-   ``devtool deploy-target`` command: $ devtool deploy-target recipe
-   target The target is a live target machine running as an SSH server.
+   ``devtool deploy-target`` command::
+
+      $ devtool deploy-target recipe target
+
+   The target is a live target machine running as an SSH server.
 
    You can, of course, also deploy the image you build using the
    ``devtool build-image`` command to actual hardware. However,
@@ -790,11 +774,9 @@ The following diagram shows the common development flow used with the
 
    .. note::
 
-      You can use the
-      devtool reset
-      command to put things back should you decide you do not want to
-      proceed with your work. If you do use this command, realize that
-      the source tree is preserved.
+      You can use the ``devtool reset`` command to put things back should you
+      decide you do not want to proceed with your work. If you do use this
+      command, realize that the source tree is preserved.
 
 A Closer Look at ``devtool add``
 ================================
@@ -862,10 +844,9 @@ run ``devtool add`` again and provide the name or the version.
 Dependency Detection and Mapping
 --------------------------------
 
-The ``devtool add`` command attempts to detect build-time dependencies
-and map them to other recipes in the system. During this mapping, the
-command fills in the names of those recipes as part of the
-:term:`DEPENDS` variable within the
+The ``devtool add`` command attempts to detect build-time dependencies and map
+them to other recipes in the system. During this mapping, the command fills in
+the names of those recipes as part of the :term:`DEPENDS` variable within the
 recipe. If a dependency cannot be mapped, ``devtool`` places a comment
 in the recipe indicating such. The inability to map a dependency can
 result from naming not being recognized or because the dependency simply
@@ -882,10 +863,8 @@ following to your recipe::
 
 .. note::
 
-   The
-   devtool add
-   command often cannot distinguish between mandatory and optional
-   dependencies. Consequently, some of the detected dependencies might
+   The ``devtool add`` command often cannot distinguish between mandatory and
+   optional dependencies. Consequently, some of the detected dependencies might
    in fact be optional. When in doubt, consult the documentation or the
    configure script for the software the recipe is building for further
    details. In some cases, you might find you can substitute the
@@ -895,16 +874,14 @@ following to your recipe::
 License Detection
 -----------------
 
-The ``devtool add`` command attempts to determine if the software you
-are adding is able to be distributed under a common, open-source
-license. If so, the command sets the
-:term:`LICENSE` value accordingly.
+The ``devtool add`` command attempts to determine if the software you are
+adding is able to be distributed under a common, open-source license. If
+so, the command sets the :term:`LICENSE` value accordingly.
 You should double-check the value added by the command against the
 documentation or source files for the software you are building and, if
 necessary, update that :term:`LICENSE` value.
 
-The ``devtool add`` command also sets the
-:term:`LIC_FILES_CHKSUM`
+The ``devtool add`` command also sets the :term:`LIC_FILES_CHKSUM`
 value to point to all files that appear to be license-related. Realize
 that license statements often appear in comments at the top of source
 files or within the documentation. In such cases, the command does not
@@ -984,10 +961,9 @@ mind:
 Adding Native Tools
 -------------------
 
-Often, you need to build additional tools that run on the :term:`Build
-Host` as opposed to
-the target. You should indicate this requirement by using one of the
-following methods when you run ``devtool add``:
+Often, you need to build additional tools that run on the :term:`Build Host`
+as opposed to the target. You should indicate this requirement by using one of
+the following methods when you run ``devtool add``:
 
 -  Specify the name of the recipe such that it ends with "-native".
    Specifying the name like this produces a recipe that only builds for
@@ -1011,8 +987,7 @@ Adding Node.js Modules
 ----------------------
 
 You can use the ``devtool add`` command two different ways to add
-Node.js modules: 1) Through ``npm`` and, 2) from a repository or local
-source.
+Node.js modules: through ``npm`` or from a repository or local source.
 
 Use the following form to add Node.js modules through ``npm``::
 
@@ -1027,7 +1002,7 @@ these behaviors ensure the reproducibility and integrity of the build.
 
 .. note::
 
-   -  You must use quotes around the URL. The ``devtool add`` does not
+   -  You must use quotes around the URL. ``devtool add`` does not
       require the quotes, but the shell considers ";" as a splitter
       between multiple commands. Thus, without the quotes,
       ``devtool add`` does not receive the other parts, which results in
@@ -1042,9 +1017,8 @@ repository or local source tree. To add modules this way, use
 
    $ devtool add https://github.com/diversario/node-ssdp
 
-In this example, ``devtool``
-fetches the specified Git repository, detects the code as Node.js code,
-fetches dependencies using ``npm``, and sets
+In this example, ``devtool`` fetches the specified Git repository, detects the
+code as Node.js code, fetches dependencies using ``npm``, and sets
 :term:`SRC_URI` accordingly.
 
 Working With Recipes
@@ -1121,18 +1095,13 @@ Setting Configure Arguments
 
 If the software your recipe is building uses GNU autoconf, then a fixed
 set of arguments is passed to it to enable cross-compilation plus any
-extras specified by
-:term:`EXTRA_OECONF` or
-:term:`PACKAGECONFIG_CONFARGS`
+extras specified by :term:`EXTRA_OECONF` or :term:`PACKAGECONFIG_CONFARGS`
 set within the recipe. If you wish to pass additional options, add them
 to :term:`EXTRA_OECONF` or :term:`PACKAGECONFIG_CONFARGS`. Other supported build
-tools have similar variables (e.g.
-:term:`EXTRA_OECMAKE` for
-CMake, :term:`EXTRA_OESCONS`
-for Scons, and so forth). If you need to pass anything on the ``make``
-command line, you can use :term:`EXTRA_OEMAKE` or the
-:term:`PACKAGECONFIG_CONFARGS`
-variables to do so.
+tools have similar variables (e.g.  :term:`EXTRA_OECMAKE` for CMake,
+:term:`EXTRA_OESCONS` for Scons, and so forth). If you need to pass anything on
+the ``make`` command line, you can use :term:`EXTRA_OEMAKE` or the
+:term:`PACKAGECONFIG_CONFARGS` variables to do so.
 
 You can use the ``devtool configure-help`` command to help you set the
 arguments listed in the previous paragraph. The command determines the
@@ -1156,8 +1125,7 @@ the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
 files should be installed into standard locations during the
-:ref:`ref-tasks-install` task within
-the ``${``\ :term:`D`\ ``}`` directory. A
+:ref:`ref-tasks-install` task within the ``${``\ :term:`D`\ ``}`` directory. A
 subset of these files automatically goes into the sysroot. The reason
 for this limitation is that almost all files that go into the sysroot
 are cataloged in manifests in order to ensure they can be removed later
@@ -1173,14 +1141,12 @@ the target device, it is important to understand packaging because the
 contents of the image are expressed in terms of packages and not
 recipes.
 
-During the :ref:`ref-tasks-package`
-task, files installed during the
-:ref:`ref-tasks-install` task are
-split into one main package, which is almost always named the same as
-the recipe, and into several other packages. This separation exists
-because not all of those installed files are useful in every image. For
-example, you probably do not need any of the documentation installed in
-a production image. Consequently, for each recipe the documentation
+During the :ref:`ref-tasks-package` task, files installed during the
+:ref:`ref-tasks-install` task are split into one main package, which is almost
+always named the same as the recipe, and into several other packages. This
+separation exists because not all of those installed files are useful in every
+image. For example, you probably do not need any of the documentation installed
+in a production image. Consequently, for each recipe the documentation
 files are separated into a ``-doc`` package. Recipes that package
 software containing optional modules or plugins might undergo additional
 package splitting as well.
@@ -1188,8 +1154,7 @@ package splitting as well.
 After building a recipe, you can see where files have gone by looking in
 the ``oe-workdir/packages-split`` directory, which contains a
 subdirectory for each package. Apart from some advanced cases, the
-:term:`PACKAGES` and
-:term:`FILES` variables controls
+:term:`PACKAGES` and :term:`FILES` variables controls
 splitting. The :term:`PACKAGES` variable lists all of the packages to be
 produced, while the :term:`FILES` variable specifies which files to include
 in each package by using an override to specify the package. For
@@ -1231,16 +1196,11 @@ target machine.
 
 .. note::
 
-   The
-   devtool deploy-target
-   and
-   devtool undeploy-target
-   commands do not currently interact with any package management system
-   on the target device (e.g. RPM or OPKG). Consequently, you should not
-   intermingle
-   devtool deploy-target
-   and package manager operations on the target device. Doing so could
-   result in a conflicting set of files.
+   The ``devtool deploy-target`` and ``devtool undeploy-target`` commands do
+   not currently interact with any package management system on the target
+   device (e.g. RPM or OPKG). Consequently, you should not intermingle
+   ``devtool deploy-target`` and package manager operations on the target
+   device. Doing so could result in a conflicting set of files.
 
 Installing Additional Items Into the Extensible SDK
 ===================================================
@@ -1264,7 +1224,7 @@ When using the extensible SDK directly in a Yocto build
 
 In this scenario, the Yocto build tooling, e.g. ``bitbake``
 is directly accessible to build additional items, and it
-can simply be executed directly:
+can simply be executed directly::
 
    $ bitbake mesa
    $ bitbake build-sysroots
@@ -1272,6 +1232,8 @@ can simply be executed directly:
 When using a standalone installer for the Extensible SDK
 --------------------------------------------------------
 
+::
+
    $ devtool sdk-install mesa
 
 By default, the ``devtool sdk-install`` command assumes
@@ -1297,13 +1259,13 @@ To update your installed SDK, use ``devtool`` as follows::
 
    $ devtool sdk-update
 
-The previous command assumes your SDK provider has set the
-default update URL for you through the :term:`SDK_UPDATE_URL`
-variable as described in the
+The previous command assumes your SDK provider has set the default update URL
+for you through the :term:`SDK_UPDATE_URL` variable as described in the
 ":ref:`sdk-manual/appendix-customizing:Providing Updates to the Extensible SDK After Installation`"
 section. If the SDK provider has not set that default URL, you need to
-specify it yourself in the command as follows: $ devtool sdk-update
-path_to_update_directory
+specify it yourself in the command as follows::
+
+   $ devtool sdk-update path_to_update_directory
 
 .. note::
 
-- 
2.34.1


