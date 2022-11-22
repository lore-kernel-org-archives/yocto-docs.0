Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1960C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 14:12:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.19940.1669126348548717998
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 06:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=db+BGn8I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6BA591C000A;
	Tue, 22 Nov 2022 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669126346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OM4lI+xQW58uSDQEDZUATbzelUeTeUIaSiQOLPFmRQo=;
	b=db+BGn8Iwwc2jh01Zd9/C/zPZ0IB8DX3SAO2ryc8QMXvDWqsfjmNA2uKe6jUGXMtbf9Gt4
	eFXgz2l62fe3T6UxGvJginvvrNB19xQpNBL0n2tXnrJVgDVyVZnAYca6IviI8SJtcD3UFq
	zYRGDuf3MFB9PIDO61rMR95DayMY7E6JQOou0Crr07awuzOICpQRngQvziDRrSFRsxbLBJ
	i0q6+GXr99Rqj0jqL6jMQRz8z5YQAtL5j6RwemBUOV2jJpytno5ZATO+ytd+x6g6ADZf/K
	nuFFQ8wU+DLBh188e91qBe+Ve5At+gzdCUDAOwYWeIz4Om2Gg54eZx3dLhhnig==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 1/3] manuals: add missing references to classes
Date: Tue, 22 Nov 2022 15:12:15 +0100
Message-Id: <20221122141217.97681-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Nov 2022 14:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3496

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Sometimes fixing line length in modified paragraphs too.

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst     |  30 +++--
 .../migration-guides/migration-1.3.rst        |  21 ++-
 .../migration-guides/migration-1.5.rst        |   5 +
 .../migration-guides/migration-1.6.rst        |   9 +-
 .../migration-guides/migration-1.8.rst        |   6 +-
 .../migration-guides/migration-2.1.rst        |   8 +-
 .../migration-guides/migration-2.3.rst        |  21 ++-
 .../migration-guides/migration-2.6.rst        |  12 +-
 .../migration-guides/migration-3.0.rst        |   4 +-
 .../migration-guides/migration-3.2.rst        |   8 +-
 .../migration-guides/migration-3.3.rst        |  16 ++-
 .../migration-guides/migration-3.4.rst        |   2 +-
 .../migration-guides/migration-general.rst    |  21 +--
 .../migration-guides/release-notes-3.4.rst    |   6 +-
 .../migration-guides/release-notes-4.0.rst    |  15 ++-
 .../migration-guides/release-notes-4.1.rst    |   9 +-
 documentation/overview-manual/concepts.rst    |   2 +-
 documentation/ref-manual/classes.rst          |  13 +-
 documentation/ref-manual/structure.rst        |   3 +-
 documentation/ref-manual/variables.rst        | 125 +++++++++---------
 .../test-manual/understand-autobuilder.rst    |   2 +-
 21 files changed, 182 insertions(+), 156 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b9c467526a..96a6a76180 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1855,9 +1855,10 @@ Here are some common issues that cause failures.
    ":ref:`dev-manual/common-tasks:debugging parallel make races`" section.
 
 -  *Improper host path usage:* This failure applies to recipes building
-   for the target or ``nativesdk`` only. The failure occurs when the
-   compilation process uses improper headers, libraries, or other files
-   from the host system when cross-compiling for the target.
+   for the target or ":ref:`nativesdk <ref-classes-nativesdk>`" only. The
+   failure occurs when the compilation process uses improper headers,
+   libraries, or other files from the host system when cross-compiling for
+   the target.
 
    To fix the problem, examine the ``log.do_compile`` file to identify
    the host paths being used (e.g. ``/usr/include``, ``/usr/lib``, and
@@ -3404,7 +3405,7 @@ form of a patch all using Quilt.
 .. note::
 
    With regard to preserving changes to source files, if you clean a
-   recipe or have ``rm_work`` enabled, the
+   recipe or have :ref:`rm_work <ref-classes-rm-work>` enabled, the
    :ref:`devtool workflow <sdk-manual/extensible:using \`\`devtool\`\` in your sdk workflow>`
    as described in the Yocto Project Application Development and the
    Extensible Software Development Kit (eSDK) manual is a safer
@@ -3450,11 +3451,11 @@ Follow these general steps:
    .. note::
 
       All the modifications you make to the temporary source code disappear
-      once you run the :ref:`ref-tasks-clean` or :ref:`ref-tasks-cleanall` tasks using BitBake
-      (i.e. ``bitbake -c clean package`` and ``bitbake -c cleanall package``).
-      Modifications will also disappear if you use the ``rm_work`` feature as
-      described in the
-      ":ref:`dev-manual/common-tasks:conserving disk space during builds`"
+      once you run the :ref:`ref-tasks-clean` or :ref:`ref-tasks-cleanall`
+      tasks using BitBake (i.e. ``bitbake -c clean package`` and
+      ``bitbake -c cleanall package``). Modifications will also disappear if
+      you use the :ref:`rm_work <ref-classes-rm-work>` feature as described in
+      the ":ref:`dev-manual/common-tasks:conserving disk space during builds`"
       section.
 
 7. *Generate the Patch:* Once your changes work as expected, you need to
@@ -7143,7 +7144,8 @@ Lighttpd, or Nginx), take the appropriate steps to do so.
 From within the :term:`Build Directory` where you have built an image based on
 your packaging choice (i.e. the :term:`PACKAGE_CLASSES` setting), simply start
 the server. The following example assumes a :term:`Build Directory` of ``poky/build``
-and a :term:`PACKAGE_CLASSES` setting of "package_rpm"::
+and a :term:`PACKAGE_CLASSES` setting of
+":ref:`package_rpm <ref-classes-package_rpm>`"::
 
    $ cd poky/build/tmp/deploy/rpm
    $ python3 -m http.server
@@ -7491,8 +7493,8 @@ test. Here is what you have to do for each recipe:
    special configurations prior to compiling the test code, you must
    insert a ``do_configure_ptest`` function into the recipe.
 
