Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890CBC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:35:11 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.5289.1665650104666717073
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 01:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z1Jrt0cC;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1F764100018;
	Thu, 13 Oct 2022 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665650102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cjIccCniSYg6pZkmRSinidMaERkOMWyyTqNUfC/z6xY=;
	b=Z1Jrt0cC+ykFD8dx332qT/63Bv0MMrjv9ErtCoV9U9vReT32wEz8CHngA0xPE32K/5CSq9
	0oTCEbZMNXkEUyA3g+bivwKt2ZTgrXHbO2JGN0g5WqgELyiO9XrPjHSdtkyeRq6gqmJeoC
	9LZQyngFsPJq3C7Ju3Ol9ZVCj90NlBi8ADdh7F0WLCneZHu6CQZZc9L5fl/zQqidRh4FuQ
	Xe38PFVgewPSUMrA8Ftu1KCOxr4Al30B5+GREIYCsgAFK9r3xakZ1q4EpYPyKUDx9hEOiI
	88c3gQajZQk2kr12u1jCmXcGD4zc8EK6nXVEo4KFX97TJTdH8RMAZZAs30gdbg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [RFC] ref-manual: classes.rst: add links to all references to a class
Date: Thu, 13 Oct 2022 10:34:55 +0200
Message-Id: <20221013083455.2962958-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Oct 2022 08:35:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3359

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

--

Doing this to consistently replace any reference to a class
by the corresponding link. This is a bit trivial within the declaration
of a class, but helps making sure that this rule applies everywhere.

This helps for example to rename or remove classes from the
documentation.

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14508

As this change is time consuming, submitting the first part of it
as an RFC, to double check there is an agreement on doing this.
---
 documentation/ref-manual/classes.rst | 108 +++++++++++++--------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 21b50f94bd..77697e6c38 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -37,7 +37,7 @@ information.
 ``allarch.bbclass``
 ===================
 
-The ``allarch`` class is inherited by recipes that do not produce
+The :ref:`allarch <ref-classes-allarch>` class is inherited by recipes that do not produce
 architecture-specific output. The class disables functionality that is
 normally needed for recipes that produce executable binaries (such as
 building the cross-compiler and a C library as pre-requisites, and
@@ -49,7 +49,7 @@ splitting out of debug symbols during packaging).
    produce packages that depend on tunings through use of the
    :term:`RDEPENDS` and
    :term:`TUNE_PKGARCH` variables, should never be
-   configured for all architectures using ``allarch``. This is the case
+   configured for all architectures using :ref:`allarch <ref-classes-allarch>`. This is the case
    even if the recipes do not produce architecture-specific output.
 
    Configuring such recipes for all architectures causes the
@@ -63,17 +63,17 @@ By default, all recipes inherit the :ref:`base <ref-classes-base>` and
 functionality needed for recipes that produce executable output. If your
 recipe, for example, only produces packages that contain configuration
 files, media files, or scripts (e.g. Python and Perl), then it should
-inherit the ``allarch`` class.
+inherit the :ref:`allarch <ref-classes-allarch>` class.
 
 .. _ref-classes-archiver:
 
 ``archiver.bbclass``
 ====================
 
-The ``archiver`` class supports releasing source code and other
+The :ref:`archiver <ref-classes-archiver>` class supports releasing source code and other
 materials with the binaries.
 
-For more details on the source archiver, see the
+For more details on the source :ref:`archiver <ref-classes-archiver>`, see the
 ":ref:`dev-manual/common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual. You can also see
 the :term:`ARCHIVER_MODE` variable for information
@@ -84,7 +84,7 @@ about the variable flags (varflags) that help control archive creation.
 ``autotools*.bbclass``
 ======================
 
-The ``autotools*`` classes support packages built with the
+The :ref:`autotools* <ref-classes-autotools>` classes support packages built with the
 `GNU Autotools <https://en.wikipedia.org/wiki/GNU_Autotools>`__.
 
 The ``autoconf``, ``automake``, and ``libtool`` packages bring
@@ -96,13 +96,13 @@ that emulates Autotools. For more information, see the
 ":ref:`dev-manual/common-tasks:autotooled package`" section
 in the Yocto Project Development Tasks Manual.
 
