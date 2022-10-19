Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8A3C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 16:48:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.380.1666198123148273683
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 09:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MCR56R9R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3B146000C;
	Wed, 19 Oct 2022 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666198121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uGVrDGOcuFjLMKIoprmSkFIhAaaZT93zcddXxo9JCVw=;
	b=MCR56R9RrrywRtNHnmieXsavCtAN6TFROKiGEO+YLJrSBnmN0qRkrynEq6ocd0xLcSogDb
	kptyL5XfUSb/JTMAB/8tUky/RAyk4soM0lYgzaxZ3EubVQnU8DKsuo3ihIAQJofNhBmxIk
	tgQAptz0+mUMMRZa3ShnKe7nfZb1NtE9BWknT2HScXGpgjxKdRj3XkseEm7OCWbAayJbAR
	LOw2mZ92CFlGh5W/py8lUctgo4MBjyZJWojVoRYJfHBnGTwEVogcx/uUABo1hazIFRRRm7
	qjed2H30GxqVbB88cIEs+8vhur5/sF02Pr3sEuBvAsPDd+1gjtpirNl6xgxchw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] ref-manual: classes.rst: add links to all references to a class
Date: Wed, 19 Oct 2022 18:48:37 +0200
Message-Id: <20221019164837.61436-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Oct 2022 16:48:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3377

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
 documentation/ref-manual/classes.rst | 452 +++++++++++++--------------
 1 file changed, 225 insertions(+), 227 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cd5a51695b..1880e44486 100644
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
+is used during the build process for :ref:`nativesdk <ref-classes-nativesdk>`, :ref:`cross <ref-classes-cross>`, and
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
@@ -389,7 +389,7 @@ cross-compilation tools.
 ``cross-canadian.bbclass``
 ==========================
 
-The ``cross-canadian`` class provides support for the recipes that build
+The :ref:`cross-canadian <ref-classes-cross-canadian>` class provides support for the recipes that build
 the Canadian Cross-compilation tools for SDKs. See the
 ":ref:`overview-manual/concepts:cross-development toolchain generation`"
 section in the Yocto Project Overview and Concepts Manual for more
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
@@ -490,10 +490,10 @@ Any development-specific adjustments can be done by using the
 
 The class
 currently only supports creating a development variant of the target
-recipe, not ``native`` or ``nativesdk`` variants.
+recipe, not :ref:`native <ref-classes-native>` or :ref:`nativesdk <ref-classes-nativesdk>` variants.
 
 The :term:`BBCLASSEXTEND` syntax (i.e. ``devupstream:target``) provides
-support for ``native`` and ``nativesdk`` variants. Consequently, this
+support for :ref:`native <ref-classes-native>` and :ref:`nativesdk <ref-classes-nativesdk>` variants. Consequently, this
 functionality can be added in a future release.
 
 Support for other version control systems such as Subversion is limited
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
@@ -764,7 +764,7 @@ schemas in the target image.
 ``gtk-doc.bbclass``
 ===================
 
-The ``gtk-doc`` class is a helper class to pull in the appropriate
+The :ref:`gtk-doc <ref-classes-gtk-doc>` class is a helper class to pull in the appropriate
 ``gtk-doc`` dependencies and disable ``gtk-doc``.
 
 .. _ref-classes-gtk-icon-cache:
@@ -772,7 +772,7 @@ The ``gtk-doc`` class is a helper class to pull in the appropriate
 ``gtk-icon-cache.bbclass``
 ==========================
 
-The ``gtk-icon-cache`` class generates the proper post-install and
+The :ref:`gtk-icon-cache <ref-classes-gtk-icon-cache>` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that use GTK+ and
 install icons. These scriptlets call ``gtk-update-icon-cache`` to add
 the fonts to GTK+'s icon cache. Since the cache files are
@@ -785,7 +785,7 @@ creation.
 ``gtk-immodules-cache.bbclass``
 ===============================
 
-The ``gtk-immodules-cache`` class generates the proper post-install and
+The :ref:`gtk-immodules-cache <ref-classes-gtk-immodules-cache>` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install GTK+
 input method modules for virtual keyboards. These scriptlets call
 ``gtk-update-icon-cache`` to add the input method modules to the cache.
@@ -803,7 +803,7 @@ the packages containing the modules.
 ``gzipnative.bbclass``
 ======================
 
-The ``gzipnative`` class enables the use of different native versions of
+The :ref:`gzipnative <ref-classes-gzipnative>` class enables the use of different native versions of
 ``gzip`` and ``pigz`` rather than the versions of these tools from the
 build host.
 
@@ -812,7 +812,7 @@ build host.
 ``icecc.bbclass``
 =================
 
-The ``icecc`` class supports
+The :ref:`icecc <ref-classes-icecc>` class supports
 `Icecream <https://github.com/icecc/icecream>`__, which facilitates
 taking compile jobs and distributing them among remote machines.
 
@@ -860,13 +860,13 @@ Additionally, you can list recipes using the
 your ``local.conf`` file to force ``icecc`` to be enabled for recipes
 using an empty :term:`PARALLEL_MAKE` variable.
 
-Inheriting the ``icecc`` class changes all sstate signatures.
+Inheriting the :ref:`icecc <ref-classes-icecc>` class changes all sstate signatures.
 Consequently, if a development team has a dedicated build system that
 populates :term:`SSTATE_MIRRORS` and they want to
 reuse sstate from :term:`SSTATE_MIRRORS`, then all developers and the build
-system need to either inherit the ``icecc`` class or nobody should.
+system need to either inherit the :ref:`icecc <ref-classes-icecc>` class or nobody should.
 
-At the distribution level, you can inherit the ``icecc`` class to be
+At the distribution level, you can inherit the :ref:`icecc <ref-classes-icecc>` class to be
 sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
 :term:`ICECC_DISABLED` variable to "1" as follows::
@@ -886,7 +886,7 @@ individually as follows in your ``local.conf`` file::
 ``image.bbclass``
 =================
 
-The ``image`` class helps support creating images in different formats.
+The :ref:`image <ref-classes-image>` class helps support creating images in different formats.
 First, the root filesystem is created from packages using one of the
 ``rootfs*.bbclass`` files (depending on the package format used) and
 then one or more image files are created.
@@ -909,7 +909,7 @@ Yocto Project Overview and Concepts Manual.
 ``image-buildinfo.bbclass``
 ===========================
 