--  *Install the test suite:* The ``ptest`` class automatically copies
-   the file ``run-ptest`` to the target and then runs make
+-  *Install the test suite:* The :ref:`ptest <ref-classes-ptest>` class
+   automatically copies the file ``run-ptest`` to the target and then runs make
    ``install-ptest`` to run the tests. If this is not enough, you need
    to create a ``do_install_ptest`` function and make sure it gets
    called after the "make install-ptest" completes.
@@ -11237,7 +11239,7 @@ an :ref:`archiver <ref-classes-archiver>` class to
 help avoid some of these concerns.
 
 Before you employ :term:`DL_DIR` or the :ref:`archiver <ref-classes-archiver>` class, you need to
-decide how you choose to provide source. The source ``archiver`` class
+decide how you choose to provide source. The source :ref:`archiver <ref-classes-archiver>` class
 can generate tarballs and SRPMs and can create them with various levels
 of compliance in mind.
 
@@ -11325,7 +11327,7 @@ generation are included on your image.
    adds a separate package and an upgrade path for adding licenses to an
    image.
 
-As the source ``archiver`` class has already archived the original
+As the source :ref:`archiver <ref-classes-archiver>` class has already archived the original
 unmodified source that contains the license files, you would have
 already met the requirements for inclusion of the license information
 with source as defined by the GPL and other open source licenses.
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 3ba189b773..a135574744 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -91,11 +91,11 @@ consistency.
 nativesdk
 ~~~~~~~~~
 
-The suffix ``nativesdk`` is now implemented as a prefix, which
-simplifies a lot of the packaging code for ``nativesdk`` recipes. All
-custom ``nativesdk`` recipes, which are relocatable packages that are
-native to :term:`SDK_ARCH`, and any references need to
-be updated to use ``nativesdk-*`` instead of ``*-nativesdk``.
+The suffix ``nativesdk`` is now implemented as a prefix, which simplifies a
+lot of the packaging code for :ref:`nativesdk <ref-classes-nativesdk>` recipes.
+All custom :ref:`nativesdk <ref-classes-nativesdk>` recipes, which are
+relocatable packages that are native to :term:`SDK_ARCH`, and any references
+need to be updated to use ``nativesdk-*`` instead of ``*-nativesdk``.
 
 .. _migration-1.3-task-recipes:
 
@@ -109,12 +109,11 @@ automatic upgrade path for most packages. However, you should update
 references in your own recipes and configurations as they could be
 removed in future releases. You should also rename any custom ``task-*``
 recipes to ``packagegroup-*``, and change them to inherit
-``packagegroup`` instead of ``task``, as well as taking the opportunity
-to remove anything now handled by :ref:`ref-classes-packagegroup`, such as
-providing ``-dev`` and ``-dbg`` packages, setting
-:term:`LIC_FILES_CHKSUM`, and so forth. See the
-:ref:`ref-classes-packagegroup` section for
-further details.
+:ref:`packagegroup <ref-classes-packagegroup>` instead of ``task``, as well
+as taking the opportunity to remove anything now handled by
+:ref:`ref-classes-packagegroup`, such as providing ``-dev`` and ``-dbg``
+packages, setting :term:`LIC_FILES_CHKSUM`, and so forth. See the
+:ref:`ref-classes-packagegroup` section for further details.
 
 .. _migration-1.3-image-features:
 
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 70a087ff1a..b47980dc67 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -130,6 +130,11 @@ The following directory changes exist:
    it easier to delete :term:`TMPDIR` and preserve the build history.
    Additionally, data for produced SDKs is now split by :term:`IMAGE_NAME`.
 
+-  When :ref:`buildhistory <ref-classes-buildhistory>` is enabled, its output
+   is now written under the :term:`Build Directory` rather than :term:`TMPDIR`.
+   Doing so makes it easier to delete :term:`TMPDIR` and preserve the build
+   history. Additionally, data for produced SDKs is now split by :term:`IMAGE_NAME`.
+
 -  The ``pkgdata`` directory produced as part of the packaging process
    has been collapsed into a single machine-specific directory. This
    directory is located under ``sysroots`` and uses a machine-specific
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index d3de264650..d07731dcb0 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -220,9 +220,10 @@ Package Test (ptest)
 
 Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
-":ref:`dev-manual/common-tasks:testing packages with ptest`"
-section in the Yocto Project Development Tasks Manual. For information on the
-``ptest`` class, see the ":ref:`ref-classes-ptest`" section.
+":ref:`dev-manual/common-tasks:testing packages with ptest`" section in the
+Yocto Project Development Tasks Manual. For information on the
+:ref:`ptest <ref-classes-ptest>` class, see the ":ref:`ref-classes-ptest`"
+section.
 
 .. _migration-1.6-build-changes:
 
@@ -237,7 +238,7 @@ will enable a separate :term:`Build Directory` by default as well. Recipes
 building Autotools-based software that fails to build with a separate
 :term:`Build Directory` should be changed to inherit from the
 :ref:`autotools-brokensep <ref-classes-autotools>` class instead of
-the ``autotools`` or ``autotools_stage``\ classes.
+the :ref:`autotools <ref-classes-autotools>` or ``autotools_stage`` classes.
 
 .. _migration-1.6-building-qemu-native:
 
diff --git a/documentation/migration-guides/migration-1.8.rst b/documentation/migration-guides/migration-1.8.rst
index f058029b30..35a2a21e5b 100644
--- a/documentation/migration-guides/migration-1.8.rst
+++ b/documentation/migration-guides/migration-1.8.rst
@@ -76,15 +76,15 @@ particular, users need to ensure that ``${S}`` (source files) and
 ``${B}`` (build artifacts) are used correctly in functions such as
 :ref:`ref-tasks-configure` and
 :ref:`ref-tasks-install`. For kernel recipes that do not