-By default, the ``autotools*`` classes use out-of-tree builds (i.e.
+By default, the :ref:`autotools* <ref-classes-autotools>` classes use out-of-tree builds (i.e.
 ``autotools.bbclass`` building with ``B != S``).
 
 If the software being built by a recipe does not support using
 out-of-tree builds, you should have the recipe inherit the
-``autotools-brokensep`` class. The ``autotools-brokensep`` class behaves
-the same as the ``autotools`` class but builds with :term:`B`
+:ref:`autotools-brokensep <ref-classes-autotools>` class. The :ref:`autotools-brokensep <ref-classes-autotools>` class behaves
+the same as the :ref:`autotools <ref-classes-autotools>` class but builds with :term:`B`
 == :term:`S`. This method is useful when out-of-tree build
 support is either not present or is broken.
 
@@ -112,7 +112,7 @@ support is either not present or is broken.
    all possible.
 
 It's useful to have some idea of how the tasks defined by the
-``autotools*`` classes work and what they do behind the scenes.
+:ref:`autotools* <ref-classes-autotools>` classes work and what they do behind the scenes.
 
 -  :ref:`ref-tasks-configure` --- regenerates the
    configure script (using ``autoreconf``) and then launches it with a
@@ -133,7 +133,7 @@ It's useful to have some idea of how the tasks defined by the
 ``base.bbclass``
 ================
 
-The ``base`` class is special in that every ``.bb`` file implicitly
+The :ref:`base <ref-classes-base>` class is special in that every ``.bb`` file implicitly
 inherits the class. This class contains definitions for standard basic
 tasks such as fetching, unpacking, configuring (empty by default),
 compiling (runs any ``Makefile`` present), installing (empty by default)
@@ -160,7 +160,7 @@ software that includes bash-completion data.
 ``bin_package.bbclass``
 =======================
 
-The ``bin_package`` class is a helper class for recipes that extract the
+The :ref:`bin_package <ref-classes-bin-package>` class is a helper class for recipes that extract the
 contents of a binary package (e.g. an RPM) and install those contents
 rather than building the binary from source. The binary package is
 extracted and new packages in the configured output package format are
@@ -187,7 +187,7 @@ example use for this class.
 ``binconfig.bbclass``
 =====================
 
-The ``binconfig`` class helps to correct paths in shell scripts.
+The :ref:`binconfig <ref-classes-binconfig>` class helps to correct paths in shell scripts.
 
 Before ``pkg-config`` had become widespread, libraries shipped shell
 scripts to give information about the libraries and include paths needed
@@ -219,7 +219,7 @@ the class.
 ``buildhistory.bbclass``
 ========================
 
-The ``buildhistory`` class records a history of build output metadata,
+The :ref:`buildhistory <ref-classes-buildhistory>` class records a history of build output metadata,
 which can be used to detect possible regressions as well as used for
 analysis of the build output. For more information on using Build
 History, see the
@@ -231,7 +231,7 @@ section in the Yocto Project Development Tasks Manual.
 ``buildstats.bbclass``
 ======================
 
-The ``buildstats`` class records performance statistics about each task
+The :ref:`buildstats <ref-classes-buildstats>` class records performance statistics about each task
 executed during the build (e.g. elapsed time, CPU usage, and I/O usage).
 
 When you use this class, the output goes into the
@@ -245,7 +245,7 @@ Collecting build statistics is enabled by default through the
 :term:`USER_CLASSES` variable from your
 ``local.conf`` file. Consequently, you do not have to do anything to
 enable the class. However, if you want to disable the class, simply
-remove "buildstats" from the :term:`USER_CLASSES` list.
+remove ":ref:`buildstats <ref-classes-buildstats>`" from the :term:`USER_CLASSES` list.
 
 .. _ref-classes-buildstats-summary:
 
@@ -261,7 +261,7 @@ sstate re-use. In order to function, this class requires the
 ``ccache.bbclass``
 ==================
 
-The ``ccache`` class enables the C/C++ Compiler Cache for the build.
+The :ref:`ccache <ref-classes-ccache>` class enables the C/C++ Compiler Cache for the build.
 This class is used to give a minor performance boost during the build.
 
 See https://ccache.samba.org/ for information on the C/C++ Compiler
@@ -278,9 +278,9 @@ this class is not recommended.
 ``chrpath.bbclass``
 ===================
 
-The ``chrpath`` class is a wrapper around the "chrpath" utility, which
-is used during the build process for ``nativesdk``, ``cross``, and
-``cross-canadian`` recipes to change ``RPATH`` records within binaries
+The :ref:`chrpath <ref-classes-chrpath>` class is a wrapper around the "chrpath" utility, which
+is used during the build process for ``nativesdk``, :ref:`cross <ref-classes-cross>`, and
+:ref:`cross-canadian <ref-classes-cross-canadian>` recipes to change ``RPATH`` records within binaries
 in order to make them relocatable.
 
 .. _ref-classes-cmake:
@@ -288,7 +288,7 @@ in order to make them relocatable.
 ``cmake.bbclass``
 =================
 
-The ``cmake`` class allows for recipes that need to build software using
+The ref:`cmake <ref-classes-cmake>` class allows for recipes that need to build software using
 the `CMake <https://cmake.org/overview/>`__ build system. You can use
 the :term:`EXTRA_OECMAKE` variable to specify
 additional configuration options to be passed using the ``cmake``
@@ -305,7 +305,7 @@ Modules during
 ``cml1.bbclass``
 ================
 
-The ``cml1`` class provides basic support for the Linux kernel style
+The :ref:`cml1 <ref-classes-cml1>` class provides basic support for the Linux kernel style
 build configuration system.
 
 .. _ref-classes-compress_doc:
@@ -323,8 +323,8 @@ but you can select an alternative mechanism by setting the
 ``copyleft_compliance.bbclass``
 ===============================
 
-The ``copyleft_compliance`` class preserves source code for the purposes
-of license compliance. This class is an alternative to the ``archiver``
+The :ref:`copyleft_compliance <ref-classes-copyleft_compliance>` class preserves source code for the purposes
+of license compliance. This class is an alternative to the :ref:`archiver <ref-classes-archiver>`
 class and is still used by some users even though it has been deprecated
 in favor of the :ref:`archiver <ref-classes-archiver>` class.
 
@@ -343,7 +343,7 @@ class and is not intended to be used directly.
 ``core-image.bbclass``
 ======================
 
-The ``core-image`` class provides common definitions for the
+The :ref:`core-image <ref-classes-core-image>` class provides common definitions for the
 ``core-image-*`` image recipes, such as support for additional
 :term:`IMAGE_FEATURES`.
 
@@ -352,7 +352,7 @@ The ``core-image`` class provides common definitions for the
 ``cpan*.bbclass``
 =================
 
-The ``cpan*`` classes support Perl modules.
+The :ref:`cpan* <ref-classes-cpan>` classes support Perl modules.
 
 Recipes for Perl modules are simple. These recipes usually only need to
 point to the source's archive and then inherit the proper class file.
@@ -365,7 +365,7 @@ authors used.
 -  Modules that use ``Build.PL``-based build system require using
    ``cpan_build.bbclass`` in their recipes.
 
-Both build methods inherit the ``cpan-base`` class for basic Perl
+Both build methods inherit the :ref:`cpan-base <ref-classes-cpan>` class for basic Perl
 support.
 
 .. _ref-classes-create-spdx:
@@ -373,7 +373,7 @@ support.
 ``create-spdx.bbclass``
 =======================
 
-The ``create-spdx`` class provides support for automatically creating
+The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
 SPDX SBoM documents based upon image and SDK contents.
 
 .. _ref-classes-cross:
@@ -381,7 +381,7 @@ SPDX SBoM documents based upon image and SDK contents.
 ``cross.bbclass``
 =================
 
-The ``cross`` class provides support for the recipes that build the
+The :ref:`cross <ref-classes-cross>` class provides support for the recipes that build the
 cross-compilation tools.
 
 .. _ref-classes-cross-canadian:
@@ -400,7 +400,7 @@ discussion on these cross-compilation tools.
 ``crosssdk.bbclass``
 ====================
 
-The ``crosssdk`` class provides support for the recipes that build the
+The :ref:`crosssdk <ref-classes-crosssdk>` class provides support for the recipes that build the
 cross-compilation tools used for building SDKs. See the
 ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
@@ -411,7 +411,7 @@ discussion on these cross-compilation tools.
 ``cve-check.bbclass``
 =====================
 
-The ``cve-check`` class looks for known CVEs (Common Vulnerabilities
+The :ref:`cve-check <ref-classes-cve-check>` class looks for known CVEs (Common Vulnerabilities
 and Exposures) while building an image. This class is meant to be
 inherited globally from a configuration file::
 
@@ -427,7 +427,7 @@ section in the Development Tasks Manual.
 ``debian.bbclass``
 ==================
 
-The ``debian`` class renames output packages so that they follow the
+The :ref:`debian <ref-classes-debian>` class renames output packages so that they follow the
 Debian naming policy (i.e. ``glibc`` becomes ``libc6`` and
 ``glibc-devel`` becomes ``libc6-dev``.) Renaming includes the library
 name and version as part of the package name.
@@ -442,7 +442,7 @@ naming scheme.
 ``deploy.bbclass``
 ==================
 
-The ``deploy`` class handles deploying files to the
+The :ref:`deploy <ref-classes-deploy>` class handles deploying files to the
 :term:`DEPLOY_DIR_IMAGE` directory. The main
 function of this class is to allow the deploy step to be accelerated by
 shared state. Recipes that inherit this class should define their own
@@ -458,17 +458,17 @@ staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 ``devshell.bbclass``
 ====================
 
-The ``devshell`` class adds the :ref:`ref-tasks-devshell` task. Distribution
+The :ref:`devshell <ref-classes-devshell>` class adds the :ref:`ref-tasks-devshell` task. Distribution
 policy dictates whether to include this class. See the ":ref:`dev-manual/common-tasks:using a development shell`"
 section in the Yocto Project Development Tasks Manual for more
-information about using ``devshell``.
+information about using :ref:`devshell <ref-classes-devshell>`.
 
 .. _ref-classes-devupstream:
 
 ``devupstream.bbclass``
 =======================
 
-The ``devupstream`` class uses
+The :ref:`devupstream <ref-classes-devupstream>` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
 tarball. Following is an example::
@@ -505,7 +505,7 @@ due to BitBake's automatic fetch dependencies (e.g.
 ``externalsrc.bbclass``
 =======================
 
-The ``externalsrc`` class supports building software from source code
+The :ref:`externalsrc <ref-classes-externalsrc>` class supports building software from source code
 that is external to the OpenEmbedded build system. Building software
 from an external source tree means that the build system's normal fetch,
 unpack, and patch process is not used.
@@ -513,7 +513,7 @@ unpack, and patch process is not used.
 By default, the OpenEmbedded build system uses the :term:`S`
 and :term:`B` variables to locate unpacked recipe source code
 and to build it, respectively. When your recipe inherits the
-``externalsrc`` class, you use the
+:ref:`externalsrc <ref-classes-externalsrc>` class, you use the
 :term:`EXTERNALSRC` and
 :term:`EXTERNALSRC_BUILD` variables to
 ultimately define :term:`S` and :term:`B`.
@@ -530,10 +530,10 @@ See these variables for more information:
 :term:`WORKDIR`, :term:`BPN`, and
 :term:`PV`,
 
-For more information on the ``externalsrc`` class, see the comments in
+For more information on the :ref:`externalsrc <ref-classes-externalsrc>` class, see the comments in
 ``meta/classes/externalsrc.bbclass`` in the :term:`Source Directory`.
 For information on how to use the
-``externalsrc`` class, see the
+:ref:`externalsrc <ref-classes-externalsrc>` class, see the
 ":ref:`dev-manual/common-tasks:building software from an external source`"
 section in the Yocto Project Development Tasks Manual.
 
@@ -542,7 +542,7 @@ section in the Yocto Project Development Tasks Manual.
 ``extrausers.bbclass``
 ======================
 
-The ``extrausers`` class allows additional user and group configuration
+The :ref:`extrausers <ref-classes-extrausers>` class allows additional user and group configuration
 to be applied at the image level. Inheriting this class either globally
 or from an image recipe allows additional user and group operations to
 be performed using the
@@ -604,7 +604,7 @@ Finally, here is an example that sets the root password::
 ``features_check.bbclass``
 =================================
 
-The ``features_check`` class allows individual recipes to check
+The :ref:`features_check <ref-classes-features_check>` class allows individual recipes to check
 for required and conflicting
 :term:`DISTRO_FEATURES`, :term:`MACHINE_FEATURES` or :term:`COMBINED_FEATURES`.
 
@@ -630,7 +630,7 @@ triggered.
 ``fontcache.bbclass``
 =====================
 
-The ``fontcache`` class generates the proper post-install and
+The :ref:`fontcache <ref-classes-fontcache>` class generates the proper post-install and
 post-remove (postinst and postrm) scriptlets for font packages. These
 scriptlets call ``fc-cache`` (part of ``Fontconfig``) to add the fonts
 to the font information cache. Since the cache files are
@@ -646,9 +646,9 @@ packages containing the fonts.
 ``fs-uuid.bbclass``
 ===================
 
-The ``fs-uuid`` class extracts UUID from
+The :ref:`fs-uuid <ref-classes-fs-uuid>` class extracts UUID from
 ``${``\ :term:`ROOTFS`\ ``}``, which must have been built
-by the time that this function gets called. The ``fs-uuid`` class only
+by the time that this function gets called. The :ref:`fs-uuid <ref-classes-fs-uuid>` class only
 works on ``ext`` file systems and depends on ``tune2fs``.
 
 .. _ref-classes-gconf:
@@ -656,7 +656,7 @@ works on ``ext`` file systems and depends on ``tune2fs``.
 ``gconf.bbclass``
 =================
 
-The ``gconf`` class provides common functionality for recipes that need
+The :ref:`gconf <ref-classes-gconf>` class provides common functionality for recipes that need
 to install GConf schemas. The schemas will be put into a separate
 package (``${``\ :term:`PN`\ ``}-gconf``) that is created
 automatically when this class is inherited. This package uses the
@@ -668,7 +668,7 @@ register and unregister the schemas in the target image.
 ``gettext.bbclass``
 ===================
 
-The ``gettext`` class provides support for building software that uses
+The :ref:`gettext <ref-classes-gettext>` class provides support for building software that uses
 the GNU ``gettext`` internationalization and localization system. All
 recipes building software that use ``gettext`` should inherit this
 class.
@@ -678,11 +678,11 @@ class.
 ``github-releases``
 ===================
 
-For recipes that fetch release tarballs from github, the ``github-releases``
+For recipes that fetch release tarballs from github, the :ref:`github-releases <ref-classes-github-releases>`
 class sets up a standard way for checking available upstream versions
 (to support ``devtool upgrade`` and the Automated Upgrade Helper (AUH)).
 
-To use it, add ``github-releases`` to the inherit line in the recipe,
+To use it, add ":ref:`github-releases <ref-classes-github-releases>`" to the inherit line in the recipe,
 and if the default value of :term:`GITHUB_BASE_URI` is not suitable,
 then set your own value in the recipe. You should then use ``${GITHUB_BASE_URI}``
 in the value you set for :term:`SRC_URI` within the recipe.
@@ -692,7 +692,7 @@ in the value you set for :term:`SRC_URI` within the recipe.
 ``gnomebase.bbclass``
 =====================
 
-The ``gnomebase`` class is the base class for recipes that build
+The :ref:`gnomebase <ref-classes-gnomebase>` class is the base class for recipes that build
 software from the GNOME stack. This class sets
 :term:`SRC_URI` to download the source from the GNOME
 mirrors as well as extending :term:`FILES` with the typical
@@ -721,7 +721,7 @@ introspection. This functionality is only enabled if the
 ``grub-efi.bbclass``
 ====================
 
-The ``grub-efi`` class provides ``grub-efi``-specific functions for
+The :ref:`grub-efi <ref-classes-grub-efi>` class provides ``grub-efi``-specific functions for
 building bootable images.
 
 This class supports several variables:
@@ -753,7 +753,7 @@ This class supports several variables:
 ``gsettings.bbclass``
 =====================
 
-The ``gsettings`` class provides common functionality for recipes that
+The :ref:`gsettings <ref-classes-gsettings>` class provides common functionality for recipes that
 need to install GSettings (glib) schemas. The schemas are assumed to be
 part of the main package. Appropriate post-install and post-remove
 (postinst/postrm) scriptlets are added to register and unregister the
@@ -1504,7 +1504,7 @@ The ``logging`` class provides the standard shell functions used to log
 messages for various BitBake severity levels (i.e. ``bbplain``,
 ``bbnote``, ``bbwarn``, ``bberror``, ``bbfatal``, and ``bbdebug``).
 
-This class is enabled by default since it is inherited by the ``base``
+This class is enabled by default since it is inherited by the :ref:`base <ref-classes-base>`
 class.
 
 .. _ref-classes-metadata_scm:
@@ -1518,7 +1518,7 @@ branch and revision of a Source Code Manager (SCM) repository.
 The :ref:`base <ref-classes-base>` class uses this class to print the
 revisions of each layer before starting every build. The
 ``metadata_scm`` class is enabled by default because it is inherited by
-the ``base`` class.
+the :ref:`base <ref-classes-base>` class.
 
 .. _ref-classes-migrate_localcount:
 
-- 
2.34.1


