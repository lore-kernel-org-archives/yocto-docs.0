Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775C2C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:19:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11534.1784204351879443157
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 05:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fcGb7aKF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 44AACC2B9E9
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6BA5602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82FBA11BD3CDC;
	Thu, 16 Jul 2026 14:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784204348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9oHs50TgbDjU2qqrbE6z2vJjrpFv+I5PN1lgA7Evf0E=;
	b=fcGb7aKFfxzeNwRnFZjK34D2zSI6t8430ejwyN9rPbBybe3weGbhw6854aEn5sOyfc7TQD
	j+e+r3vSRyUnPcoSH2763caSJKnQn6kj19C1F+2YhQr4IKGPwi09zk/DWROv3nMsxJC0bE
	4Qcs7yAdCGi2/y3OjAxyban5PfsK31AhZ7EHpLP0YTIGw/rE6obxxlu3u7h72EswfVOTQs
	eQVVLeg6M3PIJGqvrzrJ4IN76yVJNDtHGVEAsTDpksZVfGxfa0L6mhqYQz3RDsBymE4uTs
	5OFYBv7+tgqLsGDjH/iDlyg4zwheO0k+ZqJUUVJ/vAwBXz5nQaIyS6xTs16j7A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Jul 2026 14:18:31 +0200
Subject: [PATCH v2 1/4] ref-manual/tasks.rst: convert to glossaries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-gen-doc-links-intersphinx-v2-1-83cb3aef6ff6@bootlin.com>
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=210415;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ITMXyfpl16C3Nk1w7cTMBzZqtDqxsZyJO7DkMT6caTg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqWMw6e2EnvyuYwoOdjEKYjunxXT+f0xuHj0coK
 9DcH8L+qtyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaljMOgAKCRDRgEFAKaOo
 NnRoD/93LiedziGQOEJ4G8Bb1kfzLbJlneDh8TQxvvPZRyBDhFaNSSNbLtw410EiNQtK1bhSic6
 5PNLu/ilrbVINZy3uLzwKiG4OSI1GPnnaUGdTREliXsel1nWnmIkErrxCZhiwKiURuSh9YHgp38
 01tvwTJt+S+uBM5QKb4jBfN70GvD9RKn87/2+beMe81ljF42QkMKhOnqdCU3+1rxJnT88kogJBB
 13/2BnH/XUWYCH9CtWaLYmwYeqtfZL45wov4msETPIftPS73IErTfsNDegGi8cHSxEGDOpLnBV3
 KWw55ELcdt0mOqdzy8bZXvC4N4r9t8U5bdvLKCjdqCOyXAvET0/cfpS61nlGEjRmA2XRlbdQ/ma
 5xCaKjb8RBFKVpON7jNeLuVTsPDB7qY6qTSx7LKXIqpWuT2+zE/xV5brKd+zTOZDqvEOczwxiEg
 jVR2ATDbo6PeifBtDy8JlzsKVPyjwmwKuidd/msNHfZvYj7uGrJkjMhueqLVEH+xctjGCFBuDAK
 kyLKa0YEnlZVjGkjONyljB0G7fKkhyuRE4nbOrmf3SeYsy/R7G/3g0H6CE/TTMZ/T2xdG4Nc5hp
 2Fz25X0xOpHylHbuUBihGQ+/+l/woIagUG5X0FQX7ItIZF+Qo/gModduA2/6WOJBQw880bwLynJ
 G05UcxKF8fdqIDQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10087

In preparation following changes, this allows us to use tasks
references with :term:`do_<taskname>` and creates HTTP links with the
"#term-<taskname>" id, thus keeping the original task name preserved.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../contributor-guide/recipe-style-guide.rst       |   20 +-
 documentation/dev-manual/build-quality.rst         |    2 +-
 documentation/dev-manual/building.rst              |    2 +-
 documentation/dev-manual/debugging.rst             |   32 +-
 documentation/dev-manual/development-shell.rst     |    2 +-
 documentation/dev-manual/devtool.rst               |   14 +-
 documentation/dev-manual/layers.rst                |    6 +-
 documentation/dev-manual/libraries.rst             |    2 +-
 documentation/dev-manual/limiting-resources.rst    |    4 +-
 documentation/dev-manual/multiconfig.rst           |   20 +-
 documentation/dev-manual/new-machine.rst           |    2 +-
 documentation/dev-manual/new-recipe.rst            |   82 +-
 documentation/dev-manual/packages.rst              |    6 +-
 .../dev-manual/python-development-shell.rst        |    2 +-
 documentation/dev-manual/quilt.rst                 |    4 +-
 documentation/dev-manual/speeding-up-build.rst     |    4 +-
 documentation/kernel-dev/common.rst                |   24 +-
 documentation/migration-guides/migration-1.3.rst   |    2 +-
 documentation/migration-guides/migration-1.5.rst   |    4 +-
 documentation/migration-guides/migration-1.6.rst   |    2 +-
 documentation/migration-guides/migration-1.7.rst   |    8 +-
 documentation/migration-guides/migration-1.8.rst   |   10 +-
 documentation/migration-guides/migration-2.1.rst   |   20 +-
 documentation/migration-guides/migration-2.3.rst   |    4 +-
 documentation/migration-guides/migration-2.5.rst   |    2 +-
 documentation/migration-guides/migration-2.6.rst   |    6 +-
 documentation/migration-guides/migration-3.0.rst   |    2 +-
 documentation/migration-guides/migration-3.1.rst   |    2 +-
 documentation/migration-guides/migration-3.2.rst   |   12 +-
 documentation/migration-guides/migration-3.4.rst   |    2 +-
 documentation/migration-guides/migration-4.0.rst   |    6 +-
 documentation/migration-guides/migration-5.1.rst   |   14 +-
 documentation/migration-guides/migration-5.2.rst   |    2 +-
 .../migration-guides/release-notes-3.4.rst         |    2 +-
 .../migration-guides/release-notes-4.2.rst         |    2 +-
 .../migration-guides/release-notes-5.1.rst         |   12 +-
 .../migration-guides/release-notes-5.2.rst         |   14 +-
 .../migration-guides/release-notes-5.3.rst         |    6 +-
 .../migration-guides/release-notes-6.0.rst         |    8 +-
 documentation/overview-manual/concepts.rst         |  150 +--
 documentation/ref-manual/classes.rst               |   60 +-
 documentation/ref-manual/devtool-reference.rst     |    2 +-
 documentation/ref-manual/faq.rst                   |    2 +-
 documentation/ref-manual/features.rst              |    4 +-
 documentation/ref-manual/qa-checks.rst             |   30 +-
 documentation/ref-manual/structure.rst             |   12 +-
 documentation/ref-manual/tasks.rst                 | 1056 +++++++++-----------
 documentation/ref-manual/terms.rst                 |    6 +-
 documentation/ref-manual/variables.rst             |  110 +-
 documentation/test-manual/intro.rst                |    2 +-
 documentation/test-manual/runtime-testing.rst      |    2 +-
 51 files changed, 832 insertions(+), 974 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index f81ffb2ab..42c78cac7 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -159,7 +159,7 @@ general order when possible:
 -  ``inherit ...``
 -  :term:`PACKAGECONFIG`
 -  Build class specific variables such as :term:`EXTRA_OECONF`
--  Tasks such as :ref:`ref-tasks-configure`
+-  Tasks such as :term:`do_configure`
 -  :term:`PACKAGE_ARCH`
 -  :term:`PACKAGES`
 -  :term:`FILES`
@@ -178,15 +178,15 @@ this default order. Examples include:
 Tasks should be ordered based on the order they generally execute. For commonly
 used tasks this would be:
 
--  :ref:`ref-tasks-fetch`
--  :ref:`ref-tasks-unpack`
--  :ref:`ref-tasks-patch`
--  :ref:`ref-tasks-prepare_recipe_sysroot`
--  :ref:`ref-tasks-configure`
--  :ref:`ref-tasks-compile`
--  :ref:`ref-tasks-install`
--  :ref:`ref-tasks-populate_sysroot`
--  :ref:`ref-tasks-package`
+-  :term:`do_fetch`
+-  :term:`do_unpack`
+-  :term:`do_patch`
+-  :term:`do_prepare_recipe_sysroot`
+-  :term:`do_configure`
+-  :term:`do_compile`
+-  :term:`do_install`
+-  :term:`do_populate_sysroot`
+-  :term:`do_package`
 
 Custom tasks should be sorted similarly.
 
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index c2e46b69c..ff51dad64 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -290,7 +290,7 @@ The following list shows the files produced for SDKs:
    information.
 
 -  ``sstate-task-sizes.txt:`` A text file containing name-value pairs