-inherit from ``kernel-yocto`` or include ``linux-yocto.inc``, you might
+inherit from :ref:`kernel-yocto <ref-classes-kernel-yocto>` or include ``linux-yocto.inc``, you might
 wish to refer to the ``linux.inc`` file in the ``meta-oe`` layer for the
 kinds of changes you need to make. For reference, here is the
 :oe_git:`commit </meta-openembedded/commit/meta-oe/recipes-kernel/linux/linux.inc?id=fc7132ede27ac67669448d3d2845ce7d46c6a1ee>`
 where the ``linux.inc`` file in ``meta-oe`` was updated.
 
 Recipes that rely on the kernel source code and do not inherit the
-module classes might need to add explicit dependencies on the
-:ref:`ref-tasks-shared_workdir` kernel task, for example::
+:ref:`module <ref-classes-module>` classes might need to add explicit
+dependencies on the :ref:`ref-tasks-shared_workdir` kernel task, for example::
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
diff --git a/documentation/migration-guides/migration-2.1.rst b/documentation/migration-guides/migration-2.1.rst
index c19ba5501c..f045feadff 100644
--- a/documentation/migration-guides/migration-2.1.rst
+++ b/documentation/migration-guides/migration-2.1.rst
@@ -64,7 +64,7 @@ Makefile Environment Changes
 :term:`EXTRA_OEMAKE` now defaults to "" instead of
 "-e MAKEFLAGS=". Setting :term:`EXTRA_OEMAKE` to "-e MAKEFLAGS=" by default
 was a historical accident that has required many classes (e.g.
-``autotools``, ``module``) and recipes to override this default in order
+:ref:`autotools <ref-classes-autotools>`, ``module``) and recipes to override this default in order
 to work with sensible build systems. When upgrading to the release, you
 must edit any recipe that relies upon this old default by either setting
 :term:`EXTRA_OEMAKE` back to "-e MAKEFLAGS=" or by explicitly setting any
@@ -191,7 +191,7 @@ The following classes have changed:
 -  ``autotools_stage``: Removed because the
    :ref:`autotools <ref-classes-autotools>` class now provides its
    functionality. Recipes that inherited from ``autotools_stage`` should
-   now inherit from ``autotools`` instead.
+   now inherit from :ref:`autotools <ref-classes-autotools>` instead.
 
 -  ``boot-directdisk``: Merged into the ``image-vm`` class. The
    ``boot-directdisk`` class was rarely directly used. Consequently,
@@ -401,9 +401,9 @@ These additional changes exist:
    as these directories are automatically found and added.
 
 -  Inaccurate disk and CPU percentage data has been dropped from
-   ``buildstats`` output. This data has been replaced with
+   :ref:`buildstats <ref-classes-buildstats>` output. This data has been replaced with
    ``getrusage()`` data and corrected IO statistics. You will probably
-   need to update any custom code that reads the ``buildstats`` data.
+   need to update any custom code that reads the :ref:`buildstats <ref-classes-buildstats>` data.
 
 -  The ``meta/conf/distro/include/package_regex.inc`` is now deprecated.
    The contents of this file have been moved to individual recipes.
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index d49ed474ca..4a1f159e92 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -481,9 +481,9 @@ The following miscellaneous changes have occurred:
    is an unnecessary burden.
 
    If you need to preserve these ``.la`` files (e.g. in a custom
-   distribution), you must change
-   :term:`INHERIT_DISTRO` such that
-   "remove-libtool" is not included in the value.
+   distribution), you must change :term:`INHERIT_DISTRO` such that
+   ":ref:`remove-libtool <ref-classes-remove-libtool>`" is not included
+   in the value.
 
 -  Extensible SDKs built for GCC 5+ now refuse to install on a
    distribution where the host GCC version is 4.8 or 4.9. This change
@@ -492,18 +492,17 @@ The following miscellaneous changes have occurred:
    the :ref:`uninative <ref-classes-uninative>` class for additional
    information.
 
--  All native and nativesdk recipes now use a separate
+-  All :ref:`native <ref-classes-native>` and
+   :ref:`nativesdk <ref-classes-nativesdk>` recipes now use a separate
    :term:`DISTRO_FEATURES` value instead of sharing the value used by
    recipes for the target, in order to avoid unnecessary rebuilds.
 
-   The :term:`DISTRO_FEATURES` for ``native`` recipes is
-   :term:`DISTRO_FEATURES_NATIVE` added to
-   an intersection of :term:`DISTRO_FEATURES` and
-   :term:`DISTRO_FEATURES_FILTER_NATIVE`.
+   The :term:`DISTRO_FEATURES` for :ref:`native <ref-classes-native>` recipes
+   is :term:`DISTRO_FEATURES_NATIVE` added to an intersection of
+   :term:`DISTRO_FEATURES` and :term:`DISTRO_FEATURES_FILTER_NATIVE`.
 
-   For nativesdk recipes, the corresponding variables are
-   :term:`DISTRO_FEATURES_NATIVESDK`
-   and
+   For :ref:`nativesdk <ref-classes-nativesdk>` recipes, the corresponding
+   variables are :term:`DISTRO_FEATURES_NATIVESDK` and
    :term:`DISTRO_FEATURES_FILTER_NATIVESDK`.
 
 -  The ``FILESDIR`` variable, which was previously deprecated and rarely
diff --git a/documentation/migration-guides/migration-2.6.rst b/documentation/migration-guides/migration-2.6.rst
index eedede2457..59592997ff 100644
--- a/documentation/migration-guides/migration-2.6.rst
+++ b/documentation/migration-guides/migration-2.6.rst
@@ -128,7 +128,8 @@ missing from :term:`DEPENDS`).
 
    This change affects classes beyond just the two mentioned (i.e.
    ``distutils`` and ``distutils3``). Any recipe that inherits ``distutils*``
-   classes are affected. For example, the ``setuptools`` and ``setuptools3``
+   classes are affected. For example, the ``setuptools`` and
+   :ref:`setuptools3 <ref-classes-setuptools3>`
    recipes are affected since they inherit the ``distutils*`` classes.
 
 Fetching these types of dependencies that are not provided in the
@@ -315,13 +316,12 @@ This section provides information about automatic testing changes:
    exists and has been replaced by the
    :term:`TESTIMAGE_AUTO` variable.
 
