Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C48CE79AD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.32190.1695197764550383958
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KneFNWoF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C79DFF80C;
	Wed, 20 Sep 2023 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmt6rdccRiV6HSJewSWHfg/UDhkaEMulrQZpTG0+U1U=;
	b=KneFNWoFdmWPSwEpH0aGbgad3L3e5CXN9L6HU4VRQ3RdVZxbGHX2M2r/1YoAClywI1GWWC
	orqPlOyWFrhun05UZHiP+kGHx6bj1cyyiESWgMGMXbBDvzFvqI1EpyEni1CHwyjgrV0NSC
	4eZmI5hfnrGNd8E4sDiAf3EFSwUoWfDuxy9O+bxChBdYAFhOWZKy+LzbMi/I0khE4eDaEH
	xqMHrRCY89a+yMXNTcVjYMqDu2lBg6ct2hSL+1NZXAU7y/dRqLuBy4beaF0InSnwA8+PXS
	jVe9OhmqXAxXTyotY1DAy/SrXXP4YRviIQpHx5zUTYvCgl8hgt4OPXXPGHbq6A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 01/10] sdk-manual: extensible.rst: align with master branch
Date: Wed, 20 Sep 2023 10:15:35 +0200
Message-Id: <20230920081544.1226760-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4249

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

In particular, this addresses multiple formatting issues.
Aligning with the master branch as all updates apply to
kirkstone too.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/extensible.rst | 389 ++++++++++++------------
 1 file changed, 202 insertions(+), 187 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 18a2b59c96..355c6cb0e4 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -41,6 +41,44 @@ functionality.
 Installing the Extensible SDK
 =============================
 
+Two ways to install the Extensible SDK
+--------------------------------------
+
+Extensible SDK can be installed in two different ways, and both have
+their own pros and cons:
+
+#. *Setting up the Extensible SDK environment directly in a Yocto build*. This
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
+
+Setting up the Extensible SDK environment directly in a Yocto build
+-------------------------------------------------------------------
+
+#. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
+   build where ``bitbake`` can be executed.
+
+#. Run::
+
+      $ bitbake meta-ide-support
+      $ bitbake -c populate_sysroot gtk+3
+      # or any other target or native item that the application developer would need
+      $ bitbake build-sysroots
+
+Setting up the Extensible SDK from a standalone installer
+---------------------------------------------------------
+
 The first thing you need to do is install the SDK on your :term:`Build
 Host` by running the ``*.sh`` installation script.
 
@@ -102,16 +140,7 @@ must be writable for whichever users need to use the SDK.
 The following command shows how to run the installer given a toolchain
 tarball for a 64-bit x86 development host system and a 64-bit x86 target
 architecture. The example assumes the SDK installer is located in
-``~/Downloads/`` and has execution rights.
-
-.. note::
-
-   If you do not have write permissions for the directory into which you
-   are installing the SDK, the installer notifies you and exits. For
-   that case, set up the proper permissions in the directory and run the
-   installer again.
-
-::
+``~/Downloads/`` and has execution rights::
 
    $ ./Downloads/poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-ext-2.5.sh
    Poky (Yocto Project Reference Distro) Extensible SDK installer version 2.5
@@ -132,11 +161,23 @@ architecture. The example assumes the SDK installer is located in
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
     $ . /home/scottrif/poky_sdk/environment-setup-core2-64-poky-linux
 
+.. note::
+
+   If you do not have write permissions for the directory into which you
+   are installing the SDK, the installer notifies you and exits. For
+   that case, set up the proper permissions in the directory and run the
+   installer again.
+
 Running the Extensible SDK Environment Setup Script
 ===================================================
 
 Once you have the SDK installed, you must run the SDK environment setup
-script before you can actually use the SDK. This setup script resides in
+script before you can actually use the SDK.
+
+When using a SDK directly in a Yocto build, you will find the script in
+``tmp/deploy/images/qemux86-64/`` in your :term:`Build Directory`.
+
+When using a standalone SDK installer, this setup script resides in
 the directory you chose when you installed the SDK, which is either the
 default ``poky_sdk`` directory or the directory you chose during
 installation.