-   with information about task group sizes (e.g. :ref:`ref-tasks-populate_sysroot`
+   with information about task group sizes (e.g. :term:`do_populate_sysroot`
    tasks have a total size). The ``sstate-task-sizes.txt`` file exists
    only when an extensible SDK is created.
 
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 60cb22785..0f7e4e3fb 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -248,7 +248,7 @@ To achieve this, you need to perform some additional steps:
    buildsystem know where the :term:`INITRAMFS_IMAGE` will be located.
 
    Building a system with such configuration will build the kernel using the
-   main configuration but the :ref:`ref-tasks-bundle_initramfs` task will grab the
+   main configuration but the :term:`do_bundle_initramfs` task will grab the
    selected :term:`INITRAMFS_IMAGE` from :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
    instead, resulting in a musl based :term:`Initramfs` image bundled in the kernel
    but a glibc based main image.
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 21fb10537..a28452ea8 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -89,7 +89,7 @@ Viewing Logs from Failed Tasks
 You can find the log for a task in the file
 ``${``\ :term:`WORKDIR`\ ``}/temp/log.do_``\ `taskname`.
 For example, the log for the
-:ref:`ref-tasks-compile` task of the
+:term:`do_compile` task of the
 QEMU minimal image for the x86 machine (``qemux86``) might be in
 ``tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_compile``.
 To see the commands :term:`BitBake` ran
@@ -197,7 +197,7 @@ Here are a few of the available ``oe-pkgdata-util`` subcommands.
       ``${``\ :term:`WORKDIR`\ ``}/packages-split``
       directory of the recipe that generates the package. This directory
       is created by the
-      :ref:`ref-tasks-package` task
+      :term:`do_package` task
       and has one subdirectory for each package the recipe generates,
       which contains the files stored in that package.
 
@@ -264,9 +264,9 @@ format and can be converted to images (e.g. using the ``dot`` tool from
          "libxslt.do_configure" -> "libxml2.do_populate_sysroot"
 
       The above example line reveals that the
-      :ref:`ref-tasks-configure`
+      :term:`do_configure`
       task in ``libxslt`` depends on the
-      :ref:`ref-tasks-populate_sysroot`
+      :term:`do_populate_sysroot`
       task in ``libxml2``, which is a normal
       :term:`DEPENDS` dependency
       between the two recipes.
@@ -314,7 +314,7 @@ BitBake has determined by doing the following:
    corresponds to the task. The ``sigdata`` files contain a pickled
    Python database of all the metadata that went into creating the input
    checksum for the task. As an example, for the
-   :ref:`ref-tasks-fetch` task of the
+   :term:`do_fetch` task of the
    ``db`` recipe, the ``sigdata`` file might be found in the following
    location::
 
@@ -430,7 +430,7 @@ invalidate the cache and force the tasks to run. The steps you can take
 are as simple as changing a function's comments in the source code. For
 example, to invalidate package shared state files, change the comment
 statements of
-:ref:`ref-tasks-package` or the
+:term:`do_package` or the
 comments of one of the functions it calls. Even though the change is
 purely cosmetic, it causes the checksum to be recalculated and forces
 the build system to run the task again.
@@ -445,11 +445,11 @@ Running Specific Tasks
 ======================
 
 Any given recipe consists of a set of tasks. The standard BitBake
-behavior in most cases is: :ref:`ref-tasks-fetch`, :ref:`ref-tasks-unpack`, :ref:`ref-tasks-patch`,
-:ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, :ref:`ref-tasks-install`, :ref:`ref-tasks-package`,
-:ref:`do_package_write_* <ref-tasks-package_write_deb>`, and :ref:`ref-tasks-build`. The default task is
-:ref:`ref-tasks-build` and any tasks on which it depends build first. Some tasks,
-such as :ref:`ref-tasks-devshell`, are not part of the default build chain. If you
+behavior in most cases is: :term:`do_fetch`, :term:`do_unpack`, :term:`do_patch`,
+:term:`do_configure`, :term:`do_compile`, :term:`do_install`, :term:`do_package`,
+:term:`do_package_write_* <do_package_write_deb>`, and :term:`do_build`. The default task is
+:term:`do_build` and any tasks on which it depends build first. Some tasks,
+such as :term:`do_devshell`, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
 use the ``-c`` option in BitBake. Here is an example::
 
@@ -472,7 +472,7 @@ out), then you can use the ``-f`` option.
 .. note::
 
    The reason ``-f`` is never required when running the
-   :ref:`ref-tasks-devshell` task is because the
+   :term:`do_devshell` task is because the
    [\ :ref:`nostamp <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ]
    variable flag is already set for the task.
 
@@ -489,7 +489,7 @@ The following example shows one way you can use the ``-f`` option::
 
 This sequence first builds and then recompiles ``matchbox-desktop``. The
 last command reruns all tasks (basically the packaging tasks) after the
-compile. BitBake recognizes that the :ref:`ref-tasks-compile` task was rerun and
+compile. BitBake recognizes that the :term:`do_compile` task was rerun and
 therefore understands that the other tasks also need to be run again.
 
 Another, shorter way to rerun a task and all
@@ -502,7 +502,7 @@ that depend on it is to use the ``-C`` option.
    option, which is lower-cased.
 
 Using this option invalidates the given task and then runs the
-:ref:`ref-tasks-build` task, which is
+:term:`do_build` task, which is
 the default task if no task is given, and the tasks on which it depends.
 You could replace the final two commands in the previous example with
 the following single command::
@@ -536,7 +536,7 @@ task dependency mechanisms.
 
 
 You can view a list of tasks in a given package by running the
-:ref:`ref-tasks-listtasks` task as follows::
+:term:`do_listtasks` task as follows::
 
    $ bitbake matchbox-desktop -c listtasks
 
@@ -627,7 +627,7 @@ in the log, use the "debug" loglevel.
 
 Here is an example written in Python. The code handles logging for
 a function that determines the number of tasks needed to be run. See the
-":ref:`ref-tasks-listtasks`"
+":term:`do_listtasks`"
 section for additional information::
 
    python do_listtasks() {
diff --git a/documentation/dev-manual/development-shell.rst b/documentation/dev-manual/development-shell.rst
index be26bcffc..b14ebd0cf 100644
--- a/documentation/dev-manual/development-shell.rst
+++ b/documentation/dev-manual/development-shell.rst
@@ -6,7 +6,7 @@ Using a Development Shell
 When debugging certain commands or even when just editing packages,
 ``devshell`` can be a useful tool. When you invoke ``devshell``, all
 tasks up to and including
-:ref:`ref-tasks-patch` are run for the
+:term:`do_patch` are run for the
 specified target. Then, a new terminal is opened and you are placed in
 ``${``\ :term:`S`\ ``}``, the source
 directory. In the new terminal, all the OpenEmbedded build-related
diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index d67f22277..f5ea74fee 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -1169,8 +1169,8 @@ build progresses as follows:
 For recipes in the workspace, fetching and unpacking is disabled as the
 source tree has already been prepared and is persistent. Each of these
 build steps is defined as a function (task), usually with a "do\_" prefix
-(e.g. :ref:`ref-tasks-fetch`,
-:ref:`ref-tasks-unpack`, and so
+(e.g. :term:`do_fetch`,
+:term:`do_unpack`, and so
 forth). These functions are typically shell scripts but can instead be
 written in Python.
 
@@ -1201,12 +1201,12 @@ links created within the source tree:
    useful:
 
    -  ``image/``: Contains all of the files installed during the
-      :ref:`ref-tasks-install` stage.
+      :term:`do_install` stage.
       Within a recipe, this directory is referred to by the expression
       ``${``\ :term:`D`\ ``}``.
 
    -  ``sysroot-destdir/``: Contains a subset of files installed within
-      :ref:`ref-tasks-install` that have been put into the shared sysroot. For
+      :term:`do_install` that have been put into the shared sysroot. For
       more information, see the
       ":ref:`dev-manual/new-recipe:sharing files between recipes`" section.
 
@@ -1250,7 +1250,7 @@ sysroot for the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
 files should be installed into standard locations during the
-:ref:`ref-tasks-install` task within the ``${``\ :term:`D`\ ``}`` directory. A
+:term:`do_install` task within the ``${``\ :term:`D`\ ``}`` directory. A
 subset of these files automatically goes into the sysroot. The reason
 for this limitation is that almost all files that go into the sysroot
 are cataloged in manifests in order to ensure they can be removed later
@@ -1265,8 +1265,8 @@ the target device, it is important to understand packaging because the
 contents of the image are expressed in terms of packages and not
 recipes.
 
-During the :ref:`ref-tasks-package` task, files installed during the
-:ref:`ref-tasks-install` task are split into one main package, which is almost
+During the :term:`do_package` task, files installed during the
+:term:`do_install` task are split into one main package, which is almost
 always named the same as the recipe, and into several other packages. This
 separation exists because not all of those installed files are useful in every
 image. For example, you probably do not need any of the documentation installed
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index dc63478a3..806d7c642 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -609,8 +609,8 @@ important as it ensures that items in the list remain colon-separated.
 The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
 ``rpi`` will exist in the list of :term:`OVERRIDES`, the file
 ``meta-raspberrypi/recipes-bsp/formfactor/formfactor/rpi/machconfig`` will be
-used during :ref:`ref-tasks-fetch` and the test for a non-zero file size in
-:ref:`ref-tasks-install` will return true, and the file will be installed.
+used during :term:`do_fetch` and the test for a non-zero file size in
+:term:`do_install` will return true, and the file will be installed.
 
 Installing Additional Files Using Your Layer
 --------------------------------------------
@@ -667,7 +667,7 @@ file is in the layer at ``recipes-graphics/xorg-xserver``::
 Building off of the previous example, we once again are setting the
 :term:`FILESEXTRAPATHS` variable.  In this case we are also using
 :term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
-the list of :term:`OVERRIDES`.  The :ref:`ref-tasks-install` task will then perform a
+the list of :term:`OVERRIDES`.  The :term:`do_install` task will then perform a
 check for an additional :term:`MACHINE_FEATURES` that if set will cause these
 additional files to be installed.  These additional files are listed in
 :term:`FILES` so that they will be packaged.
diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index 160734729..08a70014a 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -28,7 +28,7 @@ the built library.
 The :term:`PACKAGES` and
 :term:`FILES:* <FILES>` variables in the
 ``meta/conf/bitbake.conf`` configuration file define how files installed
-by the :ref:`ref-tasks-install` task are packaged. By default, the :term:`PACKAGES`
+by the :term:`do_install` task are packaged. By default, the :term:`PACKAGES`
 variable includes ``${PN}-staticdev``, which represents all static
 library files.
 
diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
index 9b3db0a59..7094de0d6 100644
--- a/documentation/dev-manual/limiting-resources.rst
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -32,7 +32,7 @@ details.
    This variable should be set in the form of ``-jN``, where ``N`` is a positive
    integer. This integer controls the number of threads used when starting
    ``make``. Note that this variable is not limited to the usage of ``make``,
-   but extends to the compilation (:ref:`ref-tasks-compile` task) commands
+   but extends to the compilation (:term:`do_compile` task) commands
    defined by the :ref:`ref-classes-meson`, :ref:`ref-classes-cmake` and such
    classes.
 
@@ -48,7 +48,7 @@ details.
 -  :term:`PARALLEL_MAKEINST`:
 
    Like :term:`PARALLEL_MAKE`, but this variable controls the number of threads
-   used during the :ref:`ref-tasks-install` task.
+   used during the :term:`do_install` task.
 
    The default value of :term:`PARALLEL_MAKEINST` is the value of
    :term:`PARALLEL_MAKE`.
diff --git a/documentation/dev-manual/multiconfig.rst b/documentation/dev-manual/multiconfig.rst
index 71fe542ef..661bd61f6 100644
--- a/documentation/dev-manual/multiconfig.rst
+++ b/documentation/dev-manual/multiconfig.rst
@@ -127,9 +127,9 @@ multiple configuration build. For example, suppose that in order to
 build a ``core-image-sato`` image for an "x86" multiconfig, the root
 filesystem of an "arm" multiconfig must exist. This dependency is
 essentially that the
-:ref:`ref-tasks-image` task in the
+:term:`do_image` task in the
 ``core-image-sato`` recipe depends on the completion of the
-:ref:`ref-tasks-rootfs` task of the
+:term:`do_rootfs` task of the
 ``core-image-minimal`` recipe.
 
 To enable dependencies in a multiple configuration build, you must
@@ -145,8 +145,8 @@ to be added to the recipe that builds the ``core-image-sato`` image::
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
 
 In this example, the `from_multiconfig` is "x86". The `to_multiconfig` is "arm". The
-task on which the :ref:`ref-tasks-image` task in the recipe depends is the
-:ref:`ref-tasks-rootfs` task from the ``core-image-minimal`` recipe associated
+task on which the :term:`do_image` task in the recipe depends is the
+:term:`do_rootfs` task from the ``core-image-minimal`` recipe associated
 with the "arm" multiconfig.
 
 Once you set up this dependency, you can build the "x86" multiconfig
@@ -156,7 +156,7 @@ using a BitBake command as follows::
 
 This command executes all the tasks needed to create the
 ``core-image-sato`` image for the "x86" multiconfig. Because of the
-dependency, BitBake also executes through the :ref:`ref-tasks-rootfs` task for the
+dependency, BitBake also executes through the :term:`do_rootfs` task for the
 "arm" multiconfig build.
 
 Having a recipe depend on the root filesystem of another build might not
@@ -188,10 +188,10 @@ Suggested best practices
 -  Recipes that are used to transfer the output from a multiconfig build to
    another should use ``do_task[mcdepends]`` to trigger the build of the
    component, and then transfer the item to the current configuration in
-   :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy`, assuming the value of
+   :term:`do_install` and :term:`do_deploy`, assuming the value of
    the deployed item based on :term:`TMPDIR`.
 
-   The :ref:`ref-tasks-install` and :ref:`ref-tasks-deploy` tasks should look
+   The :term:`do_install` and :term:`do_deploy` tasks should look
    like this::
 
       do_install() {
@@ -276,8 +276,8 @@ dependency in ``my-parent-firmware.bb`` with::
 
    do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
 
-The above will ensure that when the :ref:`ref-tasks-compile` task of
-``my-parent-firmware`` is triggered, the :ref:`ref-tasks-deploy` task of
+The above will ensure that when the :term:`do_compile` task of
+``my-parent-firmware`` is triggered, the :term:`do_deploy` task of
 ``my-firmware`` will already have run successfully.
 
 Using the output of ``my-firmware``
@@ -302,7 +302,7 @@ cache <overview-manual/concepts:shared state cache>`.
 Additionally, ``<machine>`` should be replaced by the :term:`MACHINE` for which
 we are building in the baremetal-firmware context.
 
-We can then add a :ref:`ref-tasks-install` task to ``my-parent-firmware``::
+We can then add a :term:`do_install` task to ``my-parent-firmware``::
 
    do_install() {
        install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/my-firmware.elf
diff --git a/documentation/dev-manual/new-machine.rst b/documentation/dev-manual/new-machine.rst
index 469b2d395..785bf34f5 100644
--- a/documentation/dev-manual/new-machine.rst
+++ b/documentation/dev-manual/new-machine.rst
@@ -64,7 +64,7 @@ you can use as references.
 If you are creating a new kernel recipe, normal recipe-writing rules
 apply for setting up a :term:`SRC_URI`. Thus, you need to specify any
 necessary patches and set :term:`S` to point at the source code. You need to
-create a :ref:`ref-tasks-configure` task that configures the unpacked kernel with
+create a :term:`do_configure` task that configures the unpacked kernel with
 a ``defconfig`` file. You can do this by using a ``make defconfig``
 command or, more commonly, by copying in a suitable ``defconfig`` file
 and then running ``make oldconfig``. By making use of ``inherit kernel``
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 6888bb46a..46c43b642 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -268,11 +268,11 @@ located. For a graphical representation of source locations, see the
 ":ref:`overview-manual/concepts:sources`" section in
 the Yocto Project Overview and Concepts Manual.
 
-The :ref:`ref-tasks-fetch` task uses the prefix of each entry in the
+The :term:`do_fetch` task uses the prefix of each entry in the
 :term:`SRC_URI` variable value to determine which
 :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
 to use to get your source files. It is the :term:`SRC_URI` variable that triggers
-the fetcher. The :ref:`ref-tasks-patch` task uses the variable after source is
+the fetcher. The :term:`do_patch` task uses the variable after source is
 fetched to apply patches. The OpenEmbedded build system uses
 :term:`FILESOVERRIDES` for scanning directory locations for local files in
 :term:`SRC_URI`.
@@ -296,7 +296,7 @@ where the source comes from a single tarball. Notice the use of the
 Files mentioned in :term:`SRC_URI` whose names end in a typical archive
 extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
 forth), are automatically extracted during the
-:ref:`ref-tasks-unpack` task. For
+:term:`do_unpack` task. For
 another example that specifies these types of files, see the
 ":ref:`dev-manual/new-recipe:building an autotooled package`" section.
 
@@ -404,7 +404,7 @@ Unpacking Code
 ==============
 
 During the build, the
-:ref:`ref-tasks-unpack` task unpacks
+:term:`do_unpack` task unpacks
 the source with ``${``\ :term:`S`\ ``}``
 pointing to where it is unpacked.
 
@@ -429,7 +429,7 @@ Sometimes it is necessary to patch code after it has been fetched. Any
 files mentioned in :term:`SRC_URI` whose names end in ``.patch`` or
 ``.diff`` or compressed versions of these suffixes (e.g. ``diff.gz``,
 ``patch.bz2``, etc.) are treated as patches. The
-:ref:`ref-tasks-patch` task
+:term:`do_patch` task
 automatically applies these patches.
 
 The build system should be able to apply patches with the "-p1" option
@@ -537,7 +537,7 @@ your software is built:
 
    When using Autotools, your recipe needs to inherit the
    :ref:`ref-classes-autotools` class and it does not have to
-   contain a :ref:`ref-tasks-configure` task. However, you might still want to
+   contain a :term:`do_configure` task. However, you might still want to
    make some adjustments. For example, you can set :term:`EXTRA_OECONF` or
    :term:`PACKAGECONFIG_CONFARGS` to pass any needed configure options that
    are specific to the recipe.
@@ -548,7 +548,7 @@ your software is built:
 
    When you use CMake, your recipe needs to inherit the
    :ref:`ref-classes-cmake` class and it does not have to contain a
-   :ref:`ref-tasks-configure` task. You can make some adjustments by setting
+   :term:`do_configure` task. You can make some adjustments by setting
    :term:`EXTRA_OECMAKE` to pass any needed configure options that are
    specific to the recipe.
 
@@ -556,13 +556,13 @@ your software is built:
 
       If you need to install one or more custom CMake toolchain files
       that are supplied by the application you are building, install the
-      files to ``${D}${datadir}/cmake/Modules`` during :ref:`ref-tasks-install`.
+      files to ``${D}${datadir}/cmake/Modules`` during :term:`do_install`.
 
 -  *Other:* If your source files do not have a ``configure.ac`` or
    ``CMakeLists.txt`` file, then your software is built using some
    method other than Autotools or CMake. If this is the case, you
    normally need to provide a
-   :ref:`ref-tasks-configure` task
+   :term:`do_configure` task
    in your recipe unless, of course, there is nothing to configure.
 
    Even if your software is not being built by Autotools or CMake, you
@@ -651,8 +651,8 @@ out-of-tree modules. Your recipe will also need the following::
 Compilation
 ===========
 
-During a build, the :ref:`ref-tasks-compile` task happens after source is fetched,
-unpacked, and configured. If the recipe passes through :ref:`ref-tasks-compile`
+During a build, the :term:`do_compile` task happens after source is fetched,
+unpacked, and configured. If the recipe passes through :term:`do_compile`
 successfully, nothing needs to be done.
 
 However, if the compile step fails, you need to diagnose the failure.
@@ -714,7 +714,7 @@ Here are some common issues that cause failures.
 Installing
 ==========
 
-During :ref:`ref-tasks-install`, the task copies the built files along with their
+During :term:`do_install`, the task copies the built files along with their
 hierarchy to locations that would mirror their locations on the target
 device. The installation process copies files from the
 ``${``\ :term:`S`\ ``}``,
@@ -732,14 +732,14 @@ the software being built:
 -  *Autotools and CMake:* If the software your recipe is building uses
    Autotools or CMake, the OpenEmbedded build system understands how to
    install the software. Consequently, you do not have to have a
-   :ref:`ref-tasks-install` task as part of your recipe. You just need to make
+   :term:`do_install` task as part of your recipe. You just need to make
    sure the install portion of the build completes with no issues.
    However, if you wish to install additional files not already being
    installed by ``make install``, you should do this using a
    ``do_install:append`` function using the install command as described
    in the "Manual" bulleted item later in this list.
 
--  *Other (using* ``make install``\ *)*: You need to define a :ref:`ref-tasks-install`
+-  *Other (using* ``make install``\ *)*: You need to define a :term:`do_install`
    function in your recipe. The function should call
    ``oe_runmake install`` and will likely need to pass in the
    destination directory as well. How you pass that path is dependent on
@@ -749,7 +749,7 @@ the software being built:
    For an example recipe using ``make install``, see the
    ":ref:`dev-manual/new-recipe:building a makefile-based package`" section.
 
--  *Manual:* You need to define a :ref:`ref-tasks-install` function in your
+-  *Manual:* You need to define a :term:`do_install` function in your
    recipe. The function must first use ``install -d`` to create the
    directories under
    ``${``\ :term:`D`\ ``}``. Once the
@@ -772,17 +772,17 @@ installed correctly.
       might need to replace hard-coded paths in an initscript with
       values of variables provided by the build system, such as
       replacing ``/usr/bin/`` with ``${bindir}``. If you do perform such
-      modifications during :ref:`ref-tasks-install`, be sure to modify the
+      modifications during :term:`do_install`, be sure to modify the
       destination file after copying rather than before copying.
       Modifying after copying ensures that the build system can
-      re-execute :ref:`ref-tasks-install` if needed.
+      re-execute :term:`do_install` if needed.
 
    -  ``oe_runmake install``, which can be run directly or can be run
       indirectly by the :ref:`ref-classes-autotools` and
       :ref:`ref-classes-cmake` classes, runs ``make install`` in parallel.
       Sometimes, a Makefile can have missing dependencies between targets that
       can result in race conditions. If you experience intermittent failures
-      during :ref:`ref-tasks-install`, you might be able to work around them by
+      during :term:`do_install`, you might be able to work around them by
       disabling parallel Makefile installs by adding the following to the
       recipe::
 
@@ -793,7 +793,7 @@ installed correctly.
    -  If you need to install one or more custom CMake toolchain files
       that are supplied by the application you are building, install the
       files to ``${D}${datadir}/cmake/Modules`` during
-      :ref:`ref-tasks-install`.
+      :term:`do_install`.
 
 Enabling System Services
 ========================
@@ -805,7 +805,7 @@ additional definitions in your recipe.
 If you are adding services and the service initialization script or the
 service file itself is not installed, you must provide for that
 installation in your recipe using a ``do_install:append`` function. If
-your recipe already has a :ref:`ref-tasks-install` function, update the function
+your recipe already has a :term:`do_install` function, update the function
 near its end rather than adding an additional ``do_install:append``
 function.
 
@@ -850,10 +850,10 @@ Successful packaging is a combination of automated processes performed
 by the OpenEmbedded build system and some specific steps you need to
 take. The following list describes the process:
 
--  *Splitting Files*: The :ref:`ref-tasks-package` task splits the files produced
+-  *Splitting Files*: The :term:`do_package` task splits the files produced
    by the recipe into logical components. Even software that produces a
    single binary might still have debug symbols, documentation, and
-   other logical components that should be split out. The :ref:`ref-tasks-package`
+   other logical components that should be split out. The :term:`do_package`
    task ensures that files are split up and packaged correctly.
 
 -  *Running QA Checks*: The :ref:`ref-classes-insane` class adds a
@@ -935,15 +935,15 @@ recipe has two sysroots in its work directory, one for target files
 Recipes should never populate the sysroot directly (i.e. write files
 into sysroot). Instead, files should be installed into standard
 locations during the
-:ref:`ref-tasks-install` task within
+:term:`do_install` task within
 the ``${``\ :term:`D`\ ``}`` directory. The
 reason for this limitation is that almost all files that populate the
 sysroot are cataloged in manifests in order to ensure the files can be
 removed later when a recipe is either modified or removed. Thus, the
 sysroot is able to remain free from stale files.
 
-A subset of the files installed by the :ref:`ref-tasks-install` task are
-used by the :ref:`ref-tasks-populate_sysroot` task as defined by the
+A subset of the files installed by the :term:`do_install` task are
+used by the :term:`do_populate_sysroot` task as defined by the
 :term:`SYSROOT_DIRS` variable to automatically populate the sysroot. It
 is possible to modify the list of directories that populate the sysroot.
 The following example shows how you could add the ``/opt`` directory to
@@ -957,7 +957,7 @@ the list of directories within a recipe::
    that are not included in the target filesystem, allowing them to share
    these artifacts without needing to use the :term:`DEPLOY_DIR`.
 
-For a more complete description of the :ref:`ref-tasks-populate_sysroot`
+For a more complete description of the :term:`do_populate_sysroot`
 task and its associated functions, see the
 :ref:`staging <ref-classes-staging>` class.
 
@@ -1101,7 +1101,7 @@ target. You can use ``pkg_postinst_ontarget()`` or call
 ``postinst_intercept delay_to_first_boot`` from ``pkg_postinst()``. Any
 failure of a ``pkg_postinst()`` script (including exit 1) triggers an
 error during the
-:ref:`ref-tasks-rootfs` task.
+:term:`do_rootfs` task.
 
 If you have recipes that use ``pkg_postinst`` function and they require
 the use of non-standard native tools that have dependencies during
@@ -1155,8 +1155,8 @@ Building a Single .c File Package
 
 Building an application from a single file that is stored locally (e.g. under
 ``files``) requires a recipe that has the file listed in the :term:`SRC_URI`
-variable. Additionally, you need to manually write the :ref:`ref-tasks-compile`
-and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
+variable. Additionally, you need to manually write the :term:`do_compile`
+and :term:`do_install` tasks. The :term:`S` variable defines the
 directory containing the source code, which is set to :term:`UNPACKDIR` in this
 case --- the directory BitBake uses for the build::
 
@@ -1187,13 +1187,13 @@ Building a Makefile-Based Package
 ---------------------------------
 
 Applications built with GNU ``make`` require a recipe that has the source archive
-listed in :term:`SRC_URI`. You do not need to add a :ref:`ref-tasks-compile`
+listed in :term:`SRC_URI`. You do not need to add a :term:`do_compile`
 step since by default BitBake starts the ``make`` command to compile the
 application. If you need additional ``make`` options, you should store them in
 the :term:`EXTRA_OEMAKE` or :term:`PACKAGECONFIG_CONFARGS` variables. BitBake
 passes these options into the GNU ``make`` invocation. Note that a
-:ref:`ref-tasks-install` task is still required. Otherwise, BitBake runs an
-empty :ref:`ref-tasks-install` task by default.
+:term:`do_install` task is still required. Otherwise, BitBake runs an
+empty :term:`do_install` task by default.
 
 Some applications might require extra parameters to be passed to the
 compiler. For example, the application might need an additional header
@@ -1345,9 +1345,9 @@ locations for build artifacts.  In most cases, the
 :ref:`ref-classes-bin-package` class handles "skipping" the configure and
 compile steps as well as sets things up to grab packages from the appropriate
 area. In particular, this class sets ``noexec`` on both the
-:ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` tasks, sets
+:term:`do_configure` and :term:`do_compile` tasks, sets
 ``FILES:${PN}`` to "/" so that it picks up all files, and sets up a
-:ref:`ref-tasks-install` task, which effectively copies all files from ``${S}``
+:term:`do_install` task, which effectively copies all files from ``${S}``
 to ``${D}``. The :ref:`ref-classes-bin-package` class works well when the files
 extracted into ``${S}`` are already laid out in the way they should be laid out
 on the target. For more information on these variables, see the :term:`FILES`,
@@ -1374,15 +1374,15 @@ If you cannot use the :ref:`ref-classes-bin-package` class, you need to be sure
 doing the following:
 
 -  Create a recipe where the
-   :ref:`ref-tasks-configure` and
-   :ref:`ref-tasks-compile` tasks do
+   :term:`do_configure` and
+   :term:`do_compile` tasks do
    nothing: It is usually sufficient to just not define these tasks in
    the recipe, because the default implementations do nothing unless a
    Makefile is found in
    ``${``\ :term:`S`\ ``}``.
 
    If ``${S}`` might contain a Makefile, or if you inherit some class
-   that replaces :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` with custom
+   that replaces :term:`do_configure` and :term:`do_compile` with custom
    versions, then you can use the
    ``[``\ :ref:`noexec <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
    flag to turn the tasks into no-ops, as follows::
@@ -1391,11 +1391,11 @@ doing the following:
       do_compile[noexec] = "1"
 
    Unlike :ref:`bitbake-user-manual/bitbake-user-manual-metadata:deleting a task`,
-   using the flag preserves the dependency chain from the :ref:`ref-tasks-fetch`,
-   :ref:`ref-tasks-unpack`, and :ref:`ref-tasks-patch` tasks to the
-   :ref:`ref-tasks-install` task.
+   using the flag preserves the dependency chain from the :term:`do_fetch`,
+   :term:`do_unpack`, and :term:`do_patch` tasks to the
+   :term:`do_install` task.
 
--  Make sure your :ref:`ref-tasks-install` task installs the binaries
+-  Make sure your :term:`do_install` task installs the binaries
    appropriately.
 
 -  Ensure that you set up :term:`FILES`
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index c75584c93..90ec9af70 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -283,10 +283,10 @@ with a number. The number used depends on the state of the PR Service:
       change in the source code (``SRCREV``).
 
    -  ``r0.X`` changed from ``r0.0`` to ``r0.1``. This is because the hash of
-      the :ref:`ref-tasks-package` task changed.
+      the :term:`do_package` task changed.
 
       The reason for this change can be many. To understand why the hash of the
-      :ref:`ref-tasks-package` task changed, you can run the following command:
+      :term:`do_package` task changed, you can run the following command:
 
       .. code-block:: console
 
@@ -351,7 +351,7 @@ The previous example specifies a number of things in the call to
 ``do_split_packages``.
 
 -  A directory within the files installed by your recipe through
-   :ref:`ref-tasks-install` in which to search.
+   :term:`do_install` in which to search.
 
 -  A regular expression used to match module files in that directory. In
    the example, note the parentheses () that mark the part of the
diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 075630432..77dbc2d0a 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -8,7 +8,7 @@ previous section, you can also spawn and work within an interactive
 Python development shell. When debugging certain commands or even when
 just editing packages, ``pydevshell`` can be a useful tool. When you
 invoke the ``pydevshell`` task, all tasks up to and including
-:ref:`ref-tasks-patch` are run for the
+:term:`do_patch` are run for the
 specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
 BitBake tasks, in particular, the data store 'd'. So, commands such as
diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
index 59240705a..2bfe977ff 100644
--- a/documentation/dev-manual/quilt.rst
+++ b/documentation/dev-manual/quilt.rst
@@ -46,7 +46,7 @@ Follow these general steps:
    you added to the patch.
 
 #. *Test Your Changes:* Once you have modified the source code, the
-   easiest way to test your changes is by calling the :ref:`ref-tasks-compile`
+   easiest way to test your changes is by calling the :term:`do_compile`
    task as shown in the following example::
 
       $ bitbake -c compile -f package
@@ -58,7 +58,7 @@ Follow these general steps:
    .. note::
 
       All the modifications you make to the temporary source code disappear
-      once you run the :ref:`ref-tasks-clean` or :ref:`ref-tasks-cleanall`
+      once you run the :term:`do_clean` or :term:`do_cleanall`
       tasks using BitBake (i.e. ``bitbake -c clean package`` and
       ``bitbake -c cleanall package``). Modifications will also disappear if
       you use the :ref:`ref-classes-rm-work` feature as described in
diff --git a/documentation/dev-manual/speeding-up-build.rst b/documentation/dev-manual/speeding-up-build.rst
index 262935313..3c6e9cfe3 100644
--- a/documentation/dev-manual/speeding-up-build.rst
+++ b/documentation/dev-manual/speeding-up-build.rst
@@ -19,12 +19,12 @@ variable for more information:
 
 -  :term:`PARALLEL_MAKE`: Extra
    options passed to the ``make`` command during the
-   :ref:`ref-tasks-compile` task in
+   :term:`do_compile` task in
    order to specify parallel compilation on the local build host.
 
 -  :term:`PARALLEL_MAKEINST`:
    Extra options passed to the ``make`` command during the
-   :ref:`ref-tasks-install` task in
+   :term:`do_install` task in
    order to specify parallel installation on the local build host.
 
 As mentioned, these variables all scale to the number of processor cores
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 136524e63..90feb2f73 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -531,7 +531,7 @@ variable (search directories) to include the ``${PN}`` directory you
 created to hold the configuration changes.
 
 You can also use a regular ``defconfig`` file, as generated by the
-:ref:`ref-tasks-savedefconfig`
+:term:`do_savedefconfig`
 task instead of a complete ``.config`` file. This only specifies the
 non-default configuration values.  You need to additionally set
 :term:`KCONFIG_MODE`
@@ -997,7 +997,7 @@ environment, you must do the following:
       libtinfo-dev
 
 The following commands initialize the BitBake environment, run the
-:ref:`ref-tasks-kernel_configme`
+:term:`do_kernel_configme`
 task, and launch ``menuconfig``. These commands assume the Source
 Directory's top-level folder is ``work``::
 
@@ -1231,7 +1231,7 @@ Validating Configuration
 ------------------------
 
 You can use the
-:ref:`ref-tasks-kernel_configcheck`
+:term:`do_kernel_configcheck`
 task to provide configuration validation::
 
    $ bitbake linux-yocto -c kernel_configcheck -f
@@ -1245,7 +1245,7 @@ In order to run this task, you must have an existing ``.config`` file.
 See the ":ref:`kernel-dev/common:using ``menuconfig```" section for
 information on how to create a configuration file.
 
-Here is sample output from the :ref:`ref-tasks-kernel_configcheck` task:
+Here is sample output from the :term:`do_kernel_configcheck` task:
 
 .. code-block:: none
 
@@ -1309,9 +1309,9 @@ The output describes the various problems that you can encounter along
 with where to find the offending configuration items. You can use the
 information in the logs to adjust your configuration files and then
 repeat the
-:ref:`ref-tasks-kernel_configme`
+:term:`do_kernel_configme`
 and
-:ref:`ref-tasks-kernel_configcheck`
+:term:`do_kernel_configcheck`
 tasks until they produce no warnings.
 
 For more information on how to use the ``menuconfig`` tool, see the
@@ -1325,7 +1325,7 @@ possible by reading the output of the kernel configuration fragment
 audit, noting any issues, making changes to correct the issues, and then
 repeating.
 
-As part of the kernel build process, the :ref:`ref-tasks-kernel_configcheck` task
+As part of the kernel build process, the :term:`do_kernel_configcheck` task
 runs. This task validates the kernel configuration by checking the final
 ``.config`` file against the input files. During the check, the task
 produces warning messages for the following issues:
@@ -1344,7 +1344,7 @@ produces warning messages for the following issues:
 
 .. note::
 
-   The :ref:`ref-tasks-kernel_configcheck` task can also optionally report if
+   The :term:`do_kernel_configcheck` task can also optionally report if
    an option is overridden during processing.
 
 For each output warning, a message points to the file that contains a
@@ -1359,13 +1359,13 @@ To streamline the configuration, do the following:
    successfully. Use this configuration file as your baseline.
 
 #. *Run Configure and Check Tasks:* Separately run the
-   :ref:`ref-tasks-kernel_configme` and :ref:`ref-tasks-kernel_configcheck` tasks::
+   :term:`do_kernel_configme` and :term:`do_kernel_configcheck` tasks::
 
       $ bitbake linux-yocto -c kernel_configme -f
       $ bitbake linux-yocto -c kernel_configcheck -f
 
 #. *Process the Results:* Take the resulting list of files from the
-   :ref:`ref-tasks-kernel_configcheck` task warnings and do the following:
+   :term:`do_kernel_configcheck` task warnings and do the following:
 
    -  Drop values that are redefined in the fragment but do not change
       the final ``.config`` file.
@@ -1379,7 +1379,7 @@ To streamline the configuration, do the following:
 
 #. *Re-Run Configure and Check Tasks:* After you have worked through the
    output of the kernel configuration audit, you can re-run the
-   :ref:`ref-tasks-kernel_configme` and :ref:`ref-tasks-kernel_configcheck` tasks to see the
+   :term:`do_kernel_configme` and :term:`do_kernel_configcheck` tasks to see the
    results of your changes. If you have more issues, you can deal with
    them as described in the previous step.
 
@@ -1619,7 +1619,7 @@ The important point to note here is the :term:`KERNEL_SRC` variable. The
 :ref:`ref-classes-module` class sets this variable and the :term:`KERNEL_PATH`
 variable to ``${STAGING_KERNEL_DIR}`` with the necessary Linux kernel build
 information to build modules. If your module ``Makefile`` uses a different
-variable, you might want to override the :ref:`ref-tasks-compile` step, or
+variable, you might want to override the :term:`do_compile` step, or
 create a patch to the ``Makefile`` to work with the more typical
 :term:`KERNEL_SRC` or :term:`KERNEL_PATH` variables.
 
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 594320d5e..f523fc2d8 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -62,7 +62,7 @@ Previously, an inconsistent mix of spaces and tabs existed, which made
 extending these functions using ``_append`` or ``_prepend`` complicated
 given that Python treats whitespace as syntactically significant. If you
 are defining or extending any Python functions (e.g.
-``populate_packages``, :ref:`ref-tasks-unpack`, :ref:`ref-tasks-patch` and so forth) in
+``populate_packages``, :term:`do_unpack`, :term:`do_patch` and so forth) in
 custom recipes or classes, you need to ensure you are using consistent
 four-space indentation.
 
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index c21b52cf2..a9dbfb11f 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -92,7 +92,7 @@ The following changes have been made to the package QA checks:
 
 -  An additional QA check has been added to check if
    ``/usr/share/info/dir`` is being installed. Your recipe should delete
-   this file within :ref:`ref-tasks-install` if "make
+   this file within :term:`do_install` if "make
    install" is installing it.
 
 -  If you are using the :ref:`ref-classes-buildhistory` class, the check for the
@@ -208,7 +208,7 @@ postinstall scripts.
 Images Now Rebuild Only on Changes Instead of Every Time
 --------------------------------------------------------
 
-The :ref:`ref-tasks-rootfs` and other related image
+The :term:`do_rootfs` and other related image
 construction tasks are no longer marked as "nostamp". Consequently, they
 will only be re-executed when their inputs have changed. Previous
 versions of the OpenEmbedded build system always rebuilt the image when
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index b052a43a3..4c3ff3c2d 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -117,7 +117,7 @@ will need to add ``2>&1`` (or something similar) to the end of your
 ``task-``\ taskname overrides have been adjusted so that tasks whose
 names contain underscores have the underscores replaced by hyphens for
 the override so that they now function properly. For example, the task
-override for :ref:`ref-tasks-populate_sdk` is
+override for :term:`do_populate_sdk` is
 ``task-populate-sdk``.
 
 .. _migration-1.6-variable-changes:
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 1a5704fd4..705c952ff 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -159,15 +159,15 @@ The following changes have occurred to the QA check process:
    see the ":doc:`/ref-manual/qa-checks`" chapter.
 
 -  Package QA checks are now performed during a new
-   :ref:`ref-tasks-package_qa` task rather than being
-   part of the :ref:`ref-tasks-package` task. This allows
+   :term:`do_package_qa` task rather than being
+   part of the :term:`do_package` task. This allows
    more parallel execution. This change is unlikely to be an issue
    except for highly customized recipes that disable packaging tasks
    themselves by marking them as ``noexec``. For those packages, you
-   will need to disable the :ref:`ref-tasks-package_qa` task as well.
+   will need to disable the :term:`do_package_qa` task as well.
 
 -  Files being overwritten during the
-   :ref:`ref-tasks-populate_sysroot` task now
+   :term:`do_populate_sysroot` task now
    trigger an error instead of a warning. Recipes should not be
    overwriting files written to the sysroot by other recipes. If you
    have these types of recipes, you need to alter them so that they do
diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index 5cc5f8a04..ba1f0ca3e 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -75,7 +75,7 @@ area and to place build artifacts separately in the source code tree. In theory,
 migration paths have been provided for most common usages in kernel recipes but
 this might not work in all cases. In particular, users need to ensure that
 ``${S}`` (source files) and ``${B}`` (build artifacts) are used correctly in
-functions such as :ref:`ref-tasks-configure` and :ref:`ref-tasks-install`. For
+functions such as :term:`do_configure` and :term:`do_install`. For
 kernel recipes that do not inherit from :ref:`ref-classes-kernel-yocto` or
 include ``linux-yocto.inc``, you might wish to refer to the ``linux.inc`` file
 in the ``meta-oe`` layer for the kinds of changes you need to make. For reference,
@@ -85,7 +85,7 @@ where the ``linux.inc`` file in ``meta-oe`` was updated.
 
 Recipes that rely on the kernel source code and do not inherit the
 :ref:`module <ref-classes-module>` classes might need to add explicit
-dependencies on the :ref:`ref-tasks-shared_workdir` kernel task, for example::
+dependencies on the :term:`do_shared_workdir` kernel task, for example::
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -124,11 +124,11 @@ Rebuild Improvements
 
 Changes have been made to the :ref:`ref-classes-base`,
 :ref:`ref-classes-autotools`, and :ref:`ref-classes-cmake` classes to clean out
-generated files when the :ref:`ref-tasks-configure` task needs to be
+generated files when the :term:`do_configure` task needs to be
 re-executed.
 
 One of the improvements is to attempt to run "make clean" during the
-:ref:`ref-tasks-configure` task if a ``Makefile`` exists. Some software packages
+:term:`do_configure` task if a ``Makefile`` exists. Some software packages
 do not provide a working clean target within their make files. If you
 have such recipes, you need to set
 :term:`CLEANBROKEN` to "1" within the recipe, for example::
@@ -155,7 +155,7 @@ The following QA Check and Validation Changes have occurred:
 -  :term:`S` now needs to be set to a valid value within a
    recipe. If :term:`S` is not set in the recipe, the directory is not
    automatically created. If :term:`S` does not point to a directory that
-   exists at the time the :ref:`ref-tasks-unpack` task
+   exists at the time the :term:`do_unpack` task
    finishes, a warning will be shown.
 
 -  :term:`LICENSE` is now validated for correct
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 4d7aa15af..53fd30ccc 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -107,15 +107,15 @@ class, ``ac_cv_sizeof_off_t`` is no longer cached in the site files for
 as was previously assumed. Rather, the value changes based on whether
 large file support is enabled. For most software that uses ``autoconf``,
 this change should not be a problem. However, if you have a recipe that
-bypasses the standard :ref:`ref-tasks-configure` task
+bypasses the standard :term:`do_configure` task
 from the :ref:`ref-classes-autotools` class and the software the recipe is building
 uses a very old version of ``autoconf``, the recipe might be incapable
-of determining the correct size of ``off_t`` during :ref:`ref-tasks-configure`.
+of determining the correct size of ``off_t`` during :term:`do_configure`.
 
 The best course of action is to patch the software as necessary to allow
 the default implementation from the :ref:`ref-classes-autotools` class to work such
 that ``autoreconf`` succeeds and produces a working configure script,
-and to remove the overridden :ref:`ref-tasks-configure` task such that the default
+and to remove the overridden :term:`do_configure` task such that the default
 implementation does get used.
 
 .. _migration-2.1-image-generation-split-out-from-filesystem-generation:
@@ -123,19 +123,19 @@ implementation does get used.
 Image Generation is Now Split Out from Filesystem Generation
 ------------------------------------------------------------
 
-Previously, for image recipes the :ref:`ref-tasks-rootfs`
+Previously, for image recipes the :term:`do_rootfs`
 task assembled the filesystem and then from that filesystem generated
 images. With this Yocto Project release, image generation is split into
-separate :ref:`ref-tasks-image` tasks for clarity both in
+separate :term:`do_image` tasks for clarity both in
 operation and in the code.
 
 For most cases, this change does not present any problems. However, if
-you have made customizations that directly modify the :ref:`ref-tasks-rootfs` task
-or that mention :ref:`ref-tasks-rootfs`, you might need to update those changes.
-In particular, if you had added any tasks after :ref:`ref-tasks-rootfs`, you
+you have made customizations that directly modify the :term:`do_rootfs` task
+or that mention :term:`do_rootfs`, you might need to update those changes.
+In particular, if you had added any tasks after :term:`do_rootfs`, you
 should make edits so that those tasks are after the
-:ref:`ref-tasks-image-complete` task rather than
-after :ref:`ref-tasks-rootfs` so that your added tasks run at the correct
+:term:`do_image_complete` task rather than
+after :term:`do_rootfs` so that your added tasks run at the correct
 time.
 
 A minor part of this restructuring is that the post-processing definitions and
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 60340b959..8b43334f2 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -32,7 +32,7 @@ Consider the following:
    the :term:`PACKAGE_WRITE_DEPS` variable.
    Specifying these dependencies ensures that these tools are available
    if these scripts need to be run on the build host during the
-   :ref:`ref-tasks-rootfs` task.
+   :term:`do_rootfs` task.
 
    As an example, see the ``dbus`` recipe. You will see that this recipe
    has a ``pkg_postinst`` that calls ``systemctl`` if "systemd" is in
@@ -196,7 +196,7 @@ The following changes took place for BitBake:
    when the "protocol" parameter is set to "svn+ssh". You can only use
    the new parameter to specify the ``ssh`` program used by SVN. The SVN
    fetcher passes the new parameter through the ``SVN_SSH`` environment
-   variable during the :ref:`ref-tasks-fetch` task.
+   variable during the :term:`do_fetch` task.
 
    See the
    ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:subversion (svn) fetcher (\`\`svn://\`\`)`"
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index facf5110b..b21d1e5aa 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -257,7 +257,7 @@ Miscellaneous Changes
    ``pkg_postinst_ontarget()`` or call
    ``postinst_intercept delay_to_first_boot`` from ``pkg_postinst()``.
    Any failure of a ``pkg_postinst()`` script (including ``exit 1``)
-   will trigger a warning during :ref:`ref-tasks-rootfs`.
+   will trigger a warning during :term:`do_rootfs`.
 
    For more information, see the
    ":ref:`dev-manual/new-recipe:post-installation scripts`"
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index ecb559dd4..0965ab7bf 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -121,7 +121,7 @@ For names of recipes removed because of this repository change, see the
 
 Previously, it was possible for Python recipes that inherited the
 ``distutils`` and ``distutils3`` classes to fetch code
-during the :ref:`ref-tasks-configure` task to satisfy
+during the :term:`do_configure` task to satisfy
 dependencies mentioned in ``setup.py`` if those dependencies were not
 provided in the sysroot (i.e. recipes providing the dependencies were
 missing from :term:`DEPENDS`).
@@ -137,7 +137,7 @@ Fetching these types of dependencies that are not provided in the
 sysroot negatively affects the ability to reproduce builds. This type of
 fetching is now explicitly disabled. Consequently, any missing
 dependencies in Python recipes that use these classes now result in an
-error during the :ref:`ref-tasks-configure` task.
+error during the :term:`do_configure` task.
 
 .. _migration-2.6-linux-yocto-configuration-audit-issues-now-correctly-reported:
 
@@ -361,7 +361,7 @@ want to explicitly defer a postinstall to first boot on the target
 rather than at root filesystem creation time, use ``pkg_postinst_ontarget()`` or
 call ``postinst_intercept delay_to_first_boot`` from ``pkg_postinst()``.
 Any failure of a ``pkg_postinst()`` script (including exit 1) triggers
-an error during the :ref:`ref-tasks-rootfs` task.
+an error during the :term:`do_rootfs` task.
 
 For more information on post-installation behavior, see the
 ":ref:`dev-manual/new-recipe:post-installation scripts`"
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index f5201dcac..ebde20817 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -291,7 +291,7 @@ The following miscellaneous changes have occurred.
 
 -  In the ``base-files`` recipe, writing the hostname into
    ``/etc/hosts`` and ``/etc/hostname`` is now done within the main
-   :ref:`ref-tasks-install` function rather than in the
+   :term:`do_install` function rather than in the
    ``do_install_basefilesissue`` function. The reason for the change is
    because ``do_install_basefilesissue`` is more easily overridden
    without having to duplicate the hostname functionality. If you have
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index fdb959c4a..3381d0d71 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -236,7 +236,7 @@ Packaging changes
 Additional warnings
 -------------------
 
-Warnings will now be shown at :ref:`ref-tasks-package_qa` time in the following
+Warnings will now be shown at :term:`do_package_qa` time in the following
 circumstances:
 
 -  A recipe installs ``.desktop`` files containing ``MimeType`` keys but
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index 5cb958e75..74b5687de 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -62,7 +62,7 @@ pseudo as the interprocess round trip to the server is avoided.
 
 There is a possible complication where some existing recipe may break, for
 example, a recipe was found to be writing to ``${B}/install`` for
-``make install`` in :ref:`ref-tasks-install` and since ``${B}`` is listed as not to be tracked,
+``make install`` in :term:`do_install` and since ``${B}`` is listed as not to be tracked,
 there were errors trying to ``chown root`` for files in this location. Another
 example was the ``tcl`` recipe where the source directory :term:`S` is set to a
 subdirectory of the source tree but files were written out to the directory
@@ -203,7 +203,7 @@ Globbing no longer supported in ``file://`` entries in ``SRC_URI``
 
 Globbing (``*`` and ``?`` wildcards) in ``file://`` URLs within :term:`SRC_URI`
 did not properly support file checksums, thus changes to the source files
-would not always change the :ref:`ref-tasks-fetch` task checksum, and consequently would
+would not always change the :term:`do_fetch` task checksum, and consequently would
 not ensure that the changed files would be incorporated in subsequent builds.
 
 Unfortunately it is not practical to make globbing work generically here, so
@@ -219,16 +219,16 @@ files into a subdirectory and reference that instead.
 deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 ----------------------------------------------------------
 
-:ref:`ref-tasks-deploy` as implemented in the :ref:`ref-classes-deploy` class
+:term:`do_deploy` as implemented in the :ref:`ref-classes-deploy` class
 now cleans up ${:term:`DEPLOYDIR`} before running, just as
-:ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces
+:term:`do_install` cleans up ${:term:`D`} before running. This reduces
 the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from
 previous runs, possibly even with different config, in case of incremental
 builds.
 
 Most recipes and classes that inherit the :ref:`ref-classes-deploy` class or
-interact with :ref:`ref-tasks-deploy` are unlikely to be affected by this
-unless they add ``prefuncs`` to :ref:`ref-tasks-deploy` *which also* put files
+interact with :term:`do_deploy` are unlikely to be affected by this
+unless they add ``prefuncs`` to :term:`do_deploy` *which also* put files
 into ``${DEPLOYDIR}`` --- these should be refactored to use
 ``do_deploy_prepend`` instead.
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index a9b105720..b21243851 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -208,7 +208,7 @@ Package/recipe splitting
 Image / SDK generation changes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Recursive dependencies on the :ref:`ref-tasks-build` task are now disabled when
+- Recursive dependencies on the :term:`do_build` task are now disabled when
   building SDKs. These are generally not needed; in the unlikely event
   that you do encounter problems then it will probably be as a result of
   missing explicit dependencies that need to be added.
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index c8c2b856d..68b920f2a 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -95,8 +95,8 @@ Fetching changes
 
      do_mytask[network] = "1"
 
-  This is allowed by default from :ref:`ref-tasks-fetch` but not from any of our other standard
-  tasks. Recipes shouldn't be accessing the network outside of :ref:`ref-tasks-fetch` as it
+  This is allowed by default from :term:`do_fetch` but not from any of our other standard
+  tasks. Recipes shouldn't be accessing the network outside of :term:`do_fetch` as it
   usually undermines fetcher source mirroring, image and licence manifests, software
   auditing and supply chain security.
 
@@ -146,7 +146,7 @@ Python changes
   :ref:`ref-classes-python_flit_core`, :ref:`ref-classes-python_setuptools_build_meta`
   and :ref:`ref-classes-python_poetry_core`.
 
-- The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-install` task now
+- The :ref:`ref-classes-setuptools3` class :term:`do_install` task now
   installs the ``wheel`` binary archive. In current versions of ``setuptools`` the
   legacy ``setup.py install`` method is deprecated. If the ``setup.py`` cannot be used
   with wheels, for example it creates files outside of the Python module or standard
diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index 70e034bc8..87b80d4e8 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -23,15 +23,15 @@ supported, and an error will be issued. The recipe should be changed to::
     S = "${UNPACKDIR}"
 
 Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
-should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-configure`,
-:ref:`ref-tasks-compile`, :ref:`ref-tasks-install` and :term:`LIC_FILES_CHKSUM`.
+should be changed to :term:`S`. These are commonly in :term:`do_configure`,
+:term:`do_compile`, :term:`do_install` and :term:`LIC_FILES_CHKSUM`.
 
 :term:`WORKDIR` references in recipes
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 :term:`WORKDIR` references in other recipes need auditing. If they reference
 files from :term:`SRC_URI`, they likely need changing to :term:`UNPACKDIR`.
-These are commonly in :ref:`ref-tasks-compile` and :ref:`ref-tasks-install`
+These are commonly in :term:`do_compile` and :term:`do_install`
 for things like service or configuration files. One unusual case is
 ``${WORKDIR}/${BP}`` which should probably be set to ``${S}``.
 
@@ -42,17 +42,17 @@ usually left as they are.
 General notes
 ^^^^^^^^^^^^^
 
-Files from :ref:`ref-tasks-unpack` now unpack to ``WORKDIR/sources-unpack/``
+Files from :term:`do_unpack` now unpack to ``WORKDIR/sources-unpack/``
 rather than ``WORKDIR/``.
 
 If :term:`S` is set to a subdirectory under :term:`WORKDIR` and that
-subdirectory exists in ``sources-unpack`` after :ref:`ref-tasks-unpack` runs,
+subdirectory exists in ``sources-unpack`` after :term:`do_unpack` runs,
 it is moved to :term:`WORKDIR`. This means that ``S = "${WORKDIR}/${BP}"``,
 ``S = "${WORKDIR}/git"`` and also deeper paths continue to work as expected
 without changes. We cannot use symlinks to do this as it breaks autotools
 based recipes. Keeping all sources under ``sources-unpack`` wasn't considered
 as it meant more invasive recipes changes. The key objective was separating the
-:ref:`ref-tasks-unpack` task output from :term:`WORKDIR`.
+:term:`do_unpack` task output from :term:`WORKDIR`.
 
 Previously, :term:`S` was always created but after the recent changes it is no
 longer the case. This means the check in ``do_unpack_qa`` triggers where
@@ -102,7 +102,7 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 Go language changes
 ~~~~~~~~~~~~~~~~~~~
 
--  After dropping the custom :ref:`ref-tasks-unpack` from the
+-  After dropping the custom :term:`do_unpack` from the
    :ref:`ref-classes-go` class, go recipes should now add
    ``destsuffix=${GO_SRCURI_DESTSUFFIX}`` to their :term:`SRC_URI` to extract
    them in the appropriate path. An example would be::
diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 77a11fe27..2144b954a 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -171,7 +171,7 @@ c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
 -  The :ref:`ref-classes-autotools` class now requires any recipe that inherits
    the class to have a ``configure`` script. The configuration script location
    is stored in the :term:`CONFIGURE_SCRIPT` variable. The
-   :ref:`ref-tasks-configure` task will fail if the script is missing.
+   :term:`do_configure` task will fail if the script is missing.
 
 :term:`UBOOT_ENTRYPOINT` changes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 6eca9956b..35bb915b7 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -69,7 +69,7 @@ New Features / Enhancements in 3.4
 
 -  SDK-related enhancements:
 
-   -  Enable :ref:`ref-tasks-populate_sdk` with multilibs
+   -  Enable :term:`do_populate_sdk` with multilibs
    -  New ``SDKPATHINSTALL`` variable decouples default install path from
       built in path to avoid rebuilding :ref:`ref-classes-nativesdk`
       components on e.g. :term:`DISTRO_VERSION` changes
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 529be7da2..2d15b4370 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -323,7 +323,7 @@ New Features / Enhancements in 4.2
    -  ``sstatesig``: emit more helpful error message when not finding sstate manifest
    -  :ref:`ref-classes-pypi`.bbclass: Set :term:`SRC_URI` downloadfilename with an optional prefix
    -  ``poky-bleeding`` distro: update and rework
-   -  :ref:`package.bbclass <ref-classes-package>`: check if package names conflict via ``PKG:${PN}`` override in :ref:`do_package <ref-tasks-package>`
+   -  :ref:`package.bbclass <ref-classes-package>`: check if package names conflict via ``PKG:${PN}`` override in :term:`do_package`
    -  ``cve-update-nvd2-native``: new NVD CVE database fetcher using the 2.0 API
    -  :ref:`ref-classes-mirrors` class: use shallow tarball for ``binutils-native``/``nativesdk-binutils``
    -  ``meta/conf``: move default configuration templates into ``meta/conf/templates/default``
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index dc770ebc3..3867227c1 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -20,7 +20,7 @@ New Features / Enhancements in 5.1
       after the new sources have been unpacked in the
       ``scripts/lib/devtool/upgrade.py`` upgrade() method.
 
-   -  :term:`UNPACKDIR`: allow change of the :ref:`ref-tasks-unpack` task
+   -  :term:`UNPACKDIR`: allow change of the :term:`do_unpack` task
       directory.
 
 -  Kernel-related changes:
@@ -75,8 +75,8 @@ New Features / Enhancements in 5.1
 
    -  Included ``nativesdk-python3-pip`` in :term:`buildtools` by default.
 
-   -  :ref:`ref-classes-nativesdk` now have :ref:`ref-tasks-package_qa` run when
-      calling :ref:`ref-tasks-populate_sdk`.
+   -  :ref:`ref-classes-nativesdk` now have :term:`do_package_qa` run when
+      calling :term:`do_populate_sdk`.
 
    -  A new 7zip archive type can be used to create the SDK by setting
       :term:`SDK_ARCHIVE_TYPE` to ``7zip``.
@@ -329,7 +329,7 @@ New Features / Enhancements in 5.1
       one, which does not depend on libsystemd and is standalone.
 
    -  ``cmake`` now uses the ``${COREBASE}/scripts/git`` wrapper instead of the
-      host's, which is required during :ref:`ref-tasks-install` to call git
+      host's, which is required during :term:`do_install` to call git
       while disabling fakeroot, and avoid "dubious ownership" git errors.
 
    -  Default compiler option changes:
@@ -353,7 +353,7 @@ New Features / Enhancements in 5.1
    -  openssl: strip the test suite after building, reducing the build tree of
       50% after installation.
 
-   -  u-boot: Refactor some of the :ref:`ref-tasks-configure` tasks into new
+   -  u-boot: Refactor some of the :term:`do_configure` tasks into new
       functions, making it easier to modify using a bbappend.
 
    -  The ``musl`` recipe now shows an error if used with
@@ -366,7 +366,7 @@ New Features / Enhancements in 5.1
       packages, was modified to avoid files being overridden by other packages when
       they share common files. Instead, prompt an error.
 
-   -  The :ref:`ref-tasks-savedefconfig` was moved from the u-boot and kernel
+   -  The :term:`do_savedefconfig` was moved from the u-boot and kernel
       recipes to the :ref:`ref-classes-cml1` class, so that more kbuild-based
       recipes can use it.
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index b5483c903..bdf70d802 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -33,7 +33,7 @@ New Features / Enhancements in |yocto-ver|
 
    -  :ref:`ref-classes-meson`: :term:`MESON_INSTALL_TAGS` to allow passing
       install tags (``--tags``) to the ``meson install`` command during the
-      :ref:`ref-tasks-install` task.
+      :term:`do_install` task.
 
    -  ``cve-check``: ``NVD_DB_VERSION`` to allow choosing the
       CVE feed when using the ``cve-check`` class.
@@ -51,7 +51,7 @@ New Features / Enhancements in |yocto-ver|
 
 -  Kernel-related changes:
 
-   -  :ref:`ref-classes-cml1`: in :ref:`ref-tasks-diffconfig`, do not override
+   -  :ref:`ref-classes-cml1`: in :term:`do_diffconfig`, do not override
       ``.config`` with ``.config.orig``. This applies to other recipes using the
       class :ref:`ref-classes-cml1`.
 
@@ -208,10 +208,10 @@ New Features / Enhancements in |yocto-ver|
       ``GO_MOD_CACHE_DIR`` to enable the use of the Go module fetchers for
       downloading and unpacking module dependencies to the module cache.
 
-   -  Make the :ref:`ref-tasks-compile` task run before
-      :ref:`ref-tasks-populate_lic` in the :ref:`ref-classes-go-mod` class so
-      license files are found by :ref:`ref-tasks-populate_lic` after the ``go
-      install`` command is run in :ref:`ref-tasks-compile`.
+   -  Make the :term:`do_compile` task run before
+      :term:`do_populate_lic` in the :ref:`ref-classes-go-mod` class so
+      license files are found by :term:`do_populate_lic` after the ``go
+      install`` command is run in :term:`do_compile`.
 
 -  Rust changes:
 
@@ -477,7 +477,7 @@ New Features / Enhancements in |yocto-ver|
       bugfix in gcc (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81170).
 
    -  ``openssh``: be more restrictive on private key file permissions by
-      setting them from the :ref:`ref-tasks-install` task.
+      setting them from the :term:`do_install` task.
 
 -  ``cve-check`` changes:
 
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index fdc092e51..c4f25f724 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -244,7 +244,7 @@ New Features / Enhancements in |yocto-ver|
 
 -  New core tasks:
 
-   -  The :ref:`ref-tasks-list_image_features` can be used to list the available
+   -  The :term:`do_list_image_features` can be used to list the available
       :term:`IMAGE_FEATURES` for an image recipe.
 
 -  Kernel-related changes:
@@ -670,7 +670,7 @@ New Features / Enhancements in |yocto-ver|
          -  Refactor to be extended easily.
 
          -  Add a ``check_network_flag`` test that checks that no tasks other
-            than :ref:`ref-tasks-fetch` can access the network.
+            than :term:`do_fetch` can access the network.
 
    -  ``send-error-report``:
 
@@ -824,7 +824,7 @@ New Features / Enhancements in |yocto-ver|
 -  :ref:`ref-classes-sanity` class changes:
 
    -  :ref:`ref-classes-insane`: Move test for invalid :term:`PACKAGECONFIG` to
-      :ref:`ref-tasks-recipe-qa`.
+      :term:`do_recipe_qa`.
 
    -  Add ``unimplemented-ptest`` detection for cargo-based tests, allowing to
       detect when a cargo package has available tests that could be enable with
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 1ce7d5120..c880cac8a 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -336,7 +336,7 @@ New Features / Enhancements in |yocto-ver|
    -  ``resulttool``: Add :ref:`ref-classes-ptest` support to the JUnit output
       format (:oecore_rev:`2abe2d701c98cbf3a81f211252157de523742b0b`)
 
-   -  :ref:`ref-tasks-testimage`: Print last lines of kernel log on test fail
+   -  :term:`do_testimage`: Print last lines of kernel log on test fail
       (:oecore_rev:`fea3c445a9ccb803468b83ea4e8fa92fe442b8e0`)
 
    -  ``reproducible``: Use the `jQuery` CDN instead of ``jquery-native``
@@ -460,7 +460,7 @@ New Features / Enhancements in |yocto-ver|
          (:bitbake_rev:`92fd721941fd17d1febc7205739e9f9ce1bb3aee`)
 
    -  The ``unpack()`` function (the one containing the logic of the
-      :ref:`ref-tasks-unpack` task), can now take an ``update`` argument to
+      :term:`do_unpack` task), can now take an ``update`` argument to
       allow updating a Git repository in-place rather than deleting it and
       re-creating it. An alias function named ``unpack_update()`` was created
       for this unpack mode. See :ref:`bitbake:bb-the-unpack-update` for more
@@ -572,7 +572,7 @@ New Features / Enhancements in |yocto-ver|
 -  :ref:`ref-classes-insane` / :ref:`ref-classes-sanity` classes related changes:
 
    -  Reject :term:`TMPDIR` containing redundant slashes to avoid errors in
-      executions of :ref:`ref-tasks-populate_sysroot`
+      executions of :term:`do_populate_sysroot`
       (:oecore_rev:`3e72ebe9ed4e2e5f34eb89cd460e75a9242e296f`)
 
    -  :ref:`ref-classes-sanity`: Warn when the
@@ -745,7 +745,7 @@ New Features / Enhancements in |yocto-ver|
       (:oecore_rev:`5f346802198f14d4c315783dea6a55743e34a2e8`)
 
    -  ``gobject-introspection``: Disable cache for the scanner during
-      the :ref:`ref-tasks-compile` task (``GI_SCANNER_DISABLE_CACHE=1``), to fix
+      the :term:`do_compile` task (``GI_SCANNER_DISABLE_CACHE=1``), to fix
       an intermittent build failure
       (:oecore_rev:`2b55dd12fc9593beba20d684c8b143483e212bc6`)
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index b23e0d2b6..1333bdc86 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -546,7 +546,7 @@ Source Control Managers (Optional)
 Another place from which the build system can get source files is with
 :ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers` employing
 various Source Control Managers (SCMs) such as Git or Subversion. In such
-cases, a repository is cloned or checked out. The :ref:`ref-tasks-fetch` task
+cases, a repository is cloned or checked out. The :term:`do_fetch` task
 inside BitBake uses the :term:`SRC_URI` variable and the argument's prefix to
 determine the correct fetcher module.
 
@@ -623,13 +623,13 @@ package files are kept:
    available for the i586 or qemux86 architectures.
 
 BitBake uses the
-:ref:`do_package_write_* <ref-tasks-package_write_deb>`
+:term:`do_package_write_* <do_package_write_deb>`
 tasks to generate packages and place them into the package holding area
 (e.g. ``do_package_write_ipk`` for IPK packages). See the
-":ref:`ref-tasks-package_write_deb`",
-":ref:`ref-tasks-package_write_ipk`",
+":term:`do_package_write_deb`",
+":term:`do_package_write_ipk`",
 and
-":ref:`ref-tasks-package_write_rpm`"
+":term:`do_package_write_rpm`"
 sections in the Yocto Project Reference Manual for additional
 information. As an example, consider a scenario where an IPK packaging
 manager is being used and there is package architecture support for both
@@ -662,7 +662,7 @@ code:
 .. image:: svg/source-fetching.*
    :width: 100%
 
-The :ref:`ref-tasks-fetch` and :ref:`ref-tasks-unpack` tasks fetch
+The :term:`do_fetch` and :term:`do_unpack` tasks fetch
 the source files and unpack them into the :term:`Build Directory`.
 
 .. note::
@@ -670,8 +670,8 @@ the source files and unpack them into the :term:`Build Directory`.
    For every local file (e.g. ``file://``) that is part of a recipe's
    :term:`SRC_URI` statement, the OpenEmbedded build system takes a
    checksum of the file for the recipe and inserts the checksum into
-   the signature for the :ref:`ref-tasks-fetch` task. If any local
-   file has been modified, the :ref:`ref-tasks-fetch` task and all
+   the signature for the :term:`do_fetch` task. If any local
+   file has been modified, the :term:`do_fetch` task and all
    tasks that depend on it are re-executed.
 
 By default, everything is accomplished in the :term:`Build Directory`, which has
@@ -743,7 +743,7 @@ and applies them to the source files:
 .. image:: svg/patching.*
    :width: 100%
 
-The :ref:`ref-tasks-patch` task uses a
+The :term:`do_patch` task uses a
 recipe's :term:`SRC_URI` statements
 and the :term:`FILESPATH` variable
 to locate applicable patch files.
@@ -752,7 +752,7 @@ Default processing for patch files assumes the files have either
 ``*.patch`` or ``*.diff`` file types (or a compressed form of those
 file types). You can use :term:`SRC_URI` parameters
 to change the way the build system recognizes patch files. See the
-:ref:`ref-tasks-patch` task for more
+:term:`do_patch` task for more
 information.
 
 BitBake finds and applies multiple patches for a single recipe in the
@@ -787,10 +787,10 @@ to a holding area (staged) in preparation for packaging:
 
 This step in the build process consists of the following tasks:
 
--  :ref:`ref-tasks-prepare_recipe_sysroot`:
+-  :term:`do_prepare_recipe_sysroot`:
    This task sets up the two sysroots in the ``${``\ :term:`WORKDIR`\ ``}`` (i.e.
    ``recipe-sysroot`` and ``recipe-sysroot-native``) so that the subsequent tasks
-   of the recipe (notably :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile`)
+   of the recipe (notably :term:`do_configure` and :term:`do_compile`)
    can access the libraries, headers, and similar files built by the recipes on
    which it depends.
 
@@ -801,14 +801,14 @@ This step in the build process consists of the following tasks:
       and other data, so that they can be run directly on the build host when
       that is required by the build process
 
--  :ref:`ref-tasks-configure`: This task configures the source by enabling and
+-  :term:`do_configure`: This task configures the source by enabling and
    disabling any build-time and configuration options for the software
    being built. Configurations can come from the recipe itself as well
    as from an inherited class. Additionally, the software itself might
    configure itself depending on the target for which it is being built.
 
    The configurations handled by the
-   :ref:`ref-tasks-configure` task
+   :term:`do_configure` task
    are specific to configurations for the source code being built by the
    recipe.
 
@@ -820,16 +820,16 @@ This step in the build process consists of the following tasks:
    class, see the :ref:`ref-classes-autotools` class
    :oe_git:`here </openembedded-core/tree/meta/classes-recipe/autotools.bbclass>`.
 
--  :ref:`ref-tasks-compile`: Once a configuration task has been satisfied,
+-  :term:`do_compile`: Once a configuration task has been satisfied,
    BitBake compiles the source using the
-   :ref:`ref-tasks-compile` task.
+   :term:`do_compile` task.
    Compilation occurs in the directory pointed to by the
    :term:`B` variable. Realize that the
    :term:`B` directory is, by default, the same as the
    :term:`S` directory.
 
--  :ref:`ref-tasks-install`: After compilation completes, BitBake executes the
-   :ref:`ref-tasks-install` task.
+-  :term:`do_install`: After compilation completes, BitBake executes the
+   :term:`do_install` task.
    This task copies files from the :term:`B` directory and places them in a
    holding area pointed to by the :term:`D`
    variable. Packaging occurs later using files from this holding
@@ -844,8 +844,8 @@ analyzes the results and splits the output into packages:
 .. image:: svg/analysis-for-package-splitting.*
    :width: 100%
 
-The :ref:`ref-tasks-package` and
-:ref:`ref-tasks-packagedata`
+The :term:`do_package` and
+:term:`do_packagedata`
 tasks combine to analyze the files found in the
 :term:`D` directory and split them into
 subsets based on available packages and files. Analysis involves the
@@ -853,11 +853,11 @@ following as well as other items: splitting out debugging symbols,
 looking at shared library dependencies between packages, and looking at
 package relationships.
 
-The :ref:`ref-tasks-packagedata` task creates package metadata based on the
+The :term:`do_packagedata` task creates package metadata based on the
 analysis such that the build system can generate the final packages. The
-:ref:`ref-tasks-populate_sysroot`
+:term:`do_populate_sysroot`
 task stages (copies) a subset of the files installed by the
-:ref:`ref-tasks-install` task into
+:term:`do_install` task into
 the appropriate sysroot. Working, staged, and intermediate results of
 the analysis and package splitting process use several areas:
 
@@ -866,7 +866,7 @@ the analysis and package splitting process use several areas:
    individual packages.
 
 -  :term:`PKGDESTWORK`: A
-   temporary work area (i.e. ``pkgdata``) used by the :ref:`ref-tasks-package`
+   temporary work area (i.e. ``pkgdata``) used by the :term:`do_package`
    task to save package metadata.
 
 -  :term:`PKGDEST`: The parent
@@ -950,7 +950,7 @@ Alternatively, a custom package can be added by adding it to the
   PACKAGES =+ "${PN}-extra"
 
 Depending on the type of packages being created (RPM, DEB, or IPK), the
-:ref:`do_package_write_* <ref-tasks-package_write_deb>`
+:term:`do_package_write_* <do_package_write_deb>`
 task creates the actual packages and places them in the Package Feed
 area, which is ``${TMPDIR}/deploy``. You can see the
 ":ref:`overview-manual/concepts:package feeds`" section for more detail on
@@ -976,7 +976,7 @@ system uses BitBake to generate the root filesystem image:
 
 The image generation process consists of several stages and depends on
 several tasks and variables. The
-:ref:`ref-tasks-rootfs` task creates
+:term:`do_rootfs` task creates
 the root filesystem (file and directory structure) for an image. This
 task uses several key variables to help create the list of packages to
 actually install:
@@ -1024,7 +1024,7 @@ all the post installation scripts must succeed on the build host during
 the package installation phase since the root filesystem on the target
 is read-only.
 
-The final stages of the :ref:`ref-tasks-rootfs` task handle post processing. Post
+The final stages of the :term:`do_rootfs` task handle post processing. Post
 processing includes creation of a manifest file and optimizations.
 
 The manifest file (``.manifest``) resides in the same directory as the root
@@ -1039,14 +1039,14 @@ and any other post-processing commands as defined by the
 variable. The ``mklibs`` process optimizes the size of the libraries.
 
 After the root filesystem is built, processing begins on the image
-through the :ref:`ref-tasks-image`
+through the :term:`do_image`
 task. The build system runs any pre-processing commands as defined by
 the
 :term:`IMAGE_PREPROCESS_COMMAND`
 variable. This variable specifies a list of functions to call before the
 build system creates the final image output files.
 
-The build system dynamically creates :ref:`do_image_* <ref-tasks-image>` tasks as needed,
+The build system dynamically creates :term:`do_image_* <do_image>` tasks as needed,
 based on the image types specified in the
 :term:`IMAGE_FSTYPES` variable.
 The process turns everything into an image file or a set of image files
@@ -1067,7 +1067,7 @@ generated task would be as follows::
    do_image_ext4
 
 The final task involved in image creation is the
-:ref:`do_image_complete <ref-tasks-image-complete>`
+:term:`do_image_complete`
 task. This task completes the image by applying any image post
 processing as defined through the
 :term:`IMAGE_POSTPROCESS_COMMAND`
@@ -1095,28 +1095,28 @@ the extensible SDK (eSDK):
    For more information on the cross-development toolchain generation,
    see the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
    section. For information on advantages gained when building a
-   cross-development toolchain using the :ref:`ref-tasks-populate_sdk` task, see the
+   cross-development toolchain using the :term:`do_populate_sdk` task, see the
    ":ref:`sdk-manual/appendix-obtain:building an sdk installer`" section in
    the Yocto Project Application Development and the Extensible Software
    Development Kit (eSDK) manual.
 
 Like image generation, the SDK script process consists of several stages
 and depends on many variables. The
-:ref:`ref-tasks-populate_sdk`
+:term:`do_populate_sdk`
 and
-:ref:`ref-tasks-populate_sdk_ext`
+:term:`do_populate_sdk_ext`
 tasks use these key variables to help create the list of packages to
 actually install. For information on the variables listed in the figure,
 see the ":ref:`overview-manual/concepts:application development sdk`"
 section.
 
-The :ref:`ref-tasks-populate_sdk` task helps create the standard SDK and handles
+The :term:`do_populate_sdk` task helps create the standard SDK and handles
 two parts: a target part and a host part. The target part is the part
 built for the target hardware and includes libraries and headers. The
 host part is the part of the SDK that runs on the
 :term:`SDKMACHINE`.
 
-The :ref:`ref-tasks-populate_sdk_ext` task helps create the extensible SDK and
+The :term:`do_populate_sdk_ext` task helps create the extensible SDK and
 handles host and target parts differently than its counterpart does for
 the standard SDK. For the extensible SDK, the task encapsulates the
 build system, which includes everything needed (host and target) for the
@@ -1199,33 +1199,33 @@ version of the task where instead of building something, BitBake can
 skip to the end result and simply place a set of files into specific
 locations as needed. In some cases, it makes sense to have a setscene
 task variant (e.g. generating package files in the
-:ref:`do_package_write_* <ref-tasks-package_write_deb>`
+:term:`do_package_write_* <do_package_write_deb>`
 task). In other cases, it does not make sense (e.g. a
-:ref:`ref-tasks-patch` task or a
-:ref:`ref-tasks-unpack` task) since
+:term:`do_patch` task or a
+:term:`do_unpack` task) since
 the work involved would be equal to or greater than the underlying task.
 
 In the build system, the common tasks that have setscene variants are