--  Inheriting the ``testimage`` and ``testsdk`` Classes: Best
-   practices now dictate that you use the
-   :term:`IMAGE_CLASSES` variable rather than the
+-  Inheriting the :ref:`testimage <ref-classes-testimage>` and
+   :ref:`testsdk <ref-classes-testsdk>` classes: best practices now dictate
+   that you use the :term:`IMAGE_CLASSES` variable rather than the
    :term:`INHERIT` variable when you inherit the
    :ref:`testimage <ref-classes-testimage>` and
-   :ref:`testsdk <ref-classes-testsdk>` classes used for automatic
-   testing.
+   :ref:`testsdk <ref-classes-testsdk>` classes used for automatic testing.
 
 .. _migration-2.6-openssl-changes:
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 90736e6009..95a33d4dd4 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -282,8 +282,8 @@ The following miscellaneous changes have occurred.
 -  You must change the host distro identifier used in
    :term:`NATIVELSBSTRING` to use all lowercase
    characters even if it does not contain a version number. This change
-   is necessary only if you are not using ``uninative`` and
-   :term:`SANITY_TESTED_DISTROS`.
+   is necessary only if you are not using
+   :ref:`uninative <ref-classes-uninative>` and :term:`SANITY_TESTED_DISTROS`.
 
 -  In the ``base-files`` recipe, writing the hostname into
    ``/etc/hosts`` and ``/etc/hostname`` is now done within the main
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index a714bd6bca..630d5c2b94 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -217,7 +217,13 @@ Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` cla
 Custom SDK / SDK-style recipes need to include ``nativesdk-sdk-provides-dummy``
 -------------------------------------------------------------------------------
 
-All ``nativesdk`` packages require ``/bin/sh`` due to their postinstall scriptlets, thus this package has to be dummy-provided within the SDK and ``nativesdk-sdk-provides-dummy`` now does this. If you have a custom SDK recipe (or your own SDK-style recipe similar to e.g. ``buildtools-tarball``), you will need to ensure ``nativesdk-sdk-provides-dummy`` or an equivalent is included in :term:`TOOLCHAIN_HOST_TASK`.
+All :ref:`nativesdk <ref-classes-nativesdk>` packages require ``/bin/sh`` due
+to their postinstall scriptlets, thus this package has to be dummy-provided
+within the SDK and ``nativesdk-sdk-provides-dummy`` now does this. If you have
+a custom SDK recipe (or your own SDK-style recipe similar to e.g.
+``buildtools-tarball``), you will need to ensure
+``nativesdk-sdk-provides-dummy`` or an equivalent is included in
+:term:`TOOLCHAIN_HOST_TASK`.
 
 
 ``ld.so.conf`` now moved back to main ``glibc`` package
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index aba5c4237c..d110aacd81 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -61,13 +61,15 @@ need to update those.
 New ``python3targetconfig`` class
 ---------------------------------
 
-A new :ref:`python3targetconfig <ref-classes-python3targetconfig>` class has been
-created for situations where you would previously have inherited the
-:ref:`python3native <ref-classes-python3native>` class but need access to target configuration data (such as
-correct installation directories). Recipes where this situation applies should
-be changed to inherit ``python3targetconfig`` instead of ``python3native``. This
-also adds a dependency on target ``python3``, so it should only be used where
-appropriate in order to avoid unnecessarily lengthening builds.
+A new :ref:`python3targetconfig <ref-classes-python3targetconfig>` class has
+been created for situations where you would previously have inherited the
+:ref:`python3native <ref-classes-python3native>` class but need access to
+target configuration data (such as correct installation directories). Recipes
+where this situation applies should be changed to inherit
+:ref:`python3targetconfig <ref-classes-python3targetconfig>` instead of
+:ref:`python3native <ref-classes-python3native>`. This also adds a dependency
+on target ``python3``, so it should only be used where appropriate in order to
+avoid unnecessarily lengthening builds.
 
 Some example recipes where this change has been made: ``gpgme``, ``libcap-ng``,
 ``python3-pycairo``.
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 4ceea7b0e4..ac4d08e051 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -124,7 +124,7 @@ Removed classes
 - ``image-mklibs``: not actively tested and upstream mklibs still
   requires Python 2
 - ``meta``: no longer useful. Recipes that need to skip installing
-  packages should inherit ``nopackages`` instead.
+  packages should inherit :ref:`nopackages <ref-classes-nopackages>` instead.
 
 Prelinking disabled by default
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index 847bdad739..8503017580 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -79,18 +79,19 @@ any new Yocto Project release.
    the migration (e.g. added/removed packages, added/removed files, size
    changes etc.). To do this, follow these steps:
 
-   1. Enable buildhistory before the migration
+   1. Enable :ref:`buildhistory <ref-classes-buildhistory>` before the migration
 
    2. Run a pre-migration build
 
-   3. Capture the buildhistory output (as specified by :term:`BUILDHISTORY_DIR`)
-      and ensure it is preserved for subsequent builds. How you would do this
-      depends on how you are running your builds - if you are doing this all on
-      one workstation in the same :term:`Build Directory` you may not need to do
-      anything other than not deleting the buildhistory output directory. For
-      builds in a pipeline it may be more complicated.
+   3. Capture the :ref:`buildhistory <ref-classes-buildhistory>` output (as
+      specified by :term:`BUILDHISTORY_DIR`) and ensure it is preserved for
+      subsequent builds. How you would do this depends on how you are running
+      your builds - if you are doing this all on one workstation in the same
+      :term:`Build Directory` you may not need to do anything other than not
+      deleting the :ref:`buildhistory <ref-classes-buildhistory>` output
+      directory. For builds in a pipeline it may be more complicated.
 
-   4. Set a tag in the buildhistory output (which is a git repository) before
+   4. Set a tag in the :ref:`buildhistory <ref-classes-buildhistory>` output (which is a git repository) before
       migration, to make the commit from the pre-migration build easy to find
       as you may end up running multiple builds during the migration.
 
@@ -99,7 +100,7 @@ any new Yocto Project release.
    6. Run a build
 
    7. Check the output changes between the previously set tag and HEAD in the
-      buildhistory output using ``git diff`` or ``buildhistory-diff``.
+      :ref:`buildhistory <ref-classes-buildhistory>` output using ``git diff`` or ``buildhistory-diff``.
 
-   For more information on using buildhistory, see
+   For more information on using :ref:`buildhistory <ref-classes-buildhistory>`, see
    :ref:`dev-manual/common-tasks:maintaining build output quality`.
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index 62683b4a5c..83ca901016 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -7,7 +7,7 @@ New Features / Enhancements in 3.4
 -  Linux kernel 5.14, glibc 2.34 and ~280 other recipe upgrades
 -  Switched override character to ':' (replacing '_') for more robust parsing and improved performance --- see the above migration guide for help
 -  Rust integrated into core, providing rust support for cross-compilation and SDK
--  New create-spdx class for creating SPDX SBoM documents
+-  New :ref:`create-spdx <ref-classes-create-spdx>` class for creating SPDX SBoM documents
 -  New recipes: cargo, core-image-ptest-all, core-image-ptest-fast, core-image-weston-sdk, erofs-utils, gcompat, gi-docgen, libmicrohttpd, libseccomp, libstd-rs, perlcross, python3-markdown, python3-pyyaml, python3-smartypants, python3-typogrify, rust, rust-cross, rust-cross-canadian, rust-hello-world, rust-llvm, rust-tools-cross-canadian, rustfmt, xwayland
 -  Several optimisations to reduce unnecessary task dependencies for faster builds
 -  seccomp integrated into core, with additional enabling for gnutls, systemd, qemu
@@ -68,7 +68,9 @@ New Features / Enhancements in 3.4
 -  SDK-related enhancements:
 
    -  Enable :ref:`ref-tasks-populate_sdk` with multilibs
-   -  New ``SDKPATHINSTALL`` variable decouples default install path from built in path to avoid rebuilding nativesdk components on e.g. :term:`DISTRO_VERSION` changes
+   -  New ``SDKPATHINSTALL`` variable decouples default install path from
+      built in path to avoid rebuilding :ref:`nativesdk <ref-classes-nativesdk>`
+      components on e.g. :term:`DISTRO_VERSION` changes
    -  eSDK: Error if trying to generate an eSDK from a multiconfig
    -  eSDK: introduce :term:`TOOLCHAIN_HOST_TASK_ESDK` to be used in place of :term:`TOOLCHAIN_HOST_TASK` to add components to the host part of the eSDK
 
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index d57227502e..3be7342a9c 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -8,9 +8,10 @@ New Features / Enhancements in 4.0
 
 - Linux kernel 5.15, glibc 2.35 and ~300 other recipe upgrades
 
-- Reproducibility: this release fixes the reproducibility issues with ``rust-llvm`` and
-  ``golang``. Recipes in OpenEmbedded-Core are now fully reproducible. Functionality
-  previously in the optional "reproducible" class has been merged into the base class.
+- Reproducibility: this release fixes the reproducibility issues with
+  ``rust-llvm`` and ``golang``. Recipes in OpenEmbedded-Core are now fully
+  reproducible. Functionality previously in the optional "reproducible"
+  class has been merged into the :ref:`base <ref-classes-base>` class.
 
 - Network access is now disabled by default for tasks other than where it is expected to ensure build integrity (where host kernel supports it)
 
@@ -215,7 +216,7 @@ New Features / Enhancements in 4.0
    - Ensure addition of patch-fuzz retriggers do_qa_patch
    - Added a sanity check for allarch packagegroups
 
-- create-spdx class improvements:
+- :ref:`create-spdx <ref-classes-create-spdx>` class improvements:
 
    - Get SPDX-License-Identifier from source files
    - Generate manifest also for SDKs
@@ -235,8 +236,10 @@ New Features / Enhancements in 4.0
    
 - SDK-related enhancements:
 
-   - Extended recipes to ``nativesdk``: ``cargo``, ``librsvg``, ``libstd-rs``, ``libva``, ``python3-docutil``, ``python3-packaging``
-   - Enabled nativesdk recipes to find a correct version of the rust cross compiler
+   - Extended recipes to :ref:`nativesdk <ref-classes-nativesdk>`: ``cargo``,
+     ``librsvg``, ``libstd-rs``, ``libva``, ``python3-docutil``, ``python3-packaging``
+   - Enabled :ref:`nativesdk <ref-classes-nativesdk>` recipes to find a correct version
+     of the rust cross compiler
    - Support creating per-toolchain cmake file in SDK
 
 - Rust enhancements:
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 119cc4fd2e..60402b6588 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -58,7 +58,7 @@ New Features / Enhancements in 4.1
 - Dependency of -dev package on main package is now an :term:`RRECOMMENDS` and can be easily set via new :term:`DEV_PKG_DEPENDENCY` variable
 
 - Support for CPU, I/O and memory pressure regulation in BitBake
-- Pressure data gathering in ``buildstats`` and rendering in ``pybootchartgui``
+- Pressure data gathering in :ref:`buildstats <ref-classes-buildstats>` and rendering in ``pybootchartgui``
 
 - New Picobuild system for lightweight Python PEP-517 build support in the :ref:`python_pep517 <ref-classes-python_pep517>` class
 
@@ -99,8 +99,8 @@ New Features / Enhancements in 4.1
    - :ref:`Support for using the regular build system as an SDK <sdk-manual/extensible:Setting up the Extensible SDK environment directly in a Yocto build>`
    - :ref:`image-buildinfo <ref-classes-image-buildinfo>` class now also writes build information to SDKs
    - New :term:`SDK_TOOLCHAIN_LANGS` variable to control support of rust / go in SDK
-   - rust-llvm: enabled nativesdk variant
-   - python3-pluggy: enabled for native/nativesdk
+   - rust-llvm: enabled :ref:`nativesdk <ref-classes-nativesdk>` variant
+   - python3-pluggy: enabled for :ref:`native <ref-classes-native>` / :ref:`nativesdk <ref-classes-nativesdk>`
 
 -  QEMU/runqemu enhancements:
 
@@ -113,7 +113,8 @@ New Features / Enhancements in 4.1
    - New variable :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
    - New variable :term:`FIT_PAD_ALG` to control FIT image padding algorithm
    - New :term:`KERNEL_DEPLOY_DEPEND` variable to allow disabling image dependency on deploying the kernel
-   - image_types: isolate the write of UBI configuration to a ``write_ubi_config`` function that can be easily overridden
+   - :ref:`image_types <ref-classes-image_types>`: isolate the write of UBI
+     configuration to a ``write_ubi_config`` function that can be easily overridden
 
 - openssh: add support for config snippet includes to ssh and sshd
 - :ref:`create-spdx <ref-classes-create-spdx>`: Add ``SPDX_PRETTY`` option
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index c495e4cc41..386a9e09d5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -921,7 +921,7 @@ the analysis and package splitting process use several areas:
 -  :term:`STAGING_DIR_TARGET`:
    The path for the sysroot used when a component that is built to
    execute on a system and it generates code for yet another machine
-   (e.g. cross-canadian recipes).
+   (e.g. :ref:`cross-canadian <ref-classes-cross-canadian>` recipes).
 
 The :term:`FILES` variable defines the
 files that go into each package in
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index ffa3e50ab6..3a13cf56ef 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1406,7 +1406,7 @@ an optional Initramfs bundle, an optional RAM disk, and any number of
 device tree.
 
 To create a FIT image, it is required that :term:`KERNEL_CLASSES`
-is set to include "kernel-fitimage" and :term:`KERNEL_IMAGETYPE`
+is set to include ":ref:`kernel-fitimage <ref-classes-kernel-fitimage>`" and :term:`KERNEL_IMAGETYPE`
 is set to "fitImage".
 
 The options for the device tree compiler passed to ``mkimage -D``
@@ -2566,11 +2566,12 @@ uses these build systems, the recipe needs to inherit the :ref:`setuptools3 <ref
 ``setuptools3_legacy.bbclass``
 ==============================
 
