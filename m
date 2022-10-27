Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1932FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:11:59 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.6213.1666876311933674935
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 06:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L7qWwPRZ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B8A23100005;
	Thu, 27 Oct 2022 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666876310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n1/onFTUQGmlqUqKK76dAzvOLnKXI3YSCoke3MHTNBo=;
	b=L7qWwPRZjONkcQ3LkuPvri+DNrcAhxfVqD+m9LTXoKwokdkNNfb2T1+DDiGjRZIobTfc9J
	P8CZyUiNVkvAMqZFI3d+47LlUh6s30sRX27ZcGOQHzTLNxh4Ug8oNT/xmSI4QuVpwsoWsi
	UW3R0/NGxOf6Dsr91FilpHcVPfeds5riVNjemgh2t8x4LczuE/KpV0JORURikV+f6xXt4q
	zWMu51zSPzoXJnMGULOTMKaO0XkxnLPAs4b22tyJCGNGtXqQeO7L2/ei1E4WR4ZuCxlEPm
	qassSCHMuyDlN0Kgqw00PDROzS0t7sHSxq8u10ySmGniu125mLhko5yFBUnLhg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: use references to the "Build Directory" term
Date: Thu, 27 Oct 2022 15:11:47 +0200
Message-Id: <20221027131147.41434-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Oct 2022 13:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3428

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Replace instances of "Build Directory" and "build directory"
(when applicable) by :term:`Build Directory` as already
done in most places.

Doing this, fix the indentation of the paragraphs with
this term.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst  |  12 +-
 documentation/dev-manual/common-tasks.rst     | 269 ++++++++----------
 documentation/dev-manual/qemu.rst             |  12 +-
 documentation/dev-manual/start.rst            |   4 +-
 documentation/kernel-dev/common.rst           |  45 ++-
 documentation/kernel-dev/concepts-appx.rst    |   3 +-
 documentation/kernel-dev/intro.rst            |   4 +-
 documentation/kernel-dev/maint-appx.rst       |   5 +-
 .../migration-guides/migration-1.5.rst        |   7 +-
 .../migration-guides/migration-1.6.rst        |   4 +-
 .../migration-guides/migration-1.7.rst        |   2 +-
 .../migration-guides/migration-2.6.rst        |   3 +-
 .../migration-guides/migration-general.rst    |   2 +-
 documentation/overview-manual/concepts.rst    |  74 +++--
 .../development-environment.rst               |   8 +-
 documentation/profile-manual/usage.rst        |   4 +-
 documentation/ref-manual/classes.rst          |  11 +-
 documentation/ref-manual/faq.rst              |  17 +-
 documentation/ref-manual/structure.rst        |  33 ++-
 documentation/ref-manual/terms.rst            |  26 +-
 documentation/ref-manual/variables.rst        |  63 ++--
 .../sdk-manual/appendix-customizing.rst       |   5 +-
 documentation/sdk-manual/appendix-obtain.rst  |  23 +-
 documentation/sdk-manual/extensible.rst       |   4 +-
 .../test-manual/understand-autobuilder.rst    |   2 +-
 documentation/toaster-manual/reference.rst    |  11 +-
 .../toaster-manual/setup-and-use.rst          |  19 +-
 27 files changed, 295 insertions(+), 377 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 100022ceba..d322bbca6b 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -224,13 +224,13 @@ an entire Linux distribution, including the toolchain, from source.
 
    Among other things, the script creates the :term:`Build Directory`, which is
    ``build`` in this case and is located in the :term:`Source Directory`.  After
-   the script runs, your current working directory is set to the Build
-   Directory. Later, when the build completes, the Build Directory contains all the
-   files created during the build.
+   the script runs, your current working directory is set to the
+   :term:`Build Directory`. Later, when the build completes, the
+   :term:`Build Directory` contains all the files created during the build.
 
 #. **Examine Your Local Configuration File:** When you set up the build
    environment, a local configuration file named ``local.conf`` becomes
-   available in a ``conf`` subdirectory of the Build Directory. For this
+   available in a ``conf`` subdirectory of the :term:`Build Directory`. For this
    example, the defaults are set to build for a ``qemux86`` target,
    which is suitable for emulation. The package manager used is set to
    the RPM package manager.
@@ -345,9 +345,7 @@ Follow these steps to add a hardware layer:
 
 #. **Add Your Layer to the Layer Configuration File:** Before you can use
    a layer during a build, you must add it to your ``bblayers.conf``
-   file, which is found in the
-   :term:`Build Directory` ``conf``
-   directory.
+   file, which is found in the :term:`Build Directory` ``conf`` directory.
 
    Use the ``bitbake-layers add-layer`` command to add the layer to the
    configuration file:
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 53e7686633..cc1e09675b 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -418,10 +418,10 @@ Enabling Your Layer
 Before the OpenEmbedded build system can use your new layer, you need to
 enable it. To enable your layer, simply add your layer's path to the
 :term:`BBLAYERS` variable in your ``conf/bblayers.conf`` file, which is
-found in the :term:`Build Directory`.
-The following example shows how to enable your new
-``meta-mylayer`` layer (note how your new layer exists outside of
-the official ``poky`` repository which you would have checked out earlier)::
+found in the :term:`Build Directory`. The following example shows how to
+enable your new ``meta-mylayer`` layer (note how your new layer exists
+outside of the official ``poky`` repository which you would have checked
+out earlier)::
 
    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -969,8 +969,7 @@ high-level image features by using the
 variables. Although the functions for both variables are nearly
 equivalent, best practices dictate using :term:`IMAGE_FEATURES` from within
 a recipe and using :term:`EXTRA_IMAGE_FEATURES` from within your
-``local.conf`` file, which is found in the
-:term:`Build Directory`.
+``local.conf`` file, which is found in the :term:`Build Directory`.
 
 To understand how these features work, the best reference is
 :ref:`meta/classes-recipe/image.bbclass <ref-classes-image>`.
@@ -1206,11 +1205,10 @@ application that builds using Autotools. Creating the base recipe using
 ``recipetool`` results in a recipe that has the pre-build dependencies,
 license requirements, and checksums configured.
 
-To run the tool, you just need to be in your
-:term:`Build Directory` and have sourced the
-build environment setup script (i.e.
-:ref:`structure-core-script`).
-To get help on the tool, use the following command::
+To run the tool, you just need to be in your :term:`Build Directory` and
+have sourced the build environment setup script (i.e.
+:ref:`structure-core-script`). To get help on the tool, use the following
+command::
 
    $ recipetool -h
    NOTE: Starting bitbake server...
@@ -1342,8 +1340,7 @@ using BitBake to process the recipe multiple times in order to
 progressively discover and add information to the recipe file.
 
 Assuming you have sourced the build environment setup script (i.e.
-:ref:`structure-core-script`) and you are in
-the :term:`Build Directory`, use
+:ref:`structure-core-script`) and you are in the :term:`Build Directory`, use
 BitBake to process your recipe. All you need to provide is the
 ``basename`` of the recipe as described in the previous section::
 
@@ -1362,7 +1359,7 @@ is to have BitBake return it by running the following::
    $ bitbake -e basename | grep ^WORKDIR=
 
 As an example, assume a Source Directory
-top-level folder named ``poky``, a default Build Directory at
+top-level folder named ``poky``, a default :term:`Build Directory` at
 ``poky/build``, and a ``qemux86-poky-linux`` machine target system.
 Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
 case, the work directory the build system uses to build the package
@@ -3017,15 +3014,14 @@ The following steps describe how to set up the AUH utility:
    AUH is not part of the :term:`OpenEmbedded-Core (OE-Core)` or
    :term:`Poky` repositories.
 
-4. *Create a Dedicated Build Directory:* Run the
-   :ref:`structure-core-script`
-   script to create a fresh build directory that you use exclusively for
-   running the AUH utility::
+4. *Create a Dedicated Build Directory:* Run the :ref:`structure-core-script`
+   script to create a fresh :term:`Build Directory` that you use exclusively
+   for running the AUH utility::
 
       $ cd poky
       $ source oe-init-build-env your_AUH_build_directory
 
-   Re-using an existing build directory and its configurations is not
+   Re-using an existing :term:`Build Directory` and its configurations is not
    recommended as existing settings could cause AUH to fail or behave
    undesirably.
 
@@ -3045,7 +3041,7 @@ The following steps describe how to set up the AUH utility:
       With this configuration and a successful
       upgrade, a build history "diff" file appears in the
       ``upgrade-helper/work/recipe/buildhistory-diff.txt`` file found in
-      your build directory.
+      your :term:`Build Directory`.
 
    -  If you want to enable testing through the
       :ref:`testimage <ref-classes-testimage>`
@@ -3070,7 +3066,7 @@ The following steps describe how to set up the AUH utility:
 
 7. *Create and Edit an AUH Configuration File:* You need to have the
    ``upgrade-helper/upgrade-helper.conf`` configuration file in your
-   build directory. You can find a sample configuration file in the
+   :term:`Build Directory`. You can find a sample configuration file in the
    :yocto_git:`AUH source repository </auto-upgrade-helper/tree/>`.
 
    Read through the sample file and make configurations as needed. For
@@ -3118,7 +3114,7 @@ This next set of examples describes how to use the AUH:
       $ upgrade-helper.py -e all
 
 Once you have run the AUH utility, you can find the results in the AUH
-build directory::
+:term:`Build Directory`::
 
    ${BUILDDIR}/upgrade-helper/timestamp
 