-:ref:`ref-tasks-package`,
-:ref:`do_package_write_* <ref-tasks-package_write_deb>`,
-:ref:`ref-tasks-deploy`,
-:ref:`ref-tasks-packagedata`, and
-:ref:`ref-tasks-populate_sysroot`.
+:term:`do_package`,
+:term:`do_package_write_* <do_package_write_deb>`,
+:term:`do_deploy`,
+:term:`do_packagedata`, and
+:term:`do_populate_sysroot`.
 Notice that these tasks represent most of the tasks whose output is an
 end result.
 
 The build system has knowledge of the relationship between these tasks
 and other preceding tasks. For example, if BitBake runs
 ``do_populate_sysroot_setscene`` for something, it does not make sense
-to run any of the :ref:`ref-tasks-fetch`, :ref:`ref-tasks-unpack`, :ref:`ref-tasks-patch`,
-:ref:`ref-tasks-configure`, :ref:`ref-tasks-compile`, and :ref:`ref-tasks-install` tasks. However, if
-:ref:`ref-tasks-package` needs to be run, BitBake needs to run those other tasks.
+to run any of the :term:`do_fetch`, :term:`do_unpack`, :term:`do_patch`,
+:term:`do_configure`, :term:`do_compile`, and :term:`do_install` tasks. However, if
+:term:`do_package` needs to be run, BitBake needs to run those other tasks.
 
 It becomes more complicated if everything can come from an sstate cache
 because some objects are simply not required at all. For example, you do
 not need a compiler or native tools, such as quilt, if there isn't anything