-The :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` class supports Python version 3.x extensions that use
-build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and have
-not migrated to the official ``pyproject.toml`` format). Unlike
-``setuptools3.bbclass``, this uses the traditional ``setup.py`` ``build`` and
-``install`` commands and not wheels. This use of ``setuptools`` like this is
+The :ref:`setuptools3_legacy <ref-classes-setuptools3_legacy>` class supports
+Python version 3.x extensions that use build systems based on ``setuptools``
+(e.g. only have a ``setup.py`` and have not migrated to the official
+``pyproject.toml`` format). Unlike :ref:`setuptools3 <ref-classes-setuptools3>`,
+this uses the traditional ``setup.py`` ``build`` and ``install`` commands and
+not wheels. This use of ``setuptools`` like this is
 `deprecated <https://github.com/pypa/setuptools/blob/main/CHANGES.rst#v5830>`__
 but still relatively common.
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 8b08f88969..5436d94e1d 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -374,7 +374,8 @@ remove the ``build/sstate-cache`` directory.
 ``build/tmp/buildstats/``
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
-This directory stores the build statistics.
+This directory stores the build statistics as generated by the
+:ref:`buildstats <ref-classes-buildstats>` class.
 
 .. _structure-build-tmp-cache:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d3aae63308..ca62365cc3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -203,8 +203,9 @@ system and gives an overview of their function and contents.
       packages should be checked for libraries and renamed according to
       Debian library package naming.
 