@@ -154,11 +195,14 @@ script is for an IA-based target machine using i586 tuning::
    SDK environment now set up; additionally you may now run devtool to perform development tasks.
    Run devtool --help for further details.
 
-Running the setup script defines many environment variables needed in
-order to use the SDK (e.g. ``PATH``,
-:term:`CC`,
-:term:`LD`, and so forth). If you want to
-see all the environment variables the script exports, examine the
+When using the environment script directly in a Yocto build, it can
+be run similarly::
+
+   $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
+
+Running the setup script defines many environment variables needed in order to
+use the SDK (e.g. ``PATH``, :term:`CC`, :term:`LD`, and so forth). If you want
+to see all the environment variables the script exports, examine the
 installation file itself.
 
 Using ``devtool`` in Your SDK Workflow
@@ -172,11 +216,8 @@ system.
 
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
@@ -186,15 +227,10 @@ all the commands.
 
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
 
@@ -233,9 +269,9 @@ shows common development flows you would use with the ``devtool add``
 command:
 
 .. image:: figures/sdk-devtool-add-flow.png
-   :align: center
+   :width: 100%
 
-1. *Generating the New Recipe*: The top part of the flow shows three
+#. *Generating the New Recipe*: The top part of the flow shows three
    scenarios by which you could use ``devtool add`` to generate a recipe
    based on existing source code.
 
@@ -252,7 +288,7 @@ command:
    -  *Left*: The left scenario in the figure represents a common
       situation where the source code does not exist locally and needs
       to be extracted. In this situation, the source code is extracted
-      to the default workspace - you do not want the files in some
+      to the default workspace --- you do not want the files in some
       specific location outside of the workspace. Thus, everything you
       need will be located in the workspace::
 
@@ -267,13 +303,12 @@ command:
    -  *Middle*: The middle scenario in the figure also represents a
       situation where the source code does not exist locally. In this
       case, the code is again upstream and needs to be extracted to some
-      local area - this time outside of the default workspace.
+      local area --- this time outside of the default workspace.
 
       .. note::
 
-         If required,
-         devtool
-         always creates a Git repository locally during the extraction.
+         If required, ``devtool`` always creates a Git repository locally
+         during the extraction.
 
       Furthermore, the first positional argument ``srctree`` in this case
       identifies where the ``devtool add`` command will locate the
@@ -282,8 +317,7 @@ command:
 
          $ devtool add recipe srctree fetchuri
 
-      In summary,
-      the source code is pulled from fetchuri and extracted into the
+      In summary, the source code is pulled from fetchuri and extracted into the
       location defined by ``srctree`` as a local Git repository.
 
       Within workspace, ``devtool`` creates a recipe named recipe along
@@ -302,28 +336,26 @@ command:
       recipe for the code and places the recipe into the workspace.
 
       Because the extracted source code already exists, ``devtool`` does
-      not try to relocate the source code into the workspace - only the
+      not try to relocate the source code into the workspace --- only the
       new recipe is placed in the workspace.
 
       Aside from a recipe folder, the command also creates an associated
       append folder and places an initial ``*.bbappend`` file within.
 
-2. *Edit the Recipe*: You can use ``devtool edit-recipe`` to open up the
+#. *Edit the Recipe*: You can use ``devtool edit-recipe`` to open up the
    editor as defined by the ``$EDITOR`` environment variable and modify
    the file::
 
       $ devtool edit-recipe recipe
 
-   From within the editor, you
-   can make modifications to the recipe that take effect when you build
-   it later.
+   From within the editor, you can make modifications to the recipe that
+   take effect when you build it later.
 
-3. *Build the Recipe or Rebuild the Image*: The next step you take
+#. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
-   hardware, use the following ``devtool`` command:
-   :;
+   hardware, use the following ``devtool`` command::
 
       $ devtool build recipe
 
@@ -334,7 +366,7 @@ command:
 
       $ devtool build-image image
 
-4. *Deploy the Build Output*: When you use the ``devtool build`` command
+#. *Deploy the Build Output*: When you use the ``devtool build`` command
    to build out your recipe, you probably want to see if the resulting
    build output works as expected on the target hardware.
 
@@ -348,20 +380,22 @@ command:
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
    ``devtool`` does not provide a specific command that allows you to
    deploy the image to actual hardware.
 
