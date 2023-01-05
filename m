Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150ADC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 08:22:50 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.8416.1672906959075314008
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 00:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gEosCqi6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96636E000A;
	Thu,  5 Jan 2023 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672906957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmd6tiKNPqcefY7vCl2tTpmWGgKNoiFmp8tHmV+Zi8w=;
	b=gEosCqi6YbfgdfkBlPlz8yJlB0oJGMZeiytugq/ICZKtRuNkTF0cvhWivlnZYVSf4isUaZ
	UPcosodYF9Ofsg3zHVaSdG2BRUhRIaRNeBsLcjonTmq5qWBbb/Wy03ZHppOOsbsG5Dqyg3
	WSLPFieD6CRvTFKSwliyGZD9uhnSUUwv5H2c2ZkDiADrddBDCL03QW7Qr04MjYqPUoq0oj
	pBeatntWpKD6rTNnkoQRTh7PweToidRnIukOcMHKe00vw6ML8HPuppp9HaxOs1o35/Hj4b
	oe1UxK9KWk+X7i0C+OE++2R8h5vAb169krYAFEtNjoZKipokapaEP2oGdTGfBg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] manuals: simplify references to classes
Date: Thu,  5 Jan 2023 09:22:23 +0100
Message-Id: <20230105082223.44090-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230105082223.44090-1-michael.opdenacker@bootlin.com>
References: <20230105082223.44090-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 08:22:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3581

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now that .bbclass is removed from class section titles.
We can now have, for example, :ref:`ref-classes-insane`
instead of :ref:`insane <ref-classes-insane>`.

Then, when necessary, rework paragraphs so that they
have even lines of even length, not exceeding 80 characters.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Quentin Schulz <foss+yocto@0leil.net>
---
 documentation/bsp-guide/bsp.rst               |   2 +-
 documentation/dev-manual/build-quality.rst    |  12 +-
 documentation/dev-manual/building.rst         |  15 +-
 documentation/dev-manual/debugging.rst        |   8 +-
 documentation/dev-manual/disk-space.rst       |   3 +-
 .../dev-manual/error-reporting-tool.rst       |   6 +-
 .../dev-manual/gobject-introspection.rst      |   4 +-
 documentation/dev-manual/licenses.rst         |  19 +-
 documentation/dev-manual/new-recipe.rst       |  85 +--
 documentation/dev-manual/packages.rst         |  16 +-
 documentation/dev-manual/quilt.rst            |   4 +-
 documentation/dev-manual/read-only-rootfs.rst |   2 +-
 documentation/dev-manual/runtime-testing.rst  |   4 +-
 documentation/dev-manual/sbom.rst             |   4 +-
 documentation/dev-manual/securing-images.rst  |   8 +-
 .../dev-manual/speeding-up-build.rst          |   3 +-
 .../dev-manual/upgrading-recipes.rst          |   3 +-
 documentation/dev-manual/vulnerabilities.rst  |  10 +-
 documentation/dev-manual/wic.rst              |   3 +-
 documentation/kernel-dev/common.rst           |  10 +-
 .../migration-guides/migration-1.3.rst        |  12 +-
 .../migration-guides/migration-1.5.rst        |   9 +-
 .../migration-guides/migration-1.6.rst        |  13 +-
 .../migration-guides/migration-1.7.rst        |  13 +-
 .../migration-guides/migration-1.8.rst        |  28 +-
 .../migration-guides/migration-2.0.rst        |   2 +-
 .../migration-guides/migration-2.1.rst        |  32 +-
 .../migration-guides/migration-2.3.rst        |  22 +-
 .../migration-guides/migration-2.4.rst        |  12 +-
 .../migration-guides/migration-2.5.rst        |  10 +-
 .../migration-guides/migration-2.6.rst        |  18 +-
 .../migration-guides/migration-2.7.rst        |   3 +-
 .../migration-guides/migration-3.0.rst        |   6 +-
 .../migration-guides/migration-3.1.rst        |   6 +-
 .../migration-guides/migration-3.2.rst        |  33 +-
 .../migration-guides/migration-3.3.rst        |  17 +-
 .../migration-guides/migration-3.4.rst        |   4 +-
 .../migration-guides/migration-4.0.rst        |  21 +-
 .../migration-guides/migration-4.1.rst        |  10 +-
 .../migration-guides/migration-general.rst    |  14 +-
 .../migration-guides/release-notes-3.4.rst    |   4 +-
 .../migration-guides/release-notes-4.0.rst    |  11 +-
 .../migration-guides/release-notes-4.1.rst    |  30 +-
 documentation/overview-manual/concepts.rst    |  58 +-
 documentation/ref-manual/classes.rst          | 611 ++++++++--------
 documentation/ref-manual/features.rst         |   2 +-
 documentation/ref-manual/qa-checks.rst        |  12 +-
 documentation/ref-manual/structure.rst        |   4 +-
 documentation/ref-manual/tasks.rst            |  10 +-
 documentation/ref-manual/variables.rst        | 690 ++++++++----------
 .../sdk-manual/appendix-customizing.rst       |   3 +-
 documentation/sdk-manual/extensible.rst       |   5 +-
 documentation/test-manual/intro.rst           |  18 +-
 .../test-manual/understand-autobuilder.rst    |   2 +-
 54 files changed, 930 insertions(+), 1036 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 23c70b5a30..fccf059ccc 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1365,7 +1365,7 @@ Project Reference Manual.
 
 -  :term:`IMAGE_INSTALL`:
    Specifies packages to install into an image through the
-   :ref:`image <ref-classes-image>` class. Recipes
+   :ref:`ref-classes-image` class. Recipes
    use the :term:`IMAGE_INSTALL` variable.
 
 -  ``do_image_wic[depends]``: A task that is constructed during the
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index 03eee12bef..713ea3a48e 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -14,13 +14,11 @@ has already been built when the software is building, the software will
 link to the built library and that library will be pulled into your
 image along with the new software even if you did not want the library.
 
-The :ref:`buildhistory <ref-classes-buildhistory>`
-class helps you maintain the quality of your build output. You
-can use the class to highlight unexpected and possibly unwanted changes
-in the build output. When you enable build history, it records
-information about the contents of each package and image and then
-commits that information to a local Git repository where you can examine
-the information.
+The :ref:`ref-classes-buildhistory` class helps you maintain the quality of
+your build output. You can use the class to highlight unexpected and possibly
+unwanted changes in the build output. When you enable build history, it records
+information about the contents of each package and image and then commits that
+information to a local Git repository where you can examine the information.
 
 The remainder of this section describes the following:
 
diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
index 3064974cc5..1f1642e846 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -295,8 +295,8 @@ Follow these steps to create an :term:`Initramfs` image:
    recipe, you should use :term:`PACKAGE_INSTALL` rather than
    :term:`IMAGE_INSTALL`. :term:`PACKAGE_INSTALL` gives more direct control of
    what is added to the image as compared to the defaults you might not
-   necessarily want that are set by the :ref:`image <ref-classes-image>`
-   or :ref:`core-image <ref-classes-core-image>` classes.
+   necessarily want that are set by the :ref:`ref-classes-image`
+   or :ref:`ref-classes-core-image` classes.
 
 #. *Build the Kernel Image and the Initramfs Image:* Build your kernel
    image using BitBake. Because the :term:`Initramfs` image recipe is a
@@ -683,7 +683,7 @@ your tunings to best consider build times and package feed maintenance.
    A recipe that just generates scripts can enable "all" architecture
    because there are no binaries to build. To specifically enable "all"
    architecture, be sure your recipe inherits the
-   :ref:`allarch <ref-classes-allarch>` class.
+   :ref:`ref-classes-allarch` class.
    This class is useful for "all" architectures because it configures
    many variables so packages can be used across multiple architectures.
 
@@ -796,7 +796,7 @@ where the development occurs. You want the recipe's
 the external directory and use it as is, not copy it.
 
 To build from software that comes from an external source, all you need to do
-is inherit the :ref:`externalsrc <ref-classes-externalsrc>` class and then set
+is inherit the :ref:`ref-classes-externalsrc` class and then set
 the :term:`EXTERNALSRC` variable to point to your external source code. Here
 are the statements to put in your ``local.conf`` file::
 
@@ -812,8 +812,7 @@ This next example shows how to accomplish the same thing by setting
 .. note::
 
    In order for these settings to take effect, you must globally or
-   locally inherit the :ref:`externalsrc <ref-classes-externalsrc>`
-   class.
+   locally inherit the :ref:`ref-classes-externalsrc` class.
 
 By default, :ref:`ref-classes-externalsrc` builds the source code in a
 directory separate from the external source directory as specified by
@@ -881,14 +880,14 @@ directory:
 
 #. *Using Local Files Only:* Inside your ``local.conf`` file, add the
    :term:`SOURCE_MIRROR_URL` variable, inherit the
-   :ref:`own-mirrors <ref-classes-own-mirrors>` class, and use the
+   :ref:`ref-classes-own-mirrors` class, and use the
    :term:`BB_NO_NETWORK` variable to your ``local.conf``::
 
       SOURCE_MIRROR_URL ?= "file:///home/your-download-dir/"
       INHERIT += "own-mirrors"
       BB_NO_NETWORK = "1"
 
-   The :term:`SOURCE_MIRROR_URL` and :ref:`own-mirrors <ref-classes-own-mirrors>`
+   The :term:`SOURCE_MIRROR_URL` and :ref:`ref-classes-own-mirrors`
    class set up the system to use the downloads directory as your "own
    mirror". Using the :term:`BB_NO_NETWORK` variable makes sure that
    BitBake's fetching process in step 3 stays local, which means files
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 921022475f..9fb159eae6 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -153,7 +153,7 @@ In addition to variable values, the output of the ``bitbake -e`` and
    classes included globally, recursively listing the files they include
    or inherit in turn. Much of the behavior of the OpenEmbedded build
    system (including the behavior of the :ref:`ref-manual/tasks:normal recipe build tasks`) is
-   implemented in the :ref:`base <ref-classes-base>` class and the
+   implemented in the :ref:`ref-classes-base` class and the
    classes it inherits, rather than being built into BitBake itself.
 
 -  After the variable values, all functions appear in the output. For
@@ -196,8 +196,7 @@ Following are a few of the available ``oe-pkgdata-util`` subcommands.
       which contains the files stored in that package.
 
       If you want to inspect the ``${WORKDIR}/packages-split``
-      directory, make sure that
-      :ref:`rm_work <ref-classes-rm-work>` is not
+      directory, make sure that :ref:`ref-classes-rm-work` is not
       enabled when you build the recipe.
 
 -  ``oe-pkgdata-util find-path path ...``: Lists the names of
@@ -598,8 +597,7 @@ log to ``${T}/log.do_``\ `task`, and can also log to standard output
 
 The same logging functions are also available in shell functions, under
 the names ``bbplain``, ``bbnote``, ``bbdebug``, ``bbwarn``, ``bberror``,
-and ``bbfatal``. The
-:ref:`logging <ref-classes-logging>` class
+and ``bbfatal``. The :ref:`ref-classes-logging` class
 implements these functions. See that class in the ``meta/classes``
 folder of the :term:`Source Directory` for information.
 
diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index 6fa48e1f4a..3a5d2b7297 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -14,8 +14,7 @@ the :term:`Build Directory`::
 
 Adding this statement deletes the work directory used for
 building a recipe once the recipe is built. For more information on
-"rm_work", see the
-:ref:`rm_work <ref-classes-rm-work>` class in the
+"rm_work", see the :ref:`ref-classes-rm-work` class in the
 Yocto Project Reference Manual.
 
 Purging Duplicate Shared State Cache Files
diff --git a/documentation/dev-manual/error-reporting-tool.rst b/documentation/dev-manual/error-reporting-tool.rst
index 6854f1046a..84f3d9cd1e 100644
--- a/documentation/dev-manual/error-reporting-tool.rst
+++ b/documentation/dev-manual/error-reporting-tool.rst
@@ -27,9 +27,9 @@ Enabling and Using the Tool
 ===========================
 
 By default, the error reporting tool is disabled. You can enable it by
-inheriting the :ref:`report-error <ref-classes-report-error>`
-class by adding the following statement to the end of your
-``local.conf`` file in your :term:`Build Directory`::
+inheriting the :ref:`ref-classes-report-error` class by adding the
+following statement to the end of your ``local.conf`` file in your
+:term:`Build Directory`::
 
    INHERIT += "report-error"
 
diff --git a/documentation/dev-manual/gobject-introspection.rst b/documentation/dev-manual/gobject-introspection.rst
index 28e51240c3..f7206e6fae 100644
--- a/documentation/dev-manual/gobject-introspection.rst
+++ b/documentation/dev-manual/gobject-introspection.rst
@@ -39,9 +39,7 @@ Enabling the Generation of Introspection Data
 Enabling the generation of introspection data (GIR files) in your
 library package involves the following:
 
-#. Inherit the
-   :ref:`gobject-introspection <ref-classes-gobject-introspection>`
-   class.
+#. Inherit the :ref:`ref-classes-gobject-introspection` class.
 
 #. Make sure introspection is not disabled anywhere in the recipe or
    from anything the recipe includes. Also, make sure that
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 0f8d759519..65914e5efe 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -325,13 +325,12 @@ and not just the source used in the released image. It will include
 toolchain source, and other artifacts, which you would not generally
 release. However, the more serious issue for most companies is
 accidental release of proprietary software. The Yocto Project provides
-an :ref:`archiver <ref-classes-archiver>` class to
-help avoid some of these concerns.
+an :ref:`ref-classes-archiver` class to help avoid some of these concerns.
 
-Before you employ :term:`DL_DIR` or the :ref:`archiver <ref-classes-archiver>` class, you need to
-decide how you choose to provide source. The source :ref:`archiver <ref-classes-archiver>` class
-can generate tarballs and SRPMs and can create them with various levels
-of compliance in mind.
+Before you employ :term:`DL_DIR` or the :ref:`ref-classes-archiver` class, you
+need to decide how you choose to provide source. The source
+:ref:`ref-classes-archiver` class can generate tarballs and SRPMs and can
+create them with various levels of compliance in mind.
 
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
@@ -417,8 +416,8 @@ generation are included on your image.
    adds a separate package and an upgrade path for adding licenses to an
    image.
 
-As the source :ref:`archiver <ref-classes-archiver>` class has already archived the original
-unmodified source that contains the license files, you would have
+As the source :ref:`ref-classes-archiver` class has already archived the
+original unmodified source that contains the license files, you would have
 already met the requirements for inclusion of the license information
 with source as defined by the GPL and other open source licenses.
 
@@ -488,8 +487,8 @@ mechanisms as well as explicitly included in the image recipe with
 :term:`IMAGE_INSTALL`, and depends on a static linked library recipe B
 (``DEPENDS += "B"``), package B will neither appear in the generated license
 manifest nor in the generated source tarballs.  This occurs as the
-:ref:`license <ref-classes-license>` and :ref:`archiver <ref-classes-archiver>`
-classes assume that only packages included via :term:`RDEPENDS` or :term:`RRECOMMENDS`
+:ref:`ref-classes-license` and :ref:`ref-classes-archiver` classes assume that
+only packages included via :term:`RDEPENDS` or :term:`RRECOMMENDS`
 end up in the image.
 
 As a result, potential obligations regarding license compliance for package B
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 3adebf2746..4751f64b7e 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -565,7 +565,7 @@ your software is built:
    need to modify the configuration.
 
    When using Autotools, your recipe needs to inherit the
-   :ref:`autotools <ref-classes-autotools>` class and it does not have to
+   :ref:`ref-classes-autotools` class and it does not have to
    contain a :ref:`ref-tasks-configure` task. However, you might still want to
    make some adjustments. For example, you can set :term:`EXTRA_OECONF` or
    :term:`PACKAGECONFIG_CONFARGS` to pass any needed configure options that
@@ -576,7 +576,7 @@ your software is built:
    need to modify the configuration.
 
    When you use CMake, your recipe needs to inherit the
-   :ref:`cmake <ref-classes-cmake>` class and it does not have to contain a
+   :ref:`ref-classes-cmake` class and it does not have to contain a
    :ref:`ref-tasks-configure` task. You can make some adjustments by setting
    :term:`EXTRA_OECMAKE` to pass any needed configure options that are
    specific to the recipe.
@@ -712,7 +712,7 @@ Here are some common issues that cause failures.
    ":ref:`dev-manual/debugging:debugging parallel make races`" section.
 
 -  *Improper host path usage:* This failure applies to recipes building
-   for the target or ":ref:`nativesdk <ref-classes-nativesdk>`" only. The
+   for the target or ":ref:`ref-classes-nativesdk`" only. The
    failure occurs when the compilation process uses improper headers,
    libraries, or other files from the host system when cross-compiling for
    the target.
@@ -807,14 +807,13 @@ installed correctly.
       re-execute :ref:`ref-tasks-install` if needed.
 
    -  ``oe_runmake install``, which can be run directly or can be run
-      indirectly by the
-      :ref:`autotools <ref-classes-autotools>` and
-      :ref:`cmake <ref-classes-cmake>` classes,
-      runs ``make install`` in parallel. Sometimes, a Makefile can have
-      missing dependencies between targets that can result in race
-      conditions. If you experience intermittent failures during
-      :ref:`ref-tasks-install`, you might be able to work around them by disabling
-      parallel Makefile installs by adding the following to the recipe::
+      indirectly by the :ref:`ref-classes-autotools` and
+      :ref:`ref-classes-cmake` classes, runs ``make install`` in parallel.
+      Sometimes, a Makefile can have missing dependencies between targets that
+      can result in race conditions. If you experience intermittent failures
+      during :ref:`ref-tasks-install`, you might be able to work around them by
+      disabling parallel Makefile installs by adding the following to the
+      recipe::
 
          PARALLEL_MAKEINST = ""
 
@@ -854,7 +853,7 @@ different ways:
    shutdown of all other programs.
 
    To enable a service using SysVinit, your recipe needs to inherit the
-   :ref:`update-rc.d <ref-classes-update-rc.d>` class. The class helps
+   :ref:`ref-classes-update-rc.d` class. The class helps
    facilitate safely installing the package on the target.
 
    You will need to set the
@@ -870,7 +869,7 @@ different ways:
    https://freedesktop.org/wiki/Software/systemd/.
 
    To enable a service using systemd, your recipe needs to inherit the
-   :ref:`systemd <ref-classes-systemd>` class. See the ``systemd.bbclass`` file
+   :ref:`ref-classes-systemd` class. See the ``systemd.bbclass`` file
    located in your :term:`Source Directory` section for more information.
 
 Packaging
@@ -886,14 +885,12 @@ take. The following list describes the process:
    other logical components that should be split out. The :ref:`ref-tasks-package`
    task ensures that files are split up and packaged correctly.
 
--  *Running QA Checks*: The
-   :ref:`insane <ref-classes-insane>` class adds a
+-  *Running QA Checks*: The :ref:`ref-classes-insane` class adds a
    step to the package generation process so that output quality
    assurance checks are generated by the OpenEmbedded build system. This
    step performs a range of checks to be sure the build's output is free
    of common problems that show up during runtime. For information on
-   these checks, see the
-   :ref:`insane <ref-classes-insane>` class and
+   these checks, see the :ref:`ref-classes-insane` class and
    the ":ref:`ref-manual/qa-checks:qa error and warning messages`"
    chapter in the Yocto Project Reference Manual.
 
@@ -934,8 +931,7 @@ take. The following list describes the process:
    On the other hand, if the recipe produces packages that do not
    contain anything specific to the target machine or architecture at
    all (e.g. recipes that simply package script files or configuration
-   files), you should use the
-   :ref:`allarch <ref-classes-allarch>` class to
+   files), you should use the :ref:`ref-classes-allarch` class to
    do this for you by adding this to your recipe::
 
       inherit allarch
