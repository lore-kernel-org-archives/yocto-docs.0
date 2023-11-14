Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D84C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:50:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.17597.1699980601687706016
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B7dzQPxq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B00C7E000F;
	Tue, 14 Nov 2023 16:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IO1xQE8z4rKkSePUqehB3+84xQPfWB0wFnGVxm7optc=;
	b=B7dzQPxqNzLBPuH17P3QLJTXrzVIq/845z1ju3i7MXKXY4Sm+d6L7YLWXNN7I9KmJJqicu
	kGpwudx34VaeZ/VCvTlSsHAe1bFuo9Es8Lc69LB5oYqaWBaE60UFx2WdnToeax+xcDOB2a
	/veM84rjZCT6psx+NCSxFOOIQI1Tu52FwVPYQt97rO/hEccKmphG974ZjBSm3hT+drusF7
	D+mo/1SAM3/AI5YanYmO/lIqzwCTicw9E0cUyWbdjGheNn4B5VvMkeoI2FyKqrMKL6qg6N
	QjGOqxxSMSZeQN3Sn6GDPYLqXN4vfVwF9GGqJX/FQ2qPbWCE7xqQJg2gtMH1eA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 7/7] manuals: update class references
Date: Tue, 14 Nov 2023 17:49:42 +0100
Message-Id: <20231114164942.133472-8-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
References: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4627

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Synchronizing with master whenever possible,
to make the branch easier to maintain.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/runtime-testing.rst  |    2 +-
 .../dev-manual/upgrading-recipes.rst          |    2 +-
 .../migration-guides/migration-1.5.rst        |    2 +-
 .../migration-guides/migration-2.6.rst        |    2 +-
 documentation/overview-manual/concepts.rst    |    2 +-
 documentation/ref-manual/classes.rst          | 1694 ++++++++++-------
 documentation/ref-manual/release-process.rst  |    2 +-
 documentation/ref-manual/variables.rst        |  258 ++-
 documentation/test-manual/intro.rst           |    2 +-
 9 files changed, 1204 insertions(+), 762 deletions(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index 177f781b62..af3fe2c1dd 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -332,7 +332,7 @@ You can start the tests automatically or manually:
       bitbake core-image-sato
 
 -  *Manually running tests:* To manually run the tests, first globally
-   inherit the :ref:`ref-classes-testimage*` class by editing your
+   inherit the :ref:`ref-classes-testimage` class by editing your
    ``local.conf`` file::
 
       IMAGE_CLASSES += "testimage"
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index dc8e3c6f52..4fac78bdfb 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -113,7 +113,7 @@ The following steps describe how to set up the AUH utility:
       ``upgrade-helper/work/recipe/buildhistory-diff.txt`` file found in
       your :term:`Build Directory`.
 
-   -  If you want to enable testing through the :ref:`ref-classes-testimage*`
+   -  If you want to enable testing through the :ref:`ref-classes-testimage`
       class, which is optional, you need to have the following set in
       your ``conf/local.conf`` file::
 
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 31943fc701..6affe68b58 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -240,7 +240,7 @@ Automated Image Testing
 -----------------------
 
 A new automated image testing framework has been added through the
-:ref:`ref-classes-testimage*` classes. This
+:ref:`ref-classes-testimage` classes. This
 framework replaces the older ``imagetest-qemu`` framework.
 
 You can learn more about performing automated image tests in the
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index 647ef83bc6..ffac097a05 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -319,7 +319,7 @@ This section provides information about automatic testing changes:
    practices now dictate that you use the
    :term:`IMAGE_CLASSES` variable rather than the
    :term:`INHERIT` variable when you inherit the
-   :ref:`testimage <ref-classes-testimage*>` and
+   :ref:`testimage <ref-classes-testimage>` and
    :ref:`testsdk <ref-classes-testsdk>` classes used for automatic
    testing.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4a8ea0f611..371c73418a 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1026,7 +1026,7 @@ processing includes creation of a manifest file and optimizations.
 The manifest file (``.manifest``) resides in the same directory as the
 root filesystem image. This file lists out, line-by-line, the installed
 packages. The manifest file is useful for the
-:ref:`testimage <ref-classes-testimage*>` class,
+:ref:`testimage <ref-classes-testimage>` class,
 for example, to determine whether or not to run specific tests. See the
 :term:`IMAGE_MANIFEST`
 variable for additional information.
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 53e47ab5a7..6074ea0f52 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -28,10 +28,10 @@ information.
 
 .. _ref-classes-allarch:
 
-``allarch.bbclass``
-===================
+``allarch``
+===========
 
-The ``allarch`` class is inherited by recipes that do not produce
+The :ref:`ref-classes-allarch` class is inherited by recipes that do not produce
 architecture-specific output. The class disables functionality that is
 normally needed for recipes that produce executable binaries (such as
 building the cross-compiler and a C library as pre-requisites, and
@@ -43,28 +43,28 @@ splitting out of debug symbols during packaging).
    produce packages that depend on tunings through use of the
    :term:`RDEPENDS` and
    :term:`TUNE_PKGARCH` variables, should never be
-   configured for all architectures using ``allarch``. This is the case
+   configured for all architectures using :ref:`ref-classes-allarch`. This is the case
    even if the recipes do not produce architecture-specific output.
 
    Configuring such recipes for all architectures causes the
-   ``do_package_write_*`` tasks to
+   :ref:`do_package_write_* <ref-tasks-package_write_deb>` tasks to
    have different signatures for the machines with different tunings.
    Additionally, unnecessary rebuilds occur every time an image for a
    different :term:`MACHINE` is built even when the recipe never changes.
 
-By default, all recipes inherit the :ref:`base <ref-classes-base>` and
-:ref:`package <ref-classes-package>` classes, which enable
+By default, all recipes inherit the :ref:`ref-classes-base` and
+:ref:`ref-classes-package` classes, which enable
 functionality needed for recipes that produce executable output. If your
 recipe, for example, only produces packages that contain configuration
 files, media files, or scripts (e.g. Python and Perl), then it should
-inherit the ``allarch`` class.
+inherit the :ref:`ref-classes-allarch` class.
 
 .. _ref-classes-archiver:
 
-``archiver.bbclass``
-====================
+``archiver``
+============
 
-The ``archiver`` class supports releasing source code and other
+The :ref:`ref-classes-archiver` class supports releasing source code and other
 materials with the binaries.
 
 For more details on the source :ref:`ref-classes-archiver`, see the
@@ -75,10 +75,11 @@ about the variable flags (varflags) that help control archive creation.
 
 .. _ref-classes-autotools:
 
-``autotools*.bbclass``
-======================
+``autotools*``
+==============
 
-The ``autotools*`` classes support Autotooled packages.
+The :ref:`autotools* <ref-classes-autotools>` classes support packages built with the
+:wikipedia:`GNU Autotools <GNU_Autotools>`.
 
 The ``autoconf``, ``automake``, and ``libtool`` packages bring
 standardization. This class defines a set of tasks (e.g. ``configure``,
@@ -89,13 +90,13 @@ that emulates Autotools. For more information, see the
 ":ref:`dev-manual/new-recipe:building an autotooled package`" section
 in the Yocto Project Development Tasks Manual.
 
-By default, the ``autotools*`` classes use out-of-tree builds (i.e.
+By default, the :ref:`autotools* <ref-classes-autotools>` classes use out-of-tree builds (i.e.
 ``autotools.bbclass`` building with ``B != S``).
 
 If the software being built by a recipe does not support using
 out-of-tree builds, you should have the recipe inherit the
-``autotools-brokensep`` class. The ``autotools-brokensep`` class behaves
-the same as the ``autotools`` class but builds with :term:`B`
+:ref:`autotools-brokensep <ref-classes-autotools>` class. The :ref:`autotools-brokensep <ref-classes-autotools>` class behaves
+the same as the :ref:`ref-classes-autotools` class but builds with :term:`B`
 == :term:`S`. This method is useful when out-of-tree build
 support is either not present or is broken.
 
@@ -105,35 +106,34 @@ support is either not present or is broken.
    all possible.
 
 It's useful to have some idea of how the tasks defined by the
-``autotools*`` classes work and what they do behind the scenes.
+:ref:`autotools* <ref-classes-autotools>` classes work and what they do behind the scenes.
 
--  :ref:`ref-tasks-configure` - Regenerates the
+-  :ref:`ref-tasks-configure` --- regenerates the
    configure script (using ``autoreconf``) and then launches it with a
    standard set of arguments used during cross-compilation. You can pass
    additional parameters to ``configure`` through the :term:`EXTRA_OECONF`
    or :term:`PACKAGECONFIG_CONFARGS`
    variables.
 
--  :ref:`ref-tasks-compile` - Runs ``make`` with
+-  :ref:`ref-tasks-compile` --- runs ``make`` with
    arguments that specify the compiler and linker. You can pass
    additional arguments through the :term:`EXTRA_OEMAKE` variable.
 
--  :ref:`ref-tasks-install` - Runs ``make install`` and
+-  :ref:`ref-tasks-install` --- runs ``make install`` and
    passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
 
 .. _ref-classes-base:
 
-``base.bbclass``
-================
+``base``
+========
 
-The ``base`` class is special in that every ``.bb`` file implicitly
+The :ref:`ref-classes-base` class is special in that every ``.bb`` file implicitly
 inherits the class. This class contains definitions for standard basic
 tasks such as fetching, unpacking, configuring (empty by default),
 compiling (runs any ``Makefile`` present), installing (empty by default)
-and packaging (empty by default). These classes are often overridden or
-extended by other classes such as the
-:ref:`autotools <ref-classes-autotools>` class or the
-:ref:`package <ref-classes-package>` class.
+and packaging (empty by default). These tasks are often overridden or
+extended by other classes such as the :ref:`ref-classes-autotools` class or the
+:ref:`ref-classes-package` class.
 
 The class also contains some commonly used functions such as
 ``oe_runmake``, which runs ``make`` with the arguments specified in
@@ -142,18 +142,18 @@ arguments passed directly to ``oe_runmake``.
 
 .. _ref-classes-bash-completion:
 
-``bash-completion.bbclass``
-===========================
+``bash-completion``
+===================
 
 Sets up packaging and dependencies appropriate for recipes that build
 software that includes bash-completion data.
 
 .. _ref-classes-bin-package:
 
-``bin_package.bbclass``
-=======================
+``bin_package``
+===============
 
-The ``bin_package`` class is a helper class for recipes that extract the
+The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
 contents of a binary package (e.g. an RPM) and install those contents
 rather than building the binary from source. The binary package is
 extracted and new packages in the configured output package format are
@@ -177,10 +177,10 @@ example use for this class.
 
 .. _ref-classes-binconfig:
 
-``binconfig.bbclass``
-=====================
+``binconfig``
+=============
 
-The ``binconfig`` class helps to correct paths in shell scripts.
+The :ref:`ref-classes-binconfig` class helps to correct paths in shell scripts.
 
 Before ``pkg-config`` had become widespread, libraries shipped shell
 scripts to give information about the libraries and include paths needed
@@ -197,22 +197,21 @@ information.
 
 .. _ref-classes-binconfig-disabled:
 
-``binconfig-disabled.bbclass``
-==============================
+``binconfig-disabled``
+======================
 
-An alternative version of the :ref:`binconfig <ref-classes-binconfig>`
+An alternative version of the :ref:`ref-classes-binconfig`
 class, which disables binary configuration scripts by making them return
 an error in favor of using ``pkg-config`` to query the information. The
-scripts to be disabled should be specified using the
-:term:`BINCONFIG` variable within the recipe inheriting
-the class.
+scripts to be disabled should be specified using the :term:`BINCONFIG`
+variable within the recipe inheriting the class.
 
 .. _ref-classes-buildhistory:
 
-``buildhistory.bbclass``
-========================
+``buildhistory``
+================
 
-The ``buildhistory`` class records a history of build output metadata,
+The :ref:`ref-classes-buildhistory` class records a history of build output metadata,
 which can be used to detect possible regressions as well as used for
 analysis of the build output. For more information on using Build
 History, see the
@@ -221,10 +220,10 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-buildstats:
 
-``buildstats.bbclass``
-======================
+``buildstats``
+==============
 
-The ``buildstats`` class records performance statistics about each task
+The :ref:`ref-classes-buildstats` class records performance statistics about each task
 executed during the build (e.g. elapsed time, CPU usage, and I/O usage).
 
 When you use this class, the output goes into the
@@ -238,23 +237,59 @@ Collecting build statistics is enabled by default through the
 :term:`USER_CLASSES` variable from your
 ``local.conf`` file. Consequently, you do not have to do anything to
 enable the class. However, if you want to disable the class, simply
-remove "buildstats" from the :term:`USER_CLASSES` list.
+remove ":ref:`ref-classes-buildstats`" from the :term:`USER_CLASSES` list.
 
 .. _ref-classes-buildstats-summary:
 
-``buildstats-summary.bbclass``
-==============================
+``buildstats-summary``
+======================
 
 When inherited globally, prints statistics at the end of the build on
 sstate re-use. In order to function, this class requires the
-:ref:`buildstats <ref-classes-buildstats>` class be enabled.
+:ref:`ref-classes-buildstats` class be enabled.
+
+.. _ref-classes-cargo:
+
+``cargo``
+=========
+
+The :ref:`ref-classes-cargo` class allows to compile Rust language programs
+using `Cargo <https://doc.rust-lang.org/cargo/>`__. Cargo is Rust's package
+manager, allowing to fetch package dependencies and build your program.
+
+Using this class makes it very easy to build Rust programs. All you need
+is to use the :term:`SRC_URI` variable to point to a source repository
+which can be built by Cargo, typically one that was created by the
+``cargo new`` command, containing a ``Cargo.toml`` file, a ``Cargo.lock`` file and a ``src``
+subdirectory.
+
+You will find an example (that show also how to handle possible git source dependencies) in the
+:oe_git:`zvariant_3.12.0.bb </openembedded-core/tree/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb>`
+recipe. Another example, with only crate dependencies, is the
+:oe_git:`uutils-coreutils </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
+recipe, which was generated by the `cargo-bitbake <https://crates.io/crates/cargo-bitbake>`__
+tool.
+
+This class inherits the :ref:`ref-classes-cargo_common` class.
+
+.. _ref-classes-cargo_common:
+
+``cargo_common``
+================
+
+The :ref:`ref-classes-cargo_common` class is an internal class
+that is not intended to be used directly.
+
+An exception is the "rust" recipe, to build the Rust compiler and runtime
+library, which is built by Cargo but cannot use the :ref:`ref-classes-cargo`
+class. This is why this class was introduced.
 
 .. _ref-classes-ccache:
 
-``ccache.bbclass``
-==================
+``ccache``
+==========
 
-The ``ccache`` class enables the C/C++ Compiler Cache for the build.
+The :ref:`ref-classes-ccache` class enables the C/C++ Compiler Cache for the build.
 This class is used to give a minor performance boost during the build.
 
 See https://ccache.samba.org/ for information on the C/C++ Compiler
@@ -268,45 +303,48 @@ this class is not recommended.
 
 .. _ref-classes-chrpath:
 
-``chrpath.bbclass``
-===================
+``chrpath``
+===========
 
-The ``chrpath`` class is a wrapper around the "chrpath" utility, which
-is used during the build process for ``nativesdk``, ``cross``, and
-``cross-canadian`` recipes to change ``RPATH`` records within binaries
+The :ref:`ref-classes-chrpath` class is a wrapper around the "chrpath" utility, which
+is used during the build process for :ref:`ref-classes-nativesdk`, :ref:`ref-classes-cross`, and
+:ref:`ref-classes-cross-canadian` recipes to change ``RPATH`` records within binaries
 in order to make them relocatable.
 
 .. _ref-classes-cmake:
 
-``cmake.bbclass``
-=================
+``cmake``
+=========
 
-The ``cmake`` class allows for recipes that need to build software using
-the `CMake <https://cmake.org/overview/>`__ build system. You can use
-the :term:`EXTRA_OECMAKE` variable to specify
-additional configuration options to be passed using the ``cmake``
-command line.
+The :ref:`ref-classes-cmake` class allows recipes to build software using the
+`CMake <https://cmake.org/overview/>`__ build system. You can use the
+:term:`EXTRA_OECMAKE` variable to specify additional configuration options to
+pass to the ``cmake`` command line.
+
+By default, the :ref:`ref-classes-cmake` class uses
+`Ninja <https://ninja-build.org/>`__ instead of GNU make for building, which
+offers better build performance. If a recipe is broken with Ninja, then the
+recipe can set the :term:`OECMAKE_GENERATOR` variable to ``Unix Makefiles`` to
+use GNU make instead.
 
-On the occasion that you would be installing custom CMake toolchain
-files supplied by the application being built, you should install them
-to the preferred CMake Module directory: ``${D}${datadir}/cmake/``
-Modules during
-:ref:`ref-tasks-install`.
+If you need to install custom CMake toolchain files supplied by the application
+being built, you should install them (during :ref:`ref-tasks-install`) to the
+preferred CMake Module directory: ``${D}${datadir}/cmake/modules/``.
 
 .. _ref-classes-cml1:
 
-``cml1.bbclass``
-================
+``cml1``
+========
 
-The ``cml1`` class provides basic support for the Linux kernel style
+The :ref:`ref-classes-cml1` class provides basic support for the Linux kernel style
 build configuration system. "cml" stands for "Configuration Menu Language", which
 originates from the Linux kernel but is also used in other projects such as U-Boot
 and BusyBox. It could have been called "kconfig" too.
 
 .. _ref-classes-compress_doc:
 
-``compress_doc.bbclass``
-========================
+``compress_doc``
+================
 
 Enables compression for man pages and info pages. This class is intended
 to be inherited globally. The default compression mechanism is gz (gzip)
@@ -315,39 +353,39 @@ but you can select an alternative mechanism by setting the
 
 .. _ref-classes-copyleft_compliance:
 
-``copyleft_compliance.bbclass``
-===============================
+``copyleft_compliance``
+=======================
 
-The ``copyleft_compliance`` class preserves source code for the purposes
-of license compliance. This class is an alternative to the ``archiver``
+The :ref:`ref-classes-copyleft_compliance` class preserves source code for the purposes
+of license compliance. This class is an alternative to the :ref:`ref-classes-archiver`
 class and is still used by some users even though it has been deprecated
-in favor of the :ref:`archiver <ref-classes-archiver>` class.
+in favor of the :ref:`ref-classes-archiver` class.
 
 .. _ref-classes-copyleft_filter:
 
-``copyleft_filter.bbclass``
-===========================
+``copyleft_filter``
+===================
 
-A class used by the :ref:`archiver <ref-classes-archiver>` and
-:ref:`copyleft_compliance <ref-classes-copyleft_compliance>` classes
+A class used by the :ref:`ref-classes-archiver` and
+:ref:`ref-classes-copyleft_compliance` classes
 for filtering licenses. The ``copyleft_filter`` class is an internal
 class and is not intended to be used directly.
 
 .. _ref-classes-core-image:
 
-``core-image.bbclass``
-======================
+``core-image``
+==============
 
-The ``core-image`` class provides common definitions for the
+The :ref:`ref-classes-core-image` class provides common definitions for the
 ``core-image-*`` image recipes, such as support for additional
 :term:`IMAGE_FEATURES`.
 
 .. _ref-classes-cpan:
 
-``cpan*.bbclass``
-=================
+``cpan*``
+=========
 
-The ``cpan*`` classes support Perl modules.
+The :ref:`cpan* <ref-classes-cpan>` classes support Perl modules.
 
 Recipes for Perl modules are simple. These recipes usually only need to
 point to the source's archive and then inherit the proper class file.
@@ -360,15 +398,15 @@ authors used.
 -  Modules that use ``Build.PL``-based build system require using
    ``cpan_build.bbclass`` in their recipes.
 
-Both build methods inherit the ``cpan-base`` class for basic Perl
+Both build methods inherit the :ref:`cpan-base <ref-classes-cpan>` class for basic Perl
 support.
 
 .. _ref-classes-create-spdx:
 
-``create-spdx.bbclass``
-=======================
+``create-spdx``
+===============
 
-The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
+The :ref:`ref-classes-create-spdx` class provides support for
 automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
 and SDK contents.
 
@@ -391,18 +429,18 @@ section in the Yocto Project Development Manual for more details.
 
 .. _ref-classes-cross:
 
-``cross.bbclass``
-=================
+``cross``
+=========
 
-The ``cross`` class provides support for the recipes that build the
+The :ref:`ref-classes-cross` class provides support for the recipes that build the
 cross-compilation tools.
 
 .. _ref-classes-cross-canadian:
 
-``cross-canadian.bbclass``
-==========================
+``cross-canadian``
+==================
 
-The ``cross-canadian`` class provides support for the recipes that build
+The :ref:`ref-classes-cross-canadian` class provides support for the recipes that build
 the Canadian Cross-compilation tools for SDKs. See the
 ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
@@ -410,10 +448,10 @@ discussion on these cross-compilation tools.
 
 .. _ref-classes-crosssdk:
 
-``crosssdk.bbclass``
-====================
+``crosssdk``
+============
 
-The ``crosssdk`` class provides support for the recipes that build the
+The :ref:`ref-classes-crosssdk` class provides support for the recipes that build the
 cross-compilation tools used for building SDKs. See the
 ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
@@ -421,10 +459,10 @@ discussion on these cross-compilation tools.
 
 .. _ref-classes-cve-check:
 
-``cve-check.bbclass``
-=====================
+``cve-check``
+=============
 
-The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
+The :ref:`ref-classes-cve-check` class looks for known CVEs (Common Vulnerabilities
 and Exposures) while building with BitBake. This class is meant to be
 inherited globally from a configuration file::
 
@@ -485,10 +523,10 @@ section in the Development Tasks Manual.
 
 .. _ref-classes-debian:
 
-``debian.bbclass``
-==================
+``debian``
+==========
 
-The ``debian`` class renames output packages so that they follow the
+The :ref:`ref-classes-debian` class renames output packages so that they follow the
 Debian naming policy (i.e. ``glibc`` becomes ``libc6`` and
 ``glibc-devel`` becomes ``libc6-dev``.) Renaming includes the library
 name and version as part of the package name.
@@ -500,10 +538,10 @@ naming scheme.
 
 .. _ref-classes-deploy:
 
-``deploy.bbclass``
-==================
+``deploy``
+==========
 
-The ``deploy`` class handles deploying files to the
+The :ref:`ref-classes-deploy` class handles deploying files to the
 :term:`DEPLOY_DIR_IMAGE` directory. The main
 function of this class is to allow the deploy step to be accelerated by
 shared state. Recipes that inherit this class should define their own
@@ -514,10 +552,56 @@ add the task at the appropriate place, which is usually after
 :ref:`ref-tasks-install`. The class then takes care of
 staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 
+.. _ref-classes-devicetree:
+
+``devicetree``
+==============
+
+The :ref:`ref-classes-devicetree` class allows to build a recipe that compiles
+device tree source files that are not in the kernel tree.
+
+The compilation of out-of-tree device tree sources is the same as the kernel
+in-tree device tree compilation process. This includes the ability to include
+sources from the kernel such as SoC ``dtsi`` files as well as C header files,
+such as ``gpio.h``.
+
+The :ref:`ref-tasks-compile` task will compile two kinds of files:
+
+- Regular device tree sources with a ``.dts`` extension.
+
+- Device tree overlays, detected from the presence of the ``/plugin/;``
+  string in the file contents.
+
+This class deploys the generated device tree binaries into
+``${``\ :term:`DEPLOY_DIR_IMAGE`\ ``}/devicetree/``.  This is similar to
+what the :ref:`ref-classes-kernel-devicetree` class does, with the added
+``devicetree`` subdirectory to avoid name clashes. Additionally, the device
+trees are populated into the sysroot for access via the sysroot from within
+other recipes.
+
+By default, all device tree sources located in :term:`DT_FILES_PATH` directory
+are compiled.
+
+An extra padding is appended to non-overlay device trees binaries. This
+can typically be used as extra space for adding extra properties at boot time.
+The padding size can be modified by setting :term:`DT_PADDING_SIZE`
+to the desired size, in bytes.
+
+See :oe_git:`devicetree.bbclass sources
+</openembedded-core/tree/meta/classes-recipe/devicetree.bbclass>` 
+for further variables controlling this class.
+
+Here is an excerpt of an example ``recipes-kernel/linux/devicetree-acme.bb``
+recipe inheriting this class::
+
+   inherit devicetree
+   COMPATIBLE_MACHINE = "^mymachine$"
+   SRC_URI:mymachine = "file://mymachine.dts"
+
 .. _ref-classes-devshell:
 
-``devshell.bbclass``
-====================
+``devshell``
+============
 
 The :ref:`ref-classes-devshell` class adds the :ref:`ref-tasks-devshell` task. Distribution
 policy dictates whether to include this class. See the ":ref:`dev-manual/development-shell:using a development shell`"
@@ -526,10 +610,10 @@ information about using :ref:`ref-classes-devshell`.
 
 .. _ref-classes-devupstream:
 
-``devupstream.bbclass``
-=======================
+``devupstream``
+===============
 
-The ``devupstream`` class uses
+The :ref:`ref-classes-devupstream` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
 tarball. Following is an example::
@@ -551,10 +635,10 @@ Any development-specific adjustments can be done by using the
 
 The class
 currently only supports creating a development variant of the target
-recipe, not ``native`` or ``nativesdk`` variants.
+recipe, not :ref:`ref-classes-native` or :ref:`ref-classes-nativesdk` variants.
 
 The :term:`BBCLASSEXTEND` syntax (i.e. ``devupstream:target``) provides
-support for ``native`` and ``nativesdk`` variants. Consequently, this
+support for :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk` variants. Consequently, this
 functionality can be added in a future release.
 
 Support for other version control systems such as Subversion is limited
@@ -563,10 +647,10 @@ due to BitBake's automatic fetch dependencies (e.g.
 
 .. _ref-classes-externalsrc:
 
-``externalsrc.bbclass``
-=======================
+``externalsrc``
+===============
 
-The ``externalsrc`` class supports building software from source code
+The :ref:`ref-classes-externalsrc` class supports building software from source code
 that is external to the OpenEmbedded build system. Building software
 from an external source tree means that the build system's normal fetch,
 unpack, and patch process is not used.
@@ -574,9 +658,8 @@ unpack, and patch process is not used.
 By default, the OpenEmbedded build system uses the :term:`S`
 and :term:`B` variables to locate unpacked recipe source code
 and to build it, respectively. When your recipe inherits the
-``externalsrc`` class, you use the
-:term:`EXTERNALSRC` and
-:term:`EXTERNALSRC_BUILD` variables to
+:ref:`ref-classes-externalsrc` class, you use the
+:term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD` variables to
 ultimately define :term:`S` and :term:`B`.
 
 By default, this class expects the source code to support recipe builds
@@ -591,7 +674,7 @@ See these variables for more information:
 :term:`WORKDIR`, :term:`BPN`, and
 :term:`PV`,
 
-For more information on the ``externalsrc`` class, see the comments in
+For more information on the :ref:`ref-classes-externalsrc` class, see the comments in
 ``meta/classes/externalsrc.bbclass`` in the :term:`Source Directory`.
 For information on how to use the :ref:`ref-classes-externalsrc` class, see the
 ":ref:`dev-manual/building:building software from an external source`"
@@ -599,10 +682,10 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-extrausers:
 
-``extrausers.bbclass``
-======================
+``extrausers``
+==============
 
-The ``extrausers`` class allows additional user and group configuration
+The :ref:`ref-classes-extrausers` class allows additional user and group configuration
 to be applied at the image level. Inheriting this class either globally
 or from an image recipe allows additional user and group operations to
 be performed using the
@@ -610,13 +693,11 @@ be performed using the
 
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
 
@@ -654,19 +735,19 @@ Finally, here is an example that sets the root password::
 .. note::
 
    From a security perspective, hardcoding a default password is not
-   generally a good idea or even legal in some jurisdictions. It is 
-   recommended that you do not do this if you are building a production 
+   generally a good idea or even legal in some jurisdictions. It is
+   recommended that you do not do this if you are building a production
    image.
 
 
 .. _ref-classes-features_check:
 
-``features_check.bbclass``
-=================================
+``features_check``
+==================
 
-The ``features_check`` class allows individual recipes to check
-for required and conflicting
-:term:`DISTRO_FEATURES`, :term:`MACHINE_FEATURES` or :term:`COMBINED_FEATURES`.
+The :ref:`ref-classes-features_check` class allows individual recipes to check
+for required and conflicting :term:`DISTRO_FEATURES`, :term:`MACHINE_FEATURES`
+or :term:`COMBINED_FEATURES`.
 
 This class provides support for the following variables:
 
@@ -687,10 +768,10 @@ triggered.
 
 .. _ref-classes-fontcache:
 
-``fontcache.bbclass``
-=====================
+``fontcache``
+=============
 
-The ``fontcache`` class generates the proper post-install and
+The :ref:`ref-classes-fontcache` class generates the proper post-install and
 post-remove (postinst and postrm) scriptlets for font packages. These
 scriptlets call ``fc-cache`` (part of ``Fontconfig``) to add the fonts
 to the font information cache. Since the cache files are
@@ -703,20 +784,20 @@ packages containing the fonts.
 
 .. _ref-classes-fs-uuid:
 
-``fs-uuid.bbclass``
-===================
+``fs-uuid``
+===========
 
-The ``fs-uuid`` class extracts UUID from
+The :ref:`ref-classes-fs-uuid` class extracts UUID from
 ``${``\ :term:`ROOTFS`\ ``}``, which must have been built
-by the time that this function gets called. The ``fs-uuid`` class only
+by the time that this function gets called. The :ref:`ref-classes-fs-uuid` class only
 works on ``ext`` file systems and depends on ``tune2fs``.
 
 .. _ref-classes-gconf:
 
-``gconf.bbclass``
-=================
+``gconf``
+=========
 
-The ``gconf`` class provides common functionality for recipes that need
+The :ref:`ref-classes-gconf` class provides common functionality for recipes that need
 to install GConf schemas. The schemas will be put into a separate
 package (``${``\ :term:`PN`\ ``}-gconf``) that is created
 automatically when this class is inherited. This package uses the
@@ -725,29 +806,52 @@ register and unregister the schemas in the target image.
 
 .. _ref-classes-gettext:
 
-``gettext.bbclass``
-===================
+``gettext``
+===========
 
-The ``gettext`` class provides support for building software that uses
-the GNU ``gettext`` internationalization and localization system. All
-recipes building software that use ``gettext`` should inherit this
+The :ref:`ref-classes-gettext` class provides support for building
+software that uses the GNU ``gettext`` internationalization and localization
+system. All recipes building software that use ``gettext`` should inherit this
 class.
 
 .. _ref-classes-gnomebase:
 
-``gnomebase.bbclass``
-=====================
+``gnomebase``
+=============
 
-The ``gnomebase`` class is the base class for recipes that build
+The :ref:`ref-classes-gnomebase` class is the base class for recipes that build
 software from the GNOME stack. This class sets
 :term:`SRC_URI` to download the source from the GNOME
 mirrors as well as extending :term:`FILES` with the typical
 GNOME installation paths.
 
+.. _ref-classes-go:
+
+``go``
+======
+
+The :ref:`ref-classes-go` class supports building Go programs. The behavior of
+this class is controlled by the mandatory :term:`GO_IMPORT` variable, and
+by the optional :term:`GO_INSTALL` and :term:`GO_INSTALL_FILTEROUT` ones.
+
+To build a Go program with the Yocto Project, you can use the
+:yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+recipe as an example.
+
+.. _ref-classes-go-mod:
+
+``go-mod``
+==========
+
+The :ref:`ref-classes-go-mod` class allows to use Go modules, and inherits the
+:ref:`ref-classes-go` class.
+
+See the associated :term:`GO_WORKDIR` variable.
+
 .. _ref-classes-gobject-introspection:
 
-``gobject-introspection.bbclass``
-=================================
+``gobject-introspection``
+=========================
 
 Provides support for recipes building software that supports GObject
 introspection. This functionality is only enabled if the
@@ -758,16 +862,17 @@ introspection. This functionality is only enabled if the
 
 .. note::
 
-   This functionality is backfilled by default and, if not applicable,
-   should be disabled through :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` or
+   This functionality is :ref:`backfilled <ref-features-backfill>` by default
+   and, if not applicable, should be disabled through
+   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` or
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`, respectively.
 
 .. _ref-classes-grub-efi:
 
-``grub-efi.bbclass``
-====================
+``grub-efi``
+============
 
-The ``grub-efi`` class provides ``grub-efi``-specific functions for
+The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific functions for
 building bootable images.
 
 This class supports several variables:
@@ -796,10 +901,10 @@ This class supports several variables:
 
 .. _ref-classes-gsettings:
 
-``gsettings.bbclass``
-=====================
+``gsettings``
+=============
 
-The ``gsettings`` class provides common functionality for recipes that
+The :ref:`ref-classes-gsettings` class provides common functionality for recipes that
 need to install GSettings (glib) schemas. The schemas are assumed to be
 part of the main package. Appropriate post-install and post-remove
 (postinst/postrm) scriptlets are added to register and unregister the
@@ -807,18 +912,18 @@ schemas in the target image.
 
 .. _ref-classes-gtk-doc:
 
-``gtk-doc.bbclass``
-===================
+``gtk-doc``
+===========
 
-The ``gtk-doc`` class is a helper class to pull in the appropriate
+The :ref:`ref-classes-gtk-doc` class is a helper class to pull in the appropriate
 ``gtk-doc`` dependencies and disable ``gtk-doc``.
 
 .. _ref-classes-gtk-icon-cache:
 
-``gtk-icon-cache.bbclass``
-==========================
+``gtk-icon-cache``
+==================
 
-The ``gtk-icon-cache`` class generates the proper post-install and
+The :ref:`ref-classes-gtk-icon-cache` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that use GTK+ and
 install icons. These scriptlets call ``gtk-update-icon-cache`` to add
 the fonts to GTK+'s icon cache. Since the cache files are
@@ -828,10 +933,10 @@ creation.
 
 .. _ref-classes-gtk-immodules-cache:
 
-``gtk-immodules-cache.bbclass``
-===============================
+``gtk-immodules-cache``
+=======================
 
-The ``gtk-immodules-cache`` class generates the proper post-install and
+The :ref:`ref-classes-gtk-immodules-cache` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install GTK+
 input method modules for virtual keyboards. These scriptlets call
 ``gtk-update-icon-cache`` to add the input method modules to the cache.
@@ -846,19 +951,19 @@ the packages containing the modules.
 
 .. _ref-classes-gzipnative:
 
-``gzipnative.bbclass``
-======================
+``gzipnative``
+==============
 
-The ``gzipnative`` class enables the use of different native versions of
+The :ref:`ref-classes-gzipnative` class enables the use of different native versions of
 ``gzip`` and ``pigz`` rather than the versions of these tools from the
 build host.
 
 .. _ref-classes-icecc:
 
-``icecc.bbclass``
-=================
+``icecc``
+=========
 
-The ``icecc`` class supports
+The :ref:`ref-classes-icecc` class supports
 `Icecream <https://github.com/icecc/icecream>`__, which facilitates
 taking compile jobs and distributing them among remote machines.
 
@@ -866,7 +971,7 @@ The class stages directories with symlinks from ``gcc`` and ``g++`` to
 ``icecc``, for both native and cross compilers. Depending on each
 configure or compile, the OpenEmbedded build system adds the directories
 at the head of the ``PATH`` list and then sets the ``ICECC_CXX`` and
-``ICEC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
+``ICECC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
 compilers, respectively.
 
 For the cross compiler, the class creates a ``tar.gz`` file that
@@ -874,8 +979,8 @@ contains the Yocto Project toolchain and sets ``ICECC_VERSION``, which
 is the version of the cross-compiler used in the cross-development
 toolchain, accordingly.
 
-The class handles all three different compile stages (i.e native
-,cross-kernel and target) and creates the necessary environment
+The class handles all three different compile stages (i.e native,
+cross-kernel and target) and creates the necessary environment
 ``tar.gz`` file to be used by the remote machines. The class also
 supports SDK generation.
 
@@ -885,12 +990,13 @@ using ``which``. If :term:`ICECC_ENV_EXEC` is set
 in your ``local.conf`` file, the variable should point to the
 ``icecc-create-env`` script provided by the user. If you do not point to
 a user-provided script, the build system uses the default script
-provided by the recipe ``icecc-create-env-native.bb``.
+provided by the recipe :oe_git:`icecc-create-env_0.1.bb
+</openembedded-core/tree/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb>`.
 
 .. note::
 
    This script is a modified version and not the one that comes with
-   icecc.
+   ``icecream``.
 
 If you do not want the Icecream distributed compile support to apply to
 specific recipes or classes, you can ask them to be ignored by Icecream
@@ -905,13 +1011,13 @@ Additionally, you can list recipes using the
 your ``local.conf`` file to force ``icecc`` to be enabled for recipes
 using an empty :term:`PARALLEL_MAKE` variable.
 
-Inheriting the ``icecc`` class changes all sstate signatures.
+Inheriting the :ref:`ref-classes-icecc` class changes all sstate signatures.
 Consequently, if a development team has a dedicated build system that
 populates :term:`SSTATE_MIRRORS` and they want to
 reuse sstate from :term:`SSTATE_MIRRORS`, then all developers and the build
-system need to either inherit the ``icecc`` class or nobody should.
+system need to either inherit the :ref:`ref-classes-icecc` class or nobody should.
 
-At the distribution level, you can inherit the ``icecc`` class to be
+At the distribution level, you can inherit the :ref:`ref-classes-icecc` class to be
 sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
 :term:`ICECC_DISABLED` variable to "1" as follows::
@@ -928,10 +1034,10 @@ individually as follows in your ``local.conf`` file::
 
 .. _ref-classes-image:
 
-``image.bbclass``
-=================
+``image``
+=========
 
-The ``image`` class helps support creating images in different formats.
+The :ref:`ref-classes-image` class helps support creating images in different formats.
 First, the root filesystem is created from packages using one of the
 ``rootfs*.bbclass`` files (depending on the package format used) and
 then one or more image files are created.
@@ -951,25 +1057,25 @@ Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-image-buildinfo:
 
-``image-buildinfo.bbclass``
-===========================
+``image-buildinfo``
+===================
 
-The ``image-buildinfo`` class writes information to the target
+The :ref:`ref-classes-image-buildinfo` class writes information to the target
 filesystem on ``/etc/build``.
 
 .. _ref-classes-image_types:
 
-``image_types.bbclass``
-=======================
+``image_types``
+===============
 
-The ``image_types`` class defines all of the standard image output types
+The :ref:`ref-classes-image_types` class defines all of the standard image output types
 that you can enable through the
 :term:`IMAGE_FSTYPES` variable. You can use this
 class as a reference on how to add support for custom image output
 types.
 
-By default, the :ref:`image <ref-classes-image>` class automatically
-enables the ``image_types`` class. The ``image`` class uses the
+By default, the :ref:`ref-classes-image` class automatically
+enables the :ref:`ref-classes-image_types` class. The :ref:`ref-classes-image` class uses the
 ``IMGCLASSES`` variable as follows::
 
    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
@@ -981,7 +1087,7 @@ enables the ``image_types`` class. The ``image`` class uses the
    IMGCLASSES += "image-postinst-intercepts"
    inherit ${IMGCLASSES}
 
-The ``image_types`` class also handles conversion and compression of images.
+The :ref:`ref-classes-image_types` class also handles conversion and compression of images.
 
 .. note::
 
@@ -991,8 +1097,8 @@ The ``image_types`` class also handles conversion and compression of images.
 
 .. _ref-classes-image-live:
 
-``image-live.bbclass``
-======================
+``image-live``
+==============
 
 This class controls building "live" (i.e. HDDIMG and ISO) images. Live
 images contain syslinux for legacy booting, as well as the bootloader
@@ -1004,10 +1110,10 @@ Normally, you do not use this class directly. Instead, you add "live" to
 
 .. _ref-classes-insane:
 
-``insane.bbclass``
-==================
+``insane``
+==========
 
-The ``insane`` class adds a step to the package generation process so
+The :ref:`ref-classes-insane` class adds a step to the package generation process so
 that output quality assurance checks are generated by the OpenEmbedded
 build system. A range of checks are performed that check the build's
 output for common problems that show up during runtime. Distribution
@@ -1053,8 +1159,8 @@ Here are the tests you can list with the :term:`WARN_QA` and
    software, like bootloaders, might need to bypass this check.
 
 -  ``buildpaths:`` Checks for paths to locations on the build host
-   inside the output files. Currently, this test triggers too many false
-   positives and thus is not normally enabled.
+   inside the output files. Not only can these leak information about
+   the build environment, they also hinder binary reproducibility.
 
 -  ``build-deps:`` Determines if a build-time dependency that is
    specified through :term:`DEPENDS`, explicit
@@ -1067,7 +1173,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
    the package is installed into the image during the
    :ref:`ref-tasks-rootfs` task because the auto-detected
    dependency was not satisfied. An example of this would be where the
-   :ref:`update-rc.d <ref-classes-update-rc.d>` class automatically
+   :ref:`ref-classes-update-rc.d` class automatically
    adds a dependency on the ``initscripts-functions`` package to
    packages that install an initscript that refers to
    ``/etc/init.d/functions``. The recipe should really have an explicit
@@ -1076,6 +1182,11 @@ Here are the tests you can list with the :term:`WARN_QA` and
    ``initscripts`` recipe is actually built and thus the
    ``initscripts-functions`` package is made available.
 
+-  ``configure-gettext:`` Checks that if a recipe is building something
+   that uses automake and the automake files contain an ``AM_GNU_GETTEXT``
+   directive, that the recipe also inherits the :ref:`ref-classes-gettext`
+   class to ensure that gettext is available during the build.
+
 -  ``compile-host-path:`` Checks the
    :ref:`ref-tasks-compile` log for indications that
    paths to locations on the build host were used. Using such paths
@@ -1154,12 +1265,12 @@ Here are the tests you can list with the :term:`WARN_QA` and
    might result in host contamination of the build output.
 
 -  ``installed-vs-shipped:`` Reports when files have been installed
-   within ``do_install`` but have not been included in any package by
+   within :ref:`ref-tasks-install` but have not been included in any package by
    way of the :term:`FILES` variable. Files that do not
    appear in any package cannot be present in an image later on in the
    build process. Ideally, all installed files should be packaged or not
    installed at all. These files can be deleted at the end of
-   ``do_install`` if the files are not needed in any package.
+   :ref:`ref-tasks-install` if the files are not needed in any package.
 
 -  ``invalid-chars:`` Checks that the recipe metadata variables
    :term:`DESCRIPTION`,
@@ -1192,11 +1303,39 @@ Here are the tests you can list with the :term:`WARN_QA` and
    ``/usr/libexec``. This check is not performed if the ``libexecdir``
    variable has been set explicitly to ``/usr/libexec``.
 
+-  ``mime:`` Check that if a package contains mime type files (``.xml``
+   files in ``${datadir}/mime/packages``) that the recipe also inherits
+   the :ref:`ref-classes-mime` class in order to ensure that these get
+   properly installed.
+
+-  ``mime-xdg:`` Checks that if a package contains a .desktop file with a
+   'MimeType' key present, that the recipe inherits the
+   :ref:`ref-classes-mime-xdg` class that is required in order for that
+   to be activated.
+
+-  ``missing-update-alternatives:`` Check that if a recipe sets the
+   :term:`ALTERNATIVE` variable that the recipe also inherits
+   :ref:`ref-classes-update-alternatives` such that the alternative will
+   be correctly set up.
+
 -  ``packages-list:`` Checks for the same package being listed
    multiple times through the :term:`PACKAGES` variable
    value. Installing the package in this manner can cause errors during
    packaging.
 
+-  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
+   them to apply incorrectly if the underlying code changes.
+
+-  ``patch-status-core:`` Checks that the Upstream-Status is specified
+   and valid in the headers of patches for recipes in the OE-Core layer.
+
+-  ``patch-status-noncore:`` Checks that the Upstream-Status is specified
+   and valid in the headers of patches for recipes in layers other than
+   OE-Core.
+
+-  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
+   installed and packaged by a recipe.
+
 -  ``perm-config:`` Reports lines in ``fs-perms.txt`` that have an
    invalid format.
 
@@ -1250,12 +1389,20 @@ Here are the tests you can list with the :term:`WARN_QA` and
    options are being passed to the linker commands and your binaries
    have potential security issues.
 
+-  ``shebang-size:`` Check that the shebang line (``#!`` in the first line)
+   in a packaged script is not longer than 128 characters, which can cause
+   an error at runtime depending on the operating system.
+
 -  ``split-strip:`` Reports that splitting or stripping debug symbols
    from binaries has failed.
 
 -  ``staticdev:`` Checks for static library files (``*.a``) in
    non-``staticdev`` packages.
 
+-  ``src-uri-bad:`` Checks that the :term:`SRC_URI` value set by a recipe
+   does not contain a reference to ``${PN}`` (instead of the correct
+   ``${BPN}``) nor refers to unstable Github archive tarballs.
+
 -  ``symlink-to-sysroot:`` Checks for symlinks in packages that point
    into :term:`TMPDIR` on the host. Such symlinks will
    work on the host, but are clearly invalid when running on the target.
@@ -1266,6 +1413,15 @@ Here are the tests you can list with the :term:`WARN_QA` and
    ":doc:`/ref-manual/qa-checks`" for more information regarding runtime performance
    issues.
 
+-  ``unhandled-features-check:`` check that if one of the variables that
+   the :ref:`ref-classes-features_check` class supports (e.g.
+   :term:`REQUIRED_DISTRO_FEATURES`) is set by a recipe, then the recipe
+   also inherits :ref:`ref-classes-features_check` in order for the
+   requirement to actually work.
+
+-  ``unimplemented-ptest:`` Checks that ptests are implemented for upstream
+   tests.
+
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
    for a package are also declared on the recipe level (i.e. any license
    in ``LICENSE:*`` should appear in :term:`LICENSE`).
@@ -1275,19 +1431,23 @@ Here are the tests you can list with the :term:`WARN_QA` and
    the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths will
    not cause any breakage, they do waste space and are unnecessary.
 
+-  ``usrmerge:`` If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this
+   check will ensure that no package installs files to root (``/bin``,
+   ``/sbin``, ``/lib``, ``/lib64``) directories.
+
 -  ``var-undefined:`` Reports when variables fundamental to packaging
    (i.e. :term:`WORKDIR`,
    :term:`DEPLOY_DIR`, :term:`D`,
    :term:`PN`, and :term:`PKGD`) are undefined
    during :ref:`ref-tasks-package`.
 
--  ``version-going-backwards:`` If Build History is enabled, reports
-   when a package being written out has a lower version than the
-   previously written package under the same name. If you are placing
-   output packages into a feed and upgrading packages on a target system
-   using that feed, the version of a package going backwards can result
-   in the target system not correctly upgrading to the "new" version of
-   the package.
+-  ``version-going-backwards:`` If the :ref:`ref-classes-buildhistory`
+   class is enabled, reports when a package being written out has a lower
+   version than the previously written package under the same name. If
+   you are placing output packages into a feed and upgrading packages on
+   a target system using that feed, the version of a package going
+   backwards can result in the target system not correctly upgrading to
+   the "new" version of the package.
 
    .. note::
 
@@ -1304,182 +1464,195 @@ Here are the tests you can list with the :term:`WARN_QA` and
 
 .. _ref-classes-insserv:
 
-``insserv.bbclass``
-===================
+``insserv``
+===========
 
-The ``insserv`` class uses the ``insserv`` utility to update the order
+The :ref:`ref-classes-insserv` class uses the ``insserv`` utility to update the order
 of symbolic links in ``/etc/rc?.d/`` within an image based on
 dependencies specified by LSB headers in the ``init.d`` scripts
 themselves.
 
 .. _ref-classes-kernel:
 
-``kernel.bbclass``
-==================
+``kernel``
+==========
 
-The ``kernel`` class handles building Linux kernels. The class contains
+The :ref:`ref-classes-kernel` class handles building Linux kernels. The class contains
 code to build all kernel trees. All needed headers are staged into the
 :term:`STAGING_KERNEL_DIR` directory to allow out-of-tree module builds
-using the :ref:`module <ref-classes-module>` class.
-
-This means that each built kernel module is packaged separately and
-inter-module dependencies are created by parsing the ``modinfo`` output.
-If all modules are required, then installing the ``kernel-modules``
-package installs all packages with modules and various other kernel
-packages such as ``kernel-vmlinux``.
-
-The ``kernel`` class contains logic that allows you to embed an initial
-RAM filesystem (initramfs) image when you build the kernel image. For
-information on how to build an initramfs, see the
+using the :ref:`ref-classes-module` class.
+
+If a file named ``defconfig`` is listed in :term:`SRC_URI`, then by default
+:ref:`ref-tasks-configure` copies it as ``.config`` in the build directory,
+so it is automatically used as the kernel configuration for the build. This
+copy is not performed in case ``.config`` already exists there: this allows
+recipes to produce a configuration by other means in
+``do_configure:prepend``.
+
+Each built kernel module is packaged separately and inter-module
+dependencies are created by parsing the ``modinfo`` output.  If all modules
+are required, then installing the ``kernel-modules`` package installs all
+packages with modules and various other kernel packages such as
+``kernel-vmlinux``.
+
+The :ref:`ref-classes-kernel` class contains logic that allows you to embed an initial
+RAM filesystem (:term:`Initramfs`) image when you build the kernel image. For
+information on how to build an :term:`Initramfs`, see the
 ":ref:`dev-manual/building:building an initial ram filesystem (Initramfs) image`" section in
 the Yocto Project Development Tasks Manual.
 
-Various other classes are used by the ``kernel`` and ``module`` classes
-internally including the :ref:`kernel-arch <ref-classes-kernel-arch>`,
-:ref:`module-base <ref-classes-module-base>`, and
-:ref:`linux-kernel-base <ref-classes-linux-kernel-base>` classes.
+Various other classes are used by the :ref:`ref-classes-kernel` and :ref:`ref-classes-module` classes
+internally including the :ref:`ref-classes-kernel-arch`, :ref:`ref-classes-module-base`, and
+:ref:`ref-classes-linux-kernel-base` classes.
 
 .. _ref-classes-kernel-arch:
 
-``kernel-arch.bbclass``
-=======================
+``kernel-arch``
+===============
 
-The ``kernel-arch`` class sets the ``ARCH`` environment variable for
+The :ref:`ref-classes-kernel-arch` class sets the ``ARCH`` environment variable for
 Linux kernel compilation (including modules).
 
 .. _ref-classes-kernel-devicetree:
 
-``kernel-devicetree.bbclass``
-=============================
+``kernel-devicetree``
+=====================
+
+The :ref:`ref-classes-kernel-devicetree` class, which is inherited by the
+:ref:`ref-classes-kernel` class, supports device tree generation.
+
+Its behavior is mainly controlled by the following variables:
 
-The ``kernel-devicetree`` class, which is inherited by the
-:ref:`kernel <ref-classes-kernel>` class, supports device tree
-generation.
+-  :term:`KERNEL_DEVICETREE_BUNDLE`: whether to bundle the kernel and device tree
+-  :term:`KERNEL_DTBDEST`: directory where to install DTB files
+-  :term:`KERNEL_DTBVENDORED`: whether to keep vendor subdirectories
+-  :term:`KERNEL_DTC_FLAGS`: flags for ``dtc``, the Device Tree Compiler
+-  :term:`KERNEL_PACKAGE_NAME`: base name of the kernel packages
 
 .. _ref-classes-kernel-fitimage:
 
-``kernel-fitimage.bbclass``
-===========================
+``kernel-fitimage``
+===================
 
-The ``kernel-fitimage`` class provides support to pack a kernel image,
-device trees, a U-boot script, a Initramfs bundle and a RAM disk
+The :ref:`ref-classes-kernel-fitimage` class provides support to pack a kernel image,
+device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM disk
 into a single FIT image. In theory, a FIT image can support any number
-of kernels, U-boot scripts, Initramfs bundles, RAM disks and device-trees.
-However, ``kernel-fitimage`` currently only supports
-limited usescases: just one kernel image, an optional U-boot script,
-an optional Initramfs bundle, an optional RAM disk, and any number of
-device tree.
+of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and device-trees.
+However, :ref:`ref-classes-kernel-fitimage` currently only supports
+limited usecases: just one kernel image, an optional U-boot script,
+an optional :term:`Initramfs` bundle, an optional RAM disk, and any number of
+device trees.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
-is set to include "kernel-fitimage" and :term:`KERNEL_IMAGETYPE`
-is set to "fitImage".
+is set to include ":ref:`ref-classes-kernel-fitimage`" and one of :term:`KERNEL_IMAGETYPE`,
+:term:`KERNEL_ALT_IMAGETYPE` or :term:`KERNEL_IMAGETYPES` to include "fitImage".
 
 The options for the device tree compiler passed to ``mkimage -D``
 when creating the FIT image are specified using the
 :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
 
 Only a single kernel can be added to the FIT image created by
-``kernel-fitimage`` and the kernel image in FIT is mandatory. The
+:ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandatory. The
 address where the kernel image is to be loaded by U-Boot is
 specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_ENTRYPOINT`.
 
 Multiple device trees can be added to the FIT image created by
-``kernel-fitimage`` and the device tree is optional.
+:ref:`ref-classes-kernel-fitimage` and the device tree is optional.
 The address where the device tree is to be loaded by U-Boot is
 specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
 and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
 
 Only a single RAM disk can be added to the FIT image created by
-``kernel-fitimage`` and the RAM disk in FIT is optional.
+:ref:`ref-classes-kernel-fitimage` and the RAM disk in FIT is optional.
 The address where the RAM disk image is to be loaded by U-Boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
-:term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to FIT image when
-:term:`INITRAMFS_IMAGE` is specified and that :term:`INITRAMFS_IMAGE_BUNDLE`
-is set to 0.
+:term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to the FIT image when
+:term:`INITRAMFS_IMAGE` is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE`
+is not set to 1.
 
-Only a single Initramfs bundle can be added to the FIT image created by
-``kernel-fitimage`` and the Initramfs bundle in FIT is optional.
-In case of Initramfs, the kernel is configured to be bundled with the root filesystem
+Only a single :term:`Initramfs` bundle can be added to the FIT image created by
+:ref:`ref-classes-kernel-fitimage` and the :term:`Initramfs` bundle in FIT is optional.
+In case of :term:`Initramfs`, the kernel is configured to be bundled with the root filesystem
 in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
-When the kernel is copied to RAM and executed, it unpacks the Initramfs root filesystem.
-The Initramfs bundle can be enabled when :term:`INITRAMFS_IMAGE`
-is specified and that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
-The address where the Initramfs bundle is to be loaded by U-boot is specified
+When the kernel is copied to RAM and executed, it unpacks the :term:`Initramfs` root filesystem.
+The :term:`Initramfs` bundle can be enabled when :term:`INITRAMFS_IMAGE`
+is specified and requires that :term:`INITRAMFS_IMAGE_BUNDLE` is set to 1.
+The address where the :term:`Initramfs` bundle is to be loaded by U-boot is specified
 by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
 
 Only a single U-boot boot script can be added to the FIT image created by
-``kernel-fitimage`` and the boot script is optional.
+:ref:`ref-classes-kernel-fitimage` and the boot script is optional.
 The boot script is specified in the ITS file as a text file containing
 U-boot commands. When using a boot script the user should configure the
-U-boot ``do_install`` task to copy the script to sysroot.
-So the script can be included in the FIT image by the ``kernel-fitimage``
+U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
+So the script can be included in the FIT image by the :ref:`ref-classes-kernel-fitimage`
 class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
-load the boot script from the FIT image and executes it.
+load the boot script from the FIT image and execute it.
 
-The FIT image generated by ``kernel-fitimage`` class is signed when the
+The FIT image generated by the :ref:`ref-classes-kernel-fitimage` class is signed when the
 variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
 :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
 appropriately. The default values used for :term:`FIT_HASH_ALG` and
-:term:`FIT_SIGN_ALG` in ``kernel-fitimage`` are "sha256" and
-"rsa2048" respectively. The keys for signing fitImage can be generated using
-the ``kernel-fitimage`` class when both :term:`FIT_GENERATE_KEYS` and
+:term:`FIT_SIGN_ALG` in :ref:`ref-classes-kernel-fitimage` are "sha256" and
+"rsa2048" respectively. The keys for signing the FIT image can be generated using
+the :ref:`ref-classes-kernel-fitimage` class when both :term:`FIT_GENERATE_KEYS` and
 :term:`UBOOT_SIGN_ENABLE` are set to "1".
 
 
 .. _ref-classes-kernel-grub:
 
-``kernel-grub.bbclass``
-=======================
+``kernel-grub``
+===============
 
-The ``kernel-grub`` class updates the boot area and the boot menu with
+The :ref:`ref-classes-kernel-grub` class updates the boot area and the boot menu with
 the kernel as the priority boot mechanism while installing a RPM to
 update the kernel on a deployed target.
 
 .. _ref-classes-kernel-module-split:
 
-``kernel-module-split.bbclass``
-===============================
+``kernel-module-split``
+=======================
 
-The ``kernel-module-split`` class provides common functionality for
+The :ref:`ref-classes-kernel-module-split` class provides common functionality for
 splitting Linux kernel modules into separate packages.
 
 .. _ref-classes-kernel-uboot:
 
-``kernel-uboot.bbclass``
-========================
+``kernel-uboot``
+================
 
-The ``kernel-uboot`` class provides support for building from
+The :ref:`ref-classes-kernel-uboot` class provides support for building from
 vmlinux-style kernel sources.
 
 .. _ref-classes-kernel-uimage:
 
-``kernel-uimage.bbclass``
-=========================
+``kernel-uimage``
+=================
 
-The ``kernel-uimage`` class provides support to pack uImage.
+The :ref:`ref-classes-kernel-uimage` class provides support to pack uImage.
 
 .. _ref-classes-kernel-yocto:
 
-``kernel-yocto.bbclass``
-========================
+``kernel-yocto``
+================
 
-The ``kernel-yocto`` class provides common functionality for building
+The :ref:`ref-classes-kernel-yocto` class provides common functionality for building
 from linux-yocto style kernel source repositories.
 
 .. _ref-classes-kernelsrc:
 
-``kernelsrc.bbclass``
-=====================
+``kernelsrc``
+=============
 
-The ``kernelsrc`` class sets the Linux kernel source and version.
+The :ref:`ref-classes-kernelsrc` class sets the Linux kernel source and version.
 
 .. _ref-classes-lib_package:
 
-``lib_package.bbclass``
-=======================
+``lib_package``
+===============
 
-The ``lib_package`` class supports recipes that build libraries and
+The :ref:`ref-classes-lib_package` class supports recipes that build libraries and
 produce executable binaries, where those binaries should not be
 installed by default along with the library. Instead, the binaries are
 added to a separate ``${``\ :term:`PN`\ ``}-bin`` package to
@@ -1487,40 +1660,40 @@ make their installation optional.
 
 .. _ref-classes-libc*:
 
-``libc*.bbclass``
-=================
+``libc*``
+=========
 
-The ``libc*`` classes support recipes that build packages with ``libc``:
+The :ref:`ref-classes-libc*` classes support recipes that build packages with ``libc``:
 
--  The ``libc-common`` class provides common support for building with
+-  The :ref:`libc-common <ref-classes-libc*>` class provides common support for building with
    ``libc``.
 
--  The ``libc-package`` class supports packaging up ``glibc`` and
+-  The :ref:`libc-package <ref-classes-libc*>` class supports packaging up ``glibc`` and
    ``eglibc``.
 
 .. _ref-classes-license:
 
-``license.bbclass``
-===================
+``license``
+===========
 
-The ``license`` class provides license manifest creation and license
+The :ref:`ref-classes-license` class provides license manifest creation and license
 exclusion. This class is enabled by default using the default value for
 the :term:`INHERIT_DISTRO` variable.
 
 .. _ref-classes-linux-kernel-base:
 
-``linux-kernel-base.bbclass``
-=============================
+``linux-kernel-base``
+=====================
 
-The ``linux-kernel-base`` class provides common functionality for
+The :ref:`ref-classes-linux-kernel-base` class provides common functionality for
 recipes that build out of the Linux kernel source tree. These builds
 goes beyond the kernel itself. For example, the Perf recipe also
 inherits this class.
 
 .. _ref-classes-linuxloader:
 
-``linuxloader.bbclass``
-=======================
+``linuxloader``
+===============
 
 Provides the function ``linuxloader()``, which gives the value of the
 dynamic loader/linker provided on the platform. This value is used by a
@@ -1528,63 +1701,64 @@ number of other classes.
 
 .. _ref-classes-logging:
 
-``logging.bbclass``
-===================
+``logging``
+===========
 
-The ``logging`` class provides the standard shell functions used to log
+The :ref:`ref-classes-logging` class provides the standard shell functions used to log
 messages for various BitBake severity levels (i.e. ``bbplain``,
 ``bbnote``, ``bbwarn``, ``bberror``, ``bbfatal``, and ``bbdebug``).
 
-This class is enabled by default since it is inherited by the ``base``
+This class is enabled by default since it is inherited by the :ref:`ref-classes-base`
 class.
 
 .. _ref-classes-meson:
 
-``meson.bbclass``
-=================
+``meson``
+=========
 
 The :ref:`ref-classes-meson` class allows to create recipes that build software
-using the `Meson <https://mesonbuild.com/>`__ build system. You can use
-the :term:`MESON_BUILDTYPE` and :term:`EXTRA_OEMESON` variables to specify
-additional configuration options to be passed using the ``meson`` command line.
+using the `Meson <https://mesonbuild.com/>`__ build system. You can use the
+:term:`MESON_BUILDTYPE` and :term:`EXTRA_OEMESON`
+variables to specify additional configuration options to be passed using the
+``meson`` command line.
 
 .. _ref-classes-metadata_scm:
 
-``metadata_scm.bbclass``
-========================
+``metadata_scm``
+================
 
-The ``metadata_scm`` class provides functionality for querying the
+The :ref:`ref-classes-metadata_scm` class provides functionality for querying the
 branch and revision of a Source Code Manager (SCM) repository.
 
-The :ref:`base <ref-classes-base>` class uses this class to print the
-revisions of each layer before starting every build. The
-``metadata_scm`` class is enabled by default because it is inherited by
-the ``base`` class.
+The :ref:`ref-classes-base` class uses this class to print the revisions of
+each layer before starting every build. The :ref:`ref-classes-metadata_scm`
+class is enabled by default because it is inherited by the
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-migrate_localcount:
 
-``migrate_localcount.bbclass``
-==============================
+``migrate_localcount``
+======================
 
-The ``migrate_localcount`` class verifies a recipe's localcount data and
+The :ref:`ref-classes-migrate_localcount` class verifies a recipe's localcount data and
 increments it appropriately.
 
 .. _ref-classes-mime:
 
-``mime.bbclass``
-================
+``mime``
+========
 
-The ``mime`` class generates the proper post-install and post-remove
+The :ref:`ref-classes-mime` class generates the proper post-install and post-remove
 (postinst/postrm) scriptlets for packages that install MIME type files.
 These scriptlets call ``update-mime-database`` to add the MIME types to
 the shared database.
 
 .. _ref-classes-mime-xdg:
 
-``mime-xdg.bbclass``
-====================
+``mime-xdg``
+============
 
-The :ref:`mime-xdg <ref-classes-mime-xdg>` class generates the proper
+The :ref:`ref-classes-mime-xdg` class generates the proper
 post-install and post-remove (postinst/postrm) scriptlets for packages
 that install ``.desktop`` files containing ``MimeType`` entries.
 These scriptlets call ``update-desktop-database`` to add the MIME types
@@ -1602,28 +1776,26 @@ package names to the :term:`MIME_XDG_PACKAGES` variable.
 
 .. _ref-classes-mirrors:
 
-``mirrors.bbclass``
-===================
+``mirrors``
+===========
 
-The ``mirrors`` class sets up some standard
+The :ref:`ref-classes-mirrors` class sets up some standard
 :term:`MIRRORS` entries for source code mirrors. These
 mirrors provide a fall-back path in case the upstream source specified
 in :term:`SRC_URI` within recipes is unavailable.
 
 This class is enabled by default since it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-module:
 
-``module.bbclass``
-==================
+``module``
+==========
 
-The ``module`` class provides support for building out-of-tree Linux
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
@@ -1632,21 +1804,21 @@ section in the Yocto Project Linux Kernel Development Manual.
 
 .. _ref-classes-module-base:
 
-``module-base.bbclass``
-=======================
+``module-base``
+===============
 
-The ``module-base`` class provides the base functionality for building
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
 
-``multilib*.bbclass``
-=====================
+``multilib*``
+=============
 
-The ``multilib*`` classes provide support for building libraries with
+The :ref:`ref-classes-multilib*` classes provide support for building libraries with
 different target optimizations or target architectures and installing
 them side-by-side in the same image.
 
@@ -1656,20 +1828,20 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-native:
 
-``native.bbclass``
-==================
+``native``
+==========
 
-The ``native`` class provides common functionality for recipes that
+The :ref:`ref-classes-native` class provides common functionality for recipes that
 build tools to run on the :term:`Build Host` (i.e. tools that use the compiler
 or other tools from the build host).
 
 You can create a recipe that builds tools that run natively on the host
 a couple different ways:
 
--  Create a ``myrecipe-native.bb`` recipe that inherits the ``native``
+-  Create a ``myrecipe-native.bb`` recipe that inherits the :ref:`ref-classes-native`
    class. If you use this method, you must order the inherit statement
    in the recipe after all other inherit statements so that the
-   ``native`` class is inherited last.
+   :ref:`ref-classes-native` class is inherited last.
 
    .. note::
 
@@ -1691,17 +1863,17 @@ a couple different ways:
    specify any functionality specific to the respective native or target
    case.
 
-Although applied differently, the ``native`` class is used with both
+Although applied differently, the :ref:`ref-classes-native` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for native and
 target. All common parts of the recipe are automatically shared.
 
 .. _ref-classes-nativesdk:
 
-``nativesdk.bbclass``
-=====================
+``nativesdk``
+=============
 
-The ``nativesdk`` class provides common functionality for recipes that
+The :ref:`ref-classes-nativesdk` class provides common functionality for recipes that
 wish to build tools to run as part of an SDK (i.e. tools that run on
 :term:`SDKMACHINE`).
 
@@ -1709,11 +1881,11 @@ You can create a recipe that builds tools that run on the SDK machine a
 couple different ways:
 
 -  Create a ``nativesdk-myrecipe.bb`` recipe that inherits the
-   ``nativesdk`` class. If you use this method, you must order the
+   :ref:`ref-classes-nativesdk` class. If you use this method, you must order the
    inherit statement in the recipe after all other inherit statements so
-   that the ``nativesdk`` class is inherited last.
+   that the :ref:`ref-classes-nativesdk` class is inherited last.
 
--  Create a ``nativesdk`` variant of any recipe by adding the following::
+-  Create a :ref:`ref-classes-nativesdk` variant of any recipe by adding the following::
 
        BBCLASSEXTEND = "nativesdk"
 
@@ -1732,26 +1904,26 @@ couple different ways:
    Not doing so can lead to subtle problems because there is code that
    depends on the naming convention.
 
-Although applied differently, the ``nativesdk`` class is used with both
+Although applied differently, the :ref:`ref-classes-nativesdk` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for the SDK machine
 and the target. All common parts of the recipe are automatically shared.
 
 .. _ref-classes-nopackages:
 
-``nopackages.bbclass``
-======================
+``nopackages``
+==============
 
 Disables packaging tasks for those recipes and classes where packaging
 is not needed.
 
 .. _ref-classes-npm:
 
-``npm.bbclass``
-===============
+``npm``
+=======
 
-Provides support for building Node.js software fetched using the `node
-package manager (NPM) <https://en.wikipedia.org/wiki/Npm_(software)>`__.
+Provides support for building Node.js software fetched using the
+:wikipedia:`node package manager (NPM) <Npm_(software)>`.
 
 .. note::
 
@@ -1764,22 +1936,22 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-oelint:
 
-``oelint.bbclass``
-==================
+``oelint``
+==========
 
-The ``oelint`` class is an obsolete lint checking tool available in
+The :ref:`ref-classes-oelint` class is an obsolete lint checking tool available in
 ``meta/classes`` in the :term:`Source Directory`.
 
 There are some classes that could be generally useful in OE-Core but
-are never actually used within OE-Core itself. The ``oelint`` class is
+are never actually used within OE-Core itself. The :ref:`ref-classes-oelint` class is
 one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
 
 .. _ref-classes-overlayfs:
 
-``overlayfs.bbclass``
-=======================
+``overlayfs``
+=============
 
 It's often desired in Embedded System design to have a read-only root filesystem.
 But a lot of different applications might want to have read-write access to
@@ -1800,7 +1972,7 @@ is supported by ``overlayfs``. This has to be done in your machine configuration
   * QA checks fail to catch file existence if you redefine this variable in your recipe!
   * Only the existence of the systemd mount unit file is checked, not its contents.
   * To get more details on ``overlayfs``, its internals and supported operations, please refer
-    to the official documentation of the `Linux kernel <https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`_.
+    to the official documentation of the `Linux kernel <https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`__.
 
 The class assumes you have a ``data.mount`` systemd unit defined elsewhere in your BSP
 (e.g. in ``systemd-machine-units`` recipe) and it's installed into the image.
@@ -1825,7 +1997,7 @@ and then in your recipe::
 On a practical note, your application recipe might require multiple
 overlays to be mounted before running to avoid writing to the underlying
 file system (which can be forbidden in case of read-only file system)
-To achieve that :ref:`overlayfs <ref-classes-overlayfs>` provides a ``systemd``
+To achieve that :ref:`ref-classes-overlayfs` provides a ``systemd``
 helper service for mounting overlays. This helper service is named
 ``${PN}-overlays.service`` and can be depended on in your application recipe
 (named ``application`` in the following example) ``systemd`` unit by adding
@@ -1838,12 +2010,12 @@ to the unit the following::
 .. note::
 
    The class does not support the ``/etc`` directory itself, because ``systemd`` depends on it.
-   In order to get ``/etc`` in overlayfs, see :ref:`overlayfs-etc <ref-classes-overlayfs-etc>`.
+   In order to get ``/etc`` in overlayfs, see :ref:`ref-classes-overlayfs-etc`.
 
 .. _ref-classes-overlayfs-etc:
 
-``overlayfs-etc.bbclass``
-=========================
+``overlayfs-etc``
+=================
 
 In order to have the ``/etc`` directory in overlayfs a special handling at early
 boot stage is required. The idea is to supply a custom init script that mounts
@@ -1887,10 +2059,10 @@ The class provides two options for ``/sbin/init`` generation:
 
 .. _ref-classes-own-mirrors:
 
-``own-mirrors.bbclass``
-=======================
+``own-mirrors``
+===============
 
-The ``own-mirrors`` class makes it easier to set up your own
+The :ref:`ref-classes-own-mirrors` class makes it easier to set up your own
 :term:`PREMIRRORS` from which to first fetch source
 before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.
@@ -1906,32 +2078,22 @@ in :term:`SOURCE_MIRROR_URL`.
 
 .. _ref-classes-package:
 
-``package.bbclass``
-===================
+``package``
+===========
 
-The ``package`` class supports generating packages from a build's
+The :ref:`ref-classes-package` class supports generating packages from a build's
 output. The core generic functionality is in ``package.bbclass``. The
 code specific to particular package types resides in these
-package-specific classes:
-:ref:`package_deb <ref-classes-package_deb>`,
-:ref:`package_rpm <ref-classes-package_rpm>`,
-:ref:`package_ipk <ref-classes-package_ipk>`, and
-:ref:`package_tar <ref-classes-package_tar>`.
-
-.. note::
-
-   The
-   package_tar
-   class is broken and not supported. It is recommended that you do not
-   use this class.
+package-specific classes: :ref:`ref-classes-package_deb`,
+:ref:`ref-classes-package_rpm`, :ref:`ref-classes-package_ipk`.
 
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
@@ -1948,7 +2110,7 @@ complete build of the package with all dependencies previously built.
 The reason for this discrepancy is because the RPM package manager
 creates and processes more :term:`Metadata` than the IPK package
 manager. Consequently, you might consider setting :term:`PACKAGE_CLASSES` to
-"package_ipk" if you are building smaller systems.
+":ref:`ref-classes-package_ipk`" if you are building smaller systems.
 
 Before making your package manager decision, however, you should
 consider some further things about using RPM:
@@ -1973,84 +2135,84 @@ at these two Yocto Project mailing list links:
 
 .. _ref-classes-package_deb:
 
-``package_deb.bbclass``
-=======================
+``package_deb``
+===============
 
-The ``package_deb`` class provides support for creating packages that
+The :ref:`ref-classes-package_deb` class provides support for creating packages that
 use the Debian (i.e. ``.deb``) file format. The class ensures the
 packages are written out in a ``.deb`` file format to the
 ``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
 .. _ref-classes-package_ipk:
 
-``package_ipk.bbclass``
-=======================
+``package_ipk``
+===============
 
-The ``package_ipk`` class provides support for creating packages that
+The :ref:`ref-classes-package_ipk` class provides support for creating packages that
 use the IPK (i.e. ``.ipk``) file format. The class ensures the packages
 are written out in a ``.ipk`` file format to the
 ``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
 .. _ref-classes-package_rpm:
 
-``package_rpm.bbclass``
-=======================
+``package_rpm``
+===============
 
-The ``package_rpm`` class provides support for creating packages that
+The :ref:`ref-classes-package_rpm` class provides support for creating packages that
 use the RPM (i.e. ``.rpm``) file format. The class ensures the packages
 are written out in a ``.rpm`` file format to the
 ``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
 .. _ref-classes-package_tar:
 
-``package_tar.bbclass``
-=======================
+``package_tar``
+===============
 
-The ``package_tar`` class provides support for creating tarballs. The
+The :ref:`ref-classes-package_tar` class provides support for creating tarballs. The
 class ensures the packages are written out in a tarball format to the
 ``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory.
 
-This class inherits the :ref:`package <ref-classes-package>` class and
+This class inherits the :ref:`ref-classes-package` class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
 
 .. note::
 
-   You cannot specify the ``package_tar`` class first using the
+   You cannot specify the :ref:`ref-classes-package_tar` class first using the
    :term:`PACKAGE_CLASSES` variable. You must use ``.deb``, ``.ipk``, or ``.rpm``
    file formats for your image or SDK.
 
 .. _ref-classes-packagedata:
 
-``packagedata.bbclass``
-=======================
+``packagedata``
+===============
 
-The ``packagedata`` class provides common functionality for reading
+The :ref:`ref-classes-packagedata` class provides common functionality for reading
 ``pkgdata`` files found in :term:`PKGDATA_DIR`. These
 files contain information about each output package produced by the
 OpenEmbedded build system.
 
 This class is enabled by default because it is inherited by the
-:ref:`package <ref-classes-package>` class.
+:ref:`ref-classes-package` class.
 
 .. _ref-classes-packagegroup:
 
-``packagegroup.bbclass``
-========================
+``packagegroup``
+================
 
-The ``packagegroup`` class sets default values appropriate for package
+The :ref:`ref-classes-packagegroup` class sets default values appropriate for package
 group recipes (e.g. :term:`PACKAGES`, :term:`PACKAGE_ARCH`, :term:`ALLOW_EMPTY`, and
 so forth). It is highly recommended that all package group recipes
 inherit this class.
@@ -2063,46 +2225,46 @@ Previously, this class was called the ``task`` class.
 
 .. _ref-classes-patch:
 
-``patch.bbclass``
-=================
+``patch``
+=========
 
-The ``patch`` class provides all functionality for applying patches
+The :ref:`ref-classes-patch` class provides all functionality for applying patches
 during the :ref:`ref-tasks-patch` task.
 
 This class is enabled by default because it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-perlnative:
 
-``perlnative.bbclass``
-======================
+``perlnative``
+==============
 
-When inherited by a recipe, the ``perlnative`` class supports using the
+When inherited by a recipe, the :ref:`ref-classes-perlnative` class supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
 
 .. _ref-classes-pypi:
 
-``pypi.bbclass``
-================
+``pypi``
+========
 
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
 
 .. _ref-classes-python_flit_core:
 
-``python_flit_core.bbclass``
-============================
+``python_flit_core``
+====================
 
-The ``python_flit_core`` class enables building Python modules which declare
+The :ref:`ref-classes-python_flit_core` class enables building Python modules which declare
 the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
 ``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
 section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
@@ -2110,42 +2272,64 @@ section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep
 Python modules built with ``flit_core.buildapi`` are pure Python (no
 ``C`` or ``Rust`` extensions).
 
-Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
+Internally this uses the :ref:`ref-classes-python_pep517` class.
 
 .. _ref-classes-python_pep517:
 
-``python_pep517.bbclass``
-=========================
+``python_pep517``
+=================
 
-The ``python_pep517`` class builds and installs a Python ``wheel`` binary
+The :ref:`ref-classes-python_pep517` class builds and installs a Python ``wheel`` binary
 archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
 
 Recipes wouldn't inherit this directly, instead typically another class will
-inherit this, add the relevant native dependencies, and set
-:term:`PEP517_BUILD_API` to the Python class which implements the PEP-517 build
-API.
+inherit this and add the relevant native dependencies.
 
-Examples of classes which do this are :ref:`python_flit_core
-<ref-classes-python_flit_core>`, :ref:`python_setuptools_build_meta
-<ref-classes-python_setuptools_build_meta>`, and :ref:`python_poetry_core
-<ref-classes-python_poetry_core>`.
+Examples of classes which do this are :ref:`ref-classes-python_flit_core`,
+:ref:`ref-classes-python_setuptools_build_meta`, and
+:ref:`ref-classes-python_poetry_core`.
 
 .. _ref-classes-python_poetry_core:
 
-``python_poetry_core.bbclass``
-==============================
+``python_poetry_core``
+======================
 
-The ``python_poetry_core`` class enables building Python modules which use the
+The :ref:`ref-classes-python_poetry_core` class enables building Python modules which use the
 `Poetry Core <https://python-poetry.org>`__ build system.
 
-Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
+Internally this uses the :ref:`ref-classes-python_pep517` class.
+
+.. _ref-classes-python_pyo3:
+
+``python_pyo3``
+===============
+
+The :ref:`ref-classes-python_pyo3` class helps make sure that Python extensions
+written in Rust and built with `PyO3 <https://pyo3.rs/>`__, properly set up the
+environment for cross compilation.
+
+This class is internal to the :ref:`ref-classes-python-setuptools3_rust` class
+and is not meant to be used directly in recipes.
+
+.. _ref-classes-python-setuptools3_rust:
+
+``python-setuptools3_rust``
+===========================
+
+The :ref:`ref-classes-python-setuptools3_rust` class enables building Python
+extensions implemented in Rust with `PyO3 <https://pyo3.rs/>`__, which allows
+to compile and distribute Python extensions written in Rust as easily
+as if they were written in C.
+
+This class inherits the :ref:`ref-classes-setuptools3` and
+:ref:`ref-classes-python_pyo3` classes.
 
 .. _ref-classes-pixbufcache:
 
-``pixbufcache.bbclass``
-=======================
+``pixbufcache``
+===============
 
-The ``pixbufcache`` class generates the proper post-install and
+The :ref:`ref-classes-pixbufcache` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install
 pixbuf loaders, which are used with ``gdk-pixbuf``. These scriptlets
 call ``update_pixbuf_cache`` to add the pixbuf loaders to the cache.
@@ -2160,24 +2344,24 @@ containing the loaders.
 
 .. _ref-classes-pkgconfig:
 
-``pkgconfig.bbclass``
-=====================
+``pkgconfig``
+=============
 
-The ``pkgconfig`` class provides a standard way to get header and
+The :ref:`ref-classes-pkgconfig` class provides a standard way to get header and
 library information by using ``pkg-config``. This class aims to smooth
 integration of ``pkg-config`` into libraries that use it.
 
 During staging, BitBake installs ``pkg-config`` data into the
 ``sysroots/`` directory. By making use of sysroot functionality within
-``pkg-config``, the ``pkgconfig`` class no longer has to manipulate the
+``pkg-config``, the :ref:`ref-classes-pkgconfig` class no longer has to manipulate the
 files.
 
 .. _ref-classes-populate-sdk:
 
-``populate_sdk.bbclass``
-========================
+``populate_sdk``
+================
 
-The ``populate_sdk`` class provides support for SDK-only recipes. For
+The :ref:`ref-classes-populate-sdk` class provides support for SDK-only recipes. For
 information on advantages gained when building a cross-development
 toolchain using the :ref:`ref-tasks-populate_sdk`
 task, see the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
@@ -2186,34 +2370,34 @@ Software Development Kit (eSDK) manual.
 
 .. _ref-classes-populate-sdk-*:
 
-``populate_sdk_*.bbclass``
-==========================
+``populate_sdk_*``
+==================
 
-The ``populate_sdk_*`` classes support SDK creation and consist of the
+The :ref:`ref-classes-populate-sdk-*` classes support SDK creation and consist of the
 following classes:
 
--  ``populate_sdk_base``: The base class supporting SDK creation under
+-  :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`: The base class supporting SDK creation under
    all package managers (i.e. DEB, RPM, and opkg).
 
--  ``populate_sdk_deb``: Supports creation of the SDK given the Debian
+-  :ref:`populate_sdk_deb <ref-classes-populate-sdk-*>`: Supports creation of the SDK given the Debian
    package manager.
 
--  ``populate_sdk_rpm``: Supports creation of the SDK given the RPM
+-  :ref:`populate_sdk_rpm <ref-classes-populate-sdk-*>`: Supports creation of the SDK given the RPM
    package manager.
 
--  ``populate_sdk_ipk``: Supports creation of the SDK given the opkg
+-  :ref:`populate_sdk_ipk <ref-classes-populate-sdk-*>`: Supports creation of the SDK given the opkg
    (IPK format) package manager.
 
--  ``populate_sdk_ext``: Supports extensible SDK creation under all
+-  :ref:`populate_sdk_ext <ref-classes-populate-sdk-*>`: Supports extensible SDK creation under all
    package managers.
 
-The ``populate_sdk_base`` class inherits the appropriate
+The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class inherits the appropriate
 ``populate_sdk_*`` (i.e. ``deb``, ``rpm``, and ``ipk``) based on
 :term:`IMAGE_PKGTYPE`.
 
 The base class ensures all source and destination directories are
 established and then populates the SDK. After populating the SDK, the
-``populate_sdk_base`` class constructs two sysroots:
+:ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class constructs two sysroots:
 ``${``\ :term:`SDK_ARCH`\ ``}-nativesdk``, which
 contains the cross-compiler and associated tooling, and the target,
 which contains a target root filesystem that is configured for the SDK
@@ -2226,9 +2410,9 @@ which consists of the following::
 Finally, the base populate SDK class creates the toolchain environment
 setup script, the tarball of the SDK, and the installer.
 
-The respective ``populate_sdk_deb``, ``populate_sdk_rpm``, and
-``populate_sdk_ipk`` classes each support the specific type of SDK.
-These classes are inherited by and used with the ``populate_sdk_base``
+The respective :ref:`populate_sdk_deb <ref-classes-populate-sdk-*>`, :ref:`populate_sdk_rpm <ref-classes-populate-sdk-*>`, and
+:ref:`populate_sdk_ipk <ref-classes-populate-sdk-*>` classes each support the specific type of SDK.
+These classes are inherited by and used with the :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
 class.
 
 For more information on the cross-development toolchain generation, see
@@ -2243,10 +2427,10 @@ Software Development Kit (eSDK) manual.
 
 .. _ref-classes-prexport:
 
-``prexport.bbclass``
-====================
+``prexport``
+============
 
-The ``prexport`` class provides functionality for exporting
+The :ref:`ref-classes-prexport` class provides functionality for exporting
 :term:`PR` values.
 
 .. note::
@@ -2256,10 +2440,10 @@ The ``prexport`` class provides functionality for exporting
 
 .. _ref-classes-primport:
 
-``primport.bbclass``
-====================
+``primport``
+============
 
-The ``primport`` class provides functionality for importing
+The :ref:`ref-classes-primport` class provides functionality for importing
 :term:`PR` values.
 
 .. note::
@@ -2269,8 +2453,8 @@ The ``primport`` class provides functionality for importing
 
 .. _ref-classes-prserv:
 
-``prserv.bbclass``
-==================
+``prserv``
+==========
 
 The :ref:`ref-classes-prserv` class provides functionality for using a :ref:`PR
 service <dev-manual/packages:working with a pr service>` in order to
@@ -2278,14 +2462,14 @@ automatically manage the incrementing of the :term:`PR`
 variable for each recipe.
 
 This class is enabled by default because it is inherited by the
-:ref:`package <ref-classes-package>` class. However, the OpenEmbedded
+:ref:`ref-classes-package` class. However, the OpenEmbedded
 build system will not enable the functionality of this class unless
 :term:`PRSERV_HOST` has been set.
 
 .. _ref-classes-ptest:
 
-``ptest.bbclass``
-=================
+``ptest``
+=========
 
 The ``ptest`` class provides functionality for packaging and installing
 runtime tests for recipes that build software that provides these tests.
@@ -2299,8 +2483,8 @@ on ptest.
 
 .. _ref-classes-ptest-gnome:
 
-``ptest-gnome.bbclass``
-=======================
+``ptest-gnome``
+===============
 
 Enables package tests (ptests) specifically for GNOME packages, which
 have tests intended to be executed with ``gnome-desktop-testing``.
@@ -2311,27 +2495,27 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-python3-dir:
 
-``python3-dir.bbclass``
-=======================
+``python3-dir``
+===============
 
-The ``python3-dir`` class provides the base version, location, and site
+The :ref:`ref-classes-python3-dir` class provides the base version, location, and site
 package location for Python 3.
 
 .. _ref-classes-python3native:
 
-``python3native.bbclass``
-=========================
+``python3native``
+=================
 
-The ``python3native`` class supports using the native version of Python
+The :ref:`ref-classes-python3native` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host.
 
 .. _ref-classes-python3targetconfig:
 
-``python3targetconfig.bbclass``
-===============================
+``python3targetconfig``
+=======================
 
-The ``python3targetconfig`` class supports using the native version of Python
+The :ref:`ref-classes-python3targetconfig` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host, except that the configuration for the target machine
 is accessible (such as correct installation directories). This also adds a
@@ -2340,41 +2524,40 @@ in order to avoid unnecessarily lengthening builds.
 
 .. _ref-classes-qemu:
 
-``qemu.bbclass``
-================
+``qemu``
+========
 
-The ``qemu`` class provides functionality for recipes that either need
+The :ref:`ref-classes-qemu` class provides functionality for recipes that either need
 QEMU or test for the existence of QEMU. Typically, this class is used to
 run programs for a target system on the build host using QEMU's
 application emulation mode.
 
 .. _ref-classes-recipe_sanity:
 
-``recipe_sanity.bbclass``
-=========================
+``recipe_sanity``
+=================
 
-The ``recipe_sanity`` class checks for the presence of any host system
+The :ref:`ref-classes-recipe_sanity` class checks for the presence of any host system
 recipe prerequisites that might affect the build (e.g. variables that
 are set or software that is present).
 
 .. _ref-classes-relocatable:
 
-``relocatable.bbclass``
-=======================
+``relocatable``
+===============
 
-The ``relocatable`` class enables relocation of binaries when they are
+The :ref:`ref-classes-relocatable` class enables relocation of binaries when they are
 installed into the sysroot.
 
-This class makes use of the :ref:`chrpath <ref-classes-chrpath>` class
-and is used by both the :ref:`cross <ref-classes-cross>` and
-:ref:`native <ref-classes-native>` classes.
+This class makes use of the :ref:`ref-classes-chrpath` class and is used by
+both the :ref:`ref-classes-cross` and :ref:`ref-classes-native` classes.
 
 .. _ref-classes-remove-libtool:
 
-``remove-libtool.bbclass``
-==========================
+``remove-libtool``
+==================
 
-The ``remove-libtool`` class adds a post function to the
+The :ref:`ref-classes-remove-libtool` class adds a post function to the
 :ref:`ref-tasks-install` task to remove all ``.la`` files
 installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.
@@ -2386,12 +2569,12 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
 
 .. note::
 
-   The ``remove-libtool`` class is not enabled by default.
+   The :ref:`ref-classes-remove-libtool` class is not enabled by default.
 
 .. _ref-classes-report-error:
 
-``report-error.bbclass``
-========================
+``report-error``
+================
 
 The :ref:`ref-classes-report-error` class supports enabling the :ref:`error reporting
 tool <dev-manual/error-reporting-tool:using the error reporting tool>`",
@@ -2405,10 +2588,10 @@ are created and stored in
 
 .. _ref-classes-rm-work:
 
-``rm_work.bbclass``
-===================
+``rm_work``
+===========
 
-The ``rm_work`` class supports deletion of temporary workspace, which
+The :ref:`ref-classes-rm-work` class supports deletion of temporary workspace, which
 can ease your hard drive demands during builds.
 
 The OpenEmbedded build system can use a substantial amount of disk space
@@ -2417,60 +2600,76 @@ under the ``${TMPDIR}/work`` directory for each recipe. Once the build
 system generates the packages for a recipe, the work files for that
 recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
-you would rather have these files deleted to save disk space as the
-build progresses, you can enable ``rm_work`` by adding the following to
-your ``local.conf`` file, which is found in the :term:`Build Directory`.
-::
+you would rather have these files deleted to save disk space as the build
+progresses, you can enable :ref:`ref-classes-rm-work` by adding the following to
+your ``local.conf`` file, which is found in the :term:`Build Directory`::
 
    INHERIT += "rm_work"
 
-If you are
-modifying and building source code out of the work directory for a
-recipe, enabling ``rm_work`` will potentially result in your changes to
-the source being lost. To exclude some recipes from having their work
-directories deleted by ``rm_work``, you can add the names of the recipe
-or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable, which
-can also be set in your ``local.conf`` file. Here is an example::
+If you are modifying and building source code out of the work directory for a
+recipe, enabling :ref:`ref-classes-rm-work` will potentially result in your
+changes to the source being lost. To exclude some recipes from having their work
+directories deleted by :ref:`ref-classes-rm-work`, you can add the names of the
+recipe or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable,
+which can also be set in your ``local.conf`` file. Here is an example::
 
    RM_WORK_EXCLUDE += "busybox glibc"
 
 .. _ref-classes-rootfs*:
 
-``rootfs*.bbclass``
-===================
+``rootfs*``
+===========
 
-The ``rootfs*`` classes support creating the root filesystem for an
+The :ref:`ref-classes-rootfs*` classes support creating the root filesystem for an
 image and consist of the following classes:
 
--  The ``rootfs-postcommands`` class, which defines filesystem
+-  The :ref:`rootfs-postcommands <ref-classes-rootfs*>` class, which defines filesystem
    post-processing functions for image recipes.
 
--  The ``rootfs_deb`` class, which supports creation of root filesystems
+-  The :ref:`rootfs_deb <ref-classes-rootfs*>` class, which supports creation of root filesystems
    for images built using ``.deb`` packages.
 
--  The ``rootfs_rpm`` class, which supports creation of root filesystems
+-  The :ref:`rootfs_rpm <ref-classes-rootfs*>` class, which supports creation of root filesystems
    for images built using ``.rpm`` packages.
 
--  The ``rootfs_ipk`` class, which supports creation of root filesystems
+-  The :ref:`rootfs_ipk <ref-classes-rootfs*>` class, which supports creation of root filesystems
    for images built using ``.ipk`` packages.
 
--  The ``rootfsdebugfiles`` class, which installs additional files found
+-  The :ref:`rootfsdebugfiles <ref-classes-rootfs*>` class, which installs additional files found
    on the build host directly into the root filesystem.
 
 The root filesystem is created from packages using one of the
-``rootfs*.bbclass`` files as determined by the
-:term:`PACKAGE_CLASSES` variable.
+:ref:`ref-classes-rootfs*` files as determined by the :term:`PACKAGE_CLASSES`
+variable.
 
 For information on how root filesystem images are created, see the
 ":ref:`overview-manual/concepts:image generation`"
 section in the Yocto Project Overview and Concepts Manual.
 
+.. _ref-classes-rust:
+
+``rust``
+========
+
+The :ref:`ref-classes-rust` class is an internal class which is just used
+in the "rust" recipe, to build the Rust compiler and runtime
+library. Except for this recipe, it is not intended to be used directly.
+
+.. _ref-classes-rust-common:
+
+``rust-common``
+===============
+
+The :ref:`ref-classes-rust-common` class is an internal class to the
+:ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
+intended to be used directly.
+
 .. _ref-classes-sanity:
 
-``sanity.bbclass``
-==================
+``sanity``
+==========
 
-The ``sanity`` class checks to see if prerequisite software is present
+The :ref:`ref-classes-sanity` class checks to see if prerequisite software is present
 on the host system so that users can be notified of potential problems
 that might affect their build. The class also performs basic user
 configuration checks from the ``local.conf`` configuration file to
@@ -2479,29 +2678,29 @@ usually determines whether to include this class.
 
 .. _ref-classes-scons:
 
-``scons.bbclass``
-=================
+``scons``
+=========
 
-The ``scons`` class supports recipes that need to build software that
-uses the SCons build system. You can use the
-:term:`EXTRA_OESCONS` variable to specify
-additional configuration options you want to pass SCons command line.
+The :ref:`ref-classes-scons` class supports recipes that need to build software
+that uses the SCons build system. You can use the :term:`EXTRA_OESCONS`
+variable to specify additional configuration options you want to pass SCons
+command line.
 
 .. _ref-classes-sdl:
 
-``sdl.bbclass``
-===============
+``sdl``
+=======
 
-The ``sdl`` class supports recipes that need to build software that uses
+The :ref:`ref-classes-sdl` class supports recipes that need to build software that uses
 the Simple DirectMedia Layer (SDL) library.
 
 .. _ref-classes-python_setuptools_build_meta:
 
-``python_setuptools_build_meta.bbclass``
-========================================
+``python_setuptools_build_meta``
+================================
 
-The ``python_setuptools_build_meta`` class enables building Python modules which
-declare the
+The :ref:`ref-classes-python_setuptools_build_meta` class enables building
+Python modules which declare the
 `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
 ``setuptools.build_meta`` ``build-backend`` in the ``[build-system]``
 section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
@@ -2509,21 +2708,22 @@ section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep
 Python modules built with ``setuptools.build_meta`` can be pure Python or
 include ``C`` or ``Rust`` extensions).
 
-Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
+Internally this uses the :ref:`ref-classes-python_pep517` class.
 
 .. _ref-classes-setuptools3:
 
-``setuptools3.bbclass``
-=======================
+``setuptools3``
+===============
 
-The ``setuptools3`` class supports Python version 3.x extensions that
-use build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and
-have not migrated to the official ``pyproject.toml`` format). If your recipe
-uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
+The :ref:`ref-classes-setuptools3` class supports Python version 3.x extensions
+that use build systems based on ``setuptools`` (e.g. only have a ``setup.py``
+and have not migrated to the official ``pyproject.toml`` format). If your recipe
+uses these build systems, the recipe needs to inherit the
+:ref:`ref-classes-setuptools3` class.
 
    .. note::
 
-      The ``setuptools3`` class ``do_compile()`` task now calls
+      The :ref:`ref-classes-setuptools3` class :ref:`ref-tasks-compile` task now calls
       ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
       (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
 
@@ -2534,69 +2734,61 @@ uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
 
    .. note::
 
-     The ``setuptools3`` class ``do_install()`` task now installs the ``wheel``
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
 
-``setuptools3_legacy.bbclass``
-==============================
+``setuptools3_legacy``
+======================
 
-The ``setuptools3_legacy`` class supports Python version 3.x extensions that use
-build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and have
-not migrated to the official ``pyproject.toml`` format). Unlike
-``setuptools3.bbclass``, this uses the traditional ``setup.py`` ``build`` and
-``install`` commands and not wheels. This use of ``setuptools`` like this is
-`deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`_
+The :ref:`ref-classes-setuptools3_legacy` class supports
+Python version 3.x extensions that use build systems based on ``setuptools``
+(e.g. only have a ``setup.py`` and have not migrated to the official
+``pyproject.toml`` format). Unlike :ref:`ref-classes-setuptools3`,
+this uses the traditional ``setup.py`` ``build`` and ``install`` commands and
+not wheels. This use of ``setuptools`` like this is
+`deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`__
 but still relatively common.
 
 .. _ref-classes-setuptools3-base:
 
-``setuptools3-base.bbclass``
-============================
-
-The ``setuptools3-base`` class provides a reusable base for other classes
-that support building Python version 3.x extensions. If you need
-functionality that is not provided by the :ref:`setuptools3 <ref-classes-setuptools3>` class, you may
-want to ``inherit setuptools3-base``. Some recipes do not need the tasks
-in the :ref:`setuptools3 <ref-classes-setuptools3>` class and inherit this class instead.
-
-.. _ref-classes-sign_rpm:
-
-``sign_rpm.bbclass``
+``setuptools3-base``
 ====================
 
-The ``sign_rpm`` class supports generating signed RPM packages.
+The :ref:`ref-classes-setuptools3-base` class provides a reusable base for
+other classes that support building Python version 3.x extensions. If you need
+functionality that is not provided by the :ref:`ref-classes-setuptools3` class,
+you may want to ``inherit setuptools3-base``. Some recipes do not need the tasks
+in the :ref:`ref-classes-setuptools3` class and inherit this class instead.
 
-.. _ref-classes-sip:
+.. _ref-classes-sign_rpm:
 
-``sip.bbclass``
-===============
+``sign_rpm``
+============
 
-The ``sip`` class supports recipes that build or package SIP-based
-Python bindings.
+The :ref:`ref-classes-sign_rpm` class supports generating signed RPM packages.
 
 .. _ref-classes-siteconfig:
 
-``siteconfig.bbclass``
-======================
+``siteconfig``
+==============
 
-The ``siteconfig`` class provides functionality for handling site
-configuration. The class is used by the
-:ref:`autotools <ref-classes-autotools>` class to accelerate the
-:ref:`ref-tasks-configure` task.
+The :ref:`ref-classes-siteconfig` class provides functionality for handling site
+configuration. The class is used by the :ref:`ref-classes-autotools` class to
+accelerate the :ref:`ref-tasks-configure` task.
 
 .. _ref-classes-siteinfo:
 
-``siteinfo.bbclass``
-====================
+``siteinfo``
+============
 
-The ``siteinfo`` class provides information about the targets that might
-be needed by other classes or recipes.
+The :ref:`ref-classes-siteinfo` class provides information about the targets
+that might be needed by other classes or recipes.
 
 As an example, consider Autotools, which can require tests that must
 execute on the target hardware. Since this is not possible in general
@@ -2613,12 +2805,12 @@ The class also provides variables like :term:`SITEINFO_ENDIANNESS` and
 
 .. _ref-classes-sstate:
 
-``sstate.bbclass``
-==================
+``sstate``
+==========
 
-The ``sstate`` class provides support for Shared State (sstate). By
-default, the class is enabled through the
-:term:`INHERIT_DISTRO` variable's default value.
+The :ref:`ref-classes-sstate` class provides support for Shared State (sstate).
+By default, the class is enabled through the :term:`INHERIT_DISTRO` variable's
+default value.
 
 For more information on sstate, see the
 ":ref:`overview-manual/concepts:shared state cache`"
@@ -2626,10 +2818,10 @@ section in the Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-staging:
 
-``staging.bbclass``
-===================
+``staging``
+===========
 
-The ``staging`` class installs files into individual recipe work
+The :ref:`ref-classes-staging` class installs files into individual recipe work
 directories for sysroots. The class contains the following key tasks:
 
 -  The :ref:`ref-tasks-populate_sysroot` task,
@@ -2642,14 +2834,14 @@ directories for sysroots. The class contains the following key tasks:
    installs the files into the individual recipe work directories (i.e.
    :term:`WORKDIR`).
 
-The code in the ``staging`` class is complex and basically works in two
-stages:
+The code in the :ref:`ref-classes-staging` class is complex and basically works
+in two stages:
 
 -  *Stage One:* The first stage addresses recipes that have files they
    want to share with other recipes that have dependencies on the
    originating recipe. Normally these dependencies are installed through
    the :ref:`ref-tasks-install` task into
-   ``${``\ :term:`D`\ ``}``. The ``do_populate_sysroot`` task
+   ``${``\ :term:`D`\ ``}``. The :ref:`ref-tasks-populate_sysroot` task
    copies a subset of these files into ``${SYSROOT_DESTDIR}``. This
    subset of files is controlled by the
    :term:`SYSROOT_DIRS`,
@@ -2716,8 +2908,7 @@ stages:
    dependencies traversed or installed. The same sstate dependency code
    is used so that builds should be identical regardless of whether
    sstate was used or not. For a closer look, see the
-   ``setscene_depvalid()`` function in the
-   :ref:`sstate <ref-classes-sstate>` class.
+   ``setscene_depvalid()`` function in the :ref:`ref-classes-sstate` class.
 
    The build system is careful to maintain manifests of the files it
    installs so that any given dependency can be installed as needed. The
@@ -2726,11 +2917,11 @@ stages:
 
 .. _ref-classes-syslinux:
 
-``syslinux.bbclass``
-====================
+``syslinux``
+============
 
-The ``syslinux`` class provides syslinux-specific functions for building
-bootable images.
+The :ref:`ref-classes-syslinux` class provides syslinux-specific functions for
+building bootable images.
 
 The class supports the following variables:
 
@@ -2769,11 +2960,11 @@ The class supports the following variables:
 
 .. _ref-classes-systemd:
 
-``systemd.bbclass``
-===================
+``systemd``
+===========
 
-The ``systemd`` class provides support for recipes that install systemd
-unit files.
+The :ref:`ref-classes-systemd` class provides support for recipes that install
+systemd unit files.
 
 The functionality for this class is disabled unless you have "systemd"
 in :term:`DISTRO_FEATURES`.
@@ -2804,21 +2995,21 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-systemd-boot:
 
-``systemd-boot.bbclass``
-========================
+``systemd-boot``
+================
 
-The ``systemd-boot`` class provides functions specific to the
+The :ref:`ref-classes-systemd-boot` class provides functions specific to the
 systemd-boot bootloader for building bootable images. This is an
 internal class and is not intended to be used directly.
 
 .. note::
 
-   The ``systemd-boot`` class is a result from merging the ``gummiboot`` class
+   The :ref:`ref-classes-systemd-boot` class is a result from merging the ``gummiboot`` class
    used in previous Yocto Project releases with the ``systemd`` project.
 
-Set the :term:`EFI_PROVIDER` variable to
-"systemd-boot" to use this class. Doing so creates a standalone EFI
-bootloader that is not dependent on systemd.
+Set the :term:`EFI_PROVIDER` variable to ":ref:`ref-classes-systemd-boot`" to
+use this class. Doing so creates a standalone EFI bootloader that is not
+dependent on systemd.
 
 For information on more variables used and supported in this class, see
 the :term:`SYSTEMD_BOOT_CFG`,
@@ -2831,48 +3022,45 @@ for more information.
 
 .. _ref-classes-terminal:
 
-``terminal.bbclass``
-====================
+``terminal``
+============
 
-The ``terminal`` class provides support for starting a terminal session.
-The :term:`OE_TERMINAL` variable controls which
-terminal emulator is used for the session.
+The :ref:`ref-classes-terminal` class provides support for starting a terminal
+session.  The :term:`OE_TERMINAL` variable controls which terminal emulator is
+used for the session.
 
-Other classes use the ``terminal`` class anywhere a separate terminal
-session needs to be started. For example, the
-:ref:`patch <ref-classes-patch>` class assuming
-:term:`PATCHRESOLVE` is set to "user", the
-:ref:`cml1 <ref-classes-cml1>` class, and the
-:ref:`devshell <ref-classes-devshell>` class all use the ``terminal``
-class.
+Other classes use the :ref:`ref-classes-terminal` class anywhere a separate
+terminal session needs to be started. For example, the :ref:`ref-classes-patch`
+class assuming :term:`PATCHRESOLVE` is set to "user", the
+:ref:`ref-classes-cml1` class, and the :ref:`ref-classes-devshell` class all
+use the :ref:`ref-classes-terminal` class.
 
-.. _ref-classes-testimage*:
+.. _ref-classes-testimage:
 
-``testimage*.bbclass``
-======================
+``testimage``
+=============
 
-The ``testimage*`` classes support running automated tests against
+The :ref:`ref-classes-testimage` class supports running automated tests against
 images using QEMU and on actual hardware. The classes handle loading the
 tests and starting the image. To use the classes, you need to perform
 steps to set up the environment.
 
-.. note::
+To enable this class, add the following to your configuration::
 
-   Best practices include using :term:`IMAGE_CLASSES` rather than
-   :term:`INHERIT` to inherit the ``testimage`` class for automated image
-   testing.
+   IMAGE_CLASSES += "testimage"
 
 The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.
 
-The ``testimage.bbclass`` runs tests on an image when called using the
+The :ref:`ref-classes-testimage` class runs tests on an image when called using the
 following::
 
    $ bitbake -c testimage image
 
-The ``testimage-auto`` class
-runs tests on an image after the image is constructed (i.e.
-:term:`TESTIMAGE_AUTO` must be set to "1").
+Alternatively, if you wish to have tests automatically run for each image
+after it is built, you can set :term:`TESTIMAGE_AUTO`::
+
+   TESTIMAGE_AUTO = "1"
 
 For information on how to enable, run, and create new tests, see the
 ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
@@ -2880,11 +3068,11 @@ section in the Yocto Project Development Tasks Manual.
 
 .. _ref-classes-testsdk:
 
-``testsdk.bbclass``
-===================
+``testsdk``
+===========
 
 This class supports running automated tests against software development
-kits (SDKs). The ``testsdk`` class runs tests on an SDK when called
+kits (SDKs). The :ref:`ref-classes-testsdk` class runs tests on an SDK when called
 using the following::
 
    $ bitbake -c testsdk image
@@ -2892,13 +3080,13 @@ using the following::
 .. note::
 
    Best practices include using :term:`IMAGE_CLASSES` rather than
-   :term:`INHERIT` to inherit the ``testsdk`` class for automated SDK
+   :term:`INHERIT` to inherit the :ref:`ref-classes-testsdk` class for automated SDK
    testing.
 
 .. _ref-classes-texinfo:
 
-``texinfo.bbclass``
-===================
+``texinfo``
+===========
 
 This class should be inherited by recipes whose upstream packages invoke
 the ``texinfo`` utilities at build-time. Native and cross recipes are
@@ -2915,10 +3103,10 @@ host system.
 
 .. _ref-classes-toaster:
 
-``toaster.bbclass``
-===================
+``toaster``
+===========
 
-The ``toaster`` class collects information about packages and images and
+The :ref:`ref-classes-toaster` class collects information about packages and images and
 sends them as events that the BitBake user interface can receive. The
 class is enabled when the Toaster user interface is running.
 
@@ -2926,18 +3114,18 @@ This class is not intended to be used directly.
 
 .. _ref-classes-toolchain-scripts:
 
-``toolchain-scripts.bbclass``
-=============================
+``toolchain-scripts``
+=====================
 
-The ``toolchain-scripts`` class provides the scripts used for setting up
+The :ref:`ref-classes-toolchain-scripts` class provides the scripts used for setting up
 the environment for installed SDKs.
 
 .. _ref-classes-typecheck:
 
-``typecheck.bbclass``
-=====================
+``typecheck``
+=============
 
-The ``typecheck`` class provides support for validating the values of
+The :ref:`ref-classes-typecheck` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
 variable using the "type" varflag. Here is an example::
@@ -2946,10 +3134,10 @@ variable using the "type" varflag. Here is an example::
 
 .. _ref-classes-uboot-config:
 
-``uboot-config.bbclass``
-========================
+``uboot-config``
+================
 
-The ``uboot-config`` class provides support for U-Boot configuration for
+The :ref:`ref-classes-uboot-config` class provides support for U-Boot configuration for
 a machine. Specify the machine in your recipe as follows::
 
    UBOOT_CONFIG ??= <default>
@@ -2962,10 +3150,47 @@ You can also specify the machine using this method::
 See the :term:`UBOOT_CONFIG` and :term:`UBOOT_MACHINE` variables for additional
 information.
 
+.. _ref-classes-uboot-sign:
+
+``uboot-sign``
+==============
+
+The :ref:`ref-classes-uboot-sign` class provides support for U-Boot verified boot.
+It is intended to be inherited from U-Boot recipes.
+
+Here are variables used by this class:
+
+-  :term:`SPL_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
+   building the FIT image.
+-  :term:`SPL_SIGN_ENABLE`: enable signing the FIT image.
+-  :term:`SPL_SIGN_KEYDIR`: directory containing the signing keys.
+-  :term:`SPL_SIGN_KEYNAME`: base filename of the signing keys.
+-  :term:`UBOOT_FIT_DESC`: description string encoded into the FIT image.
+-  :term:`UBOOT_FIT_GENERATE_KEYS`: generate the keys if they don't exist yet.
+-  :term:`UBOOT_FIT_HASH_ALG`: hash algorithm for the FIT image.
+-  :term:`UBOOT_FIT_KEY_GENRSA_ARGS`: ``openssl genrsa`` arguments.
+-  :term:`UBOOT_FIT_KEY_REQ_ARGS`: ``openssl req`` arguments.
+-  :term:`UBOOT_FIT_SIGN_ALG`: signature algorithm for the FIT image.
+-  :term:`UBOOT_FIT_SIGN_NUMBITS`: size of the private key for FIT image
+   signing.
+-  :term:`UBOOT_FIT_KEY_SIGN_PKCS`: algorithm for the public key certificate
+   for FIT image signing.
+-  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT image.
+-  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` when
+   rebuilding the FIT image containing the kernel.
+
+See U-Boot's documentation for details about `verified boot
+<https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verified-boot.txt>`__
+and the `signature process
+<https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/signature.txt>`__.
+
+See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
+imitates.
+
 .. _ref-classes-uninative:
 
-``uninative.bbclass``
-=====================
+``uninative``
+=============
 
 Attempts to isolate the build system from the host distribution's C
 library in order to make re-use of native shared state artifacts across
@@ -2980,21 +3205,21 @@ yourself, publish the resulting tarball (e.g. via HTTP) and set
 ``UNINATIVE_URL`` and ``UNINATIVE_CHECKSUM`` appropriately. For an
 example, see the ``meta/conf/distro/include/yocto-uninative.inc``.
 
-The ``uninative`` class is also used unconditionally by the extensible
+The :ref:`ref-classes-uninative` class is also used unconditionally by the extensible
 SDK. When building the extensible SDK, ``uninative-tarball`` is built
 and the resulting tarball is included within the SDK.
 
 .. _ref-classes-update-alternatives:
 
-``update-alternatives.bbclass``
-===============================
+``update-alternatives``
+=======================
 
-The ``update-alternatives`` class helps the alternatives system when
+The :ref:`ref-classes-update-alternatives` class helps the alternatives system when
 multiple sources provide the same command. This situation occurs when
 several programs that have the same or similar function are installed
 with the same name. For example, the ``ar`` command is available from
 the ``busybox``, ``binutils`` and ``elfutils`` packages. The
-``update-alternatives`` class handles renaming the binaries so that
+:ref:`ref-classes-update-alternatives` class handles renaming the binaries so that
 multiple packages can be installed without conflicts. The ``ar`` command
 still works regardless of which packages are installed or subsequently
 removed. The class renames the conflicting binary in each package and
@@ -3014,7 +3239,7 @@ To use this class, you need to define a number of variables:
 These variables list alternative commands needed by a package, provide
 pathnames for links, default links for targets, and so forth. For
 details on how to use this class, see the comments in the
-:yocto_git:`update-alternatives.bbclass </poky/tree/meta/classes/update-alternatives.bbclass>`
+:yocto_git:`update-alternatives.bbclass </poky/tree/meta/classes-recipe/update-alternatives.bbclass>`
 file.
 
 .. note::
@@ -3024,10 +3249,10 @@ file.
 
 .. _ref-classes-update-rc.d:
 
-``update-rc.d.bbclass``
-=======================
+``update-rc.d``
+===============
 
-The ``update-rc.d`` class uses ``update-rc.d`` to safely install an
+The :ref:`ref-classes-update-rc.d` class uses ``update-rc.d`` to safely install an
 initialization script on behalf of the package. The OpenEmbedded build
 system takes care of details such as making sure the script is stopped
 before a package is removed and started when the package is installed.
@@ -3038,10 +3263,10 @@ for details.
 
 .. _ref-classes-useradd:
 
-``useradd*.bbclass``
-====================
+``useradd*``
+============
 
-The ``useradd*`` classes support the addition of users or groups for
+The :ref:`useradd* <ref-classes-useradd>` classes support the addition of users or groups for
 usage by the package on the target. For example, if you have packages
 that contain system services that should be run under their own user or
 group, you can use these classes to enable creation of the user or
@@ -3050,16 +3275,16 @@ group. The :oe_git:`meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 recipe in the :term:`Source Directory` provides a simple
 example that shows how to add three users and groups to two packages.
 
-The ``useradd_base`` class provides basic functionality for user or
+The :ref:`useradd_base <ref-classes-useradd>` class provides basic functionality for user or
 groups settings.
 
-The ``useradd*`` classes support the
+The :ref:`useradd* <ref-classes-useradd>` classes support the
 :term:`USERADD_PACKAGES`,
 :term:`USERADD_PARAM`,
 :term:`GROUPADD_PARAM`, and
 :term:`GROUPMEMS_PARAM` variables.
 
-The ``useradd-staticids`` class supports the addition of users or groups
+The :ref:`useradd-staticids <ref-classes-useradd>` class supports the addition of users or groups
 that have static user identification (``uid``) and group identification
 (``gid``) values.
 
@@ -3075,17 +3300,15 @@ set static values, the OpenEmbedded build system looks in
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
 
-   You do not use the ``useradd-staticids`` class directly. You either enable
+   You do not use the :ref:`useradd-staticids <ref-classes-useradd>` class directly. You either enable
    or disable the class by setting the :term:`USERADDEXTENSION` variable. If you
    enable or disable the class in a configured system, :term:`TMPDIR` might
    contain incorrect ``uid`` and ``gid`` values. Deleting the :term:`TMPDIR`
@@ -3093,43 +3316,42 @@ additional information.
 
 .. _ref-classes-utility-tasks:
 
-``utility-tasks.bbclass``
-=========================
+``utility-tasks``
+=================
 
-The ``utility-tasks`` class provides support for various "utility" type
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
 
-``utils.bbclass``
-=================
+``utils``
+=========
 
-The ``utils`` class provides some useful Python functions that are
+The :ref:`ref-classes-utils` class provides some useful Python functions that are
 typically used in inline Python expressions (e.g. ``${@...}``). One
 example use is for ``bb.utils.contains()``.
 
 This class is enabled by default because it is inherited by the
-:ref:`base <ref-classes-base>` class.
+:ref:`ref-classes-base` class.
 
 .. _ref-classes-vala:
 
-``vala.bbclass``
-================
+``vala``
+========
 
-The ``vala`` class supports recipes that need to build software written
+The :ref:`ref-classes-vala` class supports recipes that need to build software written
 using the Vala programming language.
 
 .. _ref-classes-waf:
 
-``waf.bbclass``
-===============
+``waf``
+=======
 
-The ``waf`` class supports recipes that need to build software that uses
+The :ref:`ref-classes-waf` class supports recipes that need to build software that uses
 the Waf build system. You can use the
 :term:`EXTRA_OECONF` or
 :term:`PACKAGECONFIG_CONFARGS` variables
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index bf803a3db1..daa28308ce 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -163,7 +163,7 @@ consists of the following pieces:
    an ARM target, did the build produce ARM binaries. If, for example,
    the build produced PPC binaries then there is a problem.
 
--  :ref:`ref-classes-testimage*`: This class
+-  :ref:`ref-classes-testimage`: This class
    performs runtime testing of images after they are built. The tests
    are usually used with :doc:`QEMU </dev-manual/qemu>`
    to boot the images and check the combined runtime result boot
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5163abf559..e8028b328b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2101,6 +2101,18 @@ system and gives an overview of their function and contents.
       For information on policies and on how to use this variable, see the
       comments in the ``meta/classes/compress_doc.bbclass`` file.
 
+   :term:`DT_FILES_PATH`
+      When compiling out-of-tree device tree sources using a recipe that
+      inherits the :ref:`ref-classes-devicetree` class, this variable specifies
+      the path to the directory containing dts files to build.
+
+      Defaults to the :term:`S` directory.
+
+   :term:`DT_PADDING_SIZE`
+      When inheriting the :ref:`ref-classes-devicetree` class, this variable
+      specifies the size of padding appended to the device tree blob, used as
+      extra space typically for additional properties during boot.
+
    :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
       ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the
@@ -2860,6 +2872,73 @@ system and gives an overview of their function and contents.
 
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 
+   :term:`GO_IMPORT`
+      When inheriting the :ref:`ref-classes-go` class, this mandatory variable
+      sets the import path for the Go package that will be created for the code
+      to build. If you have a ``go.mod`` file in the source directory, this
+      typically matches the path in the ``module`` line in this file.
+
+      Other Go programs importing this package will use this path.
+
+      Here is an example setting from the
+      :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+      recipe::
+
+          GO_IMPORT = "golang.org/x/example"
+
+   :term:`GO_INSTALL`
+      When inheriting the :ref:`ref-classes-go` class, this optional variable
+      specifies which packages in the sources should be compiled and
+      installed in the Go build space by the
+      `go install <https://go.dev/ref/mod#go-install>`__ command.
+
+      Here is an example setting from the
+      :oe_git:`crucible </meta-openembedded/tree/meta-oe/recipes-support/crucible/>`
+      recipe::
+
+         GO_INSTALL = "\
+             ${GO_IMPORT}/cmd/crucible \
+             ${GO_IMPORT}/cmd/habtool \
+         "
+
+      By default, :term:`GO_INSTALL` is defined as::
+
+         GO_INSTALL ?= "${GO_IMPORT}/..."
+
+      The ``...`` wildcard means that it will catch all
+      packages found in the sources.
+
+      See the :term:`GO_INSTALL_FILTEROUT` variable for
+      filtering out unwanted packages from the ones
+      found from the :term:`GO_INSTALL` value.
+
+   :term:`GO_INSTALL_FILTEROUT`
+      When using the Go "vendor" mechanism to bring in dependencies for a Go
+      package, the default :term:`GO_INSTALL` setting, which uses the ``...``
+      wildcard, will include the vendored packages in the build, which produces
+      incorrect results.
+
+      There are also some Go packages that are structured poorly, so that the
+      ``...`` wildcard results in building example or test code that should not
+      be included in the build, or could fail to build.
+
+      This optional variable allows for filtering out a subset of the sources.
+      It defaults to excluding everything under the ``vendor`` subdirectory
+      under package's main directory. This is the normal location for vendored
+      packages, but it can be overridden by a recipe to filter out other
+      subdirectories if needed.
+
+   :term:`GO_WORKDIR`
+      When using Go Modules, the current working directory must be the directory
+      containing the ``go.mod`` file, or one of its subdirectories. When the
+      ``go`` tool is used, it will automatically look for the ``go.mod`` file
+      in the Go working directory or in any parent directory, but not in
+      subdirectories.
+
+      When using the :ref:`ref-classes-go-mod` class to use Go modules,
+      the optional :term:`GO_WORKDIR` variable, defaulting to the value
+      of :term:`GO_IMPORT`, allows to specify a different Go working directory.
+
    :term:`GROUPADD_PARAM`
       When inheriting the :ref:`useradd <ref-classes-useradd>` class,
       this variable specifies for a package what parameters should be
@@ -3128,17 +3207,23 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`/ref-manual/kickstart`" chapter.
 
-   :term:`IMAGE_CLASSES`
-      A list of classes that all images should inherit. You typically use
-      this variable to specify the list of classes that register the
-      different types of images the OpenEmbedded build system creates.
+   :term:`IMAGE_BUILDINFO_FILE`
+      When using the :ref:`ref-classes-image-buildinfo` class,
+      specifies the file in the image to write the build information into. The
+      default value is "``${sysconfdir}/buildinfo``".
 
-      The default value for :term:`IMAGE_CLASSES` is ``image_types``. You can
-      set this variable in your ``local.conf`` or in a distribution
-      configuration file.
+   :term:`IMAGE_BUILDINFO_VARS`
+      When using the :ref:`ref-classes-image-buildinfo` class,
+      specifies the list of variables to include in the `Build Configuration`
+      section of the output file (as a space-separated list). Defaults to
+      ":term:`DISTRO` :term:`DISTRO_VERSION`".
 
-      For more information, see ``meta/classes/image_types.bbclass`` in the
-      :term:`Source Directory`.
+   :term:`IMAGE_CLASSES`
+      A list of classes that all images should inherit. This is typically used
+      to enable functionality across all image recipes.
+
+      Classes specified in :term:`IMAGE_CLASSES` must be located in the
+      ``classes-recipe/`` or ``classes/`` subdirectories.
 
    :term:`IMAGE_CMD`
       Specifies the command to create the image file for a specific image
@@ -4115,9 +4200,18 @@ system and gives an overview of their function and contents.
          There is legacy support for specifying the full path to the device
          tree. However, providing just the ``.dtb`` file is preferred.
 
-      In order to use this variable, the
-      :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
-      be inherited.
+      In order to use this variable, the :ref:`ref-classes-kernel-devicetree`
+      class must be inherited.
+
+   :term:`KERNEL_DEVICETREE_BUNDLE`
+      When set to "1", this variable allows to bundle the Linux kernel
+      and the Device Tree Binary together in a single file.
+
+      This feature is currently only supported on the "arm" (32 bit)
+      architecture.
+
+      This variable is set to "0" by default by the
+      :ref:`ref-classes-kernel-devicetree` class.
 
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
@@ -4142,10 +4236,25 @@ system and gives an overview of their function and contents.
 
          KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
-      The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value::
+      See :term:`KERNEL_ARTIFACT_NAME` for additional information.
 
-         KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+
+   :term:`KERNEL_DTBDEST`
+      This variable, used by the :ref:`ref-classes-kernel-devicetree`
+      class, allows to change the installation directory of the DTB
+      (Device Tree Binary) files.
+
+      It is set by default to "${KERNEL_IMAGEDEST}" by the
+      :ref:`ref-classes-kernel` class.
+
+   :term:`KERNEL_DTBVENDORED`
+      This variable, used by the :ref:`ref-classes-kernel-devicetree`,
+      allows to ignore vendor subdirectories when installing DTB
+      (Device Tree Binary) files, when it is set to "false".
+
+      To keep vendor subdirectories, set this variable to "true".
+
+      It is set by default to "false" by the :ref:`ref-classes-kernel` class.
 
    :term:`KERNEL_DTC_FLAGS`
       Specifies the ``dtc`` flags that are passed to the Linux kernel build
@@ -4260,9 +4369,12 @@ system and gives an overview of their function and contents.
       when building the kernel and is passed to ``make`` as the target to
       build.
 
-      If you want to build an alternate kernel image type in addition to that
-      specified by :term:`KERNEL_IMAGETYPE`, use the :term:`KERNEL_ALT_IMAGETYPE`
-      variable.
+      To build additional kernel image types, use :term:`KERNEL_IMAGETYPES`.
+
+   :term:`KERNEL_IMAGETYPES`
+      Lists additional types of kernel images to build for a device in addition
+      to image type specified in :term:`KERNEL_IMAGETYPE`. Usually set by the
+      machine configuration files.
 
    :term:`KERNEL_MODULE_AUTOLOAD`
       Lists kernel modules that need to be auto-loaded during boot.
@@ -4300,6 +4412,14 @@ system and gives an overview of their function and contents.
       provide those module configurations, see the
       :term:`module_conf_* <module_conf>` variable.
 
+   :term:`KERNEL_PACKAGE_NAME`
+      Specifies the base name of the kernel packages, such as "kernel"
+      in the kernel packages such as "kernel-modules", "kernel-image" and
+      "kernel-dbg".
+
+      The default value for this variable is set to "kernel" by the
+      :ref:`ref-classes-kernel` class.
+
    :term:`KERNEL_PATH`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within
@@ -5142,6 +5262,16 @@ system and gives an overview of their function and contents.
       :term:`Source Directory` for details on how this class
       applies these additional sed command arguments.
 
+   :term:`OECMAKE_GENERATOR`
+      A variable for the :ref:`ref-classes-cmake` class, allowing to choose
+      which back-end will be generated by CMake to build an application.
+
+      By default, this variable is set to ``Ninja``, which is faster than GNU
+      make, but if building is broken with Ninja, a recipe can use this
+      variable to use GNU make instead::
+
+         OECMAKE_GENERATOR = "Unix Makefiles"
+
    :term:`OE_IMPORTS`
       An internal variable used to tell the OpenEmbedded build system what
       Python modules to import for every Python function run by the system.
@@ -7420,6 +7550,38 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
+   :term:`SPL_MKIMAGE_DTCOPTS`
+      Options for the device tree compiler passed to ``mkimage -D`` feature
+      while creating a FIT image with the :ref:`ref-classes-uboot-sign`
+      class. If :term:`SPL_MKIMAGE_DTCOPTS` is not set then the
+      :ref:`ref-classes-uboot-sign` class will not pass the ``-D`` option
+      to ``mkimage``.
+
+      The default value is set to "" by the :ref:`ref-classes-uboot-config`
+      class.
+
+   :term:`SPL_SIGN_ENABLE`
+      Enable signing of the U-Boot FIT image. The default value is "0".
+      This variable is used by the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`SPL_SIGN_KEYDIR`
+      Location of the directory containing the RSA key and certificate used for
+      signing the U-Boot FIT image, used by the :ref:`ref-classes-uboot-sign`
+      class.
+
+   :term:`SPL_SIGN_KEYNAME`
+      The name of keys used by the :ref:`ref-classes-kernel-fitimage` class
+      for signing U-Boot FIT image stored in the :term:`SPL_SIGN_KEYDIR`
+      directory. If we have for example a ``dev.key`` key and a ``dev.crt``
+      certificate stored in the :term:`SPL_SIGN_KEYDIR` directory, you will 
+      have to set :term:`SPL_SIGN_KEYNAME` to ``dev``.
+
+   :term:`SPLASH`
+      This variable, used by the :ref:`ref-classes-image` class, allows
+      to choose splashscreen applications. Set it to the names of packages
+      for such applications to use. This variable is set by default to
+      ``psplash``.
+
    :term:`SPLASH_IMAGES`
       This variable, used by the ``psplash`` recipe, allows to customize
       the default splashscreen image.
@@ -8515,7 +8677,7 @@ system and gives an overview of their function and contents.
       on enabling, running, and writing these tests, see the
       ":ref:`dev-manual/runtime-testing:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual and the
-      ":ref:`ref-classes-testimage*`" section.
+      ":ref:`ref-classes-testimage`" section.
 
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
@@ -8799,6 +8961,64 @@ system and gives an overview of their function and contents.
       creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
+   :term:`UBOOT_FIT_DESC`
+      Specifies the description string encoded into a U-Boot fitImage. The default
+      value is set by the :ref:`ref-classes-uboot-sign` class as follows::
+
+         UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
+
+   :term:`UBOOT_FIT_GENERATE_KEYS`
+      Decides whether to generate the keys for signing the U-Boot fitImage if
+      they don't already exist. The keys are created in :term:`SPL_SIGN_KEYDIR`.
+      The default value is "0".
+
+      Enable this as follows::
+
+         UBOOT_FIT_GENERATE_KEYS = "1"
+
+      This variable is used in the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_HASH_ALG`
+      Specifies the hash algorithm used in creating the U-Boot FIT Image.
+      It is set by default to ``sha256`` by the :ref:`ref-classes-uboot-sign`
+      class.
+
+   :term:`UBOOT_FIT_KEY_GENRSA_ARGS`
+      Arguments to ``openssl genrsa`` for generating a RSA private key for
+      signing the U-Boot FIT image. The default value of this variable
+      is set to "-F4" by the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_KEY_REQ_ARGS`
+      Arguments to ``openssl req`` for generating a certificate for signing
+      the U-Boot FIT image. The default value is "-batch -new" by the
+      :ref:`ref-classes-uboot-sign` class, "batch" for
+      non interactive mode and "new" for generating new keys.
+
+   :term:`UBOOT_FIT_KEY_SIGN_PKCS`
+      Format for the public key certificate used for signing the U-Boot FIT
+      image. The default value is set to "x509" by the
+      :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_SIGN_ALG`
+      Specifies the signature algorithm used in creating the U-Boot FIT Image.
+      This variable is set by default to "rsa2048" by the
+      :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FIT_SIGN_NUMBITS`
+      Size of the private key used in signing the U-Boot FIT image, in number
+      of bits. The default value for this variable is set to "2048"
+      by the :ref:`ref-classes-uboot-sign` class.
+
+   :term:`UBOOT_FITIMAGE_ENABLE`
+      This variable allows to generate a FIT image for U-Boot, which is one
+      of the ways to implement a verified boot process.
+
+      Its default value is "0", so set it to "1" to enable this functionality::
+
+         UBOOT_FITIMAGE_ENABLE = "1"
+
+      See the :ref:`ref-classes-uboot-sign` class for details.
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 2180eb939c..8cfd6be87d 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -131,7 +131,7 @@ the following types of tests:
 
       $ bitbake image -c testimage
 
-   The tests utilize the :ref:`testimage* <ref-classes-testimage*>`
+   The tests utilize the :ref:`testimage* <ref-classes-testimage>`
    classes and the :ref:`ref-tasks-testimage` task.
 
 -  *Layer Testing:* The Autobuilder has the possibility to test whether
-- 
2.34.1