@@ -3179,8 +3175,7 @@ example, assume that the layer has been cloned into following area::
 
    /home/scottrif/meta-openembedded
 
-The following command from your
-:term:`Build Directory` adds the layer to
+The following command from your :term:`Build Directory` adds the layer to
 your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``)::
 
    $ bitbake-layers add-layer /home/scottrif/meta-openembedded/meta-oe
@@ -3341,16 +3336,14 @@ source code used by recipes to build packages. For example, suppose you
 are developing a patch and you need to experiment a bit to figure out
 your solution. After you have initially built the package, you can
 iteratively tweak the source code, which is located in the
-:term:`Build Directory`, and then you can
-force a re-compile and quickly test your altered code. Once you settle
-on a solution, you can then preserve your changes in the form of
-patches.
+:term:`Build Directory`, and then you can force a re-compile and quickly
+test your altered code. Once you settle on a solution, you can then preserve
+your changes in the form of patches.
 
 During a build, the unpacked temporary source code used by recipes to
-build packages is available in the Build Directory as defined by the
-:term:`S` variable. Below is the default
-value for the :term:`S` variable as defined in the
-``meta/conf/bitbake.conf`` configuration file in the
+build packages is available in the :term:`Build Directory` as defined by the
+:term:`S` variable. Below is the default value for the :term:`S` variable as
+defined in the ``meta/conf/bitbake.conf`` configuration file in the
 :term:`Source Directory`::
 
    S = "${WORKDIR}/${BP}"
@@ -3392,7 +3385,7 @@ The actual directory depends on several things:
 -  :term:`PR`: The recipe revision.
 
 As an example, assume a Source Directory top-level folder named
-``poky``, a default Build Directory at ``poky/build``, and a
+``poky``, a default :term:`Build Directory` at ``poky/build``, and a
 ``qemux86-poky-linux`` machine target system. Furthermore, suppose your
 recipe is named ``foo_1.3.0.bb``. In this case, the work directory the
 build system uses to build the package would be as follows::
@@ -3420,8 +3413,7 @@ form of a patch all using Quilt.
 Follow these general steps:
 
 1. *Find the Source Code:* Temporary source code used by the
-   OpenEmbedded build system is kept in the
-   :term:`Build Directory`. See the
+   OpenEmbedded build system is kept in the :term:`Build Directory`. See the
    ":ref:`dev-manual/common-tasks:finding temporary source code`" section to
    learn how to locate the directory that has the temporary source code for a
    particular package.
@@ -3649,10 +3641,10 @@ build host running Linux.
       :doc:`/brief-yoctoprojectqs/index` document.
 
 The build process creates an entire Linux distribution from source and
-places it in your :term:`Build Directory` under
-``tmp/deploy/images``. For detailed information on the build process
-using BitBake, see the ":ref:`overview-manual/concepts:images`" section in the
-Yocto Project Overview and Concepts Manual.
+places it in your :term:`Build Directory` under ``tmp/deploy/images``. For
+detailed information on the build process using BitBake, see the
+":ref:`overview-manual/concepts:images`" section in the Yocto Project Overview
+and Concepts Manual.
 
 The following figure and list overviews the build process:
 
@@ -3672,25 +3664,23 @@ The following figure and list overviews the build process:
    When you use the initialization script, the OpenEmbedded build system
    uses ``build`` as the default :term:`Build Directory` in your current work
    directory. You can use a `build_dir` argument with the script to
-   specify a different build directory.
+   specify a different :term:`Build Directory`.
 
    .. note::
 
-      A common practice is to use a different Build Directory for
+      A common practice is to use a different :term:`Build Directory` for
       different targets; for example, ``~/build/x86`` for a ``qemux86``
       target, and ``~/build/arm`` for a ``qemuarm`` target. In any
-      event, it's typically cleaner to locate the build directory
+      event, it's typically cleaner to locate the :term:`Build Directory`
       somewhere outside of your source directory.
 
 3. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
-   ``conf/local.conf`` configuration file, which is found in the Build
-   Directory, is set up how you want it. This file defines many aspects
-   of the build environment including the target machine architecture
+   ``conf/local.conf`` configuration file, which is found in the
+   :term:`Build Directory`, is set up how you want it. This file defines many
+   aspects of the build environment including the target machine architecture
    through the :term:`MACHINE` variable, the packaging format used during
-   the build
-   (:term:`PACKAGE_CLASSES`),
-   and a centralized tarball download directory through the
-   :term:`DL_DIR` variable.
+   the build (:term:`PACKAGE_CLASSES`), and a centralized tarball download
+   directory through the :term:`DL_DIR` variable.
 
 4. *Build the Image:* Build the image using the ``bitbake`` command::
 
@@ -3718,7 +3708,7 @@ The following figure and list overviews the build process:
    Once an
    image has been built, it often needs to be installed. The images and
    kernels built by the OpenEmbedded build system are placed in the
-   Build Directory in ``tmp/deploy/images``. For information on how to
+   :term:`Build Directory` in ``tmp/deploy/images``. For information on how to
    run pre-built images such as ``qemux86`` and ``qemuarm``, see the
    :doc:`/sdk-manual/index` manual. For
    information about how to install these images, see the documentation
@@ -3772,7 +3762,7 @@ Follow these steps to set up and execute multiple configuration builds:
       TMPDIR = "${TOPDIR}/tmpmultix86"
 
    The location for these multiconfig configuration files is specific.
-   They must reside in the current build directory in a sub-directory of
+   They must reside in the current :term:`Build Directory` in a sub-directory of
    ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
    under a directory named ``multiconfig``. Following is an example that defines
    two configuration files for the "x86" and "arm" multiconfigs:
@@ -4275,15 +4265,13 @@ If build speed and package feed maintenance are considerations, you
 should consider the points in this section that can help you optimize
 your tunings to best consider build times and package feed maintenance.
 
--  *Share the Build Directory:* If at all possible, share the
-   :term:`TMPDIR` across builds. The
-   Yocto Project supports switching between different
-   :term:`MACHINE` values in the same
-   :term:`TMPDIR`. This practice is well supported and regularly used by
-   developers when building for multiple machines. When you use the same
-   :term:`TMPDIR` for multiple machine builds, the OpenEmbedded build system
-   can reuse the existing native and often cross-recipes for multiple
-   machines. Thus, build time decreases.
+-  *Share the :term:`Build Directory`:* If at all possible, share the
+   :term:`TMPDIR` across builds. The Yocto Project supports switching between
+   different :term:`MACHINE` values in the same :term:`TMPDIR`. This practice
+   is well supported and regularly used by developers when building for
+   multiple machines. When you use the same :term:`TMPDIR` for multiple
+   machine builds, the OpenEmbedded build system can reuse the existing native
+   and often cross-recipes for multiple machines. Thus, build time decreases.
 
    .. note::
 
@@ -4399,10 +4387,10 @@ your tunings to best consider build times and package feed maintenance.
 Building Software from an External Source
 -----------------------------------------
 
-By default, the OpenEmbedded build system uses the
-:term:`Build Directory` when building source
-code. The build process involves fetching the source files, unpacking
-them, and then patching them if necessary before the build takes place.
+By default, the OpenEmbedded build system uses the :term:`Build Directory`
+when building source code. The build process involves fetching the source
+files, unpacking them, and then patching them if necessary before the build
+takes place.
 
 There are situations where you might want to build software from source
 files that are external to and thus outside of the OpenEmbedded build
@@ -4519,9 +4507,8 @@ directory:
    from your "own-mirror" are used.
 
 2. *Start With a Clean Build:* You can start with a clean build by
-   removing the
-   ``${``\ :term:`TMPDIR`\ ``}``
-   directory or using a new :term:`Build Directory`.
+   removing the ``${``\ :term:`TMPDIR`\ ``}`` directory or using a new
+   :term:`Build Directory`.
 
 3. *Build Your Target:* Use BitBake to build your target::
 
@@ -4622,8 +4609,7 @@ Following are additional factors that can affect build speed:
    the benefits are limited due to the compiler using ``-pipe``. The
    build system goes to some lengths to avoid ``sync()`` calls into the
    file system on the principle that if there was a significant failure,
-   the :term:`Build Directory`
-   contents could easily be rebuilt.
+   the :term:`Build Directory` contents could easily be rebuilt.
 
 -  Inheriting the
    :ref:`rm_work <ref-classes-rm-work>` class:
@@ -4820,8 +4806,7 @@ Using Multilib
 After you have set up the recipes, you need to define the actual
 combination of multiple libraries you want to build. You accomplish this
 through your ``local.conf`` configuration file in the
-:term:`Build Directory`. An example
-configuration would be as follows::
+:term:`Build Directory`. An example configuration would be as follows::
 
    MACHINE = "qemux86-64"
    require conf/multilib.conf
@@ -4871,10 +4856,9 @@ Here are the implementation details for the RPM Package Management System:
 
 -  A unique architecture is defined for the Multilib packages, along
    with creating a unique deploy folder under ``tmp/deploy/rpm`` in the
-   :term:`Build Directory`. For
-   example, consider ``lib32`` in a ``qemux86-64`` image. The possible
-   architectures in the system are "all", "qemux86_64",
-   "lib32:qemux86_64", and "lib32:x86".
+   :term:`Build Directory`. For example, consider ``lib32`` in a
+   ``qemux86-64`` image. The possible architectures in the system are "all",
+   "qemux86_64", "lib32:qemux86_64", and "lib32:x86".
 
 -  The ``${MLPREFIX}`` variable is stripped from ``${PN}`` during RPM
    packaging. The naming for a normal RPM package and a Multilib RPM