-      The default value is "${PACKAGES}", which causes the debian class to
-      act on all packages that are explicitly generated by the recipe.
+      The default value is "${PACKAGES}", which causes the
+      :ref:`debian <ref-classes-debian>` class to act on all packages that are
+      explicitly generated by the recipe.
 
    :term:`AUTOREV`
       When :term:`SRCREV` is set to the value of this variable, it specifies to
@@ -576,9 +577,9 @@ system and gives an overview of their function and contents.
       ``quilt-native``, which is a copy of Quilt built to run on the build
       system; "crosses" such as ``gcc-cross``, which is a compiler built to
       run on the build machine but produces binaries that run on the target
-      :term:`MACHINE`; "nativesdk", which targets the SDK
-      machine instead of :term:`MACHINE`; and "mulitlibs" in the form
-      "``multilib:``\ multilib_name".
+      :term:`MACHINE`; ":ref:`nativesdk <ref-classes-nativesdk>`", which
+      targets the SDK machine instead of :term:`MACHINE`; and "mulitlibs" in
+      the form "``multilib:``\ multilib_name".
 
       To build a different variant of the recipe with a minimal amount of
       code, it usually is as simple as adding the following to your recipe::
@@ -906,7 +907,7 @@ system and gives an overview of their function and contents.
       The toolchain binary prefix used for native recipes. The OpenEmbedded
       build system uses the :term:`BUILD_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building for
-      ``native`` recipes.
+      :ref:`native <ref-classes-native>` recipes.
 
    :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from
@@ -917,7 +918,7 @@ system and gives an overview of their function and contents.
    :term:`BUILD_SYS`
       Specifies the system, including the architecture and the operating
       system, to use when building for the build host (i.e. when building
-      ``native`` recipes).
+      :ref:`native <ref-classes-native>` recipes).
 
       The OpenEmbedded build system automatically sets this variable based
       on :term:`BUILD_ARCH`,
@@ -1417,8 +1418,10 @@ system and gives an overview of their function and contents.
    :term:`COPYLEFT_RECIPE_TYPES`
       A space-separated list of recipe types to include in the source
       archived by the :ref:`archiver <ref-classes-archiver>` class.
-      Recipe types are ``target``, ``native``, ``nativesdk``, ``cross``,
-      ``crosssdk``, and ``cross-canadian``.
+      Recipe types are ``target``, :ref:`native <ref-classes-native>`,
+      :ref:`nativesdk <ref-classes-nativesdk>`,
+      :ref:`cross <ref-classes-cross>`, :ref:`crosssdk <ref-classes-crosssdk>`,
+      and :ref:`cross-canadian <ref-classes-cross-canadian>`.
 
       The default value, which is "target*", for :term:`COPYLEFT_RECIPE_TYPES`
       is set by the :ref:`copyleft_filter <ref-classes-copyleft_filter>`
@@ -1751,9 +1754,8 @@ system and gives an overview of their function and contents.
    :term:`DEPLOY_DIR_DEB`
       Points to the area that the OpenEmbedded build system uses to place
       Debian packages that are ready to be used outside of the build
-      system. This variable applies only when
-      :term:`PACKAGE_CLASSES` contains
-      "package_deb".
+      system. This variable applies only when :term:`PACKAGE_CLASSES` contains
+      ":ref:`package_deb <ref-classes-package_deb>`".
 
       The BitBake configuration file initially defines the
       :term:`DEPLOY_DIR_DEB` variable as a sub-folder of
@@ -1794,9 +1796,8 @@ system and gives an overview of their function and contents.
    :term:`DEPLOY_DIR_IPK`
       Points to the area that the OpenEmbedded build system uses to place
       IPK packages that are ready to be used outside of the build system.
-      This variable applies only when
-      :term:`PACKAGE_CLASSES` contains
-      "package_ipk".
+      This variable applies only when :term:`PACKAGE_CLASSES` contains
+      ":ref:`package_ipk <ref-classes-package_ipk>`".
 
       The BitBake configuration file initially defines this variable as a
       sub-folder of :term:`DEPLOY_DIR`::
@@ -1814,9 +1815,8 @@ system and gives an overview of their function and contents.
    :term:`DEPLOY_DIR_RPM`
       Points to the area that the OpenEmbedded build system uses to place
       RPM packages that are ready to be used outside of the build system.
-      This variable applies only when
-      :term:`PACKAGE_CLASSES` contains
-      "package_rpm".
+      This variable applies only when :term:`PACKAGE_CLASSES` contains
+      ":ref:`package_rpm <ref-classes-package_rpm>`".
 
       The BitBake configuration file initially defines this variable as a
       sub-folder of :term:`DEPLOY_DIR`::
@@ -1834,9 +1834,8 @@ system and gives an overview of their function and contents.
    :term:`DEPLOY_DIR_TAR`
       Points to the area that the OpenEmbedded build system uses to place
       tarballs that are ready to be used outside of the build system. This
-      variable applies only when
-      :term:`PACKAGE_CLASSES` contains
-      "package_tar".
+      variable applies only when :term:`PACKAGE_CLASSES` contains
+      ":ref:`package_tar <ref-classes-package_tar>`".
 
       The BitBake configuration file initially defines this variable as a
       sub-folder of :term:`DEPLOY_DIR`::
@@ -1993,11 +1992,11 @@ system and gives an overview of their function and contents.
 
    :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
       Specifies a list of features that if present in the target
-      :term:`DISTRO_FEATURES` value should be
-      included in :term:`DISTRO_FEATURES` when building nativesdk recipes. This
-      variable is used in addition to the features filtered using the
-      :term:`DISTRO_FEATURES_NATIVESDK`
-      variable.
+      :term:`DISTRO_FEATURES` value should be included in
+      :term:`DISTRO_FEATURES` when building
+      :ref:`nativesdk <ref-classes-nativesdk>` recipes. This variable is used
+      in addition to the features filtered using the
+      :term:`DISTRO_FEATURES_NATIVESDK` variable.
 
    :term:`DISTRO_FEATURES_NATIVE`
       Specifies a list of features that should be included in
@@ -2010,10 +2009,9 @@ system and gives an overview of their function and contents.
    :term:`DISTRO_FEATURES_NATIVESDK`
       Specifies a list of features that should be included in
       :term:`DISTRO_FEATURES` when building
-      nativesdk recipes. This variable is used in addition to the features
-      filtered using the
-      :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
-      variable.
+      :ref:`nativesdk <ref-classes-nativesdk>` recipes. This variable is used
+      in addition to the features filtered using the
+      :term:`DISTRO_FEATURES_FILTER_NATIVESDK` variable.
 
    :term:`DISTRO_NAME`
       The long name of the distribution. For information on the short name
@@ -4124,12 +4122,12 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_CLASSES`
       A list of classes defining kernel image types that the