@@ -1002,18 +998,16 @@ same functionality, you can use a virtual provider (i.e. ``virtual/*``)
 as a placeholder for the actual provider. The actual provider is
 determined at build-time.
 
-A common scenario where a virtual provider is used would be for the
-kernel recipe. Suppose you have three kernel recipes whose
-:term:`PN` values map to ``kernel-big``,
-``kernel-mid``, and ``kernel-small``. Furthermore, each of these recipes
-in some way uses a :term:`PROVIDES`
-statement that essentially identifies itself as being able to provide
-``virtual/kernel``. Here is one way through the
-:ref:`kernel <ref-classes-kernel>` class::
+A common scenario where a virtual provider is used would be for the kernel
+recipe. Suppose you have three kernel recipes whose :term:`PN` values map to
+``kernel-big``, ``kernel-mid``, and ``kernel-small``. Furthermore, each of
+these recipes in some way uses a :term:`PROVIDES` statement that essentially
+identifies itself as being able to provide ``virtual/kernel``. Here is one way
+through the :ref:`ref-classes-kernel` class::
 
    PROVIDES += "virtual/kernel"
 
-Any recipe that inherits the :ref:`kernel <ref-classes-kernel>` class is
+Any recipe that inherits the :ref:`ref-classes-kernel` class is
 going to utilize a :term:`PROVIDES` statement that identifies that recipe as
 being able to provide the ``virtual/kernel`` item.
 
@@ -1223,7 +1217,7 @@ Autotooled Package
 
 Applications that use Autotools such as ``autoconf`` and ``automake``
 require a recipe that has a source archive listed in :term:`SRC_URI` and
-also inherit the :ref:`autotools <ref-classes-autotools>` class,
+also inherit the :ref:`ref-classes-autotools` class,
 which contains the definitions of all the steps needed to build an
 Autotool-based application. The result of the build is automatically
 packaged. And, if the application uses NLS for localization, packages
@@ -1353,24 +1347,19 @@ could lead to compatibility problems with ABI in the future. However,
 sometimes you have no choice.
 
 The easiest solution is to create a recipe that uses the
-:ref:`bin_package <ref-classes-bin-package>` class
-and to be sure that you are using default locations for build artifacts.
-In most cases, the :ref:`bin_package <ref-classes-bin-package>` class handles "skipping" the
-configure and compile steps as well as sets things up to grab packages
-from the appropriate area. In particular, this class sets ``noexec`` on
-both the :ref:`ref-tasks-configure`
-and :ref:`ref-tasks-compile` tasks,
-sets ``FILES:${PN}`` to "/" so that it picks up all files, and sets up a
-:ref:`ref-tasks-install` task, which
-effectively copies all files from ``${S}`` to ``${D}``. The
-:ref:`bin_package <ref-classes-bin-package>` class works well when the files extracted into ``${S}``
-are already laid out in the way they should be laid out on the target.
-For more information on these variables, see the
-:term:`FILES`,
-:term:`PN`,
-:term:`S`, and
-:term:`D` variables in the Yocto Project
-Reference Manual's variable glossary.
+:ref:`ref-classes-bin-package` class and to be sure that you are using default
+locations for build artifacts.  In most cases, the
+:ref:`ref-classes-bin-package` class handles "skipping" the configure and
+compile steps as well as sets things up to grab packages from the appropriate
+area. In particular, this class sets ``noexec`` on both the
+:ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` tasks, sets
+``FILES:${PN}`` to "/" so that it picks up all files, and sets up a
+:ref:`ref-tasks-install` task, which effectively copies all files from ``${S}``
+to ``${D}``. The :ref:`ref-classes-bin-package` class works well when the files
+extracted into ``${S}`` are already laid out in the way they should be laid out
+on the target. For more information on these variables, see the :term:`FILES`,
+:term:`PN`, :term:`S`, and :term:`D` variables in the Yocto Project Reference
+Manual's variable glossary.
 
 .. note::
 
@@ -1388,7 +1377,7 @@ Reference Manual's variable glossary.
       section in the Yocto Project Overview and Concepts Manual for more
       information.
 
-If you cannot use the :ref:`bin_package <ref-classes-bin-package>` class, you need to be sure you are
+If you cannot use the :ref:`ref-classes-bin-package` class, you need to be sure you are
 doing the following:
 
 -  Create a recipe where the
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 2decdcb253..0c584c177a 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -643,8 +643,7 @@ Lighttpd, or Nginx), take the appropriate steps to do so.
 From within the :term:`Build Directory` where you have built an image based on
 your packaging choice (i.e. the :term:`PACKAGE_CLASSES` setting), simply start
 the server. The following example assumes a :term:`Build Directory` of ``poky/build``
-and a :term:`PACKAGE_CLASSES` setting of
-":ref:`package_rpm <ref-classes-package_rpm>`"::
+and a :term:`PACKAGE_CLASSES` setting of ":ref:`ref-classes-package_rpm`"::
 
    $ cd poky/build/tmp/deploy/rpm
    $ python3 -m http.server
@@ -909,8 +908,8 @@ see the :yocto_wiki:`Ptest </Ptest>` wiki page.
 
 .. note::
 
-   A recipe is "ptest-enabled" if it inherits the
-   :ref:`ptest <ref-classes-ptest>` class.
+   A recipe is "ptest-enabled" if it inherits the :ref:`ref-classes-ptest`
+   class.
 
 Adding ptest to Your Build
 --------------------------
@@ -940,7 +939,7 @@ In order to enable a recipe to run installed ptests on target hardware,
 you need to prepare the recipes that build the packages you want to
 test. Here is what you have to do for each recipe:
 
--  *Be sure the recipe inherits the* :ref:`ptest <ref-classes-ptest>` *class:*
+-  *Be sure the recipe inherits the* :ref:`ref-classes-ptest` *class:*
    Include the following line in each recipe::
 
       inherit ptest
@@ -991,7 +990,7 @@ test. Here is what you have to do for each recipe:
    special configurations prior to compiling the test code, you must
    insert a ``do_configure_ptest`` function into the recipe.
 
--  *Install the test suite:* The :ref:`ptest <ref-classes-ptest>` class
+-  *Install the test suite:* The :ref:`ref-classes-ptest` class
    automatically copies the file ``run-ptest`` to the target and then runs make
    ``install-ptest`` to run the tests. If this is not enough, you need
    to create a ``do_install_ptest`` function and make sure it gets
@@ -1145,9 +1144,8 @@ Here are three key points in the previous example:
    sub-module's license is unavailable, the sub-module's name appears in
    the comments.
 
--  The ``inherit npm`` statement causes the
-   :ref:`npm <ref-classes-npm>` class to package
-   up all the modules.
+-  The ``inherit npm`` statement causes the :ref:`ref-classes-npm` class to
+   package up all the modules.
 
 You can run the following command to build the ``cute-files`` package::
 
diff --git a/documentation/dev-manual/quilt.rst b/documentation/dev-manual/quilt.rst
index 24343e2fac..59240705ad 100644
--- a/documentation/dev-manual/quilt.rst
+++ b/documentation/dev-manual/quilt.rst
@@ -12,7 +12,7 @@ form of a patch all using Quilt.
 .. note::
 
    With regard to preserving changes to source files, if you clean a
-   recipe or have :ref:`rm_work <ref-classes-rm-work>` enabled, the
+   recipe or have :ref:`ref-classes-rm-work` enabled, the
    :ref:`devtool workflow <sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow>`
    as described in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual is a safer
@@ -61,7 +61,7 @@ Follow these general steps:
       once you run the :ref:`ref-tasks-clean` or :ref:`ref-tasks-cleanall`
       tasks using BitBake (i.e. ``bitbake -c clean package`` and
       ``bitbake -c cleanall package``). Modifications will also disappear if
-      you use the :ref:`rm_work <ref-classes-rm-work>` feature as described in
+      you use the :ref:`ref-classes-rm-work` feature as described in
       the ":ref:`dev-manual/disk-space:conserving disk space during builds`"
       section.
 
diff --git a/documentation/dev-manual/read-only-rootfs.rst b/documentation/dev-manual/read-only-rootfs.rst
index e29659c678..251178ed54 100644
--- a/documentation/dev-manual/read-only-rootfs.rst
+++ b/documentation/dev-manual/read-only-rootfs.rst
@@ -76,7 +76,7 @@ from running during root filesystem creation:
    native tools, which run on the host system, to accomplish the same
    tasks, or by alternatively running the processes under QEMU, which
    has the ``qemu_run_binary`` function. For more information, see the
-   :ref:`qemu <ref-classes-qemu>` class.
+   :ref:`ref-classes-qemu` class.
 
 Areas With Write Access
 =======================
diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 36ccf746ee..c5c5653bef 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -332,8 +332,8 @@ You can start the tests automatically or manually:
       bitbake core-image-sato
 
 -  *Manually running tests:* To manually run the tests, first globally
-   inherit the :ref:`testimage <ref-classes-testimage>` class
-   by editing your ``local.conf`` file::
+   inherit the :ref:`ref-classes-testimage` class by editing your
+   ``local.conf`` file::
 
       INHERIT += "testimage"
 
diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index d155b4775f..c67b7344d1 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -26,7 +26,7 @@ assessments, as all the components used in the Software Supply Chain are listed.
 
 The OpenEmbedded build system doesn't generate such information by default.
 To make this happen, you must inherit the
-:ref:`create-spdx <ref-classes-create-spdx>` class from a configuration file::
+:ref:`ref-classes-create-spdx` class from a configuration file::
 
    INHERIT += "create-spdx"
 
@@ -39,7 +39,7 @@ containing an index of JSON :term:`SPDX` files for individual recipes, together
 with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all such
 files.
 
-The :ref:`create-spdx <ref-classes-create-spdx>` class offers options to include
+The :ref:`ref-classes-create-spdx` class offers options to include
 more information in the output :term:`SPDX` data, such as making the generated
 files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
 the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
diff --git a/documentation/dev-manual/securing-images.rst b/documentation/dev-manual/securing-images.rst
index f8dd572104..6a9223c19c 100644
--- a/documentation/dev-manual/securing-images.rst
+++ b/documentation/dev-manual/securing-images.rst
@@ -128,11 +128,9 @@ system to make your images more secure:
    service type users). When you set up passwords for multiple images or
    users, you should not duplicate passwords.
 
-   To set up passwords, use the
-   :ref:`extrausers <ref-classes-extrausers>`
-   class, which is the preferred method. For an example on how to set up
-   both root and user passwords, see the
-   ":ref:`ref-classes-extrausers`" section.
+   To set up passwords, use the :ref:`ref-classes-extrausers` class, which
+   is the preferred method. For an example on how to set up both root and
+   user passwords, see the ":ref:`ref-classes-extrausers`" section.
 
    .. note::
 
diff --git a/documentation/dev-manual/speeding-up-build.rst b/documentation/dev-manual/speeding-up-build.rst
index 696b1bdf76..31b6f75ab0 100644
--- a/documentation/dev-manual/speeding-up-build.rst
+++ b/documentation/dev-manual/speeding-up-build.rst
@@ -61,8 +61,7 @@ Following are additional factors that can affect build speed:
    file system on the principle that if there was a significant failure,
    the :term:`Build Directory` contents could easily be rebuilt.
 
--  Inheriting the
-   :ref:`rm_work <ref-classes-rm-work>` class:
+-  Inheriting the :ref:`ref-classes-rm-work` class:
    Inheriting this class has shown to speed up builds due to
    significantly lower amounts of data stored in the data cache as well
    as on disk. Inheriting this class also makes cleanup of
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index dd220cc6c8..13133fddcf 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -113,8 +113,7 @@ The following steps describe how to set up the AUH utility:
       ``upgrade-helper/work/recipe/buildhistory-diff.txt`` file found in
       your :term:`Build Directory`.
 
-   -  If you want to enable testing through the
-      :ref:`testimage <ref-classes-testimage>`
+   -  If you want to enable testing through the :ref:`ref-classes-testimage`
       class, which is optional, you need to have the following set in
       your ``conf/local.conf`` file::
 
diff --git a/documentation/dev-manual/vulnerabilities.rst b/documentation/dev-manual/vulnerabilities.rst
index f8dac5edc6..0ee3ec52c5 100644
--- a/documentation/dev-manual/vulnerabilities.rst
+++ b/documentation/dev-manual/vulnerabilities.rst
@@ -27,8 +27,9 @@ patches to fix them, see ":ref:`dev-manual/changes:submitting a change to the yo
 Vulnerability check at build time
 =================================
 
-To enable a check for CVE security vulnerabilities using :ref:`cve-check <ref-classes-cve-check>` in the specific image
-or target you are building, add the following setting to your configuration::
+To enable a check for CVE security vulnerabilities using
+:ref:`ref-classes-cve-check` in the specific image or target you are building,
+add the following setting to your configuration::
 
    INHERIT += "cve-check"
 
@@ -100,7 +101,7 @@ It is also possible to check the CVE status of individual packages as follows::
 Fixing CVE product name and version mappings
 ============================================
 
-By default, :ref:`cve-check <ref-classes-cve-check>` uses the recipe name :term:`BPN` as CVE
+By default, :ref:`ref-classes-cve-check` uses the recipe name :term:`BPN` as CVE
 product name when querying the CVE database. If this mapping contains false positives, e.g.
 some reported CVEs are not for the software component in question, or false negatives like
 some CVEs are not found to impact the recipe when they should, then the problems can be
@@ -167,8 +168,7 @@ the :term:`CVE_CHECK_SKIP_RECIPE` variable.
 Implementation details
 ======================
 
-Here's what the :ref:`cve-check <ref-classes-cve-check>` class does to
-find unpatched CVE IDs.
+Here's what the :ref:`ref-classes-cve-check` class does to find unpatched CVE IDs.
 
 First the code goes through each patch file provided by a recipe. If a valid CVE ID
 is found in the name of the file, the corresponding CVE is considered as patched.
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index d698cec77c..a8d2f46955 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -59,8 +59,7 @@ this information is required to use Wic, you might find it interesting.
 
 -  Wic is a completely independent standalone utility that initially
    provides easier-to-use and more flexible replacements for an existing
-   functionality in OE-Core's
-   :ref:`image-live <ref-classes-image-live>`
+   functionality in OE-Core's :ref:`ref-classes-image-live`
    class. The difference between Wic and those examples is that with Wic
    the functionality of those scripts is implemented by a
    general-purpose partitioning language, which is based on Redhat
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index fd00a9d1dc..dff8f504fd 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1685,12 +1685,10 @@ looks much like the one provided with the ``hello-mod`` template::
    ...
 
 The important point to note here is the :term:`KERNEL_SRC` variable. The
-:ref:`module <ref-classes-module>` class sets this variable and the
-:term:`KERNEL_PATH` variable to
-``${STAGING_KERNEL_DIR}`` with the necessary Linux kernel build
-information to build modules. If your module ``Makefile`` uses a
-different variable, you might want to override the
-:ref:`ref-tasks-compile` step, or
+:ref:`ref-classes-module` class sets this variable and the :term:`KERNEL_PATH`
+variable to ``${STAGING_KERNEL_DIR}`` with the necessary Linux kernel build
+information to build modules. If your module ``Makefile`` uses a different
+variable, you might want to override the :ref:`ref-tasks-compile` step, or
 create a patch to the ``Makefile`` to work with the more typical
 :term:`KERNEL_SRC` or :term:`KERNEL_PATH` variables.
 
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index a135574744..95f7e3572b 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -91,11 +91,11 @@ consistency.
 nativesdk
 ~~~~~~~~~
 
-The suffix ``nativesdk`` is now implemented as a prefix, which simplifies a
-lot of the packaging code for :ref:`nativesdk <ref-classes-nativesdk>` recipes.
-All custom :ref:`nativesdk <ref-classes-nativesdk>` recipes, which are
-relocatable packages that are native to :term:`SDK_ARCH`, and any references
-need to be updated to use ``nativesdk-*`` instead of ``*-nativesdk``.
+The suffix ``nativesdk`` is now implemented as a prefix, which simplifies a lot
+of the packaging code for :ref:`ref-classes-nativesdk` recipes.  All custom
+:ref:`ref-classes-nativesdk` recipes, which are relocatable packages that are
+native to :term:`SDK_ARCH`, and any references need to be updated to use
+``nativesdk-*`` instead of ``*-nativesdk``.
 
 .. _migration-1.3-task-recipes:
 
@@ -109,7 +109,7 @@ automatic upgrade path for most packages. However, you should update
 references in your own recipes and configurations as they could be
 removed in future releases. You should also rename any custom ``task-*``
 recipes to ``packagegroup-*``, and change them to inherit
-:ref:`packagegroup <ref-classes-packagegroup>` instead of ``task``, as well
+:ref:`ref-classes-packagegroup` instead of ``task``, as well
 as taking the opportunity to remove anything now handled by
 :ref:`ref-classes-packagegroup`, such as providing ``-dev`` and ``-dbg``
 packages, setting :term:`LIC_FILES_CHKSUM`, and so forth. See the
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 14b1f4a0a5..d82d33f91f 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -95,9 +95,8 @@ The following changes have been made to the package QA checks:
    this file within :ref:`ref-tasks-install` if "make
    install" is installing it.
 
--  If you are using the :ref:`buildhistory <ref-classes-buildhistory>` class,
-   the check for the package
-   version going backwards is now controlled using a standard QA check.
+-  If you are using the :ref:`ref-classes-buildhistory` class, the check for the
+   package version going backwards is now controlled using a standard QA check.
    Thus, if you have customized your :term:`ERROR_QA` or :term:`WARN_QA` values
    and still wish to have this check performed, you should add
    "version-going-backwards" to your value for one or the other
@@ -131,7 +130,7 @@ The following directory changes exist:
    it easier to delete :term:`TMPDIR` and preserve the build history.
    Additionally, data for produced SDKs is now split by :term:`IMAGE_NAME`.
 
--  When :ref:`buildhistory <ref-classes-buildhistory>` is enabled, its output
+-  When :ref:`ref-classes-buildhistory` is enabled, its output
    is now written under the :term:`Build Directory` rather than :term:`TMPDIR`.
    Doing so makes it easier to delete :term:`TMPDIR` and preserve the build
    history. Additionally, data for produced SDKs is now split by :term:`IMAGE_NAME`.
@@ -223,7 +222,7 @@ Task Recipes
 The previously deprecated ``task.bbclass`` has now been dropped. For
 recipes that previously inherited from this class, you should rename
 them from ``task-*`` to ``packagegroup-*`` and inherit
-:ref:`packagegroup <ref-classes-packagegroup>` instead.
+:ref:`ref-classes-packagegroup` instead.
 
 For more information, see the ":ref:`ref-classes-packagegroup`" section.
 
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index 1baf8b311a..48c7c7572e 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -11,9 +11,8 @@ Project 1.6 Release (codename "daisy") from the prior release.
 ``archiver`` Class
 ------------------
 
-The :ref:`archiver <ref-classes-archiver>` class has been rewritten
-and its configuration has been simplified. For more details on the
-source archiver, see the
+The :ref:`ref-classes-archiver` class has been rewritten and its configuration
+has been simplified. For more details on the source archiver, see the
 ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
@@ -224,7 +223,7 @@ Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
 ":ref:`dev-manual/packages:testing packages with ptest`" section in the
 Yocto Project Development Tasks Manual. For information on the
-:ref:`ptest <ref-classes-ptest>` class, see the ":ref:`ref-classes-ptest`"
+:ref:`ref-classes-ptest` class, see the ":ref:`ref-classes-ptest`"
 section.
 
 .. _migration-1.6-build-changes:
@@ -234,13 +233,13 @@ Build Changes
 
 Separate build and source directories have been enabled by default for
 selected recipes where it is known to work and for all
-recipes that inherit the :ref:`cmake <ref-classes-cmake>` class. In
-future releases the :ref:`autotools <ref-classes-autotools>` class
+recipes that inherit the :ref:`ref-classes-cmake` class. In
+future releases the :ref:`ref-classes-autotools` class
 will enable a separate :term:`Build Directory` by default as well. Recipes
 building Autotools-based software that fails to build with a separate
 :term:`Build Directory` should be changed to inherit from the
 :ref:`autotools-brokensep <ref-classes-autotools>` class instead of
-the :ref:`autotools <ref-classes-autotools>` or ``autotools_stage`` classes.
+the :ref:`ref-classes-autotools` or ``autotools_stage`` classes.
 
 .. _migration-1.6-building-qemu-native:
 
diff --git a/documentation/migration-guides/migration-1.7.rst b/documentation/migration-guides/migration-1.7.rst
index 94e9904b66..ca8222098a 100644
--- a/documentation/migration-guides/migration-1.7.rst
+++ b/documentation/migration-guides/migration-1.7.rst
@@ -41,13 +41,11 @@ section for more information.
 Autotools Class Changes
 -----------------------
 
-The following :ref:`autotools <ref-classes-autotools>` class changes
-occurred:
+The following :ref:`ref-classes-autotools` class changes occurred:
 
 -  *A separate :term:`Build Directory` is now used by default:* The
-   :ref:`autotools <ref-classes-autotools>` class has been
-   changed to use a directory for building
-   (:term:`B`), which is separate from the source directory
+   :ref:`ref-classes-autotools` class has been changed to use a directory for
+   building (:term:`B`), which is separate from the source directory
    (:term:`S`). This is commonly referred to as ``B != S``, or
    an out-of-tree build.
 
@@ -56,9 +54,8 @@ occurred:
    However, if the software is not capable of being built in this
    manner, you will need to either patch the software so that it can
    build separately, or you will need to change the recipe to inherit
-   the :ref:`autotools-brokensep <ref-classes-autotools>` class
-   instead of the :ref:`autotools <ref-classes-autotools>`
-   or ``autotools_stage`` classes.
+   the :ref:`autotools-brokensep <ref-classes-autotools>` class instead
+   of the :ref:`ref-classes-autotools` or ``autotools_stage`` classes.
 
 -  The ``--foreign`` option is no longer passed to ``automake`` when
    running ``autoconf``: This option tells ``automake`` that a
diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index 6a1f9ed56d..5cc5f8a047 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -70,17 +70,16 @@ the following::
 Kernel Build Changes
 --------------------
 
-The kernel build process was changed to place the source in a common
-shared work area and to place build artifacts separately in the source
-code tree. In theory, migration paths have been provided for most common
-usages in kernel recipes but this might not work in all cases. In
-particular, users need to ensure that ``${S}`` (source files) and
-``${B}`` (build artifacts) are used correctly in functions such as
-:ref:`ref-tasks-configure` and
-:ref:`ref-tasks-install`. For kernel recipes that do not
-inherit from :ref:`kernel-yocto <ref-classes-kernel-yocto>` or include ``linux-yocto.inc``, you might
-wish to refer to the ``linux.inc`` file in the ``meta-oe`` layer for the
-kinds of changes you need to make. For reference, here is the
+The kernel build process was changed to place the source in a common shared work
+area and to place build artifacts separately in the source code tree. In theory,
+migration paths have been provided for most common usages in kernel recipes but
+this might not work in all cases. In particular, users need to ensure that
+``${S}`` (source files) and ``${B}`` (build artifacts) are used correctly in
+functions such as :ref:`ref-tasks-configure` and :ref:`ref-tasks-install`. For
+kernel recipes that do not inherit from :ref:`ref-classes-kernel-yocto` or
+include ``linux-yocto.inc``, you might wish to refer to the ``linux.inc`` file
+in the ``meta-oe`` layer for the kinds of changes you need to make. For reference,
+here is the
 :oe_git:`commit </meta-openembedded/commit/meta-oe/recipes-kernel/linux/linux.inc?id=fc7132ede27ac67669448d3d2845ce7d46c6a1ee>`
 where the ``linux.inc`` file in ``meta-oe`` was updated.
 
@@ -123,10 +122,9 @@ need to take corrective steps.
 Rebuild Improvements
 --------------------
 
-Changes have been made to the :ref:`base <ref-classes-base>`,
-:ref:`autotools <ref-classes-autotools>`, and
-:ref:`cmake <ref-classes-cmake>` classes to clean out generated files
-when the :ref:`ref-tasks-configure` task needs to be
+Changes have been made to the :ref:`ref-classes-base`,
+:ref:`ref-classes-autotools`, and :ref:`ref-classes-cmake` classes to clean out
+generated files when the :ref:`ref-tasks-configure` task needs to be
 re-executed.
 
 One of the improvements is to attempt to run "make clean" during the
diff --git a/documentation/migration-guides/migration-2.0.rst b/documentation/migration-guides/migration-2.0.rst
index 66b3c632f9..13be9846df 100644
--- a/documentation/migration-guides/migration-2.0.rst
+++ b/documentation/migration-guides/migration-2.0.rst
@@ -216,7 +216,7 @@ modifications synchronized, it is not always obvious to developers how
 to manipulate the Metadata as compared to the source.
 
 Metadata processing has now been removed from the
-:ref:`kernel-yocto <ref-classes-kernel-yocto>` class and the external
+:ref:`ref-classes-kernel-yocto` class and the external
 Metadata repository ``yocto-kernel-cache``, which has always been used
 to seed the ``linux-yocto`` "meta" branch. This separate ``linux-yocto``
 cache repository is now the primary location for this data. Due to this
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index 01352acbfa..18b05b52cc 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -66,7 +66,7 @@ Makefile Environment Changes
 :term:`EXTRA_OEMAKE` now defaults to "" instead of
 "-e MAKEFLAGS=". Setting :term:`EXTRA_OEMAKE` to "-e MAKEFLAGS=" by default
 was a historical accident that has required many classes (e.g.
-:ref:`autotools <ref-classes-autotools>`, ``module``) and recipes to override this default in order
+:ref:`ref-classes-autotools`, ``module``) and recipes to override this default in order
 to work with sensible build systems. When upgrading to the release, you
 must edit any recipe that relies upon this old default by either setting
 :term:`EXTRA_OEMAKE` back to "-e MAKEFLAGS=" or by explicitly setting any
@@ -100,7 +100,7 @@ breaking FHS.
 ``ac_cv_sizeof_off_t`` is No Longer Cached in Site Files
 --------------------------------------------------------
 
-For recipes inheriting the :ref:`autotools <ref-classes-autotools>`
+For recipes inheriting the :ref:`ref-classes-autotools`
 class, ``ac_cv_sizeof_off_t`` is no longer cached in the site files for
 ``autoconf``. The reason for this change is because the
 ``ac_cv_sizeof_off_t`` value is not necessarily static per architecture
@@ -108,12 +108,12 @@ as was previously assumed. Rather, the value changes based on whether
 large file support is enabled. For most software that uses ``autoconf``,
 this change should not be a problem. However, if you have a recipe that
 bypasses the standard :ref:`ref-tasks-configure` task
-from the :ref:`autotools <ref-classes-autotools>` class and the software the recipe is building
+from the :ref:`ref-classes-autotools` class and the software the recipe is building
 uses a very old version of ``autoconf``, the recipe might be incapable
 of determining the correct size of ``off_t`` during :ref:`ref-tasks-configure`.
 
 The best course of action is to patch the software as necessary to allow
-the default implementation from the :ref:`autotools <ref-classes-autotools>` class to work such
+the default implementation from the :ref:`ref-classes-autotools` class to work such
 that ``autoreconf`` succeeds and produces a working configure script,
 and to remove the overridden :ref:`ref-tasks-configure` task such that the default
 implementation does get used.
@@ -138,9 +138,8 @@ should make edits so that those tasks are after the
 after :ref:`ref-tasks-rootfs` so that your added tasks run at the correct
 time.
 
-A minor part of this restructuring is that the post-processing
-definitions and functions have been moved from the
-:ref:`image <ref-classes-image>` class to the
+A minor part of this restructuring is that the post-processing definitions and
+functions have been moved from the :ref:`ref-classes-image` class to the
 :ref:`rootfs-postcommands <ref-classes-rootfs*>` class. Functionally,
 however, they remain unchanged.
 
@@ -191,18 +190,17 @@ Class Changes
 The following classes have changed:
 
 -  ``autotools_stage``: Removed because the
-   :ref:`autotools <ref-classes-autotools>` class now provides its
+   :ref:`ref-classes-autotools` class now provides its
    functionality. Recipes that inherited from ``autotools_stage`` should
-   now inherit from :ref:`autotools <ref-classes-autotools>` instead.
+   now inherit from :ref:`ref-classes-autotools` instead.
 
 -  ``boot-directdisk``: Merged into the ``image-vm`` class. The
    ``boot-directdisk`` class was rarely directly used. Consequently,
    this change should not cause any issues.
 
--  ``bootimg``: Merged into the
-   :ref:`image-live <ref-classes-image-live>` class. The ``bootimg``
-   class was rarely directly used. Consequently, this change should not
-   cause any issues.
+-  ``bootimg``: Merged into the :ref:`ref-classes-image-live` class. The
+   ``bootimg`` class was rarely directly used. Consequently, this change should
+   not cause any issues.
 
 -  ``packageinfo``: Removed due to its limited use by the Hob UI, which
    has itself been removed.
@@ -257,14 +255,14 @@ The following changes have been made for the Poky distribution:
    not need to change anything unless you are relying on this naming
    elsewhere.
 
--  The :ref:`uninative <ref-classes-uninative>` class is now enabled
+-  The :ref:`ref-classes-uninative` class is now enabled
    by default in Poky. This class attempts to isolate the build system
    from the host distribution's C library and makes re-use of native
    shared state artifacts across different host distributions practical.
    With this class enabled, a tarball containing a pre-built C library
    is downloaded at the start of the build.
 
-   The :ref:`uninative <ref-classes-uninative>` class is enabled through the
+   The :ref:`ref-classes-uninative` class is enabled through the
    ``meta/conf/distro/include/yocto-uninative.inc`` file, which for
    those not using the Poky distribution, can include to easily enable
    the same functionality.
@@ -403,9 +401,9 @@ These additional changes exist:
    as these directories are automatically found and added.
 
 -  Inaccurate disk and CPU percentage data has been dropped from
-   :ref:`buildstats <ref-classes-buildstats>` output. This data has been replaced with
+   :ref:`ref-classes-buildstats` output. This data has been replaced with
    ``getrusage()`` data and corrected IO statistics. You will probably
-   need to update any custom code that reads the :ref:`buildstats <ref-classes-buildstats>` data.
+   need to update any custom code that reads the :ref:`ref-classes-buildstats` data.
 
 -  The ``meta/conf/distro/include/package_regex.inc`` is now deprecated.
    The contents of this file have been moved to individual recipes.
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 6126af857d..38117d41b4 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -52,7 +52,7 @@ Consider the following:
    post-installation script that is installed by a function added to
    :term:`SYSROOT_PREPROCESS_FUNCS`.
 
-   For an example, see the :ref:`pixbufcache <ref-classes-pixbufcache>` class in ``meta/classes/`` in
+   For an example, see the :ref:`ref-classes-pixbufcache` class in ``meta/classes/`` in
    the :ref:`overview-manual/development-environment:yocto project source repositories`.
 
    .. note::
@@ -402,7 +402,7 @@ The following QA checks have changed:
    warning, you need to address missing runtime dependencies.
 
    For additional information, see the
-   :ref:`insane <ref-classes-insane>` class and the
+   :ref:`ref-classes-insane` class and the
    ":ref:`ref-manual/qa-checks:errors and warnings`" section.
 
 .. _migration-2.3-miscellaneous-changes:
@@ -446,7 +446,7 @@ The following miscellaneous changes have occurred:
    RSA keys only, and with recent versions of OpenSSH, which deprecates
    DSA host keys.
 
--  The :ref:`buildhistory <ref-classes-buildhistory>` class now
+-  The :ref:`ref-classes-buildhistory` class now
    correctly uses tabs as separators between all columns in
    ``installed-package-sizes.txt`` in order to aid import into other
    tools.
@@ -484,26 +484,24 @@ The following miscellaneous changes have occurred:
 
    If you need to preserve these ``.la`` files (e.g. in a custom
    distribution), you must change :term:`INHERIT_DISTRO` such that
-   ":ref:`remove-libtool <ref-classes-remove-libtool>`" is not included
+   ":ref:`ref-classes-remove-libtool`" is not included
    in the value.
 
 -  Extensible SDKs built for GCC 5+ now refuse to install on a
    distribution where the host GCC version is 4.8 or 4.9. This change
    resulted from the fact that the installation is known to fail due to
    the way the ``uninative`` shared state (sstate) package is built. See
-   the :ref:`uninative <ref-classes-uninative>` class for additional
-   information.
+   the :ref:`ref-classes-uninative` class for additional information.
 
--  All :ref:`native <ref-classes-native>` and
-   :ref:`nativesdk <ref-classes-nativesdk>` recipes now use a separate
-   :term:`DISTRO_FEATURES` value instead of sharing the value used by
-   recipes for the target, in order to avoid unnecessary rebuilds.
+-  All :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk` recipes now
+   use a separate :term:`DISTRO_FEATURES` value instead of sharing the value
+   used by recipes for the target, in order to avoid unnecessary rebuilds.
 
-   The :term:`DISTRO_FEATURES` for :ref:`native <ref-classes-native>` recipes
+   The :term:`DISTRO_FEATURES` for :ref:`ref-classes-native` recipes
    is :term:`DISTRO_FEATURES_NATIVE` added to an intersection of
    :term:`DISTRO_FEATURES` and :term:`DISTRO_FEATURES_FILTER_NATIVE`.
 
-   For :ref:`nativesdk <ref-classes-nativesdk>` recipes, the corresponding
+   For :ref:`ref-classes-nativesdk` recipes, the corresponding
    variables are :term:`DISTRO_FEATURES_NATIVESDK` and
    :term:`DISTRO_FEATURES_FILTER_NATIVESDK`.
 
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index 74149f8058..9637301a47 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -197,12 +197,10 @@ Kernel Device Tree Move
 -----------------------
 
 Kernel Device Tree support is now easier to enable in a kernel recipe.
-The Device Tree code has moved to a
-:ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class.
+The Device Tree code has moved to a :ref:`ref-classes-kernel-devicetree` class.
 Functionality is automatically enabled for any recipe that inherits the
-:ref:`kernel <ref-classes-kernel>` class and sets the
-:term:`KERNEL_DEVICETREE` variable. The
-previous mechanism for doing this,
+:ref:`kernel <ref-classes-kernel>` class and sets the :term:`KERNEL_DEVICETREE`
+variable. The previous mechanism for doing this,
 ``meta/recipes-kernel/linux/linux-dtb.inc``, is still available to avoid
 breakage, but triggers a deprecation warning. Future releases of the
 Yocto Project will remove ``meta/recipes-kernel/linux/linux-dtb.inc``.
@@ -271,11 +269,11 @@ The following are additional changes:
    from ``meta-poky`` to OE-Core (i.e. from
    ``meta-poky/conf/distro/include`` to ``meta/conf/distro/include``).
 
--  The :ref:`buildhistory <ref-classes-buildhistory>` class now makes
+-  The :ref:`ref-classes-buildhistory` class now makes
    a single commit per build rather than one commit per subdirectory in
    the repository. This behavior assumes the commits are enabled with
    :term:`BUILDHISTORY_COMMIT` = "1", which
-   is typical. Previously, the :ref:`buildhistory <ref-classes-buildhistory>` class made one commit
+   is typical. Previously, the :ref:`ref-classes-buildhistory` class made one commit
    per subdirectory in the repository in order to make it easier to see
    the changes for a particular subdirectory. To view a particular
    change, specify that subdirectory as the last parameter on the
diff --git a/documentation/migration-guides/migration-2.5.rst b/documentation/migration-guides/migration-2.5.rst
index 8456c2306a..9f089bb93b 100644
--- a/documentation/migration-guides/migration-2.5.rst
+++ b/documentation/migration-guides/migration-2.5.rst
@@ -139,7 +139,7 @@ The following are BitBake changes:
 -  Several explicit "run this task for all recipes in the dependency
    tree" tasks have been removed (e.g. ``fetchall``, ``checkuriall``,
    and the ``*all`` tasks provided by the ``distrodata`` and
-   :ref:`archiver <ref-classes-archiver>` classes). There is a BitBake option to complete this for
+   :ref:`ref-classes-archiver` classes). There is a BitBake option to complete this for
    any arbitrary task. For example::
 
       bitbake <target> -c fetchall
@@ -189,7 +189,7 @@ Miscellaneous Changes
 
 The following are additional changes:
 
--  The :ref:`kernel <ref-classes-kernel>` class supports building packages for multiple kernels.
+-  The :ref:`ref-classes-kernel` class supports building packages for multiple kernels.
    If your kernel recipe or ``.bbappend`` file mentions packaging at
    all, you should replace references to the kernel in package names
    with ``${KERNEL_PACKAGE_NAME}``. For example, if you disable
@@ -197,7 +197,7 @@ The following are additional changes:
    ``RDEPENDS_kernel-base = ""`` you can avoid warnings using
    ``RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""`` instead.
 
--  The :ref:`buildhistory <ref-classes-buildhistory>` class commits changes to the repository by
+-  The :ref:`ref-classes-buildhistory` class commits changes to the repository by
    default so you no longer need to set ``BUILDHISTORY_COMMIT = "1"``.
    If you want to disable commits you need to set
    ``BUILDHISTORY_COMMIT = "0"`` in your configuration.
@@ -209,12 +209,12 @@ The following are additional changes:
    maintains a full-featured BSP in the ``meta-ti`` layer. This rename
    avoids the previous name clash that existed between the two BSPs.
 
--  The :ref:`update-alternatives <ref-classes-update-alternatives>` class no longer works with SysV ``init``
+-  The :ref:`ref-classes-update-alternatives` class no longer works with SysV ``init``
    scripts because this usage has been problematic. Also, the
    ``sysklogd`` recipe no longer uses ``update-alternatives`` because it
    is incompatible with other implementations.
 
--  By default, the :ref:`cmake <ref-classes-cmake>` class uses
+-  By default, the :ref:`ref-classes-cmake` class uses
    ``ninja`` instead of ``make`` for building. This improves build
    performance. If a recipe is broken with ``ninja``, then the recipe
    can set ``OECMAKE_GENERATOR = "Unix Makefiles"`` to change back to
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 356f720850..477714b489 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -128,10 +128,9 @@ missing from :term:`DEPENDS`).
 
 .. note::
 
-   This change affects classes beyond just the two mentioned (i.e.
-   ``distutils`` and ``distutils3``). Any recipe that inherits ``distutils*``
-   classes are affected. For example, the ``setuptools`` and
-   :ref:`setuptools3 <ref-classes-setuptools3>`
+   This change affects classes beyond just the two mentioned (i.e. ``distutils``
+   and ``distutils3``). Any recipe that inherits ``distutils*`` classes are
+   affected. For example, the ``setuptools`` and :ref:`ref-classes-setuptools3`
    recipes are affected since they inherit the ``distutils*`` classes.
 
 Fetching these types of dependencies that are not provided in the
@@ -315,12 +314,11 @@ This section provides information about automatic testing changes:
    exists and has been replaced by the
    :term:`TESTIMAGE_AUTO` variable.
 
--  Inheriting the :ref:`testimage <ref-classes-testimage>` and
-   :ref:`testsdk <ref-classes-testsdk>` classes: best practices now dictate
-   that you use the :term:`IMAGE_CLASSES` variable rather than the
-   :term:`INHERIT` variable when you inherit the
-   :ref:`testimage <ref-classes-testimage>` and
-   :ref:`testsdk <ref-classes-testsdk>` classes used for automatic testing.
+-  Inheriting the :ref:`ref-classes-testimage` and :ref:`ref-classes-testsdk`
+   classes: best practices now dictate that you use the :term:`IMAGE_CLASSES`
+   variable rather than the :term:`INHERIT` variable when you inherit the
+   :ref:`ref-classes-testimage` and :ref:`ref-classes-testsdk` classes used
+   for automatic testing.
 
 .. _migration-2.6-openssl-changes:
 
diff --git a/documentation/migration-guides/migration-2.7.rst b/documentation/migration-guides/migration-2.7.rst
index 6b17ceb90b..c49d2f05d2 100644
--- a/documentation/migration-guides/migration-2.7.rst
+++ b/documentation/migration-guides/migration-2.7.rst
@@ -174,8 +174,7 @@ The following miscellaneous changes occurred:
 -  ``base/pixbufcache``: Obsolete ``sstatecompletions`` code has been
    removed.
 
--  :ref:`native <ref-classes-native>` class:
-   :term:`RDEPENDS` handling has been enabled.
+-  :ref:`ref-classes-native` class: :term:`RDEPENDS` handling has been enabled.
 
 -  ``inetutils``: This recipe has rsh disabled.
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 5ecfe2d54a..8e7a58e74d 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -49,7 +49,7 @@ The following recipes have been removed.
 -  ``core-image-lsb-sdk``: Part of removed LSB support.
 
 -  ``cve-check-tool``: Functionally replaced by the ``cve-update-db``
-   recipe and :ref:`cve-check <ref-classes-cve-check>` class.
+   recipe and :ref:`ref-classes-cve-check` class.
 
 -  ``eglinfo``: No longer maintained. ``eglinfo`` from ``mesa-demos`` is
    an adequate and maintained alternative.
@@ -144,7 +144,7 @@ CVE Checking
 ------------
 
 ``cve-check-tool`` has been functionally replaced by a new
-``cve-update-db`` recipe and functionality built into the :ref:`cve-check <ref-classes-cve-check>`
+``cve-update-db`` recipe and functionality built into the :ref:`ref-classes-cve-check`
 class. The result uses NVD JSON data feeds rather than the deprecated
 XML feeds that ``cve-check-tool`` was using, supports CVSSv3 scoring,
 and makes other improvements.
@@ -287,7 +287,7 @@ The following miscellaneous changes have occurred.
    :term:`NATIVELSBSTRING` to use all lowercase
    characters even if it does not contain a version number. This change
    is necessary only if you are not using
-   :ref:`uninative <ref-classes-uninative>` and :term:`SANITY_TESTED_DISTROS`.
+   :ref:`ref-classes-uninative` and :term:`SANITY_TESTED_DISTROS`.
 
 -  In the ``base-files`` recipe, writing the hostname into
    ``/etc/hosts`` and ``/etc/hostname`` is now done within the main
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index cbad40112b..fdb959c4af 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -127,7 +127,7 @@ renamed to ``features_check``; the ``distro_features_check`` class still
 exists but generates a warning and redirects to the new class. In
 preparation for a future removal of the old class it is recommended that
 you update recipes currently inheriting ``distro_features_check`` to
-inherit :ref:`features_check <ref-classes-features_check>` instead.
+inherit :ref:`ref-classes-features_check` instead.
 
 .. _migration-3.1-removed-classes:
 
@@ -240,10 +240,10 @@ Warnings will now be shown at :ref:`ref-tasks-package_qa` time in the following
 circumstances:
 
 -  A recipe installs ``.desktop`` files containing ``MimeType`` keys but
-   does not inherit the new :ref:`mime-xdg <ref-classes-mime-xdg>` class
+   does not inherit the new :ref:`ref-classes-mime-xdg` class
 
 -  A recipe installs ``.xml`` files into ``${datadir}/mime/packages``
-   but does not inherit the :ref:`mime <ref-classes-mime>` class
+   but does not inherit the :ref:`ref-classes-mime` class
 
 .. _migration-3.1-x86-live-wic:
 
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index b53f2b7802..c538df04d2 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -177,13 +177,23 @@ errors:
 
 In addition, the following new checks were added and default to triggering an error:
 
-- :ref:`shebang-size <qa-check-shebang-size>`: Check for shebang (#!) lines longer than 128 characters, which can give an error at runtime depending on the operating system.
+- :ref:`shebang-size <qa-check-shebang-size>`: Check for shebang (#!) lines
+  longer than 128 characters, which can give an error at runtime depending on
+  the operating system.
 
-- :ref:`unhandled-features-check <qa-check-unhandled-features-check>`: Check if any of the variables supported by the :ref:`features_check <ref-classes-features_check>` class is set while not inheriting the class itself.
+- :ref:`unhandled-features-check <qa-check-unhandled-features-check>`: Check
+  if any of the variables supported by the :ref:`ref-classes-features_check`
+  class is set while not inheriting the class itself.
 
-- :ref:`missing-update-alternatives <qa-check-missing-update-alternatives>`: Check if the recipe sets the :term:`ALTERNATIVE` variable for any of its packages, and does not inherit the :ref:`update-alternatives <ref-classes-update-alternatives>` class.
+- :ref:`missing-update-alternatives <qa-check-missing-update-alternatives>`:
+  Check if the recipe sets the :term:`ALTERNATIVE` variable for any of its
+  packages, and does not inherit the :ref:`ref-classes-update-alternatives`
+  class.
 
-- A trailing slash or duplicated slashes in the value of :term:`S` or :term:`B` will now trigger a warning so that they can be removed and path comparisons can be more reliable --- remove any instances of these in your recipes if the warning is displayed.
+- A trailing slash or duplicated slashes in the value of :term:`S` or :term:`B`
+  will now trigger a warning so that they can be removed and path comparisons
+  can be more reliable --- remove any instances of these in your recipes if the
+  warning is displayed.
 
 
 .. _migration-3.2-src-uri-file-globbing:
@@ -209,9 +219,18 @@ files into a subdirectory and reference that instead.
 deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 ----------------------------------------------------------
 
-:ref:`ref-tasks-deploy` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
+:ref:`ref-tasks-deploy` as implemented in the :ref:`ref-classes-deploy` class
+now cleans up ${:term:`DEPLOYDIR`} before running, just as
+:ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces
+the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from
+previous runs, possibly even with different config, in case of incremental
+builds.
 
-Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with :ref:`ref-tasks-deploy` are unlikely to be affected by this unless they add ``prefuncs`` to :ref:`ref-tasks-deploy` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
+Most recipes and classes that inherit the :ref:`ref-classes-deploy` class or
+interact with :ref:`ref-tasks-deploy` are unlikely to be affected by this
+unless they add ``prefuncs`` to :ref:`ref-tasks-deploy` *which also* put files
+into ``${DEPLOYDIR}`` --- these should be refactored to use
+``do_deploy_prepend`` instead.
 
 
 .. _migration-3.2-nativesdk-sdk-provides-dummy:
@@ -219,7 +238,7 @@ Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` cla
 Custom SDK / SDK-style recipes need to include ``nativesdk-sdk-provides-dummy``
 -------------------------------------------------------------------------------
 
-All :ref:`nativesdk <ref-classes-nativesdk>` packages require ``/bin/sh`` due
+All :ref:`ref-classes-nativesdk` packages require ``/bin/sh`` due
 to their postinstall scriptlets, thus this package has to be dummy-provided
 within the SDK and ``nativesdk-sdk-provides-dummy`` now does this. If you have
 a custom SDK recipe (or your own SDK-style recipe similar to e.g.
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 16d5e2a3ee..d1e589d7b4 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -63,13 +63,13 @@ need to update those.
 New ``python3targetconfig`` class
 ---------------------------------
 
-A new :ref:`python3targetconfig <ref-classes-python3targetconfig>` class has
+A new :ref:`ref-classes-python3targetconfig` class has
 been created for situations where you would previously have inherited the
-:ref:`python3native <ref-classes-python3native>` class but need access to
+:ref:`ref-classes-python3native` class but need access to
 target configuration data (such as correct installation directories). Recipes
 where this situation applies should be changed to inherit
-:ref:`python3targetconfig <ref-classes-python3targetconfig>` instead of
-:ref:`python3native <ref-classes-python3native>`. This also adds a dependency
+:ref:`ref-classes-python3targetconfig` instead of
+:ref:`ref-classes-python3native`. This also adds a dependency
 on target ``python3``, so it should only be used where appropriate in order to
 avoid unnecessarily lengthening builds.
 
@@ -99,11 +99,10 @@ variable so that recipes can specify it explicitly, for example::
    S = "${WORKDIR}/git"
    DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
 
-Recipes that inherit from ``distutils3`` (or
-:ref:`setuptools3 <ref-classes-setuptools3>` which itself inherits
-``distutils3``) that also set :term:`S` to point to a Python module within a
-subdirectory in the aforementioned manner should be changed to set
-``DISTUTILS_SETUP_PATH`` instead.
+Recipes that inherit from ``distutils3`` (or :ref:`ref-classes-setuptools3`
+which itself inherits ``distutils3``) that also set :term:`S` to point to a
+Python module within a subdirectory in the aforementioned manner should be
+changed to set ``DISTUTILS_SETUP_PATH`` instead.
 
 
 .. _migration-3.3-bitbake:
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 88238091a1..076c589c8c 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -126,7 +126,7 @@ Removed classes
 - ``image-mklibs``: not actively tested and upstream mklibs still
   requires Python 2
 - ``meta``: no longer useful. Recipes that need to skip installing
-  packages should inherit :ref:`nopackages <ref-classes-nopackages>` instead.
+  packages should inherit :ref:`ref-classes-nopackages` instead.
 
 Prelinking disabled by default
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -259,7 +259,7 @@ Miscellaneous
   instead.
 
 - The obsolete ``oe_machinstall`` function previously provided in the
-  :ref:`utils <ref-classes-utils>` class has been removed. For
+  :ref:`ref-classes-utils` class has been removed. For
   machine-specific installation it is recommended that you use the
   built-in override support in the fetcher or overrides in general
   instead.
diff --git a/documentation/migration-guides/migration-4.0.rst b/documentation/migration-guides/migration-4.0.rst
index e11809b49c..bc9742a59f 100644
--- a/documentation/migration-guides/migration-4.0.rst
+++ b/documentation/migration-guides/migration-4.0.rst
@@ -119,7 +119,7 @@ License changes
 - The ``AVAILABLE_LICENSES`` variable has been removed. This variable was a performance
   liability and is highly dependent on which layers are added to the configuration,
   which can cause signature issues for users. In addition the ``available_licenses()``
-  function has been removed from the :ref:`license <ref-classes-license>` class as
+  function has been removed from the :ref:`ref-classes-license` class as
   it is no longer needed.
   
 Removed recipes
@@ -143,15 +143,14 @@ Python changes
   
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__.
   Here are the new Python packaging classes that should be used:
-  :ref:`python_flit_core <ref-classes-python_flit_core>`,
-  :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>`
-  and :ref:`python_poetry_core <ref-classes-python_poetry_core>`.  
+  :ref:`ref-classes-python_flit_core`, :ref:`ref-classes-python_setuptools_build_meta`
+  and :ref:`ref-classes-python_poetry_core`.
 
-- The :ref:`setuptools3 <ref-classes-setuptools3>` class :ref:`ref-tasks-install` task now
+- The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-install` task now
   installs the ``wheel`` binary archive. In current versions of ``setuptools`` the
   legacy ``setup.py install`` method is deprecated. If the ``setup.py`` cannot be used
   with wheels, for example it creates files outside of the Python module or standard
-  entry points, then :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` should
+  entry points, then :ref:`ref-classes-setuptools3_legacy` should
   be used instead.
 
 Prelink removed
@@ -173,7 +172,7 @@ Reproducible as standard
 
 Reproducibility is now considered as standard functionality, thus the 
 ``reproducible`` class has been removed and its previous contents merged into the
-:ref:`base <ref-classes-base>` class. If you have references in your configuration to
+:ref:`ref-classes-base` class. If you have references in your configuration to
 ``reproducible`` in :term:`INHERIT`, :term:`USER_CLASSES` etc. then they should be
 removed.
 
@@ -215,15 +214,15 @@ Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
   
 - ``blacklist.bbclass`` is removed and the functionality moved to the
-  :ref:`base <ref-classes-base>` class with a more descriptive
+  :ref:`ref-classes-base` class with a more descriptive
   ``varflag`` variable named :term:`SKIP_RECIPE` which will use the `bb.parse.SkipRecipe()`
   function. The usage remains the same, for example::
 
      SKIP_RECIPE[my-recipe] = "Reason for skipping recipe"
 
-- :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
+- :ref:`ref-classes-allarch` packagegroups can no longer depend on packages
   which use :term:`PKG` renaming such as :ref:`ref-classes-debian`. Such packagegroups
-  recipes should be changed to avoid inheriting :ref:`allarch <ref-classes-allarch>`.
+  recipes should be changed to avoid inheriting :ref:`ref-classes-allarch`.
 
 - The ``lnr`` script has been removed. ``lnr`` implemented the same behaviour as `ln --relative --symbolic`,
   since at the time of creation `--relative` was only available in coreutils 8.16
@@ -232,7 +231,7 @@ Miscellaneous changes
   any calls to ``lnr`` in your recipes or classes, they should be replaced with
   `ln --relative --symbolic` or `ln -rs` if you prefer the short version.
 
-- The ``package_qa_handle_error()`` function formerly in the :ref:`insane <ref-classes-insane>`
+- The ``package_qa_handle_error()`` function formerly in the :ref:`ref-classes-insane`
   class has been moved and renamed - if you have any references in your own custom
   classes they should be changed to ``oe.qa.handle_error()``.
 
diff --git a/documentation/migration-guides/migration-4.1.rst b/documentation/migration-guides/migration-4.1.rst
index 8b9db40ddc..86721b9873 100644
--- a/documentation/migration-guides/migration-4.1.rst
+++ b/documentation/migration-guides/migration-4.1.rst
@@ -92,7 +92,7 @@ now cause an error::
 
    INHERIT += "testimage"
 
-Since :ref:`testimage <ref-classes-testimage>` is a class intended solely to
+Since :ref:`ref-classes-testimage` is a class intended solely to
 affect image recipes, this would be correctly specified as::
 
    IMAGE_CLASSES += "testimage"
@@ -154,16 +154,16 @@ Miscellaneous changes
   you can set :term:`WATCHDOG_TIMEOUT` to the desired timeout in seconds. Note
   that the same :term:`WATCHDOG_TIMEOUT` variable also specifies the timeout used
   for the ``watchdog`` tool (if that is being built).
-- The :ref:`image-buildinfo <ref-classes-image-buildinfo>` class now writes to
+- The :ref:`ref-classes-image-buildinfo` class now writes to
   ``${sysconfdir}/buildinfo`` instead of ``${sysconfdir}/build`` by default (i.e.
   the default value of :term:`IMAGE_BUILDINFO_FILE` has been changed). If you have
   code that reads this from images at build or runtime you will need to update it
   or specify your own value for :term:`IMAGE_BUILDINFO_FILE`.
-- In the :ref:`archiver <ref-classes-archiver>` class, the default
+- In the :ref:`ref-classes-archiver` class, the default
   ``ARCHIVER_OUTDIR`` value no longer includes the :term:`MACHINE` value in order
   to avoid the archive task running multiple times in a multiconfig setup. If you
   have custom code that does something with the files archived by the
-  :ref:`archiver <ref-classes-archiver>` class then you may need to adjust it to
+  :ref:`ref-classes-archiver` class then you may need to adjust it to
   the new structure.
 - If you are not using `systemd` then udev is now configured to use labels
   (``LABEL`` or ``PARTLABEL``) to set the mount point for the device. For example::
@@ -194,7 +194,7 @@ Miscellaneous changes
   :term:`PACKAGECONFIG`. If you are customising this file you will need to
   update your customisations.
 - With the introduction of picobuild in
-  :ref:`python_pep517 <ref-classes-python_pep517>`, The ``PEP517_BUILD_API``
+  :ref:`ref-classes-python_pep517`, The ``PEP517_BUILD_API``
   variable is no longer supported. If you have any references to this variable
   you should remove them.
 
diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index c3b8a785db..1820f5cfd8 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -76,24 +76,24 @@ any new Yocto Project release.
 
 - *Checking Image / SDK Changes*:
 
-   The :ref:`buildhistory <ref-classes-buildhistory>` class can be used
+   The :ref:`ref-classes-buildhistory` class can be used
    if you wish to check the impact of changes to images / SDKs across
    the migration (e.g. added/removed packages, added/removed files, size
    changes etc.). To do this, follow these steps:
 
-   #. Enable :ref:`buildhistory <ref-classes-buildhistory>` before the migration
+   #. Enable :ref:`ref-classes-buildhistory` before the migration
 
    #. Run a pre-migration build
 
-   #. Capture the :ref:`buildhistory <ref-classes-buildhistory>` output (as
+   #. Capture the :ref:`ref-classes-buildhistory` output (as
       specified by :term:`BUILDHISTORY_DIR`) and ensure it is preserved for
       subsequent builds. How you would do this depends on how you are running
       your builds - if you are doing this all on one workstation in the same
       :term:`Build Directory` you may not need to do anything other than not
-      deleting the :ref:`buildhistory <ref-classes-buildhistory>` output
+      deleting the :ref:`ref-classes-buildhistory` output
       directory. For builds in a pipeline it may be more complicated.
 
-   #. Set a tag in the :ref:`buildhistory <ref-classes-buildhistory>` output (which is a git repository) before
+   #. Set a tag in the :ref:`ref-classes-buildhistory` output (which is a git repository) before
       migration, to make the commit from the pre-migration build easy to find
       as you may end up running multiple builds during the migration.
 
@@ -102,7 +102,7 @@ any new Yocto Project release.
    #. Run a build
 
    #. Check the output changes between the previously set tag and HEAD in the
-      :ref:`buildhistory <ref-classes-buildhistory>` output using ``git diff`` or ``buildhistory-diff``.
+      :ref:`ref-classes-buildhistory` output using ``git diff`` or ``buildhistory-diff``.
 
-   For more information on using :ref:`buildhistory <ref-classes-buildhistory>`, see
+   For more information on using :ref:`ref-classes-buildhistory`, see
    :ref:`dev-manual/build-quality:maintaining build output quality`.
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 6b2b7eade6..d76bb004b1 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -9,7 +9,7 @@ New Features / Enhancements in 3.4
 -  Linux kernel 5.14, glibc 2.34 and ~280 other recipe upgrades
 -  Switched override character to ':' (replacing '_') for more robust parsing and improved performance --- see the above migration guide for help
 -  Rust integrated into core, providing rust support for cross-compilation and SDK
--  New :ref:`create-spdx <ref-classes-create-spdx>` class for creating SPDX SBoM documents
+-  New :ref:`ref-classes-create-spdx` class for creating SPDX SBoM documents
 -  New recipes: cargo, core-image-ptest-all, core-image-ptest-fast, core-image-weston-sdk, erofs-utils, gcompat, gi-docgen, libmicrohttpd, libseccomp, libstd-rs, perlcross, python3-markdown, python3-pyyaml, python3-smartypants, python3-typogrify, rust, rust-cross, rust-cross-canadian, rust-hello-world, rust-llvm, rust-tools-cross-canadian, rustfmt, xwayland
 -  Several optimisations to reduce unnecessary task dependencies for faster builds
 -  seccomp integrated into core, with additional enabling for gnutls, systemd, qemu
@@ -71,7 +71,7 @@ New Features / Enhancements in 3.4
 
    -  Enable :ref:`ref-tasks-populate_sdk` with multilibs
    -  New ``SDKPATHINSTALL`` variable decouples default install path from
-      built in path to avoid rebuilding :ref:`nativesdk <ref-classes-nativesdk>`
+      built in path to avoid rebuilding :ref:`ref-classes-nativesdk`
       components on e.g. :term:`DISTRO_VERSION` changes
    -  eSDK: Error if trying to generate an eSDK from a multiconfig
    -  eSDK: introduce :term:`TOOLCHAIN_HOST_TASK_ESDK` to be used in place of :term:`TOOLCHAIN_HOST_TASK` to add components to the host part of the eSDK
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index b1f89cf0a7..563113b4db 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -13,7 +13,7 @@ New Features / Enhancements in 4.0
 - Reproducibility: this release fixes the reproducibility issues with
   ``rust-llvm`` and ``golang``. Recipes in OpenEmbedded-Core are now fully
   reproducible. Functionality previously in the optional "reproducible"
-  class has been merged into the :ref:`base <ref-classes-base>` class.
+  class has been merged into the :ref:`ref-classes-base` class.
 
 - Network access is now disabled by default for tasks other than where it is expected to ensure build integrity (where host kernel supports it)
 
@@ -31,8 +31,7 @@ New Features / Enhancements in 4.0
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__
   in line with the upstream direction.
 
-- New :ref:`overlayfs <ref-classes-overlayfs>` and
-  :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` classes and
+- New :ref:`ref-classes-overlayfs` and :ref:`ref-classes-overlayfs-etc` classes and
   ``overlayroot`` support in the :term:`Initramfs` framework to make it easier to
   overlay read-only filesystems (for example) with
   :wikipedia:`OverlayFS <OverlayFS>`.
@@ -218,7 +217,7 @@ New Features / Enhancements in 4.0
    - Ensure addition of patch-fuzz retriggers do_qa_patch
    - Added a sanity check for allarch packagegroups
 
-- :ref:`create-spdx <ref-classes-create-spdx>` class improvements:
+- :ref:`ref-classes-create-spdx` class improvements:
 
    - Get SPDX-License-Identifier from source files
    - Generate manifest also for SDKs
@@ -238,9 +237,9 @@ New Features / Enhancements in 4.0
    
 - SDK-related enhancements:
 
-   - Extended recipes to :ref:`nativesdk <ref-classes-nativesdk>`: ``cargo``,
+   - Extended recipes to :ref:`ref-classes-nativesdk`: ``cargo``,
      ``librsvg``, ``libstd-rs``, ``libva``, ``python3-docutil``, ``python3-packaging``
-   - Enabled :ref:`nativesdk <ref-classes-nativesdk>` recipes to find a correct version
+   - Enabled :ref:`ref-classes-nativesdk` recipes to find a correct version
      of the rust cross compiler
    - Support creating per-toolchain cmake file in SDK
 
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 09eb6d8c06..cd48e202ab 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -30,7 +30,7 @@ New Features / Enhancements in 4.1
   - Support for building rust for the target
   - Significant SDK toolchain build optimisation
   - Support for building native components in the SDK
-  - Support ``crate://`` fetcher with :ref:`externalsrc <ref-classes-externalsrc>`
+  - Support ``crate://`` fetcher with :ref:`ref-classes-externalsrc`
 
 - New core recipes:
 
@@ -52,7 +52,7 @@ New Features / Enhancements in 4.1
   - Added support for Ignored CVEs
   - Enable recursive CVE checking also for ``do_populate_sdk``
   - New :term:`CVE_CHECK_SHOW_WARNINGS` variable to disable unpatched CVE warning messages
-  - The :ref:`pypi <ref-classes-pypi>` class now defaults :term:`CVE_PRODUCT` from :term:`PYPI_PACKAGE`
+  - The :ref:`ref-classes-pypi` class now defaults :term:`CVE_PRODUCT` from :term:`PYPI_PACKAGE`
   - Added current kernel CVEs to ignore list since we stay as close to the kernel stable releases as we can
   - Optimisations to avoid dependencies on fetching
 
@@ -60,9 +60,9 @@ New Features / Enhancements in 4.1
 - Dependency of -dev package on main package is now an :term:`RRECOMMENDS` and can be easily set via new :term:`DEV_PKG_DEPENDENCY` variable
 
 - Support for CPU, I/O and memory pressure regulation in BitBake
-- Pressure data gathering in :ref:`buildstats <ref-classes-buildstats>` and rendering in ``pybootchartgui``
+- Pressure data gathering in :ref:`ref-classes-buildstats` and rendering in ``pybootchartgui``
 
-- New Picobuild system for lightweight Python PEP-517 build support in the :ref:`python_pep517 <ref-classes-python_pep517>` class
+- New Picobuild system for lightweight Python PEP-517 build support in the :ref:`ref-classes-python_pep517` class
 
 - Many classes are now split into global and recipe contexts for better
   validation. For more information, see
@@ -99,10 +99,10 @@ New Features / Enhancements in 4.1
 -  SDK-related enhancements:
 
    - :ref:`Support for using the regular build system as an SDK <sdk-manual/extensible:Setting up the Extensible SDK environment directly in a Yocto build>`
-   - :ref:`image-buildinfo <ref-classes-image-buildinfo>` class now also writes build information to SDKs
+   - :ref:`ref-classes-image-buildinfo` class now also writes build information to SDKs
    - New :term:`SDK_TOOLCHAIN_LANGS` variable to control support of rust / go in SDK
-   - rust-llvm: enabled :ref:`nativesdk <ref-classes-nativesdk>` variant
-   - python3-pluggy: enabled for :ref:`native <ref-classes-native>` / :ref:`nativesdk <ref-classes-nativesdk>`
+   - rust-llvm: enabled :ref:`ref-classes-nativesdk` variant
+   - python3-pluggy: enabled for :ref:`ref-classes-native` / :ref:`ref-classes-nativesdk`
 
 -  QEMU/runqemu enhancements:
 
@@ -115,11 +115,11 @@ New Features / Enhancements in 4.1
    - New variable :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
    - New variable :term:`FIT_PAD_ALG` to control FIT image padding algorithm
    - New :term:`KERNEL_DEPLOY_DEPEND` variable to allow disabling image dependency on deploying the kernel
-   - :ref:`image_types <ref-classes-image_types>`: isolate the write of UBI
+   - :ref:`ref-classes-image_types`: isolate the write of UBI
      configuration to a ``write_ubi_config`` function that can be easily overridden
 
 - openssh: add support for config snippet includes to ssh and sshd
-- :ref:`create-spdx <ref-classes-create-spdx>`: Add :term:`SPDX_PRETTY` option
+- :ref:`ref-classes-create-spdx`: Add :term:`SPDX_PRETTY` option
 - wpa-supplicant: build static library if not disabled via :term:`DISABLE_STATIC`
 - wpa-supplicant: package dynamic modules
 - openssl: extract legacy provider module to a separate package
@@ -132,11 +132,11 @@ New Features / Enhancements in 4.1
 - systemd: systemd-systemctl: Support instance conf files during enable
 - weston.init: enable ``xwayland`` in weston.ini if ``x11`` is in :term:`DISTRO_FEATURES`
 - New ``npm_registry`` Python module to enable caching with nodejs 16+
-- :ref:`npm <ref-classes-npm>`: replaced ``npm pack`` call with ``tar czf`` for nodejs 16+ compatibility and improved ``do_configure`` performance
-- Enabled :ref:`bin_package <ref-classes-bin-package>` class to work properly in the native case
+- :ref:`ref-classes-npm`: replaced ``npm pack`` call with ``tar czf`` for nodejs 16+ compatibility and improved ``do_configure`` performance
+- Enabled :ref:`ref-classes-bin-package` class to work properly in the native case
 - Enabled :ref:`buildpaths <qa-check-buildpaths>` QA check as a warning by default
-- New :term:`OVERLAYFS_ETC_EXPOSE_LOWER` to provide read-only access to the original ``/etc`` content with :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`
-- New :term:`OVERLAYFS_QA_SKIP` variable to allow skipping check on :ref:`overlayfs <ref-classes-overlayfs>` mounts
+- New :term:`OVERLAYFS_ETC_EXPOSE_LOWER` to provide read-only access to the original ``/etc`` content with :ref:`ref-classes-overlayfs-etc`
+- New :term:`OVERLAYFS_QA_SKIP` variable to allow skipping check on :ref:`ref-classes-overlayfs` mounts
 - New :term:`PACKAGECONFIG` options for individual recipes:
 
    - apr: xsi-strerror
@@ -176,7 +176,7 @@ New Features / Enhancements in 4.1
 - The Python ``zoneinfo`` module is now split out to its own ``python3-zoneinfo`` package.
 - busybox: added devmem 128-bit support
 - vim: split xxd out into its own package
-- New :ref:`github-releases <ref-classes-github-releases>` class to consolidate version checks for github-based packages
+- New :ref:`ref-classes-github-releases` class to consolidate version checks for github-based packages
 - ``devtool reset`` now preserves ``workspace/sources`` source trees in ``workspace/attic/sources/`` instead of leaving them in-place
 - scripts/patchreview: Add commit to stored json data
 - scripts/patchreview: Make json output human parsable
@@ -204,7 +204,7 @@ Known Issues in 4.1
   :yocto_bugs:`bug 14626 </show_bug.cgi?id=14626>`, which also details the fix.
 
 - The change to :ref:`migration-4.1-classes-split` inadvertently moved the
-  :ref:`externalsrc <ref-classes-externalsrc>` class to ``meta/classes-recipe``,
+  :ref:`ref-classes-externalsrc` class to ``meta/classes-recipe``,
   when it is not recipe-specific and can also be used in a global context.  The
   class will be moved back to ``meta/classes`` in the next point release.  Filed
   as :yocto_bugs:`bug 14940 </show_bug.cgi?id=14940>`.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index d2edfc3427..4cee4bb169 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -107,8 +107,7 @@ Classes
 -------
 
 Class files (``.bbclass``) contain information that is useful to share
-between recipes files. An example is the
-:ref:`autotools <ref-classes-autotools>` class,
+between recipes files. An example is the :ref:`ref-classes-autotools` class,
 which contains common settings for any application that is built with
 the :wikipedia:`GNU Autotools <GNU_Autotools>`.
 The ":ref:`ref-manual/classes:Classes`" chapter in the Yocto Project
@@ -561,11 +560,11 @@ reside somewhere local to a project --- perhaps a directory into which the
 user checks in items (e.g. a local directory containing a development
 source tree used by the group).
 
-The canonical method through which to include a local project is to use
-the :ref:`externalsrc <ref-classes-externalsrc>`
-class to include that local project. You use either the ``local.conf``
-or a recipe's append file to override or set the recipe to point to the
-local directory on your disk to pull in the whole source tree.
+The canonical method through which to include a local project is to use the
+:ref:`ref-classes-externalsrc` class to include that local project. You use
+either the ``local.conf`` or a recipe's append file to override or set the
+recipe to point to the local directory on your disk to pull in the whole
+source tree.
 
 Source Control Managers (Optional)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -628,8 +627,7 @@ types, and you specify which classes to enable through the
 :term:`PACKAGE_CLASSES`
 variable. Before placing the packages into package feeds, the build
 process validates them with generated output quality assurance checks
-through the :ref:`insane <ref-classes-insane>`
-class.
+through the :ref:`ref-classes-insane` class.
 
 The package feed area resides in the :term:`Build Directory`. The directory the
 build system uses to temporarily store packages is determined by a
@@ -840,14 +838,12 @@ This step in the build process consists of the following tasks:
    are specific to configurations for the source code being built by the
    recipe.
 
-   If you are using the
-   :ref:`autotools <ref-classes-autotools>` class,
+   If you are using the :ref:`ref-classes-autotools` class,
    you can add additional configuration options by using the
    :term:`EXTRA_OECONF` or
    :term:`PACKAGECONFIG_CONFARGS`
    variables. For information on how this variable works within that
-   class, see the
-   :ref:`autotools <ref-classes-autotools>` class
+   class, see the :ref:`ref-classes-autotools` class
    :yocto_git:`here </poky/tree/meta/classes-recipe/autotools.bbclass>`.
 
 -  *do_compile*: Once a configuration task has been satisfied,
@@ -920,7 +916,7 @@ the analysis and package splitting process use several areas:
 -  :term:`STAGING_DIR_TARGET`:
    The path for the sysroot used when a component that is built to
    execute on a system and it generates code for yet another machine
-   (e.g. :ref:`cross-canadian <ref-classes-cross-canadian>` recipes).
+   (e.g. :ref:`ref-classes-cross-canadian` recipes).
 
 The :term:`FILES` variable defines the
 files that go into each package in
@@ -1006,13 +1002,11 @@ is read-only.
 The final stages of the :ref:`ref-tasks-rootfs` task handle post processing. Post
 processing includes creation of a manifest file and optimizations.
 
-The manifest file (``.manifest``) resides in the same directory as the
-root filesystem image. This file lists out, line-by-line, the installed
-packages. The manifest file is useful for the
-:ref:`testimage <ref-classes-testimage>` class,
+The manifest file (``.manifest``) resides in the same directory as the root
+filesystem image. This file lists out, line-by-line, the installed packages.
+The manifest file is useful for the :ref:`ref-classes-testimage` class,
 for example, to determine whether or not to run specific tests. See the
-:term:`IMAGE_MANIFEST`
-variable for additional information.
+:term:`IMAGE_MANIFEST` variable for additional information.
 
 Optimizing processes that are run across the image include ``mklibs``
 and any other post-processing commands as defined by the
@@ -1751,12 +1745,11 @@ half the problem of supporting a shared state. The other half of the
 problem is being able to use checksum information during the build and
 being able to reuse or rebuild specific components.
 
-The :ref:`sstate <ref-classes-sstate>` class is a
-relatively generic implementation of how to "capture" a snapshot of a
-given task. The idea is that the build process does not care about the
-source of a task's output. Output could be freshly built or it could be
-downloaded and unpacked from somewhere. In other words, the build
-process does not need to worry about its origin.
+The :ref:`ref-classes-sstate` class is a relatively generic implementation of
+how to "capture" a snapshot of a given task. The idea is that the build process
+does not care about the source of a task's output. Output could be freshly
+built or it could be downloaded and unpacked from somewhere. In other words,
+the build process does not need to worry about its origin.
 
 Two types of output exist. One type is just about creating a directory
 in :term:`WORKDIR`. A good example is
@@ -1767,10 +1760,9 @@ type of output occurs when a set of data is merged into a shared
 directory tree such as the sysroot.
 
 The Yocto Project team has tried to keep the details of the
-implementation hidden in the :ref:`sstate <ref-classes-sstate>` class. From a user's perspective,
+implementation hidden in the :ref:`ref-classes-sstate` class. From a user's perspective,
 adding shared state wrapping to a task is as simple as this
-:ref:`ref-tasks-deploy` example taken
-from the :ref:`deploy <ref-classes-deploy>` class::
+:ref:`ref-tasks-deploy` example taken from the :ref:`ref-classes-deploy` class::
 
    DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
    SSTATETASKS += "do_deploy"
@@ -1786,11 +1778,9 @@ from the :ref:`deploy <ref-classes-deploy>` class::
 
 The following list explains the previous example:
 
--  Adding ``do_deploy`` to ``SSTATETASKS`` adds some required
-   sstate-related processing, which is implemented in the
-   :ref:`sstate <ref-classes-sstate>` class, to
-   before and after the
-   :ref:`ref-tasks-deploy` task.
+-  Adding ``do_deploy`` to ``SSTATETASKS`` adds some required sstate-related
+   processing, which is implemented in the :ref:`ref-classes-sstate` class, to
+   before and after the :ref:`ref-tasks-deploy` task.
 
 -  The ``do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"`` declares that
    :ref:`ref-tasks-deploy` places its output in ``${DEPLOYDIR}`` when run normally
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index fed3dcc066..7dba617db5 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -37,7 +37,7 @@ information.
 ``allarch``
 ===========
 
-The :ref:`allarch <ref-classes-allarch>` class is inherited by recipes that do not produce
+The :ref:`ref-classes-allarch` class is inherited by recipes that do not produce
 architecture-specific output. The class disables functionality that is
 normally needed for recipes that produce executable binaries (such as
 building the cross-compiler and a C library as pre-requisites, and
@@ -49,7 +49,7 @@ splitting out of debug symbols during packaging).
    produce packages that depend on tunings through use of the
    :term:`RDEPENDS` and
    :term:`TUNE_PKGARCH` variables, should never be
-   configured for all architectures using :ref:`allarch <ref-classes-allarch>`. This is the case
+   configured for all architectures using :ref:`ref-classes-allarch`. This is the case
    even if the recipes do not produce architecture-specific output.
 
    Configuring such recipes for all architectures causes the
@@ -58,22 +58,22 @@ splitting out of debug symbols during packaging).
    Additionally, unnecessary rebuilds occur every time an image for a
    different :term:`MACHINE` is built even when the recipe never changes.
 
-By default, all recipes inherit the :ref:`base <ref-classes-base>` and
-:ref:`package <ref-classes-package>` classes, which enable
+By default, all recipes inherit the :ref:`ref-classes-base` and
+:ref:`ref-classes-package` classes, which enable
 functionality needed for recipes that produce executable output. If your
 recipe, for example, only produces packages that contain configuration
 files, media files, or scripts (e.g. Python and Perl), then it should
-inherit the :ref:`allarch <ref-classes-allarch>` class.
+inherit the :ref:`ref-classes-allarch` class.
 
 .. _ref-classes-archiver:
 
 ``archiver``
 ============
 
-The :ref:`archiver <ref-classes-archiver>` class supports releasing source code and other
+The :ref:`ref-classes-archiver` class supports releasing source code and other
 materials with the binaries.
 
-For more details on the source :ref:`archiver <ref-classes-archiver>`, see the
+For more details on the source :ref:`ref-classes-archiver`, see the
 ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual. You can also see
 the :term:`ARCHIVER_MODE` variable for information
@@ -102,7 +102,7 @@ By default, the :ref:`autotools* <ref-classes-autotools>` classes use out-of-tre
 If the software being built by a recipe does not support using
 out-of-tree builds, you should have the recipe inherit the
 :ref:`autotools-brokensep <ref-classes-autotools>` class. The :ref:`autotools-brokensep <ref-classes-autotools>` class behaves
-the same as the :ref:`autotools <ref-classes-autotools>` class but builds with :term:`B`
+the same as the :ref:`ref-classes-autotools` class but builds with :term:`B`
 == :term:`S`. This method is useful when out-of-tree build
 support is either not present or is broken.
 
@@ -133,14 +133,13 @@ It's useful to have some idea of how the tasks defined by the
 ``base``
 ========
 
-The :ref:`base <ref-classes-base>` class is special in that every ``.bb`` file implicitly
+The :ref:`ref-classes-base` class is special in that every ``.bb`` file implicitly
 inherits the class. This class contains definitions for standard basic
 tasks such as fetching, unpacking, configuring (empty by default),
 compiling (runs any ``Makefile`` present), installing (empty by default)
 and packaging (empty by default). These classes are often overridden or
-extended by other classes such as the
-:ref:`autotools <ref-classes-autotools>` class or the
-:ref:`package <ref-classes-package>` class.
+extended by other classes such as the :ref:`ref-classes-autotools` class or the
+:ref:`ref-classes-package` class.
 
 The class also contains some commonly used functions such as
 ``oe_runmake``, which runs ``make`` with the arguments specified in
@@ -160,7 +159,7 @@ software that includes bash-completion data.
 ``bin_package``
 ===============
 
-The :ref:`bin_package <ref-classes-bin-package>` class is a helper class for recipes that extract the
+The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
 contents of a binary package (e.g. an RPM) and install those contents
 rather than building the binary from source. The binary package is
 extracted and new packages in the configured output package format are
@@ -187,7 +186,7 @@ example use for this class.
 ``binconfig``
 =============
 
-The :ref:`binconfig <ref-classes-binconfig>` class helps to correct paths in shell scripts.
+The :ref:`ref-classes-binconfig` class helps to correct paths in shell scripts.
 
 Before ``pkg-config`` had become widespread, libraries shipped shell
 scripts to give information about the libraries and include paths needed
@@ -207,7 +206,7 @@ information.
 ``binconfig-disabled``
 ======================
 
-An alternative version of the :ref:`binconfig <ref-classes-binconfig>`
+An alternative version of the :ref:`ref-classes-binconfig`
 class, which disables binary configuration scripts by making them return
 an error in favor of using ``pkg-config`` to query the information. The
 scripts to be disabled should be specified using the :term:`BINCONFIG`
@@ -218,7 +217,7 @@ variable within the recipe inheriting the class.
 ``buildhistory``
 ================
 
-The :ref:`buildhistory <ref-classes-buildhistory>` class records a history of build output metadata,
+The :ref:`ref-classes-buildhistory` class records a history of build output metadata,
 which can be used to detect possible regressions as well as used for
 analysis of the build output. For more information on using Build
 History, see the
@@ -230,7 +229,7 @@ section in the Yocto Project Development Tasks Manual.
 ``buildstats``
 ==============
 
-The :ref:`buildstats <ref-classes-buildstats>` class records performance statistics about each task
+The :ref:`ref-classes-buildstats` class records performance statistics about each task
 executed during the build (e.g. elapsed time, CPU usage, and I/O usage).
 
 When you use this class, the output goes into the
@@ -244,7 +243,7 @@ Collecting build statistics is enabled by default through the
 :term:`USER_CLASSES` variable from your
 ``local.conf`` file. Consequently, you do not have to do anything to
 enable the class. However, if you want to disable the class, simply
-remove ":ref:`buildstats <ref-classes-buildstats>`" from the :term:`USER_CLASSES` list.
+remove ":ref:`ref-classes-buildstats`" from the :term:`USER_CLASSES` list.
 
 .. _ref-classes-buildstats-summary:
 
@@ -253,14 +252,14 @@ remove ":ref:`buildstats <ref-classes-buildstats>`" from the :term:`USER_CLASSES
 
 When inherited globally, prints statistics at the end of the build on
 sstate re-use. In order to function, this class requires the
-:ref:`buildstats <ref-classes-buildstats>` class be enabled.
+:ref:`ref-classes-buildstats` class be enabled.
 
 .. _ref-classes-ccache:
 
 ``ccache``
 ==========
 
-The :ref:`ccache <ref-classes-ccache>` class enables the C/C++ Compiler Cache for the build.
+The :ref:`ref-classes-ccache` class enables the C/C++ Compiler Cache for the build.
 This class is used to give a minor performance boost during the build.
 
 See https://ccache.samba.org/ for information on the C/C++ Compiler
@@ -277,9 +276,9 @@ this class is not recommended.
 ``chrpath``
 ===========
 
-The :ref:`chrpath <ref-classes-chrpath>` class is a wrapper around the "chrpath" utility, which
-is used during the build process for :ref:`nativesdk <ref-classes-nativesdk>`, :ref:`cross <ref-classes-cross>`, and
-:ref:`cross-canadian <ref-classes-cross-canadian>` recipes to change ``RPATH`` records within binaries
+The :ref:`ref-classes-chrpath` class is a wrapper around the "chrpath" utility, which
+is used during the build process for :ref:`ref-classes-nativesdk`, :ref:`ref-classes-cross`, and
+:ref:`ref-classes-cross-canadian` recipes to change ``RPATH`` records within binaries
 in order to make them relocatable.
 
 .. _ref-classes-cmake:
@@ -287,7 +286,7 @@ in order to make them relocatable.
 ``cmake``
 =========
 
-The ref:`cmake <ref-classes-cmake>` class allows for recipes that need to build software using
+The ref:`ref-classes-cmake` class allows for recipes that need to build software using
 the `CMake <https://cmake.org/overview/>`__ build system. You can use
 the :term:`EXTRA_OECMAKE` variable to specify
 additional configuration options to be passed using the ``cmake``
@@ -304,7 +303,7 @@ Modules during
 ``cml1``
 ========
 
-The :ref:`cml1 <ref-classes-cml1>` class provides basic support for the Linux kernel style
+The :ref:`ref-classes-cml1` class provides basic support for the Linux kernel style
 build configuration system.
 
 .. _ref-classes-compress_doc:
@@ -322,18 +321,18 @@ but you can select an alternative mechanism by setting the
 ``copyleft_compliance``
 =======================
 
-The :ref:`copyleft_compliance <ref-classes-copyleft_compliance>` class preserves source code for the purposes
-of license compliance. This class is an alternative to the :ref:`archiver <ref-classes-archiver>`
+The :ref:`ref-classes-copyleft_compliance` class preserves source code for the purposes
+of license compliance. This class is an alternative to the :ref:`ref-classes-archiver`
 class and is still used by some users even though it has been deprecated
-in favor of the :ref:`archiver <ref-classes-archiver>` class.
+in favor of the :ref:`ref-classes-archiver` class.
 
 .. _ref-classes-copyleft_filter:
 
 ``copyleft_filter``
 ===================
 
-A class used by the :ref:`archiver <ref-classes-archiver>` and
-:ref:`copyleft_compliance <ref-classes-copyleft_compliance>` classes
+A class used by the :ref:`ref-classes-archiver` and
+:ref:`ref-classes-copyleft_compliance` classes
 for filtering licenses. The ``copyleft_filter`` class is an internal
 class and is not intended to be used directly.
 
@@ -342,7 +341,7 @@ class and is not intended to be used directly.
 ``core-image``
 ==============
 
-The :ref:`core-image <ref-classes-core-image>` class provides common definitions for the
+The :ref:`ref-classes-core-image` class provides common definitions for the
 ``core-image-*`` image recipes, such as support for additional
 :term:`IMAGE_FEATURES`.
 
@@ -372,7 +371,7 @@ support.
 ``create-spdx``
 ===============
 
-The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
+The :ref:`ref-classes-create-spdx` class provides support for
 automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
 and SDK contents.
 
@@ -398,7 +397,7 @@ section in the Yocto Project Development Manual for more details.
 ``cross``
 =========
 
-The :ref:`cross <ref-classes-cross>` class provides support for the recipes that build the
+The :ref:`ref-classes-cross` class provides support for the recipes that build the
 cross-compilation tools.
 
 .. _ref-classes-cross-canadian:
@@ -406,7 +405,7 @@ cross-compilation tools.
 ``cross-canadian``
 ==================
 
-The :ref:`cross-canadian <ref-classes-cross-canadian>` class provides support for the recipes that build
+The :ref:`ref-classes-cross-canadian` class provides support for the recipes that build
 the Canadian Cross-compilation tools for SDKs. See the
 ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
@@ -417,7 +416,7 @@ discussion on these cross-compilation tools.
 ``crosssdk``
 ============
 
-The :ref:`crosssdk <ref-classes-crosssdk>` class provides support for the recipes that build the
+The :ref:`ref-classes-crosssdk` class provides support for the recipes that build the
 cross-compilation tools used for building SDKs. See the
 ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
@@ -428,7 +427,7 @@ discussion on these cross-compilation tools.
 ``cve-check``
 =============
 
-The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
+The :ref:`ref-classes-cve-check` class looks for known CVEs (Common Vulnerabilities
 and Exposures) while building with BitBake. This class is meant to be
 inherited globally from a configuration file::
 
@@ -492,7 +491,7 @@ section in the Development Tasks Manual.
 ``debian``
 ==========
 
-The :ref:`debian <ref-classes-debian>` class renames output packages so that they follow the
+The :ref:`ref-classes-debian` class renames output packages so that they follow the
 Debian naming policy (i.e. ``glibc`` becomes ``libc6`` and
 ``glibc-devel`` becomes ``libc6-dev``.) Renaming includes the library
 name and version as part of the package name.
@@ -507,7 +506,7 @@ naming scheme.
 ``deploy``
 ==========
 
-The :ref:`deploy <ref-classes-deploy>` class handles deploying files to the
+The :ref:`ref-classes-deploy` class handles deploying files to the
 :term:`DEPLOY_DIR_IMAGE` directory. The main
 function of this class is to allow the deploy step to be accelerated by
 shared state. Recipes that inherit this class should define their own
@@ -523,17 +522,17 @@ staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 ``devshell``
 ============
 
-The :ref:`devshell <ref-classes-devshell>` class adds the :ref:`ref-tasks-devshell` task. Distribution
+The :ref:`ref-classes-devshell` class adds the :ref:`ref-tasks-devshell` task. Distribution
 policy dictates whether to include this class. See the ":ref:`dev-manual/development-shell:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
-information about using :ref:`devshell <ref-classes-devshell>`.
+information about using :ref:`ref-classes-devshell`.
 
 .. _ref-classes-devupstream:
 
 ``devupstream``
 ===============
 
-The :ref:`devupstream <ref-classes-devupstream>` class uses
+The :ref:`ref-classes-devupstream` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
 tarball. Following is an example::
@@ -555,10 +554,10 @@ Any development-specific adjustments can be done by using the
 
 The class
 currently only supports creating a development variant of the target
-recipe, not :ref:`native <ref-classes-native>` or :ref:`nativesdk <ref-classes-nativesdk>` variants.
+recipe, not :ref:`ref-classes-native` or :ref:`ref-classes-nativesdk` variants.
 
 The :term:`BBCLASSEXTEND` syntax (i.e. ``devupstream:target``) provides
-support for :ref:`native <ref-classes-native>` and :ref:`nativesdk <ref-classes-nativesdk>` variants. Consequently, this
+support for :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk` variants. Consequently, this
 functionality can be added in a future release.
 
 Support for other version control systems such as Subversion is limited
@@ -570,7 +569,7 @@ due to BitBake's automatic fetch dependencies (e.g.
 ``externalsrc``
 ===============
 
-The :ref:`externalsrc <ref-classes-externalsrc>` class supports building software from source code
+The :ref:`ref-classes-externalsrc` class supports building software from source code
 that is external to the OpenEmbedded build system. Building software
 from an external source tree means that the build system's normal fetch,
 unpack, and patch process is not used.
@@ -578,7 +577,7 @@ unpack, and patch process is not used.
 By default, the OpenEmbedded build system uses the :term:`S`
 and :term:`B` variables to locate unpacked recipe source code
 and to build it, respectively. When your recipe inherits the
-:ref:`externalsrc <ref-classes-externalsrc>` class, you use the
+:ref:`ref-classes-externalsrc` class, you use the
 :term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD` variables to
 ultimately define :term:`S` and :term:`B`.
 
@@ -594,10 +593,9 @@ See these variables for more information:
 :term:`WORKDIR`, :term:`BPN`, and
 :term:`PV`,
 
-For more information on the :ref:`externalsrc <ref-classes-externalsrc>` class, see the comments in
+For more information on the :ref:`ref-classes-externalsrc` class, see the comments in
 ``meta/classes/externalsrc.bbclass`` in the :term:`Source Directory`.
-For information on how to use the
-:ref:`externalsrc <ref-classes-externalsrc>` class, see the
+For information on how to use the :ref:`ref-classes-externalsrc` class, see the
 ":ref:`dev-manual/building:building software from an external source`"
 section in the Yocto Project Development Tasks Manual.
 
@@ -606,7 +604,7 @@ section in the Yocto Project Development Tasks Manual.
 ``extrausers``
 ==============
 
-The :ref:`extrausers <ref-classes-extrausers>` class allows additional user and group configuration
+The :ref:`ref-classes-extrausers` class allows additional user and group configuration
 to be applied at the image level. Inheriting this class either globally
 or from an image recipe allows additional user and group operations to
 be performed using the
@@ -614,13 +612,11 @@ be performed using the
 
 .. note::
 
-   The user and group operations added using the
-   :ref:`extrausers <ref-classes-extrausers>`
+   The user and group operations added using the :ref:`ref-classes-extrausers`
    class are not tied to a specific recipe outside of the recipe for the
    image. Thus, the operations can be performed across the image as a
-   whole. Use the
-   :ref:`useradd <ref-classes-useradd>`
-   class to add user and group configuration to a specific recipe.
+   whole. Use the :ref:`ref-classes-useradd` class to add user and group
+   configuration to a specific recipe.
 
 Here is an example that uses this class in an image recipe::
 
@@ -668,9 +664,9 @@ Finally, here is an example that sets the root password::
 ``features_check``
 ==================
 
-The :ref:`features_check <ref-classes-features_check>` class allows individual recipes to check
-for required and conflicting
-:term:`DISTRO_FEATURES`, :term:`MACHINE_FEATURES` or :term:`COMBINED_FEATURES`.
+The :ref:`ref-classes-features_check` class allows individual recipes to check
+for required and conflicting :term:`DISTRO_FEATURES`, :term:`MACHINE_FEATURES`
+or :term:`COMBINED_FEATURES`.
 
 This class provides support for the following variables:
 
@@ -694,7 +690,7 @@ triggered.
 ``fontcache``
 =============
 
-The :ref:`fontcache <ref-classes-fontcache>` class generates the proper post-install and
+The :ref:`ref-classes-fontcache` class generates the proper post-install and
 post-remove (postinst and postrm) scriptlets for font packages. These
 scriptlets call ``fc-cache`` (part of ``Fontconfig``) to add the fonts
 to the font information cache. Since the cache files are
@@ -710,9 +706,9 @@ packages containing the fonts.
 ``fs-uuid``
 ===========
 
-The :ref:`fs-uuid <ref-classes-fs-uuid>` class extracts UUID from
+The :ref:`ref-classes-fs-uuid` class extracts UUID from
 ``${``\ :term:`ROOTFS`\ ``}``, which must have been built
-by the time that this function gets called. The :ref:`fs-uuid <ref-classes-fs-uuid>` class only
+by the time that this function gets called. The :ref:`ref-classes-fs-uuid` class only
 works on ``ext`` file systems and depends on ``tune2fs``.
 
 .. _ref-classes-gconf:
@@ -720,7 +716,7 @@ works on ``ext`` file systems and depends on ``tune2fs``.
 ``gconf``
 =========
 
-The :ref:`gconf <ref-classes-gconf>` class provides common functionality for recipes that need
+The :ref:`ref-classes-gconf` class provides common functionality for recipes that need
 to install GConf schemas. The schemas will be put into a separate
 package (``${``\ :term:`PN`\ ``}-gconf``) that is created
 automatically when this class is inherited. This package uses the
@@ -732,7 +728,7 @@ register and unregister the schemas in the target image.
 ``gettext``
 ===========
 
-The :ref:`gettext <ref-classes-gettext>` class provides support for building
+The :ref:`ref-classes-gettext` class provides support for building
 software that uses the GNU ``gettext`` internationalization and localization
 system. All recipes building software that use ``gettext`` should inherit this
 class.
@@ -742,11 +738,11 @@ class.
 ``github-releases``
 ===================
 
-For recipes that fetch release tarballs from github, the :ref:`github-releases <ref-classes-github-releases>`
+For recipes that fetch release tarballs from github, the :ref:`ref-classes-github-releases`
 class sets up a standard way for checking available upstream versions
 (to support ``devtool upgrade`` and the Automated Upgrade Helper (AUH)).
 
-To use it, add ":ref:`github-releases <ref-classes-github-releases>`" to the inherit line in the recipe,
+To use it, add ":ref:`ref-classes-github-releases`" to the inherit line in the recipe,
 and if the default value of :term:`GITHUB_BASE_URI` is not suitable,
 then set your own value in the recipe. You should then use ``${GITHUB_BASE_URI}``
 in the value you set for :term:`SRC_URI` within the recipe.
@@ -756,7 +752,7 @@ in the value you set for :term:`SRC_URI` within the recipe.
 ``gnomebase``
 =============
 
-The :ref:`gnomebase <ref-classes-gnomebase>` class is the base class for recipes that build
+The :ref:`ref-classes-gnomebase` class is the base class for recipes that build
 software from the GNOME stack. This class sets
 :term:`SRC_URI` to download the source from the GNOME
 mirrors as well as extending :term:`FILES` with the typical
@@ -785,7 +781,7 @@ introspection. This functionality is only enabled if the
 ``grub-efi``
 ============
 
-The :ref:`grub-efi <ref-classes-grub-efi>` class provides ``grub-efi``-specific functions for
+The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific functions for
 building bootable images.
 
 This class supports several variables:
@@ -817,7 +813,7 @@ This class supports several variables:
 ``gsettings``
 =============
 
-The :ref:`gsettings <ref-classes-gsettings>` class provides common functionality for recipes that
+The :ref:`ref-classes-gsettings` class provides common functionality for recipes that
 need to install GSettings (glib) schemas. The schemas are assumed to be
 part of the main package. Appropriate post-install and post-remove
 (postinst/postrm) scriptlets are added to register and unregister the
@@ -828,7 +824,7 @@ schemas in the target image.
 ``gtk-doc``
 ===========
 
-The :ref:`gtk-doc <ref-classes-gtk-doc>` class is a helper class to pull in the appropriate
+The :ref:`ref-classes-gtk-doc` class is a helper class to pull in the appropriate
 ``gtk-doc`` dependencies and disable ``gtk-doc``.
 
 .. _ref-classes-gtk-icon-cache:
@@ -836,7 +832,7 @@ The :ref:`gtk-doc <ref-classes-gtk-doc>` class is a helper class to pull in the
 ``gtk-icon-cache``
 ==================
 
-The :ref:`gtk-icon-cache <ref-classes-gtk-icon-cache>` class generates the proper post-install and
+The :ref:`ref-classes-gtk-icon-cache` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that use GTK+ and
 install icons. These scriptlets call ``gtk-update-icon-cache`` to add
 the fonts to GTK+'s icon cache. Since the cache files are
@@ -849,7 +845,7 @@ creation.
 ``gtk-immodules-cache``
 =======================
 
-The :ref:`gtk-immodules-cache <ref-classes-gtk-immodules-cache>` class generates the proper post-install and
+The :ref:`ref-classes-gtk-immodules-cache` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install GTK+
 input method modules for virtual keyboards. These scriptlets call
 ``gtk-update-icon-cache`` to add the input method modules to the cache.
@@ -867,7 +863,7 @@ the packages containing the modules.
 ``gzipnative``
 ==============
 
-The :ref:`gzipnative <ref-classes-gzipnative>` class enables the use of different native versions of
+The :ref:`ref-classes-gzipnative` class enables the use of different native versions of
 ``gzip`` and ``pigz`` rather than the versions of these tools from the
 build host.
 
@@ -876,7 +872,7 @@ build host.
 ``icecc``
 =========
 
-The :ref:`icecc <ref-classes-icecc>` class supports
+The :ref:`ref-classes-icecc` class supports
 `Icecream <https://github.com/icecc/icecream>`__, which facilitates
 taking compile jobs and distributing them among remote machines.
 
@@ -924,13 +920,13 @@ Additionally, you can list recipes using the
 your ``local.conf`` file to force ``icecc`` to be enabled for recipes
 using an empty :term:`PARALLEL_MAKE` variable.
 
-Inheriting the :ref:`icecc <ref-classes-icecc>` class changes all sstate signatures.
+Inheriting the :ref:`ref-classes-icecc` class changes all sstate signatures.
 Consequently, if a development team has a dedicated build system that
 populates :term:`SSTATE_MIRRORS` and they want to
 reuse sstate from :term:`SSTATE_MIRRORS`, then all developers and the build
-system need to either inherit the :ref:`icecc <ref-classes-icecc>` class or nobody should.
+system need to either inherit the :ref:`ref-classes-icecc` class or nobody should.
 
-At the distribution level, you can inherit the :ref:`icecc <ref-classes-icecc>` class to be
+At the distribution level, you can inherit the :ref:`ref-classes-icecc` class to be
 sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
 :term:`ICECC_DISABLED` variable to "1" as follows::
@@ -950,7 +946,7 @@ individually as follows in your ``local.conf`` file::
 ``image``
 =========
 
-The :ref:`image <ref-classes-image>` class helps support creating images in different formats.
+The :ref:`ref-classes-image` class helps support creating images in different formats.
 First, the root filesystem is created from packages using one of the
 ``rootfs*.bbclass`` files (depending on the package format used) and
 then one or more image files are created.
@@ -973,7 +969,7 @@ Yocto Project Overview and Concepts Manual.
 ``image-buildinfo``
 ===================
 
-The :ref:`image-buildinfo <ref-classes-image-buildinfo>` class writes a plain text file containing
+The :ref:`ref-classes-image-buildinfo` class writes a plain text file containing
 build information to the target filesystem at ``${sysconfdir}/buildinfo``
 by default (as specified by :term:`IMAGE_BUILDINFO_FILE`).
 This can be useful for manually determining the origin of any given
@@ -995,14 +991,14 @@ to ``/buildinfo`` by default (as specified by
 ``image_types``
 ===============
 
-The :ref:`image_types <ref-classes-image_types>` class defines all of the standard image output types
+The :ref:`ref-classes-image_types` class defines all of the standard image output types
 that you can enable through the
 :term:`IMAGE_FSTYPES` variable. You can use this
 class as a reference on how to add support for custom image output
 types.
 
-By default, the :ref:`image <ref-classes-image>` class automatically
-enables the :ref:`image_types <ref-classes-image_types>` class. The :ref:`image <ref-classes-image>` class uses the
+By default, the :ref:`ref-classes-image` class automatically
+enables the :ref:`ref-classes-image_types` class. The :ref:`ref-classes-image` class uses the
 ``IMGCLASSES`` variable as follows::
 
    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
@@ -1014,7 +1010,7 @@ enables the :ref:`image_types <ref-classes-image_types>` class. The :ref:`image
    IMGCLASSES += "image-postinst-intercepts"
    inherit ${IMGCLASSES}
 
-The :ref:`image_types <ref-classes-image_types>` class also handles conversion and compression of images.
+The :ref:`ref-classes-image_types` class also handles conversion and compression of images.
 
 .. note::
 
@@ -1040,7 +1036,7 @@ Normally, you do not use this class directly. Instead, you add "live" to
 ``insane``
 ==========
 
-The :ref:`insane <ref-classes-insane>` class adds a step to the package generation process so
+The :ref:`ref-classes-insane` class adds a step to the package generation process so
 that output quality assurance checks are generated by the OpenEmbedded
 build system. A range of checks are performed that check the build's
 output for common problems that show up during runtime. Distribution
@@ -1100,7 +1096,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
    the package is installed into the image during the
    :ref:`ref-tasks-rootfs` task because the auto-detected
    dependency was not satisfied. An example of this would be where the
-   :ref:`update-rc.d <ref-classes-update-rc.d>` class automatically
+   :ref:`ref-classes-update-rc.d` class automatically
    adds a dependency on the ``initscripts-functions`` package to
    packages that install an initscript that refers to
    ``/etc/init.d/functions``. The recipe should really have an explicit
@@ -1340,7 +1336,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
 ``insserv``
 ===========
 
-The :ref:`insserv <ref-classes-insserv>` class uses the ``insserv`` utility to update the order
+The :ref:`ref-classes-insserv` class uses the ``insserv`` utility to update the order
 of symbolic links in ``/etc/rc?.d/`` within an image based on
 dependencies specified by LSB headers in the ``init.d`` scripts
 themselves.
@@ -1350,10 +1346,10 @@ themselves.
 ``kernel``
 ==========
 
-The :ref:`kernel <ref-classes-kernel>` class handles building Linux kernels. The class contains
+The :ref:`ref-classes-kernel` class handles building Linux kernels. The class contains
 code to build all kernel trees. All needed headers are staged into the
 :term:`STAGING_KERNEL_DIR` directory to allow out-of-tree module builds
-using the :ref:`module <ref-classes-module>` class.
+using the :ref:`ref-classes-module` class.
 
 This means that each built kernel module is packaged separately and
 inter-module dependencies are created by parsing the ``modinfo`` output.
@@ -1361,23 +1357,22 @@ If all modules are required, then installing the ``kernel-modules``
 package installs all packages with modules and various other kernel
 packages such as ``kernel-vmlinux``.
 
-The :ref:`kernel <ref-classes-kernel>` class contains logic that allows you to embed an initial
+The :ref:`ref-classes-kernel` class contains logic that allows you to embed an initial
 RAM filesystem (:term:`Initramfs`) image when you build the kernel image. For
 information on how to build an :term:`Initramfs`, see the
 ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section in
 the Yocto Project Development Tasks Manual.
 
-Various other classes are used by the :ref:`kernel <ref-classes-kernel>` and :ref:`module <ref-classes-module>` classes
-internally including the :ref:`kernel-arch <ref-classes-kernel-arch>`,
-:ref:`module-base <ref-classes-module-base>`, and
-:ref:`linux-kernel-base <ref-classes-linux-kernel-base>` classes.
+Various other classes are used by the :ref:`ref-classes-kernel` and :ref:`ref-classes-module` classes
+internally including the :ref:`ref-classes-kernel-arch`, :ref:`ref-classes-module-base`, and
+:ref:`ref-classes-linux-kernel-base` classes.
 
 .. _ref-classes-kernel-arch:
 
 ``kernel-arch``
 ===============
 
-The :ref:`kernel-arch <ref-classes-kernel-arch>` class sets the ``ARCH`` environment variable for
+The :ref:`ref-classes-kernel-arch` class sets the ``ARCH`` environment variable for
 Linux kernel compilation (including modules).
 
 .. _ref-classes-kernel-devicetree:
@@ -1385,26 +1380,25 @@ Linux kernel compilation (including modules).
 ``kernel-devicetree``
 =====================
 
-The :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class, which is inherited by the
-:ref:`kernel <ref-classes-kernel>` class, supports device tree
-generation.
+The :ref:`ref-classes-kernel-devicetree` class, which is inherited by the
+:ref:`ref-classes-kernel` class, supports device tree generation.
 
 .. _ref-classes-kernel-fitimage:
 
 ``kernel-fitimage``
 ===================
 
-The :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class provides support to pack a kernel image,
+The :ref:`ref-classes-kernel-fitimage` class provides support to pack a kernel image,
 device trees, a U-boot script, a :term:`Initramfs` bundle and a RAM disk
 into a single FIT image. In theory, a FIT image can support any number
 of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and device-trees.
-However, :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` currently only supports
+However, :ref:`ref-classes-kernel-fitimage` currently only supports
 limited usecases: just one kernel image, an optional U-boot script,
 an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
 device tree.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
-is set to include ":ref:`kernel-fitimage <ref-classes-kernel-fitimage>`" and :term:`KERNEL_IMAGETYPE`
+is set to include ":ref:`ref-classes-kernel-fitimage`" and :term:`KERNEL_IMAGETYPE`
 is set to "fitImage".
 
 The options for the device tree compiler passed to ``mkimage -D``
@@ -1412,19 +1406,19 @@ when creating the FIT image are specified using the
 :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
 
 Only a single kernel can be added to the FIT image created by
-:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the kernel image in FIT is mandatory. The
+:ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandatory. The
 address where the kernel image is to be loaded by U-Boot is
 specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_ENTRYPOINT`.
 
 Multiple device trees can be added to the FIT image created by
-:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the device tree is optional.
+:ref:`ref-classes-kernel-fitimage` and the device tree is optional.
 The address where the device tree is to be loaded by U-Boot is
 specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
 and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
 
 Only a single RAM disk can be added to the FIT image created by
-:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the RAM disk in FIT is optional.
+:ref:`ref-classes-kernel-fitimage` and the RAM disk in FIT is optional.
 The address where the RAM disk image is to be loaded by U-Boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to FIT image when
@@ -1432,7 +1426,7 @@ is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 is set to 0.
 
 Only a single :term:`Initramfs` bundle can be added to the FIT image created by
-:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the :term:`Initramfs` bundle in FIT is optional.
+:ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in FIT is optional.
 In case of :term:`Initramfs`, the kernel is configured to be bundled with the root filesystem
 in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
 When the kernel is copied to RAM and executed, it unpacks the :term:`Initramfs` root filesystem.
@@ -1442,21 +1436,21 @@ The address where the :term:`Initramfs` bundle is to be loaded by U-boot is spec
 by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
 
 Only a single U-boot boot script can be added to the FIT image created by
-:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the boot script is optional.
+:ref:`ref-classes-kernel-fitimage` and the boot script is optional.
 The boot script is specified in the ITS file as a text file containing
 U-boot commands. When using a boot script the user should configure the
 U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
-So the script can be included in the FIT image by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
+So the script can be included in the FIT image by the :ref:`ref-classes-kernel-fitimage`
 class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
 load the boot script from the FIT image and executes it.
 
-The FIT image generated by :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class is signed when the
+The FIT image generated by :ref:`ref-classes-kernel-fitimage` class is signed when the
 variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
 :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
 appropriately. The default values used for :term:`FIT_HASH_ALG` and
-:term:`FIT_SIGN_ALG` in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` are "sha256" and
+:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fitimage` are "sha256" and
 "rsa2048" respectively. The keys for signing fitImage can be generated using
-the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class when both :term:`FIT_GENERATE_KEYS` and
+the :ref:`ref-classes-kernel-fitimage` class when both :term:`FIT_GENERATE_KEYS` and
 :term:`UBOOT_SIGN_ENABLE` are set to "1".
 
 
@@ -1465,7 +1459,7 @@ the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class when both :term:`
 ``kernel-grub``
 ===============
 
-The :ref:`kernel-grub <ref-classes-kernel-grub>` class updates the boot area and the boot menu with
+The :ref:`ref-classes-kernel-grub` class updates the boot area and the boot menu with
 the kernel as the priority boot mechanism while installing a RPM to
 update the kernel on a deployed target.
 
@@ -1474,7 +1468,7 @@ update the kernel on a deployed target.
 ``kernel-module-split``
 =======================
 
-The :ref:`kernel-module-split <ref-classes-kernel-module-split>` class provides common functionality for
+The :ref:`ref-classes-kernel-module-split` class provides common functionality for
 splitting Linux kernel modules into separate packages.
 
 .. _ref-classes-kernel-uboot:
@@ -1482,7 +1476,7 @@ splitting Linux kernel modules into separate packages.
 ``kernel-uboot``
 ================
 
-The :ref:`kernel-uboot <ref-classes-kernel-uboot>` class provides support for building from
+The :ref:`ref-classes-kernel-uboot` class provides support for building from
 vmlinux-style kernel sources.
 
 .. _ref-classes-kernel-uimage:
@@ -1490,14 +1484,14 @@ vmlinux-style kernel sources.
 ``kernel-uimage``
 =================
 
-The :ref:`kernel-uimage <ref-classes-kernel-uimage>` class provides support to pack uImage.
+The :ref:`ref-classes-kernel-uimage` class provides support to pack uImage.
 
 .. _ref-classes-kernel-yocto:
 
 ``kernel-yocto``
 ================
 
-The :ref:`kernel-yocto <ref-classes-kernel-yocto>` class provides common functionality for building
+The :ref:`ref-classes-kernel-yocto` class provides common functionality for building
 from linux-yocto style kernel source repositories.
 
 .. _ref-classes-kernelsrc:
@@ -1505,14 +1499,14 @@ from linux-yocto style kernel source repositories.
 ``kernelsrc``
 =============
 
-The :ref:`kernelsrc <ref-classes-kernelsrc>` class sets the Linux kernel source and version.
+The :ref:`ref-classes-kernelsrc` class sets the Linux kernel source and version.
 
 .. _ref-classes-lib_package:
 
 ``lib_package``
 ===============
 
-The :ref:`lib_package <ref-classes-lib_package>` class supports recipes that build libraries and
+The :ref:`ref-classes-lib_package` class supports recipes that build libraries and
 produce executable binaries, where those binaries should not be
 installed by default along with the library. Instead, the binaries are
 added to a separate ``${``\ :term:`PN`\ ``}-bin`` package to
@@ -1523,7 +1517,7 @@ make their installation optional.
 ``libc*``
 =========
 
-The :ref:`libc* <ref-classes-libc*>` classes support recipes that build packages with ``libc``:
+The :ref:`ref-classes-libc*` classes support recipes that build packages with ``libc``:
 
 -  The :ref:`libc-common <ref-classes-libc*>` class provides common support for building with
    ``libc``.
@@ -1536,7 +1530,7 @@ The :ref:`libc* <ref-classes-libc*>` classes support recipes that build packages
 ``license``
 ===========
 
-The :ref:`license <ref-classes-license>` class provides license manifest creation and license
+The :ref:`ref-classes-license` class provides license manifest creation and license
 exclusion. This class is enabled by default using the default value for
 the :term:`INHERIT_DISTRO` variable.
 
@@ -1545,7 +1539,7 @@ the :term:`INHERIT_DISTRO` variable.
 ``linux-kernel-base``
 =====================
 
-The :ref:`linux-kernel-base <ref-classes-linux-kernel-base>` class provides common functionality for
+The :ref:`ref-classes-linux-kernel-base` class provides common functionality for
 recipes that build out of the Linux kernel source tree. These builds
 goes beyond the kernel itself. For example, the Perf recipe also
 inherits this class.
@@ -1564,11 +1558,11 @@ number of other classes.
 ``logging``
 ===========
 
-The :ref:`logging <ref-classes-logging>` class provides the standard shell functions used to log
+The :ref:`ref-classes-logging` class provides the standard shell functions used to log
 messages for various BitBake severity levels (i.e. ``bbplain``,
 ``bbnote``, ``bbwarn``, ``bberror``, ``bbfatal``, and ``bbdebug``).
 
-This class is enabled by default since it is inherited by the :ref:`base <ref-classes-base>`
+This class is enabled by default since it is inherited by the :ref:`ref-classes-base`
 class.
 
 .. _ref-classes-metadata_scm:
@@ -1576,20 +1570,20 @@ class.
 ``metadata_scm``
 ================
 
-The :ref:`metadata_scm <ref-classes-metadata_scm>` class provides functionality for querying the
+The :ref:`ref-classes-metadata_scm` class provides functionality for querying the
 branch and revision of a Source Code Manager (SCM) repository.
 
-The :ref:`base <ref-classes-base>` class uses this class to print the
-revisions of each layer before starting every build. The
-:ref:`metadata_scm <ref-classes-metadata_scm>` class is enabled by default because it is inherited by
-the :ref:`base <ref-classes-base>` class.
+The :ref:`ref-classes-base` class uses this class to print the revisions of
+each layer before starting every build. The :ref:`ref-classes-metadata_scm`
+class is enabled by default because it is inherited by the
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-migrate_localcount:
 
 ``migrate_localcount``
 ======================
 
-The :ref:`migrate_localcount <ref-classes-migrate_localcount>` class verifies a recipe's localcount data and
+The :ref:`ref-classes-migrate_localcount` class verifies a recipe's localcount data and
 increments it appropriately.
 
 .. _ref-classes-mime:
@@ -1597,7 +1591,7 @@ increments it appropriately.
 ``mime``
 ========
 
-The :ref:`mime <ref-classes-mime>` class generates the proper post-install and post-remove
+The :ref:`ref-classes-mime` class generates the proper post-install and post-remove
 (postinst/postrm) scriptlets for packages that install MIME type files.
 These scriptlets call ``update-mime-database`` to add the MIME types to
 the shared database.
@@ -1607,7 +1601,7 @@ the shared database.
 ``mime-xdg``
 ============
 
-The :ref:`mime-xdg <ref-classes-mime-xdg>` class generates the proper
+The :ref:`ref-classes-mime-xdg` class generates the proper
 post-install and post-remove (postinst/postrm) scriptlets for packages
 that install ``.desktop`` files containing ``MimeType`` entries.
 These scriptlets call ``update-desktop-database`` to add the MIME types
@@ -1628,25 +1622,23 @@ package names to the :term:`MIME_XDG_PACKAGES` variable.
 ``mirrors``
 ===========
 
-The :ref:`mirrors <ref-classes-mirrors>` class sets up some standard
+The :ref:`ref-classes-mirrors` class sets up some standard
 :term:`MIRRORS` entries for source code mirrors. These
 mirrors provide a fall-back path in case the upstream source specified
 in :term:`SRC_URI` within recipes is unavailable.
 
 This class is enabled by default since it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-module:
 
 ``module``
 ==========
 
-The :ref:`module <ref-classes-module>` class provides support for building out-of-tree Linux
-kernel modules. The class inherits the
-:ref:`module-base <ref-classes-module-base>` and
-:ref:`kernel-module-split <ref-classes-kernel-module-split>` classes,
-and implements the :ref:`ref-tasks-compile` and
-:ref:`ref-tasks-install` tasks. The class provides
+The :ref:`ref-classes-module` class provides support for building out-of-tree Linux
+kernel modules. The class inherits the :ref:`ref-classes-module-base` and
+:ref:`ref-classes-kernel-module-split` classes, and implements the
+:ref:`ref-tasks-compile` and :ref:`ref-tasks-install` tasks. The class provides
 everything needed to build and package a kernel module.
 
 For general information on out-of-tree Linux kernel modules, see the
@@ -1658,18 +1650,18 @@ section in the Yocto Project Linux Kernel Development Manual.
 ``module-base``
 ===============
 
-The :ref:`module-base <ref-classes-module-base>` class provides the base functionality for building
-Linux kernel modules. Typically, a recipe that builds software that
-includes one or more kernel modules and has its own means of building
-the module inherits this class as opposed to inheriting the
-:ref:`module <ref-classes-module>` class.
+The :ref:`ref-classes-module-base` class provides the base functionality for
+building Linux kernel modules. Typically, a recipe that builds software that
+includes one or more kernel modules and has its own means of building the module
+inherits this class as opposed to inheriting the :ref:`ref-classes-module`
+class.
 
 .. _ref-classes-multilib*:
 
 ``multilib*``
 =============
 
-The :ref:`multilib* <ref-classes-multilib*>` classes provide support for building libraries with
+The :ref:`ref-classes-multilib*` classes provide support for building libraries with
 different target optimizations or target architectures and installing
 them side-by-side in the same image.
 
@@ -1682,17 +1674,17 @@ section in the Yocto Project Development Tasks Manual.
 ``native``
 ==========
 
-The :ref:`native <ref-classes-native>` class provides common functionality for recipes that
+The :ref:`ref-classes-native` class provides common functionality for recipes that
 build tools to run on the :term:`Build Host` (i.e. tools that use the compiler
 or other tools from the build host).
 
 You can create a recipe that builds tools that run natively on the host
 a couple different ways:
 
--  Create a ``myrecipe-native.bb`` recipe that inherits the :ref:`native <ref-classes-native>`
+-  Create a ``myrecipe-native.bb`` recipe that inherits the :ref:`ref-classes-native`
    class. If you use this method, you must order the inherit statement
    in the recipe after all other inherit statements so that the
-   :ref:`native <ref-classes-native>` class is inherited last.
+   :ref:`ref-classes-native` class is inherited last.
 
    .. note::
 
@@ -1714,7 +1706,7 @@ a couple different ways:
    specify any functionality specific to the respective native or target
    case.
 
-Although applied differently, the :ref:`native <ref-classes-native>` class is used with both
+Although applied differently, the :ref:`ref-classes-native` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for native and
 target. All common parts of the recipe are automatically shared.
@@ -1724,7 +1716,7 @@ target. All common parts of the recipe are automatically shared.
 ``nativesdk``
 =============
 
-The :ref:`nativesdk <ref-classes-nativesdk>` class provides common functionality for recipes that
+The :ref:`ref-classes-nativesdk` class provides common functionality for recipes that
 wish to build tools to run as part of an SDK (i.e. tools that run on
 :term:`SDKMACHINE`).
 
@@ -1732,11 +1724,11 @@ You can create a recipe that builds tools that run on the SDK machine a
 couple different ways:
 
 -  Create a ``nativesdk-myrecipe.bb`` recipe that inherits the
-   :ref:`nativesdk <ref-classes-nativesdk>` class. If you use this method, you must order the
+   :ref:`ref-classes-nativesdk` class. If you use this method, you must order the
    inherit statement in the recipe after all other inherit statements so
-   that the :ref:`nativesdk <ref-classes-nativesdk>` class is inherited last.
+   that the :ref:`ref-classes-nativesdk` class is inherited last.
 
--  Create a :ref:`nativesdk <ref-classes-nativesdk>` variant of any recipe by adding the following::
+-  Create a :ref:`ref-classes-nativesdk` variant of any recipe by adding the following::
 
        BBCLASSEXTEND = "nativesdk"
 
@@ -1755,7 +1747,7 @@ couple different ways:
    Not doing so can lead to subtle problems because there is code that
    depends on the naming convention.
 
-Although applied differently, the :ref:`nativesdk <ref-classes-nativesdk>` class is used with both
+Although applied differently, the :ref:`ref-classes-nativesdk` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for the SDK machine
 and the target. All common parts of the recipe are automatically shared.
@@ -1790,11 +1782,11 @@ section in the Yocto Project Development Tasks Manual.
 ``oelint``
 ==========
 
-The :ref:`oelint <ref-classes-oelint>` class is an obsolete lint checking tool available in
+The :ref:`ref-classes-oelint` class is an obsolete lint checking tool available in
 ``meta/classes`` in the :term:`Source Directory`.
 
 There are some classes that could be generally useful in OE-Core but
-are never actually used within OE-Core itself. The :ref:`oelint <ref-classes-oelint>` class is
+are never actually used within OE-Core itself. The :ref:`ref-classes-oelint` class is
 one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
@@ -1808,7 +1800,7 @@ It's often desired in Embedded System design to have a read-only root filesystem
 But a lot of different applications might want to have read-write access to
 some parts of a filesystem. It can be especially useful when your update mechanism
 overwrites the whole root filesystem, but you may want your application data to be preserved
-between updates. The :ref:`overlayfs <ref-classes-overlayfs>` class provides a way
+between updates. The :ref:`ref-classes-overlayfs` class provides a way
 to achieve that by means of ``overlayfs`` and at the same time keeping the base
 root filesystem read-only.
 
@@ -1848,7 +1840,7 @@ and then in your recipe::
 On a practical note, your application recipe might require multiple
 overlays to be mounted before running to avoid writing to the underlying
 file system (which can be forbidden in case of read-only file system)
-To achieve that :ref:`overlayfs <ref-classes-overlayfs>` provides a ``systemd``
+To achieve that :ref:`ref-classes-overlayfs` provides a ``systemd``
 helper service for mounting overlays. This helper service is named
 ``${PN}-overlays.service`` and can be depended on in your application recipe
 (named ``application`` in the following example) ``systemd`` unit by adding
@@ -1861,7 +1853,7 @@ to the unit the following::
 .. note::
 
    The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
-   In order to get ``/etc`` in overlayfs, see :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`.
+   In order to get ``/etc`` in overlayfs, see :ref:`ref-classes-overlayfs-etc`.
 
 .. _ref-classes-overlayfs-etc:
 
@@ -1913,7 +1905,7 @@ The class provides two options for ``/sbin/init`` generation:
 ``own-mirrors``
 ===============
 
-The :ref:`own-mirrors <ref-classes-own-mirrors>` class makes it easier to set up your own
+The :ref:`ref-classes-own-mirrors` class makes it easier to set up your own
 :term:`PREMIRRORS` from which to first fetch source
 before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.
@@ -1932,18 +1924,16 @@ in :term:`SOURCE_MIRROR_URL`.
 ``package``
 ===========
 
-The :ref:`package <ref-classes-package>` class supports generating packages from a build's
+The :ref:`ref-classes-package` class supports generating packages from a build's
 output. The core generic functionality is in ``package.bbclass``. The
 code specific to particular package types resides in these
-package-specific classes:
-:ref:`package_deb <ref-classes-package_deb>`,
-:ref:`package_rpm <ref-classes-package_rpm>`,
-:ref:`package_ipk <ref-classes-package_ipk>`, and
-:ref:`package_tar <ref-classes-package_tar>`.
+package-specific classes: :ref:`ref-classes-package_deb`,
+:ref:`ref-classes-package_rpm`, :ref:`ref-classes-package_ipk`, and
+:ref:`ref-classes-package_tar`.
 
 .. note::
 
-   The :ref:`package_tar <ref-classes-package_tar>` class is broken and
+   The :ref:`ref-classes-package_tar` class is broken and
    not supported. It is recommended that you do not use this class.
 
 You can control the list of resulting package formats by using the
@@ -1969,7 +1959,7 @@ complete build of the package with all dependencies previously built.
 The reason for this discrepancy is because the RPM package manager
 creates and processes more :term:`Metadata` than the IPK package
 manager. Consequently, you might consider setting :term:`PACKAGE_CLASSES` to
-":ref:`package_ipk <ref-classes-package_ipk>`" if you are building smaller systems.
+":ref:`ref-classes-package_ipk`" if you are building smaller systems.
 
 Before making your package manager decision, however, you should
 consider some further things about using RPM:
@@ -1997,12 +1987,12 @@ at these two Yocto Project mailing list links:
 ``package_deb``
 ===============
 
-The :ref:`package_deb <ref-classes-package_deb>` class provides support for creating packages that
+The :ref:`ref-classes-package_deb` class provides support for creating packages that
 use the Debian (i.e. ``.deb``) file format. The class ensures the
 packages are written out in a ``.deb`` file format to the
 ``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
@@ -2011,12 +2001,12 @@ variable in the ``local.conf`` file.
 ``package_ipk``
 ===============
 
-The :ref:`package_ipk <ref-classes-package_ipk>` class provides support for creating packages that
+The :ref:`ref-classes-package_ipk` class provides support for creating packages that
 use the IPK (i.e. ``.ipk``) file format. The class ensures the packages
 are written out in a ``.ipk`` file format to the
 ``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
@@ -2025,12 +2015,12 @@ variable in the ``local.conf`` file.
 ``package_rpm``
 ===============
 
-The :ref:`package_rpm <ref-classes-package_rpm>` class provides support for creating packages that
+The :ref:`ref-classes-package_rpm` class provides support for creating packages that
 use the RPM (i.e. ``.rpm``) file format. The class ensures the packages
 are written out in a ``.rpm`` file format to the
 ``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
@@ -2039,17 +2029,17 @@ variable in the ``local.conf`` file.
 ``package_tar``
 ===============
 
-The :ref:`package_tar <ref-classes-package_tar>` class provides support for creating tarballs. The
+The :ref:`ref-classes-package_tar` class provides support for creating tarballs. The
 class ensures the packages are written out in a tarball format to the
 ``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
 .. note::
 
-   You cannot specify the :ref:`package_tar <ref-classes-package_tar>` class first using the
+   You cannot specify the :ref:`ref-classes-package_tar` class first using the
    :term:`PACKAGE_CLASSES` variable. You must use ``.deb``, ``.ipk``, or ``.rpm``
    file formats for your image or SDK.
 
@@ -2058,20 +2048,20 @@ variable in the ``local.conf`` file.
 ``packagedata``
 ===============
 
-The :ref:`packagedata <ref-classes-packagedata>` class provides common functionality for reading
+The :ref:`ref-classes-packagedata` class provides common functionality for reading
 ``pkgdata`` files found in :term:`PKGDATA_DIR`. These
 files contain information about each output package produced by the
 OpenEmbedded build system.
 
 This class is enabled by default because it is inherited by the
-:ref:`package <ref-classes-package>` class.
+:ref:`ref-classes-package` class.
 
 .. _ref-classes-packagegroup:
 
 ``packagegroup``
 ================
 
-The :ref:`packagegroup <ref-classes-packagegroup>` class sets default values appropriate for package
+The :ref:`ref-classes-packagegroup` class sets default values appropriate for package
 group recipes (e.g. :term:`PACKAGES`, :term:`PACKAGE_ARCH`, :term:`ALLOW_EMPTY`, and
 so forth). It is highly recommended that all package group recipes
 inherit this class.
@@ -2087,18 +2077,18 @@ Previously, this class was called the ``task`` class.
 ``patch``
 =========
 
-The :ref:`patch <ref-classes-patch>` class provides all functionality for applying patches
+The :ref:`ref-classes-patch` class provides all functionality for applying patches
 during the :ref:`ref-tasks-patch` task.
 
 This class is enabled by default because it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-perlnative:
 
 ``perlnative``
 ==============
 
-When inherited by a recipe, the :ref:`perlnative <ref-classes-perlnative>` class supports using the
+When inherited by a recipe, the :ref:`ref-classes-perlnative` class supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
 
@@ -2107,14 +2097,14 @@ version provided by the build host.
 ``pypi``
 ========
 
-The :ref:`pypi <ref-classes-pypi>` class sets variables appropriately for recipes that build
+The :ref:`ref-classes-pypi` class sets variables appropriately for recipes that build
 Python modules from `PyPI <https://pypi.org/>`__, the Python Package Index.
 By default it determines the PyPI package name based upon :term:`BPN`
 (stripping the "python-" or "python3-" prefix off if present), however in
 some cases you may need to set it manually in the recipe by setting
 :term:`PYPI_PACKAGE`.
 
-Variables set by the :ref:`pypi <ref-classes-pypi>` class include :term:`SRC_URI`, :term:`SECTION`,
+Variables set by the :ref:`ref-classes-pypi` class include :term:`SRC_URI`, :term:`SECTION`,
 :term:`HOMEPAGE`, :term:`UPSTREAM_CHECK_URI`, :term:`UPSTREAM_CHECK_REGEX`
 and :term:`CVE_PRODUCT`.
 
@@ -2123,7 +2113,7 @@ and :term:`CVE_PRODUCT`.
 ``python_flit_core``
 ====================
 
-The :ref:`python_flit_core <ref-classes-python_flit_core>` class enables building Python modules which declare
+The :ref:`ref-classes-python_flit_core` class enables building Python modules which declare
 the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
 ``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
 section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
@@ -2131,40 +2121,39 @@ section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep
 Python modules built with ``flit_core.buildapi`` are pure Python (no
 ``C`` or ``Rust`` extensions).
 
-Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
+Internally this uses the :ref:`ref-classes-python_pep517` class.
 
 .. _ref-classes-python_pep517:
 
 ``python_pep517``
 =================
 
-The :ref:`python_pep517 <ref-classes-python_pep517>` class builds and installs a Python ``wheel`` binary
+The :ref:`ref-classes-python_pep517` class builds and installs a Python ``wheel`` binary
 archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
 
 Recipes wouldn't inherit this directly, instead typically another class will
 inherit this and add the relevant native dependencies.
 
-Examples of classes which do this are :ref:`python_flit_core
-<ref-classes-python_flit_core>`, :ref:`python_setuptools_build_meta
-<ref-classes-python_setuptools_build_meta>`, and :ref:`python_poetry_core
-<ref-classes-python_poetry_core>`.
+Examples of classes which do this are :ref:`ref-classes-python_flit_core`,
+:ref:`ref-classes-python_setuptools_build_meta`, and
+:ref:`ref-classes-python_poetry_core`.
 
 .. _ref-classes-python_poetry_core:
 
 ``python_poetry_core``
 ======================
 
-The :ref:`python_poetry_core <ref-classes-python_poetry_core>` class enables building Python modules which use the
+The :ref:`ref-classes-python_poetry_core` class enables building Python modules which use the
 `Poetry Core <https://python-poetry.org>`__ build system.
 
-Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
+Internally this uses the :ref:`ref-classes-python_pep517` class.
 
 .. _ref-classes-pixbufcache:
 
 ``pixbufcache``
 ===============
 
-The :ref:`pixbufcache <ref-classes-pixbufcache>` class generates the proper post-install and
+The :ref:`ref-classes-pixbufcache` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install
 pixbuf loaders, which are used with ``gdk-pixbuf``. These scriptlets
 call ``update_pixbuf_cache`` to add the pixbuf loaders to the cache.
@@ -2182,13 +2171,13 @@ containing the loaders.
 ``pkgconfig``
 =============
 
-The :ref:`pkgconfig <ref-classes-pkgconfig>` class provides a standard way to get header and
+The :ref:`ref-classes-pkgconfig` class provides a standard way to get header and
 library information by using ``pkg-config``. This class aims to smooth
 integration of ``pkg-config`` into libraries that use it.
 
 During staging, BitBake installs ``pkg-config`` data into the
 ``sysroots/`` directory. By making use of sysroot functionality within
-``pkg-config``, the :ref:`pkgconfig <ref-classes-pkgconfig>` class no longer has to manipulate the
+``pkg-config``, the :ref:`ref-classes-pkgconfig` class no longer has to manipulate the
 files.
 
 .. _ref-classes-populate-sdk:
@@ -2196,7 +2185,7 @@ files.
 ``populate_sdk``
 ================
 
-The :ref:`populate_sdk <ref-classes-populate-sdk>` class provides support for SDK-only recipes. For
+The :ref:`ref-classes-populate-sdk` class provides support for SDK-only recipes. For
 information on advantages gained when building a cross-development
 toolchain using the :ref:`ref-tasks-populate_sdk`
 task, see the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
@@ -2208,7 +2197,7 @@ Software Development Kit (eSDK) manual.
 ``populate_sdk_*``
 ==================
 
-The :ref:`populate_sdk_* <ref-classes-populate-sdk-*>` classes support SDK creation and consist of the
+The :ref:`ref-classes-populate-sdk-*` classes support SDK creation and consist of the
 following classes:
 
 -  :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`: The base class supporting SDK creation under
@@ -2265,7 +2254,7 @@ Software Development Kit (eSDK) manual.
 ``prexport``
 ============
 
-The :ref:`prexport <ref-classes-prexport>` class provides functionality for exporting
+The :ref:`ref-classes-prexport` class provides functionality for exporting
 :term:`PR` values.
 
 .. note::
@@ -2278,7 +2267,7 @@ The :ref:`prexport <ref-classes-prexport>` class provides functionality for expo
 ``primport``
 ============
 
-The :ref:`primport <ref-classes-primport>` class provides functionality for importing
+The :ref:`ref-classes-primport` class provides functionality for importing
 :term:`PR` values.
 
 .. note::
@@ -2291,13 +2280,13 @@ The :ref:`primport <ref-classes-primport>` class provides functionality for impo
 ``prserv``
 ==========
 
-The :ref:`prserv <ref-classes-prserv>` class provides functionality for using a :ref:`PR
+The :ref:`ref-classes-prserv` class provides functionality for using a :ref:`PR
 service <dev-manual/packages:working with a pr service>` in order to
 automatically manage the incrementing of the :term:`PR`
 variable for each recipe.
 
 This class is enabled by default because it is inherited by the
-:ref:`package <ref-classes-package>` class. However, the OpenEmbedded
+:ref:`ref-classes-package` class. However, the OpenEmbedded
 build system will not enable the functionality of this class unless
 :term:`PRSERV_HOST` has been set.
 
@@ -2306,7 +2295,7 @@ build system will not enable the functionality of this class unless
 ``ptest``
 =========
 
-The :ref:`ptest <ref-classes-ptest>` class provides functionality for packaging and installing
+The :ref:`ref-classes-ptest` class provides functionality for packaging and installing
 runtime tests for recipes that build software that provides these tests.
 
 This class is intended to be inherited by individual recipes. However,
@@ -2333,7 +2322,7 @@ section in the Yocto Project Development Tasks Manual.
 ``python3-dir``
 ===============
 
-The :ref:`python3-dir <ref-classes-python3-dir>` class provides the base version, location, and site
+The :ref:`ref-classes-python3-dir` class provides the base version, location, and site
 package location for Python 3.
 
 .. _ref-classes-python3native:
@@ -2341,7 +2330,7 @@ package location for Python 3.
 ``python3native``
 =================
 
-The :ref:`python3native <ref-classes-python3native>` class supports using the native version of Python
+The :ref:`ref-classes-python3native` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host.
 
@@ -2350,7 +2339,7 @@ by the build host.
 ``python3targetconfig``
 =======================
 
-The :ref:`python3targetconfig <ref-classes-python3targetconfig>` class supports using the native version of Python
+The :ref:`ref-classes-python3targetconfig` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host, except that the configuration for the target machine
 is accessible (such as correct installation directories). This also adds a
@@ -2362,7 +2351,7 @@ in order to avoid unnecessarily lengthening builds.
 ``qemu``
 ========
 
-The :ref:`qemu <ref-classes-qemu>` class provides functionality for recipes that either need
+The :ref:`ref-classes-qemu` class provides functionality for recipes that either need
 QEMU or test for the existence of QEMU. Typically, this class is used to
 run programs for a target system on the build host using QEMU's
 application emulation mode.
@@ -2372,7 +2361,7 @@ application emulation mode.
 ``recipe_sanity``
 =================
 
-The :ref:`recipe_sanity <ref-classes-recipe_sanity>` class checks for the presence of any host system
+The :ref:`ref-classes-recipe_sanity` class checks for the presence of any host system
 recipe prerequisites that might affect the build (e.g. variables that
 are set or software that is present).
 
@@ -2381,19 +2370,18 @@ are set or software that is present).
 ``relocatable``
 ===============
 
-The :ref:`relocatable <ref-classes-relocatable>` class enables relocation of binaries when they are
+The :ref:`ref-classes-relocatable` class enables relocation of binaries when they are
 installed into the sysroot.
 
-This class makes use of the :ref:`chrpath <ref-classes-chrpath>` class
-and is used by both the :ref:`cross <ref-classes-cross>` and
-:ref:`native <ref-classes-native>` classes.
+This class makes use of the :ref:`ref-classes-chrpath` class and is used by
+both the :ref:`ref-classes-cross` and :ref:`ref-classes-native` classes.
 
 .. _ref-classes-remove-libtool:
 
 ``remove-libtool``
 ==================
 
-The :ref:`remove-libtool <ref-classes-remove-libtool>` class adds a post function to the
+The :ref:`ref-classes-remove-libtool` class adds a post function to the
 :ref:`ref-tasks-install` task to remove all ``.la`` files
 installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.
@@ -2405,14 +2393,14 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
 
 .. note::
 
-   The :ref:`remove-libtool <ref-classes-remove-libtool>` class is not enabled by default.
+   The :ref:`ref-classes-remove-libtool` class is not enabled by default.
 
 .. _ref-classes-report-error:
 
 ``report-error``
 ================
 
-The :ref:`report-error <ref-classes-report-error>` class supports enabling the :ref:`error reporting
+The :ref:`ref-classes-report-error` class supports enabling the :ref:`error reporting
 tool <dev-manual/error-reporting-tool:using the error reporting tool>`",
 which allows you to submit build error information to a central database.
 
@@ -2427,7 +2415,7 @@ are created and stored in
 ``rm_work``
 ===========
 
-The :ref:`rm_work <ref-classes-rm-work>` class supports deletion of temporary workspace, which
+The :ref:`ref-classes-rm-work` class supports deletion of temporary workspace, which
 can ease your hard drive demands during builds.
 
 The OpenEmbedded build system can use a substantial amount of disk space
@@ -2436,19 +2424,18 @@ under the ``${TMPDIR}/work`` directory for each recipe. Once the build
 system generates the packages for a recipe, the work files for that
 recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
-you would rather have these files deleted to save disk space as the
-build progresses, you can enable :ref:`rm_work <ref-classes-rm-work>` by adding the following to
+you would rather have these files deleted to save disk space as the build
+progresses, you can enable :ref:`ref-classes-rm-work` by adding the following to
 your ``local.conf`` file, which is found in the :term:`Build Directory`::
 
    INHERIT += "rm_work"
 
-If you are
-modifying and building source code out of the work directory for a
-recipe, enabling :ref:`rm_work <ref-classes-rm-work>` will potentially result in your changes to
-the source being lost. To exclude some recipes from having their work
-directories deleted by :ref:`rm_work <ref-classes-rm-work>`, you can add the names of the recipe
-or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable, which
-can also be set in your ``local.conf`` file. Here is an example::
+If you are modifying and building source code out of the work directory for a
+recipe, enabling :ref:`ref-classes-rm-work` will potentially result in your
+changes to the source being lost. To exclude some recipes from having their work
+directories deleted by :ref:`ref-classes-rm-work`, you can add the names of the
+recipe or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable,
+which can also be set in your ``local.conf`` file. Here is an example::
 
    RM_WORK_EXCLUDE += "busybox glibc"
 
@@ -2457,7 +2444,7 @@ can also be set in your ``local.conf`` file. Here is an example::
 ``rootfs*``
 ===========
 
-The :ref:`rootfs* <ref-classes-rootfs*>` classes support creating the root filesystem for an
+The :ref:`ref-classes-rootfs*` classes support creating the root filesystem for an
 image and consist of the following classes:
 
 -  The :ref:`rootfs-postcommands <ref-classes-rootfs*>` class, which defines filesystem
@@ -2476,8 +2463,8 @@ image and consist of the following classes:
    on the build host directly into the root filesystem.
 
 The root filesystem is created from packages using one of the
-:ref:`rootfs*.bbclass <ref-classes-rootfs*>` files as determined by the
-:term:`PACKAGE_CLASSES` variable.
+:ref:`ref-classes-rootfs*` files as determined by the :term:`PACKAGE_CLASSES`
+variable.
 
 For information on how root filesystem images are created, see the
 ":ref:`overview-manual/concepts:image generation`"
@@ -2488,7 +2475,7 @@ section in the Yocto Project Overview and Concepts Manual.
 ``sanity``
 ==========
 
-The :ref:`sanity <ref-classes-sanity>` class checks to see if prerequisite software is present
+The :ref:`ref-classes-sanity` class checks to see if prerequisite software is present
 on the host system so that users can be notified of potential problems
 that might affect their build. The class also performs basic user
 configuration checks from the ``local.conf`` configuration file to
@@ -2500,17 +2487,17 @@ usually determines whether to include this class.
 ``scons``
 =========
 
-The :ref:`scons <ref-classes-scons>` class supports recipes that need to build software that
-uses the SCons build system. You can use the
-:term:`EXTRA_OESCONS` variable to specify
-additional configuration options you want to pass SCons command line.
+The :ref:`ref-classes-scons` class supports recipes that need to build software
+that uses the SCons build system. You can use the :term:`EXTRA_OESCONS`
+variable to specify additional configuration options you want to pass SCons
+command line.
 
 .. _ref-classes-sdl:
 
 ``sdl``
 =======
 
-The :ref:`sdl <ref-classes-sdl>` class supports recipes that need to build software that uses
+The :ref:`ref-classes-sdl` class supports recipes that need to build software that uses
 the Simple DirectMedia Layer (SDL) library.
 
 .. _ref-classes-python_setuptools_build_meta:
@@ -2518,8 +2505,8 @@ the Simple DirectMedia Layer (SDL) library.
 ``python_setuptools_build_meta``
 ================================
 
-The :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>` class enables building Python modules which
-declare the
+The :ref:`ref-classes-python_setuptools_build_meta` class enables building
+Python modules which declare the
 `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
 ``setuptools.build_meta`` ``build-backend`` in the ``[build-system]``
 section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
@@ -2527,21 +2514,22 @@ section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep
 Python modules built with ``setuptools.build_meta`` can be pure Python or
 include ``C`` or ``Rust`` extensions).
 
-Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
+Internally this uses the :ref:`ref-classes-python_pep517` class.
 
 .. _ref-classes-setuptools3:
 
 ``setuptools3``
 ===============
 
-The :ref:`setuptools3 <ref-classes-setuptools3>` class supports Python version 3.x extensions that
-use build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and
-have not migrated to the official ``pyproject.toml`` format). If your recipe
-uses these build systems, the recipe needs to inherit the :ref:`setuptools3 <ref-classes-setuptools3>` class.
+The :ref:`ref-classes-setuptools3` class supports Python version 3.x extensions
+that use build systems based on ``setuptools`` (e.g. only have a ``setup.py``
+and have not migrated to the official ``pyproject.toml`` format). If your recipe
+uses these build systems, the recipe needs to inherit the
+:ref:`ref-classes-setuptools3` class.
 
    .. note::
 
-      The :ref:`setuptools3 <ref-classes-setuptools3>` class :ref:`ref-tasks-compile` task now calls
+      The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-compile` task now calls
       ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
       (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
 
@@ -2552,22 +2540,22 @@ uses these build systems, the recipe needs to inherit the :ref:`setuptools3 <ref
 
    .. note::
 
-     The :ref:`setuptools3 <ref-classes-setuptools3>` class :ref:`ref-tasks-install` task now installs the ``wheel``
-     binary archive. In current versions of ``setuptools`` the legacy ``setup.py
-     install`` method is deprecated. If the ``setup.py`` cannot be used with
-     wheels, for example it creates files outside of the Python module or
-     standard entry points, then :ref:`setuptools3_legacy
-     <ref-classes-setuptools3_legacy>` should be used.
+     The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-install` task now
+     installs the ``wheel`` binary archive. In current versions of
+     ``setuptools`` the legacy ``setup.py install`` method is deprecated. If
+     the ``setup.py`` cannot be used with wheels, for example it creates files
+     outside of the Python module or standard entry points, then
+     :ref:`ref-classes-setuptools3_legacy` should be used.
 
 .. _ref-classes-setuptools3_legacy:
 
 ``setuptools3_legacy``
 ======================
 
-The :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` class supports
+The :ref:`ref-classes-setuptools3_legacy` class supports
 Python version 3.x extensions that use build systems based on ``setuptools``
 (e.g. only have a ``setup.py`` and have not migrated to the official
-``pyproject.toml`` format). Unlike :ref:`setuptools3 <ref-classes-setuptools3>`,
+``pyproject.toml`` format). Unlike :ref:`ref-classes-setuptools3`,
 this uses the traditional ``setup.py`` ``build`` and ``install`` commands and
 not wheels. This use of ``setuptools`` like this is
 `deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`__
@@ -2578,36 +2566,35 @@ but still relatively common.
 ``setuptools3-base``
 ====================
 
-The :ref:`setuptools3-base <ref-classes-setuptools3-base>` class provides a reusable base for other classes
-that support building Python version 3.x extensions. If you need
-functionality that is not provided by the :ref:`setuptools3 <ref-classes-setuptools3>` class, you may
-want to ``inherit setuptools3-base``. Some recipes do not need the tasks
-in the :ref:`setuptools3 <ref-classes-setuptools3>` class and inherit this class instead.
+The :ref:`ref-classes-setuptools3-base` class provides a reusable base for
+other classes that support building Python version 3.x extensions. If you need
+functionality that is not provided by the :ref:`ref-classes-setuptools3` class,
+you may want to ``inherit setuptools3-base``. Some recipes do not need the tasks
+in the :ref:`ref-classes-setuptools3` class and inherit this class instead.
 
 .. _ref-classes-sign_rpm:
 
 ``sign_rpm``
 ============
 
-The :ref:`sign_rpm <ref-classes-sign_rpm>` class supports generating signed RPM packages.
+The :ref:`ref-classes-sign_rpm` class supports generating signed RPM packages.
 
 .. _ref-classes-siteconfig:
 
 ``siteconfig``
 ==============
 
-The :ref:`siteconfig <ref-classes-siteconfig>` class provides functionality for handling site
-configuration. The class is used by the
-:ref:`autotools <ref-classes-autotools>` class to accelerate the
-:ref:`ref-tasks-configure` task.
+The :ref:`ref-classes-siteconfig` class provides functionality for handling site
+configuration. The class is used by the :ref:`ref-classes-autotools` class to
+accelerate the :ref:`ref-tasks-configure` task.
 
 .. _ref-classes-siteinfo:
 
 ``siteinfo``
 ============
 
-The :ref:`siteinfo <ref-classes-siteinfo>` class provides information about the targets that might
-be needed by other classes or recipes.
+The :ref:`ref-classes-siteinfo` class provides information about the targets
+that might be needed by other classes or recipes.
 
 As an example, consider Autotools, which can require tests that must
 execute on the target hardware. Since this is not possible in general
@@ -2627,9 +2614,9 @@ The class also provides variables like :term:`SITEINFO_ENDIANNESS` and
 ``sstate``
 ==========
 
-The :ref:`sstate <ref-classes-sstate>` class provides support for Shared State (sstate). By
-default, the class is enabled through the
-:term:`INHERIT_DISTRO` variable's default value.
+The :ref:`ref-classes-sstate` class provides support for Shared State (sstate).
+By default, the class is enabled through the :term:`INHERIT_DISTRO` variable's
+default value.
 
 For more information on sstate, see the
 ":ref:`overview-manual/concepts:shared state cache`"
@@ -2640,7 +2627,7 @@ section in the Yocto Project Overview and Concepts Manual.
 ``staging``
 ===========
 
-The :ref:`staging <ref-classes-staging>` class installs files into individual recipe work
+The :ref:`ref-classes-staging` class installs files into individual recipe work
 directories for sysroots. The class contains the following key tasks:
 
 -  The :ref:`ref-tasks-populate_sysroot` task,
@@ -2653,8 +2640,8 @@ directories for sysroots. The class contains the following key tasks:
    installs the files into the individual recipe work directories (i.e.
    :term:`WORKDIR`).
 
-The code in the :ref:`staging <ref-classes-staging>` class is complex and basically works in two
-stages:
+The code in the :ref:`ref-classes-staging` class is complex and basically works
+in two stages:
 
 -  *Stage One:* The first stage addresses recipes that have files they
    want to share with other recipes that have dependencies on the
@@ -2727,8 +2714,7 @@ stages:
    dependencies traversed or installed. The same sstate dependency code
    is used so that builds should be identical regardless of whether
    sstate was used or not. For a closer look, see the
-   ``setscene_depvalid()`` function in the
-   :ref:`sstate <ref-classes-sstate>` class.
+   ``setscene_depvalid()`` function in the :ref:`ref-classes-sstate` class.
 
    The build system is careful to maintain manifests of the files it
    installs so that any given dependency can be installed as needed. The
@@ -2740,8 +2726,8 @@ stages:
 ``syslinux``
 ============
 
-The :ref:`syslinux <ref-classes-syslinux>` class provides syslinux-specific functions for building
-bootable images.
+The :ref:`ref-classes-syslinux` class provides syslinux-specific functions for
+building bootable images.
 
 The class supports the following variables:
 
@@ -2783,8 +2769,8 @@ The class supports the following variables:
 ``systemd``
 ===========
 
-The :ref:`systemd <ref-classes-systemd>` class provides support for recipes that install systemd
-unit files.
+The :ref:`ref-classes-systemd` class provides support for recipes that install
+systemd unit files.
 
 The functionality for this class is disabled unless you have "systemd"
 in :term:`DISTRO_FEATURES`.
@@ -2809,7 +2795,7 @@ Services are set up to start on boot automatically
 unless you have set
 :term:`SYSTEMD_AUTO_ENABLE` to "disable".
 
-For more information on :ref:`systemd <ref-classes-systemd>`, see the
+For more information on :ref:`ref-classes-systemd`, see the
 ":ref:`dev-manual/init-manager:selecting an initialization manager`"
 section in the Yocto Project Development Tasks Manual.
 
@@ -2818,18 +2804,18 @@ section in the Yocto Project Development Tasks Manual.
 ``systemd-boot``
 ================
 
-The :ref:`systemd-boot <ref-classes-systemd-boot>` class provides functions specific to the
+The :ref:`ref-classes-systemd-boot` class provides functions specific to the
 systemd-boot bootloader for building bootable images. This is an
 internal class and is not intended to be used directly.
 
 .. note::
 
-   The :ref:`systemd-boot <ref-classes-systemd-boot>` class is a result from merging the ``gummiboot`` class
+   The :ref:`ref-classes-systemd-boot` class is a result from merging the ``gummiboot`` class
    used in previous Yocto Project releases with the ``systemd`` project.
 
-Set the :term:`EFI_PROVIDER` variable to
-":ref:`systemd-boot <ref-classes-systemd-boot>`" to use this class. Doing so creates a standalone EFI
-bootloader that is not dependent on systemd.
+Set the :term:`EFI_PROVIDER` variable to ":ref:`ref-classes-systemd-boot`" to
+use this class. Doing so creates a standalone EFI bootloader that is not
+dependent on systemd.
 
 For information on more variables used and supported in this class, see
 the :term:`SYSTEMD_BOOT_CFG`,
@@ -2845,24 +2831,22 @@ for more information.
 ``terminal``
 ============
 
-The :ref:`terminal <ref-classes-terminal>` class provides support for starting a terminal session.
-The :term:`OE_TERMINAL` variable controls which
-terminal emulator is used for the session.
+The :ref:`ref-classes-terminal` class provides support for starting a terminal
+session.  The :term:`OE_TERMINAL` variable controls which terminal emulator is
+used for the session.
 
-Other classes use the :ref:`terminal <ref-classes-terminal>` class anywhere a separate terminal
-session needs to be started. For example, the
-:ref:`patch <ref-classes-patch>` class assuming
-:term:`PATCHRESOLVE` is set to "user", the
-:ref:`cml1 <ref-classes-cml1>` class, and the
-:ref:`devshell <ref-classes-devshell>` class all use the :ref:`terminal <ref-classes-terminal>`
-class.
+Other classes use the :ref:`ref-classes-terminal` class anywhere a separate
+terminal session needs to be started. For example, the :ref:`ref-classes-patch`
+class assuming :term:`PATCHRESOLVE` is set to "user", the
+:ref:`ref-classes-cml1` class, and the :ref:`ref-classes-devshell` class all
+use the :ref:`ref-classes-terminal` class.
 
 .. _ref-classes-testimage:
 
 ``testimage``
 =============
 
-The :ref:`testimage <ref-classes-testimage>` class supports running automated tests against
+The :ref:`ref-classes-testimage` class supports running automated tests against
 images using QEMU and on actual hardware. The classes handle loading the
 tests and starting the image. To use the classes, you need to perform
 steps to set up the environment.
@@ -2874,7 +2858,7 @@ To enable this class, add the following to your configuration::
 The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.
 
-The :ref:`testimage <ref-classes-testimage>` class runs tests on an image when called using the
+The :ref:`ref-classes-testimage` class runs tests on an image when called using the
 following::
 
    $ bitbake -c testimage image
@@ -2894,7 +2878,7 @@ section in the Yocto Project Development Tasks Manual.
 ===========
 
 This class supports running automated tests against software development
-kits (SDKs). The :ref:`testsdk <ref-classes-testsdk>` class runs tests on an SDK when called
+kits (SDKs). The :ref:`ref-classes-testsdk` class runs tests on an SDK when called
 using the following::
 
    $ bitbake -c testsdk image
@@ -2902,7 +2886,7 @@ using the following::
 .. note::
 
    Best practices include using :term:`IMAGE_CLASSES` rather than
-   :term:`INHERIT` to inherit the :ref:`testsdk <ref-classes-testsdk>` class for automated SDK
+   :term:`INHERIT` to inherit the :ref:`ref-classes-testsdk` class for automated SDK
    testing.
 
 .. _ref-classes-texinfo:
@@ -2928,7 +2912,7 @@ host system.
 ``toaster``
 ===========
 
-The :ref:`toaster <ref-classes-toaster>` class collects information about packages and images and
+The :ref:`ref-classes-toaster` class collects information about packages and images and
 sends them as events that the BitBake user interface can receive. The
 class is enabled when the Toaster user interface is running.
 
@@ -2939,7 +2923,7 @@ This class is not intended to be used directly.
 ``toolchain-scripts``
 =====================
 
-The :ref:`toolchain-scripts <ref-classes-toolchain-scripts>` class provides the scripts used for setting up
+The :ref:`ref-classes-toolchain-scripts` class provides the scripts used for setting up
 the environment for installed SDKs.
 
 .. _ref-classes-typecheck:
@@ -2947,7 +2931,7 @@ the environment for installed SDKs.
 ``typecheck``
 =============
 
-The :ref:`typecheck <ref-classes-typecheck>` class provides support for validating the values of
+The :ref:`ref-classes-typecheck` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
 variable using the "type" varflag. Here is an example::
@@ -2959,7 +2943,7 @@ variable using the "type" varflag. Here is an example::
 ``uboot-config``
 ================
 
-The :ref:`uboot-config <ref-classes-uboot-config>` class provides support for U-Boot configuration for
+The :ref:`ref-classes-uboot-config` class provides support for U-Boot configuration for
 a machine. Specify the machine in your recipe as follows::
 
    UBOOT_CONFIG ??= <default>
@@ -2990,7 +2974,7 @@ yourself, publish the resulting tarball (e.g. via HTTP) and set
 ``UNINATIVE_URL`` and ``UNINATIVE_CHECKSUM`` appropriately. For an
 example, see the ``meta/conf/distro/include/yocto-uninative.inc``.
 
-The :ref:`uninative <ref-classes-uninative>` class is also used unconditionally by the extensible
+The :ref:`ref-classes-uninative` class is also used unconditionally by the extensible
 SDK. When building the extensible SDK, ``uninative-tarball`` is built
 and the resulting tarball is included within the SDK.
 
@@ -2999,12 +2983,12 @@ and the resulting tarball is included within the SDK.
 ``update-alternatives``
 =======================
 
-The :ref:`update-alternatives <ref-classes-update-alternatives>` class helps the alternatives system when
+The :ref:`ref-classes-update-alternatives` class helps the alternatives system when
 multiple sources provide the same command. This situation occurs when
 several programs that have the same or similar function are installed
 with the same name. For example, the ``ar`` command is available from
 the ``busybox``, ``binutils`` and ``elfutils`` packages. The
-:ref:`update-alternatives <ref-classes-update-alternatives>` class handles renaming the binaries so that
+:ref:`ref-classes-update-alternatives` class handles renaming the binaries so that
 multiple packages can be installed without conflicts. The ``ar`` command
 still works regardless of which packages are installed or subsequently
 removed. The class renames the conflicting binary in each package and
@@ -3037,7 +3021,7 @@ file.
 ``update-rc.d``
 ===============
 
-The :ref:`update-rc.d <ref-classes-update-rc.d>` class uses ``update-rc.d`` to safely install an
+The :ref:`ref-classes-update-rc.d` class uses ``update-rc.d`` to safely install an
 initialization script on behalf of the package. The OpenEmbedded build
 system takes care of details such as making sure the script is stopped
 before a package is removed and started when the package is installed.
@@ -3085,13 +3069,11 @@ set static values, the OpenEmbedded build system looks in
 :term:`BBPATH` for ``files/passwd`` and ``files/group``
 files for the values.
 
-To use static ``uid`` and ``gid`` values, you need to set some
-variables. See the :term:`USERADDEXTENSION`,
-:term:`USERADD_UID_TABLES`,
-:term:`USERADD_GID_TABLES`, and
-:term:`USERADD_ERROR_DYNAMIC` variables.
-You can also see the :ref:`useradd <ref-classes-useradd>` class for
-additional information.
+To use static ``uid`` and ``gid`` values, you need to set some variables. See
+the :term:`USERADDEXTENSION`, :term:`USERADD_UID_TABLES`,
+:term:`USERADD_GID_TABLES`, and :term:`USERADD_ERROR_DYNAMIC` variables.
+You can also see the :ref:`ref-classes-useradd` class for additional
+information.
 
 .. note::
 
@@ -3106,32 +3088,31 @@ additional information.
 ``utility-tasks``
 =================
 
-The :ref:`utility-tasks <ref-classes-utility-tasks>` class provides support for various "utility" type
-tasks that are applicable to all recipes, such as
-:ref:`ref-tasks-clean` and
-:ref:`ref-tasks-listtasks`.
+The :ref:`ref-classes-utility-tasks` class provides support for various
+"utility" type tasks that are applicable to all recipes, such as
+:ref:`ref-tasks-clean` and :ref:`ref-tasks-listtasks`.
 
 This class is enabled by default because it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-utils:
 
 ``utils``
 =========
 
-The :ref:`utils <ref-classes-utils>` class provides some useful Python functions that are
+The :ref:`ref-classes-utils` class provides some useful Python functions that are
 typically used in inline Python expressions (e.g. ``${@...}``). One
 example use is for ``bb.utils.contains()``.
 
 This class is enabled by default because it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-vala:
 
 ``vala``
 ========
 
-The :ref:`vala <ref-classes-vala>` class supports recipes that need to build software written
+The :ref:`ref-classes-vala` class supports recipes that need to build software written
 using the Vala programming language.
 
 .. _ref-classes-waf:
@@ -3139,7 +3120,7 @@ using the Vala programming language.
 ``waf``
 =======
 
-The :ref:`waf <ref-classes-waf>` class supports recipes that need to build software that uses
+The :ref:`ref-classes-waf` class supports recipes that need to build software that uses
 the Waf build system. You can use the
 :term:`EXTRA_OECONF` or
 :term:`PACKAGECONFIG_CONFARGS` variables
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 0229747650..794a6fd15b 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -358,7 +358,7 @@ Here are the image features available for all images:
    a given image.
 
 Some image features are available only when you inherit the
-:ref:`core-image <ref-classes-core-image>` class. The current list of
+:ref:`ref-classes-core-image` class. The current list of
 these valid features is as follows:
 
 -  *hwcodecs:* Installs hardware acceleration codecs.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 798d4be4cf..13096816d2 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -580,7 +580,7 @@ Errors and Warnings
 
    The specified package contains mime type files (``.xml`` files in
    ``${datadir}/mime/packages``) and yet does not inherit the
-   :ref:`mime <ref-classes-mime>` class which will ensure that these get
+   :ref:`ref-classes-mime` class which will ensure that these get
    properly installed. Either add ``inherit mime`` to the recipe or remove the
    files at the :ref:`ref-tasks-install` step if they are not needed.
 
@@ -590,7 +590,7 @@ Errors and Warnings
 - ``package contains desktop file with key 'MimeType' but does not inhert mime-xdg: <packagename> path '<file>' [mime-xdg]``
 
     The specified package contains a .desktop file with a 'MimeType' key
-    present, but does not inherit the :ref:`mime-xdg <ref-classes-mime-xdg>`
+    present, but does not inherit the :ref:`ref-classes-mime-xdg`
     class that is required in order for that to be activated. Either add
     ``inherit mime`` to the recipe or remove the files at the
     :ref:`ref-tasks-install` step if they are not needed.
@@ -621,9 +621,9 @@ Errors and Warnings
 - ``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
 
     This check ensures that if one of the variables that the
-    :ref:`features_check <ref-classes-features_check>` class supports (e.g.
+    :ref:`ref-classes-features_check` class supports (e.g.
     :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
-    inherits :ref:`features_check <ref-classes-features_check>` in order for
+    inherits :ref:`ref-classes-features_check` in order for
     the requirement to actually work. If you are seeing this message, either
     add ``inherit features_check`` to your recipe or remove the reference to
     the variable if it is not needed.
@@ -634,7 +634,7 @@ Errors and Warnings
 - ``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
 
     This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
-    recipe also inherits :ref:`update-alternatives <ref-classes-update-alternatives>` such
+    recipe also inherits :ref:`ref-classes-update-alternatives` such
     that the alternative will be correctly set up. If you are seeing this message, either
     add ``inherit update-alternatives`` to your recipe or remove the reference to the variable
     if it is not needed.
@@ -655,7 +655,7 @@ Errors and Warnings
 - ``<packagename> contains perllocal.pod (<files>), should not be installed [perllocalpod]``
 
     ``perllocal.pod`` is an index file of locally installed modules and so shouldn't be
-    installed by any distribution packages. The :ref:`cpan <ref-classes-cpan>` class
+    installed by any distribution packages. The :ref:`ref-classes-cpan` class
     already sets ``NO_PERLLOCAL`` to stop this file being generated by most Perl recipes,
     but if a recipe is using ``MakeMaker`` directly then they might not be doing this
     correctly. This check ensures that perllocal.pod is not in any package in order to
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index f3a52a19f3..e895382eec 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -233,7 +233,7 @@ is available via the :term:`TOPDIR` variable.
 -----------------------
 
 The OpenEmbedded build system creates this directory when you enable
-build history via the :ref:`buildhistory <ref-classes-buildhistory>` class file. The directory
+build history via the :ref:`ref-classes-buildhistory` class file. The directory
 organizes build information into image, packages, and SDK
 subdirectories. For information on the build history feature, see the
 ":ref:`dev-manual/build-quality:maintaining build output quality`"
@@ -375,7 +375,7 @@ remove the ``build/sstate-cache`` directory.
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 This directory stores the build statistics as generated by the
-:ref:`buildstats <ref-classes-buildstats>` class.
+:ref:`ref-classes-buildstats` class.
 
 .. _structure-build-tmp-cache:
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e626095b20..7a664cc6c0 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -78,9 +78,9 @@ task runs with the current working directory set to
 ``${``\ :term:`B`\ ``}``.
 
 Recipes implementing this task should inherit the
-:ref:`deploy <ref-classes-deploy>` class and should write the output
+:ref:`ref-classes-deploy` class and should write the output
 to ``${``\ :term:`DEPLOYDIR`\ ``}``, which is not to be
-confused with ``${DEPLOY_DIR}``. The :ref:`deploy <ref-classes-deploy>` class sets up
+confused with ``${DEPLOY_DIR}``. The :ref:`ref-classes-deploy` class sets up
 :ref:`ref-tasks-deploy` as a shared state (sstate) task that can be accelerated
 through sstate use. The sstate mechanism takes care of copying the
 output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
@@ -102,7 +102,7 @@ Adding :ref:`ref-tasks-deploy` after other tasks works the same way.
 .. note::
 
    You do not need to add ``before do_build`` to the ``addtask`` command
-   (though it is harmless), because the :ref:`base <ref-classes-base>` class contains the following::
+   (though it is harmless), because the :ref:`ref-classes-base` class contains the following::
 
            do_build[recrdeptask] += "do_deploy"
 
@@ -225,7 +225,7 @@ section in the Yocto Project Overview and Concepts Manual.
 -----------------
 
 Runs QA checks on packaged files. For more information on these checks,
-see the :ref:`insane <ref-classes-insane>` class.
+see the :ref:`ref-classes-insane` class.
 
 .. _ref-tasks-package_write_deb:
 
@@ -406,7 +406,7 @@ Installs the files into the individual recipe specific sysroots (i.e.
 ``recipe-sysroot`` and ``recipe-sysroot-native`` under
 ``${``\ :term:`WORKDIR`\ ``}`` based upon the
 dependencies specified by :term:`DEPENDS`). See the
-":ref:`staging <ref-classes-staging>`" class for more information.
+":ref:`ref-classes-staging`" class for more information.
 
 .. _ref-tasks-rm_work:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5f5fea344e..f2decd713b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -126,7 +126,7 @@ system and gives an overview of their function and contents.
       ":ref:`ref-classes-update-alternatives`" section.
 
    :term:`ANY_OF_DISTRO_FEATURES`
-      When inheriting the :ref:`features_check <ref-classes-features_check>`
+      When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies a list of distribution features where
       at least one must be enabled in the current configuration in order
       for the OpenEmbedded build system to build the recipe. In other words,
@@ -139,14 +139,14 @@ system and gives an overview of their function and contents.
       An override list of append strings for each target specified with
       :term:`LABELS`.
 
-      See the :ref:`grub-efi <ref-classes-grub-efi>` class for more
+      See the :ref:`ref-classes-grub-efi` class for more
       information on how this variable is used.
 
    :term:`AR`
       The minimal command and arguments used to run ``ar``.
 
    :term:`ARCHIVER_MODE`
-      When used with the :ref:`archiver <ref-classes-archiver>` class,
+      When used with the :ref:`ref-classes-archiver` class,
       determines the type of information used to create a released archive.
       You can use this variable to create archives of patched source,
       original source, configured source, and so forth by employing the
@@ -197,13 +197,13 @@ system and gives an overview of their function and contents.
       order to send patches and forward bugs.
 
    :term:`AUTO_LIBNAME_PKGS`
-      When the :ref:`debian <ref-classes-debian>` class is inherited,
+      When the :ref:`ref-classes-debian` class is inherited,
       which is the default behavior, :term:`AUTO_LIBNAME_PKGS` specifies which
       packages should be checked for libraries and renamed according to
       Debian library package naming.
 
       The default value is "${PACKAGES}", which causes the
-      :ref:`debian <ref-classes-debian>` class to act on all packages that are
+      :ref:`ref-classes-debian` class to act on all packages that are
       explicitly generated by the recipe.
 
    :term:`AUTOREV`
@@ -215,7 +215,7 @@ system and gives an overview of their function and contents.
       If you use the previous statement to retrieve the latest version of
       software, you need to be sure :term:`PV` contains
       ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
-      recipe that inherits the :ref:`kernel <ref-classes-kernel>` class and you
+      recipe that inherits the :ref:`ref-classes-kernel` class and you
       use the previous statement. In this example, ``${SRCPV}`` does not
       automatically get into :term:`PV`. Consequently, you need to change
       :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
@@ -227,7 +227,7 @@ system and gives an overview of their function and contents.
    :term:`AUTO_SYSLINUXMENU`
       Enables creating an automatic menu for the syslinux bootloader. You
       must set this variable in your recipe. The
-      :ref:`syslinux <ref-classes-syslinux>` class checks this variable.
+      :ref:`ref-classes-syslinux` class checks this variable.
 
    :term:`AVAILTUNES`
       The list of defined CPU and Application Binary Interface (ABI)
@@ -701,7 +701,7 @@ system and gives an overview of their function and contents.
       ``quilt-native``, which is a copy of Quilt built to run on the build
       system; "crosses" such as ``gcc-cross``, which is a compiler built to
       run on the build machine but produces binaries that run on the target
-      :term:`MACHINE`; ":ref:`nativesdk <ref-classes-nativesdk>`", which
+      :term:`MACHINE`; ":ref:`ref-classes-nativesdk`", which
       targets the SDK machine instead of :term:`MACHINE`; and "mulitlibs" in
       the form "``multilib:``\ multilib_name".
 
@@ -909,13 +909,12 @@ system and gives an overview of their function and contents.
       See :term:`bitbake:BBTARGETS` in the BitBake manual.
 
    :term:`BINCONFIG`
-      When inheriting the
-      :ref:`binconfig-disabled <ref-classes-binconfig-disabled>` class,
-      this variable specifies binary configuration scripts to disable in
-      favor of using ``pkg-config`` to query the information. The
-      :ref:`binconfig-disabled <ref-classes-binconfig-disabled>` class will modify the specified scripts to
-      return an error so that calls to them can be easily found and
-      replaced.
+      When inheriting the :ref:`ref-classes-binconfig-disabled` class, this
+      variable specifies binary configuration scripts to disable in favor of
+      using ``pkg-config`` to query the information. The
+      :ref:`ref-classes-binconfig-disabled` class will modify the specified
+      scripts to return an error so that calls to them can be easily found
+      and replaced.
 
       To add multiple scripts, separate them by spaces. Here is an example
       from the ``libpng`` recipe::
@@ -923,7 +922,7 @@ system and gives an overview of their function and contents.
          BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
    :term:`BINCONFIG_GLOB`
-      When inheriting the :ref:`binconfig <ref-classes-binconfig>` class,
+      When inheriting the :ref:`ref-classes-binconfig` class,
       this variable specifies a wildcard for configuration scripts that
       need editing. The scripts are edited to correct any paths that have
       been set up during compilation so that they are correct for use when
@@ -1048,8 +1047,7 @@ system and gives an overview of their function and contents.
    :term:`BUILD_PREFIX`
       The toolchain binary prefix used for native recipes. The OpenEmbedded
       build system uses the :term:`BUILD_PREFIX` value to set the
-      :term:`TARGET_PREFIX` when building for
-      :ref:`native <ref-classes-native>` recipes.
+      :term:`TARGET_PREFIX` when building for :ref:`ref-classes-native` recipes.
 
    :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from
@@ -1060,7 +1058,7 @@ system and gives an overview of their function and contents.
    :term:`BUILD_SYS`
       Specifies the system, including the architecture and the operating
       system, to use when building for the build host (i.e. when building
-      :ref:`native <ref-classes-native>` recipes).
+      :ref:`ref-classes-native` recipes).
 
       The OpenEmbedded build system automatically sets this variable based
       on :term:`BUILD_ARCH`,
@@ -1080,22 +1078,22 @@ system and gives an overview of their function and contents.
       :term:`BUILDDIR` defaults to ``build`` in the current directory.
 
    :term:`BUILDHISTORY_COMMIT`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
-      class, this variable specifies whether or not to commit the build
-      history output in a local Git repository. If set to "1", this local
-      repository will be maintained automatically by the :ref:`buildhistory <ref-classes-buildhistory>`
-      class and a commit will be created on every build for changes to each
-      top-level subdirectory of the build history output (images, packages,
-      and sdk). If you want to track changes to build history over time,
-      you should set this value to "1".
-
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class
+      When inheriting the :ref:`ref-classes-buildhistory` class, this variable
+      specifies whether or not to commit the build history output in a local
+      Git repository. If set to "1", this local repository will be maintained
+      automatically by the :ref:`ref-classes-buildhistory` class and a commit
+      will be created on every build for changes to each top-level subdirectory
+      of the build history output (images, packages, and sdk). If you want to
+      track changes to build history over time, you should set this value to
+      "1".
+
+      By default, the :ref:`ref-classes-buildhistory` class
       enables committing the buildhistory output in a local Git repository::
 
          BUILDHISTORY_COMMIT ?= "1"
 
    :term:`BUILDHISTORY_COMMIT_AUTHOR`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
+      When inheriting the :ref:`ref-classes-buildhistory`
       class, this variable specifies the author to use for each Git commit.
       In order for the :term:`BUILDHISTORY_COMMIT_AUTHOR` variable to work, the
       :term:`BUILDHISTORY_COMMIT` variable must
@@ -1106,22 +1104,24 @@ system and gives an overview of their function and contents.
       email@host". Providing an email address or host that is not valid
       does not produce an error.
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the variable as follows::
+      By default, the :ref:`ref-classes-buildhistory` class sets the variable
+      as follows::
 
          BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 
    :term:`BUILDHISTORY_DIR`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
+      When inheriting the :ref:`ref-classes-buildhistory`
       class, this variable specifies the directory in which build history
       information is kept. For more information on how the variable works,
       see the :ref:`ref-classes-buildhistory` class.
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the directory as follows::
+      By default, the :ref:`ref-classes-buildhistory` class sets the directory
+      as follows::
 
          BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 
    :term:`BUILDHISTORY_FEATURES`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
+      When inheriting the :ref:`ref-classes-buildhistory`
       class, this variable specifies the build history features to be
       enabled. For more information on how build history works, see the
       ":ref:`dev-manual/build-quality:maintaining build output quality`"
@@ -1143,13 +1143,13 @@ system and gives an overview of their function and contents.
          This saves one file per task and lists the SHA-256 checksums for
          each file staged (i.e. the output of the task).
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class enables the following
-      features::
+      By default, the :ref:`ref-classes-buildhistory` class enables the
+      following features::
 
          BUILDHISTORY_FEATURES ?= "image package sdk"
 
    :term:`BUILDHISTORY_IMAGE_FILES`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
+      When inheriting the :ref:`ref-classes-buildhistory`
       class, this variable specifies a list of paths to files copied from
       the image contents into the build history directory under an
       "image-files" directory in the directory for the image, so that you
@@ -1159,39 +1159,39 @@ system and gives an overview of their function and contents.
       any file. Specifying an invalid path does not produce an error.
       Consequently, you can include files that might not always be present.
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class provides paths to the
-      following files::
+      By default, the :ref:`ref-classes-buildhistory` class provides paths to
+      the following files::
 
          BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 
    :term:`BUILDHISTORY_PATH_PREFIX_STRIP`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
+      When inheriting the :ref:`ref-classes-buildhistory`
       class, this variable specifies a common path prefix that should be
       stripped off the beginning of paths in the task signature list when the
       ``task`` feature is active in :term:`BUILDHISTORY_FEATURES`. This can be
       useful when build history is populated from multiple sources that may not
       all use the same top level directory.
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the variable as follows::
+      By default, the :ref:`ref-classes-buildhistory` class sets the variable
+      as follows::
 
          BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
 
       In this case, no prefixes will be stripped.
 
    :term:`BUILDHISTORY_PUSH_REPO`
-      When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
-      class, this variable optionally specifies a remote repository to
-      which build history pushes Git changes. In order for
-      :term:`BUILDHISTORY_PUSH_REPO` to work,
-      :term:`BUILDHISTORY_COMMIT` must be set to
-      "1".
+      When inheriting the :ref:`ref-classes-buildhistory` class, this variable
+      optionally specifies a remote repository to which build history pushes
+      Git changes. In order for :term:`BUILDHISTORY_PUSH_REPO` to work,
+      :term:`BUILDHISTORY_COMMIT` must be set to "1".
 
       The repository should correspond to a remote address that specifies a
       repository as understood by Git, or alternatively to a remote name
       that you have set up manually using ``git remote`` within the local
       repository.
 
-      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the variable as follows::
+      By default, the :ref:`ref-classes-buildhistory` class sets the variable
+      as follows::
 
          BUILDHISTORY_PUSH_REPO ?= ""
 
@@ -1224,8 +1224,7 @@ system and gives an overview of their function and contents.
 
    :term:`BUILDSTATS_BASE`
       Points to the location of the directory that holds build statistics
-      when you use and enable the
-      :ref:`buildstats <ref-classes-buildstats>` class. The
+      when you use and enable the :ref:`ref-classes-buildstats` class. The
       :term:`BUILDSTATS_BASE` directory defaults to
       ``${``\ :term:`TMPDIR`\ ``}/buildstats/``.
 
@@ -1271,9 +1270,8 @@ system and gives an overview of their function and contents.
       An internal variable specifying the special class override that
       should currently apply (e.g. "class-target", "class-native", and so
       forth). The classes that use this variable (e.g.
-      :ref:`native <ref-classes-native>`,
-      :ref:`nativesdk <ref-classes-nativesdk>`, and so forth) set the
-      variable to appropriate values.
+      :ref:`ref-classes-native`, :ref:`ref-classes-nativesdk`, and so forth)
+      set the variable to appropriate values.
 
       .. note::
 
@@ -1449,8 +1447,7 @@ system and gives an overview of their function and contents.
       The minimal arguments for GNU configure.
 
    :term:`CONFLICT_DISTRO_FEATURES`
-      When inheriting the
-      :ref:`features_check <ref-classes-features_check>`
+      When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies distribution features that would be
       in conflict should the recipe be built. In other words, if the
       :term:`CONFLICT_DISTRO_FEATURES` variable lists a feature that also
@@ -1466,8 +1463,8 @@ system and gives an overview of their function and contents.
 
       -   Checksums for the image
 
-      An example of :term:`CONVERSION_CMD` from :ref:`image-types
-      <ref-classes-image_types>` class is::
+      An example of :term:`CONVERSION_CMD` from :ref:`ref-classes-image_types`
+      class is::
 
          CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 
@@ -1506,10 +1503,9 @@ system and gives an overview of their function and contents.
          information on providing license text.
 
    :term:`COPYLEFT_LICENSE_EXCLUDE`
-      A space-separated list of licenses to exclude from the source
-      archived by the :ref:`archiver <ref-classes-archiver>` class. In
-      other words, if a license in a recipe's
-      :term:`LICENSE` value is in the value of
+      A space-separated list of licenses to exclude from the source archived by
+      the :ref:`ref-classes-archiver` class. In other words, if a license in a
+      recipe's :term:`LICENSE` value is in the value of
       :term:`COPYLEFT_LICENSE_EXCLUDE`, then its source is not archived by the
       class.
 
@@ -1520,60 +1516,54 @@ system and gives an overview of their function and contents.
 
       The default value, which is "CLOSED Proprietary", for
       :term:`COPYLEFT_LICENSE_EXCLUDE` is set by the
-      :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the :ref:`archiver <ref-classes-archiver>` class.
+      :ref:`ref-classes-copyleft_filter` class, which
+      is inherited by the :ref:`ref-classes-archiver` class.
 
    :term:`COPYLEFT_LICENSE_INCLUDE`
       A space-separated list of licenses to include in the source archived
-      by the :ref:`archiver <ref-classes-archiver>` class. In other
+      by the :ref:`ref-classes-archiver` class. In other
       words, if a license in a recipe's :term:`LICENSE`
       value is in the value of :term:`COPYLEFT_LICENSE_INCLUDE`, then its
       source is archived by the class.
 
-      The default value is set by the
-      :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the :ref:`archiver <ref-classes-archiver>` class. The default value includes
-      "GPL*", "LGPL*", and "AGPL*".
+      The default value is set by the :ref:`ref-classes-copyleft_filter` class,
+      which is inherited by the :ref:`ref-classes-archiver` class. The default
+      value includes "GPL*", "LGPL*", and "AGPL*".
 
    :term:`COPYLEFT_PN_EXCLUDE`
       A list of recipes to exclude in the source archived by the
-      :ref:`archiver <ref-classes-archiver>` class. The
-      :term:`COPYLEFT_PN_EXCLUDE` variable overrides the license inclusion and
-      exclusion caused through the
-      :term:`COPYLEFT_LICENSE_INCLUDE` and
-      :term:`COPYLEFT_LICENSE_EXCLUDE`
+      :ref:`ref-classes-archiver` class. The :term:`COPYLEFT_PN_EXCLUDE`
+      variable overrides the license inclusion and exclusion caused through the
+      :term:`COPYLEFT_LICENSE_INCLUDE` and :term:`COPYLEFT_LICENSE_EXCLUDE`
       variables, respectively.
 
       The default value, which is "" indicating to not explicitly exclude
       any recipes by name, for :term:`COPYLEFT_PN_EXCLUDE` is set by the
-      :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the :ref:`archiver <ref-classes-archiver>` class.
+      :ref:`ref-classes-copyleft_filter` class, which is inherited by the
+      :ref:`ref-classes-archiver` class.
 
    :term:`COPYLEFT_PN_INCLUDE`
       A list of recipes to include in the source archived by the
-      :ref:`archiver <ref-classes-archiver>` class. The
-      :term:`COPYLEFT_PN_INCLUDE` variable overrides the license inclusion and
-      exclusion caused through the
-      :term:`COPYLEFT_LICENSE_INCLUDE` and
-      :term:`COPYLEFT_LICENSE_EXCLUDE`
+      :ref:`ref-classes-archiver` class. The :term:`COPYLEFT_PN_INCLUDE`
+      variable overrides the license inclusion and exclusion caused through the
+      :term:`COPYLEFT_LICENSE_INCLUDE` and :term:`COPYLEFT_LICENSE_EXCLUDE`
       variables, respectively.
 
       The default value, which is "" indicating to not explicitly include
       any recipes by name, for :term:`COPYLEFT_PN_INCLUDE` is set by the
-      :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the :ref:`archiver <ref-classes-archiver>` class.
+      :ref:`ref-classes-copyleft_filter` class, which is inherited by the
+      :ref:`ref-classes-archiver` class.
 
    :term:`COPYLEFT_RECIPE_TYPES`
       A space-separated list of recipe types to include in the source
       archived by the :ref:`archiver <ref-classes-archiver>` class.
-      Recipe types are ``target``, :ref:`native <ref-classes-native>`,
-      :ref:`nativesdk <ref-classes-nativesdk>`,
-      :ref:`cross <ref-classes-cross>`, :ref:`crosssdk <ref-classes-crosssdk>`,
-      and :ref:`cross-canadian <ref-classes-cross-canadian>`.
+      Recipe types are ``target``, :ref:`ref-classes-native`,
+      :ref:`ref-classes-nativesdk`, :ref:`ref-classes-cross`,
+      :ref:`ref-classes-crosssdk`, and :ref:`ref-classes-cross-canadian`.
 
       The default value, which is "target*", for :term:`COPYLEFT_RECIPE_TYPES`
-      is set by the :ref:`copyleft_filter <ref-classes-copyleft_filter>`
-      class, which is inherited by the :ref:`archiver <ref-classes-archiver>` class.
+      is set by the :ref:`ref-classes-copyleft_filter` class, which is
+      inherited by the :ref:`ref-classes-archiver` class.
 
    :term:`CORE_IMAGE_EXTRA_INSTALL`
       Specifies the list of packages to be added to the image. You should
@@ -1647,7 +1637,7 @@ system and gives an overview of their function and contents.
          CVE_CHECK_IGNORE += "CVE-2020-15523"
 
    :term:`CVE_CHECK_SHOW_WARNINGS`
-      Specifies whether or not the :ref:`cve-check <ref-classes-cve-check>`
+      Specifies whether or not the :ref:`ref-classes-cve-check`
       class should generate warning messages on the console when unpatched
       CVEs are found. The default is "1", but you may wish to set it to "0" if
       you are already examining/processing the logs after the build has
@@ -1669,7 +1659,7 @@ system and gives an overview of their function and contents.
       against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
 
       The default is ${:term:`BPN`} (except for recipes that inherit the
-      :ref:`pypi <ref-classes-pypi>` class where it is set based upon
+      :ref:`ref-classes-pypi` class where it is set based upon
       :term:`PYPI_PACKAGE`). If it does not match the name in the NIST CVE
       database or matches with multiple entries in the database, the default
       value needs to be changed.
@@ -1688,12 +1678,12 @@ system and gives an overview of their function and contents.
    :term:`CVE_VERSION`
       In a recipe, defines the version used to match the recipe version
       against the version in the `NIST CVE database <https://nvd.nist.gov/>`__
-      when usign :ref:`cve-check <ref-classes-cve-check>`.
+      when usign :ref:`ref-classes-cve-check`.
 
       The default is ${:term:`PV`} but if recipes use custom version numbers
       which do not map to upstream software component release versions and the versions
       used in the CVE database, then this variable can be used to set the
-      version number for :ref:`cve-check <ref-classes-cve-check>`. Example::
+      version number for :ref:`ref-classes-cve-check`. Example::
 
           CVE_VERSION = "2.39"
 
@@ -1743,7 +1733,7 @@ system and gives an overview of their function and contents.
       suitable for timestamps.
 
    :term:`DEBIAN_NOAUTONAME`
-      When the :ref:`debian <ref-classes-debian>` class is inherited,
+      When the :ref:`ref-classes-debian` class is inherited,
       which is the default behavior, :term:`DEBIAN_NOAUTONAME` specifies a
       particular package should not be renamed according to Debian library
       package naming. You must use the package name as an override when you
@@ -1752,7 +1742,7 @@ system and gives an overview of their function and contents.
          DEBIAN_NOAUTONAME:fontconfig-utils = "1"
 
    :term:`DEBIANNAME`
-      When the :ref:`debian <ref-classes-debian>` class is inherited,
+      When the :ref:`ref-classes-debian` class is inherited,
       which is the default behavior, :term:`DEBIANNAME` allows you to override
       the library name for an individual package. Overriding the library
       name in these cases is rare. You must use the package name as an
@@ -1832,7 +1822,7 @@ system and gives an overview of their function and contents.
       the :ref:`ref-tasks-populate_sysroot` task of
       each recipe listed in :term:`DEPENDS`, through a
       ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
-      declaration in the :ref:`base <ref-classes-base>` class.
+      declaration in the :ref:`ref-classes-base` class.
 
       .. note::
 
@@ -1848,7 +1838,7 @@ system and gives an overview of their function and contents.
          DEPENDS = "codegen-native"
 
       For more
-      information, see the :ref:`native <ref-classes-native>` class and
+      information, see the :ref:`ref-classes-native` class and
       the :term:`EXTRANATIVEPATH` variable.
 
       .. note::
@@ -1903,7 +1893,7 @@ system and gives an overview of their function and contents.
       Points to the area that the OpenEmbedded build system uses to place
       Debian packages that are ready to be used outside of the build
       system. This variable applies only when :term:`PACKAGE_CLASSES` contains
-      ":ref:`package_deb <ref-classes-package_deb>`".
+      ":ref:`ref-classes-package_deb`".
 
       The BitBake configuration file initially defines the
       :term:`DEPLOY_DIR_DEB` variable as a sub-folder of
@@ -1911,7 +1901,7 @@ system and gives an overview of their function and contents.
 
          DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 
-      The :ref:`package_deb <ref-classes-package_deb>` class uses the
+      The :ref:`ref-classes-package_deb` class uses the
       :term:`DEPLOY_DIR_DEB` variable to make sure the
       :ref:`ref-tasks-package_write_deb` task
       writes Debian packages into the appropriate folder. For more
@@ -1930,9 +1920,8 @@ system and gives an overview of their function and contents.
       It must not be used directly in recipes when deploying files. Instead,
       it's only useful when a recipe needs to "read" a file already deployed
       by a dependency. So, it should be filled with the contents of
-      :term:`DEPLOYDIR` by the :ref:`deploy <ref-classes-deploy>` class or
-      with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
-      <ref-classes-image>` class.
+      :term:`DEPLOYDIR` by the :ref:`ref-classes-deploy` class or with the
+      contents of :term:`IMGDEPLOYDIR` by the :ref:`ref-classes-image` class.
 
       For more information on the structure of the :term:`Build Directory`, see
       ":ref:`ref-manual/structure:the build directory --- \`\`build/\`\``" section.
@@ -1945,16 +1934,15 @@ system and gives an overview of their function and contents.
       Points to the area that the OpenEmbedded build system uses to place
       IPK packages that are ready to be used outside of the build system.
       This variable applies only when :term:`PACKAGE_CLASSES` contains
-      ":ref:`package_ipk <ref-classes-package_ipk>`".
+      ":ref:`ref-classes-package_ipk`".
 
       The BitBake configuration file initially defines this variable as a
       sub-folder of :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 
-      The :ref:`package_ipk <ref-classes-package_ipk>` class uses the
-      :term:`DEPLOY_DIR_IPK` variable to make sure the
-      :ref:`ref-tasks-package_write_ipk` task
+      The :ref:`ref-classes-package_ipk` class uses the :term:`DEPLOY_DIR_IPK`
+      variable to make sure the :ref:`ref-tasks-package_write_ipk` task
       writes IPK packages into the appropriate folder. For more information
       on how packaging works, see the
       ":ref:`overview-manual/concepts:package feeds`" section
@@ -1964,14 +1952,14 @@ system and gives an overview of their function and contents.
       Points to the area that the OpenEmbedded build system uses to place
       RPM packages that are ready to be used outside of the build system.
       This variable applies only when :term:`PACKAGE_CLASSES` contains
-      ":ref:`package_rpm <ref-classes-package_rpm>`".
+      ":ref:`ref-classes-package_rpm`".
 
       The BitBake configuration file initially defines this variable as a
       sub-folder of :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 
-      The :ref:`package_rpm <ref-classes-package_rpm>` class uses the
+      The :ref:`ref-classes-package_rpm` class uses the
       :term:`DEPLOY_DIR_RPM` variable to make sure the
       :ref:`ref-tasks-package_write_rpm` task
       writes RPM packages into the appropriate folder. For more information
@@ -1983,14 +1971,14 @@ system and gives an overview of their function and contents.
       Points to the area that the OpenEmbedded build system uses to place
       tarballs that are ready to be used outside of the build system. This
       variable applies only when :term:`PACKAGE_CLASSES` contains
-      ":ref:`package_tar <ref-classes-package_tar>`".
+      ":ref:`ref-classes-package_tar`".
 
       The BitBake configuration file initially defines this variable as a
       sub-folder of :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 
-      The :ref:`package_tar <ref-classes-package_tar>` class uses the
+      The :ref:`ref-classes-package_tar` class uses the
       :term:`DEPLOY_DIR_TAR` variable to make sure the
       :ref:`ref-tasks-package_write_tar` task
       writes TAR packages into the appropriate folder. For more information
@@ -1999,13 +1987,13 @@ system and gives an overview of their function and contents.
       in the Yocto Project Overview and Concepts Manual.
 
    :term:`DEPLOYDIR`
-      When inheriting the :ref:`deploy <ref-classes-deploy>` class, the
+      When inheriting the :ref:`ref-classes-deploy` class, the
       :term:`DEPLOYDIR` points to a temporary work area for deployed files that
-      is set in the :ref:`deploy <ref-classes-deploy>` class as follows::
+      is set in the :ref:`ref-classes-deploy` class as follows::
 
          DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 
-      Recipes inheriting the :ref:`deploy <ref-classes-deploy>` class should copy files to be
+      Recipes inheriting the :ref:`ref-classes-deploy` class should copy files to be
       deployed into :term:`DEPLOYDIR`, and the class will take care of copying
       them into :term:`DEPLOY_DIR_IMAGE`
       afterwards.
@@ -2141,10 +2129,9 @@ system and gives an overview of their function and contents.
    :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
       Specifies a list of features that if present in the target
       :term:`DISTRO_FEATURES` value should be included in
-      :term:`DISTRO_FEATURES` when building
-      :ref:`nativesdk <ref-classes-nativesdk>` recipes. This variable is used
-      in addition to the features filtered using the
-      :term:`DISTRO_FEATURES_NATIVESDK` variable.
+      :term:`DISTRO_FEATURES` when building :ref:`ref-classes-nativesdk`
+      recipes. This variable is used in addition to the features filtered using
+      the :term:`DISTRO_FEATURES_NATIVESDK` variable.
 
    :term:`DISTRO_FEATURES_NATIVE`
       Specifies a list of features that should be included in
@@ -2157,7 +2144,7 @@ system and gives an overview of their function and contents.
    :term:`DISTRO_FEATURES_NATIVESDK`
       Specifies a list of features that should be included in
       :term:`DISTRO_FEATURES` when building
-      :ref:`nativesdk <ref-classes-nativesdk>` recipes. This variable is used
+      :ref:`ref-classes-nativesdk` recipes. This variable is used
       in addition to the features filtered using the
       :term:`DISTRO_FEATURES_FILTER_NATIVESDK` variable.
 
@@ -2240,7 +2227,7 @@ system and gives an overview of their function and contents.
       Wiki page.
 
    :term:`DOC_COMPRESS`
-      When inheriting the :ref:`compress_doc <ref-classes-compress_doc>`
+      When inheriting the :ref:`ref-classes-compress_doc`
       class, this variable sets the compression policy used when the
       OpenEmbedded build system compresses man pages and info pages. By
       default, the compression method used is gz (gzip). Other policies
@@ -2255,9 +2242,8 @@ system and gives an overview of their function and contents.
       :term:`EFI_PROVIDER` variable specifies the EFI bootloader to use. The
       default is "grub-efi", but "systemd-boot" can be used instead.
 
-      See the :ref:`systemd-boot <ref-classes-systemd-boot>` and
-      :ref:`image-live <ref-classes-image-live>` classes for more
-      information.
+      See the :ref:`ref-classes-systemd-boot` and :ref:`ref-classes-image-live`
+      classes for more information.
 
    :term:`ENABLE_BINARY_LOCALE_GENERATION`
       Variable that controls which locales for ``glibc`` are generated
@@ -2265,11 +2251,10 @@ system and gives an overview of their function and contents.
       less).
 
    :term:`ERR_REPORT_DIR`
-      When used with the :ref:`report-error <ref-classes-report-error>`
-      class, specifies the path used for storing the debug files created by
-      the :ref:`error reporting
-      tool <dev-manual/error-reporting-tool:using the error reporting tool>`, which
-      allows you to submit build errors you encounter to a central
+      When used with the :ref:`ref-classes-report-error` class, specifies the
+      path used for storing the debug files created by the :ref:`error reporting
+      tool <dev-manual/error-reporting-tool:using the error reporting tool>`,
+      which allows you to submit build errors you encounter to a central
       database. By default, the value of this variable is
       ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
@@ -2413,8 +2398,7 @@ system and gives an overview of their function and contents.
       When kernel tools are available in the tree, they are preferred over
       any externally installed tools. Setting the :term:`EXTERNAL_KERNEL_TOOLS`
       variable tells the OpenEmbedded build system to prefer the installed
-      external tools. See the
-      :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
+      external tools. See the :ref:`ref-classes-kernel-yocto` class in
       ``meta/classes-recipe`` to see how the variable is used.
 
    :term:`EXTERNAL_TOOLCHAIN`
@@ -2424,7 +2408,7 @@ system and gives an overview of their function and contents.
       installed.
 
    :term:`EXTERNALSRC`
-      When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
+      When inheriting the :ref:`ref-classes-externalsrc`
       class, this variable points to the source tree, which is outside of
       the OpenEmbedded build system. When set, this variable sets the
       :term:`S` variable, which is what the OpenEmbedded build
@@ -2436,7 +2420,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTERNALSRC_BUILD`
-      When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
+      When inheriting the :ref:`ref-classes-externalsrc`
       class, this variable points to the directory in which the recipe's
       source code is built, which is outside of the OpenEmbedded build
       system. When set, this variable sets the :term:`B` variable,
@@ -2449,7 +2433,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`EXTRA_AUTORECONF`
-      For recipes inheriting the :ref:`autotools <ref-classes-autotools>`
+      For recipes inheriting the :ref:`ref-classes-autotools`
       class, you can use :term:`EXTRA_AUTORECONF` to specify extra options to
       pass to the ``autoreconf`` command that is executed during the
       :ref:`ref-tasks-configure` task.
@@ -2522,7 +2506,7 @@ system and gives an overview of their function and contents.
 
    :term:`EXTRA_OECMAKE`
       Additional `CMake <https://cmake.org/overview/>`__ options. See the
-      :ref:`cmake <ref-classes-cmake>` class for additional information.
+      :ref:`ref-classes-cmake` class for additional information.
 
    :term:`EXTRA_OECONF`
       Additional ``configure`` script options. See
@@ -2540,21 +2524,22 @@ system and gives an overview of their function and contents.
       :term:`EXTRA_OEMAKE` to pass the required flags.
 
    :term:`EXTRA_OESCONS`
-      When inheriting the :ref:`scons <ref-classes-scons>` class, this
+      When inheriting the :ref:`ref-classes-scons` class, this
       variable specifies additional configuration options you want to pass
       to the ``scons`` command line.
 
    :term:`EXTRA_USERS_PARAMS`
-      When inheriting the :ref:`extrausers <ref-classes-extrausers>`
+      When inheriting the :ref:`ref-classes-extrausers`
       class, this variable provides image level user and group operations.
       This is a more global method of providing user and group
       configuration as compared to using the
-      :ref:`useradd <ref-classes-useradd>` class, which ties user and
+      :ref:`ref-classes-useradd` class, which ties user and
       group configurations to a specific recipe.
 
       The set list of commands you can configure using the
-      :term:`EXTRA_USERS_PARAMS` is shown in the :ref:`extrausers <ref-classes-extrausers>` class. These
-      commands map to the normal Unix commands of the same names::
+      :term:`EXTRA_USERS_PARAMS` is shown in the
+      :ref:`ref-classes-extrausers` class. These commands map to the normal
+      Unix commands of the same names::
 
          # EXTRA_USERS_PARAMS = "\
          # useradd -p '' tester; \
@@ -2892,7 +2877,7 @@ system and gives an overview of their function and contents.
 
    :term:`FIT_DESC`
       Specifies the description string encoded into a fitImage. The default
-      value is set by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
+      value is set by the :ref:`ref-classes-kernel-fitimage`
       class as follows::
 
          FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
@@ -2938,7 +2923,7 @@ system and gives an overview of their function and contents.
       The default value is "pkcs-1.5".
 
    :term:`FIT_SIGN_INDIVIDUAL`
-      If set to "1", then the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
+      If set to "1", then the :ref:`ref-classes-kernel-fitimage`
       class will sign the kernel, dtb and ramdisk images individually in addition
       to signing the fitImage itself. This could be useful if you are
       intending to verify signatures in another context than booting via
@@ -2949,14 +2934,14 @@ system and gives an overview of their function and contents.
       value is "2048".
 
    :term:`FONT_EXTRA_RDEPENDS`
-      When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
+      When inheriting the :ref:`ref-classes-fontcache` class,
       this variable specifies the runtime dependencies for font packages.
       By default, the :term:`FONT_EXTRA_RDEPENDS` is set to "fontconfig-utils".
 
    :term:`FONT_PACKAGES`
-      When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
-      this variable identifies packages containing font files that need to
-      be cached by Fontconfig. By default, the :ref:`fontcache <ref-classes-fontcache>` class assumes
+      When inheriting the :ref:`ref-classes-fontcache` class, this variable
+      identifies packages containing font files that need to be cached by
+      Fontconfig. By default, the :ref:`ref-classes-fontcache` class assumes
       that fonts are in the recipe's main package (i.e.
       ``${``\ :term:`PN`\ ``}``). Use this variable if fonts you
       need are in a package other than that main package.
@@ -3007,7 +2992,7 @@ system and gives an overview of their function and contents.
       when it is cloned.
 
    :term:`GITHUB_BASE_URI`
-      When inheriting the :ref:`github-releases <ref-classes-github-releases>`
+      When inheriting the :ref:`ref-classes-github-releases`
       class, specifies the base URL for fetching releases for the github
       project you wish to fetch sources from. The default value is as follows::
 
@@ -3028,7 +3013,7 @@ system and gives an overview of their function and contents.
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 
    :term:`GROUPADD_PARAM`
-      When inheriting the :ref:`useradd <ref-classes-useradd>` class,
+      When inheriting the :ref:`ref-classes-useradd` class,
       this variable specifies for a package what parameters should be
       passed to the ``groupadd`` command if you wish to add a group to the
       system when the package is installed.
@@ -3041,7 +3026,7 @@ system and gives an overview of their function and contents.
       ``groupadd``, see https://linux.die.net/man/8/groupadd.
 
    :term:`GROUPMEMS_PARAM`
-      When inheriting the :ref:`useradd <ref-classes-useradd>` class,
+      When inheriting the :ref:`ref-classes-useradd` class,
       this variable specifies for a package what parameters should be
       passed to the ``groupmems`` command if you wish to modify the members
       of a group when the package is installed.
@@ -3055,7 +3040,7 @@ system and gives an overview of their function and contents.
       ``local.conf`` or distribution configuration file to enable graphics
       and serial in the menu.
 
-      See the :ref:`grub-efi <ref-classes-grub-efi>` class for more
+      See the :ref:`ref-classes-grub-efi` class for more
       information on how this variable is used.
 
    :term:`GRUB_OPTS`
@@ -3064,7 +3049,7 @@ system and gives an overview of their function and contents.
       multiple options.
 
       The :term:`GRUB_OPTS` variable is optional. See the
-      :ref:`grub-efi <ref-classes-grub-efi>` class for more information
+      :ref:`ref-classes-grub-efi` class for more information
       on how this variable is used.
 
    :term:`GRUB_TIMEOUT`
@@ -3072,12 +3057,11 @@ system and gives an overview of their function and contents.
       GNU GRand Unified Bootloader (GRUB).
 
       The :term:`GRUB_TIMEOUT` variable is optional. See the
-      :ref:`grub-efi <ref-classes-grub-efi>` class for more information
+      :ref:`ref-classes-grub-efi` class for more information
       on how this variable is used.
 
    :term:`GTKIMMODULES_PACKAGES`
-      When inheriting the
-      :ref:`gtk-immodules-cache <ref-classes-gtk-immodules-cache>` class,
+      When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
       this variable specifies the packages that contain the GTK+ input
       method modules being installed when the modules are in packages other
       than the main package.
@@ -3180,7 +3164,7 @@ system and gives an overview of their function and contents.
    :term:`ICECC_CLASS_DISABLE`
       Identifies user classes that you do not want the Icecream distributed
       compile support to consider. This variable is used by the
-      :ref:`icecc <ref-classes-icecc>` class. You set this variable in
+      :ref:`ref-classes-icecc` class. You set this variable in
       your ``local.conf`` file.
 
       When you list classes using this variable, the recipes inheriting
@@ -3204,7 +3188,7 @@ system and gives an overview of their function and contents.
 
    :term:`ICECC_ENV_EXEC`
       Points to the ``icecc-create-env`` script that you provide. This
-      variable is used by the :ref:`icecc <ref-classes-icecc>` class. You
+      variable is used by the :ref:`ref-classes-icecc` class. You
       set this variable in your ``local.conf`` file.
 
       If you do not point to a script that you provide, the OpenEmbedded
@@ -3241,13 +3225,13 @@ system and gives an overview of their function and contents.
    :term:`ICECC_PATH`
       The location of the ``icecc`` binary. You can set this variable in
       your ``local.conf`` file. If your ``local.conf`` file does not define
-      this variable, the :ref:`icecc <ref-classes-icecc>` class attempts
+      this variable, the :ref:`ref-classes-icecc` class attempts
       to define it by locating ``icecc`` using ``which``.
 
    :term:`ICECC_RECIPE_DISABLE`
       Identifies user recipes that you do not want the Icecream distributed
       compile support to consider. This variable is used by the
-      :ref:`icecc <ref-classes-icecc>` class. You set this variable in
+      :ref:`ref-classes-icecc` class. You set this variable in
       your ``local.conf`` file.
 
       When you list recipes using this variable, you are excluding them
@@ -3259,7 +3243,7 @@ system and gives an overview of their function and contents.
       :term:`PARALLEL_MAKE` variable that you want to
       force remote distributed compilation on using the Icecream
       distributed compile support. This variable is used by the
-      :ref:`icecc <ref-classes-icecc>` class. You set this variable in
+      :ref:`ref-classes-icecc` class. You set this variable in
       your ``local.conf`` file.
 
    :term:`IMAGE_BASENAME`
@@ -3301,12 +3285,12 @@ system and gives an overview of their function and contents.
       ":doc:`/ref-manual/kickstart`" chapter.
 
    :term:`IMAGE_BUILDINFO_FILE`
-      When using the :ref:`image-buildinfo <ref-classes-image-buildinfo>` class,
+      When using the :ref:`ref-classes-image-buildinfo` class,
       specifies the file in the image to write the build information into. The
       default value is "``${sysconfdir}/buildinfo``".
 
    :term:`IMAGE_BUILDINFO_VARS`
-      When using the :ref:`image-buildinfo <ref-classes-image-buildinfo>` class,
+      When using the :ref:`ref-classes-image-buildinfo` class,
       specifies the list of variables to include in the `Build Configuration`
       section of the output file (as a space-separated list). Defaults to
       ":term:`DISTRO` :term:`DISTRO_VERSION`".
@@ -3331,7 +3315,7 @@ system and gives an overview of their function and contents.
 
       You typically do not need to set this variable unless you are adding
       support for a new image type. For more examples on how to set this
-      variable, see the :ref:`image_types <ref-classes-image_types>`
+      variable, see the :ref:`ref-classes-image_types`
       class file, which is ``meta/classes-recipe/image_types.bbclass``.
 
    :term:`IMAGE_DEVICE_TABLES`
@@ -3421,16 +3405,15 @@ system and gives an overview of their function and contents.
 
    :term:`IMAGE_INSTALL`
       Used by recipes to specify the packages to install into an image
-      through the :ref:`image <ref-classes-image>` class. Use the
+      through the :ref:`ref-classes-image` class. Use the
       :term:`IMAGE_INSTALL` variable with care to avoid ordering issues.
 
       Image recipes set :term:`IMAGE_INSTALL` to specify the packages to
       install into an image through :ref:`ref-classes-image`. Additionally,
-      there are "helper" classes such as the
-      :ref:`core-image <ref-classes-core-image>` class which can
-      take lists used with :term:`IMAGE_FEATURES` and turn them into
-      auto-generated entries in :term:`IMAGE_INSTALL` in addition to its
-      default contents.
+      there are "helper" classes such as the :ref:`ref-classes-core-image`
+      class which can take lists used with :term:`IMAGE_FEATURES` and turn
+      them into auto-generated entries in :term:`IMAGE_INSTALL` in addition
+      to its default contents.
 
       When you use this variable, it is best to use it as follows::
 
@@ -3563,19 +3546,16 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_PKGTYPE`
       Defines the package type (i.e. DEB, RPM, IPK, or TAR) used by the
       OpenEmbedded build system. The variable is defined appropriately by
-      the :ref:`package_deb <ref-classes-package_deb>`,
-      :ref:`package_rpm <ref-classes-package_rpm>`,
-      :ref:`package_ipk <ref-classes-package_ipk>`, or
-      :ref:`package_tar <ref-classes-package_tar>` class.
+      the :ref:`ref-classes-package_deb`, :ref:`ref-classes-package_rpm`,
+      :ref:`ref-classes-package_ipk`, or :ref:`ref-classes-package_tar` class.
 
       .. note::
 
          The ``package_tar`` class is broken and is not supported. It is
          recommended that you do not use it.
 
-      The :ref:`populate_sdk_* <ref-classes-populate-sdk-*>` and
-      :ref:`image <ref-classes-image>` classes use the :term:`IMAGE_PKGTYPE`
-      for packaging up images and SDKs.
+      The :ref:`ref-classes-populate-sdk-*` and :ref:`ref-classes-image`
+      classes use the :term:`IMAGE_PKGTYPE` for packaging up images and SDKs.
 
       You should not set the :term:`IMAGE_PKGTYPE` manually. Rather, the
       variable is set indirectly through the appropriate
@@ -3672,7 +3652,7 @@ system and gives an overview of their function and contents.
 
    :term:`IMAGE_TYPEDEP`
       Specifies a dependency from one image type on another. Here is an
-      example from the :ref:`image-live <ref-classes-image-live>` class::
+      example from the :ref:`ref-classes-image-live` class::
 
          IMAGE_TYPEDEP:live = "ext3"
 
@@ -3739,14 +3719,14 @@ system and gives an overview of their function and contents.
       the build artifacts.
 
    :term:`IMGDEPLOYDIR`
-      When inheriting the :ref:`image <ref-classes-image>` class directly or
-      through the :ref:`core-image <ref-classes-core-image>` class, the
+      When inheriting the :ref:`ref-classes-image` class directly or
+      through the :ref:`ref-classes-core-image` class, the
       :term:`IMGDEPLOYDIR` points to a temporary work area for deployed files
       that is set in the ``image`` class as follows::
 
          IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
-      Recipes inheriting the :ref:`image <ref-classes-image>` class should copy
+      Recipes inheriting the :ref:`ref-classes-image` class should copy
       files to be deployed into :term:`IMGDEPLOYDIR`, and the class will take
       care of copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
 
@@ -3889,10 +3869,9 @@ system and gives an overview of their function and contents.
       :term:`INHIBIT_SYSROOT_STRIP` variable to "1" in your recipe, you inhibit
       this stripping.
 
-      If you want to use this variable, include the
-      :ref:`staging <ref-classes-staging>` class. This class uses a
-      ``sys_strip()`` function to test for the variable and acts
-      accordingly.
+      If you want to use this variable, include the :ref:`ref-classes-staging`
+      class. This class uses a ``sys_strip()`` function to test for the variable
+      and acts accordingly.
 
       .. note::
 
@@ -3945,11 +3924,12 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
-      Indicates the deploy directory used by :ref:`ref-tasks-bundle_initramfs` where the
-      :term:`INITRAMFS_IMAGE` will be fetched from.
-      This variable is set by default to ``${DEPLOY_DIR_IMAGE}`` in the
-      :ref:`kernel <ref-classes-kernel>` class and it's only meant to be changed
-      when building an :term:`Initramfs` image from a separate multiconfig via :term:`INITRAMFS_MULTICONFIG`.
+      Indicates the deploy directory used by :ref:`ref-tasks-bundle_initramfs`
+      where the :term:`INITRAMFS_IMAGE` will be fetched from. This variable is
+      set by default to ``${DEPLOY_DIR_IMAGE}`` in the
+      :ref:`ref-classes-kernel` class and it's only meant to be changed when
+      building an :term:`Initramfs` image from a separate multiconfig via
+      :term:`INITRAMFS_MULTICONFIG`.
 
    :term:`INITRAMFS_FSTYPES`
       Defines the format for the output image of an initial RAM filesystem
@@ -3988,9 +3968,9 @@ system and gives an overview of their function and contents.
 
       You can also find more information by referencing the
       ``meta-poky/conf/templates/default/local.conf.sample.extended``
-      configuration file in the Source Directory, the :ref:`image
-      <ref-classes-image>` class, and the :ref:`kernel <ref-classes-kernel>`
-      class to see how to use the :term:`INITRAMFS_IMAGE` variable.
+      configuration file in the Source Directory, the :ref:`ref-classes-image`
+      class, and the :ref:`ref-classes-kernel` class to see how to use the
+      :term:`INITRAMFS_IMAGE` variable.
 
       If :term:`INITRAMFS_IMAGE` is empty, which is the default, then no
       :term:`Initramfs` image is built.
@@ -4037,8 +4017,7 @@ system and gives an overview of their function and contents.
 
          INITRAMFS_IMAGE_BUNDLE = "1"
 
-      By default, the
-      :ref:`kernel <ref-classes-kernel>` class sets this variable to a
+      By default, the :ref:`ref-classes-kernel` class sets this variable to a
       null string as follows::
 
          INITRAMFS_IMAGE_BUNDLE ?= ""
@@ -4071,7 +4050,8 @@ system and gives an overview of their function and contents.
       information.
 
    :term:`INITRAMFS_MULTICONFIG`
-      Defines the multiconfig to create a multiconfig dependency to be used by the :ref:`kernel <ref-classes-kernel>` class.
+      Defines the multiconfig to create a multiconfig dependency to be used by
+      the :ref:`ref-classes-kernel` class.
 
       This allows the kernel to bundle an :term:`INITRAMFS_IMAGE` coming from
       a separate multiconfig, this is meant to be used in addition to :term:`INITRAMFS_DEPLOY_DIR_IMAGE`.
@@ -4097,7 +4077,7 @@ system and gives an overview of their function and contents.
       initial RAM disk (``initrd``).
 
       The :term:`INITRD` variable is an optional variable used with the
-      :ref:`image-live <ref-classes-image-live>` class.
+      :ref:`ref-classes-image-live` class.
 
    :term:`INITRD_IMAGE`
       When building a "live" bootable image (i.e. when
@@ -4106,8 +4086,7 @@ system and gives an overview of their function and contents.
       provide the initial RAM disk image. The default value is
       "core-image-minimal-initramfs".
 
-      See the :ref:`image-live <ref-classes-image-live>` class for more
-      information.
+      See the :ref:`ref-classes-image-live` class for more information.
 
    :term:`INITSCRIPT_NAME`
       The filename of the initialization script as installed to
@@ -4134,7 +4113,7 @@ system and gives an overview of their function and contents.
       in initlevels 2 and 5, and stops the script in levels 0, 1 and 6.
 
       The variable's default value is "defaults", which is set in the
-      :ref:`update-rc.d <ref-classes-update-rc.d>` class.
+      :ref:`ref-classes-update-rc.d` class.
 
       The value in :term:`INITSCRIPT_PARAMS` is passed through to the
       ``update-rc.d`` command. For more information on valid parameters,
@@ -4212,7 +4191,7 @@ system and gives an overview of their function and contents.
       BSP.
 
    :term:`KBUILD_DEFCONFIG`
-      When used with the :ref:`kernel-yocto <ref-classes-kernel-yocto>`
+      When used with the :ref:`ref-classes-kernel-yocto`
       class, specifies an "in-tree" kernel configuration file for use
       during a kernel build.
 
@@ -4245,7 +4224,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Linux Kernel Development Manual.
 
    :term:`KCONFIG_MODE`
-      When used with the :ref:`kernel-yocto <ref-classes-kernel-yocto>`
+      When used with the :ref:`ref-classes-kernel-yocto`
       class, specifies the kernel configuration values to use for options
       not specified in the provided ``defconfig`` file. Valid options are::
 
@@ -4302,12 +4281,12 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_CLASSES`
       A list of classes defining kernel image types that the
-      :ref:`kernel <ref-classes-kernel>` class should inherit. You typically
+      :ref:`ref-classes-kernel` class should inherit. You typically
       append this variable to enable extended image types. An example is
-      ":ref:`kernel-fitimage <ref-classes-kernel-fitimage>`", which enables
+      ":ref:`ref-classes-kernel-fitimage`", which enables
       fitImage support and resides in ``meta/classes-recipe/kernel-fitimage.bbclass``.
       You can register custom kernel image types with the
-      :ref:`kernel <ref-classes-kernel>` class using this variable.
+      :ref:`ref-classes-kernel` class using this variable.
 
    :term:`KERNEL_DEBUG_TIMESTAMPS`
       If set to "1", enables timestamping functionality during building
@@ -4329,9 +4308,8 @@ system and gives an overview of their function and contents.
          There is legacy support for specifying the full path to the device
          tree. However, providing just the ``.dtb`` file is preferred.
 
-      In order to use this variable, the
-      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
-      be inherited.
+      In order to use this variable, the :ref:`ref-classes-kernel-devicetree`
+      class must be inherited.
 
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
@@ -4366,9 +4344,8 @@ system and gives an overview of their function and contents.
       system when generating the device trees (via ``DTC_FLAGS`` environment
       variable).
 
-      In order to use this variable, the
-      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
-      be inherited.
+      In order to use this variable, the :ref:`ref-classes-kernel-devicetree`
+      class must be inherited.
 
    :term:`KERNEL_EXTRA_ARGS`
       Specifies additional ``make`` command-line arguments the OpenEmbedded
@@ -4519,9 +4496,8 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_PATH`
       The location of the kernel sources. This variable is set to the value
-      of the :term:`STAGING_KERNEL_DIR` within
-      the :ref:`module <ref-classes-module>` class. For information on
-      how this variable is used, see the
+      of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
+      class. For information on how this variable is used, see the
       ":ref:`kernel-dev/common:incorporating out-of-tree modules`"
       section in the Yocto Project Linux Kernel Development Manual.
 
@@ -4533,9 +4509,8 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
-      of the :term:`STAGING_KERNEL_DIR` within
-      the :ref:`module <ref-classes-module>` class. For information on
-      how this variable is used, see the
+      of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
+      class. For information on how this variable is used, see the
       ":ref:`kernel-dev/common:incorporating out-of-tree modules`"
       section in the Yocto Project Linux Kernel Development Manual.
 
@@ -4613,7 +4588,7 @@ system and gives an overview of their function and contents.
    :term:`LABELS`
       Provides a list of targets for automatic configuration.
 
-      See the :ref:`grub-efi <ref-classes-grub-efi>` class for more
+      See the :ref:`ref-classes-grub-efi` class for more
       information on how this variable is used.
 
    :term:`LAYERDEPENDS`
@@ -4715,10 +4690,11 @@ system and gives an overview of their function and contents.
 
    :term:`LEAD_SONAME`
       Specifies the lead (or primary) compiled library file (i.e. ``.so``)
-      that the :ref:`debian <ref-classes-debian>` class applies its
+      that the :ref:`ref-classes-debian` class applies its
       naming policy to given a recipe that packages multiple libraries.
 
-      This variable works in conjunction with the :ref:`debian <ref-classes-debian>` class.
+      This variable works in conjunction with the :ref:`ref-classes-debian`
+      class.
 
    :term:`LIC_FILES_CHKSUM`
       Checksums of the license text in the recipe source code.
@@ -5103,7 +5079,7 @@ system and gives an overview of their function and contents.
       determined by :term:`COREBASE`).
 
    :term:`MIME_XDG_PACKAGES`
-      The current implementation of the :ref:`mime-xdg <ref-classes-mime-xdg>`
+      The current implementation of the :ref:`ref-classes-mime-xdg`
       class cannot detect ``.desktop`` files installed through absolute
       symbolic links. Use this setting to make the class create post-install
       and post-remove scripts for these packages anyway, to invoke the
@@ -5131,20 +5107,18 @@ system and gives an overview of their function and contents.
       .. note::
 
          The "ML" in :term:`MLPREFIX` stands for "MultiLib". This representation
-         is historical and comes from a time when
-         ":ref:`nativesdk <ref-classes-nativesdk>`"
+         is historical and comes from a time when ":ref:`ref-classes-nativesdk`"
          was a suffix rather than a prefix on the recipe name. When
-         ":ref:`nativesdk <ref-classes-nativesdk>`" was turned
-         into a prefix, it made sense to set :term:`MLPREFIX` for it as well.
+         ":ref:`ref-classes-nativesdk`" was turned into a prefix, it made sense
+         to set :term:`MLPREFIX` for it as well.
 
       To help understand when :term:`MLPREFIX` might be needed, consider when
-      :term:`BBCLASSEXTEND` is used to provide a
-      :ref:`nativesdk <ref-classes-nativesdk>` version of a recipe in addition
-      to the target version. If that recipe declares build-time dependencies
-      on tasks in other recipes by using :term:`DEPENDS`, then a dependency on
-      "foo" will automatically get rewritten to a dependency on
-      "nativesdk-foo". However, dependencies like the following will not
-      get rewritten automatically::
+      :term:`BBCLASSEXTEND` is used to provide a :ref:`ref-classes-nativesdk`
+      version of a recipe in addition to the target version. If that recipe
+      declares build-time dependencies on tasks in other recipes by using
+      :term:`DEPENDS`, then a dependency on "foo" will automatically get
+      rewritten to a dependency on "nativesdk-foo". However, dependencies like
+      the following will not get rewritten automatically::
 
          do_foo[depends] += "recipe:do_foo"
 
@@ -5243,8 +5217,7 @@ system and gives an overview of their function and contents.
 
          ${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}
 
-      Some classes (e.g.
-      :ref:`cross-canadian <ref-classes-cross-canadian>`) modify the
+      Some classes (e.g.  :ref:`ref-classes-cross-canadian`) modify the
       :term:`MULTIMACH_TARGET_SYS` value.
 
       See the :term:`STAMP` variable for an example. See the
@@ -5346,7 +5319,7 @@ system and gives an overview of their function and contents.
       The minimal command and arguments to run ``objdump``.
 
    :term:`OE_BINCONFIG_EXTRA_MANGLE`
-      When inheriting the :ref:`binconfig <ref-classes-binconfig>` class,
+      When inheriting the :ref:`ref-classes-binconfig` class,
       this variable specifies additional arguments passed to the "sed"
       command. The sed command alters any paths in configuration scripts
       that have been set up during compilation. Inheriting this class
@@ -5412,68 +5385,67 @@ system and gives an overview of their function and contents.
       configuration file.
 
    :term:`OVERLAYFS_ETC_DEVICE`
-      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the device to be mounted for the read/write
       layer of ``/etc``. There is no default, so you must set this if you
-      wish to enable :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`, for
+      wish to enable :ref:`ref-classes-overlayfs-etc`, for
       example, assuming ``/dev/mmcblk0p2`` was the desired device::
 
          OVERLAYFS_ETC_DEVICE = "/dev/mmcblk0p2"
 
    :term:`OVERLAYFS_ETC_EXPOSE_LOWER`
-      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, if set to "1" then a read-only access to the original
       ``/etc`` content will be provided as a ``lower/`` subdirectory of
       :term:`OVERLAYFS_ETC_MOUNT_POINT`. The default value is "0".
 
    :term:`OVERLAYFS_ETC_FSTYPE`
-      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the file system type for the read/write
       layer of ``/etc``. There is no default, so you must set this if you
-      wish to enable :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`,
+      wish to enable :ref:`ref-classes-overlayfs-etc`,
       for example, assuming the file system is ext4::
 
          OVERLAYFS_ETC_FSTYPE = "ext4"
 
    :term:`OVERLAYFS_ETC_MOUNT_OPTIONS`
-      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the mount options for the read-write layer.
       The default value is "defaults".
 
    :term:`OVERLAYFS_ETC_MOUNT_POINT`
-      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
+      When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the parent mount path for the filesystem layers.
       There is no default, so you must set this if you wish to enable
-      :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`, for example if
-      the desired path is "/data"::
+      :ref:`ref-classes-overlayfs-etc`, for example if the desired path is
+      "/data"::
 
          OVERLAYFS_ETC_MOUNT_POINT = "/data"
 
    :term:`OVERLAYFS_ETC_USE_ORIG_INIT_NAME`
-      When the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>` class is
-      inherited, controls how the generated init will be named. For more
-      information, see the :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`
-      class documentation. The default value is "1".
+      When the :ref:`ref-classes-overlayfs-etc` class is inherited, controls
+      how the generated init will be named. For more information, see the
+      :ref:`ref-classes-overlayfs-etc` class documentation. The default value
+      is "1".
 
    :term:`OVERLAYFS_MOUNT_POINT`
-      When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
+      When inheriting the :ref:`ref-classes-overlayfs` class,
       specifies mount point(s) to be used. For example::
 
          OVERLAYFS_MOUNT_POINT[data] = "/data"
 
-      The assumes you have a ``data.mount`` systemd unit defined elsewhere
-      in your BSP (e.g. in ``systemd-machine-units`` recipe) and it is
-      installed into the image. For more information see
-      :ref:`overlayfs <ref-classes-overlayfs>`.
+      The assumes you have a ``data.mount`` systemd unit defined elsewhere in
+      your BSP (e.g. in ``systemd-machine-units`` recipe) and it is installed
+      into the image. For more information see :ref:`ref-classes-overlayfs`.
 
       .. note::
 
-         Although the :ref:`overlayfs <ref-classes-overlayfs>` class is
+         Although the :ref:`ref-classes-overlayfs` class is
          inherited by individual recipes, :term:`OVERLAYFS_MOUNT_POINT`
          should be set in your machine configuration.
 
    :term:`OVERLAYFS_QA_SKIP`
-      When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
+      When inheriting the :ref:`ref-classes-overlayfs` class,
       provides the ability to disable QA checks for particular overlayfs
       mounts. For example::
 
@@ -5481,12 +5453,12 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Although the :ref:`overlayfs <ref-classes-overlayfs>` class is
+         Although the :ref:`ref-classes-overlayfs` class is
          inherited by individual recipes, :term:`OVERLAYFS_QA_SKIP`
          should be set in your machine configuration.
 
    :term:`OVERLAYFS_WRITABLE_PATHS`
-      When inheriting the :ref:`overlayfs <ref-classes-overlayfs>` class,
+      When inheriting the :ref:`ref-classes-overlayfs` class,
       specifies writable paths used at runtime for the recipe. For
       example::
 
@@ -5598,7 +5570,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         While it is a legal option, the :ref:`package_tar <ref-classes-package_tar>`
+         While it is a legal option, the :ref:`ref-classes-package_tar`
          class has limited functionality due to no support for package
          dependencies by that backend. Therefore, it is recommended that
          you do not use it.
@@ -5936,16 +5908,15 @@ system and gives an overview of their function and contents.
       A space-separated list of configuration options generated from the
       :term:`PACKAGECONFIG` setting.
 
-      Classes such as :ref:`autotools <ref-classes-autotools>` and
-      :ref:`cmake <ref-classes-cmake>` use :term:`PACKAGECONFIG_CONFARGS` to
-      pass :term:`PACKAGECONFIG` options to ``configure`` and ``cmake``,
-      respectively. If you are using :term:`PACKAGECONFIG` but not a class that
-      handles the :ref:`ref-tasks-configure` task, then you need to use
+      Classes such as :ref:`ref-classes-autotools` and :ref:`ref-classes-cmake`
+      use :term:`PACKAGECONFIG_CONFARGS` to pass :term:`PACKAGECONFIG` options
+      to ``configure`` and ``cmake``, respectively. If you are using
+      :term:`PACKAGECONFIG` but not a class that handles the
+      :ref:`ref-tasks-configure` task, then you need to use
       :term:`PACKAGECONFIG_CONFARGS` appropriately.
 
    :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY`
-      For recipes inheriting the
-      :ref:`packagegroup <ref-classes-packagegroup>` class, setting
+      For recipes inheriting the :ref:`ref-classes-packagegroup` class, setting
       :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY` to "1" specifies that the
       normal complementary packages (i.e. ``-dev``, ``-dbg``, and so forth)
       should not be automatically created by the ``packagegroup`` recipe,
@@ -6097,9 +6068,8 @@ system and gives an overview of their function and contents.
       :term:`PE` is the default value of the :term:`PKGE` variable.
 
    :term:`PEP517_WHEEL_PATH`
-      When used by recipes that inherit the
-      :ref:`python_pep517 <ref-classes-python_pep517>` class,
-      denotes the path to ``dist/`` (short for distribution) where the
+      When used by recipes that inherit the :ref:`ref-classes-python_pep517`
+      class, denotes the path to ``dist/`` (short for distribution) where the
       binary archive ``wheel`` is built.
 
    :term:`PERSISTENT_DIR`
@@ -6112,10 +6082,10 @@ system and gives an overview of their function and contents.
       ${:term:`PN`}-${:term:`EXTENDPE`}${:term:`PV`}-${:term:`PR`}
 
    :term:`PIXBUF_PACKAGES`
-      When inheriting the :ref:`pixbufcache <ref-classes-pixbufcache>`
+      When inheriting the :ref:`ref-classes-pixbufcache`
       class, this variable identifies packages that contain the pixbuf
       loaders used with ``gdk-pixbuf``. By default, the
-      :ref:`pixbufcache <ref-classes-pixbufcache>` class assumes that
+      :ref:`ref-classes-pixbufcache` class assumes that
       the loaders are in the recipe's main package (i.e.
       ``${``\ :term:`PN`\ ``}``). Use this variable if the
       loaders you need are in a package other than that main package.
@@ -6128,9 +6098,8 @@ system and gives an overview of their function and contents.
 
          When using the :term:`PKG` variable, you must use a package name override.
 
-      For example, when the :ref:`debian <ref-classes-debian>` class
-      renames the output package, it does so by setting
-      ``PKG:packagename``.
+      For example, when the :ref:`ref-classes-debian` class renames the output
+      package, it does so by setting ``PKG:packagename``.
 
    :term:`PKG_CONFIG_PATH`
       The path to ``pkg-config`` files for the current build context.
@@ -6531,7 +6500,7 @@ system and gives an overview of their function and contents.
       :term:`PV` is the default value of the :term:`PKGV` variable.
 
    :term:`PYPI_PACKAGE`
-      When inheriting the :ref:`pypi <ref-classes-pypi>` class, specifies the
+      When inheriting the :ref:`ref-classes-pypi` class, specifies the
       `PyPI <https://pypi.org/>`__ package name to be built. The default value
       is set based upon :term:`BPN` (stripping any "python-" or "python3-"
       prefix off if present), however for some packages it will need to be set
@@ -6539,22 +6508,20 @@ system and gives an overview of their function and contents.
       package name has a prefix, underscores, uppercase letters etc.)
 
    :term:`PYTHON_ABI`
-      When used by recipes that inherit the
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, denotes the
-      Application Binary Interface (ABI) currently in use for Python. By
-      default, the ABI is "m". You do not have to set this variable as the
-      OpenEmbedded build system sets it for you.
+      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
+      class, denotes the Application Binary Interface (ABI) currently in use
+      for Python. By default, the ABI is "m". You do not have to set this
+      variable as the OpenEmbedded build system sets it for you.
 
       The OpenEmbedded build system uses the ABI to construct directory
       names used when installing the Python headers and libraries in
       sysroot (e.g. ``.../python3.3m/...``).
 
    :term:`PYTHON_PN`
-      When used by recipes that inherit the
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, specifies the
-      major Python version being built. For Python 3.x, :term:`PYTHON_PN` would
-      be "python3". You do not have to set this variable as the
-      OpenEmbedded build system automatically sets it for you.
+      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
+      class, specifies the major Python version being built. For Python 3.x,
+      :term:`PYTHON_PN` would be "python3". You do not have to set this
+      variable as the OpenEmbedded build system automatically sets it for you.
 
       The variable allows recipes to use common infrastructure such as the
       following::
@@ -6685,7 +6652,7 @@ system and gives an overview of their function and contents.
       The package names you use with :term:`RDEPENDS` must appear as they would
       in the :term:`PACKAGES` variable. The :term:`PKG` variable
       allows a different name to be used for the final package (e.g. the
-      :ref:`debian <ref-classes-debian>` class uses this to rename
+      :ref:`ref-classes-debian` class uses this to rename
       packages), but this final package name cannot be used with
       :term:`RDEPENDS`, which makes sense as :term:`RDEPENDS` is meant to be
       independent of the package format used.
@@ -6736,7 +6703,7 @@ system and gives an overview of their function and contents.
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
    :term:`REQUIRED_DISTRO_FEATURES`
-      When inheriting the :ref:`features_check <ref-classes-features_check>`
+      When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies distribution features that must exist
       in the current configuration in order for the OpenEmbedded build
       system to build the recipe. In other words, if the
@@ -6757,7 +6724,7 @@ system and gives an overview of their function and contents.
       for the same recipe, the :term:`REQUIRED_VERSION` value applies.
 
    :term:`RM_WORK_EXCLUDE`
-      With :ref:`rm_work <ref-classes-rm-work>` enabled, this variable
+      With :ref:`ref-classes-rm-work` enabled, this variable
       specifies a list of recipes whose work directories should not be removed.
       See the ":ref:`ref-classes-rm-work`" section for more details.
 
@@ -6789,7 +6756,7 @@ system and gives an overview of their function and contents.
       Indicates a filesystem image to include as the root filesystem.
 
       The :term:`ROOTFS` variable is an optional variable used with the
-      :ref:`image-live <ref-classes-image-live>` class.
+      :ref:`ref-classes-image-live` class.
 
    :term:`ROOTFS_POSTINSTALL_COMMAND`
       Specifies a list of functions to call after the OpenEmbedded build
@@ -7013,7 +6980,7 @@ system and gives an overview of their function and contents.
       set this variable. Instead, use :term:`SDKMACHINE`.
 
    :term:`SDK_BUILDINFO_FILE`
-      When using the :ref:`image-buildinfo <ref-classes-image-buildinfo>` class,
+      When using the :ref:`ref-classes-image-buildinfo` class,
       specifies the file in the SDK to write the build information into. The
       default value is "``/buildinfo``".
 
@@ -7145,7 +7112,7 @@ system and gives an overview of their function and contents.
 
    :term:`SDK_PREFIX`
       The toolchain binary prefix used for
-      :ref:`nativesdk <ref-classes-nativesdk>` recipes. The
+      :ref:`ref-classes-nativesdk` recipes. The
       OpenEmbedded build system uses the :term:`SDK_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building
       ``nativesdk`` recipes. The default value is "${SDK_SYS}-".
@@ -7331,25 +7298,22 @@ system and gives an overview of their function and contents.
          EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 
    :term:`SETUPTOOLS_BUILD_ARGS`
-      When used by recipes that inherit the
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
-      be used to specify additional arguments to be passed to ``setup.py build``
-      in the ``setuptools3_do_compile()`` task.
+      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
+      class, this variable can be used to specify additional arguments to be
+      passed to ``setup.py build`` in the ``setuptools3_do_compile()`` task.
 
    :term:`SETUPTOOLS_INSTALL_ARGS`
-      When used by recipes that inherit the
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
-      be used to specify additional arguments to be passed to ``setup.py install``
-      in the ``setuptools3_do_install()`` task.
+      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
+      class, this variable can be used to specify additional arguments to be
+      passed to ``setup.py install`` in the ``setuptools3_do_install()`` task.
 
    :term:`SETUPTOOLS_SETUP_PATH`
-      When used by recipes that inherit the
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
-      be used to specify the directory in which the ``setup.py`` file is
-      located if it is not at the root of the source tree (as specified by
-      :term:`S`). For example, in a recipe where the sources are fetched from
-      a Git repository and ``setup.py`` is in a ``python/pythonmodule``
-      subdirectory, you would have this::
+      When used by recipes that inherit the :ref:`ref-classes-setuptools3`
+      class, this variable should be used to specify the directory in which
+      the ``setup.py`` file is located if it is not at the root of the source
+      tree (as specified by :term:`S`). For example, in a recipe where the
+      sources are fetched from a Git repository and ``setup.py`` is in a
+      ``python/pythonmodule`` subdirectory, you would have this::
 
          S = "${WORKDIR}/git"
          SETUPTOOLS_SETUP_PATH = "${S}/python/pythonmodule"
@@ -7494,7 +7458,7 @@ system and gives an overview of their function and contents.
       specified in :term:`SRC_URI`.
 
       To use this variable, you must globally inherit the
-      :ref:`own-mirrors <ref-classes-own-mirrors>` class and then provide
+      :ref:`ref-classes-own-mirrors` class and then provide
       the URL to your mirrors. Here is the general syntax::
 
          INHERIT += "own-mirrors"
@@ -7520,7 +7484,7 @@ system and gives an overview of their function and contents.
       ``core-image-minimal`` for the ``qemux86-64`` machine, enabling this
       option multiplied the size of the ``tmp/deploy/spdx`` directory by a
       factor of 13 (+1.6 GiB for this image), compared to just using the
-      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+      :ref:`ref-classes-create-spdx` class with no option.
 
       Note that this option doesn't increase the size of :term:`SPDX`
       files in ``tmp/deploy/images/MACHINE``.
@@ -7546,7 +7510,7 @@ system and gives an overview of their function and contents.
       ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
       these options multiplied the size of the ``tmp/deploy/spdx``
       directory by a factor of 11 (+1.4 GiB for this image),
-      compared to just using the :ref:`create-spdx <ref-classes-create-spdx>`
+      compared to just using the :ref:`ref-classes-create-spdx`
       class with no option.
 
       Note that using this option only marginally increases the size
@@ -7572,8 +7536,8 @@ system and gives an overview of their function and contents.
       directory by a factor of 3  (+291 MiB for this image),
       and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
       ``tmp/deploy/images/MACHINE`` by a factor of 130 (+15 MiB for this
-      image), compared to just using the
-      :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
+      image), compared to just using the :ref:`ref-classes-create-spdx` class
+      with no option.
 
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
@@ -7723,15 +7687,15 @@ system and gives an overview of their function and contents.
 
    :term:`SRCTREECOVEREDTASKS`
       A list of tasks that are typically not relevant (and therefore skipped)
-      when building using the :ref:`externalsrc <ref-classes-externalsrc>`
+      when building using the :ref:`ref-classes-externalsrc`
       class. The default value as set in that class file is the set of tasks
       that are rarely needed when using external source::
 
          SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 
       The notable exception is when processing external kernel source as
-      defined in the :ref:`kernel-yocto <ref-classes-kernel-yocto>`
-      class file (formatted for aesthetics)::
+      defined in the :ref:`ref-classes-kernel-yocto` class file (formatted for
+      aesthetics)::
 
          SRCTREECOVEREDTASKS += "\
            do_validate_branches \
@@ -7799,10 +7763,9 @@ system and gives an overview of their function and contents.
       a different GCC version for native builds, you must configure
       :term:`SSTATE_MIRRORS` with a regular expression that maps local search
       paths to server paths. The paths need to take into account
-      :term:`NATIVELSBSTRING` set by the
-      :ref:`uninative <ref-classes-uninative>` class. For example, the
-      following maps the local search path ``universal-4.9`` to the
-      server-provided path server_url_sstate_path::
+      :term:`NATIVELSBSTRING` set by the :ref:`ref-classes-uninative` class.
+      For example, the following maps the local search path ``universal-4.9``
+      to the server-provided path server_url_sstate_path::
 
          SSTATE_MIRRORS ?= "file://universal-4.9/(.*) https://server_url_sstate_path/universal-4.8/\1"
 
@@ -7828,11 +7791,9 @@ system and gives an overview of their function and contents.
       by the :term:`SSTATE_SCAN_FILES` variable. Typically, recipes add files
       they want to be scanned to the value of :term:`SSTATE_SCAN_FILES` rather
       than the variable being comprehensively set. The
-      :ref:`sstate <ref-classes-sstate>` class specifies the default list
-      of files.
+      :ref:`ref-classes-sstate` class specifies the default list of files.
 
-      For details on the process, see the
-      :ref:`staging <ref-classes-staging>` class.
+      For details on the process, see the :ref:`ref-classes-staging` class.
 
    :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
@@ -7943,10 +7904,10 @@ system and gives an overview of their function and contents.
       which is the majority, :term:`STAGING_DIR_TARGET` is set to match
       :term:`STAGING_DIR_HOST`.
 
-      Some recipes build binaries that can run on the target system but
-      those binaries in turn generate code for another different system
-      (e.g. :ref:`cross-canadian <ref-classes-cross-canadian>` recipes). Using terminology from GNU, the
-      primary system is referred to as the "HOST" and the secondary, or
+      Some recipes build binaries that can run on the target system but those
+      binaries in turn generate code for another different system (e.g.
+      :ref:`ref-classes-cross-canadian` recipes). Using terminology from GNU,
+      the primary system is referred to as the "HOST" and the secondary, or
       different, system is referred to as the "TARGET". Thus, the binaries
       run on the "HOST" system and generate binaries for the "TARGET"
       system. The :term:`STAGING_DIR_HOST` variable points to the sysroot used
@@ -8040,7 +8001,7 @@ system and gives an overview of their function and contents.
 
          SYSLINUX_DEFAULT_CONSOLE = "console=ttyX"
 
-      The :ref:`syslinux <ref-classes-syslinux>` class initially sets
+      The :ref:`ref-classes-syslinux` class initially sets
       this variable to null but then checks for a value later.
 
    :term:`SYSLINUX_OPTS`
@@ -8048,14 +8009,14 @@ system and gives an overview of their function and contents.
       this variable in your recipe. If you want to list multiple options,
       separate the options with a semicolon character (``;``).
 
-      The :ref:`syslinux <ref-classes-syslinux>` class uses this variable
+      The :ref:`ref-classes-syslinux` class uses this variable
       to create a set of options.
 
    :term:`SYSLINUX_SERIAL`
       Specifies the alternate serial port or turns it off. To turn off
       serial, set this variable to an empty string in your recipe. The
       variable's default value is set in the
-      :ref:`syslinux <ref-classes-syslinux>` class as follows::
+      :ref:`ref-classes-syslinux` class as follows::
 
          SYSLINUX_SERIAL ?= "0 115200"
 
@@ -8063,8 +8024,8 @@ system and gives an overview of their function and contents.
 
    :term:`SYSLINUX_SERIAL_TTY`
       Specifies the alternate console=tty... kernel boot argument. The
-      variable's default value is set in the
-      :ref:`syslinux <ref-classes-syslinux>` class as follows::
+      variable's default value is set in the :ref:`ref-classes-syslinux`
+      class as follows::
 
          SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
 
@@ -8074,7 +8035,7 @@ system and gives an overview of their function and contents.
       An ``.LSS`` file used as the background for the VGA boot menu when
       you use the boot menu. You need to set this variable in your recipe.
 
-      The :ref:`syslinux <ref-classes-syslinux>` class checks for this
+      The :ref:`ref-classes-syslinux` class checks for this
       variable and if found, the OpenEmbedded build system installs the
       splash screen.
 
@@ -8150,12 +8111,12 @@ system and gives an overview of their function and contents.
       processing on the staged files, or to stage additional files.
 
    :term:`SYSTEMD_AUTO_ENABLE`
-      When inheriting the :ref:`systemd <ref-classes-systemd>` class,
+      When inheriting the :ref:`ref-classes-systemd` class,
       this variable specifies whether the specified service in
       :term:`SYSTEMD_SERVICE` should start
       automatically or not. By default, the service is enabled to
       automatically start at boot time. The default setting is in the
-      :ref:`systemd <ref-classes-systemd>` class as follows::
+      :ref:`ref-classes-systemd` class as follows::
 
          SYSTEMD_AUTO_ENABLE ??= "enable"
 
@@ -8165,7 +8126,7 @@ system and gives an overview of their function and contents.
       When :term:`EFI_PROVIDER` is set to
       "systemd-boot", the :term:`SYSTEMD_BOOT_CFG` variable specifies the
       configuration file that should be used. By default, the
-      :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
+      :ref:`ref-classes-systemd-boot` class sets the
       :term:`SYSTEMD_BOOT_CFG` as follows::
 
          SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
@@ -8177,9 +8138,8 @@ system and gives an overview of their function and contents.
       When :term:`EFI_PROVIDER` is set to
       "systemd-boot", the :term:`SYSTEMD_BOOT_ENTRIES` variable specifies a
       list of entry files (``*.conf``) to install that contain one boot
-      entry per file. By default, the
-      :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      :term:`SYSTEMD_BOOT_ENTRIES` as follows::
+      entry per file. By default, the :ref:`ref-classes-systemd-boot` class
+      sets the :term:`SYSTEMD_BOOT_ENTRIES` as follows::
 
           SYSTEMD_BOOT_ENTRIES ?= ""
 
@@ -8190,7 +8150,7 @@ system and gives an overview of their function and contents.
       When :term:`EFI_PROVIDER` is set to
       "systemd-boot", the :term:`SYSTEMD_BOOT_TIMEOUT` variable specifies the
       boot menu timeout in seconds. By default, the
-      :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
+      :ref:`ref-classes-systemd-boot` class sets the
       :term:`SYSTEMD_BOOT_TIMEOUT` as follows::
 
          SYSTEMD_BOOT_TIMEOUT ?= "10"
@@ -8216,7 +8176,7 @@ system and gives an overview of their function and contents.
           SYSTEMD_DEFAULT_TARGET = "graphical.target"
 
    :term:`SYSTEMD_PACKAGES`
-      When inheriting the :ref:`systemd <ref-classes-systemd>` class,
+      When inheriting the :ref:`ref-classes-systemd` class,
       this variable locates the systemd unit files when they are not found
       in the main recipe's package. By default, the :term:`SYSTEMD_PACKAGES`
       variable is set such that the systemd unit files are assumed to
@@ -8229,7 +8189,7 @@ system and gives an overview of their function and contents.
       the build system can find the systemd unit files.
 
    :term:`SYSTEMD_SERVICE`
-      When inheriting the :ref:`systemd <ref-classes-systemd>` class,
+      When inheriting the :ref:`ref-classes-systemd` class,
       this variable specifies the systemd service name for a package.
 
       Multiple services can be specified, each one separated by a space.
@@ -8392,7 +8352,7 @@ system and gives an overview of their function and contents.
       -  For native recipes, the build system sets the variable to the
          value of :term:`BUILD_PREFIX`.
 
-      -  For native SDK recipes (:ref:`nativesdk <ref-classes-nativesdk>`),
+      -  For native SDK recipes (:ref:`ref-classes-nativesdk`),
          the build system sets the variable to the value of :term:`SDK_PREFIX`.
 
    :term:`TARGET_SYS`
@@ -8952,21 +8912,19 @@ system and gives an overview of their function and contents.
       "sdcard" specifies the :term:`IMAGE_FSTYPES` to use for the U-Boot image.
 
       For more information on how the :term:`UBOOT_CONFIG` is handled, see the
-      :ref:`uboot-config <ref-classes-uboot-config>`
-      class.
+      :ref:`ref-classes-uboot-config` class.
 
    :term:`UBOOT_DTB_LOADADDRESS`
       Specifies the load address for the dtb image used by U-Boot. During FIT
       image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used in
-      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify
-      the load address to be used in
-      creating the dtb sections of Image Tree Source for the FIT image.
+      :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
+      used in creating the dtb sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_DTBO_LOADADDRESS`
       Specifies the load address for the dtbo image used by U-Boot.  During FIT
       image creation, the :term:`UBOOT_DTBO_LOADADDRESS` variable is used in
-      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the load address to be used in
-      creating the dtbo sections of Image Tree Source for the FIT image.
+      :ref:`ref-classes-kernel-fitimage` class to specify the load address to be
+      used in creating the dtbo sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_ENTRYPOINT`
       Specifies the entry point for the U-Boot image. During U-Boot image
@@ -9001,16 +8959,16 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_MKIMAGE`
       Specifies the name of the mkimage command as used by the
-      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to assemble
+      :ref:`ref-classes-kernel-fitimage` class to assemble
       the FIT image. This can be used to substitute an alternative command, wrapper
       script or function if desired. The default is "uboot-mkimage".
 
    :term:`UBOOT_MKIMAGE_DTCOPTS`
-      Options for the device tree compiler passed to mkimage '-D'
-      feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
-      If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then
-      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` will not pass the
-      ``-D`` option to mkimage.
+      Options for the device tree compiler passed to mkimage '-D' feature while
+      creating FIT image in :ref:`ref-classes-kernel-fitimage` class. If
+      :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then
+      :ref:`ref-classes-kernel-fitimage` will not pass the ``-D`` option to
+      mkimage.
 
    :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
       Specifies the type argument for the kernel as passed to ``uboot-mkimage``.
@@ -9018,31 +8976,27 @@ system and gives an overview of their function and contents.
 
    :term:`UBOOT_MKIMAGE_SIGN`
       Specifies the name of the mkimage command as used by the
-      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to sign
+      :ref:`ref-classes-kernel-fitimage` class to sign
       the FIT image after it has been assembled (if enabled). This can be used
       to substitute an alternative command, wrapper script or function if
       desired. The default is "${:term:`UBOOT_MKIMAGE`}".
 
    :term:`UBOOT_MKIMAGE_SIGN_ARGS`
       Optionally specifies additional arguments for the
-      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to pass to the
+      :ref:`ref-classes-kernel-fitimage` class to pass to the
       mkimage command when signing the FIT image.
 
    :term:`UBOOT_RD_ENTRYPOINT`
-      Specifies the entrypoint for the RAM disk image.
-      During FIT image creation, the
-      :term:`UBOOT_RD_ENTRYPOINT` variable is used
-      in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the
-      entrypoint to be used in creating the Image Tree Source for
-      the FIT image.
+      Specifies the entrypoint for the RAM disk image. During FIT image
+      creation, the :term:`UBOOT_RD_ENTRYPOINT` variable is used in
+      :ref:`ref-classes-kernel-fitimage` class to specify the entrypoint to be
+      used in creating the Image Tree Source for the FIT image.
 
    :term:`UBOOT_RD_LOADADDRESS`
-      Specifies the load address for the RAM disk image.
-      During FIT image creation, the
-      :term:`UBOOT_RD_LOADADDRESS` variable is used
-      in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the
-      load address to be used in creating the Image Tree Source for
-      the FIT image.
+      Specifies the load address for the RAM disk image. During FIT image
+      creation, the :term:`UBOOT_RD_LOADADDRESS` variable is used in
+      :ref:`ref-classes-kernel-fitimage` class to specify the load address to
+      be used in creating the Image Tree Source for the FIT image.
 
    :term:`UBOOT_SIGN_ENABLE`
       Enable signing of FIT image. The default value is "0".
@@ -9084,12 +9038,12 @@ system and gives an overview of their function and contents.
 
       The configure arguments check that uses
       :term:`UNKNOWN_CONFIGURE_OPT_IGNORE` is part of the
-      :ref:`insane <ref-classes-insane>` class and is only enabled if the
-      recipe inherits the :ref:`autotools <ref-classes-autotools>` class.
+      :ref:`ref-classes-insane` class and is only enabled if the
+      recipe inherits the :ref:`ref-classes-autotools` class.
 
    :term:`UPDATERCPN`
       For recipes inheriting the
-      :ref:`update-rc.d <ref-classes-update-rc.d>` class, :term:`UPDATERCPN`
+      :ref:`ref-classes-update-rc.d` class, :term:`UPDATERCPN`
       specifies the package that contains the initscript that is enabled.
 
       The default value is "${PN}". Given that almost all recipes that
@@ -9243,7 +9197,7 @@ system and gives an overview of their function and contents.
          causes the build system to use static ``gid`` values.
 
    :term:`USERADD_PACKAGES`
-      When inheriting the :ref:`useradd <ref-classes-useradd>` class,
+      When inheriting the :ref:`ref-classes-useradd` class,
       this variable specifies the individual packages within the recipe
       that require users and/or groups to be added.
 
@@ -9260,7 +9214,7 @@ system and gives an overview of their function and contents.
          :term:`GROUPADD_PARAM`, or :term:`GROUPMEMS_PARAM` variables.
 
    :term:`USERADD_PARAM`
-      When inheriting the :ref:`useradd <ref-classes-useradd>` class,
+      When inheriting the :ref:`ref-classes-useradd` class,
       this variable specifies for a package what parameters should pass to
       the ``useradd`` command if you add a user to the system when the
       package is installed.
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index c1a36c471d..2be76875e0 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -49,8 +49,7 @@ build system applies them against ``local.conf`` and ``auto.conf``:
    :term:`ESDK_CLASS_INHERIT_DISABLE` to disable these classes is the typical
    method to disable classes that are problematic or unnecessary in the SDK
    context. The default value disables the
-   :ref:`buildhistory <ref-classes-buildhistory>` and
-   :ref:`icecc <ref-classes-icecc>` classes.
+   :ref:`ref-classes-buildhistory` and :ref:`ref-classes-icecc` classes.
 
 Additionally, the contents of ``conf/sdk-extra.conf``, when present, are
 appended to the end of ``conf/local.conf`` within the produced SDK,
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index e8a0a5b3ce..7c7ceb695a 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -1079,9 +1079,8 @@ does not include complete instructions for building the software.
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
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 2d75e141f1..aaf64ae017 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -100,12 +100,11 @@ the following types of tests:
    different configurations, such as different init systems. The
    Autobuilder tests literally hundreds of configurations and targets.
 
-   -  *Sanity Checks During the Build Process:* Tests initiated through
-      the :ref:`insane <ref-classes-insane>`
-      class. These checks ensure the output of the builds are correct.
-      For example, does the ELF architecture in the generated binaries
-      match the target system? ARM binaries would not work in a MIPS
-      system!
+   -  *Sanity Checks During the Build Process:* Tests initiated through the
+      :ref:`ref-classes-insane` class. These checks ensure the output of the
+      builds are correct. For example, does the ELF architecture in the
+      generated binaries match the target system? ARM binaries would not work
+      in a MIPS system!
 
 -  *Build Performance Testing:* Tests whether or not commonly used steps
    during builds work efficiently and avoid regressions. Tests to time
@@ -121,7 +120,8 @@ the following types of tests:
 
       $ bitbake image -c testsdkext
 
-   The tests utilize the :ref:`testsdkext <ref-classes-testsdk>` class and the ``do_testsdkext`` task.
+   The tests utilize the :ref:`ref-classes-testsdk` class and the
+   ``do_testsdkext`` task.
 
 -  *Feature Testing:* Various scenario-based tests are run through the
    :ref:`OpenEmbedded Self test (oe-selftest) <ref-manual/release-process:Testing and Quality Assurance>`. We test oe-selftest on each of the main distributions
@@ -131,7 +131,7 @@ the following types of tests:
 
       $ bitbake image -c testimage
 
-   The tests utilize the :ref:`testimage <ref-classes-testimage>`
+   The tests utilize the :ref:`ref-classes-testimage`
    class and the :ref:`ref-tasks-testimage` task.
 
 -  *Layer Testing:* The Autobuilder has the possibility to test whether
@@ -151,7 +151,7 @@ the following types of tests:
 
       $ bitbake image -c testsdk
 
-   The tests utilize the :ref:`testsdk <ref-classes-testsdk>` class and
+   The tests utilize the :ref:`ref-classes-testsdk` class and
    the ``do_testsdk`` task.
 
 -  *Unit Testing:* Unit tests on various components of the system run
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index b6e331f68c..7a6cb2443b 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -206,7 +206,7 @@ are general setup steps that are run once and include:
 
 #. Set up any :term:`buildtools` tarball if configured.
 
-#. Call "buildhistory-init" if :ref:`buildhistory <ref-classes-buildhistory>` is configured.
+#. Call "buildhistory-init" if :ref:`ref-classes-buildhistory` is configured.
 
 For each step that is configured in ``config.json``, it will perform the
 following:
-- 
2.37.2