@@ -5460,8 +5444,7 @@ system needs to meet the following requirements:
    your development host system.
 
 -  You must have sourced the build environment setup script (i.e.
-   :ref:`structure-core-script`) found in the
-   :term:`Build Directory`.
+   :ref:`structure-core-script`) found in the :term:`Build Directory`.
 
 -  You need to have the build artifacts already available, which
    typically means that you must have already created an image using the
@@ -5569,11 +5552,10 @@ Raw Mode
 
 Running Wic in raw mode allows you to specify all the partitions through
 the ``wic`` command line. The primary use for raw mode is if you have
-built your kernel outside of the Yocto Project
-:term:`Build Directory`. In other words, you
-can point to arbitrary kernel, root filesystem locations, and so forth.
-Contrast this behavior with cooked mode where Wic looks in the Build
-Directory (e.g. ``tmp/deploy/images/``\ machine).
+built your kernel outside of the Yocto Project :term:`Build Directory`.
+In other words, you can point to arbitrary kernel, root filesystem locations,
+and so forth. Contrast this behavior with cooked mode where Wic looks in the
+:term:`Build Directory` (e.g. ``tmp/deploy/images/``\ machine).
 
 The general form of the ``wic`` command in raw mode is::
 
@@ -5626,11 +5608,11 @@ The general form of the ``wic`` command in raw mode is::
 Cooked Mode
 ~~~~~~~~~~~
 
-Running Wic in cooked mode leverages off artifacts in the Build
-Directory. In other words, you do not have to specify kernel or root
-filesystem locations as part of the command. All you need to provide is
+Running Wic in cooked mode leverages off artifacts in the
+:term:`Build Directory`. In other words, you do not have to specify kernel or
+root filesystem locations as part of the command. All you need to provide is
 a kickstart file and the name of the image from which to use artifacts
-by using the "-e" option. Wic looks in the Build Directory (e.g.
+by using the "-e" option. Wic looks in the :term:`Build Directory` (e.g.
 ``tmp/deploy/images/``\ machine) for artifacts.
 
 The general form of the ``wic`` command using Cooked Mode is as follows::
@@ -5878,9 +5860,9 @@ and kickstart file information.
    You should always verify the details provided in the output to make
    sure that the image was indeed created exactly as expected.
 
-Continuing with the example, you can now write the image from the Build
-Directory onto a USB stick, or whatever media for which you built your
-image, and boot from the media. You can write the image by using
+Continuing with the example, you can now write the image from the
+:term:`Build Directory` onto a USB stick, or whatever media for which you
+built your image, and boot from the media. You can write the image by using
 ``bmaptool`` or ``dd``::
 
    $ oe-run-native bmap-tools-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
@@ -6152,7 +6134,7 @@ any type of image. Use these steps to flash an image using Bmaptool:
 
 3. *Flash the Device:* Flash the device with the image by using Bmaptool
    depending on your particular setup. The following commands assume the
-   image resides in the Build Directory's ``deploy/images/`` area:
+   image resides in the :term:`Build Directory`'s ``deploy/images/`` area:
 
    -  If you have write access to the media, use this command form::
 
@@ -6392,11 +6374,9 @@ layer. The following steps provide some more detail:
    variable from the ``local.conf`` file. The variables you use are not
    limited to the list in the previous bulleted item.
 
--  *Point to Your distribution configuration file:* In your
-   ``local.conf`` file in the :term:`Build Directory`,
-   set your
-   :term:`DISTRO` variable to point to
-   your distribution's configuration file. For example, if your
+-  *Point to Your distribution configuration file:* In your ``local.conf``
+   file in the :term:`Build Directory`, set your :term:`DISTRO` variable to
+   point to your distribution's configuration file. For example, if your
    distribution's configuration file is named ``mydistro.conf``, then
    you point to it as follows::
 
@@ -6431,7 +6411,7 @@ Creating a Custom Template Configuration Directory
 If you are producing your own customized version of the build system for
 use by other users, you might want to provide a custom build configuration
 that includes all the necessary settings and layers (i.e. ``local.conf`` and
-``bblayers.conf`` that are created in a new build directory) and a custom
+``bblayers.conf`` that are created in a new :term:`Build Directory`) and a custom
 message that is shown when setting up the build. This can be done by
 creating one or more template configuration directories in your
 custom distribution layer.
@@ -6445,7 +6425,7 @@ This can be done by using ``bitbake-layers save-build-conf``::
    You can try out the configuration with
    TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
 
-The above command takes the config files from the currently active build directory under ``conf``,
+The above command takes the config files from the currently active :term:`Build Directory` under ``conf``,
 replaces site-specific paths in ``bblayers.conf`` with ``##OECORE##``-relative paths, and copies
 the config files into a specified layer under a specified template name.
 
@@ -6677,10 +6657,9 @@ generated are just "self consistent". The build system adds and removes
 packages and there are no guarantees about upgrade paths but images will
 be consistent and correct with the latest changes.
 
-The simplest form for a PR Service is for a single host
-development system that builds the package feed (building system). For
-this scenario, you can enable a local PR Service by setting
-:term:`PRSERV_HOST` in your
+The simplest form for a PR Service is for a single host development system
+that builds the package feed (building system). For this scenario, you can
+enable a local PR Service by setting :term:`PRSERV_HOST` in your
 ``local.conf`` file in the :term:`Build Directory`::
 
    PRSERV_HOST = "localhost:0"
@@ -7036,7 +7015,7 @@ machine does not necessarily have to be the package server. The build
 machine could push its artifacts to another machine that acts as the
 server (e.g. Internet-facing). In fact, doing so is advantageous for a
 production environment as getting the packages away from the development
-system's build directory prevents accidental overwrites.
+system's :term:`Build Directory` prevents accidental overwrites.
 
 A simple build that targets just one device produces more than one
 package database. In other words, the packages produced by a build are
@@ -7068,8 +7047,7 @@ to use. In your configuration, you use the
 :term:`PACKAGE_CLASSES`
 variable to specify the format:
 
-1. Open the ``local.conf`` file inside your
-   :term:`Build Directory` (e.g.
+1. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
    ``poky/build/conf/local.conf``).
 
 2. Select the desired package format as follows::
@@ -7155,12 +7133,10 @@ environment, the setup is simple and straight forward. Should you want
 to use a different server more suited for production (e.g. Apache 2,
 Lighttpd, or Nginx), take the appropriate steps to do so.
 
-From within the build directory where you have built an image based on
-your packaging choice (i.e. the
-:term:`PACKAGE_CLASSES`
-setting), simply start the server. The following example assumes a build
-directory of ``poky/build/tmp/deploy/rpm`` and a :term:`PACKAGE_CLASSES`
-setting of "package_rpm"::
+From within the :term:`Build Directory` where you have built an image based on
+your packaging choice (i.e. the :term:`PACKAGE_CLASSES` setting), simply start
+the server. The following example assumes a :term:`Build Directory` of ``poky/build``
+and a :term:`PACKAGE_CLASSES` setting of "package_rpm"::
 
    $ cd poky/build/tmp/deploy/rpm
    $ python3 -m http.server
@@ -7432,11 +7408,9 @@ see the :yocto_wiki:`Ptest </Ptest>` wiki page.
 Adding ptest to Your Build
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-To add package testing to your build, add the
-:term:`DISTRO_FEATURES` and
-:term:`EXTRA_IMAGE_FEATURES`
-variables to your ``local.conf`` file, which is found in the
-:term:`Build Directory`::
+To add package testing to your build, add the :term:`DISTRO_FEATURES` and
+:term:`EXTRA_IMAGE_FEATURES` variables to your ``local.conf`` file, which
+is found in the :term:`Build Directory`::
 
    DISTRO_FEATURES:append = " ptest"
    EXTRA_IMAGE_FEATURES += "ptest-pkgs"
@@ -8087,7 +8061,7 @@ image's recipe file via the :term:`IMAGE_FEATURES` variable::
    IMAGE_FEATURES += "read-only-rootfs"
 
 As an alternative, you can add the same feature
-from within your build directory's ``local.conf`` file with the
+from within your :term:`Build Directory`'s ``local.conf`` file with the
 associated :term:`EXTRA_IMAGE_FEATURES` variable, as in::
 
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
@@ -8182,9 +8156,8 @@ Enabling and Disabling Build History
 ------------------------------------
 
 Build history is disabled by default. To enable it, add the following
-:term:`INHERIT` statement and set the
-:term:`BUILDHISTORY_COMMIT`
-variable to "1" at the end of your ``conf/local.conf`` file found in the
+:term:`INHERIT` statement and set the :term:`BUILDHISTORY_COMMIT` variable to
+"1" at the end of your ``conf/local.conf`` file found in the
 :term:`Build Directory`::
 
    INHERIT += "buildhistory"
@@ -8207,10 +8180,8 @@ your ``conf/local.conf`` file.
 Understanding What the Build History Contains
 ---------------------------------------------
 
-Build history information is kept in
-``${``\ :term:`TOPDIR`\ ``}/buildhistory``
-in the Build Directory as defined by the
-:term:`BUILDHISTORY_DIR`
+Build history information is kept in ``${``\ :term:`TOPDIR`\ ``}/buildhistory``
+in the :term:`Build Directory` as defined by the :term:`BUILDHISTORY_DIR`
 variable. Here is an example abbreviated listing:
 
 .. image:: figures/buildhistory.png