-      :ref:`kernel <ref-classes-kernel>` class should inherit. You
-      typically append this variable to enable extended image types. An
-      example is the "kernel-fitimage", which enables fitImage support and
-      resides in ``meta/classes-recipe/kernel-fitimage.bbclass``. You can register
-      custom kernel image types with the :ref:`kernel <ref-classes-kernel>` class using this
-      variable.
+      :ref:`kernel <ref-classes-kernel>` class should inherit. You typically
+      append this variable to enable extended image types. An example is
+      ":ref:`kernel-fitimage <ref-classes-kernel-fitimage>`", which enables
+      fitImage support and resides in ``meta/classes-recipe/kernel-fitimage.bbclass``.
+      You can register custom kernel image types with the
+      :ref:`kernel <ref-classes-kernel>` class using this variable.
 
    :term:`KERNEL_DEBUG_TIMESTAMPS`
       If set to "1", enables timestamping functionality during building
@@ -4949,16 +4947,18 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The "ML" in :term:`MLPREFIX` stands for "MultiLib". This representation is
-         historical and comes from a time when ``nativesdk`` was a suffix
-         rather than a prefix on the recipe name. When ``nativesdk`` was turned
+         The "ML" in :term:`MLPREFIX` stands for "MultiLib". This representation
+         is historical and comes from a time when
+         ":ref:`nativesdk <ref-classes-nativesdk>`"
+         was a suffix rather than a prefix on the recipe name. When
+         ":ref:`nativesdk <ref-classes-nativesdk>`" was turned
          into a prefix, it made sense to set :term:`MLPREFIX` for it as well.
 
       To help understand when :term:`MLPREFIX` might be needed, consider when
       :term:`BBCLASSEXTEND` is used to provide a