-to compile or patch. If the :ref:`do_package_write_* <ref-tasks-package_write_deb>` packages are available
-from sstate, BitBake does not need the :ref:`ref-tasks-package` task data.
+to compile or patch. If the :term:`do_package_write_* <do_package_write_deb>` packages are available
+from sstate, BitBake does not need the :term:`do_package` task data.
 
 To handle all these complexities, BitBake runs in two phases. The first
 is the "setscene" stage. During this stage, BitBake first checks the
@@ -1606,8 +1606,8 @@ works on a per-task basis rather than a per-recipe basis. You might
 wonder why using a per-task basis is preferred over a per-recipe basis.
 To help explain, consider having the IPK packaging backend enabled and
 then switching to DEB. In this case, the
-:ref:`ref-tasks-install` and
-:ref:`ref-tasks-package` task outputs
+:term:`do_install` and
+:term:`do_package` task outputs
 are still valid. However, with a per-recipe approach, the build would
 not include the ``.deb`` files. Consequently, you would have to
 invalidate the whole build and rerun it. Rerunning everything is not the
@@ -1763,15 +1763,15 @@ the build process does not need to worry about its origin.
 Two types of output exist. One type is just about creating a directory
 in :term:`WORKDIR`. A good example is
 the output of either
-:ref:`ref-tasks-install` or
-:ref:`ref-tasks-package`. The other
+:term:`do_install` or
+:term:`do_package`. The other
 type of output occurs when a set of data is merged into a shared
 directory tree such as the sysroot.
 
 The Yocto Project team has tried to keep the details of the
 implementation hidden in the :ref:`ref-classes-sstate` class. From a user's perspective,
 adding shared state wrapping to a task is as simple as this
-:ref:`ref-tasks-deploy` example taken from the :ref:`ref-classes-deploy` class::
+:term:`do_deploy` example taken from the :ref:`ref-classes-deploy` class::
 
    DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
    SSTATETASKS += "do_deploy"
@@ -1790,10 +1790,10 @@ The following list explains the previous example:
 
 -  Adding ``do_deploy`` to ``SSTATETASKS`` adds some required sstate-related
    processing, which is implemented in the :ref:`ref-classes-sstate` class, to
-   before and after the :ref:`ref-tasks-deploy` task.
+   before and after the :term:`do_deploy` task.
 
 -  The ``do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"`` declares that
-   :ref:`ref-tasks-deploy` places its output in ``${DEPLOYDIR}`` when run normally
+   :term:`do_deploy` places its output in ``${DEPLOYDIR}`` when run normally
    (i.e. when not using the sstate cache). This output becomes the input
    to the shared state cache.
 
@@ -1803,15 +1803,15 @@ The following list explains the previous example:
 
    .. note::
 
-      If :ref:`ref-tasks-deploy` is not already in the shared state cache or if its input
+      If :term:`do_deploy` is not already in the shared state cache or if its input
       checksum (signature) has changed from when the output was cached, the task
       runs to populate the shared state cache, after which the contents of the
       shared state cache is copied to ${:term:`DEPLOY_DIR_IMAGE`}. If
-      :ref:`ref-tasks-deploy` is in the shared state cache and its signature indicates
+      :term:`do_deploy` is in the shared state cache and its signature indicates
       that the cached output is still valid (i.e. if no relevant task inputs
       have changed), then the contents of the shared state cache copies
       directly to ${:term:`DEPLOY_DIR_IMAGE`} by the ``do_deploy_setscene`` task
-      instead, skipping the :ref:`ref-tasks-deploy` task.
+      instead, skipping the :term:`do_deploy` task.
 
 -  The following task definition is glue logic needed to make the
    previous settings effective::
@@ -1822,21 +1822,21 @@ The following list explains the previous example:
       addtask do_deploy_setscene
 
    ``sstate_setscene()`` takes the flags above as input and accelerates the
-   :ref:`ref-tasks-deploy` task through the shared state cache if possible. If
+   :term:`do_deploy` task through the shared state cache if possible. If
    the task was accelerated, ``sstate_setscene()`` returns True. Otherwise, it
-   returns False, and the normal :ref:`ref-tasks-deploy` task runs. For more
+   returns False, and the normal :term:`do_deploy` task runs. For more
    information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:setscene`"
    section in the BitBake User Manual.
 
 -  The ``do_deploy[dirs] = "${B}"`` line creates the directory ``${B}``
-   before the :ref:`ref-tasks-deploy` task runs, and also sets the
-   current working directory of :ref:`ref-tasks-deploy` to ``${B}``.
+   before the :term:`do_deploy` task runs, and also sets the
+   current working directory of :term:`do_deploy` to ``${B}``.
    (If the directory already exists, it is left as is.) For more
    information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
    section in the BitBake User Manual.
 
 -  The ``do_deploy[cleandirs] = "${DEPLOYDIR}"`` line creates the *empty*
-   directory ``${DEPLOYDIR}`` before the :ref:`ref-tasks-deploy` task runs.
+   directory ``${DEPLOYDIR}`` before the :term:`do_deploy` task runs.
    (If the directory already exists, it is deleted and recreated empty.) For more
    information, see the ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
    section in the BitBake User Manual.
@@ -1845,7 +1845,7 @@ The following list explains the previous example:
 
       In cases where ``sstate-inputdirs`` and ``sstate-outputdirs`` would be
       the same, you can use ``sstate-plaindirs``. For example, to preserve the
-      ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the :ref:`ref-tasks-package`
+      ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the :term:`do_package`
       task, use the following::
 
               do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
@@ -1906,7 +1906,7 @@ tasks on which it is dependent are not executed.
 
 As a real world example, the aim is when building an IPK-based image,
 only the
-:ref:`ref-tasks-package_write_ipk`
+:term:`do_package_write_ipk`
 tasks would have their shared state packages fetched and extracted.
 Since the sysroot is not used, it would never get extracted. This is
 another reason why a task-based approach is preferred over a
@@ -2057,7 +2057,7 @@ handle shared libraries, package configuration (pkg-config) modules, and
 dependencies, you must manually declare the dependencies.
 
 -  ``shlibdeps``: During the
-   :ref:`ref-tasks-package` task of
+   :term:`do_package` task of
    each recipe, all shared libraries installed by the recipe are
    located. For each shared library, the package that contains the
    shared library is registered as providing the shared library. More
@@ -2065,7 +2065,7 @@ dependencies, you must manually declare the dependencies.
    :wikipedia:`soname <Soname>` of the library. The
    resulting shared-library-to-package mapping is saved globally in
    :term:`PKGDATA_DIR` by the
-   :ref:`ref-tasks-packagedata`
+   :term:`do_packagedata`
    task.
 
    Simultaneously, all executables and shared libraries installed by the
@@ -2089,12 +2089,12 @@ dependencies, you must manually declare the dependencies.
    :term:`PRIVATE_LIBS` inside
    the package's recipe.
 
--  ``pcdeps``: During the :ref:`ref-tasks-package` task of each recipe, all
+-  ``pcdeps``: During the :term:`do_package` task of each recipe, all
    pkg-config modules (``*.pc`` files) installed by the recipe are
    located. For each module, the package that contains the module is
    registered as providing the module. The resulting module-to-package
    mapping is saved globally in :term:`PKGDATA_DIR` by the
-   :ref:`ref-tasks-packagedata` task.
+   :term:`do_packagedata` task.
 
    Simultaneously, all pkg-config modules installed by the recipe are
    inspected to see what other pkg-config modules they depend on. A
@@ -2135,7 +2135,7 @@ dependencies, you must manually declare the dependencies.
    :term:`ALLOW_EMPTY` variable
    for more information.
 
-The :ref:`ref-tasks-package` task depends on the :ref:`ref-tasks-packagedata`
+The :term:`do_package` task depends on the :term:`do_packagedata`
 task of each recipe in :term:`DEPENDS` through use of a
 ``[``\ :ref:`deptask <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
 declaration, which guarantees that the required shared-library /