-5. *Finish Your Work With the Recipe*: The ``devtool finish`` command
+#. *Finish Your Work With the Recipe*: The ``devtool finish`` command
    creates any patches corresponding to commits in the local Git
    repository, moves the new recipe to a more permanent layer, and then
    resets the recipe so that the recipe is built normally rather than
-   from the workspace.
-   ::
+   from the workspace::
 
       $ devtool finish recipe layer
 
@@ -379,11 +413,9 @@ command:
 
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
@@ -401,9 +433,9 @@ diagram shows common development flows for the ``devtool modify``
 command:
 
 .. image:: figures/sdk-devtool-modify-flow.png
-   :align: center
+   :width: 100%
 
-1. *Preparing to Modify the Code*: The top part of the flow shows three
+#. *Preparing to Modify the Code*: The top part of the flow shows three
    scenarios by which you could use ``devtool modify`` to prepare to
    work on source files. Each scenario assumes the following:
 
@@ -430,11 +462,9 @@ command:
 
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
@@ -470,11 +500,7 @@ command:
 
       .. note::
 
-         You cannot provide a URL for
-         srctree
-         using the
-         devtool
-         command.
+         You cannot provide a URL for ``srctree`` using the ``devtool`` command.
 
       As with all extractions, the command uses the recipe's :term:`SRC_URI`
       statements to locate the source files and any associated patch
@@ -512,11 +538,11 @@ command:
       append file for the recipe in the ``devtool`` workspace. The
       recipe and the source code remain in their original locations.
 
-2. *Edit the Source*: Once you have used the ``devtool modify`` command,
+#. *Edit the Source*: Once you have used the ``devtool modify`` command,
    you are free to make changes to the source files. You can use any
    editor you like to make and save your source code modifications.
 
-3. *Build the Recipe or Rebuild the Image*: The next step you take
+#. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
@@ -527,9 +553,11 @@ command:
    On the other hand, if you want an image to contain the recipe's
    packages from the workspace for immediate deployment onto a device
    (e.g. for testing purposes), you can use the ``devtool build-image``
-   command: $ devtool build-image image
+   command::
+
+      $ devtool build-image image
 
-4. *Deploy the Build Output*: When you use the ``devtool build`` command
+#. *Deploy the Build Output*: When you use the ``devtool build`` command
    to build out your recipe, you probably want to see if the resulting
    build output works as expected on target hardware.
 
@@ -554,13 +582,12 @@ command:
    ``devtool`` does not provide a specific command to deploy the image
    to actual hardware.
 
-5. *Finish Your Work With the Recipe*: The ``devtool finish`` command
+#. *Finish Your Work With the Recipe*: The ``devtool finish`` command
    creates any patches corresponding to commits in the local Git
    repository, updates the recipe to point to them (or creates a
    ``.bbappend`` file to do so, depending on the specified destination
    layer), and then resets the recipe so that the recipe is built
-   normally rather than from the workspace.
-   ::
+   normally rather than from the workspace::
 
       $ devtool finish recipe layer
 
@@ -568,8 +595,7 @@ command:
 
       Any changes you want to turn into patches must be staged and
       committed within the local Git repository before you use the
-      devtool finish
-      command.
+      ``devtool finish`` command.
 
    Because there is no need to move the recipe, ``devtool finish``
    either updates the original recipe in the original layer or the
@@ -584,11 +610,9 @@ command:
 
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
@@ -602,27 +626,25 @@ counterparts.
 
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
 
-The ``devtool upgrade`` command is flexible enough to allow you to
-specify source code revision and versioning schemes, extract code into
-or out of the ``devtool``
-:ref:`devtool-the-workspace-layer-structure`,
-and work with any source file forms that the
-:ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers` support.
+The ``devtool upgrade`` command is flexible enough to allow you to specify
+source code revision and versioning schemes, extract code into or out of the
+``devtool`` :ref:`devtool-the-workspace-layer-structure`, and work with any
+source file forms that the
+:ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers` support.
 
 The following diagram shows the common development flow used with the
 ``devtool upgrade`` command:
 
 .. image:: figures/sdk-devtool-upgrade-flow.png
-   :align: center
+   :width: 100%
 