-      ``nativesdk`` version of a recipe in addition to the target version.
-      If that recipe declares build-time dependencies on tasks in other
-      recipes by using :term:`DEPENDS`, then a dependency on
+      :ref:`nativesdk <ref-classes-nativesdk>` version of a recipe in addition
+      to the target version. If that recipe declares build-time dependencies
+      on tasks in other recipes by using :term:`DEPENDS`, then a dependency on
       "foo" will automatically get rewritten to a dependency on
       "nativesdk-foo". However, dependencies like the following will not
       get rewritten automatically::
@@ -5406,12 +5406,13 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system uses when packaging data.
 
       You can provide one or more of the following arguments for the
-      variable: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk
-      package_tar"
+      variable::
+
+         PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk package_tar"
 
       .. note::
 
-         While it is a legal option, the ``package_tar``
+         While it is a legal option, the :ref:`package_tar <ref-classes-package_tar>`
          class has limited functionality due to no support for package
          dependencies by that backend. Therefore, it is recommended that
          you do not use it.
@@ -5925,8 +5926,9 @@ system and gives an overview of their function and contents.
    :term:`PIXBUF_PACKAGES`
       When inheriting the :ref:`pixbufcache <ref-classes-pixbufcache>`
       class, this variable identifies packages that contain the pixbuf
-      loaders used with ``gdk-pixbuf``. By default, the ``pixbufcache``
-      class assumes that the loaders are in the recipe's main package (i.e.
+      loaders used with ``gdk-pixbuf``. By default, the
+      :ref:`pixbufcache <ref-classes-pixbufcache>` class assumes that
+      the loaders are in the recipe's main package (i.e.
       ``${``\ :term:`PN`\ ``}``). Use this variable if the
       loaders you need are in a package other than that main package.
 
@@ -6358,7 +6360,7 @@ system and gives an overview of their function and contents.
 
    :term:`PYTHON_PN`
       When used by recipes that inherit the
-      :ref:`setuptools3 <ref-classes-setuptools3>` classe, specifies the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, specifies the
       major Python version being built. For Python 3.x, :term:`PYTHON_PN` would
       be "python3". You do not have to set this variable as the
       OpenEmbedded build system automatically sets it for you.
@@ -6562,10 +6564,9 @@ system and gives an overview of their function and contents.
       for the same recipe, the :term:`REQUIRED_VERSION` value applies.
 
    :term:`RM_WORK_EXCLUDE`
-      With ``rm_work`` enabled, this variable specifies a list of recipes
-      whose work directories should not be removed. See the
-      ":ref:`ref-classes-rm-work`" section for more
-      details.
+      With :ref:`rm_work <ref-classes-rm-work>` enabled, this variable
+      specifies a list of recipes whose work directories should not be removed.
+      See the ":ref:`ref-classes-rm-work`" section for more details.
 
    :term:`ROOT_HOME`
       Defines the root home directory. By default, this directory is set as
@@ -6830,9 +6831,9 @@ system and gives an overview of their function and contents.
 
    :term:`SDK_DEPLOY`
       The directory set up and used by the
-      :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which
-      the SDK is deployed. The ``populate_sdk_base`` class defines
-      :term:`SDK_DEPLOY` as follows::
+      :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which the
+      SDK is deployed. The :ref:`populate_sdk_base <ref-classes-populate-sdk>`
+      class defines :term:`SDK_DEPLOY` as follows::
 
          SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
@@ -6950,7 +6951,8 @@ system and gives an overview of their function and contents.
       :term:`SDK_DIR` variable for more information.
 
    :term:`SDK_PREFIX`
-      The toolchain binary prefix used for ``nativesdk`` recipes. The
+      The toolchain binary prefix used for
+      :ref:`nativesdk <ref-classes-nativesdk>` recipes. The
       OpenEmbedded build system uses the :term:`SDK_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building
       ``nativesdk`` recipes. The default value is "${SDK_SYS}-".
@@ -7761,7 +7763,7 @@ system and gives an overview of their function and contents.
 
       Some recipes build binaries that can run on the target system but
       those binaries in turn generate code for another different system
-      (e.g. cross-canadian recipes). Using terminology from GNU, the
+      (e.g. :ref:`cross-canadian <ref-classes-cross-canadian>` recipes). Using terminology from GNU, the
       primary system is referred to as the "HOST" and the secondary, or
       different, system is referred to as the "TARGET". Thus, the binaries
       run on the "HOST" system and generate binaries for the "TARGET"
@@ -8205,8 +8207,8 @@ system and gives an overview of their function and contents.
       -  For native recipes, the build system sets the variable to the
          value of :term:`BUILD_PREFIX`.
 
-      -  For native SDK recipes (``nativesdk``), the build system sets the
-         variable to the value of :term:`SDK_PREFIX`.
+      -  For native SDK recipes (:ref:`nativesdk <ref-classes-nativesdk>`),
+         the build system sets the variable to the value of :term:`SDK_PREFIX`.
 
    :term:`TARGET_SYS`
       Specifies the system, including the architecture and the operating
@@ -8817,8 +8819,9 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to mkimage '-D'
       feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
-      If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then kernel-fitimage will not
-      pass the ``-D`` option to mkimage.
+      If :term:`UBOOT_MKIMAGE_DTCOPTS` is not set then
+      :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` will not pass the
+      ``-D`` option to mkimage.
 
    :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
       Specifies the type argument for the kernel as passed to ``uboot-mkimage``.
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 66471972de..70ec4535f5 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -206,7 +206,7 @@ are general setup steps that are run once and include:
 
 #. Set up any ``buildtools-tarball`` if configured.
 
-#. Call "buildhistory-init" if buildhistory is configured.
+#. Call "buildhistory-init" if :ref:`buildhistory <ref-classes-buildhistory>` is configured.
 
 For each step that is configured in ``config.json``, it will perform the
 following:
-- 
2.34.1