@@ -2147,11 +2147,11 @@ Fakeroot and Pseudo
 
 Some tasks are easier to implement when allowed to perform certain
 operations that are normally reserved for the root user (e.g.
-:ref:`ref-tasks-install`,
-:ref:`do_package_write* <ref-tasks-package_write_deb>`,
-:ref:`ref-tasks-rootfs`, and
-:ref:`do_image_* <ref-tasks-image>`). For example,
-the :ref:`ref-tasks-install` task benefits from being able to set the UID and GID
+:term:`do_install`,
+:term:`do_package_write* <do_package_write_deb>`,
+:term:`do_rootfs`, and
+:term:`do_image_* <do_image>`). For example,
+the :term:`do_install` task benefits from being able to set the UID and GID
 of installed files to arbitrary values.
 
 One approach to allowing tasks to perform root-only operations would be
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 98dff1bac..23d6215d5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -54,7 +54,7 @@ splitting out of debug symbols during packaging).
    even if the recipes do not produce architecture-specific output.
 
    Configuring such recipes for all architectures causes the
-   :ref:`do_package_write_* <ref-tasks-package_write_deb>` tasks to
+   :term:`do_package_write_* <do_package_write_deb>` tasks to
    have different signatures for the machines with different tunings.
    Additionally, unnecessary rebuilds occur every time an image for a
    different :term:`MACHINE` is built even when the recipe never changes.
@@ -115,18 +115,18 @@ support is either not present or is broken.
 It's useful to have some idea of how the tasks defined by the
 :ref:`autotools* <ref-classes-autotools>` classes work and what they do behind the scenes.
 
--  :ref:`ref-tasks-configure` --- regenerates the
+-  :term:`do_configure` --- regenerates the
    configure script (using ``autoreconf``) and then launches it with a
    standard set of arguments used during cross-compilation. You can pass
    additional parameters to ``configure`` through the :term:`EXTRA_OECONF`
    or :term:`PACKAGECONFIG_CONFARGS`
    variables.
 
--  :ref:`ref-tasks-compile` --- runs ``make`` with
+-  :term:`do_compile` --- runs ``make`` with
    arguments that specify the compiler and linker. You can pass
    additional arguments through the :term:`EXTRA_OEMAKE` variable.
 
--  :ref:`ref-tasks-install` --- runs ``make install`` and
+-  :term:`do_install` --- runs ``make install`` and
    passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
 
 .. _ref-classes-barebox:
@@ -147,8 +147,8 @@ will raise an error.
 The :ref:`ref-classes-barebox` class supports config fragments and internally
 includes the :ref:`ref-classes-cml1` class to provide `Kconfig
 <https://docs.kernel.org/kbuild/kconfig-language.html>`__ support for
-barebox, enabling tasks such as :ref:`ref-tasks-menuconfig` and
-:ref:`ref-tasks-diffconfig`.
+barebox, enabling tasks such as :term:`do_menuconfig` and
+:term:`do_diffconfig`.
 
 The generated barebox binaries are deployed to
 :term:`DEPLOY_DIR_IMAGE` as well as installed to ``BAREBOX_INSTALL_PATH``
@@ -198,7 +198,7 @@ software that includes bash-completion data.
 ===============
 
 The :ref:`ref-classes-bin-package` class is a helper class for recipes, that
-disables the :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` tasks and
+disables the :term:`do_configure` and :term:`do_compile` tasks and
 copies the content of the :term:`S` directory into the :term:`D` directory. This
 is useful for installing binary packages (e.g. RPM packages) by passing the
 package in the :term:`SRC_URI` variable and inheriting this class.
@@ -434,7 +434,7 @@ recipe can set the :term:`OECMAKE_GENERATOR` variable to ``Unix Makefiles`` to
 use GNU make instead.
 
 If you need to install custom CMake toolchain files supplied by the application
-being built, you should install them (during :ref:`ref-tasks-install`) to the
+being built, you should install them (during :term:`do_install`) to the
 preferred CMake Module directory: ``${D}${datadir}/cmake/modules/``.
 
 .. _ref-classes-cmake-qemu:
@@ -629,11 +629,11 @@ The :ref:`ref-classes-deploy` class handles deploying files to the
 :term:`DEPLOY_DIR_IMAGE` directory. The main
 function of this class is to allow the deploy step to be accelerated by
 shared state. Recipes that inherit this class should define their own
-:ref:`ref-tasks-deploy` function to copy the files to be
+:term:`do_deploy` function to copy the files to be
 deployed to :term:`DEPLOYDIR`, and use ``addtask`` to
 add the task at the appropriate place, which is usually after
-:ref:`ref-tasks-compile` or
-:ref:`ref-tasks-install`. The class then takes care of
+:term:`do_compile` or
+:term:`do_install`. The class then takes care of
 staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 
 .. _ref-classes-devicetree:
@@ -649,7 +649,7 @@ in-tree device tree compilation process. This includes the ability to include
 sources from the kernel such as SoC ``dtsi`` files as well as C header files,
 such as ``gpio.h``.
 
-The :ref:`ref-tasks-compile` task will compile two kinds of files:
+The :term:`do_compile` task will compile two kinds of files:
 
 - Regular device tree sources with a ``.dts`` extension.
 
@@ -689,7 +689,7 @@ recipe inheriting this class::
 ``devshell``
 ============
 
-The :ref:`ref-classes-devshell` class adds the :ref:`ref-tasks-devshell` task. Distribution
+The :ref:`ref-classes-devshell` class adds the :term:`do_devshell` task. Distribution
 policy dictates whether to include this class. See the ":ref:`dev-manual/development-shell:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
 information about using :ref:`ref-classes-devshell`.
@@ -978,7 +978,7 @@ These files can then updated automatically with the ``do_update_modules`` task.
 
 The :ref:`ref-classes-go-vendor` class implements support for offline builds,
 also known as Go vendoring. In such a scenario, the module dependencias are
-downloaded during the :ref:`ref-tasks-fetch` task rather than when modules are
+downloaded during the :term:`do_fetch` task rather than when modules are
 imported, thus being coherent with Yocto's concept of fetching every source
 beforehand.
 
@@ -1300,7 +1300,7 @@ code to build all kernel trees. All needed headers are staged into the
 using the :ref:`ref-classes-module` class.
 
 If a file named ``defconfig`` is listed in :term:`SRC_URI`, then by default
-:ref:`ref-tasks-configure` copies it as ``.config`` in the build directory,
+:term:`do_configure` copies it as ``.config`` in the build directory,
 so it is automatically used as the kernel configuration for the build. This
 copy is not performed in case ``.config`` already exists there: this allows
 recipes to produce a configuration by other means in
@@ -1707,7 +1707,7 @@ This class is enabled by default since it is inherited by the
 The :ref:`ref-classes-module` class provides support for building out-of-tree Linux
 kernel modules. The class inherits the :ref:`ref-classes-module-base` and
 :ref:`ref-classes-kernel-module-split` classes, and implements the
-:ref:`ref-tasks-compile` and :ref:`ref-tasks-install` tasks. The class provides
+:term:`do_compile` and :term:`do_install` tasks. The class provides
 everything needed to build and package a kernel module.
 
 For general information on out-of-tree Linux kernel modules, see the
@@ -2145,7 +2145,7 @@ Previously, this class was called the ``task`` class.
 =========
 
 The :ref:`ref-classes-patch` class provides all functionality for applying patches
-during the :ref:`ref-tasks-patch` task.
+during the :term:`do_patch` task.
 
 This class is enabled by default because it is inherited by the
 :ref:`ref-classes-base` class.
@@ -2319,7 +2319,7 @@ files.
 
 The :ref:`ref-classes-populate-sdk` class provides support for SDK-only recipes. For
 information on advantages gained when building a cross-development
-toolchain using the :ref:`ref-tasks-populate_sdk`
+toolchain using the :term:`do_populate_sdk`
 task, see the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
@@ -2375,7 +2375,7 @@ For more information on the cross-development toolchain generation, see
 the ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual. For
 information on advantages gained when building a cross-development
-toolchain using the :ref:`ref-tasks-populate_sdk`
+toolchain using the :term:`do_populate_sdk`
 task, see the
 ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
@@ -2471,7 +2471,7 @@ packages leveraging the `pytest <https://docs.pytest.org>`__ unit test framework
 
 Within the recipe, the :term:`PTEST_PYTEST_DIR` variable specifies the path to
 the directory containing the tests that will be installed in :term:`D` by the
-:ref:`ref-tasks-install_ptest_base` task, as well as a specific ``run-ptest``
+:term:`do_install_ptest_base` task, as well as a specific ``run-ptest``
 script for this task.
 
 .. _ref-classes-python3-dir:
@@ -2558,7 +2558,7 @@ both the :ref:`ref-classes-cross` and :ref:`ref-classes-native` classes.
 ==================
 
 The :ref:`ref-classes-remove-libtool` class adds a post function to the
-:ref:`ref-tasks-install` task to remove all ``.la`` files
+:term:`do_install` task to remove all ``.la`` files
 installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.
 
@@ -2815,7 +2815,7 @@ uses these build systems, the recipe needs to inherit the
 
    .. note::
 
-      The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-compile` task now calls
+      The :ref:`ref-classes-setuptools3` class :term:`do_compile` task now calls
       ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
       (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
 
@@ -2826,7 +2826,7 @@ uses these build systems, the recipe needs to inherit the
 
    .. note::
 
-     The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-install` task now
+     The :ref:`ref-classes-setuptools3` class :term:`do_install` task now
      installs the ``wheel`` binary archive. In current versions of
      ``setuptools`` the legacy ``setup.py install`` method is deprecated. If
      the ``setup.py`` cannot be used with wheels, for example it creates files
@@ -2907,12 +2907,12 @@ section in the Yocto Project Overview and Concepts Manual.
 The :ref:`ref-classes-staging` class installs files into individual recipe work
 directories for sysroots. The class contains the following key tasks:
 
--  The :ref:`ref-tasks-populate_sysroot` task,
+-  The :term:`do_populate_sysroot` task,
    which is responsible for handing the files that end up in the recipe
    sysroots.
 
 -  The
-   :ref:`ref-tasks-prepare_recipe_sysroot`
+   :term:`do_prepare_recipe_sysroot`
    task (a "partner" task to the ``populate_sysroot`` task), which
    installs the files into the individual recipe work directories (i.e.
    :term:`WORKDIR`).
@@ -2923,8 +2923,8 @@ in two stages:
 -  *Stage One:* The first stage addresses recipes that have files they
    want to share with other recipes that have dependencies on the
    originating recipe. Normally these dependencies are installed through
-   the :ref:`ref-tasks-install` task into
-   ``${``\ :term:`D`\ ``}``. The :ref:`ref-tasks-populate_sysroot` task
+   the :term:`do_install` task into
+   ``${``\ :term:`D`\ ``}``. The :term:`do_populate_sysroot` task
    copies a subset of these files into ``${SYSROOT_DESTDIR}``. This
    subset of files is controlled by the
    :term:`SYSROOT_DIRS`,
@@ -2953,7 +2953,7 @@ in two stages:
    something from another recipe and declare a dependency on that recipe
    through the :term:`DEPENDS` variable. The recipe will
    have a
-   :ref:`ref-tasks-prepare_recipe_sysroot`
+   :term:`do_prepare_recipe_sysroot`
    task and when this task executes, it creates the ``recipe-sysroot``
    and ``recipe-sysroot-native`` in the recipe work directory (i.e.
    :term:`WORKDIR`). The OpenEmbedded build system
@@ -3053,7 +3053,7 @@ The functionality for this class is disabled unless you have "systemd"
 in :term:`DISTRO_FEATURES`.
 
 Under this class, the recipe or Makefile (i.e. whatever the recipe is
-calling during the :ref:`ref-tasks-install` task)
+calling during the :term:`do_install` task)
 installs unit files into
 ``${``\ :term:`D`\ ``}${systemd_unitdir}/system``. If the unit
 files being installed go into packages other than the main package, you
@@ -3763,7 +3763,7 @@ information.
 
 The :ref:`ref-classes-utility-tasks` class provides support for various
 "utility" type tasks that are applicable to all recipes, such as
-:ref:`ref-tasks-clean` and :ref:`ref-tasks-listtasks`.
+:term:`do_clean` and :term:`do_listtasks`.
 
 This class is enabled by default because it is inherited by the
 :ref:`ref-classes-base` class.
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 863825b06..7fedf7679 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -523,7 +523,7 @@ The target is the address of the target machine, which must be running
 an SSH server (i.e. ``user@hostname[:destdir]``).
 
 This command deploys all files installed during the
-:ref:`ref-tasks-install` task. Furthermore, you do not
+:term:`do_install` task. Furthermore, you do not
 need to have package management enabled within the target machine. If
 you do, the package manager is bypassed.
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 65d5db5d2..836ed5ff0 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -275,7 +275,7 @@ Why don't other recipes find the files provided by my ``*-native`` recipe?
 
 Files provided by your native recipe could be missing from the native
 sysroot, your recipe could also be installing to the wrong place, or you
-could be getting permission errors during the :ref:`ref-tasks-install`
+could be getting permission errors during the :term:`do_install`
 task in your recipe.
 
 This situation happens when the build system used by a package does not
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 77d034f0c..876919eb8 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -42,7 +42,7 @@ one-to-one correspondence to packages, and they can go beyond simply
 controlling the installation of a package or packages. Sometimes a
 feature can influence how certain recipes are built. For example, a
 feature might determine whether a particular configure option is
-specified within the :ref:`ref-tasks-configure` task
+specified within the :term:`do_configure` task
 for a particular recipe.
 
 This feature list only represents features as shipped with the Yocto
@@ -106,7 +106,7 @@ your distribution. Features do not have a one-to-one correspondence to
 packages, and they can go beyond simply controlling the installation of
 a package or packages. In most cases, the presence or absence of a
 feature translates to the appropriate option supplied to the configure
-script during the :ref:`ref-tasks-configure` task for
+script during the :term:`do_configure` task for
 the recipes that optionally support the feature. Appropriate options
 must be supplied, and enabling/disabling :term:`PACKAGECONFIG` for the
 concerned packages is one way of supplying such options.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 9654cf08e..1d90a4fa7 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -89,7 +89,7 @@ line if preceded with "-Wl,").
    the target operating system or is intended to run on a separate
    processor within the device, you can add "arch" to
    :term:`INSANE_SKIP` for the package. Another
-   option is to check the :ref:`ref-tasks-compile` log
+   option is to check the :term:`do_compile` log
    and verify that the compiler options being used are correct.
 
 -  ``Bit size did not match (<file_bits>, expected <machine_bits>) in <file> [arch]``
@@ -105,7 +105,7 @@ line if preceded with "-Wl,").
    the target operating system or is intended to run on a separate
    processor within the device, you can add "arch" to
    :term:`INSANE_SKIP` for the package. Another
-   option is to check the :ref:`ref-tasks-compile` log
+   option is to check the :term:`do_compile` log
    and verify that the compiler options being used are correct.
 
 -  ``Endianness did not match (<file_endianness>, expected <machine_endianness>) in <file> [arch]``
@@ -121,7 +121,7 @@ line if preceded with "-Wl,").
    the target operating system or is intended to run on a separate
    processor within the device, you can add "arch" to
    :term:`INSANE_SKIP` for the package. Another
-   option is to check the :ref:`ref-tasks-compile` log
+   option is to check the :term:`do_compile` log
    and verify that the compiler options being used are correct.
 
 .. _qa-check-build-deps:
@@ -179,7 +179,7 @@ remove the warning.
 
 ``This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities. Rerun configure task after fixing this. [configure-unsafe]``
 
-The log for the :ref:`ref-tasks-configure` task
+The log for the :term:`do_configure` task
 indicates that paths on the host were searched for files, which is
 not appropriate when cross-compiling. Look for "is unsafe for
 cross-compilation" or "CROSS COMPILE Badness" in the specified log
@@ -303,7 +303,7 @@ The specified package is installing files into a directory that is
 normally expected to be empty (such as ``/tmp``). These files may
 be more appropriately installed to a different location, or
 perhaps alternatively not installed at all, usually by updating the
-:ref:`ref-tasks-install` task/function.
+:term:`do_install` task/function.
 
 .. _qa-check-file-rdeps:
 
@@ -343,7 +343,7 @@ ID that matches the user running BitBake. A match usually indicates
 that the files are being installed with an incorrect UID/GID, since
 target IDs are independent from host IDs. For additional information,
 see the section describing the
-:ref:`ref-tasks-install` task.
+:term:`do_install` task.
 
 .. _qa-check-infodir:
 
@@ -353,7 +353,7 @@ see the section describing the
 ``The /usr/share/info/dir file is not meant to be shipped in a particular package. [infodir]``
 
 The ``/usr/share/info/dir`` should not be packaged. Add the following
-line to your :ref:`ref-tasks-install` task or to your
+line to your :term:`do_install` task or to your
 ``do_install:append`` within the recipe as follows::
 
    rm ${D}${infodir}/dir
@@ -366,7 +366,7 @@ line to your :ref:`ref-tasks-install` task or to your
 ``<recipename>: Files/directories were installed but not shipped in any package [installed-vs-shipped]``
 
 Files have been installed within the
-:ref:`ref-tasks-install` task but have not been
+:term:`do_install` task but have not been
 included in any package by way of the :term:`FILES`
 variable. Files that do not appear in any package cannot be present
 in an image later on in the build process. You need to do one of the
@@ -376,7 +376,7 @@ following:
    in (e.g. ``FILES:${``\ :term:`PN`\ ``}`` for the main
    package).
 
--  Delete the files at the end of the :ref:`ref-tasks-install` task if the
+-  Delete the files at the end of the :term:`do_install` task if the
    files are not needed in any package.
 
 .. _qa-check-incompatible-license:
@@ -479,7 +479,7 @@ The specified package contains mime type files (``.xml`` files in
 ``${datadir}/mime/packages``) and yet does not inherit the
 :ref:`ref-classes-mime` class which will ensure that these get
 properly installed. Either add ``inherit mime`` to the recipe or remove the
-files at the :ref:`ref-tasks-install` step if they are not needed.
+files at the :term:`do_install` step if they are not needed.
 
 .. _qa-check-mime-xdg:
 
@@ -492,7 +492,7 @@ The specified package contains a .desktop file with a 'MimeType' key
 present, but does not inherit the :ref:`ref-classes-mime-xdg`
 class that is required in order for that to be activated. Either add
 ``inherit mime`` to the recipe or remove the files at the
-:ref:`ref-tasks-install` step if they are not needed.
+:term:`do_install` step if they are not needed.
 
 .. _qa-check-missing-update-alternatives:
 
@@ -526,7 +526,7 @@ already in the variable's value.
 
 ``Fuzz detected: <patch output> [patch-fuzz]``
 
-This check looks for evidence of "fuzz" when applying patches within the :ref:`ref-tasks-patch`
+This check looks for evidence of "fuzz" when applying patches within the :term:`do_patch`
 task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
 lines in order to apply the patch. Consider this example:
 
@@ -868,7 +868,7 @@ load paths (rpaths) that contain build system paths such as
 :term:`TMPDIR`, which are incorrect for the target and
 could potentially be a security issue. Check for bad ``-rpath``
 options being passed to the linker in your
-:ref:`ref-tasks-compile` log. Depending on the build
+:term:`do_compile` log. Depending on the build
 system used by the software being built, there might be a configure
 option to disable rpath usage completely within the build of the
 software.
@@ -978,8 +978,8 @@ the build of the software.
 
 If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
 installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