-1. *Initiate the Upgrade*: The top part of the flow shows the typical
+#. *Initiate the Upgrade*: The top part of the flow shows the typical
    scenario by which you use the ``devtool upgrade`` command. The
    following conditions exist:
 
@@ -674,7 +696,7 @@ The following diagram shows the common development flow used with the
    are incorporated into the build the next time you build the software
    just as are other changes you might have made to the source.
 
-2. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
+#. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
    after upgrading the software to a new version. Conflicts occur
    if your recipe specifies some patch files in :term:`SRC_URI` that
    conflict with changes made in the new version of the software. For
@@ -685,7 +707,7 @@ The following diagram shows the common development flow used with the
    conflicts created through use of a newer or different version of the
    software.
 
-3. *Build the Recipe or Rebuild the Image*: The next step you take
+#. *Build the Recipe or Rebuild the Image*: The next step you take
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
@@ -700,7 +722,7 @@ The following diagram shows the common development flow used with the
 
       $ devtool build-image image
 
-4. *Deploy the Build Output*: When you use the ``devtool build`` command
+#. *Deploy the Build Output*: When you use the ``devtool build`` command
    or ``bitbake`` to build your recipe, you probably want to see if the
    resulting build output works as expected on target hardware.
 
@@ -714,15 +736,18 @@ The following diagram shows the common development flow used with the
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
    ``devtool`` does not provide a specific command that allows you to do
    this.
 
-5. *Finish Your Work With the Recipe*: The ``devtool finish`` command
+#. *Finish Your Work With the Recipe*: The ``devtool finish`` command
    creates any patches corresponding to commits in the local Git
    repository, moves the new recipe to a more permanent layer, and then
    resets the recipe so that the recipe is built normally rather than
@@ -734,8 +759,7 @@ The following diagram shows the common development flow used with the
 
    If you specify a destination layer that is the same as the original
    source, then the old version of the recipe and associated files are
-   removed prior to adding the new version.
-   ::
+   removed prior to adding the new version::
 
       $ devtool finish recipe layer
 
@@ -750,11 +774,9 @@ The following diagram shows the common development flow used with the
 
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
@@ -822,10 +844,9 @@ run ``devtool add`` again and provide the name or the version.
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
@@ -842,10 +863,8 @@ following to your recipe::
 
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
@@ -855,16 +874,14 @@ following to your recipe::
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
@@ -944,10 +961,9 @@ mind:
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
@@ -971,8 +987,7 @@ Adding Node.js Modules
 ----------------------
 
 You can use the ``devtool add`` command two different ways to add
-Node.js modules: 1) Through ``npm`` and, 2) from a repository or local
-source.
+Node.js modules: through ``npm`` or from a repository or local source.
 
 Use the following form to add Node.js modules through ``npm``::
 
@@ -987,7 +1002,7 @@ these behaviors ensure the reproducibility and integrity of the build.
 
 .. note::
 
-   -  You must use quotes around the URL. The ``devtool add`` does not
+   -  You must use quotes around the URL. ``devtool add`` does not
       require the quotes, but the shell considers ";" as a splitter
       between multiple commands. Thus, without the quotes,
       ``devtool add`` does not receive the other parts, which results in
@@ -1002,9 +1017,8 @@ repository or local source tree. To add modules this way, use
 
    $ devtool add https://github.com/diversario/node-ssdp
 
-In this example, ``devtool``
-fetches the specified Git repository, detects the code as Node.js code,
-fetches dependencies using ``npm``, and sets
+In this example, ``devtool`` fetches the specified Git repository, detects the
+code as Node.js code, fetches dependencies using ``npm``, and sets
 :term:`SRC_URI` accordingly.
 
 Working With Recipes
@@ -1013,17 +1027,17 @@ Working With Recipes
 When building a recipe using the ``devtool build`` command, the typical
 build progresses as follows:
 
-1. Fetch the source
+#. Fetch the source
 
-2. Unpack the source
+#. Unpack the source
 
-3. Configure the source
+#. Configure the source
 
-4. Compile the source
+#. Compile the source
 
-5. Install the build output
+#. Install the build output
 