@@ -8877,11 +8848,9 @@ Running Tests
 
 You can start the tests automatically or manually:
 
--  *Automatically running tests:* To run the tests automatically after
-   the OpenEmbedded build system successfully creates an image, first
-   set the
-   :term:`TESTIMAGE_AUTO`
-   variable to "1" in your ``local.conf`` file in the
+-  *Automatically running tests:* To run the tests automatically after the
+   OpenEmbedded build system successfully creates an image, first set the
+   :term:`TESTIMAGE_AUTO` variable to "1" in your ``local.conf`` file in the
    :term:`Build Directory`::
 
       TESTIMAGE_AUTO = "1"
@@ -8976,10 +8945,9 @@ following BitBake command form::
 
    $ bitbake image -c testexport
 
-Exporting the tests places them in the
-:term:`Build Directory` in
-``tmp/testexport/``\ image, which is controlled by the
-:term:`TEST_EXPORT_DIR` variable.
+Exporting the tests places them in the :term:`Build Directory` in
+``tmp/testexport/``\ image, which is controlled by the :term:`TEST_EXPORT_DIR`
+variable.
 
 You can now run the tests outside of the build environment::
 
@@ -9206,9 +9174,8 @@ section:
 
 -  ":ref:`dev-manual/common-tasks:viewing task variable dependencies`" describes
    how to use the ``bitbake-dumpsig`` command in conjunction with key
-   subdirectories in the
-   :term:`Build Directory` to determine
-   variable dependencies.
+   subdirectories in the :term:`Build Directory` to determine variable
+   dependencies.
 
 -  ":ref:`dev-manual/common-tasks:running specific tasks`" describes
    how to use several BitBake options (e.g. ``-c``, ``-C``, and ``-f``)
@@ -10357,13 +10324,11 @@ Here are some other tips that you might find useful:
    is also possible to switch out of the splashscreen by switching the
    virtual console (e.g. Fn+Left or Fn+Right on a Zaurus).
 
--  Removing :term:`TMPDIR` (usually
-   ``tmp/``, within the
-   :term:`Build Directory`) can often fix
-   temporary build issues. Removing :term:`TMPDIR` is usually a relatively
-   cheap operation, because task output will be cached in
-   :term:`SSTATE_DIR` (usually
-   ``sstate-cache/``, which is also in the Build Directory).
+-  Removing :term:`TMPDIR` (usually ``tmp/``, within the
+   :term:`Build Directory`) can often fix temporary build issues. Removing
+   :term:`TMPDIR` is usually a relatively cheap operation, because task output
+   will be cached in :term:`SSTATE_DIR` (usually ``sstate-cache/``, which is
+   also in the :term:`Build Directory`).
 
    .. note::
 
@@ -10377,8 +10342,8 @@ Here are some other tips that you might find useful:
 
    Using GNU Grep, you can use the following shell function to
    recursively search through common recipe-related files, skipping