-message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
-:ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
+message, it indicates that the :term:`do_install` step (or perhaps the build process that
+:term:`do_install` is calling into, e.g. ``make install`` is using hardcoded paths instead
 of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
 changed so that it does.
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 315a078f7..2f1a67a2f 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -606,7 +606,7 @@ contamination.
 ~~~~~~~~~~~~~~~~~~~~~~
 
 The OpenEmbedded build system uses this directory to store package metadata
-generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
+generated during the :term:`do_packagedata` task. The files stored in this
 directory contain information about each output package produced by the
 OpenEmbedded build system, and are used in different ways by the build system
 such as ":ref:`dev-manual/debugging:viewing package information with
@@ -631,7 +631,7 @@ another.
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 This directory is the location of the sysroot contents that the task
-:ref:`ref-tasks-prepare_recipe_sysroot`
+:term:`do_prepare_recipe_sysroot`
 links or copies into the recipe-specific sysroot for each recipe listed
 in :term:`DEPENDS`. Population of this directory is
 handled through shared state, while the path is specified by the
@@ -745,21 +745,21 @@ Here are key subdirectories within each recipe work directory:
    which tasks were executed.
 
 -  ``${WORKDIR}/image``: Contains the output of the
-   :ref:`ref-tasks-install` task, which corresponds to
+   :term:`do_install` task, which corresponds to
    the ``${``\ :term:`D`\ ``}`` variable in that task.
 
 -  ``${WORKDIR}/pseudo``: Contains the pseudo database and log for any
    tasks executed under pseudo for the recipe.
 
 -  ``${WORKDIR}/sysroot-destdir``: Contains the output of the
-   :ref:`ref-tasks-populate_sysroot` task.
+   :term:`do_populate_sysroot` task.
 
 -  ``${WORKDIR}/package``: Contains the output of the
-   :ref:`ref-tasks-package` task before the output is
+   :term:`do_package` task before the output is
    split into individual packages.
 
 -  ``${WORKDIR}/packages-split``: Contains the output of the
-   :ref:`ref-tasks-package` task after the output has been split into individual
+   :term:`do_package` task after the output has been split into individual
    packages. There are subdirectories for each individual package created by
    the recipe.
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 3517d0b91..9a1deee20 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -45,415 +45,340 @@ recipe. For more information on tasks and dependencies, see the
 ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`" sections in the
 BitBake User Manual.
 
-.. _ref-tasks-build:
+.. glossary::
+   :sorted:
 
-``do_build``
-------------
+   :term:`do_build`
+      The default task for all recipes. This task depends on all other normal
+      tasks required to build a recipe.
 
-The default task for all recipes. This task depends on all other normal
-tasks required to build a recipe.
+   :term:`do_compile`
 
-.. _ref-tasks-compile:
+      Compiles the source code. This task runs with the current working
+      directory set to ``${``\ :term:`B`\ ``}``.
 
-``do_compile``
---------------
+      The default behavior of this task is to run the ``oe_runmake`` function
+      if a makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found.
+      If no such file is found, the :term:`do_compile` task does nothing.
 
-Compiles the source code. This task runs with the current working
-directory set to ``${``\ :term:`B`\ ``}``.
+   :term:`do_compile_ptest_base`
 
-The default behavior of this task is to run the ``oe_runmake`` function
-if a makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found.
-If no such file is found, the :ref:`ref-tasks-compile` task does nothing.
+      Compiles the runtime test suite included in the software being built.
 
-.. _ref-tasks-compile_ptest_base:
+   :term:`do_configure`
 
-``do_compile_ptest_base``
--------------------------
+      Configures the source by enabling and disabling any build-time and
+      configuration options for the software being built. The task runs with
+      the current working directory set to ``${``\ :term:`B`\ ``}``.
 
-Compiles the runtime test suite included in the software being built.
+      The default behavior of this task is to run ``oe_runmake clean`` if a
+      makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found and
+      :term:`CLEANBROKEN` is not set to "1". If no such
+      file is found or the :term:`CLEANBROKEN` variable is set to "1", the
+      :term:`do_configure` task does nothing.
 
-.. _ref-tasks-configure:
+   :term:`do_configure_ptest_base`
 
-``do_configure``
-----------------
+      Configures the runtime test suite included in the software being built.
 
-Configures the source by enabling and disabling any build-time and
-configuration options for the software being built. The task runs with
-the current working directory set to ``${``\ :term:`B`\ ``}``.
+   :term:`do_deploy`
 
-The default behavior of this task is to run ``oe_runmake clean`` if a
-makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found and
-:term:`CLEANBROKEN` is not set to "1". If no such
-file is found or the :term:`CLEANBROKEN` variable is set to "1", the
-:ref:`ref-tasks-configure` task does nothing.
+      Writes output files that are to be deployed to
+      ``${``\ :term:`DEPLOY_DIR_IMAGE`\ ``}``. The
+      task runs with the current working directory set to
+      ``${``\ :term:`B`\ ``}``.
 
-.. _ref-tasks-configure_ptest_base:
+      Recipes implementing this task should inherit the
+      :ref:`ref-classes-deploy` class and should write the output
+      to ``${``\ :term:`DEPLOYDIR`\ ``}``, which is not to be
+      confused with ``${``\ :term:`DEPLOY_DIR`\ ``}``. The :ref:`ref-classes-deploy` class sets up
+      :term:`do_deploy` as a shared state (sstate) task that can be accelerated
+      through sstate use. The sstate mechanism takes care of copying the
+      output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
 
-``do_configure_ptest_base``
----------------------------
+      .. note::
 
-Configures the runtime test suite included in the software being built.
+         Do not write the output directly to ``${DEPLOY_DIR_IMAGE}``, as this causes
+         the sstate mechanism to malfunction.
 
-.. _ref-tasks-deploy:
+      The :term:`do_deploy` task is not added as a task by default and
+      consequently needs to be added manually. If you want the task to run
+      after :term:`do_compile`, you can add it by doing
+      the following::
 
-``do_deploy``
--------------
+            addtask deploy after do_compile
 
-Writes output files that are to be deployed to
-``${``\ :term:`DEPLOY_DIR_IMAGE`\ ``}``. The
-task runs with the current working directory set to
-``${``\ :term:`B`\ ``}``.
+      Adding :term:`do_deploy` after other tasks works the same way.
 
-Recipes implementing this task should inherit the
-:ref:`ref-classes-deploy` class and should write the output
-to ``${``\ :term:`DEPLOYDIR`\ ``}``, which is not to be
-confused with ``${``\ :term:`DEPLOY_DIR`\ ``}``. The :ref:`ref-classes-deploy` class sets up
-:ref:`ref-tasks-deploy` as a shared state (sstate) task that can be accelerated
-through sstate use. The sstate mechanism takes care of copying the
-output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
+      .. note::
 
-.. note::
+         You do not need to add ``before do_build`` to the ``addtask`` command
+         (though it is harmless), because the :ref:`ref-classes-base` class contains the following::
 
-   Do not write the output directly to ``${DEPLOY_DIR_IMAGE}``, as this causes
-   the sstate mechanism to malfunction.
+                 do_build[recrdeptask] += "do_deploy"
 
-The :ref:`ref-tasks-deploy` task is not added as a task by default and
-consequently needs to be added manually. If you want the task to run
-after :ref:`ref-tasks-compile`, you can add it by doing
-the following::
 
-      addtask deploy after do_compile
+         See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`"
+         section in the BitBake User Manual for more information.
 
-Adding :ref:`ref-tasks-deploy` after other tasks works the same way.
+      If the :term:`do_deploy` task re-executes, any previous output is removed
+      (i.e. "cleaned").
 
-.. note::
+   :term:`do_fetch`
 
-   You do not need to add ``before do_build`` to the ``addtask`` command
-   (though it is harmless), because the :ref:`ref-classes-base` class contains the following::
+      Fetches the source code. This task uses the :term:`SRC_URI` variable and the
+      argument's prefix to determine the correct
+      :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
+      module.
 
-           do_build[recrdeptask] += "do_deploy"
+   :term:`do_image`
 
+      Starts the image generation process. The :term:`do_image` task runs after
+      the OpenEmbedded build system has run the
+      :term:`do_rootfs` task during which packages are
+      identified for installation into the image and the root filesystem is
+      created, complete with post-processing.
 
-   See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`"
-   section in the BitBake User Manual for more information.
+      The :term:`do_image` task performs pre-processing on the image through the
+      :term:`IMAGE_PREPROCESS_COMMAND` and
+      dynamically generates supporting :term:`do_image_* <do_image>` tasks as needed.
 
-If the :ref:`ref-tasks-deploy` task re-executes, any previous output is removed
-(i.e. "cleaned").
+      For more information on image creation, see the ":ref:`overview-manual/concepts:image generation`"
+      section in the Yocto Project Overview and Concepts Manual.
 
-.. _ref-tasks-fetch:
+   :term:`do_image_complete`
 
-``do_fetch``
-------------
+      Completes the image generation process. The :term:`do_image_complete` task
+      runs after the OpenEmbedded build system has run the
+      :term:`do_image` task during which image
+      pre-processing occurs and through dynamically generated :term:`do_image_*
+      <do_image>`
+      tasks the image is constructed.
 
-Fetches the source code. This task uses the :term:`SRC_URI` variable and the
-argument's prefix to determine the correct
-:ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
-module.
+      The :term:`do_image_complete` task performs post-processing on the image
+      through the
+      :term:`IMAGE_POSTPROCESS_COMMAND`.
 
-.. _ref-tasks-image:
+      For more information on image creation, see the
+      ":ref:`overview-manual/concepts:image generation`"
+      section in the Yocto Project Overview and Concepts Manual.
 
-``do_image``
-------------
+   :term:`do_install`
 
-Starts the image generation process. The :ref:`ref-tasks-image` task runs after
-the OpenEmbedded build system has run the
-:ref:`ref-tasks-rootfs` task during which packages are
-identified for installation into the image and the root filesystem is
-created, complete with post-processing.
+      Copies files that are to be packaged into the holding area
+      ``${``\ :term:`D`\ ``}``. This task runs with the current
+      working directory set to ``${``\ :term:`B`\ ``}``, which is the
+      compilation directory. The :term:`do_install` task, as well as other tasks
+      that either directly or indirectly depend on the installed files (e.g.
+      :term:`do_package`, :term:`do_package_write_* <do_package_write_deb>`, and
+      :term:`do_rootfs`), run under
+      :ref:`fakeroot <overview-manual/concepts:fakeroot and pseudo>`.
 
-The :ref:`ref-tasks-image` task performs pre-processing on the image through the
-:term:`IMAGE_PREPROCESS_COMMAND` and
-dynamically generates supporting :ref:`do_image_* <ref-tasks-image>` tasks as needed.
+      .. note::
 
-For more information on image creation, see the ":ref:`overview-manual/concepts:image generation`"
-section in the Yocto Project Overview and Concepts Manual.
+         When installing files, be careful not to set the owner and group IDs
+         of the installed files to unintended values. Some methods of copying
+         files, notably when using the recursive ``cp`` command, can preserve
+         the UID and/or GID of the original file, which is usually not what
+         you want. The ``host-user-contaminated`` QA check checks for files
+         that probably have the wrong ownership.
 
-.. _ref-tasks-image-complete:
+         Safe methods for installing files include the following:
 
-``do_image_complete``
----------------------
+         -  The ``install`` utility. This utility is the preferred method.
 
-Completes the image generation process. The :ref:`do_image_complete <ref-tasks-image-complete>` task
-runs after the OpenEmbedded build system has run the
-:ref:`ref-tasks-image` task during which image
-pre-processing occurs and through dynamically generated :ref:`do_image_* <ref-tasks-image>`
-tasks the image is constructed.
+         -  The ``cp`` command with the ``--no-preserve=ownership`` option.
 
-The :ref:`do_image_complete <ref-tasks-image-complete>` task performs post-processing on the image
-through the
-:term:`IMAGE_POSTPROCESS_COMMAND`.
+         -  The ``tar`` command with the ``--no-same-owner`` option. See the
+            ``bin_package.bbclass`` file in the ``meta/classes-recipe``
+            subdirectory of :term:`OpenEmbedded-Core (OE-Core)` for an example.
 
-For more information on image creation, see the
-":ref:`overview-manual/concepts:image generation`"
-section in the Yocto Project Overview and Concepts Manual.
+   :term:`do_install_ptest_base`
 
-.. _ref-tasks-install:
+      Copies the runtime test suite files from the compilation directory to a
+      holding area.
 
-``do_install``
---------------
+   :term:`do_package`
 
-Copies files that are to be packaged into the holding area
-``${``\ :term:`D`\ ``}``. This task runs with the current
-working directory set to ``${``\ :term:`B`\ ``}``, which is the
-compilation directory. The :ref:`ref-tasks-install` task, as well as other tasks
-that either directly or indirectly depend on the installed files (e.g.
-:ref:`ref-tasks-package`, :ref:`do_package_write_* <ref-tasks-package_write_deb>`, and
-:ref:`ref-tasks-rootfs`), run under
-:ref:`fakeroot <overview-manual/concepts:fakeroot and pseudo>`.
+      Analyzes the content of the holding area
+      ``${``\ :term:`D`\ ``}`` and splits the content into subsets
+      based on available packages and files. This task makes use of the
+      :term:`PACKAGES` and :term:`FILES`
+      variables.
 
-.. note::
+      The :term:`do_package` task, in conjunction with the
+      :term:`do_packagedata` task, also saves some
+      important package metadata. For additional information, see the
+      :term:`PKGDESTWORK` variable and the
+      ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
+      section in the Yocto Project Overview and Concepts Manual.
 
-   When installing files, be careful not to set the owner and group IDs
-   of the installed files to unintended values. Some methods of copying
-   files, notably when using the recursive ``cp`` command, can preserve
-   the UID and/or GID of the original file, which is usually not what
-   you want. The ``host-user-contaminated`` QA check checks for files
-   that probably have the wrong ownership.
+   :term:`do_package_qa`
 
-   Safe methods for installing files include the following:
+      Runs QA checks on packaged files. For more information on these checks,
+      see the :doc:`/ref-manual/qa-checks` document.
 
-   -  The ``install`` utility. This utility is the preferred method.
+   :term:`do_package_write_deb`
 
-   -  The ``cp`` command with the ``--no-preserve=ownership`` option.
+      Creates Debian packages (i.e. ``*.deb`` files) and places them in the
+      ``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory in
+      the package feeds area. For more information, see the
+      ":ref:`overview-manual/concepts:package feeds`" section in
+      the Yocto Project Overview and Concepts Manual.
 
-   -  The ``tar`` command with the ``--no-same-owner`` option. See the
-      ``bin_package.bbclass`` file in the ``meta/classes-recipe``
-      subdirectory of :term:`OpenEmbedded-Core (OE-Core)` for an example.
+   :term:`do_package_write_ipk`
 
-.. _ref-tasks-install_ptest_base:
+      Creates IPK packages (i.e. ``*.ipk`` files) and places them in the
+      ``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory in
+      the package feeds area. For more information, see the
+      ":ref:`overview-manual/concepts:package feeds`" section in
+      the Yocto Project Overview and Concepts Manual.
 
-``do_install_ptest_base``
--------------------------
+   :term:`do_package_write_rpm`
 
-Copies the runtime test suite files from the compilation directory to a
-holding area.
+      Creates RPM packages (i.e. ``*.rpm`` files) and places them in the
+      ``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory in
+      the package feeds area. For more information, see the
+      ":ref:`overview-manual/concepts:package feeds`" section in
+      the Yocto Project Overview and Concepts Manual.
 
-.. _ref-tasks-package:
+   :term:`do_packagedata`
 
-``do_package``
---------------
+      Saves package metadata generated by the
+      :term:`do_package` task in
+      :term:`PKGDATA_DIR` to make it available globally.
 
-Analyzes the content of the holding area
-``${``\ :term:`D`\ ``}`` and splits the content into subsets
-based on available packages and files. This task makes use of the
-:term:`PACKAGES` and :term:`FILES`
-variables.
+   :term:`do_patch`
 
-The :ref:`ref-tasks-package` task, in conjunction with the
-:ref:`ref-tasks-packagedata` task, also saves some
-important package metadata. For additional information, see the
-:term:`PKGDESTWORK` variable and the
-":ref:`overview-manual/concepts:automatically added runtime dependencies`"
-section in the Yocto Project Overview and Concepts Manual.
+      Locates patch files and applies them to the source code.
 
-.. _ref-tasks-package_qa:
+      After fetching and unpacking source files, the build system uses the
+      recipe's :term:`SRC_URI` statements
+      to locate and apply patch files to the source code.
 
-``do_package_qa``
------------------
+      .. note::
 
-Runs QA checks on packaged files. For more information on these checks,
-see the :doc:`/ref-manual/qa-checks` document.
+         The build system uses the :term:`FILESPATH` variable to determine the
+         default set of directories when searching for patches.
 
-.. _ref-tasks-package_write_deb:
+      Patch files, by default, are ``*.patch`` and ``*.diff`` files created
+      and kept in a subdirectory of the directory holding the recipe file. For
+      example, consider the
+      :oe_git:`bluez5 </openembedded-core/tree/meta/recipes-connectivity/bluez5>`
+      recipe from the :term:`OpenEmbedded-Core (OE-Core)` layer::
 
-``do_package_write_deb``
-------------------------
+         meta/recipes-connectivity/bluez5
 
-Creates Debian packages (i.e. ``*.deb`` files) and places them in the
-``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory in
-the package feeds area. For more information, see the
-":ref:`overview-manual/concepts:package feeds`" section in
-the Yocto Project Overview and Concepts Manual.
+      This recipe has two patch files located here::
 
-.. _ref-tasks-package_write_ipk:
+         meta/recipes-connectivity/bluez5/bluez5
 
-``do_package_write_ipk``
-------------------------
+      In the ``bluez5`` recipe, the :term:`SRC_URI` statements point to the source
+      and patch files needed to build the package.
 
-Creates IPK packages (i.e. ``*.ipk`` files) and places them in the
-``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory in
-the package feeds area. For more information, see the
-":ref:`overview-manual/concepts:package feeds`" section in
-the Yocto Project Overview and Concepts Manual.
+      .. note::
 
-.. _ref-tasks-package_write_rpm:
+         In the case for the ``bluez5_5.48.bb`` recipe, the :term:`SRC_URI` statements
+         are from an include file ``bluez5.inc``.
 
-``do_package_write_rpm``
-------------------------
+      As mentioned earlier, the build system treats files whose file types are
+      ``.patch`` and ``.diff`` as patch files. However, you can use the
+      "apply=yes" parameter with the :term:`SRC_URI` statement to indicate any
+      file as a patch file::
 
-Creates RPM packages (i.e. ``*.rpm`` files) and places them in the
-``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory in
-the package feeds area. For more information, see the
-":ref:`overview-manual/concepts:package feeds`" section in
-the Yocto Project Overview and Concepts Manual.
+         SRC_URI = " \
+             git://path_to_repo/some_package \
+             file://file;apply=yes \
+             "
 
-.. _ref-tasks-packagedata:
+      Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
+      and you want to exclude it so that the :term:`do_patch` task does not apply
+      it during the patch phase, you can use the "apply=no" parameter with the
+      :term:`SRC_URI` statement::
 
-``do_packagedata``
-------------------
+         SRC_URI = " \
+             git://path_to_repo/some_package \
+             file://file1.patch \
+             file://file2.patch;apply=no \
+             "
 
-Saves package metadata generated by the
-:ref:`ref-tasks-package` task in
-:term:`PKGDATA_DIR` to make it available globally.
+      In the previous example ``file1.patch`` would be applied as a patch by default
+      while ``file2.patch`` would not be applied.
 
-.. _ref-tasks-patch:
+      You can find out more about the patching process in the
+      ":ref:`overview-manual/concepts:patching`" section in
+      the Yocto Project Overview and Concepts Manual and the
+      ":ref:`dev-manual/new-recipe:patching code`" section in the
+      Yocto Project Development Tasks Manual.
 
-``do_patch``
-------------
+   :term:`do_populate_lic`
 
-Locates patch files and applies them to the source code.
+      Writes license information for the recipe that is collected later when
+      the image is constructed.
 
-After fetching and unpacking source files, the build system uses the
-recipe's :term:`SRC_URI` statements
-to locate and apply patch files to the source code.
+   :term:`do_populate_sdk`
 
-.. note::
+      Creates the file and directory structure for an installable SDK. See the
+      ":ref:`overview-manual/concepts:sdk generation`"
+      section in the Yocto Project Overview and Concepts Manual for more
+      information.
 
-   The build system uses the :term:`FILESPATH` variable to determine the
-   default set of directories when searching for patches.
+   :term:`do_populate_sdk_ext`
 
-Patch files, by default, are ``*.patch`` and ``*.diff`` files created
-and kept in a subdirectory of the directory holding the recipe file. For
-example, consider the
-:oe_git:`bluez5 </openembedded-core/tree/meta/recipes-connectivity/bluez5>`
-recipe from the :term:`OpenEmbedded-Core (OE-Core)` layer::
+      Creates the file and directory structure for an installable extensible
+      SDK (eSDK). See the ":ref:`overview-manual/concepts:sdk generation`"
+      section in the Yocto Project Overview and Concepts Manual for more
+      information.
 
-   meta/recipes-connectivity/bluez5
 
-This recipe has two patch files located here::
+   :term:`do_populate_sysroot`
 
-   meta/recipes-connectivity/bluez5/bluez5
+      Stages (copies) a subset of the files installed by the
+      :term:`do_install` task into the appropriate
+      sysroot. For information on how to access these files from other
+      recipes, see the :term:`STAGING_DIR* <STAGING_DIR_HOST>` variables.
+      Directories that would typically not be needed by other recipes at build
+      time (e.g. ``/etc``) are not copied by default.
 
-In the ``bluez5`` recipe, the :term:`SRC_URI` statements point to the source
-and patch files needed to build the package.
+      For information on what directories are copied by default, see the
+      :term:`SYSROOT_DIRS* <SYSROOT_DIRS>` variables. You can change
+      these variables inside your recipe if you need to make additional (or
+      fewer) directories available to other recipes at build time.
 
-.. note::
+      The :term:`do_populate_sysroot` task is a shared state (sstate) task, which
+      means that the task can be accelerated through sstate use. Realize also
+      that if the task is re-executed, any previous output is removed (i.e.
+      "cleaned").
 
-   In the case for the ``bluez5_5.48.bb`` recipe, the :term:`SRC_URI` statements
-   are from an include file ``bluez5.inc``.
+   :term:`do_prepare_recipe_sysroot`
 
-As mentioned earlier, the build system treats files whose file types are
-``.patch`` and ``.diff`` as patch files. However, you can use the
-"apply=yes" parameter with the :term:`SRC_URI` statement to indicate any
-file as a patch file::
+      Installs the files into the individual recipe specific sysroots (i.e.
+      ``recipe-sysroot`` and ``recipe-sysroot-native`` under
+      ``${``\ :term:`WORKDIR`\ ``}`` based upon the
+      dependencies specified by :term:`DEPENDS`). See the
+      ":ref:`ref-classes-staging`" class for more information.
 
-   SRC_URI = " \
-       git://path_to_repo/some_package \
-       file://file;apply=yes \
-       "
+   :term:`do_recipe_qa`
 
-Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
-and you want to exclude it so that the :ref:`ref-tasks-patch` task does not apply
-it during the patch phase, you can use the "apply=no" parameter with the
-:term:`SRC_URI` statement::
+      Performs QA check on recipes that can operate entirely from recipe metadata and
+      do not need any of the build artefacts or source code.
 
-   SRC_URI = " \
-       git://path_to_repo/some_package \
-       file://file1.patch \
-       file://file2.patch;apply=no \
-       "
+      The list of QA checks that this tasks defines are documented in
+      :doc:`/ref-manual/qa-checks`.
 
-In the previous example ``file1.patch`` would be applied as a patch by default
-while ``file2.patch`` would not be applied.
+   :term:`do_rm_work`
 
-You can find out more about the patching process in the
-":ref:`overview-manual/concepts:patching`" section in
-the Yocto Project Overview and Concepts Manual and the
-":ref:`dev-manual/new-recipe:patching code`" section in the
-Yocto Project Development Tasks Manual.
+      Removes work files after the OpenEmbedded build system has finished with
+      them. You can learn more by looking at the
+      ":ref:`ref-classes-rm-work`" section.
 
-.. _ref-tasks-populate_lic:
+   :term:`do_unpack`
 
-``do_populate_lic``
--------------------
-
-Writes license information for the recipe that is collected later when
-the image is constructed.
-
-.. _ref-tasks-populate_sdk:
-
-``do_populate_sdk``
--------------------
-
-Creates the file and directory structure for an installable SDK. See the
-":ref:`overview-manual/concepts:sdk generation`"
-section in the Yocto Project Overview and Concepts Manual for more
-information.
-
-.. _ref-tasks-populate_sdk_ext:
-
-``do_populate_sdk_ext``
------------------------
-
-Creates the file and directory structure for an installable extensible
-SDK (eSDK). See the ":ref:`overview-manual/concepts:sdk generation`"
-section in the Yocto Project Overview and Concepts Manual for more
-information.
-
-
-.. _ref-tasks-populate_sysroot:
-
-``do_populate_sysroot``
------------------------
-
-Stages (copies) a subset of the files installed by the
-:ref:`ref-tasks-install` task into the appropriate
-sysroot. For information on how to access these files from other
-recipes, see the :term:`STAGING_DIR* <STAGING_DIR_HOST>` variables.
-Directories that would typically not be needed by other recipes at build
-time (e.g. ``/etc``) are not copied by default.
-
-For information on what directories are copied by default, see the
-:term:`SYSROOT_DIRS* <SYSROOT_DIRS>` variables. You can change
-these variables inside your recipe if you need to make additional (or
-fewer) directories available to other recipes at build time.
-
-The :ref:`ref-tasks-populate_sysroot` task is a shared state (sstate) task, which
-means that the task can be accelerated through sstate use. Realize also
-that if the task is re-executed, any previous output is removed (i.e.
-"cleaned").
-
-.. _ref-tasks-prepare_recipe_sysroot:
-
-``do_prepare_recipe_sysroot``
------------------------------
-
-Installs the files into the individual recipe specific sysroots (i.e.
-``recipe-sysroot`` and ``recipe-sysroot-native`` under
-``${``\ :term:`WORKDIR`\ ``}`` based upon the
-dependencies specified by :term:`DEPENDS`). See the
-":ref:`ref-classes-staging`" class for more information.
-
-.. _ref-tasks-recipe-qa:
-
-``do_recipe_qa``
-----------------
-
-Performs QA check on recipes that can operate entirely from recipe metadata and
-do not need any of the build artefacts or source code.
-
-The list of QA checks that this tasks defines are documented in
-:doc:`/ref-manual/qa-checks`.
-
-.. _ref-tasks-rm_work:
-
-``do_rm_work``
---------------
-
-Removes work files after the OpenEmbedded build system has finished with
-them. You can learn more by looking at the
-":ref:`ref-classes-rm-work`" section.
-
-.. _ref-tasks-unpack:
-
-``do_unpack``
--------------
-
-Unpacks the source code into a working directory pointed to by
-``${``\ :term:`UNPACKDIR`\ ``}``.
-For more information on how source files are unpacked, see the
-":ref:`overview-manual/concepts:source fetching`"
-section in the Yocto Project Overview and Concepts Manual.
+      Unpacks the source code into a working directory pointed to by
+      ``${``\ :term:`UNPACKDIR`\ ``}``.
+      For more information on how source files are unpacked, see the
+      ":ref:`overview-manual/concepts:source fetching`"
+      section in the Yocto Project Overview and Concepts Manual.
 
 Manually Called Tasks
 =====================
@@ -480,393 +405,326 @@ which defines that function as a task without building it into any
 task dependency chain, as well as setting the ``[nostamp]`` flag to
 ensure that it is run every time it is invoked.
 
-``do_checkuri``
----------------
-
-Validates the :term:`SRC_URI` value.
-
-.. _ref-tasks-clean:
-
-``do_clean``
-------------
-
-Removes all output files for a target from the
-:ref:`ref-tasks-unpack` task forward (i.e. :ref:`ref-tasks-unpack`,
-:ref:`ref-tasks-configure`,
-:ref:`ref-tasks-compile`,
-:ref:`ref-tasks-install`, and
-:ref:`ref-tasks-package`).
-
-You can run this task using BitBake as follows::
+.. glossary::
+   :sorted:
 
-   $ bitbake -c clean recipe
+   :term:`do_checkuri`
 
-Running this task does not remove the
-:ref:`sstate <overview-manual/concepts:shared state cache>` cache files.
-Consequently, if no changes have been made and the recipe is rebuilt
-after cleaning, output files are simply restored from the sstate cache.
-If you want to remove the sstate cache files for the recipe, you need to
-use the :ref:`ref-tasks-cleansstate` task instead
-(i.e. ``bitbake -c cleansstate`` recipe).
+      Validates the :term:`SRC_URI` value.
 
-.. _ref-tasks-cleanall:
+   :term:`do_clean`
 
-``do_cleanall``
----------------
+      Removes all output files for a target from the
+      :term:`do_unpack` task forward (i.e. :term:`do_unpack`,
+      :term:`do_configure`,
+      :term:`do_compile`,
+      :term:`do_install`, and
+      :term:`do_package`).
 
-Removes all output files, shared state
-(:ref:`sstate <overview-manual/concepts:shared state cache>`) cache, and
-downloaded source files for a target (i.e. the contents of
-:term:`DL_DIR`). Essentially, the :ref:`ref-tasks-cleanall` task is
-identical to the :ref:`ref-tasks-cleansstate` task
-with the added removal of downloaded source files.
+      You can run this task using BitBake as follows::
 
-You can run this task using BitBake as follows::
+         $ bitbake -c clean recipe
 
-   $ bitbake -c cleanall recipe
+      Running this task does not remove the
+      :ref:`sstate <overview-manual/concepts:shared state cache>` cache files.
+      Consequently, if no changes have been made and the recipe is rebuilt
+      after cleaning, output files are simply restored from the sstate cache.
+      If you want to remove the sstate cache files for the recipe, you need to
+      use the :term:`do_cleansstate` task instead
+      (i.e. ``bitbake -c cleansstate`` recipe).
 
-You should never use the :ref:`ref-tasks-cleanall` task in a normal
-scenario. If you want to start fresh with the :ref:`ref-tasks-fetch` task,
-use instead::
+   :term:`do_cleanall`
 
-  $ bitbake -f -c fetch recipe
+      Removes all output files, shared state
+      (:ref:`sstate <overview-manual/concepts:shared state cache>`) cache, and
+      downloaded source files for a target (i.e. the contents of
+      :term:`DL_DIR`). Essentially, the :term:`do_cleanall` task is
+      identical to the :term:`do_cleansstate` task
+      with the added removal of downloaded source files.
 
-.. note::
+      You can run this task using BitBake as follows::
 
-   The reason to prefer ``bitbake -f -c fetch`` is that the
-   :ref:`ref-tasks-cleanall` task would break in some cases, such as::
+         $ bitbake -c cleanall recipe
 
-      $ bitbake -c fetch    recipe
-      $ bitbake -c cleanall recipe-native
-      $ bitbake -c unpack   recipe
+      You should never use the :term:`do_cleanall` task in a normal
+      scenario. If you want to start fresh with the :term:`do_fetch` task,
+      use instead::
 
-   because after step 1 there is a stamp file for the
-   :ref:`ref-tasks-fetch` task of ``recipe``, and it won't be removed at
-   step 2 because step 2 uses a different work directory. So the unpack task
-   at step 3 will try to extract the downloaded archive and fail as it has
-   been deleted in step 2.
+        $ bitbake -f -c fetch recipe
 
-   Note that this also applies to BitBake from concurrent processes when a
-   shared download directory (:term:`DL_DIR`) is setup.
+      .. note::
 
-.. _ref-tasks-cleansstate:
+         The reason to prefer ``bitbake -f -c fetch`` is that the
+         :term:`do_cleanall` task would break in some cases, such as::
 
-``do_cleansstate``
-------------------
+            $ bitbake -c fetch    recipe
+            $ bitbake -c cleanall recipe-native
+            $ bitbake -c unpack   recipe
 
-Removes all output files and shared state
-(:ref:`sstate <overview-manual/concepts:shared state cache>`) cache for a
-target. Essentially, the :ref:`ref-tasks-cleansstate` task is identical to the
-:ref:`ref-tasks-clean` task with the added removal of
-shared state (:ref:`sstate <overview-manual/concepts:shared state cache>`)
-cache.
+         because after step 1 there is a stamp file for the
+         :term:`do_fetch` task of ``recipe``, and it won't be removed at
+         step 2 because step 2 uses a different work directory. So the unpack task
+         at step 3 will try to extract the downloaded archive and fail as it has
+         been deleted in step 2.
 
-You can run this task using BitBake as follows::
+         Note that this also applies to BitBake from concurrent processes when a
+         shared download directory (:term:`DL_DIR`) is setup.
 
-   $ bitbake -c cleansstate recipe
+   :term:`do_cleansstate`
 
-When you run the :ref:`ref-tasks-cleansstate` task, the OpenEmbedded build system
-no longer uses any sstate. Consequently, building the recipe from
-scratch is guaranteed.
+      Removes all output files and shared state
+      (:ref:`sstate <overview-manual/concepts:shared state cache>`) cache for a
+      target. Essentially, the :term:`do_cleansstate` task is identical to the
+      :term:`do_clean` task with the added removal of
+      shared state (:ref:`sstate <overview-manual/concepts:shared state cache>`)
+      cache.
 
-.. note::
+      You can run this task using BitBake as follows::
 
-   Using :ref:`ref-tasks-cleansstate` with a shared :term:`SSTATE_DIR` is
-   not recommended because it could trigger an error during the build of a
-   separate BitBake instance. This is because the builds check sstate "up
-   front" but download the files later, so it if is deleted in the
-   meantime, it will cause an error but not a total failure as it will
-   rebuild it.
+         $ bitbake -c cleansstate recipe
 
-   The reliable and preferred way to force a new build is to use ``bitbake
-   -f`` instead.
+      When you run the :term:`do_cleansstate` task, the OpenEmbedded build system
+      no longer uses any sstate. Consequently, building the recipe from
+      scratch is guaranteed.
 
-.. note::
+      .. note::
 
-   The :ref:`ref-tasks-cleansstate` task cannot remove sstate from a remote sstate
-   mirror. If you need to build a target from scratch using remote mirrors, use
-   the "-f" option as follows::
+         Using :term:`do_cleansstate` with a shared :term:`SSTATE_DIR` is
+         not recommended because it could trigger an error during the build of a
+         separate BitBake instance. This is because the builds check sstate "up
+         front" but download the files later, so it if is deleted in the
+         meantime, it will cause an error but not a total failure as it will
+         rebuild it.
 
-      $ bitbake -f -c do_cleansstate target
+         The reliable and preferred way to force a new build is to use ``bitbake
+         -f`` instead.
 
+      .. note::
 
-.. _ref-tasks-pydevshell:
+         The :term:`do_cleansstate` task cannot remove sstate from a remote sstate
+         mirror. If you need to build a target from scratch using remote mirrors, use
+         the "-f" option as follows::
 
-``do_pydevshell``
------------------
+            $ bitbake -f -c do_cleansstate target
 
-Starts a shell in which an interactive Python interpreter allows you to
-interact with the BitBake build environment. From within this shell, you
-can directly examine and set bits from the data store and execute
-functions as if within the BitBake environment. See the ":ref:`dev-manual/python-development-shell:using a Python development shell`" section in
-the Yocto Project Development Tasks Manual for more information about
-using ``pydevshell``.
 
-.. _ref-tasks-devshell:
+   :term:`do_pydevshell`
 
-``do_devshell``
----------------
+      Starts a shell in which an interactive Python interpreter allows you to
+      interact with the BitBake build environment. From within this shell, you
+      can directly examine and set bits from the data store and execute
+      functions as if within the BitBake environment. See the ":ref:`dev-manual/python-development-shell:using a Python development shell`" section in
+      the Yocto Project Development Tasks Manual for more information about
+      using ``pydevshell``.
 
-Starts a shell whose environment is set up for development, debugging,
-or both. See the ":ref:`dev-manual/development-shell:using a development shell`" section in the
-Yocto Project Development Tasks Manual for more information about using
-``devshell``.
+   :term:`do_devshell`
 
-.. _ref-tasks-list_image_features:
+      Starts a shell whose environment is set up for development, debugging,
+      or both. See the ":ref:`dev-manual/development-shell:using a development shell`" section in the
+      Yocto Project Development Tasks Manual for more information about using
+      ``devshell``.
 
-``do_list_image_features``
---------------------------
+   :term:`do_list_image_features`
 
-Lists the available features for an image recipe. These features can be set
-through either the :term:`IMAGE_FEATURES` or :term:`EXTRA_IMAGE_FEATURES` variables.
+      Lists the available features for an image recipe. These features can be set
+      through either the :term:`IMAGE_FEATURES` or :term:`EXTRA_IMAGE_FEATURES` variables.
 
-.. _ref-tasks-listtasks:
+   :term:`do_listtasks`
 
-``do_listtasks``
-----------------
+      Lists all defined tasks for a target.
 
-Lists all defined tasks for a target.
+   :term:`do_package_index`
 
-.. _ref-tasks-package_index:
+      Creates or updates the index in the :ref:`overview-manual/concepts:package feeds` area.
 
-``do_package_index``
---------------------
+      .. note::
 
-Creates or updates the index in the :ref:`overview-manual/concepts:package feeds` area.
-
-.. note::
-
-   This task is not triggered with the ``bitbake -c`` command-line option as
-   are the other tasks in this section. Because this task is specifically for
-   the ``package-index`` recipe, you run it using ``bitbake package-index``.
+         This task is not triggered with the ``bitbake -c`` command-line option as
+         are the other tasks in this section. Because this task is specifically for
+         the ``package-index`` recipe, you run it using ``bitbake package-index``.
 
 Image-Related Tasks
 ===================
 
 The following tasks are applicable to image recipes.
 
-.. _ref-tasks-bootimg:
-
-``do_bootimg``
---------------
-
-Creates a bootable live image. See the
-:term:`IMAGE_FSTYPES` variable for additional
-information on live image types.
-
-.. _ref-tasks-bundle_initramfs:
-
-``do_bundle_initramfs``
------------------------
+.. glossary::
+   :sorted:
 
-Combines an :term:`Initramfs` image and kernel together to
-form a single image.
+   :term:`do_bootimg`
 
-.. _ref-tasks-rootfs:
+      Creates a bootable live image. See the
+      :term:`IMAGE_FSTYPES` variable for additional
+      information on live image types.
 
-``do_rootfs``
--------------
+   :term:`do_bundle_initramfs`
 
-Creates the root filesystem (file and directory structure) for an image.
-See the ":ref:`overview-manual/concepts:image generation`"
-section in the Yocto Project Overview and Concepts Manual for more
-information on how the root filesystem is created.
+      Combines an :term:`Initramfs` image and kernel together to
+      form a single image.
 
-.. _ref-tasks-testimage:
+   :term:`do_rootfs`
 
-``do_testimage``
-----------------
+      Creates the root filesystem (file and directory structure) for an image.
+      See the ":ref:`overview-manual/concepts:image generation`"
+      section in the Yocto Project Overview and Concepts Manual for more
+      information on how the root filesystem is created.
 
-Boots an image and performs runtime tests within the image. For
-information on automatically testing images, see the
-":ref:`test-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Test Environment Manual.
+   :term:`do_testimage`
 
-.. _ref-tasks-testimage_auto:
+      Boots an image and performs runtime tests within the image. For
+      information on automatically testing images, see the
+      ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+      section in the Yocto Project Test Environment Manual.
 
-``do_testimage_auto``
----------------------
+   :term:`do_testimage_auto`
 
-Boots an image and performs runtime tests within the image immediately
-after it has been built. This task is enabled when you set
-:term:`TESTIMAGE_AUTO` equal to "1".
+      Boots an image and performs runtime tests within the image immediately
+      after it has been built. This task is enabled when you set
+      :term:`TESTIMAGE_AUTO` equal to "1".
 
-For information on automatically testing images, see the
-":ref:`test-manual/runtime-testing:performing automated runtime testing`"
-section in the Yocto Project Test Environment Manual.
+      For information on automatically testing images, see the
+      ":ref:`test-manual/runtime-testing:performing automated runtime testing`"
+      section in the Yocto Project Test Environment Manual.
 
 Kernel-Related Tasks
 ====================
 
 The following tasks are applicable to kernel recipes. Some of these
-tasks (e.g. the :ref:`ref-tasks-menuconfig` task) are
+tasks (e.g. the :term:`do_menuconfig` task) are
 also applicable to recipes that use Linux kernel style configuration
 such as the BusyBox recipe.
 
-.. _ref-tasks-compile_kernelmodules:
+.. glossary::
+   :sorted:
 
-``do_compile_kernelmodules``
-----------------------------
+   :term:`do_compile_kernelmodules`
 
-Runs the step that builds the kernel modules (if needed). Building a
-kernel consists of two steps: 1) the kernel (``vmlinux``) is built, and
-2) the modules are built (i.e. ``make modules``).
+      Runs the step that builds the kernel modules (if needed). Building a
+      kernel consists of two steps: 1) the kernel (``vmlinux``) is built, and
+      2) the modules are built (i.e. ``make modules``).
 