-The ``image-buildinfo`` class writes a plain text file containing
+The :ref:`image-buildinfo <ref-classes-image-buildinfo>` class writes a plain text file containing
 build information to the target filesystem at ``${sysconfdir}/buildinfo``
 by default (as specified by :term:`IMAGE_BUILDINFO_FILE`.
 This can be useful for manually determining the origin of any given
@@ -931,14 +931,14 @@ to ``/buildinfo`` by default (as specified by
 ``image_types.bbclass``
 =======================
 
-The ``image_types`` class defines all of the standard image output types
+The :ref:`image_types <ref-classes-image_types>` class defines all of the standard image output types
 that you can enable through the
 :term:`IMAGE_FSTYPES` variable. You can use this
 class as a reference on how to add support for custom image output
 types.
 
 By default, the :ref:`image <ref-classes-image>` class automatically
-enables the ``image_types`` class. The ``image`` class uses the
+enables the :ref:`image_types <ref-classes-image_types>` class. The :ref:`image <ref-classes-image>` class uses the
 ``IMGCLASSES`` variable as follows::
 
    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
@@ -950,7 +950,7 @@ enables the ``image_types`` class. The ``image`` class uses the
    IMGCLASSES += "image-postinst-intercepts"
    inherit ${IMGCLASSES}
 
-The ``image_types`` class also handles conversion and compression of images.
+The :ref:`image_types <ref-classes-image_types>` class also handles conversion and compression of images.
 
 .. note::
 
@@ -976,7 +976,7 @@ Normally, you do not use this class directly. Instead, you add "live" to
 ``insane.bbclass``
 ==================
 
-The ``insane`` class adds a step to the package generation process so
+The :ref:`insane <ref-classes-insane>` class adds a step to the package generation process so
 that output quality assurance checks are generated by the OpenEmbedded
 build system. A range of checks are performed that check the build's
 output for common problems that show up during runtime. Distribution
@@ -1276,7 +1276,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
 ``insserv.bbclass``
 ===================
 
-The ``insserv`` class uses the ``insserv`` utility to update the order
+The :ref:`insserv <ref-classes-insserv>` class uses the ``insserv`` utility to update the order
 of symbolic links in ``/etc/rc?.d/`` within an image based on
 dependencies specified by LSB headers in the ``init.d`` scripts
 themselves.
@@ -1286,7 +1286,7 @@ themselves.
 ``kernel.bbclass``
 ==================
 
-The ``kernel`` class handles building Linux kernels. The class contains
+The :ref:`kernel <ref-classes-kernel>` class handles building Linux kernels. The class contains
 code to build all kernel trees. All needed headers are staged into the
 :term:`STAGING_KERNEL_DIR` directory to allow out-of-tree module builds
 using the :ref:`module <ref-classes-module>` class.
@@ -1297,13 +1297,13 @@ If all modules are required, then installing the ``kernel-modules``
 package installs all packages with modules and various other kernel
 packages such as ``kernel-vmlinux``.
 
-The ``kernel`` class contains logic that allows you to embed an initial
+The :ref:`kernel <ref-classes-kernel>` class contains logic that allows you to embed an initial
 RAM filesystem (:term:`Initramfs`) image when you build the kernel image. For
 information on how to build an :term:`Initramfs`, see the
 ":ref:`dev-manual/common-tasks:building an initial ram filesystem (Initramfs) image`" section in
 the Yocto Project Development Tasks Manual.
 
-Various other classes are used by the ``kernel`` and ``module`` classes
+Various other classes are used by the :ref:`kernel <ref-classes-kernel>` and :ref:`module <ref-classes-module>` classes
 internally including the :ref:`kernel-arch <ref-classes-kernel-arch>`,
 :ref:`module-base <ref-classes-module-base>`, and
 :ref:`linux-kernel-base <ref-classes-linux-kernel-base>` classes.
@@ -1313,7 +1313,7 @@ internally including the :ref:`kernel-arch <ref-classes-kernel-arch>`,
 ``kernel-arch.bbclass``
 =======================
 
-The ``kernel-arch`` class sets the ``ARCH`` environment variable for
+The :ref:`kernel-arch <ref-classes-kernel-arch>` class sets the ``ARCH`` environment variable for
 Linux kernel compilation (including modules).
 
 .. _ref-classes-kernel-devicetree:
@@ -1321,7 +1321,7 @@ Linux kernel compilation (including modules).
 ``kernel-devicetree.bbclass``
 =============================
 
-The ``kernel-devicetree`` class, which is inherited by the
+The :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class, which is inherited by the
 :ref:`kernel <ref-classes-kernel>` class, supports device tree
 generation.
 
@@ -1330,11 +1330,11 @@ generation.
 ``kernel-fitimage.bbclass``
 ===========================
 
-The ``kernel-fitimage`` class provides support to pack a kernel image,
+The :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class provides support to pack a kernel image,
 device trees, a U-boot script, a Initramfs bundle and a RAM disk
 into a single FIT image. In theory, a FIT image can support any number
 of kernels, U-boot scripts, Initramfs bundles, RAM disks and device-trees.
-However, ``kernel-fitimage`` currently only supports
+However, :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` currently only supports
 limited usecases: just one kernel image, an optional U-boot script,
 an optional Initramfs bundle, an optional RAM disk, and any number of
 device tree.
@@ -1348,19 +1348,19 @@ when creating the FIT image are specified using the
 :term:`UBOOT_MKIMAGE_DTCOPTS` variable.
 
 Only a single kernel can be added to the FIT image created by
-``kernel-fitimage`` and the kernel image in FIT is mandatory. The
+:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the kernel image in FIT is mandatory. The
 address where the kernel image is to be loaded by U-Boot is
 specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_ENTRYPOINT`.
 
 Multiple device trees can be added to the FIT image created by
-``kernel-fitimage`` and the device tree is optional.
+:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the device tree is optional.
 The address where the device tree is to be loaded by U-Boot is
 specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
 and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
 
 Only a single RAM disk can be added to the FIT image created by
-``kernel-fitimage`` and the RAM disk in FIT is optional.
+:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the RAM disk in FIT is optional.
 The address where the RAM disk image is to be loaded by U-Boot
 is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 :term:`UBOOT_RD_ENTRYPOINT`. The ramdisk is added to FIT image when
@@ -1368,7 +1368,7 @@ is specified by :term:`UBOOT_RD_LOADADDRESS` and the entrypoint by
 is set to 0.
 
 Only a single Initramfs bundle can be added to the FIT image created by
-``kernel-fitimage`` and the Initramfs bundle in FIT is optional.
+:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the Initramfs bundle in FIT is optional.
 In case of Initramfs, the kernel is configured to be bundled with the root filesystem
 in the same binary (example: zImage-initramfs-:term:`MACHINE`.bin).
 When the kernel is copied to RAM and executed, it unpacks the Initramfs root filesystem.
@@ -1378,21 +1378,21 @@ The address where the Initramfs bundle is to be loaded by U-boot is specified
 by :term:`UBOOT_LOADADDRESS` and the entrypoint by :term:`UBOOT_ENTRYPOINT`.
 
 Only a single U-boot boot script can be added to the FIT image created by
-``kernel-fitimage`` and the boot script is optional.
+:ref:`kernel-fitimage <ref-classes-kernel-fitimage>` and the boot script is optional.
 The boot script is specified in the ITS file as a text file containing
 U-boot commands. When using a boot script the user should configure the
 U-boot :ref:`ref-tasks-install` task to copy the script to sysroot.
-So the script can be included in the FIT image by the ``kernel-fitimage``
+So the script can be included in the FIT image by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
 class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
 load the boot script from the FIT image and executes it.
 
-The FIT image generated by ``kernel-fitimage`` class is signed when the
+The FIT image generated by :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class is signed when the
 variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
 :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
 appropriately. The default values used for :term:`FIT_HASH_ALG` and
-:term:`FIT_SIGN_ALG` in ``kernel-fitimage`` are "sha256" and
+:term:`FIT_SIGN_ALG` in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` are "sha256" and
 "rsa2048" respectively. The keys for signing fitImage can be generated using
-the ``kernel-fitimage`` class when both :term:`FIT_GENERATE_KEYS` and
+the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class when both :term:`FIT_GENERATE_KEYS` and
 :term:`UBOOT_SIGN_ENABLE` are set to "1".
 
 
@@ -1401,7 +1401,7 @@ the ``kernel-fitimage`` class when both :term:`FIT_GENERATE_KEYS` and
 ``kernel-grub.bbclass``
 =======================
 
-The ``kernel-grub`` class updates the boot area and the boot menu with
+The :ref:`kernel-grub <ref-classes-kernel-grub>` class updates the boot area and the boot menu with
 the kernel as the priority boot mechanism while installing a RPM to
 update the kernel on a deployed target.
 
@@ -1410,7 +1410,7 @@ update the kernel on a deployed target.
 ``kernel-module-split.bbclass``
 ===============================
 
-The ``kernel-module-split`` class provides common functionality for
+The :ref:`kernel-module-split <ref-classes-kernel-module-split>` class provides common functionality for
 splitting Linux kernel modules into separate packages.
 
 .. _ref-classes-kernel-uboot:
@@ -1418,7 +1418,7 @@ splitting Linux kernel modules into separate packages.
 ``kernel-uboot.bbclass``
 ========================
 
-The ``kernel-uboot`` class provides support for building from
+The :ref:`kernel-uboot <ref-classes-kernel-uboot>` class provides support for building from
 vmlinux-style kernel sources.
 
 .. _ref-classes-kernel-uimage:
@@ -1426,14 +1426,14 @@ vmlinux-style kernel sources.
 ``kernel-uimage.bbclass``
 =========================
 
-The ``kernel-uimage`` class provides support to pack uImage.
+The :ref:`kernel-uimage <ref-classes-kernel-uimage>` class provides support to pack uImage.
 
 .. _ref-classes-kernel-yocto:
 
 ``kernel-yocto.bbclass``
 ========================
 
-The ``kernel-yocto`` class provides common functionality for building
+The :ref:`kernel-yocto <ref-classes-kernel-yocto>` class provides common functionality for building
 from linux-yocto style kernel source repositories.
 
 .. _ref-classes-kernelsrc:
@@ -1441,14 +1441,14 @@ from linux-yocto style kernel source repositories.
 ``kernelsrc.bbclass``
 =====================
 
-The ``kernelsrc`` class sets the Linux kernel source and version.
+The :ref:`kernelsrc <ref-classes-kernelsrc>` class sets the Linux kernel source and version.
 
 .. _ref-classes-lib_package:
 
 ``lib_package.bbclass``
 =======================
 
-The ``lib_package`` class supports recipes that build libraries and
+The :ref:`lib_package <ref-classes-lib_package>` class supports recipes that build libraries and
 produce executable binaries, where those binaries should not be
 installed by default along with the library. Instead, the binaries are
 added to a separate ``${``\ :term:`PN`\ ``}-bin`` package to
@@ -1459,12 +1459,12 @@ make their installation optional.
 ``libc*.bbclass``
 =================
 
-The ``libc*`` classes support recipes that build packages with ``libc``:
+The :ref:`libc* <ref-classes-libc*>` classes support recipes that build packages with ``libc``:
 
--  The ``libc-common`` class provides common support for building with
+-  The :ref:`libc-common <ref-classes-libc*>` class provides common support for building with
    ``libc``.
 
--  The ``libc-package`` class supports packaging up ``glibc`` and
+-  The :ref:`libc-package <ref-classes-libc*>` class supports packaging up ``glibc`` and
    ``eglibc``.
 
 .. _ref-classes-license:
@@ -1472,7 +1472,7 @@ The ``libc*`` classes support recipes that build packages with ``libc``:
 ``license.bbclass``
 ===================
 
-The ``license`` class provides license manifest creation and license
+The :ref:`license <ref-classes-license>` class provides license manifest creation and license
 exclusion. This class is enabled by default using the default value for
 the :term:`INHERIT_DISTRO` variable.
 
@@ -1481,7 +1481,7 @@ the :term:`INHERIT_DISTRO` variable.
 ``linux-kernel-base.bbclass``
 =============================
 
-The ``linux-kernel-base`` class provides common functionality for
+The :ref:`linux-kernel-base <ref-classes-linux-kernel-base>` class provides common functionality for
 recipes that build out of the Linux kernel source tree. These builds
 goes beyond the kernel itself. For example, the Perf recipe also
 inherits this class.
@@ -1500,11 +1500,11 @@ number of other classes.
 ``logging.bbclass``
 ===================
 
-The ``logging`` class provides the standard shell functions used to log
+The :ref:`logging <ref-classes-logging>` class provides the standard shell functions used to log
 messages for various BitBake severity levels (i.e. ``bbplain``,
 ``bbnote``, ``bbwarn``, ``bberror``, ``bbfatal``, and ``bbdebug``).
 
-This class is enabled by default since it is inherited by the ``base``
+This class is enabled by default since it is inherited by the :ref:`base <ref-classes-base>`
 class.
 
 .. _ref-classes-metadata_scm:
@@ -1512,20 +1512,20 @@ class.
 ``metadata_scm.bbclass``
 ========================
 
-The ``metadata_scm`` class provides functionality for querying the
+The :ref:`metadata_scm <ref-classes-metadata_scm>` class provides functionality for querying the
 branch and revision of a Source Code Manager (SCM) repository.
 
 The :ref:`base <ref-classes-base>` class uses this class to print the
 revisions of each layer before starting every build. The
-``metadata_scm`` class is enabled by default because it is inherited by
-the ``base`` class.
+:ref:`metadata_scm <ref-classes-metadata_scm>` class is enabled by default because it is inherited by
+the :ref:`base <ref-classes-base>` class.
 
 .. _ref-classes-migrate_localcount:
 
 ``migrate_localcount.bbclass``
 ==============================
 
-The ``migrate_localcount`` class verifies a recipe's localcount data and
+The :ref:`migrate_localcount <ref-classes-migrate_localcount>` class verifies a recipe's localcount data and
 increments it appropriately.
 
 .. _ref-classes-mime:
@@ -1533,7 +1533,7 @@ increments it appropriately.
 ``mime.bbclass``
 ================
 
-The ``mime`` class generates the proper post-install and post-remove
+The :ref:`mime <ref-classes-mime>` class generates the proper post-install and post-remove
 (postinst/postrm) scriptlets for packages that install MIME type files.
 These scriptlets call ``update-mime-database`` to add the MIME types to
 the shared database.
@@ -1543,7 +1543,7 @@ the shared database.
 ``mirrors.bbclass``
 ===================
 
-The ``mirrors`` class sets up some standard
+The :ref:`mirrors <ref-classes-mirrors>` class sets up some standard
 :term:`MIRRORS` entries for source code mirrors. These
 mirrors provide a fall-back path in case the upstream source specified
 in :term:`SRC_URI` within recipes is unavailable.
@@ -1556,7 +1556,7 @@ This class is enabled by default since it is inherited by the
 ``module.bbclass``
 ==================
 
-The ``module`` class provides support for building out-of-tree Linux
+The :ref:`module <ref-classes-module>` class provides support for building out-of-tree Linux
 kernel modules. The class inherits the
 :ref:`module-base <ref-classes-module-base>` and
 :ref:`kernel-module-split <ref-classes-kernel-module-split>` classes,
@@ -1573,7 +1573,7 @@ section in the Yocto Project Linux Kernel Development Manual.
 ``module-base.bbclass``
 =======================
 
-The ``module-base`` class provides the base functionality for building
+The :ref:`module-base <ref-classes-module-base>` class provides the base functionality for building
 Linux kernel modules. Typically, a recipe that builds software that
 includes one or more kernel modules and has its own means of building
 the module inherits this class as opposed to inheriting the
@@ -1584,7 +1584,7 @@ the module inherits this class as opposed to inheriting the
 ``multilib*.bbclass``
 =====================
 
-The ``multilib*`` classes provide support for building libraries with
+The :ref:`multilib* <ref-classes-multilib*>` classes provide support for building libraries with
 different target optimizations or target architectures and installing
 them side-by-side in the same image.
 
@@ -1597,17 +1597,17 @@ section in the Yocto Project Development Tasks Manual.
 ``native.bbclass``
 ==================
 
-The ``native`` class provides common functionality for recipes that
+The :ref:`native <ref-classes-native>` class provides common functionality for recipes that
 build tools to run on the :term:`Build Host` (i.e. tools that use the compiler
 or other tools from the build host).
 
 You can create a recipe that builds tools that run natively on the host
 a couple different ways:
 
--  Create a ``myrecipe-native.bb`` recipe that inherits the ``native``
+-  Create a ``myrecipe-native.bb`` recipe that inherits the :ref:`native <ref-classes-native>`
    class. If you use this method, you must order the inherit statement
    in the recipe after all other inherit statements so that the
-   ``native`` class is inherited last.
+   :ref:`native <ref-classes-native>` class is inherited last.
 
    .. note::
 
@@ -1629,7 +1629,7 @@ a couple different ways:
    specify any functionality specific to the respective native or target
    case.
 
-Although applied differently, the ``native`` class is used with both
+Although applied differently, the :ref:`native <ref-classes-native>` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for native and
 target. All common parts of the recipe are automatically shared.
@@ -1639,7 +1639,7 @@ target. All common parts of the recipe are automatically shared.
 ``nativesdk.bbclass``
 =====================
 
-The ``nativesdk`` class provides common functionality for recipes that
+The :ref:`nativesdk <ref-classes-nativesdk>` class provides common functionality for recipes that
 wish to build tools to run as part of an SDK (i.e. tools that run on
 :term:`SDKMACHINE`).
 
@@ -1647,11 +1647,11 @@ You can create a recipe that builds tools that run on the SDK machine a
 couple different ways:
 
 -  Create a ``nativesdk-myrecipe.bb`` recipe that inherits the
-   ``nativesdk`` class. If you use this method, you must order the
+   :ref:`nativesdk <ref-classes-nativesdk>` class. If you use this method, you must order the
    inherit statement in the recipe after all other inherit statements so
-   that the ``nativesdk`` class is inherited last.
+   that the :ref:`nativesdk <ref-classes-nativesdk>` class is inherited last.
 
--  Create a ``nativesdk`` variant of any recipe by adding the following::
+-  Create a :ref:`nativesdk <ref-classes-nativesdk>` variant of any recipe by adding the following::
 
        BBCLASSEXTEND = "nativesdk"
 
@@ -1670,7 +1670,7 @@ couple different ways:
    Not doing so can lead to subtle problems because there is code that
    depends on the naming convention.
 
-Although applied differently, the ``nativesdk`` class is used with both
+Although applied differently, the :ref:`nativesdk <ref-classes-nativesdk>` class is used with both
 methods. The advantage of the second method is that you do not need to
 have two separate recipes (assuming you need both) for the SDK machine
 and the target. All common parts of the recipe are automatically shared.
@@ -1705,11 +1705,11 @@ section in the Yocto Project Development Tasks Manual.
 ``oelint.bbclass``
 ==================
 
-The ``oelint`` class is an obsolete lint checking tool available in
+The :ref:`oelint <ref-classes-oelint>` class is an obsolete lint checking tool available in
 ``meta/classes`` in the :term:`Source Directory`.
 
 There are some classes that could be generally useful in OE-Core but
-are never actually used within OE-Core itself. The ``oelint`` class is
+are never actually used within OE-Core itself. The :ref:`oelint <ref-classes-oelint>` class is
 one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
 layers.
@@ -1828,7 +1828,7 @@ The class provides two options for ``/sbin/init`` generation:
 ``own-mirrors.bbclass``
 =======================
 
-The ``own-mirrors`` class makes it easier to set up your own
+The :ref:`own-mirrors <ref-classes-own-mirrors>` class makes it easier to set up your own
 :term:`PREMIRRORS` from which to first fetch source
 before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.
@@ -1847,7 +1847,7 @@ in :term:`SOURCE_MIRROR_URL`.
 ``package.bbclass``
 ===================
 
-The ``package`` class supports generating packages from a build's
+The :ref:`package <ref-classes-package>` class supports generating packages from a build's
 output. The core generic functionality is in ``package.bbclass``. The
 code specific to particular package types resides in these
 package-specific classes:
@@ -1858,10 +1858,8 @@ package-specific classes:
 
 .. note::
 
-   The
-   package_tar
-   class is broken and not supported. It is recommended that you do not
-   use this class.
+   The :ref:`package_tar <ref-classes-package_tar>` class is broken and
+   not supported. It is recommended that you do not use this class.
 
 You can control the list of resulting package formats by using the
 :term:`PACKAGE_CLASSES` variable defined in your ``conf/local.conf``
@@ -1886,7 +1884,7 @@ complete build of the package with all dependencies previously built.
 The reason for this discrepancy is because the RPM package manager
 creates and processes more :term:`Metadata` than the IPK package
 manager. Consequently, you might consider setting :term:`PACKAGE_CLASSES` to
-"package_ipk" if you are building smaller systems.
+":ref:`package_ipk <ref-classes-package_ipk>`" if you are building smaller systems.
 
 Before making your package manager decision, however, you should
 consider some further things about using RPM:
@@ -1914,7 +1912,7 @@ at these two Yocto Project mailing list links:
 ``package_deb.bbclass``
 =======================
 
-The ``package_deb`` class provides support for creating packages that
+The :ref:`package_deb <ref-classes-package_deb>` class provides support for creating packages that
 use the Debian (i.e. ``.deb``) file format. The class ensures the
 packages are written out in a ``.deb`` file format to the
 ``${``\ :term:`DEPLOY_DIR_DEB`\ ``}`` directory.
@@ -1928,7 +1926,7 @@ variable in the ``local.conf`` file.
 ``package_ipk.bbclass``
 =======================
 
-The ``package_ipk`` class provides support for creating packages that
+The :ref:`package_ipk <ref-classes-package_ipk>` class provides support for creating packages that
 use the IPK (i.e. ``.ipk``) file format. The class ensures the packages
 are written out in a ``.ipk`` file format to the
 ``${``\ :term:`DEPLOY_DIR_IPK`\ ``}`` directory.
@@ -1942,7 +1940,7 @@ variable in the ``local.conf`` file.
 ``package_rpm.bbclass``
 =======================
 
-The ``package_rpm`` class provides support for creating packages that
+The :ref:`package_rpm <ref-classes-package_rpm>` class provides support for creating packages that
 use the RPM (i.e. ``.rpm``) file format. The class ensures the packages
 are written out in a ``.rpm`` file format to the
 ``${``\ :term:`DEPLOY_DIR_RPM`\ ``}`` directory.
@@ -1956,7 +1954,7 @@ variable in the ``local.conf`` file.
 ``package_tar.bbclass``
 =======================
 
-The ``package_tar`` class provides support for creating tarballs. The
+The :ref:`package_tar <ref-classes-package_tar>` class provides support for creating tarballs. The
 class ensures the packages are written out in a tarball format to the
 ``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory.
 
@@ -1966,7 +1964,7 @@ variable in the ``local.conf`` file.
 
 .. note::
 
-   You cannot specify the ``package_tar`` class first using the
+   You cannot specify the :ref:`package_tar <ref-classes-package_tar>` class first using the
    :term:`PACKAGE_CLASSES` variable. You must use ``.deb``, ``.ipk``, or ``.rpm``
    file formats for your image or SDK.
 
@@ -1975,7 +1973,7 @@ variable in the ``local.conf`` file.
 ``packagedata.bbclass``
 =======================
 
-The ``packagedata`` class provides common functionality for reading
+The :ref:`packagedata <ref-classes-packagedata>` class provides common functionality for reading
 ``pkgdata`` files found in :term:`PKGDATA_DIR`. These
 files contain information about each output package produced by the
 OpenEmbedded build system.
@@ -1988,7 +1986,7 @@ This class is enabled by default because it is inherited by the
 ``packagegroup.bbclass``
 ========================
 
-The ``packagegroup`` class sets default values appropriate for package
+The :ref:`packagegroup <ref-classes-packagegroup>` class sets default values appropriate for package
 group recipes (e.g. :term:`PACKAGES`, :term:`PACKAGE_ARCH`, :term:`ALLOW_EMPTY`, and
 so forth). It is highly recommended that all package group recipes
 inherit this class.
@@ -2004,7 +2002,7 @@ Previously, this class was called the ``task`` class.
 ``patch.bbclass``
 =================
 
-The ``patch`` class provides all functionality for applying patches
+The :ref:`patch <ref-classes-patch>` class provides all functionality for applying patches
 during the :ref:`ref-tasks-patch` task.
 
 This class is enabled by default because it is inherited by the
@@ -2015,7 +2013,7 @@ This class is enabled by default because it is inherited by the
 ``perlnative.bbclass``
 ======================
 
-When inherited by a recipe, the ``perlnative`` class supports using the
+When inherited by a recipe, the :ref:`perlnative <ref-classes-perlnative>` class supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
 
@@ -2024,14 +2022,14 @@ version provided by the build host.
 ``pypi.bbclass``
 ================
 
-The ``pypi`` class sets variables appropriately for recipes that build
+The :ref:`pypi <ref-classes-pypi>` class sets variables appropriately for recipes that build
 Python modules from `PyPI <https://pypi.org/>`__, the Python Package Index.
 By default it determines the PyPI package name based upon :term:`BPN`
 (stripping the "python-" or "python3-" prefix off if present), however in
 some cases you may need to set it manually in the recipe by setting
 :term:`PYPI_PACKAGE`.
 
-Variables set by the ``pypi`` class include :term:`SRC_URI`, :term:`SECTION`,
+Variables set by the :ref:`pypi <ref-classes-pypi>` class include :term:`SRC_URI`, :term:`SECTION`,
 :term:`HOMEPAGE`, :term:`UPSTREAM_CHECK_URI`, :term:`UPSTREAM_CHECK_REGEX`
 and :term:`CVE_PRODUCT`.
 
@@ -2040,7 +2038,7 @@ and :term:`CVE_PRODUCT`.
 ``python_flit_core.bbclass``
 ============================
 
-The ``python_flit_core`` class enables building Python modules which declare
+The :ref:`python_flit_core <ref-classes-python_flit_core>` class enables building Python modules which declare
 the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
 ``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
 section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
@@ -2055,7 +2053,7 @@ Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
 ``python_pep517.bbclass``
 =========================
 
-The ``python_pep517`` class builds and installs a Python ``wheel`` binary
+The :ref:`python_pep517 <ref-classes-python_pep517>` class builds and installs a Python ``wheel`` binary
 archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
 
 Recipes wouldn't inherit this directly, instead typically another class will
@@ -2071,7 +2069,7 @@ Examples of classes which do this are :ref:`python_flit_core
 ``python_poetry_core.bbclass``
 ==============================
 
-The ``python_poetry_core`` class enables building Python modules which use the
+The :ref:`python_poetry_core <ref-classes-python_poetry_core>` class enables building Python modules which use the
 `Poetry Core <https://python-poetry.org>`__ build system.
 
 Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
@@ -2081,7 +2079,7 @@ Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
 ``pixbufcache.bbclass``
 =======================
 
-The ``pixbufcache`` class generates the proper post-install and
+The :ref:`pixbufcache <ref-classes-pixbufcache>` class generates the proper post-install and
 post-remove (postinst/postrm) scriptlets for packages that install
 pixbuf loaders, which are used with ``gdk-pixbuf``. These scriptlets
 call ``update_pixbuf_cache`` to add the pixbuf loaders to the cache.
@@ -2099,13 +2097,13 @@ containing the loaders.
 ``pkgconfig.bbclass``
 =====================
 
-The ``pkgconfig`` class provides a standard way to get header and
+The :ref:`pkgconfig <ref-classes-pkgconfig>` class provides a standard way to get header and
 library information by using ``pkg-config``. This class aims to smooth
 integration of ``pkg-config`` into libraries that use it.
 
 During staging, BitBake installs ``pkg-config`` data into the
 ``sysroots/`` directory. By making use of sysroot functionality within
-``pkg-config``, the ``pkgconfig`` class no longer has to manipulate the
+``pkg-config``, the :ref:`pkgconfig <ref-classes-pkgconfig>` class no longer has to manipulate the
 files.
 
 .. _ref-classes-populate-sdk:
@@ -2113,7 +2111,7 @@ files.
 ``populate_sdk.bbclass``
 ========================
 
-The ``populate_sdk`` class provides support for SDK-only recipes. For
+The :ref:`populate_sdk <ref-classes-populate-sdk>` class provides support for SDK-only recipes. For
 information on advantages gained when building a cross-development
 toolchain using the :ref:`ref-tasks-populate_sdk`
 task, see the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
@@ -2125,31 +2123,31 @@ Software Development Kit (eSDK) manual.
 ``populate_sdk_*.bbclass``
 ==========================
 
-The ``populate_sdk_*`` classes support SDK creation and consist of the
+The :ref:`populate_sdk_* <ref-classes-populate-sdk-*>` classes support SDK creation and consist of the
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
@@ -2162,9 +2160,9 @@ which consists of the following::
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
@@ -2182,7 +2180,7 @@ Software Development Kit (eSDK) manual.
 ``prexport.bbclass``
 ====================
 
-The ``prexport`` class provides functionality for exporting
+The :ref:`prexport <ref-classes-prexport>` class provides functionality for exporting
 :term:`PR` values.
 
 .. note::
@@ -2195,7 +2193,7 @@ The ``prexport`` class provides functionality for exporting
 ``primport.bbclass``
 ====================
 
-The ``primport`` class provides functionality for importing
+The :ref:`primport <ref-classes-primport>` class provides functionality for importing
 :term:`PR` values.
 
 .. note::
@@ -2208,7 +2206,7 @@ The ``primport`` class provides functionality for importing
 ``prserv.bbclass``
 ==================
 
-The ``prserv`` class provides functionality for using a :ref:`PR
+The :ref:`prserv <ref-classes-prserv>` class provides functionality for using a :ref:`PR
 service <dev-manual/common-tasks:working with a pr service>` in order to
 automatically manage the incrementing of the :term:`PR`
 variable for each recipe.
@@ -2223,7 +2221,7 @@ build system will not enable the functionality of this class unless
 ``ptest.bbclass``
 =================
 
-The ``ptest`` class provides functionality for packaging and installing
+The :ref:`ptest <ref-classes-ptest>` class provides functionality for packaging and installing
 runtime tests for recipes that build software that provides these tests.
 
 This class is intended to be inherited by individual recipes. However,
@@ -2250,7 +2248,7 @@ section in the Yocto Project Development Tasks Manual.
 ``python3-dir.bbclass``
 =======================
 
-The ``python3-dir`` class provides the base version, location, and site
+The :ref:`python3-dir <ref-classes-python3-dir>` class provides the base version, location, and site
 package location for Python 3.
 
 .. _ref-classes-python3native:
@@ -2258,7 +2256,7 @@ package location for Python 3.
 ``python3native.bbclass``
 =========================
 
-The ``python3native`` class supports using the native version of Python
+The :ref:`python3native <ref-classes-python3native>` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host.
 
@@ -2267,7 +2265,7 @@ by the build host.
 ``python3targetconfig.bbclass``
 ===============================
 
-The ``python3targetconfig`` class supports using the native version of Python
+The :ref:`python3targetconfig <ref-classes-python3targetconfig>` class supports using the native version of Python
 3 built by the build system rather than support of the version provided
 by the build host, except that the configuration for the target machine
 is accessible (such as correct installation directories). This also adds a
@@ -2279,7 +2277,7 @@ in order to avoid unnecessarily lengthening builds.
 ``qemu.bbclass``
 ================
 
-The ``qemu`` class provides functionality for recipes that either need
+The :ref:`qemu <ref-classes-qemu>` class provides functionality for recipes that either need
 QEMU or test for the existence of QEMU. Typically, this class is used to
 run programs for a target system on the build host using QEMU's
 application emulation mode.
@@ -2289,7 +2287,7 @@ application emulation mode.
 ``recipe_sanity.bbclass``
 =========================
 
-The ``recipe_sanity`` class checks for the presence of any host system
+The :ref:`recipe_sanity <ref-classes-recipe_sanity>` class checks for the presence of any host system
 recipe prerequisites that might affect the build (e.g. variables that
 are set or software that is present).
 
@@ -2298,7 +2296,7 @@ are set or software that is present).
 ``relocatable.bbclass``
 =======================
 
-The ``relocatable`` class enables relocation of binaries when they are
+The :ref:`relocatable <ref-classes-relocatable>` class enables relocation of binaries when they are
 installed into the sysroot.
 
 This class makes use of the :ref:`chrpath <ref-classes-chrpath>` class
@@ -2310,7 +2308,7 @@ and is used by both the :ref:`cross <ref-classes-cross>` and
 ``remove-libtool.bbclass``
 ==========================
 
-The ``remove-libtool`` class adds a post function to the
+The :ref:`remove-libtool <ref-classes-remove-libtool>` class adds a post function to the
 :ref:`ref-tasks-install` task to remove all ``.la`` files
 installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.
@@ -2322,14 +2320,14 @@ override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
 
 .. note::
 
-   The ``remove-libtool`` class is not enabled by default.
+   The :ref:`remove-libtool <ref-classes-remove-libtool>` class is not enabled by default.
 
 .. _ref-classes-report-error:
 
 ``report-error.bbclass``
 ========================
 
-The ``report-error`` class supports enabling the :ref:`error reporting
+The :ref:`report-error <ref-classes-report-error>` class supports enabling the :ref:`error reporting
 tool <dev-manual/common-tasks:using the error reporting tool>`",
 which allows you to submit build error information to a central database.
 
@@ -2344,7 +2342,7 @@ are created and stored in
 ``rm_work.bbclass``
 ===================
 
-The ``rm_work`` class supports deletion of temporary workspace, which
+The :ref:`rm_work <ref-classes-rm-work>` class supports deletion of temporary workspace, which
 can ease your hard drive demands during builds.
 
 The OpenEmbedded build system can use a substantial amount of disk space
@@ -2354,7 +2352,7 @@ system generates the packages for a recipe, the work files for that
 recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
 you would rather have these files deleted to save disk space as the
-build progresses, you can enable ``rm_work`` by adding the following to
+build progresses, you can enable :ref:`rm_work <ref-classes-rm-work>` by adding the following to
 your ``local.conf`` file, which is found in the :term:`Build Directory`.
 ::
 
@@ -2362,9 +2360,9 @@ your ``local.conf`` file, which is found in the :term:`Build Directory`.
 
 If you are
 modifying and building source code out of the work directory for a
-recipe, enabling ``rm_work`` will potentially result in your changes to
+recipe, enabling :ref:`rm_work <ref-classes-rm-work>` will potentially result in your changes to
 the source being lost. To exclude some recipes from having their work
-directories deleted by ``rm_work``, you can add the names of the recipe
+directories deleted by :ref:`rm_work <ref-classes-rm-work>`, you can add the names of the recipe
 or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable, which
 can also be set in your ``local.conf`` file. Here is an example::
 
@@ -2375,26 +2373,26 @@ can also be set in your ``local.conf`` file. Here is an example::
 ``rootfs*.bbclass``
 ===================
 
-The ``rootfs*`` classes support creating the root filesystem for an
+The :ref:`rootfs* <ref-classes-rootfs*>` classes support creating the root filesystem for an
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
+:ref:`rootfs*.bbclass <ref-classes-rootfs*>` files as determined by the
 :term:`PACKAGE_CLASSES` variable.
 
 For information on how root filesystem images are created, see the
@@ -2406,7 +2404,7 @@ section in the Yocto Project Overview and Concepts Manual.
 ``sanity.bbclass``
 ==================
 
-The ``sanity`` class checks to see if prerequisite software is present
+The :ref:`sanity <ref-classes-sanity>` class checks to see if prerequisite software is present
 on the host system so that users can be notified of potential problems
 that might affect their build. The class also performs basic user
 configuration checks from the ``local.conf`` configuration file to
@@ -2418,7 +2416,7 @@ usually determines whether to include this class.
 ``scons.bbclass``
 =================
 
-The ``scons`` class supports recipes that need to build software that
+The :ref:`scons <ref-classes-scons>` class supports recipes that need to build software that
 uses the SCons build system. You can use the
 :term:`EXTRA_OESCONS` variable to specify
 additional configuration options you want to pass SCons command line.
@@ -2428,7 +2426,7 @@ additional configuration options you want to pass SCons command line.
 ``sdl.bbclass``
 ===============
 
-The ``sdl`` class supports recipes that need to build software that uses
+The :ref:`sdl <ref-classes-sdl>` class supports recipes that need to build software that uses
 the Simple DirectMedia Layer (SDL) library.
 
 .. _ref-classes-python_setuptools_build_meta:
@@ -2436,7 +2434,7 @@ the Simple DirectMedia Layer (SDL) library.
 ``python_setuptools_build_meta.bbclass``
 ========================================
 
-The ``python_setuptools_build_meta`` class enables building Python modules which
+The :ref:`python_setuptools_build_meta <ref-classes-python_setuptools_build_meta>` class enables building Python modules which
 declare the
 `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
 ``setuptools.build_meta`` ``build-backend`` in the ``[build-system]``
@@ -2452,14 +2450,14 @@ Internally this uses the :ref:`python_pep517 <ref-classes-python_pep517>` class.
 ``setuptools3.bbclass``
 =======================
 
-The ``setuptools3`` class supports Python version 3.x extensions that
+The :ref:`setuptools3 <ref-classes-setuptools3>` class supports Python version 3.x extensions that
 use build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and
 have not migrated to the official ``pyproject.toml`` format). If your recipe
-uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
+uses these build systems, the recipe needs to inherit the :ref:`setuptools3 <ref-classes-setuptools3>` class.
 
    .. note::
 
-      The ``setuptools3`` class :ref:`ref-tasks-compile` task now calls
+      The :ref:`setuptools3 <ref-classes-setuptools3>` class :ref:`ref-tasks-compile` task now calls
       ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
       (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
 
@@ -2470,7 +2468,7 @@ uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
 
    .. note::
 
-     The ``setuptools3`` class :ref:`ref-tasks-install` task now installs the ``wheel``
+     The :ref:`setuptools3 <ref-classes-setuptools3>` class :ref:`ref-tasks-install` task now installs the ``wheel``
      binary archive. In current versions of ``setuptools`` the legacy ``setup.py
      install`` method is deprecated. If the ``setup.py`` cannot be used with
      wheels, for example it creates files outside of the Python module or
@@ -2482,7 +2480,7 @@ uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
 ``setuptools3_legacy.bbclass``
 ==============================
 
-The ``setuptools3_legacy`` class supports Python version 3.x extensions that use
+The :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` class supports Python version 3.x extensions that use
 build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and have
 not migrated to the official ``pyproject.toml`` format). Unlike
 ``setuptools3.bbclass``, this uses the traditional ``setup.py`` ``build`` and
@@ -2495,7 +2493,7 @@ but still relatively common.
 ``setuptools3-base.bbclass``
 ============================
 
-The ``setuptools3-base`` class provides a reusable base for other classes
+The :ref:`setuptools3-base <ref-classes-setuptools3-base>` class provides a reusable base for other classes
 that support building Python version 3.x extensions. If you need
 functionality that is not provided by the :ref:`setuptools3 <ref-classes-setuptools3>` class, you may
 want to ``inherit setuptools3-base``. Some recipes do not need the tasks
@@ -2506,14 +2504,14 @@ in the :ref:`setuptools3 <ref-classes-setuptools3>` class and inherit this class
 ``sign_rpm.bbclass``
 ====================
 
-The ``sign_rpm`` class supports generating signed RPM packages.
+The :ref:`sign_rpm <ref-classes-sign_rpm>` class supports generating signed RPM packages.
 
 .. _ref-classes-sip:
 
 ``sip.bbclass``
 ===============
 
-The ``sip`` class supports recipes that build or package SIP-based
+The :ref:`sip <ref-classes-sip>` class supports recipes that build or package SIP-based
 Python bindings.
 
 .. _ref-classes-siteconfig:
@@ -2521,7 +2519,7 @@ Python bindings.
 ``siteconfig.bbclass``
 ======================
 
-The ``siteconfig`` class provides functionality for handling site
+The :ref:`siteconfig <ref-classes-siteconfig>` class provides functionality for handling site
 configuration. The class is used by the
 :ref:`autotools <ref-classes-autotools>` class to accelerate the
 :ref:`ref-tasks-configure` task.
@@ -2531,7 +2529,7 @@ configuration. The class is used by the
 ``siteinfo.bbclass``
 ====================
 
-The ``siteinfo`` class provides information about the targets that might
+The :ref:`siteinfo <ref-classes-siteinfo>` class provides information about the targets that might
 be needed by other classes or recipes.
 
 As an example, consider Autotools, which can require tests that must
@@ -2552,7 +2550,7 @@ The class also provides variables like :term:`SITEINFO_ENDIANNESS` and
 ``sstate.bbclass``
 ==================
 
-The ``sstate`` class provides support for Shared State (sstate). By
+The :ref:`sstate <ref-classes-sstate>` class provides support for Shared State (sstate). By
 default, the class is enabled through the
 :term:`INHERIT_DISTRO` variable's default value.
 
@@ -2565,7 +2563,7 @@ section in the Yocto Project Overview and Concepts Manual.
 ``staging.bbclass``
 ===================
 
-The ``staging`` class installs files into individual recipe work
+The :ref:`staging <ref-classes-staging>` class installs files into individual recipe work
 directories for sysroots. The class contains the following key tasks:
 
 -  The :ref:`ref-tasks-populate_sysroot` task,
@@ -2578,7 +2576,7 @@ directories for sysroots. The class contains the following key tasks:
    installs the files into the individual recipe work directories (i.e.
    :term:`WORKDIR`).
 
-The code in the ``staging`` class is complex and basically works in two
+The code in the :ref:`staging <ref-classes-staging>` class is complex and basically works in two
 stages:
 
 -  *Stage One:* The first stage addresses recipes that have files they
@@ -2665,7 +2663,7 @@ stages:
 ``syslinux.bbclass``
 ====================
 
-The ``syslinux`` class provides syslinux-specific functions for building
+The :ref:`syslinux <ref-classes-syslinux>` class provides syslinux-specific functions for building
 bootable images.
 
 The class supports the following variables:
@@ -2708,7 +2706,7 @@ The class supports the following variables:
 ``systemd.bbclass``
 ===================
 
-The ``systemd`` class provides support for recipes that install systemd
+The :ref:`systemd <ref-classes-systemd>` class provides support for recipes that install systemd
 unit files.
 
 The functionality for this class is disabled unless you have "systemd"
@@ -2734,7 +2732,7 @@ Services are set up to start on boot automatically
 unless you have set
 :term:`SYSTEMD_AUTO_ENABLE` to "disable".
 
-For more information on ``systemd``, see the
+For more information on :ref:`systemd <ref-classes-systemd>`, see the
 ":ref:`dev-manual/common-tasks:selecting an initialization manager`"
 section in the Yocto Project Development Tasks Manual.
 
@@ -2743,17 +2741,17 @@ section in the Yocto Project Development Tasks Manual.
 ``systemd-boot.bbclass``
 ========================
 
-The ``systemd-boot`` class provides functions specific to the
+The :ref:`systemd-boot <ref-classes-systemd-boot>` class provides functions specific to the
 systemd-boot bootloader for building bootable images. This is an
 internal class and is not intended to be used directly.
 
 .. note::
 
-   The ``systemd-boot`` class is a result from merging the ``gummiboot`` class
+   The :ref:`systemd-boot <ref-classes-systemd-boot>` class is a result from merging the ``gummiboot`` class
    used in previous Yocto Project releases with the ``systemd`` project.
 
 Set the :term:`EFI_PROVIDER` variable to
-"systemd-boot" to use this class. Doing so creates a standalone EFI
+":ref:`systemd-boot <ref-classes-systemd-boot>`" to use this class. Doing so creates a standalone EFI
 bootloader that is not dependent on systemd.
 
 For information on more variables used and supported in this class, see
@@ -2770,16 +2768,16 @@ for more information.
 ``terminal.bbclass``
 ====================
 
-The ``terminal`` class provides support for starting a terminal session.
+The :ref:`terminal <ref-classes-terminal>` class provides support for starting a terminal session.
 The :term:`OE_TERMINAL` variable controls which
 terminal emulator is used for the session.
 
-Other classes use the ``terminal`` class anywhere a separate terminal
+Other classes use the :ref:`terminal <ref-classes-terminal>` class anywhere a separate terminal
 session needs to be started. For example, the
 :ref:`patch <ref-classes-patch>` class assuming
 :term:`PATCHRESOLVE` is set to "user", the
 :ref:`cml1 <ref-classes-cml1>` class, and the
-:ref:`devshell <ref-classes-devshell>` class all use the ``terminal``
+:ref:`devshell <ref-classes-devshell>` class all use the :ref:`terminal <ref-classes-terminal>`
 class.
 
 .. _ref-classes-testimage:
@@ -2787,7 +2785,7 @@ class.
 ``testimage.bbclass``
 =====================
 
-The ``testimage`` class supports running automated tests against
+The :ref:`testimage <ref-classes-testimage>` class supports running automated tests against
 images using QEMU and on actual hardware. The classes handle loading the
 tests and starting the image. To use the classes, you need to perform
 steps to set up the environment.
@@ -2799,7 +2797,7 @@ To enable this class, add the following to your configuration::
 The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.
 
-The ``testimage`` class runs tests on an image when called using the
+The :ref:`testimage <ref-classes-testimage>` class runs tests on an image when called using the
 following::
 
    $ bitbake -c testimage image
@@ -2819,7 +2817,7 @@ section in the Yocto Project Development Tasks Manual.
 ===================
 
 This class supports running automated tests against software development
-kits (SDKs). The ``testsdk`` class runs tests on an SDK when called
+kits (SDKs). The :ref:`testsdk <ref-classes-testsdk>` class runs tests on an SDK when called
 using the following::
 
    $ bitbake -c testsdk image
@@ -2827,7 +2825,7 @@ using the following::
 .. note::
 
    Best practices include using :term:`IMAGE_CLASSES` rather than
-   :term:`INHERIT` to inherit the ``testsdk`` class for automated SDK
+   :term:`INHERIT` to inherit the :ref:`testsdk <ref-classes-testsdk>` class for automated SDK
    testing.
 
 .. _ref-classes-texinfo:
@@ -2853,7 +2851,7 @@ host system.
 ``toaster.bbclass``
 ===================
 
-The ``toaster`` class collects information about packages and images and
+The :ref:`toaster <ref-classes-toaster>` class collects information about packages and images and
 sends them as events that the BitBake user interface can receive. The
 class is enabled when the Toaster user interface is running.
 
@@ -2864,7 +2862,7 @@ This class is not intended to be used directly.
 ``toolchain-scripts.bbclass``
 =============================
 
-The ``toolchain-scripts`` class provides the scripts used for setting up
+The :ref:`toolchain-scripts <ref-classes-toolchain-scripts>` class provides the scripts used for setting up
 the environment for installed SDKs.
 
 .. _ref-classes-typecheck:
@@ -2872,7 +2870,7 @@ the environment for installed SDKs.
 ``typecheck.bbclass``
 =====================
 
-The ``typecheck`` class provides support for validating the values of
+The :ref:`typecheck <ref-classes-typecheck>` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
 variable using the "type" varflag. Here is an example::
@@ -2884,7 +2882,7 @@ variable using the "type" varflag. Here is an example::
 ``uboot-config.bbclass``
 ========================
 
-The ``uboot-config`` class provides support for U-Boot configuration for
+The :ref:`uboot-config <ref-classes-uboot-config>` class provides support for U-Boot configuration for
 a machine. Specify the machine in your recipe as follows::
 
    UBOOT_CONFIG ??= <default>
@@ -2915,7 +2913,7 @@ yourself, publish the resulting tarball (e.g. via HTTP) and set
 ``UNINATIVE_URL`` and ``UNINATIVE_CHECKSUM`` appropriately. For an
 example, see the ``meta/conf/distro/include/yocto-uninative.inc``.
 
-The ``uninative`` class is also used unconditionally by the extensible
+The :ref:`uninative <ref-classes-uninative>` class is also used unconditionally by the extensible
 SDK. When building the extensible SDK, ``uninative-tarball`` is built
 and the resulting tarball is included within the SDK.
 
@@ -2924,12 +2922,12 @@ and the resulting tarball is included within the SDK.
 ``update-alternatives.bbclass``
 ===============================
 
-The ``update-alternatives`` class helps the alternatives system when
+The :ref:`update-alternatives <ref-classes-update-alternatives>` class helps the alternatives system when
 multiple sources provide the same command. This situation occurs when
 several programs that have the same or similar function are installed
 with the same name. For example, the ``ar`` command is available from
 the ``busybox``, ``binutils`` and ``elfutils`` packages. The
-``update-alternatives`` class handles renaming the binaries so that
+:ref:`update-alternatives <ref-classes-update-alternatives>` class handles renaming the binaries so that
 multiple packages can be installed without conflicts. The ``ar`` command
 still works regardless of which packages are installed or subsequently
 removed. The class renames the conflicting binary in each package and
@@ -2962,7 +2960,7 @@ file.
 ``update-rc.d.bbclass``
 =======================
 
-The ``update-rc.d`` class uses ``update-rc.d`` to safely install an
+The :ref:`update-rc.d <ref-classes-update-rc.d>` class uses ``update-rc.d`` to safely install an
 initialization script on behalf of the package. The OpenEmbedded build
 system takes care of details such as making sure the script is stopped
 before a package is removed and started when the package is installed.
@@ -2976,7 +2974,7 @@ for details.
 ``useradd*.bbclass``
 ====================
 
-The ``useradd*`` classes support the addition of users or groups for
+The :ref:`useradd* <ref-classes-useradd>` classes support the addition of users or groups for
 usage by the package on the target. For example, if you have packages
 that contain system services that should be run under their own user or
 group, you can use these classes to enable creation of the user or
@@ -2985,16 +2983,16 @@ group. The :oe_git:`meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
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
 
@@ -3020,7 +3018,7 @@ additional information.
 
 .. note::
 
-   You do not use the ``useradd-staticids`` class directly. You either enable
+   You do not use the :ref:`useradd-staticids <ref-classes-useradd>` class directly. You either enable
    or disable the class by setting the :term:`USERADDEXTENSION` variable. If you
    enable or disable the class in a configured system, :term:`TMPDIR` might
    contain incorrect ``uid`` and ``gid`` values. Deleting the :term:`TMPDIR`
@@ -3031,7 +3029,7 @@ additional information.
 ``utility-tasks.bbclass``
 =========================
 
-The ``utility-tasks`` class provides support for various "utility" type
+The :ref:`utility-tasks <ref-classes-utility-tasks>` class provides support for various "utility" type
 tasks that are applicable to all recipes, such as
 :ref:`ref-tasks-clean` and
 :ref:`ref-tasks-listtasks`.
@@ -3044,7 +3042,7 @@ This class is enabled by default because it is inherited by the
 ``utils.bbclass``
 =================
 
-The ``utils`` class provides some useful Python functions that are
+The :ref:`utils <ref-classes-utils>` class provides some useful Python functions that are
 typically used in inline Python expressions (e.g. ``${@...}``). One
 example use is for ``bb.utils.contains()``.
 
@@ -3056,7 +3054,7 @@ This class is enabled by default because it is inherited by the
 ``vala.bbclass``
 ================
 
-The ``vala`` class supports recipes that need to build software written
+The :ref:`vala <ref-classes-vala>` class supports recipes that need to build software written
 using the Vala programming language.
 
 .. _ref-classes-waf:
@@ -3064,7 +3062,7 @@ using the Vala programming language.
 ``waf.bbclass``
 ===============
 
-The ``waf`` class supports recipes that need to build software that uses
+The :ref:`waf <ref-classes-waf>` class supports recipes that need to build software that uses
 the Waf build system. You can use the
 :term:`EXTRA_OECONF` or
 :term:`PACKAGECONFIG_CONFARGS` variables
-- 
2.34.1


