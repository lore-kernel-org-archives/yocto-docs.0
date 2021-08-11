Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.12834.1628712368682701314
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 13:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 50948FF803;
	Wed, 11 Aug 2021 20:06:05 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: fix new override syntax migration
Date: Wed, 11 Aug 2021 22:06:01 +0200
Message-Id: <20210811200601.12265-1-foss@0leil.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix bits missed by the migration script.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---

Depends on:
 - https://lists.openembedded.org/g/openembedded-core/message/154733
 - https://lists.yoctoproject.org/g/docs/message/1640

 documentation/dev-manual/common-tasks.rst     | 80 +++++++++----------
 documentation/kernel-dev/advanced.rst         |  2 +-
 documentation/kernel-dev/common.rst           | 10 +--
 documentation/kernel-dev/faq.rst              |  2 +-
 .../migration-guides/migration-3.1.rst        |  2 +-
 .../migration-guides/migration-3.2.rst        |  6 +-
 .../migration-guides/migration-3.3.rst        |  2 +-
 documentation/overview-manual/concepts.rst    |  4 +-
 documentation/overview-manual/yp-intro.rst    |  2 +-
 documentation/ref-manual/classes.rst          |  8 +-
 documentation/ref-manual/qa-checks.rst        | 16 ++--
 documentation/ref-manual/variables.rst        | 52 ++++++------
 .../sdk-manual/appendix-customizing.rst       |  6 +-
 documentation/sdk-manual/extensible.rst       |  2 +-
 .../test-manual/reproducible-builds.rst       |  2 +-
 15 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 2ada8ed5c..9d411ffa7 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -207,13 +207,13 @@ following list:
       To make sure your changes apply only when building machine "one",
       use a machine override with the :term:`DEPENDS` statement::
 
-         DEPENDS_one = "foo"
+         DEPENDS:one = "foo"
 
-      You should follow the same strategy when using ``_append``
-      and ``_prepend`` operations::
+      You should follow the same strategy when using ``:append``
+      and ``:prepend`` operations::
 
-         DEPENDS:append_one = " foo"
-         DEPENDS:prepend_one = "foo "
+         DEPENDS:append:one = " foo"
+         DEPENDS:prepend:one = "foo "
 
       As an actual example, here's a
       snippet from the generic kernel include file ``linux-yocto.inc``,
@@ -236,8 +236,8 @@ following list:
 
       .. note::
 
-         Avoiding "+=" and "=+" and using machine-specific ``_append``
-         and ``_prepend`` operations is recommended as well.
+         Avoiding "+=" and "=+" and using machine-specific ``:append``
+         and ``:prepend`` operations is recommended as well.
 
    -  *Place Machine-Specific Files in Machine-Specific Locations:* When
       you have a base recipe, such as ``base-files.bb``, that contains a
@@ -537,7 +537,7 @@ important as it ensures that items in the list remain colon-separated.
 .. note::
 
    BitBake automatically defines the :term:`THISDIR` variable. You should
-   never set this variable yourself. Using "_prepend" as part of the
+   never set this variable yourself. Using ":prepend" as part of the
    :term:`FILESEXTRAPATHS` ensures your path will be searched prior to other
    paths in the final list.
 
@@ -830,23 +830,23 @@ variable changes are in effect for every build and consequently affect
 all images, which might not be what you require.
 
 To add a package to your image using the local configuration file, use
-the :term:`IMAGE_INSTALL` variable with the ``_append`` operator::
+the :term:`IMAGE_INSTALL` variable with the ``:append`` operator::
 
    IMAGE_INSTALL:append = " strace"
 
 Use of the syntax is important -
 specifically, the space between the quote and the package name, which is
-``strace`` in this example. This space is required since the ``_append``
+``strace`` in this example. This space is required since the ``:append``
 operator does not add the space.
 
-Furthermore, you must use ``_append`` instead of the ``+=`` operator if
+Furthermore, you must use ``:append`` instead of the ``+=`` operator if
 you want to avoid ordering issues. The reason for this is because doing
 so unconditionally appends to the variable and avoids ordering problems
 due to the variable being set in image recipes and ``.bbclass`` files
-with operators like ``?=``. Using ``_append`` ensures the operation
+with operators like ``?=``. Using ``:append`` ensures the operation
 takes effect.
 
-As shown in its simplest use, ``IMAGE_INSTALL_append`` affects all
+As shown in its simplest use, ``IMAGE_INSTALL:append`` affects all
 images. It is possible to extend the syntax so that the variable applies
 to a specific image only. Here is an example::
 
@@ -1544,8 +1544,8 @@ package for a recipe has the same name as the recipe, and the recipe's
 name can be found through the
 ``${``\ :term:`PN`\ ``}`` variable, then
 you specify the dependencies for the main package by setting