-   binary files, ``.git`` directories, and the Build Directory (assuming
-   its name starts with "build")::
+   binary files, ``.git`` directories, and the :term:`Build Directory`
+   (assuming its name starts with "build")::
 
       g() {
           grep -Ir \
@@ -11276,8 +11241,7 @@ of compliance in mind.
 
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
-the ``local.conf`` file found in the
-:term:`Build Directory`::
+the ``local.conf`` file found in the :term:`Build Directory`::
 
    INHERIT += "archiver"
    ARCHIVER_MODE[src] = "original"
@@ -11436,9 +11400,9 @@ this function, you have to follow the following steps:
 
 3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
    Please choose one that you want to use and enable the spdx task. You have to
-   add some config options in ``local.conf`` file in your :term:`Build
-   Directory`. Here is an example showing how to generate spdx files
-   during BitBake using the fossology-python.bbclass::
+   add some config options in ``local.conf`` file in your :term:`Build Directory`.
+   Here is an example showing how to generate spdx files during BitBake using the
+   fossology-python.bbclass::
 
       # Select fossology-python.bbclass.
       INHERIT += "fossology-python"
@@ -11637,12 +11601,9 @@ Enabling and Using the Tool
 ---------------------------
 
 By default, the error reporting tool is disabled. You can enable it by
-inheriting the
-:ref:`report-error <ref-classes-report-error>`
+inheriting the :ref:`report-error <ref-classes-report-error>`
 class by adding the following statement to the end of your
-``local.conf`` file in your
-:term:`Build Directory`.
-::
+``local.conf`` file in your :term:`Build Directory`::
 
    INHERIT += "report-error"
 
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 9f4bc264a3..5a4a82ce6f 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -99,8 +99,7 @@ available. Follow these general steps to run QEMU:
    Here are some additional examples to help illustrate further QEMU:
 
    -  This example starts QEMU with MACHINE set to "qemux86-64".
-      Assuming a standard
-      :term:`Build Directory`, ``runqemu``
+      Assuming a standard :term:`Build Directory`, ``runqemu``
       automatically finds the ``bzImage-qemux86-64.bin`` image file and
       the ``core-image-minimal-qemux86-64-20200218002850.rootfs.ext4``
       (assuming the current build created a ``core-image-minimal``
@@ -246,11 +245,10 @@ be a problem when QEMU is running with KVM enabled. Specifically,
 software compiled with a certain CPU feature crashes when run on a CPU
 under KVM that does not support that feature. To work around this
 problem, you can override QEMU's runtime CPU setting by changing the
-``QB_CPU_KVM`` variable in ``qemuboot.conf`` in the
-:term:`Build Directory` ``deploy/image``
-directory. This setting specifies a ``-cpu`` option passed into QEMU in
-the ``runqemu`` script. Running ``qemu -cpu help`` returns a list of
-available supported CPU types.
+``QB_CPU_KVM`` variable in ``qemuboot.conf`` in the :term:`Build Directory`
+``deploy/image`` directory. This setting specifies a ``-cpu`` option passed
+into QEMU in the ``runqemu`` script. Running ``qemu -cpu help`` returns a
+list of available supported CPU types.
 
 QEMU Performance
 ================
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 23d5643d12..f90375471f 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -558,8 +558,8 @@ your Yocto Project build host:
    access to external devices such as those connected through a USB
    port, but it automatically mounts your ``C:`` drive on ``/mnt/c/``
    (and others), which you can use to share deploy artifacts to be later
-   flashed on hardware through Windows, but your build directory should
-   not reside inside this mountpoint.
+   flashed on hardware through Windows, but your :term:`Build Directory`
+   should not reside inside this mountpoint.
 
 Once you have WSL 2 set up, everything is in place to develop just as if
 you were running on a native Linux machine. If you are going to use the
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 0a1819ceae..690f61110b 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -66,19 +66,15 @@ section:
       (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
-2. *Prepare Your local.conf File:* By default, the
-   :term:`MACHINE` variable is set to
-   "qemux86-64", which is fine if you are building for the QEMU emulator
-   in 64-bit mode. However, if you are not, you need to set the
+2. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable
+   is set to "qemux86-64", which is fine if you are building for the QEMU
+   emulator in 64-bit mode. However, if you are not, you need to set the
    :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
-   found in the
-   :term:`Build Directory` (i.e.
-   ``poky/build`` in this example).
+   found in the :term:`Build Directory` (i.e.  ``poky/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
-   to set the
-   :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS`
-   variable to include kernel modules.
+   to set the :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS` variable to include
+   kernel modules.
 
    In this example we wish to build for qemux86 so we must set the
    :term:`MACHINE` variable to "qemux86" and also add the "kernel-modules".
@@ -186,14 +182,11 @@ section:
       (i.e. ``poky``) have been cloned using Git and the local repository is named
       "poky".
 
-2. *Prepare Your local.conf File:* By default, the
-   :term:`MACHINE` variable is set to
-   "qemux86-64", which is fine if you are building for the QEMU emulator
-   in 64-bit mode. However, if you are not, you need to set the
-   :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
-   found in the
-   :term:`Build Directory` (i.e.
-   ``poky/build`` in this example).
+2. *Prepare Your local.conf File:* By default, the :term:`MACHINE` variable is
+   set to "qemux86-64", which is fine if you are building for the QEMU emulator
+   in 64-bit mode. However, if you are not, you need to set the :term:`MACHINE`
+   variable appropriately in your ``conf/local.conf`` file found in the
+   :term:`Build Directory` (i.e.  ``poky/build`` in this example).
 
    Also, since you are preparing to work on the kernel image, you need
    to set the
@@ -836,8 +829,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
 8. *Build the Image With Your Modified Kernel:* You can now build an
    image that includes your kernel patches. Execute the following
-   command from your
-   :term:`Build Directory` in the terminal
+   command from your :term:`Build Directory` in the terminal
    set up to run BitBake::
 
       $ cd poky/build
@@ -1057,9 +1049,8 @@ To use the ``menuconfig`` tool in the Yocto Project development
 environment, you must do the following:
 
 -  Because you launch ``menuconfig`` using BitBake, you must be sure to
-   set up your environment by running the
-   :ref:`structure-core-script` script found in
-   the :term:`Build Directory`.
+   set up your environment by running the :ref:`structure-core-script` script
+   found in the :term:`Build Directory`.
 
 -  You must be sure of the state of your build's configuration in the
    :term:`Source Directory`.
@@ -1111,10 +1102,10 @@ can find the option under "Processor Type and Features". To deselect
 Multi-Processing Support" and enter "N" to clear the asterisk. When you
 are finished, exit out and save the change.
 
-Saving the selections updates the ``.config`` configuration file. This
-is the file that the OpenEmbedded build system uses to configure the
-kernel during the build. You can find and examine this file in the Build
-Directory in ``tmp/work/``. The actual ``.config`` is located in the
+Saving the selections updates the ``.config`` configuration file. This is the
+file that the OpenEmbedded build system uses to configure the kernel during
+the build. You can find and examine this file in the :term:`Build Directory`
+in ``tmp/work/``. The actual ``.config`` is located in the
 area where the specific kernel is built. For example, if you were
 building a Linux Yocto kernel based on the ``linux-yocto-4.12`` kernel
 and you were building a QEMU image targeted for ``x86`` architecture,
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 63c5124a57..6a2fe4bb0b 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -319,8 +319,7 @@ image.
 
 The following figure shows the temporary file structure created on your
 host system when you build the kernel using BitBake. This
-:term:`Build Directory` contains all the
-source files used during the build.
+:term:`Build Directory` contains all the source files used during the build.
 
 .. image:: figures/kernel-overview-2-generic.png
    :align: center
diff --git a/documentation/kernel-dev/intro.rst b/documentation/kernel-dev/intro.rst
index 4ff4dc7d35..267b7e7797 100644
--- a/documentation/kernel-dev/intro.rst
+++ b/documentation/kernel-dev/intro.rst
@@ -134,7 +134,7 @@ general information and references for further information.
 3. *Make Changes to the Kernel Source Code if applicable:* Modifying the
    kernel does not always mean directly changing source files. However,
    if you have to do this, you make the changes to the files in the
-   Yocto's Build Directory if you are using ``devtool``. For more
+   Yocto's :term:`Build Directory` if you are using ``devtool``. For more
    information, see the
    ":ref:`kernel-dev/common:using \`\`devtool\`\` to patch the kernel`"
    section.
@@ -155,7 +155,7 @@ general information and references for further information.
    .. note::
 
       Try to resist the temptation to directly edit an existing ``.config``
-      file, which is found in the Build Directory among the source code
+      file, which is found in the :term:`Build Directory` among the source code
       used for the build. Doing so, can produce unexpected results when
       the OpenEmbedded build system regenerates the configuration file.
 
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index d968c856f6..6aa2fb7cf1 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -229,6 +229,5 @@ This behavior means that all the generated files for a particular
 machine or BSP are now in the build tree directory. The files include
 the final ``.config`` file, all the ``.o`` files, the ``.a`` files, and
 so forth. Since each machine or BSP has its own separate
-:term:`Build Directory` in its own separate
-branch of the Git repository, you can easily switch between different
-builds.
+:term:`Build Directory` in its own separate branch of the Git repository,
+you can easily switch between different builds.
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 1b78e99809..70a087ff1a 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -126,10 +126,9 @@ The following directory changes exist:
    :term:`DEPLOY_DIR_IMAGE` variable in the external environment.
 
 -  When buildhistory is enabled, its output is now written under the
-   :term:`Build Directory` rather than
-   :term:`TMPDIR`. Doing so makes it easier to delete
-   :term:`TMPDIR` and preserve the build history. Additionally, data for
-   produced SDKs is now split by :term:`IMAGE_NAME`.
+   :term:`Build Directory` rather than :term:`TMPDIR`. Doing so makes
+   it easier to delete :term:`TMPDIR` and preserve the build history.
+   Additionally, data for produced SDKs is now split by :term:`IMAGE_NAME`.
 
 -  The ``pkgdata`` directory produced as part of the packaging process
    has been collapsed into a single machine-specific directory. This
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index f54d4ba729..d3de264650 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -233,9 +233,9 @@ Separate build and source directories have been enabled by default for
 selected recipes where it is known to work and for all
 recipes that inherit the :ref:`cmake <ref-classes-cmake>` class. In
 future releases the :ref:`autotools <ref-classes-autotools>` class
-will enable a separate build directory by default as well. Recipes
+will enable a separate :term:`Build Directory` by default as well. Recipes
 building Autotools-based software that fails to build with a separate
-build directory should be changed to inherit from the
+:term:`Build Directory` should be changed to inherit from the
 :ref:`autotools-brokensep <ref-classes-autotools>` class instead of
 the ``autotools`` or ``autotools_stage``\ classes.
 
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 7b179f2aa1..e1a7594fb1 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -42,7 +42,7 @@ Autotools Class Changes
 The following :ref:`autotools <ref-classes-autotools>` class changes
 occurred:
 
--  *A separate build directory is now used by default:* The
+-  *A separate :term:`Build Directory` is now used by default:* The
    :ref:`autotools <ref-classes-autotools>` class has been
    changed to use a directory for building
    (:term:`B`), which is separate from the source directory
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index b36eb194b3..eedede2457 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -343,8 +343,7 @@ BitBake Changes
 ---------------
 
 The server logfile ``bitbake-cookerdaemon.log`` is now always placed in
-the :term:`Build Directory` instead of the current
-directory.
+the :term:`Build Directory` instead of the current directory.
 
 .. _migration-2.6-security-changes:
 
diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index 0f0408e51f..847bdad739 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -86,7 +86,7 @@ any new Yocto Project release.
    3. Capture the buildhistory output (as specified by :term:`BUILDHISTORY_DIR`)
       and ensure it is preserved for subsequent builds. How you would do this
       depends on how you are running your builds - if you are doing this all on
-      one workstation in the same build directory you may not need to do
+      one workstation in the same :term:`Build Directory` you may not need to do
       anything other than not deleting the buildhistory output directory. For
       builds in a pipeline it may be more complicated.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 75eb872b32..5c5887eb0a 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -233,13 +233,12 @@ for creating actual configuration files when you source
 :ref:`structure-core-script`, which is the
 build environment script.
 
-Sourcing the build environment script creates a
-:term:`Build Directory` if one does not
-already exist. BitBake uses the Build Directory for all its work during
-builds. The Build Directory has a ``conf`` directory that contains
-default versions of your ``local.conf`` and ``bblayers.conf``
+Sourcing the build environment script creates a :term:`Build Directory`
+if one does not already exist. BitBake uses the :term:`Build Directory`
+for all its work during builds. The Build Directory has a ``conf`` directory
+that contains default versions of your ``local.conf`` and ``bblayers.conf``
 configuration files. These default configuration files are created only
-if versions do not already exist in the Build Directory at the time you
+if versions do not already exist in the :term:`Build Directory` at the time you
 source the build environment setup script.
 
 Because the Poky repository is fundamentally an aggregation of existing
@@ -251,9 +250,9 @@ assumes the script is executed from within a cloned or unpacked version
 of Poky.
 
 Depending on where the script is sourced, different sub-scripts are
-called to set up the Build Directory (Yocto or OpenEmbedded).
+called to set up the :term:`Build Directory` (Yocto or OpenEmbedded).
 Specifically, the script ``scripts/oe-setup-builddir`` inside the poky
-directory sets up the Build Directory and seeds the directory (if
+directory sets up the :term:`Build Directory` and seeds the directory (if
 necessary) with configuration files appropriate for the Yocto Project
 development environment.
 
@@ -428,7 +427,7 @@ The distribution layer provides policy configurations for your
 distribution. Best practices dictate that you isolate these types of
 configurations into their own layer. Settings you provide in
 ``conf/distro/distro.conf`` override similar settings that BitBake finds
-in your ``conf/local.conf`` file in the Build Directory.
+in your ``conf/local.conf`` file in the :term:`Build Directory`.
 
 The following list provides some explanation and references for what you
 typically find in the distribution layer:
@@ -531,10 +530,11 @@ repositories, which is not the default behavior, and store them in the
 variable.
 
 Judicious use of a :term:`DL_DIR` directory can save the build system a trip
-across the Internet when looking for files. A good method for using a
-download directory is to have :term:`DL_DIR` point to an area outside of
-your Build Directory. Doing so allows you to safely delete the Build
-Directory if needed without fear of removing any downloaded source file.
+across the Internet when looking for files. A good method for using a download
+directory is to have :term:`DL_DIR` point to an area outside of your
+:term:`Build Directory`. Doing so allows you to safely delete the
+:term:`Build Directory` if needed without fear of removing any downloaded
+source file.
 
 The remainder of this section provides a deeper look into the source
 files and the mirrors. Here is a more detailed look at the source file
@@ -632,15 +632,14 @@ process validates them with generated output quality assurance checks
 through the :ref:`insane <ref-classes-insane>`
 class.
 
-The package feed area resides in the Build Directory. The directory the
+The package feed area resides in the :term:`Build Directory`. The directory the
 build system uses to temporarily store packages is determined by a
 combination of variables and the particular package manager in use. See
 the "Package Feeds" box in the illustration and note the information to
 the right of that area. In particular, the following defines where
 package files are kept:
 
--  :term:`DEPLOY_DIR`: Defined as
-   ``tmp/deploy`` in the Build Directory.
+-  :term:`DEPLOY_DIR`: Defined as ``tmp/deploy`` in the :term:`Build Directory`.
 
 -  ``DEPLOY_DIR_*``: Depending on the package manager used, the package
    type sub-folder. Given RPM, IPK, or DEB packaging and tarball
@@ -696,10 +695,8 @@ code:
 .. image:: figures/source-fetching.png
    :width: 100%
 
-The :ref:`ref-tasks-fetch` and
-:ref:`ref-tasks-unpack` tasks fetch
-the source files and unpack them into the
-:term:`Build Directory`.
+The :ref:`ref-tasks-fetch` and :ref:`ref-tasks-unpack` tasks fetch
+the source files and unpack them into the :term:`Build Directory`.
 
 .. note::
 
@@ -710,17 +707,16 @@ the source files and unpack them into the
    file has been modified, the :ref:`ref-tasks-fetch` task and all
    tasks that depend on it are re-executed.
 
-By default, everything is accomplished in the Build Directory, which has
-a defined structure. For additional general information on the Build
-Directory, see the ":ref:`structure-core-build`" section in
+By default, everything is accomplished in the :term:`Build Directory`, which has
+a defined structure. For additional general information on the
+:term:`Build Directory`, see the ":ref:`structure-core-build`" section in
 the Yocto Project Reference Manual.
 
-Each recipe has an area in the Build Directory where the unpacked source
-code resides. The :term:`S` variable points
-to this area for a recipe's unpacked source code. The name of that
-directory for any given recipe is defined from several different
-variables. The preceding figure and the following list describe the
-Build Directory's hierarchy:
+Each recipe has an area in the :term:`Build Directory` where the unpacked
+source code resides. The :term:`S` variable points to this area for a recipe's
+unpacked source code. The name of that directory for any given recipe is
+defined from several different variables. The preceding figure and the
+following list describe the :term:`Build Directory`'s hierarchy:
 
 -  :term:`TMPDIR`: The base directory
    where the OpenEmbedded build system performs all its work during the
@@ -1258,15 +1254,12 @@ this output:
    ":doc:`/ref-manual/images`" chapter in the Yocto Project Reference
    Manual.
 
-The build process writes images out to the :term:`Build Directory`
-inside the
-``tmp/deploy/images/machine/`` folder as shown in the figure. This
+The build process writes images out to the :term:`Build Directory` inside
+the ``tmp/deploy/images/machine/`` folder as shown in the figure. This
 folder contains any files expected to be loaded on the target device.
-The :term:`DEPLOY_DIR` variable
-points to the ``deploy`` directory, while the
-:term:`DEPLOY_DIR_IMAGE`
-variable points to the appropriate directory containing images for the
-current configuration.
+The :term:`DEPLOY_DIR` variable points to the ``deploy`` directory, while the
+:term:`DEPLOY_DIR_IMAGE` variable points to the appropriate directory
+containing images for the current configuration.
 
 -  kernel-image: A kernel binary file. The
    :term:`KERNEL_IMAGETYPE`
@@ -1340,10 +1333,9 @@ can initialize the environment before using the tools.
       the :doc:`/sdk-manual/index` manual.
 
 All the output files for an SDK are written to the ``deploy/sdk`` folder
-inside the :term:`Build Directory` as
-shown in the previous figure. Depending on the type of SDK, there are
-several variables to configure these files. Here are the variables
-associated with an extensible SDK:
+inside the :term:`Build Directory` as shown in the previous figure. Depending
+on the type of SDK, there are several variables to configure these files.
+Here are the variables associated with an extensible SDK:
 
 -  :term:`DEPLOY_DIR`: Points to
    the ``deploy`` directory.
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 43a6f1b480..04aea1373c 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -623,11 +623,9 @@ MIT license `here <https://en.wikipedia.org/wiki/MIT_License>`__.
 
 When you build an image using the Yocto Project, the build process uses
 a known list of licenses to ensure compliance. You can find this list in
-the :term:`Source Directory` at
-``meta/files/common-licenses``. Once the build completes, the list of
-all licenses found and used during that build are kept in the
-:term:`Build Directory` at
-``tmp/deploy/licenses``.
+the :term:`Source Directory` at ``meta/files/common-licenses``. Once the
+build completes, the list of all licenses found and used during that build
+are kept in the :term:`Build Directory` at ``tmp/deploy/licenses``.
 
 If a module requires a license that is not in the base list, the build
 process generates a warning during the build. These tools make it easier
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 49f8af4a74..01fbde1411 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1895,9 +1895,9 @@ manual, and boot the resulting target image.
 
 .. note::
 
-   If you have a build directory containing multiple machines, you need
+   If you have a :term:`Build Directory` containing multiple machines, you need
    to have the MACHINE you're connecting to selected in local.conf, and
-   the kernel in that machine's build directory must match the kernel on
+   the kernel in that machine's :term:`Build Directory` must match the kernel on
    the booted system exactly, or you'll get the above 'crosstap' message
    when you try to invoke a script.
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 1880e44486..90e9a72096 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1864,10 +1864,10 @@ package-specific classes:
 You can control the list of resulting package formats by using the
 :term:`PACKAGE_CLASSES` variable defined in your ``conf/local.conf``
 configuration file, which is located in the :term:`Build Directory`.
-When defining the variable, you can
-specify one or more package types. Since images are generated from
-packages, a packaging class is needed to enable image generation. The
-first class listed in this variable is used for image generation.
+When defining the variable, you can specify one or more package types.
+Since images are generated from packages, a packaging class is needed
+to enable image generation. The first class listed in this variable is
+used for image generation.
 
 If you take the optional step to set up a repository (package feed) on
 the development host that can be used by DNF, you can install packages
@@ -2353,8 +2353,7 @@ recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
 you would rather have these files deleted to save disk space as the
 build progresses, you can enable :ref:`rm_work <ref-classes-rm-work>` by adding the following to
-your ``local.conf`` file, which is found in the :term:`Build Directory`.
-::
+your ``local.conf`` file, which is found in the :term:`Build Directory`::
 
    INHERIT += "rm_work"
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index a570c40e7d..d35ab78bff 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -270,7 +270,7 @@ the build environment setup script (i.e.  :ref:`structure-core-script`).
 By default, this :term:`Build Directory` is named ``build`` but can be named
 anything you want.
 
-Within the Build Directory, is the ``tmp`` directory. To remove all the
+Within the :term:`Build Directory`, is the ``tmp`` directory. To remove all the
 build output yet preserve any source code or downloaded files from
 previous builds, simply remove the ``tmp`` directory.
 
@@ -381,14 +381,13 @@ system of that image. Thus, the build system provides a value of
 forth.
 
 Meanwhile, ``DESTDIR`` is a path within the :term:`Build Directory`.
-However, when the recipe builds a
-native program (i.e. one that is intended to run on the build machine),
-that program is never installed directly to the build machine's root
-file system. Consequently, the build system uses paths within the Build
-Directory for ``DESTDIR``, ``bindir`` and related variables. To better
-understand this, consider the following two paths (artificially broken
-across lines for readability) where the first is relatively normal and
-the second is not::
+However, when the recipe builds a native program (i.e. one that is
+intended to run on the build machine), that program is never installed
+directly to the build machine's root file system. Consequently, the build
+system uses paths within the Build Directory for ``DESTDIR``, ``bindir``
+and related variables. To better understand this, consider the following
+two paths (artificially broken across lines for readability) where the
+first is relatively normal and the second is not::
 
    /home/maxtothemax/poky-bootchart2/build/tmp/work/i586-poky-linux/zlib/
       1.2.8-r0/sysroot-destdir/usr/bin
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index fe27d17caa..8b08f88969 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -57,9 +57,8 @@ For more information on BitBake, see the :doc:`BitBake User Manual
 This directory contains user configuration files and the output
 generated by the OpenEmbedded build system in its standard configuration
 where the source tree is combined with the output. The :term:`Build Directory`
-is created initially when you ``source``
-the OpenEmbedded build environment setup script (i.e.
-:ref:`structure-core-script`).
+is created initially when you ``source`` the OpenEmbedded build environment
+setup script (i.e. :ref:`structure-core-script`).
 
 It is also possible to place output and configuration files in a
 directory separate from the :term:`Source Directory` by
@@ -153,10 +152,10 @@ BitBake commands. The script uses other scripts within the ``scripts``
 directory to do the bulk of the work.
 
 When you run this script, your Yocto Project environment is set up, a
-:term:`Build Directory` is created, your working
-directory becomes the Build Directory, and you are presented with some
-simple suggestions as to what to do next, including a list of some
-possible targets to build. Here is an example::
+:term:`Build Directory` is created, your working directory becomes the
+:term:`Build Directory`, and you are presented with some simple
+suggestions as to what to do next, including a list of some possible
+targets to build. Here is an example::
 
    $ source oe-init-build-env
 
@@ -182,12 +181,13 @@ See the
 section in the Yocto Project Development Tasks Manual for more
 information.
 
-By default, running this script without a Build Directory argument
+By default, running this script without a :term:`Build Directory` argument
 creates the ``build/`` directory in your current working directory. If
-you provide a Build Directory argument when you ``source`` the script,
-you direct the OpenEmbedded build system to create a Build Directory of
-your choice. For example, the following command creates a Build
-Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`::
+you provide a :term:`Build Directory` argument when you ``source`` the script,
+you direct the OpenEmbedded build system to create a :term:`Build Directory` of
+your choice. For example, the following command creates a
+:term:`Build Directory` named ``mybuilds/`` that is outside of the
+:term:`Source Directory`::
 
    $ source oe-init-build-env ~/mybuilds
 
@@ -219,11 +219,10 @@ These files are standard top-level files.
 The Build Directory --- ``build/``
 ==================================
 
-The OpenEmbedded build system creates the :term:`Build Directory`
-when you run the build environment setup
-script :ref:`structure-core-script`. If you do not give the Build
-Directory a specific name when you run the setup script, the name
-defaults to ``build/``.
+The OpenEmbedded build system creates the :term:`Build Directory` when you run
+the build environment setup script :ref:`structure-core-script`. If you do not
+give the :term:`Build Directory` a specific name when you run the setup script,
+the name defaults to ``build/``.
 
 For subsequent parsing and processing, the name of the Build directory
 is available via the :term:`TOPDIR` variable.
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 1e3f718a8f..76322058c3 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -64,31 +64,31 @@ universal, the list includes them just in case:
       builds. The area is created when you ``source`` the setup environment
       script that is found in the Source Directory
       (i.e. :ref:`ref-manual/structure:\`\`oe-init-build-env\`\``). The
-      :term:`TOPDIR` variable points to the Build Directory.
+      :term:`TOPDIR` variable points to the :term:`Build Directory`.
 
-      You have a lot of flexibility when creating the Build Directory.
+      You have a lot of flexibility when creating the :term:`Build Directory`.
       Following are some examples that show how to create the directory.  The
       examples assume your :term:`Source Directory` is named ``poky``:
 
-         -  Create the Build Directory inside your Source Directory and let
-            the name of the Build Directory default to ``build``:
+         -  Create the :term:`Build Directory` inside your Source Directory and let
+            the name of the :term:`Build Directory` default to ``build``:
 
             .. code-block:: shell
 
                $ cd poky
                $ source oe-init-build-env
 
-         -  Create the Build Directory inside your home directory and
+         -  Create the :term:`Build Directory` inside your home directory and
             specifically name it ``test-builds``:
 
             .. code-block:: shell
 
                $ source poky/oe-init-build-env test-builds
 
-         -  Provide a directory path and specifically name the Build
-            Directory. Any intermediate folders in the pathname must exist.
-            This next example creates a Build Directory named
-            ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
+         -  Provide a directory path and specifically name the
+            :term:`Build Directory`. Any intermediate folders in the pathname
+            must exist.  This next example creates a :term:`Build Directory`
+            named ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
 
             .. code-block:: shell
 
@@ -96,13 +96,13 @@ universal, the list includes them just in case:
 
       .. note::
 
-         By default, the Build Directory contains :term:`TMPDIR`, which is a
+         By default, the :term:`Build Directory` contains :term:`TMPDIR`, which is a
          temporary directory the build system uses for its work. :term:`TMPDIR` cannot
-         be under NFS. Thus, by default, the Build Directory cannot be under
-         NFS. However, if you need the Build Directory to be under NFS, you can
+         be under NFS. Thus, by default, the :term:`Build Directory` cannot be under
+         NFS. However, if you need the :term:`Build Directory` to be under NFS, you can
          set this up by setting :term:`TMPDIR` in your ``local.conf`` file to use a local
          drive. Doing so effectively separates :term:`TMPDIR` from :term:`TOPDIR`, which is the
-         Build Directory.
+         :term:`Build Directory`.
 
    :term:`Build Host`
       The system used to build images in a Yocto Project Development
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71e8c272a7..2bf8909958 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -260,9 +260,9 @@ system and gives an overview of their function and contents.
       https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview
 
    :term:`B`
-      The directory within the :term:`Build Directory` in
-      which the OpenEmbedded build system places generated objects during a
-      recipe's build process. By default, this directory is the same as the
+      The directory within the :term:`Build Directory` in which the
+      OpenEmbedded build system places generated objects during a recipe's
+      build process. By default, this directory is the same as the
       :term:`S` directory, which is defined as::
 
          S = "${WORKDIR}/${BP}"
@@ -903,12 +903,11 @@ system and gives an overview of their function and contents.
       The default value is an empty string ("").
 
    :term:`BUILDDIR`
-      Points to the location of the :term:`Build Directory`.
-      You can define this directory indirectly through the
-      :ref:`structure-core-script` script by passing in a Build
-      Directory path when you run the script. If you run the script and do
-      not provide a Build Directory path, the :term:`BUILDDIR` defaults to
-      ``build`` in the current directory.
+      Points to the location of the :term:`Build Directory`. You can define
+      this directory indirectly through the :ref:`structure-core-script` script
+      by passing in a :term:`Build Directory` path when you run the script. If
+      you run the script and do not provide a :term:`Build Directory` path, the
+      :term:`BUILDDIR` defaults to ``build`` in the current directory.
 
    :term:`BUILDHISTORY_COMMIT`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
@@ -1700,8 +1699,7 @@ system and gives an overview of their function and contents.
       Points to the general area that the OpenEmbedded build system uses to
       place images, packages, SDKs, and other output files that are ready
       to be used outside of the build system. By default, this directory
-      resides within the :term:`Build Directory` as
-      ``${TMPDIR}/deploy``.
+      resides within the :term:`Build Directory` as ``${TMPDIR}/deploy``.
 
       For more information on the structure of the Build Directory, see
       ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
@@ -1747,7 +1745,7 @@ system and gives an overview of their function and contents.
       with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
       <ref-classes-image>` class.
 
-      For more information on the structure of the Build Directory, see
+      For more information on the structure of the :term:`Build Directory`, see
       ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
       For more detail on the contents of the ``deploy`` directory, see the
       ":ref:`overview-manual/concepts:images`" and
@@ -2030,8 +2028,7 @@ system and gives an overview of their function and contents.
       You can set this directory by defining the :term:`DL_DIR` variable in the
       ``conf/local.conf`` file. This directory is self-maintaining and you
       should not have to touch it. By default, the directory is
-      ``downloads`` in the :term:`Build Directory`.
-      ::
+      ``downloads`` in the :term:`Build Directory`::
 
          #DL_DIR ?= "${TOPDIR}/downloads"
 
@@ -2252,8 +2249,8 @@ system and gives an overview of their function and contents.
       class, this variable points to the directory in which the recipe's
       source code is built, which is outside of the OpenEmbedded build
       system. When set, this variable sets the :term:`B` variable,
-      which is what the OpenEmbedded build system uses to locate the Build
-      Directory.
+      which is what the OpenEmbedded build system uses to locate the
+      :term:`Build Directory`.
 
       See the ":ref:`ref-classes-externalsrc`" section for details. You
       can also find information on how to use this variable in the
@@ -2273,9 +2270,8 @@ system and gives an overview of their function and contents.
       more than one feature, separate them with a space.
 
       Typically, you configure this variable in your ``local.conf`` file,
-      which is found in the :term:`Build Directory`.
-      Although you can use this variable from within a recipe, best
-      practices dictate that you do not.
+      which is found in the :term:`Build Directory`. Although you can use this
+      variable from within a recipe, best practices dictate that you do not.
 
       .. note::
 
@@ -2672,10 +2668,9 @@ system and gives an overview of their function and contents.
 
       You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
       ``conf/local.conf`` file, which is found in the :term:`Build Directory`,
-      to point to your custom
-      ``fs-perms.txt``. You can specify more than a single file permissions
-      setting table. The paths you specify to these files must be defined
-      within the :term:`BBPATH` variable.
+      to point to your custom ``fs-perms.txt``. You can specify more than a
+      single file permissions setting table. The paths you specify to these
+      files must be defined within the :term:`BBPATH` variable.
 
       For guidance on how to create your own file permissions settings
       table file, examine the existing ``fs-perms.txt``.
@@ -6735,7 +6730,7 @@ system and gives an overview of their function and contents.
       to find the unpacked source.
 
       As an example, assume a :term:`Source Directory`
-      top-level folder named ``poky`` and a default Build Directory at
+      top-level folder named ``poky`` and a default :term:`Build Directory` at
       ``poky/build``. In this case, the work directory the build system
       uses to keep the unpacked recipe for ``db`` is the following::
 
@@ -6780,7 +6775,7 @@ system and gives an overview of their function and contents.
 
    :term:`SDK_CUSTOM_TEMPLATECONF`
       When building the extensible SDK, if :term:`SDK_CUSTOM_TEMPLATECONF` is set to
-      "1" and a ``conf/templateconf.cfg`` file exists in the build directory
+      "1" and a ``conf/templateconf.cfg`` file exists in the :term:`Build Directory`
       (:term:`TOPDIR`) then this will be copied into the SDK.
 
    :term:`SDK_DEPLOY`
@@ -7183,8 +7178,7 @@ system and gives an overview of their function and contents.
 
       To enable file removal, set the variable to "1" in your
       ``conf/local.conf`` configuration file in your:
-      :term:`Build Directory`.
-      ::
+      :term:`Build Directory`::
 
          SKIP_FILEDEPS = "1"
 
@@ -8115,12 +8109,11 @@ system and gives an overview of their function and contents.
       You can select "glibc", "musl", "newlib", or "baremetal".
 
    :term:`TCLIBCAPPEND`
-      Specifies a suffix to be appended onto the
-      :term:`TMPDIR` value. The suffix identifies the
-      ``libc`` variant for building. When you are building for multiple
-      variants with the same :term:`Build Directory`, this
-      mechanism ensures that output for different ``libc`` variants is kept
-      separate to avoid potential conflicts.
+      Specifies a suffix to be appended onto the :term:`TMPDIR` value. The
+      suffix identifies the ``libc`` variant for building. When you are
+      building for multiple variants with the same :term:`Build Directory`,
+      this mechanism ensures that output for different ``libc`` variants is
+      kept separate to avoid potential conflicts.
 
       In the ``defaultsetup.conf`` file, the default value of
       :term:`TCLIBCAPPEND` is "-${TCLIBC}". However, distros such as poky,
@@ -8408,7 +8401,7 @@ system and gives an overview of their function and contents.
          #TMPDIR = "${TOPDIR}/tmp"
 
       An example use for this scenario is to set :term:`TMPDIR` to a local disk,
-      which does not use NFS, while having the Build Directory use NFS.
+      which does not use NFS, while having the :term:`Build Directory` use NFS.
 
       The filesystem used by :term:`TMPDIR` must have standard filesystem
       semantics (i.e. mixed-case files are unique, POSIX file locking, and
@@ -9094,7 +9087,7 @@ system and gives an overview of their function and contents.
       -  :term:`PR`: The recipe revision
 
       As an example, assume a Source Directory top-level folder name
-      ``poky``, a default Build Directory at ``poky/build``, and a
+      ``poky``, a default :term:`Build Directory` at ``poky/build``, and a
       ``qemux86-poky-linux`` machine target system. Furthermore, suppose
       your recipe is named ``foo_1.3.0-r0.bb``. In this case, the work
       directory the build system uses to build the package would be as
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 23a437eb9d..d6bca44947 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -286,9 +286,8 @@ source, you need to do a number of things:
          ESDK_LOCALCONF_ALLOW = "SSTATE_MIRRORS"
 
    -  Alternatively, if you just want to set the :term:`SSTATE_MIRRORS`
-      variable's value for the SDK alone, create a
-      ``conf/sdk-extra.conf`` file either in your
-      :term:`Build Directory` or within any
+      variable's value for the SDK alone, create a ``conf/sdk-extra.conf``
+      file either in your :term:`Build Directory` or within any
       layer and put your :term:`SSTATE_MIRRORS` setting within that file.
 
       .. note::
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 7a09a83af8..927c5a2893 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -116,24 +116,21 @@ build the SDK installer. Follow these steps:
 
       $ source oe-init-build-env
 
-   Among other things, the script
-   creates the :term:`Build Directory`,
-   which is
-   ``build`` in this case and is located in the Source Directory. After
-   the script runs, your current working directory is set to the
-   ``build`` directory.
+   Among other things, the script creates the :term:`Build Directory`, which
+   is ``build`` in this case and is located in the Source Directory. After
+   the script runs, your current working directory is set to the ``build``
+   directory.
 
 4. *Make Sure You Are Building an Installer for the Correct Machine:*
-   Check to be sure that your
-   :term:`MACHINE` variable in the
-   ``local.conf`` file in your Build Directory matches the architecture
+   Check to be sure that your :term:`MACHINE` variable in the ``local.conf``
+   file in your :term:`Build Directory` matches the architecture
    for which you are building.
 
 5. *Make Sure Your SDK Machine is Correctly Set:* If you are building a
    toolchain designed to run on an architecture that differs from your
    current development host machine (i.e. the build host), be sure that
-   the :term:`SDKMACHINE` variable
-   in the ``local.conf`` file in your Build Directory is correctly set.
+   the :term:`SDKMACHINE` variable in the ``local.conf`` file in your
+   :term:`Build Directory` is correctly set.
 
    .. note::
 
@@ -164,7 +161,7 @@ build the SDK installer. Follow these steps:
    that matches your target root filesystem.
 
    When the ``bitbake`` command completes, the SDK installer will be in
-   ``tmp/deploy/sdk`` in the Build Directory.
+   ``tmp/deploy/sdk`` in the :term:`Build Directory`.
 
    .. note::
 
@@ -181,7 +178,7 @@ build the SDK installer. Follow these steps:
          libc-staticdev"
 
 7. *Run the Installer:* You can now run the SDK installer from
-   ``tmp/deploy/sdk`` in the Build Directory. Following is an example::
+   ``tmp/deploy/sdk`` in the :term:`Build Directory`. Following is an example::
 
       $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3e3fa6c05a..ed38ac3f3f 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -64,7 +64,7 @@ binary artefact cache over the network for developers with underpowered laptops.
 Setting up the Extensible SDK environment directly in a Yocto build
 -------------------------------------------------------------------
 
-1. Set up all the needed layers and a Yocto build directory, e.g. a regular Yocto
+1. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
    build where ``bitbake`` can be executed.
 
 2. Run:
@@ -175,7 +175,7 @@ Once you have the SDK installed, you must run the SDK environment setup
 script before you can actually use the SDK.
 
 When using a SDK directly in a Yocto build, you will find the script in
-``tmp/deploy/images/qemux86-64/`` in your build directory.
+``tmp/deploy/images/qemux86-64/`` in your :term:`Build Directory`.
 
 When using a standalone SDK installer, this setup script resides in
 the directory you chose when you installed the SDK, which is either the
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index c5e32cfe09..d4902040f7 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -242,7 +242,7 @@ of post-build steps, including:
 #. Call ``scripts/upload-error-reports`` to send any error reports
    generated to the remote server.
 
-#. Cleanup the build directory using
+#. Cleanup the :term:`Build Directory` using
    :ref:`test-manual/understand-autobuilder:clobberdir` if the build was successful,
    else rename it to "build-renamed" for potential future debugging.
 
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 1bb9f98cca..b181d12d86 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -522,14 +522,13 @@ tasks. You can locate these commands in the
 
    -  When using ``manage.py`` commands given a default configuration,
       you must be sure that your working directory is set to the
-      :term:`Build Directory`. Using
-      ``manage.py`` commands from the Build Directory allows Toaster to
-      find the ``toaster.sqlite`` file, which is located in the Build
-      Directory.
+      :term:`Build Directory`. Using ``manage.py`` commands from the
+      :term:`Build Directory` allows Toaster to find the ``toaster.sqlite``
+      file, which is located in the :term:`Build Directory`.
 
    -  For non-default database configurations, it is possible that you
       can use ``manage.py`` commands from a directory other than the
-      Build Directory. To do so, the ``toastermain/settings.py`` file
+      :term:`Build Directory`. To do so, the ``toastermain/settings.py`` file
       must be configured to point to the correct database backend.
 
 ``buildslist``
@@ -549,7 +548,7 @@ database.
 You need to run the ``buildslist`` command first to identify existing
 builds in the database before using the
 :ref:`toaster-manual/reference:\`\`builddelete\`\`` command. Here is an
-example that assumes default repository and build directory names:
+example that assumes default repository and :term:`Build Directory` names:
 
 .. code-block:: shell
 
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index 72a15b5f2d..c5521edda1 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -23,8 +23,8 @@ Once in that directory, source the build environment script::
 
    $ source oe-init-build-env
 
-Next, from the build directory (e.g.
-``poky/build``), start Toaster using this command::
+Next, from the :term:`Build Directory` (e.g. ``poky/build``), start Toaster
+using this command::
 
    $ source toaster start
 
@@ -124,14 +124,14 @@ causes Toaster to create and use ``$TOASTER_DIR./_toaster_clones``.
 The Build Directory
 ===================
 
-Toaster creates a build directory within your Source Directory (e.g.
+Toaster creates a :term:`Build Directory` within your Source Directory (e.g.
 ``poky``) to execute the builds.
 
 Alternatively, if you would like all of your Toaster related files and
 directories to be in a particular location, you can set the
 ``TOASTER_DIR`` environment variable, which takes precedence over your
 current working directory. Setting this environment variable causes
-Toaster to use ``$TOASTER_DIR/build`` as the build directory.
+Toaster to use ``$TOASTER_DIR/build`` as the :term:`Build Directory`.
 
 Creating a Django Superuser
 ===========================
@@ -152,8 +152,8 @@ superuser by following these steps:
       $ export PATH=$PATH:$HOME/.local/bin
 
 #. From the directory containing the Toaster database, which by default
-   is the :term:`Build Directory`,
-   invoke the ``createsuperuser`` command from ``manage.py``::
+   is the :term:`Build Directory`, invoke the ``createsuperuser`` command from
+   ``manage.py``::
 
       $ cd poky/build
       $ ../bitbake/lib/toaster/manage.py createsuperuser
@@ -179,7 +179,7 @@ example, if you are running Toaster locally, use the following URL::
    http://127.0.0.1:8000/admin
 
 You can use the Django administration interface to set Toaster configuration
-parameters such as the build directory, layer sources, default variable
+parameters such as the :term:`Build Directory`, layer sources, default variable
 values, and BitBake versions.
 
 Setting Up a Production Instance of Toaster
@@ -317,8 +317,7 @@ Perform the following steps to install Toaster:
     the ":ref:`toaster-manual/reference:Configuring Toaster`" section.
 
     This line also runs the ``checksettings`` command, which configures
-    the location of the Toaster :term:`Build Directory`.
-    The Toaster
+    the location of the Toaster :term:`Build Directory`. The Toaster
     root directory ``TOASTER_DIR`` determines where the Toaster build
     directory is created on the file system. In the example above,
     ``TOASTER_DIR`` is set as follows::
@@ -326,7 +325,7 @@ Perform the following steps to install Toaster:
        /var/www/toaster/poky
 
 
-    This setting causes the Toaster build directory to be::
+    This setting causes the Toaster :term:`Build Directory` to be::
 
        /var/www/toaster/poky/build
 
-- 
2.34.1