-6. Package the installed output
+#. Package the installed output
 
 For recipes in the workspace, fetching and unpacking is disabled as the
 source tree has already been prepared and is persistent. Each of these
@@ -1038,9 +1052,8 @@ does not include complete instructions for building the software.
 Instead, common functionality is encapsulated in classes inherited with
 the ``inherit`` directive. This technique leaves the recipe to describe
 just the things that are specific to the software being built. There is
-a :ref:`base <ref-classes-base>` class that
-is implicitly inherited by all recipes and provides the functionality
-that most recipes typically need.
+a :ref:`ref-classes-base` class that is implicitly inherited by all recipes
+and provides the functionality that most recipes typically need.
 
 The remainder of this section presents information useful when working
 with recipes.
@@ -1066,7 +1079,7 @@ links created within the source tree:
       ``${``\ :term:`D`\ ``}``.
 
    -  ``sysroot-destdir/``: Contains a subset of files installed within
-      ``do_install`` that have been put into the shared sysroot. For
+      :ref:`ref-tasks-install` that have been put into the shared sysroot. For
       more information, see the
       ":ref:`dev-manual/new-recipe:sharing files between recipes`" section.
 
@@ -1082,18 +1095,13 @@ Setting Configure Arguments
 
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
@@ -1117,8 +1125,7 @@ the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
 files should be installed into standard locations during the
-:ref:`ref-tasks-install` task within
-the ``${``\ :term:`D`\ ``}`` directory. A
+:ref:`ref-tasks-install` task within the ``${``\ :term:`D`\ ``}`` directory. A
 subset of these files automatically goes into the sysroot. The reason
 for this limitation is that almost all files that go into the sysroot
 are cataloged in manifests in order to ensure they can be removed later
@@ -1134,14 +1141,12 @@ the target device, it is important to understand packaging because the
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
@@ -1149,8 +1154,7 @@ package splitting as well.
 After building a recipe, you can see where files have gone by looking in
 the ``oe-workdir/packages-split`` directory, which contains a
 subdirectory for each package. Apart from some advanced cases, the
-:term:`PACKAGES` and
-:term:`FILES` variables controls
+:term:`PACKAGES` and :term:`FILES` variables controls
 splitting. The :term:`PACKAGES` variable lists all of the packages to be
 produced, while the :term:`FILES` variable specifies which files to include
 in each package by using an override to specify the package. For
@@ -1192,16 +1196,11 @@ target machine.
 
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
@@ -1215,9 +1214,25 @@ need to link to libGL but you are not sure which recipe provides libGL.
 You can use the following command to find out::
 
    $ devtool search libGL mesa
+   A free implementation of the OpenGL API
+
+Once you know the recipe
+(i.e. ``mesa`` in this example), you can install it.
 
-A free implementation of the OpenGL API Once you know the recipe
-(i.e. ``mesa`` in this example), you can install it::
+When using the extensible SDK directly in a Yocto build
+-------------------------------------------------------
+
+In this scenario, the Yocto build tooling, e.g. ``bitbake``
+is directly accessible to build additional items, and it
+can simply be executed directly::
+
+   $ bitbake mesa
+   $ bitbake build-sysroots
+
+When using a standalone installer for the Extensible SDK
+--------------------------------------------------------
+
+::
 
    $ devtool sdk-install mesa
 
@@ -1244,13 +1259,13 @@ To update your installed SDK, use ``devtool`` as follows::
 
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
 
@@ -1267,15 +1282,15 @@ those customers need an SDK that has custom libraries. In such a case,
 you can produce a derivative SDK based on the currently installed SDK
 fairly easily by following these steps:
 
-1. If necessary, install an extensible SDK that you want to use as a
+#. If necessary, install an extensible SDK that you want to use as a
    base for your derivative SDK.
 
-2. Source the environment script for the SDK.
+#. Source the environment script for the SDK.
 
-3. Add the extra libraries or other components you want by using the
+#. Add the extra libraries or other components you want by using the
    ``devtool add`` command.
 
-4. Run the ``devtool build-sdk`` command.
+#. Run the ``devtool build-sdk`` command.
 
 The previous steps take the recipes added to the workspace and construct
 a new SDK installer that contains those recipes and the resulting binary
-- 
2.34.1