-``RDEPENDS_${PN}``. If the package were named ``${PN}-tools``, then you
-would set ``RDEPENDS_${PN}-tools``, and so forth.
+``RDEPENDS:${PN}``. If the package were named ``${PN}-tools``, then you
+would set ``RDEPENDS:${PN}-tools``, and so forth.
 
 Some runtime dependencies will be set automatically at packaging time.
 These dependencies include any shared library dependencies (i.e. if a
@@ -1796,7 +1796,7 @@ the software being built:
    sure the install portion of the build completes with no issues.
    However, if you wish to install additional files not already being
    installed by ``make install``, you should do this using a
-   ``do_install_append`` function using the install command as described
+   ``do_install:append`` function using the install command as described
    in the "Manual" bulleted item later in this list.
 
 -  *Other (using* ``make install``\ *)*: You need to define a ``do_install``
@@ -1865,9 +1865,9 @@ additional definitions in your recipe.
 
 If you are adding services and the service initialization script or the
 service file itself is not installed, you must provide for that
-installation in your recipe using a ``do_install_append`` function. If
+installation in your recipe using a ``do_install:append`` function. If
 your recipe already has a ``do_install`` function, update the function
-near its end rather than adding an additional ``do_install_append``
+near its end rather than adding an additional ``do_install:append``
 function.
 
 When you create the installation for your services, you need to
@@ -1938,7 +1938,7 @@ take. The following list describes the process:
    discover problems, you can set
    :term:`PACKAGES`,
    :term:`FILES`,
-   ``do_install(_append)``, and so forth as needed.
+   ``do_install(:append)``, and so forth as needed.
 
 -  *Splitting an Application into Multiple Packages*: If you need to
    split an application into several packages, see the
@@ -2137,7 +2137,7 @@ Post-Installation Scripts
 Post-installation scripts run immediately after installing a package on
 the target or during image creation when a package is included in an
 image. To add a post-installation script to a package, add a
-``pkg_postinst_``\ `PACKAGENAME`\ ``()`` function to the recipe file
+``pkg_postinst:``\ `PACKAGENAME`\ ``()`` function to the recipe file
 (``.bb``) and replace `PACKAGENAME` with the name of the package you want
 to attach to the ``postinst`` script. To apply the post-installation
 script to the main package for the recipe, which is usually what is
@@ -2147,7 +2147,7 @@ PACKAGENAME.
 
 A post-installation function has the following structure::
 
-   pkg_postinst_PACKAGENAME() {
+   pkg_postinst:PACKAGENAME() {
        # Commands to carry out
    }
 
@@ -2367,7 +2367,7 @@ In the previous example, we want to ship the ``sxpm`` and ``cxpm``
 binaries in separate packages. Since ``bindir`` would be packaged into
 the main :term:`PN` package by default, we prepend the :term:`PACKAGES` variable
 so additional package names are added to the start of list. This results
-in the extra ``FILES_*`` variables then containing information that
+in the extra ``FILES:*`` variables then containing information that
 define which files and directories go into which packages. Files
 included by earlier packages are skipped by latter packages. Thus, the
 main :term:`PN` package does not include the above listed files.
@@ -2398,7 +2398,7 @@ configure and compile steps as well as sets things up to grab packages
 from the appropriate area. In particular, this class sets ``noexec`` on
 both the :ref:`ref-tasks-configure`
 and :ref:`ref-tasks-compile` tasks,
-sets ``FILES_${PN}`` to "/" so that it picks up all files, and sets up a
+sets ``FILES:${PN}`` to "/" so that it picks up all files, and sets up a
 :ref:`ref-tasks-install` task, which
 effectively copies all files from ``${S}`` to ``${D}``. The
 ``bin_package`` class works well when the files extracted into ``${S}``
@@ -2459,7 +2459,7 @@ doing the following:
 
 -  Ensure that you set up :term:`FILES`
    (usually
-   ``FILES_${``\ :term:`PN`\ ``}``) to
+   ``FILES:${``\ :term:`PN`\ ``}``) to
    point to the files you have installed, which of course depends on
    where you have installed them and whether those files are in
    different locations than the defaults.
@@ -2631,7 +2631,7 @@ in the BitBake User Manual.
 
       VAR =+ "Starts"
 
--  *Appending (_append):* Use the ``_append`` operator to append values
+-  *Appending (:append):* Use the ``:append`` operator to append values
    to existing variables. This operator does not add any additional
    space. Also, the operator is applied after all the ``+=``, and ``=+``
    operators have been applied and after all ``=`` assignments have
@@ -2644,12 +2644,12 @@ in the BitBake User Manual.
       SRC_URI:append = " file://fix-makefile.patch"
 
    You can also use
-   the ``_append`` operator with overrides, which results in the actions
+   the ``:append`` operator with overrides, which results in the actions
    only being performed for the specified target or machine::
 
       SRC_URI:append:sh4 = " file://fix-makefile.patch"
 
--  *Prepending (_prepend):* Use the ``_prepend`` operator to prepend
+-  *Prepending (:prepend):* Use the ``:prepend`` operator to prepend
    values to existing variables. This operator does not add any
    additional space. Also, the operator is applied after all the ``+=``,
    and ``=+`` operators have been applied and after all ``=``
@@ -2662,7 +2662,7 @@ in the BitBake User Manual.
       CFLAGS:prepend = "-I${S}/myincludes "
 
    You can also use the
-   ``_prepend`` operator with overrides, which results in the actions
+   ``:prepend`` operator with overrides, which results in the actions
    only being performed for the specified target or machine::
 
       CFLAGS:prepend:sh4 = "-I${S}/myincludes "
@@ -4538,7 +4538,7 @@ that can help you speed up the build:
    exceptions::
 
       STATICLIBCONF = "--disable-static"
-      STATICLIBCONF_sqlite3-native = ""
+      STATICLIBCONF:sqlite3-native = ""
       EXTRA_OECONF += "${STATICLIBCONF}"
 
    .. note::
@@ -4578,7 +4578,7 @@ can control which static library files (``*.a`` files) get included in
 the built library.
 
 The :term:`PACKAGES` and
-:term:`FILES_* <FILES>` variables in the
+:term:`FILES:* <FILES>` variables in the
 ``meta/conf/bitbake.conf`` configuration file define how files installed
 by the ``do_install`` task are packaged. By default, the :term:`PACKAGES`
 variable includes ``${PN}-staticdev``, which represents all static
@@ -6510,8 +6510,8 @@ function in your recipe. The ``do_split_packages`` function searches for
 a pattern of files or directories under a specified path and creates a
 package for each one it finds by appending to the
 :term:`PACKAGES` variable and
-setting the appropriate values for ``FILES_packagename``,
-``RDEPENDS_packagename``, ``DESCRIPTION_packagename``, and so forth.
+setting the appropriate values for ``FILES:packagename``,
+``RDEPENDS:packagename``, ``DESCRIPTION:packagename``, and so forth.
 Here is an example from the ``lighttpd`` recipe::
 
    python populate_packages:prepend () {
@@ -7389,11 +7389,11 @@ The variable can be used in multiple ways, including using suffixes to
 set it for a specific package type and/or package. Note that the order
 of precedence is the same as this list:
 
--  ``PACKAGE_ADD_METADATA_<PKGTYPE>_<PN>``
+-  ``PACKAGE_ADD_METADATA_<PKGTYPE>:<PN>``
 
 -  ``PACKAGE_ADD_METADATA_<PKGTYPE>``
 
--  ``PACKAGE_ADD_METADATA_<PN>``
+-  ``PACKAGE_ADD_METADATA:<PN>``
 
 -  :term:`PACKAGE_ADD_METADATA`
 
@@ -7664,11 +7664,11 @@ configuration file contains the line::
 This line pulls in the
 listed include file that contains numerous lines of exactly that form::
 
-   #SRCREV_pn-opkg-native ?= "${AUTOREV}"
-   #SRCREV_pn-opkg-sdk ?= "${AUTOREV}"
-   #SRCREV_pn-opkg ?= "${AUTOREV}"
-   #SRCREV_pn-opkg-utils-native ?= "${AUTOREV}"
-   #SRCREV_pn-opkg-utils ?= "${AUTOREV}"
+   #SRCREV:pn-opkg-native ?= "${AUTOREV}"
+   #SRCREV:pn-opkg-sdk ?= "${AUTOREV}"
+   #SRCREV:pn-opkg ?= "${AUTOREV}"
+   #SRCREV:pn-opkg-utils-native ?= "${AUTOREV}"
+   #SRCREV:pn-opkg-utils ?= "${AUTOREV}"
    SRCREV:pn-gconf-dbus ?= "${AUTOREV}"
    SRCREV:pn-matchbox-common ?= "${AUTOREV}"
    SRCREV:pn-matchbox-config-gtk ?= "${AUTOREV}"
@@ -8941,7 +8941,7 @@ In addition to variable values, the output of the ``bitbake -e`` and
 -  After the variable values, all functions appear in the output. For
    shell functions, variables referenced within the function body are
    expanded. If a function has been modified using overrides or using
-   override-style operators like ``_append`` and ``_prepend``, then the
+   override-style operators like ``:append`` and ``:prepend``, then the
    final assembled function body appears in the output.
 
 Viewing Package Information with ``oe-pkgdata-util``
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 9c3a478cb..2dbcca60c 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -724,7 +724,7 @@ If the BSP description is in recipe space, you cannot simply list the
 ``*.scc`` in the :term:`SRC_URI` statement. You need to use the following
 form from your kernel append file::
 
-   SRC_URI:append_myplatform = " \
+   SRC_URI:append:myplatform = " \
        file://myplatform;type=kmeta;destsuffix=myplatform \
        "
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 331e982ac..7bfa468de 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -502,23 +502,23 @@ strings in the file from the ``meta-yocto-bsp`` layer upstream.
    KMACHINE:genericx86 ?= "common-pc"
    KMACHINE:genericx86-64 ?= "common-pc-64"
    KBRANCH:edgerouter = "standard/edgerouter"
-   KBRANCH_beaglebone = "standard/beaglebone"
+   KBRANCH:beaglebone = "standard/beaglebone"
 
    SRCREV_machine:genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
    SRCREV_machine:genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
    SRCREV_machine:edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-   SRCREV_machine_beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+   SRCREV_machine:beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
 
 
    COMPATIBLE_MACHINE:genericx86 = "genericx86"
    COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
    COMPATIBLE_MACHINE:edgerouter = "edgerouter"
-   COMPATIBLE_MACHINE_beaglebone = "beaglebone"
+   COMPATIBLE_MACHINE:beaglebone = "beaglebone"
 
    LINUX_VERSION:genericx86 = "4.12.7"
    LINUX_VERSION:genericx86-64 = "4.12.7"
    LINUX_VERSION:edgerouter = "4.12.10"
-   LINUX_VERSION_beaglebone = "4.12.10"
+   LINUX_VERSION:beaglebone = "4.12.10"
 
 This append file
 contains statements used to support several BSPs that ship with the
@@ -726,7 +726,7 @@ that assigns the :term:`KBUILD_DEFCONFIG` variable based on "raspberrypi2"
 and provides the path to the "in-tree" ``defconfig`` file to be used for
 a Raspberry Pi 2, which is based on the Broadcom 2708/2709 chipset::
 
-   KBUILD_DEFCONFIG_raspberrypi2 ?= "bcm2709_defconfig"
+   KBUILD_DEFCONFIG:raspberrypi2 ?= "bcm2709_defconfig"
 
 Aside from modifying your kernel recipe and providing your own
 ``defconfig`` file, you need to be sure no files or statements set
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index f0a7af37b..47be33486 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -36,7 +36,7 @@ How do I install/not-install the kernel image on the rootfs?
 The kernel image (e.g. ``vmlinuz``) is provided by the
 ``kernel-image`` package. Image recipes depend on ``kernel-base``. To
 specify whether or not the kernel image is installed in the generated
-root filesystem, override ``RDEPENDS_${KERNEL_PACKAGE_NAME}-base`` to include or not
+root filesystem, override ``RDEPENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
 ":ref:`dev-manual/common-tasks:using .bbappend files in your layer`"
 section in the
diff --git a/documentation/migration-guides/migration-3.1.rst b/documentation/migration-guides/migration-3.1.rst
index 80b8f6baa..cddfa6b35 100644
--- a/documentation/migration-guides/migration-3.1.rst
+++ b/documentation/migration-guides/migration-3.1.rst
@@ -73,7 +73,7 @@ that you remove "ptest" from
 :term:`DISTRO_FEATURES` to save a significant
 amount of build time e.g. by adding the following in your configuration::
 
-   DISTRO_FEATURES_remove = "ptest"
+   DISTRO_FEATURES:remove = "ptest"
 
 .. _migration-3.1-removed-recipes:
 
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index a940f2323..347fb96d2 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -92,14 +92,14 @@ work with multilib, then you will need to ensure that ``${MLPREFIX}``
 is prefixed on the package names in the dependencies, for example
 (from the ``glibc`` recipe)::
 
-    RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
+    RRECOMMENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 
 This also applies when conditionally adding packages to :term:`PACKAGES` where
 those packages have dependencies, for example (from the ``alsa-plugins`` recipe)::
 
     PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
     ...
-    RDEPENDS_${PN}-pulseaudio-conf += "\
+    RDEPENDS:${PN}-pulseaudio-conf += "\
             ${MLPREFIX}libasound-module-conf-pulse \
             ${MLPREFIX}libasound-module-ctl-pulse \
             ${MLPREFIX}libasound-module-pcm-pulse \
@@ -209,7 +209,7 @@ deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 
 ``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as ``do_install`` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
 
-Most recipes and classes that inherit the ``deploy`` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` - these should be refactored to use ``do_deploy_prepend`` instead.
+Most recipes and classes that inherit the ``deploy`` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` - these should be refactored to use ``do_deploy:prepend`` instead.
 
 
 .. _migration-3.2-nativesdk-sdk-provides-dummy:
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index 28857e820..c02f72007 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -159,7 +159,7 @@ Miscellaneous changes
 - ``ffmpeg`` is now configured to disable GPL-licensed portions by default
   to make it harder to accidentally violate the GPL. To explicitly enable GPL
   licensed portions, add ``gpl`` to :term:`PACKAGECONFIG` for ``ffmpeg``
-  using a bbappend (or use ``PACKAGECONFIG_append_pn-ffmpeg = " gpl"`` in
+  using a bbappend (or use ``PACKAGECONFIG:append:pn-ffmpeg = " gpl"`` in
   your configuration.)
 - ``connman`` is now set to conflict with ``systemd-networkd`` as they
   overlap functionally and may interfere with each other at runtime.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4f8e6cb04..b06a73e5f 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1768,7 +1768,7 @@ It is also worth noting that the end result of these signature
 generators is to make some dependency and hash information available to
 the build. This information includes:
 
--  ``BB_BASEHASH_task-``\ taskname: The base hashes for each task in the
+-  ``BB_BASEHASH:task-``\ taskname: The base hashes for each task in the
    recipe.
 
 -  ``BB_BASEHASH_``\ filename\ ``:``\ taskname: The base hashes for each
@@ -2027,7 +2027,7 @@ dependencies, you must manually declare the dependencies.
    .. note::
 
       By default, ``foo-dev`` also has an :term:`RDEPENDS`-style dependency on
-      ``foo``, because the default value of ``RDEPENDS_${PN}-dev`` (set in
+      ``foo``, because the default value of ``RDEPENDS:${PN}-dev`` (set in
       bitbake.conf) includes "${PN}".
 
    To ensure that the dependency chain is never broken, ``-dev`` and
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index d20a4ab09..7aee9db04 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -738,7 +738,7 @@ other build process, in which case the basic functionality can be
 defined by the classes it inherits from the OE-Core layer's class
 definitions in ``./meta/classes``. Within a recipe you can also define
 additional tasks as well as task prerequisites. Recipe syntax through
-BitBake also supports both ``_prepend`` and ``_append`` operators as a
+BitBake also supports both ``:prepend`` and ``:append`` operators as a
 method of extending task functionality. These operators inject code into
 the beginning or end of a task. For information on these BitBake
 operators, see the
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 746cc122e..38e724714 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1182,7 +1182,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
    its :term:`PN` value matches something already in :term:`OVERRIDES` (e.g.
    :term:`PN` happens to be the same as :term:`MACHINE` or
    :term:`DISTRO`), it can have unexpected consequences.
-   For example, assignments such as ``FILES_${PN} = "xyz"`` effectively
+   For example, assignments such as ``FILES:${PN} = "xyz"`` effectively
    turn into ``FILES = "xyz"``.
 
 -  ``rpaths:`` Checks for rpaths in the binaries that contain build
@@ -1208,7 +1208,7 @@ Here are the tests you can list with the :term:`WARN_QA` and
 
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
    for a package are also declared on the recipe level (i.e. any license
-   in ``LICENSE_*`` should appear in :term:`LICENSE`).
+   in ``LICENSE:*`` should appear in :term:`LICENSE`).
 
 -  ``useless-rpaths:`` Checks for dynamic library load paths (rpaths)
    in the binaries that by default on a standard system are searched by
@@ -1605,7 +1605,7 @@ a couple different ways:
       BBCLASSEXTEND = "native"
 
    Inside the
-   recipe, use ``_class-native`` and ``_class-target`` overrides to
+   recipe, use ``:class-native`` and ``:class-target`` overrides to
    specify any functionality specific to the respective native or target
    case.
 
@@ -1636,7 +1636,7 @@ couple different ways:
        BBCLASSEXTEND = "nativesdk"
 
    Inside the
-   recipe, use ``_class-nativesdk`` and ``_class-target`` overrides to
+   recipe, use ``:class-nativesdk`` and ``:class-target`` overrides to
    specify any functionality specific to the respective SDK machine or
    target case.
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 4b5d0abdb..d452de411 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -263,7 +263,7 @@ Errors and Warnings
 
    The ``/usr/share/info/dir`` should not be packaged. Add the following
    line to your :ref:`ref-tasks-install` task or to your
-   ``do_install_append`` within the recipe as follows::
+   ``do_install:append`` within the recipe as follows::
 
       rm ${D}${infodir}/dir
    
@@ -347,7 +347,7 @@ Errors and Warnings
     
 .. _qa-check-dep-cmp:
 
--  ``<var>_<packagename> is invalid: <comparison> (<value>)   only comparisons <, =, >, <=, and >= are allowed [dep-cmp]``
+-  ``<var>:<packagename> is invalid: <comparison> (<value>)   only comparisons <, =, >, <=, and >= are allowed [dep-cmp]``
 
    If you are adding a versioned dependency relationship to one of the
    dependency variables (:term:`RDEPENDS`,
@@ -454,14 +454,14 @@ Errors and Warnings
    ``pkg_preinst``, ``pkg_postinst``, ``pkg_prerm``, ``pkg_postrm``, and
    :term:`ALLOW_EMPTY`) should always be set specific
    to a package (i.e. they should be set with a package name override
-   such as ``RDEPENDS_${PN} = "value"`` rather than
+   such as ``RDEPENDS:${PN} = "value"`` rather than
    ``RDEPENDS = "value"``). If you receive this error, correct any
    assignments to these variables within your recipe.
 
 
-- ``recipe uses DEPENDS_${PN}, should use DEPENDS [pkgvarcheck]``
+- ``recipe uses DEPENDS:${PN}, should use DEPENDS [pkgvarcheck]``
 
-   This check looks for instances of setting ``DEPENDS_${PN}``
+   This check looks for instances of setting ``DEPENDS:${PN}``
    which is erroneous (:term:`DEPENDS` is a recipe-wide variable and thus
    it is not correct to specify it for a particular package, nor will such
    an assignment actually work.) Set :term:`DEPENDS` instead.
@@ -524,7 +524,7 @@ Errors and Warnings
    following:
 
    -  Add the files to :term:`FILES` for the package you want them to appear
-      in (e.g. ``FILES_${``\ :term:`PN`\ ``}`` for the main
+      in (e.g. ``FILES:${``\ :term:`PN`\ ``}`` for the main
       package).
 
    -  Delete the files at the end of the ``do_install`` task if the
@@ -546,11 +546,11 @@ Errors and Warnings
 
 .. _qa-check-unlisted-pkg-lics:
 
--  ``LICENSE_<packagename> includes licenses (<licenses>) that are not listed in LICENSE [unlisted-pkg-lics]``
+-  ``LICENSE:<packagename> includes licenses (<licenses>) that are not listed in LICENSE [unlisted-pkg-lics]``
 
    The :term:`LICENSE` of the recipe should be a superset
    of all the licenses of all packages produced by this recipe. In other
-   words, any license in ``LICENSE_*`` should also appear in
+   words, any license in ``LICENSE:*`` should also appear in
    :term:`LICENSE`.
 
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 847df8ee4..51723d8e0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -575,7 +575,7 @@ system and gives an overview of their function and contents.
 
          Internally, the :term:`BBCLASSEXTEND` mechanism generates recipe
          variants by rewriting variable values and applying overrides such
-         as ``_class-native``. For example, to generate a native version of
+         as ``:class-native``. For example, to generate a native version of
          a recipe, a :term:`DEPENDS` on "foo" is rewritten
          to a :term:`DEPENDS` on "foo-native".
 
@@ -2347,7 +2347,7 @@ system and gives an overview of their function and contents.
             rather than ``/usr/bin``. You can find a list of these
             variables at the top of the ``meta/conf/bitbake.conf`` file in
             the :term:`Source Directory`. You will also
-            find the default values of the various ``FILES_*`` variables in
+            find the default values of the various ``FILES:*`` variables in
             this file.
 
       If some of the files you provide with the :term:`FILES` variable are
@@ -2416,7 +2416,7 @@ system and gives an overview of their function and contents.
       a :term:`MACHINE`-specific override, which is useful
       in a BSP layer::
 
-          FILESEXTRAPATHS:prepend_intel-x86-common := "${THISDIR}/${PN}:"
+          FILESEXTRAPATHS:prepend:intel-x86-common := "${THISDIR}/${PN}:"
 
       The previous statement appears in the
       ``linux-yocto-dev.bbappend`` file, which is found in the
@@ -3033,8 +3033,8 @@ system and gives an overview of their function and contents.
             :term:`IMAGE_FSTYPES` prior to using the "inherit image" line.
 
          -  Due to the way the OpenEmbedded build system processes this
-            variable, you cannot update its contents by using ``_append``
-            or ``_prepend``. You must use the ``+=`` operator to add one or
+            variable, you cannot update its contents by using ``:append``
+            or ``:prepend``. You must use the ``+=`` operator to add one or
             more options to the :term:`IMAGE_FSTYPES` variable.
 
    :term:`IMAGE_INSTALL`
@@ -3292,7 +3292,7 @@ system and gives an overview of their function and contents.
       Specifies a dependency from one image type on another. Here is an
       example from the :ref:`image-live <ref-classes-image-live>` class::
 
-         IMAGE_TYPEDEP_live = "ext3"
+         IMAGE_TYPEDEP:live = "ext3"
 
       In the previous example, the variable ensures that when "live" is
       listed with the :term:`IMAGE_FSTYPES` variable,
@@ -3752,7 +3752,7 @@ system and gives an overview of their function and contents.
          KBRANCH:genericx86 = "standard/base"
          KBRANCH:genericx86-64 = "standard/base"
          KBRANCH:edgerouter = "standard/edgerouter"
-         KBRANCH_beaglebone = "standard/beaglebone"
+         KBRANCH:beaglebone = "standard/beaglebone"
 
       The :term:`KBRANCH` statements
       identify the kernel branch to use when building for each supported
@@ -3780,11 +3780,11 @@ system and gives an overview of their function and contents.
       Here is an example from a "raspberrypi2" :term:`KMACHINE` build that uses
       a ``defconfig`` file named "bcm2709_defconfig"::
 
-         KBUILD_DEFCONFIG_raspberrypi2 = "bcm2709_defconfig"
+         KBUILD_DEFCONFIG:raspberrypi2 = "bcm2709_defconfig"
 
       As an alternative, you can use the following within your append file::
 
-         KBUILD_DEFCONFIG:pn-linux-yocto ?= defconfig_file
+         KBUILD_DEFCONFIG:pn-linux-yocto ?= "defconfig_file"
 
       For more
       information on how to use the :term:`KBUILD_DEFCONFIG` variable, see the
@@ -4117,13 +4117,13 @@ system and gives an overview of their function and contents.
       Kernel's ``meta`` branch. As an example take a look in the
       ``common/recipes-kernel/linux/linux-yocto_3.19.bbappend`` file::
 
-         LINUX_VERSION_core2-32-intel-common = "3.19.0"
-         COMPATIBLE_MACHINE_core2-32-intel-common = "${MACHINE}"
-         SRCREV_meta_core2-32-intel-common = "8897ef68b30e7426bc1d39895e71fb155d694974"
-         SRCREV_machine_core2-32-intel-common = "43b9eced9ba8a57add36af07736344dcc383f711"
-         KMACHINE_core2-32-intel-common = "intel-core2-32"
-         KBRANCH_core2-32-intel-common = "standard/base"
-         KERNEL_FEATURES:append_core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+         LINUX_VERSION:core2-32-intel-common = "3.19.0"
+         COMPATIBLE_MACHINE:core2-32-intel-common = "${MACHINE}"
+         SRCREV_meta:core2-32-intel-common = "8897ef68b30e7426bc1d39895e71fb155d694974"
+         SRCREV_machine:core2-32-intel-common = "43b9eced9ba8a57add36af07736344dcc383f711"
+         KMACHINE:core2-32-intel-common = "intel-core2-32"
+         KBRANCH:core2-32-intel-common = "standard/base"
+         KERNEL_FEATURES:append:core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
 
       The :term:`KMACHINE` statement says
       that the kernel understands the machine name as "intel-core2-32".
@@ -4311,7 +4311,7 @@ system and gives an overview of their function and contents.
       build system to create an extra package (i.e.
       ``${``\ :term:`PN`\ ``}-lic``) for each recipe and to add
       those packages to the
-      :term:`RRECOMMENDS`\ ``_${PN}``.
+      :term:`RRECOMMENDS`\ ``:${PN}``.
 
       The ``${PN}-lic`` package installs a directory in
       ``/usr/share/licenses`` named ``${PN}``, which is the recipe's base
@@ -4841,7 +4841,7 @@ system and gives an overview of their function and contents.
 
    :term:`NOAUTOPACKAGEDEBUG`
       Disables auto package from splitting ``.debug`` files. If a recipe
-      requires ``FILES_${PN}-dbg`` to be set manually, the
+      requires ``FILES:${PN}-dbg`` to be set manually, the
       :term:`NOAUTOPACKAGEDEBUG` can be defined allowing you to define the
       content of the debug package. For example::
 
@@ -4944,7 +4944,7 @@ system and gives an overview of their function and contents.
       assignment will override ``FOO`` with the value "overridden" at the
       end of parsing::
 
-         FOO_an-override = "overridden"
+         FOO:an-override = "overridden"
 
       See the
       ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
@@ -5390,7 +5390,7 @@ system and gives an overview of their function and contents.
       (leftmost) package.
 
       Packages in the variable's list that are empty (i.e. where none of
-      the patterns in ``FILES_``\ pkg match any files installed by the
+      the patterns in ``FILES:``\ pkg match any files installed by the
       :ref:`ref-tasks-install` task) are not generated,
       unless generation is forced through the
       :term:`ALLOW_EMPTY` variable.
@@ -5541,7 +5541,7 @@ system and gives an overview of their function and contents.
 
       For example, when the :ref:`debian <ref-classes-debian>` class
       renames the output package, it does so by setting
-      ``PKG_packagename``.
+      ``PKG:packagename``.
 
    :term:`PKG_CONFIG_PATH`
       The path to ``pkg-config`` files for the current build context.
@@ -5785,7 +5785,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``\_forcevariable`` override is not handled specially. This override
+         The ``\:forcevariable`` override is not handled specially. This override
          only works because the default value of :term:`OVERRIDES` includes "forcevariable".
 
       If a recipe with the specified version is not available, a warning
@@ -6072,10 +6072,10 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         ``RDEPENDS_${PN}-dev`` includes ``${``\ :term:`PN`\ ``}``
+         ``RDEPENDS:${PN}-dev`` includes ``${``\ :term:`PN`\ ``}``
          by default. This default is set in the BitBake configuration file
          (``meta/conf/bitbake.conf``). Be careful not to accidentally remove
-         ``${PN}`` when modifying ``RDEPENDS_${PN}-dev``. Use the "+=" operator
+         ``${PN}`` when modifying ``RDEPENDS:${PN}-dev``. Use the "+=" operator
          rather than the "=" operator.
 
       The package names you use with :term:`RDEPENDS` must appear as they would
@@ -6862,7 +6862,7 @@ system and gives an overview of their function and contents.
       defined in the ``meta/conf/bitbake.conf`` configuration file.
 
       You will see this variable referenced in the default values of
-      ``FILES_${PN}``.
+      ``FILES:${PN}``.
 
    :term:`SOLIBSDEV`
       Defines the suffix for the development symbolic link (symlink) for
@@ -6871,7 +6871,7 @@ system and gives an overview of their function and contents.
       ``meta/conf/bitbake.conf`` configuration file.
 
       You will see this variable referenced in the default values of
-      ``FILES_${PN}-dev``.
+      ``FILES:${PN}-dev``.
 
    :term:`SOURCE_MIRROR_FETCH`
       When you are fetching files to create a mirror of sources (i.e.
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 44f4334c2..4eccc28e9 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -73,7 +73,7 @@ adjustments:
       SDK_INHERIT_BLACKLIST
       is set using the "?=" operator. Consequently, you will need to
       either define the entire list by using the "=" operator, or you
-      will need to append a value using either "_append" or the "+="
+      will need to append a value using either ":append" or the "+="
       operator. You can learn more about these operators in the
       ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax`"
       section of the BitBake User Manual.
@@ -250,7 +250,7 @@ source, you need to do a number of things:
       recipes that depend on lists of other recipes.
 
    -  Build the "world" target and set
-      ``EXCLUDE_FROM_WORLD_pn-``\ recipename for the recipes you do not
+      ``EXCLUDE_FROM_WORLD:pn-``\ recipename for the recipes you do not
       want built. See the
       :term:`EXCLUDE_FROM_WORLD`
       variable for additional information.
@@ -334,7 +334,7 @@ within it are available. Having these recipes available increases build
 time significantly and increases the size of the SDK installer by 30-80
 Mbytes depending on how many recipes are included in your configuration.
 
-You can use ``EXCLUDE_FROM_WORLD_pn-``\ recipename for recipes you want
+You can use ``EXCLUDE_FROM_WORLD:pn-``\ recipename for recipes you want
 to exclude. However, it is assumed that you would need to be building
 the "world" target if you want to provide additional items to the SDK.
 Consequently, building for "world" should not represent undue overhead
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index bdce0414e..8ef44e39a 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -1154,7 +1154,7 @@ subdirectory for each package. Apart from some advanced cases, the
 splitting. The :term:`PACKAGES` variable lists all of the packages to be
 produced, while the :term:`FILES` variable specifies which files to include
 in each package by using an override to specify the package. For
-example, ``FILES_${PN}`` specifies the files to go into the main package
+example, ``FILES:${PN}`` specifies the files to go into the main package
 (i.e. the main package has the same name as the recipe and
 ``${``\ :term:`PN`\ ``}`` evaluates to the
 recipe name). The order of the :term:`PACKAGES` value is significant. For
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index c66c82f86..68fdf547b 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -70,7 +70,7 @@ things we do within the build system to ensure reproducibility include:
 
 .. note::
 
-   Because of an open bug in GCC, using ``DISTRO_FEATURES_append = " lto"`` or
+   Because of an open bug in GCC, using ``DISTRO_FEATURES:append = " lto"`` or
    adding ``-flto`` (Link Time Optimization) to ``CFLAGS`` makes the resulting
    binary non-reproducible, in that it depends on the full absolute build path
    to ``recipe-sysroot-native``, so installing the Yocto Project in a different
-- 
2.20.1