-.. _ref-tasks-diffconfig:
+   :term:`do_diffconfig`
 
-``do_diffconfig``
------------------
+      When invoked by the user, this task creates a file containing the
+      differences between the original config as produced by
+      :term:`do_kernel_configme` task and the
+      changes made by the user with other methods (i.e. using
+      (:term:`do_menuconfig`). Once the
+      file of differences is created, it can be used to create a config
+      fragment that only contains the differences. You can invoke this task
+      from the command line as follows::
 
-When invoked by the user, this task creates a file containing the
-differences between the original config as produced by
-:ref:`ref-tasks-kernel_configme` task and the
-changes made by the user with other methods (i.e. using
-(:ref:`ref-tasks-menuconfig`). Once the
-file of differences is created, it can be used to create a config
-fragment that only contains the differences. You can invoke this task
-from the command line as follows::
+         $ bitbake linux-yocto -c diffconfig
 
-   $ bitbake linux-yocto -c diffconfig
+      For more information, see the
+      ":ref:`kernel-dev/common:creating configuration fragments`"
+      section in the Yocto Project Linux Kernel Development Manual.
 
-For more information, see the
-":ref:`kernel-dev/common:creating configuration fragments`"
-section in the Yocto Project Linux Kernel Development Manual.
+   :term:`do_kernel_checkout`
 
-.. _ref-tasks-kernel_checkout:
+      Converts the newly unpacked kernel source into a form with which the
+      OpenEmbedded build system can work. Because the kernel source can be
+      fetched in several different ways, the :term:`do_kernel_checkout` task makes
+      sure that subsequent tasks are given a clean working tree copy of the
+      kernel with the correct branches checked out.
 
-``do_kernel_checkout``
-----------------------
+   :term:`do_kernel_configcheck`
 
-Converts the newly unpacked kernel source into a form with which the
-OpenEmbedded build system can work. Because the kernel source can be
-fetched in several different ways, the :ref:`ref-tasks-kernel_checkout` task makes
-sure that subsequent tasks are given a clean working tree copy of the
-kernel with the correct branches checked out.
+      Validates the configuration produced by the
+      :term:`do_menuconfig` task. The
+      :term:`do_kernel_configcheck` task produces warnings when a requested
+      configuration does not appear in the final ``.config`` file or when you
+      override a policy configuration in a hardware configuration fragment.
+      You can run this task explicitly and view the output by using the
+      following command::
 
-.. _ref-tasks-kernel_configcheck:
+         $ bitbake linux-yocto -c kernel_configcheck -f
 
-``do_kernel_configcheck``
--------------------------
+      For more information, see the
+      ":ref:`kernel-dev/common:validating configuration`"
+      section in the Yocto Project Linux Kernel Development Manual.
 
-Validates the configuration produced by the
-:ref:`ref-tasks-menuconfig` task. The
-:ref:`ref-tasks-kernel_configcheck` task produces warnings when a requested
-configuration does not appear in the final ``.config`` file or when you
-override a policy configuration in a hardware configuration fragment.
-You can run this task explicitly and view the output by using the
-following command::
+   :term:`do_kernel_configme`
 
-   $ bitbake linux-yocto -c kernel_configcheck -f
+      After the kernel is patched by the :term:`do_patch`
+      task, the :term:`do_kernel_configme` task assembles and merges all the
+      kernel config fragments into a merged configuration that can then be
+      passed to the kernel configuration phase proper. This is also the time
+      during which user-specified defconfigs are applied if present, and where
+      configuration modes such as ``--allnoconfig`` are applied.
 
-For more information, see the
-":ref:`kernel-dev/common:validating configuration`"
-section in the Yocto Project Linux Kernel Development Manual.
-
-.. _ref-tasks-kernel_configme:
-
-``do_kernel_configme``
-----------------------
-
-After the kernel is patched by the :ref:`ref-tasks-patch`
-task, the :ref:`ref-tasks-kernel_configme` task assembles and merges all the
-kernel config fragments into a merged configuration that can then be
-passed to the kernel configuration phase proper. This is also the time
-during which user-specified defconfigs are applied if present, and where
-configuration modes such as ``--allnoconfig`` are applied.
-
-.. _ref-tasks-kernel_metadata:
-
-``do_kernel_metadata``
-----------------------
-
-Collects all the features required for a given kernel build, whether the
-features come from :term:`SRC_URI` or from Git
-repositories. After collection, the :ref:`ref-tasks-kernel_metadata` task
-processes the features into a series of config fragments and patches,
-which can then be applied by subsequent tasks such as
-:ref:`ref-tasks-patch` and
-:ref:`ref-tasks-kernel_configme`.
-
-.. _ref-tasks-menuconfig:
-
-``do_menuconfig``
------------------
-
-Invoked by the user to manipulate the ``.config`` file used to build a
-linux-yocto recipe. This task starts the Linux kernel configuration
-tool, which you then use to modify the kernel configuration.
-
-You can invoke this tool from the command line as follows:
-
-.. code-block:: console
+   :term:`do_kernel_metadata`
 
-   $ bitbake linux-yocto -c menuconfig
+      Collects all the features required for a given kernel build, whether the
+      features come from :term:`SRC_URI` or from Git
+      repositories. After collection, the :term:`do_kernel_metadata` task
+      processes the features into a series of config fragments and patches,
+      which can then be applied by subsequent tasks such as
+      :term:`do_patch` and
+      :term:`do_kernel_configme`.
 
-See the ":ref:`kernel-dev/common:using ``menuconfig```"
-section in the Yocto Project Linux Kernel Development Manual for more
-information on this configuration tool.
+   :term:`do_menuconfig`
 
-.. _ref-tasks-savedefconfig:
+      Invoked by the user to manipulate the ``.config`` file used to build a
+      linux-yocto recipe. This task starts the Linux kernel configuration
+      tool, which you then use to modify the kernel configuration.
 
-``do_savedefconfig``
---------------------
+      You can invoke this tool from the command line as follows:
 
-When invoked by the user, creates a defconfig file that can be used
-instead of the default defconfig. The saved defconfig contains the
-differences between the default defconfig and the changes made by the
-user using other methods (i.e. the
-:ref:`ref-tasks-menuconfig` task. You
-can invoke the task using the following command::
+      .. code-block:: console
 
-   $ bitbake linux-yocto -c savedefconfig
+         $ bitbake linux-yocto -c menuconfig
 
-.. _ref-tasks-shared_workdir:
+      See the ":ref:`kernel-dev/common:using ``menuconfig```"
+      section in the Yocto Project Linux Kernel Development Manual for more
+      information on this configuration tool.
 
-``do_shared_workdir``
----------------------
+   :term:`do_savedefconfig`
 
-After the kernel has been compiled but before the kernel modules have
-been compiled, this task copies files required for module builds and
-which are generated from the kernel build into the shared work
-directory. With these copies successfully copied, the
-:ref:`ref-tasks-compile_kernelmodules` task
-can successfully build the kernel modules in the next step of the build.
+      When invoked by the user, creates a defconfig file that can be used
+      instead of the default defconfig. The saved defconfig contains the
+      differences between the default defconfig and the changes made by the
+      user using other methods (i.e. the
+      :term:`do_menuconfig` task. You
+      can invoke the task using the following command::
 
-.. _ref-tasks-sizecheck:
+         $ bitbake linux-yocto -c savedefconfig
 
-``do_sizecheck``
-----------------
+   :term:`do_shared_workdir`
 
-If the variable :term:`KERNEL_IMAGE_MAXSIZE` is set, this task compares
-the size of all stripped kernel images listed in :term:`KERNEL_IMAGETYPES`
-against that value. If more than one image type is listed there, warn on
-any that exceed that value, but fail only if none of them fit.
+      After the kernel has been compiled but before the kernel modules have
+      been compiled, this task copies files required for module builds and
+      which are generated from the kernel build into the shared work
+      directory. With these copies successfully copied, the
+      :term:`do_compile_kernelmodules` task
+      can successfully build the kernel modules in the next step of the build.
 
-.. _ref-tasks-strip:
+   :term:`do_sizecheck`
 
-``do_strip``
-------------
+      If the variable :term:`KERNEL_IMAGE_MAXSIZE` is set, this task compares
+      the size of all stripped kernel images listed in :term:`KERNEL_IMAGETYPES`
+      against that value. If more than one image type is listed there, warn on
+      any that exceed that value, but fail only if none of them fit.
 
-If :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS` is defined, this task strips
-the sections named in that variable from ``vmlinux``. This stripping is
-typically used to remove nonessential sections such as ``.comment``
-sections from a size-sensitive configuration.
+   :term:`do_strip`
 
-Common sections to strip:
+      If :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS` is defined, this task strips
+      the sections named in that variable from ``vmlinux``. This stripping is
+      typically used to remove nonessential sections such as ``.comment``
+      sections from a size-sensitive configuration.
 
--  ``.comment``: Holds compiler version strings and information
+      Common sections to strip:
 
--  ``.note.*``: Extra notes often left by the compiler
+      -  ``.comment``: Holds compiler version strings and information
 
--  ``.debug``: Debugging information
+      -  ``.note.*``: Extra notes often left by the compiler
 
-.. _ref-tasks-validate_branches:
+      -  ``.debug``: Debugging information
 
-``do_validate_branches``
-------------------------
+   :term:`do_validate_branches`
 
-After the kernel is unpacked but before it is patched, this task makes
-sure that the machine and metadata branches as specified by the
-:term:`SRCREV` variables actually exist on the specified
-branches. Otherwise, if :term:`AUTOREV` is not being used, the
-:ref:`ref-tasks-validate_branches` task fails during the build.
+      After the kernel is unpacked but before it is patched, this task makes
+      sure that the machine and metadata branches as specified by the
+      :term:`SRCREV` variables actually exist on the specified
+      branches. Otherwise, if :term:`AUTOREV` is not being used, the
+      :term:`do_validate_branches` task fails during the build.
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index cbe7c88e6..0a58a01fd 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -605,9 +605,9 @@ universal, the list includes them just in case:
 
    :term:`Task`
       A per-recipe unit of execution for BitBake (e.g.
-      :ref:`ref-tasks-compile`,
-      :ref:`ref-tasks-fetch`,
-      :ref:`ref-tasks-patch`, and so forth).
+      :term:`do_compile`,
+      :term:`do_fetch`,
+      :term:`do_patch`, and so forth).
       One of the major benefits of the build system is that, since each
       recipe will typically spawn the execution of numerous tasks,
       it is entirely possible that many tasks can execute in parallel,
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 394797ca3..d73790337 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -125,7 +125,7 @@ system and gives an overview of their function and contents.
 
          Finally, if the file referenced has not been renamed, the
          alternatives system will rename it to avoid the need to rename
-         alternative files in the :ref:`ref-tasks-install`
+         alternative files in the :term:`do_install`
          task while retaining support for the command if necessary.
 
       For more information on the alternatives system, see the
@@ -1607,7 +1607,7 @@ system and gives an overview of their function and contents.
       If set to "1" within a recipe, :term:`CLEANBROKEN` specifies that the
       ``make clean`` command does not work for the software being built.
       Consequently, the OpenEmbedded build system will not try to run
-      ``make clean`` during the :ref:`ref-tasks-configure`
+      ``make clean`` during the :term:`do_configure`
       task, which is the default behavior.
 
    :term:`COMBINED_FEATURES`
@@ -2137,7 +2137,7 @@ system and gives an overview of their function and contents.
    :term:`D`
       The destination directory. The location in the :term:`Build Directory`
       where components are installed by the
-      :ref:`ref-tasks-install` task. This location defaults
+      :term:`do_install` task. This location defaults
       to::
 
          ${WORKDIR}/image
@@ -2246,9 +2246,9 @@ system and gives an overview of their function and contents.
       The practical effect of the previous assignment is that all files
       installed by bar will be available in the appropriate staging sysroot,
       given by the :term:`STAGING_DIR* <STAGING_DIR_HOST>` variables, by the time
-      the :ref:`ref-tasks-configure` task for ``foo`` runs. This mechanism is
-      implemented by having :ref:`ref-tasks-configure` depend on the
-      :ref:`ref-tasks-populate_sysroot` task of each recipe listed in
+      the :term:`do_configure` task for ``foo`` runs. This mechanism is
+      implemented by having :term:`do_configure` depend on the
+      :term:`do_populate_sysroot` task of each recipe listed in
       :term:`DEPENDS`, through a
       ``[``\ :ref:`deptask <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
       declaration in the :ref:`ref-classes-base` class.
@@ -2337,7 +2337,7 @@ system and gives an overview of their function and contents.
 
       The :ref:`ref-classes-package_deb` class uses the
       :term:`DEPLOY_DIR_DEB` variable to make sure the
-      :ref:`ref-tasks-package_write_deb` task
+      :term:`do_package_write_deb` task
       writes Debian packages into the appropriate folder. For more
       information on how packaging works, see the
       ":ref:`overview-manual/concepts:package feeds`" section
@@ -2376,7 +2376,7 @@ system and gives an overview of their function and contents.
          DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 
       The :ref:`ref-classes-package_ipk` class uses the :term:`DEPLOY_DIR_IPK`
-      variable to make sure the :ref:`ref-tasks-package_write_ipk` task
+      variable to make sure the :term:`do_package_write_ipk` task
       writes IPK packages into the appropriate folder. For more information
       on how packaging works, see the
       ":ref:`overview-manual/concepts:package feeds`" section
@@ -2395,7 +2395,7 @@ system and gives an overview of their function and contents.
 
       The :ref:`ref-classes-package_rpm` class uses the
       :term:`DEPLOY_DIR_RPM` variable to make sure the
-      :ref:`ref-tasks-package_write_rpm` task
+      :term:`do_package_write_rpm` task
       writes RPM packages into the appropriate folder. For more information
       on how packaging works, see the
       ":ref:`overview-manual/concepts:package feeds`" section
@@ -2494,7 +2494,7 @@ system and gives an overview of their function and contents.
       In most cases, the presence or absence of a feature in
       :term:`DISTRO_FEATURES` is translated to the appropriate option supplied
       to the configure script during the
-      :ref:`ref-tasks-configure` task for recipes that
+      :term:`do_configure` task for recipes that
       optionally support the feature. For example, specifying "x11" in
       :term:`DISTRO_FEATURES`, causes every piece of software built for the
       target that can optionally support X11 to have its X11 support
@@ -2792,7 +2792,7 @@ system and gives an overview of their function and contents.
 
          The shared libraries resolver's functionality results in part from
          the internal function ``package_do_shlibs``, which is part of the
-         :ref:`ref-tasks-package` task. You should be aware that the shared
+         :term:`do_package` task. You should be aware that the shared
          libraries resolver might implicitly define some dependencies between
          packages.
 
@@ -2894,7 +2894,7 @@ system and gives an overview of their function and contents.
       For recipes inheriting the :ref:`ref-classes-autotools`
       class, you can use :term:`EXTRA_AUTORECONF` to specify extra options to
       pass to the ``autoreconf`` command that is executed during the
-      :ref:`ref-tasks-configure` task.
+      :term:`do_configure` task.
 
       The default value is "--exclude=autopoint".
 
@@ -3327,7 +3327,7 @@ system and gives an overview of their function and contents.
       in the Yocto Project Overview and Concepts Manual and the
       ":ref:`dev-manual/new-recipe:patching code`" section in
       the Yocto Project Development Tasks Manual. See the
-      :ref:`ref-tasks-patch` task as well.
+      :term:`do_patch` task as well.
 
    :term:`FILESYSTEM_PERMS_TABLES`
       Allows you to define your own file permissions settings tables as part
@@ -4607,7 +4607,7 @@ system and gives an overview of their function and contents.
 
    :term:`IMAGE_ROOTFS`
       The location of the root filesystem while it is under construction
-      (i.e. during the :ref:`ref-tasks-rootfs` task). This
+      (i.e. during the :term:`do_rootfs` task). This
       variable is not configurable. Do not change it.
 
    :term:`IMAGE_ROOTFS_ALIGNMENT`
@@ -4898,7 +4898,7 @@ system and gives an overview of their function and contents.
       Prevents the OpenEmbedded build system from splitting out debug
       information during packaging. By default, the build system splits out
       debugging information during the
-      :ref:`ref-tasks-package` task. For more information on
+      :term:`do_package` task. For more information on
       how debug information is split out, see the
       :term:`PACKAGE_DEBUG_SPLIT_STYLE`
       variable.
@@ -4987,7 +4987,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
-      Indicates the deploy directory used by :ref:`ref-tasks-bundle_initramfs`
+      Indicates the deploy directory used by :term:`do_bundle_initramfs`
       where the :term:`INITRAMFS_IMAGE` will be fetched from. This variable is
       set by default to ``${DEPLOY_DIR_IMAGE}`` in the
       :ref:`ref-classes-kernel` class and it's only meant to be changed when
@@ -5049,7 +5049,7 @@ system and gives an overview of their function and contents.
       Controls whether or not the image recipe specified by
       :term:`INITRAMFS_IMAGE` is run through an
       extra pass
-      (:ref:`ref-tasks-bundle_initramfs`) during
+      (:term:`do_bundle_initramfs`) during
       kernel compilation in order to build a single binary that contains
       both the kernel image and the initial RAM filesystem (:term:`Initramfs`)
       image. This makes use of the
@@ -5319,7 +5319,7 @@ system and gives an overview of their function and contents.
       -  1: report the problems as warnings and trigger an error if
          :term:`KMETA_AUDIT_WERROR` is set.
 
-      -  2: if the :ref:`ref-tasks-kernel_configme` has failed to generate a
+      -  2: if the :term:`do_kernel_configme` has failed to generate a
          ``.config`` file, print the content of the ``merge_config_build.log``
          file containing the errors, instead of just providing the path to
          that file.
@@ -5390,7 +5390,7 @@ system and gives an overview of their function and contents.
 
       A ``defconfig`` file compatible with ``alldefconfig`` mode can be
       generated using the
-      :ref:`ref-tasks-savedefconfig`
+      :term:`do_savedefconfig`
       task and placed into the Linux kernel ``${WORKDIR}`` through your
       meta-layer. Explicitely set :term:`KCONFIG_MODE`::
 
@@ -5606,7 +5606,7 @@ system and gives an overview of their function and contents.
       Specifies the maximum allowable size of the kernel image file in kibibytes.
       If this variable is set, the sizes of all of the kernel image files listed
       in :term:`KERNEL_IMAGETYPES` are checked against this value during the
-      :ref:`ref-tasks-sizecheck` task. That task will warn about any of the
+      :term:`do_sizecheck` task. That task will warn about any of the
       kernel images that exceed the maximum, and will fail only if all images
       are too large.
 
@@ -5627,7 +5627,7 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`
       If this variable is set, it should contain the sections to be
       stripped from the ``vmlinux`` image by the kernel-related
-      :ref:`ref-tasks-strip` task. As a simple example::
+      :term:`do_strip` task. As a simple example::
 
          KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .note.* .debug"
 
@@ -6367,7 +6367,7 @@ system and gives an overview of their function and contents.
 
    :term:`MESON_TARGET`
       A variable for the :ref:`ref-classes-meson` class, allowing to choose
-      a Meson target to build in :ref:`ref-tasks-compile`.  Otherwise, the
+      a Meson target to build in :term:`do_compile`.  Otherwise, the
       default targets are built.
 
    :term:`METADATA_BRANCH`
@@ -7310,7 +7310,7 @@ system and gives an overview of their function and contents.
       use :term:`PACKAGECONFIG_CONFARGS` to pass :term:`PACKAGECONFIG` options
       to ``configure`` and ``cmake``, respectively. If you are using
       :term:`PACKAGECONFIG` but not a class that handles the
-      :ref:`ref-tasks-configure` task, then you need to use
+      :term:`do_configure` task, then you need to use
       :term:`PACKAGECONFIG_CONFARGS` appropriately.
 
    :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY`
@@ -7326,7 +7326,7 @@ system and gives an overview of their function and contents.
 
          ${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}
 
-      During packaging, the :ref:`ref-tasks-package` task
+      During packaging, the :term:`do_package` task
       goes through :term:`PACKAGES` and uses the :term:`FILES`
       variable corresponding to each package to assign files to the
       package. If a file matches the :term:`FILES` variable for more than one
@@ -7335,7 +7335,7 @@ system and gives an overview of their function and contents.
 
       Packages in the variable's list that are empty (i.e. where none of
       the patterns in ``FILES:``\ pkg match any files installed by the
-      :ref:`ref-tasks-install` task) are not generated,
+      :term:`do_install` task) are not generated,
       unless generation is forced through the
       :term:`ALLOW_EMPTY` variable.
 
@@ -7350,7 +7350,7 @@ system and gives an overview of their function and contents.
       produced, then the other package will be broken. Thus, if you attempt
       to include that package in an image, you will get a dependency
       failure from the packaging system during the
-      :ref:`ref-tasks-rootfs` task.
+      :term:`do_rootfs` task.
 
       Typically, if there is a chance that such a situation can occur and
       the package that is not created is valid without the dependency being
@@ -7376,7 +7376,7 @@ system and gives an overview of their function and contents.
 
       Extra options passed to the build tool command (``make``,
       ``ninja`` or more specific build engines, like the Go language one)
-      during the :ref:`ref-tasks-compile` task, to specify parallel compilation
+      during the :term:`do_compile` task, to specify parallel compilation
       on the local build host. This variable is usually in the form "-j x",
       where x represents the maximum number of parallel threads such engines
       can run.
@@ -7394,7 +7394,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          If the software being built experiences dependency issues during
-         the :ref:`ref-tasks-compile` task that result in race conditions, you can clear
+         the :term:`do_compile` task that result in race conditions, you can clear
          the :term:`PARALLEL_MAKE` variable within the recipe as a workaround. For
          information on addressing race conditions, see the
          ":ref:`dev-manual/debugging:debugging parallel make races`"
@@ -7417,7 +7417,7 @@ system and gives an overview of their function and contents.
    :term:`PARALLEL_MAKEINST`
       Extra options passed to the build tool install command
       (``make install``, ``ninja install`` or more specific ones)
-      during the :ref:`ref-tasks-install` task in order to specify
+      during the :term:`do_install` task in order to specify
       parallel installation. This variable defaults to the value of
       :term:`PARALLEL_MAKE`.
 
@@ -7429,7 +7429,7 @@ system and gives an overview of their function and contents.
          way to ensure this is to use the ``oe_runmake`` function.
 
          If the software being built experiences dependency issues during
-         the :ref:`ref-tasks-install` task that result in race conditions, you can
+         the :term:`do_install` task that result in race conditions, you can
          clear the :term:`PARALLEL_MAKEINST` variable within the recipe as a
          workaround. For information on addressing race conditions, see the
          ":ref:`dev-manual/debugging:debugging parallel make races`"
@@ -7449,7 +7449,7 @@ system and gives an overview of their function and contents.
 
    :term:`PATCHTOOL`
       Specifies the utility used to apply patches for a recipe during the
-      :ref:`ref-tasks-patch` task. You can specify one of
+      :term:`do_patch` task. You can specify one of
       three utilities: "patch", "quilt", or "git". The default utility used
       is "quilt" except for the quilt-native recipe itself. Because the
       quilt tool is not available at the time quilt-native is being
@@ -7519,7 +7519,7 @@ system and gives an overview of their function and contents.
    :term:`PKGDATA_DIR`
       Points to a shared, global-state directory that holds data generated
       during the packaging process. During the packaging process, the
-      :ref:`ref-tasks-packagedata` task packages data
+      :term:`do_packagedata` task packages data
       for each recipe and installs it into this shared area.
       This directory defaults to the following, which you should not
       change::
@@ -7545,14 +7545,14 @@ system and gives an overview of their function and contents.
 
    :term:`PKGDESTWORK`
       Points to a temporary work area where the
-      :ref:`ref-tasks-package` task saves package metadata.
+      :term:`do_package` task saves package metadata.
       The :term:`PKGDESTWORK` location defaults to the following::
 
          ${WORKDIR}/pkgdata
 
       Do not change this default.
 
-      The :ref:`ref-tasks-packagedata` task copies the
+      The :term:`do_packagedata` task copies the
       package metadata from :term:`PKGDESTWORK` to
       :term:`PKGDATA_DIR` to make it available globally.
 
@@ -8262,7 +8262,7 @@ system and gives an overview of their function and contents.
       The practical effect of the above :term:`RDEPENDS` assignment is that
       ``bar`` and ``baz`` will be declared as dependencies inside the
       package ``foo`` when it is written out by one of the
-      :ref:`do_package_write_* <ref-tasks-package_write_deb>` tasks.
+      :term:`do_package_write_* <do_package_write_deb>` tasks.
       Exactly how this is done depends on which package format is used,
       which is determined by
       :term:`PACKAGE_CLASSES`. When the
@@ -8272,9 +8272,9 @@ system and gives an overview of their function and contents.
       To ensure that the packages ``bar`` and ``baz`` get built, the
       previous :term:`RDEPENDS` assignment also causes a task dependency to be
       added. This dependency is from the recipe's
-      :ref:`ref-tasks-build` (not to be confused with
-      :ref:`ref-tasks-compile`) task to the
-      :ref:`do_package_write_* <ref-tasks-package_write_deb>` task of the recipes that build ``bar`` and
+      :term:`do_build` (not to be confused with
+      :term:`do_compile`) task to the
+      :term:`do_package_write_* <do_package_write_deb>` task of the recipes that build ``bar`` and
       ``baz``.
 
       The names of the packages you list within :term:`RDEPENDS` must be the
@@ -9004,10 +9004,10 @@ system and gives an overview of their function and contents.
       A list of shared state tasks added to the extensible SDK. By default,
       the following tasks are added:
 
-      - :ref:`ref-tasks-populate_lic`
-      - :ref:`ref-tasks-package_qa`
-      - :ref:`ref-tasks-populate_sysroot`
-      - :ref:`ref-tasks-deploy`
+      - :term:`do_populate_lic`
+      - :term:`do_package_qa`
+      - :term:`do_populate_sysroot`
+      - :term:`do_deploy`
 
       Despite the default value of "" for the
       :term:`SDK_RECRDEP_TASKS` variable, the above four tasks are always added
@@ -10302,7 +10302,7 @@ system and gives an overview of their function and contents.
       Used for constructing directory trees used during staging.
 
       For information on how staging for recipe-specific sysroots occurs,
-      see the :ref:`ref-tasks-populate_sysroot`
+      see the :term:`do_populate_sysroot`
       task, the ":ref:`dev-manual/devtool:sharing files between recipes`"
       section in the Yocto Project Development Tasks Manual, the
       ":ref:`overview-manual/concepts:configuration, compilation, and staging`"
@@ -10314,7 +10314,7 @@ system and gives an overview of their function and contents.
          Recipes should never write files directly under the :term:`STAGING_DIR`
          directory because the OpenEmbedded build system manages the
          directory automatically. Instead, files should be installed to
-         ``${``\ :term:`D`\ ``}`` within your recipe's :ref:`ref-tasks-install`
+         ``${``\ :term:`D`\ ``}`` within your recipe's :term:`do_install`
          task and then the OpenEmbedded build system will stage a subset of
          those files into the sysroot.
 
@@ -10323,9 +10323,9 @@ system and gives an overview of their function and contents.
       for the system on which the component is built to run
       (the system that hosts the component).
       For most recipes, this sysroot is populated by their
-      :ref:`ref-tasks-populate_sysroot` task (when sharing files
+      :term:`do_populate_sysroot` task (when sharing files
       between recipes). Exceptions include native recipes, for which the files from
-      :ref:`ref-tasks-populate_sysroot` task are instead copied to
+      :term:`do_populate_sysroot` task are instead copied to
       :term:`STAGING_DIR_NATIVE`. Depending on the type of recipe and the build target,
       :term:`STAGING_DIR_HOST` can have the following values:
 
@@ -10349,9 +10349,9 @@ system and gives an overview of their function and contents.
 
             Thus, the emphasis is that the ``STAGING_DIR*`` variables
             should be viewed as input variables by tasks such as
-            :ref:`ref-tasks-configure`,
-            :ref:`ref-tasks-compile`, and
-            :ref:`ref-tasks-install`. Having the real system root
+            :term:`do_configure`,
+            :term:`do_compile`, and
+            :term:`do_install`. Having the real system root
             (the :term:`build host`'s root) play the role of :term:`STAGING_DIR_HOST`
             makes conceptual sense for native recipes, as they make use
             of the :term:`build host`'s headers and libraries.
@@ -10513,11 +10513,11 @@ system and gives an overview of their function and contents.
       Points to the temporary directory under the work directory (default
       "``${``\ :term:`WORKDIR`\ ``}/sysroot-destdir``")
       where the files populated into the sysroot are assembled during the
-      :ref:`ref-tasks-populate_sysroot` task.
+      :term:`do_populate_sysroot` task.
 
    :term:`SYSROOT_DIRS`
       Directories that are staged into the sysroot by the
-      :ref:`ref-tasks-populate_sysroot` task. By
+      :term:`do_populate_sysroot` task. By
       default, the following directories are staged::
 
          SYSROOT_DIRS = " \
@@ -10560,7 +10560,7 @@ system and gives an overview of their function and contents.
 
    :term:`SYSROOT_DIRS_IGNORE`
       Directories that are not staged into the sysroot by the
-      :ref:`ref-tasks-populate_sysroot` task. You
+      :term:`do_populate_sysroot` task. You
       can use this variable to exclude certain subdirectories of
       directories listed in :term:`SYSROOT_DIRS` from
       staging. By default, the following directories are not staged::
@@ -10583,7 +10583,7 @@ system and gives an overview of their function and contents.
 
    :term:`SYSROOT_DIRS_NATIVE`
       Extra directories staged into the sysroot by the
-      :ref:`ref-tasks-populate_sysroot` task for
+      :term:`do_populate_sysroot` task for
       ``-native`` recipes, in addition to those specified in
       :term:`SYSROOT_DIRS`. By default, the following
       extra directories are staged::
@@ -12099,7 +12099,7 @@ system and gives an overview of their function and contents.
    :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
-      :ref:`ref-tasks-configure` task. Normally, invalid
+      :term:`do_configure` task. Normally, invalid
       configure options are simply not passed to the configure script (e.g.
       should be removed from :term:`EXTRA_OECONF` or
       :term:`PACKAGECONFIG_CONFARGS`).
@@ -12116,7 +12116,7 @@ system and gives an overview of their function and contents.
    :term:`UNPACKDIR`
       This variable, used by the :ref:`ref-classes-base` class,
       specifies where fetched sources should be unpacked by the
-      :ref:`ref-tasks-unpack` task.
+      :term:`do_unpack` task.
 
    :term:`UPDATERCPN`
       For recipes inheriting the
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 0868abe8c..d89dbbb5e 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -129,7 +129,7 @@ the following types of tests:
       $ bitbake image -c testimage
 
    The tests use the :ref:`ref-classes-testimage`
-   class and the :ref:`ref-tasks-testimage` task. See the
+   class and the :term:`do_testimage` task. See the
    :ref:`test-manual/runtime-testing:Performing Automated Runtime Testing`
    section of the Yocto Project Test Environment Manual for more information.
 
diff --git a/documentation/test-manual/runtime-testing.rst b/documentation/test-manual/runtime-testing.rst
index a64a97c80..fab67096d 100644
--- a/documentation/test-manual/runtime-testing.rst
+++ b/documentation/test-manual/runtime-testing.rst
@@ -481,7 +481,7 @@ Class methods are as follows:
 
 -  *hasPackage(pkg):* Returns "True" if ``pkg`` is in the installed
    package list of the image, which is based on the manifest file that
-   is generated during the :ref:`ref-tasks-rootfs` task.
+   is generated during the :term:`do_rootfs` task.
 
 -  *hasFeature(feature):* Returns "True" if the feature is in
    :term:`IMAGE_FEATURES` or

-- 
2.54.0


