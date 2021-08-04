Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.13219.1628102079295985921
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7D085FF803;
	Wed,  4 Aug 2021 18:34:37 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/6] ref-manual: overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:24 +0200
Message-Id: <20210804183426.22333-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
References: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with openembedded-core/scripts/contrib/convert-overrides.py

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   |  14 +--
 documentation/ref-manual/faq.rst       |   4 +-
 documentation/ref-manual/qa-checks.rst |   4 +-
 documentation/ref-manual/variables.rst | 134 ++++++++++++-------------
 4 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 49905f2725..746cc122e9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -456,8 +456,8 @@ recipe that fetches from an alternative URI (e.g. Git) instead of a
 tarball. Following is an example::
 
    BBCLASSEXTEND = "devupstream:target"
-   SRC_URI_class-devupstream = "git://git.example.com/example"
-   SRCREV_class-devupstream = "abcd1234"
+   SRC_URI:class-devupstream = "git://git.example.com/example"
+   SRCREV:class-devupstream = "abcd1234"
 
 Adding the above statements to your recipe creates a variant that has
 :term:`DEFAULT_PREFERENCE` set to "-1".
@@ -465,8 +465,8 @@ Consequently, you need to select the variant of the recipe to use it.
 Any development-specific adjustments can be done by using the
 ``class-devupstream`` override. Here is an example::
 
-   DEPENDS_append_class-devupstream = " gperf-native"
-   do_configure_prepend_class-devupstream() {
+   DEPENDS:append:class-devupstream = " gperf-native"
+   do_configure:prepend:class-devupstream() {
        touch ${S}/README
    }
 
@@ -846,7 +846,7 @@ sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
 :term:`ICECC_DISABLED` variable to "1" as follows::
 
-   INHERIT_DISTRO_append = " icecc"
+   INHERIT_DISTRO:append = " icecc"
    ICECC_DISABLED ??= "1"
 
 This practice
@@ -974,7 +974,7 @@ the check for symbolic link ``.so`` files in the main package of a
 recipe, add the following to the recipe. You need to realize that the
 package name override, in this example ``${PN}``, must be used::
 
-   INSANE_SKIP_${PN} += "dev-so"
+   INSANE_SKIP:${PN} += "dev-so"
 
 Please keep in mind that the QA checks
 are meant to detect real or potential problems in the packaged
@@ -2481,7 +2481,7 @@ indicate the package to which the value applies. If the value applies to
 the recipe's main package, use ``${``\ :term:`PN`\ ``}``. Here
 is an example from the connman recipe::
 
-   SYSTEMD_SERVICE_${PN} = "connman.service"
+   SYSTEMD_SERVICE:${PN} = "connman.service"
 
 Services are set up to start on boot automatically
 unless you have set
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index c7322e7623..d3a603d4a4 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -301,7 +301,7 @@ As an example, you could add a specific server for the build system to
 attempt before any others by adding something like the following to the
 ``local.conf`` configuration file::
 
-   PREMIRRORS_prepend = "\
+   PREMIRRORS:prepend = "\
        git://.*/.* http://www.yoctoproject.org/sources/ \n \
        ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
        http://.*/.* http://www.yoctoproject.org/sources/ \n \
@@ -341,7 +341,7 @@ Finally, consider an example where you are behind an HTTP-only firewall.
 You could make the following changes to the ``local.conf`` configuration
 file as long as the :term:`PREMIRRORS` server is current::
 
-   PREMIRRORS_prepend = "\
+   PREMIRRORS:prepend = "\
        ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
        http://.*/.* http://www.yoctoproject.org/sources/ \n \
        https://.*/.* http://www.yoctoproject.org/sources/ \n"
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 0ef203c70f..4b5d0abdba 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -223,7 +223,7 @@ Errors and Warnings
    software that reads :term:`CFLAGS` when you build it,
    you could add the following to your recipe::
 
-      CFLAGS_append = " -fPIC "
+      CFLAGS:append = " -fPIC "
 
    For more information on text relocations at runtime, see
    https://www.akkadia.org/drepper/textrelocs.html.
@@ -620,7 +620,7 @@ Errors and Warnings
 
 .. _qa-check-missing-update-alternatives:
 
-- ``<recipename>: recipe defines ALTERNATIVE_<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
+- ``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
 
     This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
     recipe also inherits :ref:`update-alternatives <ref-classes-update-alternatives>` such
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1150940133..847df8ee4c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -38,9 +38,9 @@ system and gives an overview of their function and contents.
       Like all package-controlling variables, you must always use them in
       conjunction with a package name override, as in::
 
-         ALLOW_EMPTY_${PN} = "1"
-         ALLOW_EMPTY_${PN}-dev = "1"
-         ALLOW_EMPTY_${PN}-staticdev = "1"
+         ALLOW_EMPTY:${PN} = "1"
+         ALLOW_EMPTY:${PN}-dev = "1"
+         ALLOW_EMPTY:${PN}-staticdev = "1"
 
    :term:`ALTERNATIVE`
       Lists commands in a package that need an alternative binary naming
@@ -53,7 +53,7 @@ system and gives an overview of their function and contents.
       provided by another package. For example, if the ``busybox`` package
       has four such commands, you identify them as follows::
 
-         ALTERNATIVE_busybox = "sh sed test bracket"
+         ALTERNATIVE:busybox = "sh sed test bracket"
 
       For more information on the alternatives system, see the
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
@@ -297,7 +297,7 @@ system and gives an overview of their function and contents.
       can attach it to a specific image recipe by using the recipe name
       override::
 
-         BAD_RECOMMENDATIONS_pn-target_image = "package_name"
+         BAD_RECOMMENDATIONS:pn-target_image = "package_name"
 
       It is important to realize that if you choose to not install packages
       using this variable and some other packages are dependent on them
@@ -1133,7 +1133,7 @@ system and gives an overview of their function and contents.
       As an example, the following override allows you to install extra
       files, but only when building for the target::
 
-         do_install_append_class-target() {
+         do_install:append:class-target() {
              install my-extra-file ${D}${sysconfdir}
          }
 
@@ -1141,7 +1141,7 @@ system and gives an overview of their function and contents.
       "native" when building for the build host, and to "other" when not
       building for the build host::
 
-         FOO_class-native = "native"
+         FOO:class-native = "native"
          FOO = "other"
 
       The underlying mechanism behind :term:`CLASSOVERRIDE` is simply
@@ -1246,7 +1246,7 @@ system and gives an overview of their function and contents.
       that identifies the resulting package. Then, provide a
       space-separated list of files. Here is an example::
 
-         CONFFILES_${PN} += "${sysconfdir}/file1 \
+         CONFFILES:${PN} += "${sysconfdir}/file1 \
              ${sysconfdir}/file2 ${sysconfdir}/file3"
 
       There is a relationship between the :term:`CONFFILES` and :term:`FILES`
@@ -1535,7 +1535,7 @@ system and gives an overview of their function and contents.
       package naming. You must use the package name as an override when you
       set this variable. Here is an example from the ``fontconfig`` recipe::
 
-         DEBIAN_NOAUTONAME_fontconfig-utils = "1"
+         DEBIAN_NOAUTONAME:fontconfig-utils = "1"
 
    :term:`DEBIANNAME`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
@@ -1545,7 +1545,7 @@ system and gives an overview of their function and contents.
       override when you set this variable. Here is an example from the
       ``dbus`` recipe::
 
-         DEBIANNAME_${PN} = "dbus-1"
+         DEBIANNAME:${PN} = "dbus-1"
 
    :term:`DEBUG_BUILD`
       Specifies to build packages with debugging information. This
@@ -2104,7 +2104,7 @@ system and gives an overview of their function and contents.
       to fix a runtime dependency to the exact same version of another
       package in the same recipe::
 
-         RDEPENDS_${PN}-additional-module = "${PN} (= ${EXTENDPKGV})"
+         RDEPENDS:${PN}-additional-module = "${PN} (= ${EXTENDPKGV})"
 
       The dependency relationships are intended to force the package
       manager to upgrade these types of packages in lock-step.
@@ -2204,7 +2204,7 @@ system and gives an overview of their function and contents.
       this variable, use an override for the associated image type. Here is
       an example::
 
-         EXTRA_IMAGECMD_ext3 ?= "-i 4096"
+         EXTRA_IMAGECMD:ext3 ?= "-i 4096"
 
    :term:`EXTRA_IMAGEDEPENDS`
       A list of recipes to build that do not provide packages for
@@ -2331,7 +2331,7 @@ system and gives an overview of their function and contents.
       list of files or paths that identify the files you want included as
       part of the resulting package. Here is an example::
 
-         FILES_${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
+         FILES:${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
 
       .. note::
 
@@ -2380,7 +2380,7 @@ system and gives an overview of their function and contents.
       :term:`FILESEXTRAPATHS` from within a ``.bbappend`` file and that you
       prepend paths as follows::
 
-         FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+         FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
       In the above example, the build system first
       looks for files in a directory that has the same name as the
@@ -2402,7 +2402,7 @@ system and gives an overview of their function and contents.
 
       Here is another common use::
 
-         FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+         FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
       In this example, the build system extends the
       :term:`FILESPATH` variable to include a directory named ``files`` that is
@@ -2410,13 +2410,13 @@ system and gives an overview of their function and contents.
 
       This next example specifically adds three paths::
 
-         FILESEXTRAPATHS_prepend := "path_1:path_2:path_3:"
+         FILESEXTRAPATHS:prepend := "path_1:path_2:path_3:"
 
       A final example shows how you can extend the search path and include
       a :term:`MACHINE`-specific override, which is useful
       in a BSP layer::
 
-          FILESEXTRAPATHS_prepend_intel-x86-common := "${THISDIR}/${PN}:"
+          FILESEXTRAPATHS:prepend_intel-x86-common := "${THISDIR}/${PN}:"
 
       The previous statement appears in the
       ``linux-yocto-dev.bbappend`` file, which is found in the
@@ -2664,7 +2664,7 @@ system and gives an overview of their function and contents.
 
       Here is an example from the ``dbus`` recipe::
 
-         GROUPADD_PARAM_${PN} = "-r netdev"
+         GROUPADD_PARAM:${PN} = "-r netdev"
 
       For information on the standard Linux shell command
       ``groupadd``, see https://linux.die.net/man/8/groupadd.
@@ -2977,7 +2977,7 @@ system and gives an overview of their function and contents.
       ``btrfs``, and so forth). When setting this variable, you should use
       an override for the associated type. Here is an example::
 
-         IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime \
+         IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime \
              --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 \
              ${EXTRA_IMAGECMD}"
 
@@ -3052,7 +3052,7 @@ system and gives an overview of their function and contents.
 
       When you use this variable, it is best to use it as follows::
 
-         IMAGE_INSTALL_append = " package-name"
+         IMAGE_INSTALL:append = " package-name"
 
       Be sure to include the space
       between the quotation character and the start of the package name or
@@ -3695,7 +3695,7 @@ system and gives an overview of their function and contents.
       recipe. The package name override must be used, which in this example
       is ``${PN}``::
 
-         INSANE_SKIP_${PN} += "dev-so"
+         INSANE_SKIP:${PN} += "dev-so"
 
       See the ":ref:`insane.bbclass <ref-classes-insane>`" section for a
       list of the valid QA checks you can specify using this variable.
@@ -3749,9 +3749,9 @@ system and gives an overview of their function and contents.
       ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend``.
       Here are the related statements from that append file::
 
-         KBRANCH_genericx86 = "standard/base"
-         KBRANCH_genericx86-64 = "standard/base"
-         KBRANCH_edgerouter = "standard/edgerouter"
+         KBRANCH:genericx86 = "standard/base"
+         KBRANCH:genericx86-64 = "standard/base"
+         KBRANCH:edgerouter = "standard/edgerouter"
          KBRANCH_beaglebone = "standard/beaglebone"
 
       The :term:`KBRANCH` statements
@@ -3784,7 +3784,7 @@ system and gives an overview of their function and contents.
 
       As an alternative, you can use the following within your append file::
 
-         KBUILD_DEFCONFIG_pn-linux-yocto ?= defconfig_file
+         KBUILD_DEFCONFIG:pn-linux-yocto ?= defconfig_file
 
       For more
       information on how to use the :term:`KBUILD_DEFCONFIG` variable, see the
@@ -3932,10 +3932,10 @@ system and gives an overview of their function and contents.
       statements add specific configurations to targeted machine types::
 
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-         KERNEL_FEATURES_append = "${KERNEL_EXTRA_FEATURES}"
-         KERNEL_FEATURES_append_qemuall = "cfg/virtio.scc"
-         KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
-         KERNEL_FEATURES_append_qemux86-64 = "cfg/sound.scc"
+         KERNEL_FEATURES:append = "${KERNEL_EXTRA_FEATURES}"
+         KERNEL_FEATURES:append:qemuall = "cfg/virtio.scc"
+         KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+         KERNEL_FEATURES:append:qemux86-64 = "cfg/sound.scc"
 
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
@@ -4123,7 +4123,7 @@ system and gives an overview of their function and contents.
          SRCREV_machine_core2-32-intel-common = "43b9eced9ba8a57add36af07736344dcc383f711"
          KMACHINE_core2-32-intel-common = "intel-core2-32"
          KBRANCH_core2-32-intel-common = "standard/base"
-         KERNEL_FEATURES_append_core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
+         KERNEL_FEATURES:append_core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
 
       The :term:`KMACHINE` statement says
       that the kernel understands the machine name as "intel-core2-32".
@@ -4303,8 +4303,8 @@ system and gives an overview of their function and contents.
       Documentation License 1.2 could be specified as follows::
 
          LICENSE = "GFDL-1.2 & GPLv2"
-         LICENSE_${PN} = "GPLv2"
-         LICENSE_${PN}-doc = "GFDL-1.2"
+         LICENSE:${PN} = "GPLv2"
+         LICENSE:${PN}-doc = "GFDL-1.2"
 
    :term:`LICENSE_CREATE_PACKAGE`
       Setting :term:`LICENSE_CREATE_PACKAGE` to "1" causes the OpenEmbedded
@@ -4615,7 +4615,7 @@ system and gives an overview of their function and contents.
       in QEMU, like in the following example from the ``connman-conf``
       recipe::
 
-         SRC_URI_append_qemuall = " file://wired.config \
+         SRC_URI:append:qemuall = " file://wired.config \
              file://wired-setup \
              "
 
@@ -4818,7 +4818,7 @@ system and gives an overview of their function and contents.
       can attach it to a specific image recipe by using the recipe name
       override::
 
-         NO_RECOMMENDATIONS_pn-target_image = "1"
+         NO_RECOMMENDATIONS:pn-target_image = "1"
 
       It is important to realize that if you choose to not install packages
       using this variable and some other packages are dependent on them
@@ -4846,9 +4846,9 @@ system and gives an overview of their function and contents.
       content of the debug package. For example::
 
          NOAUTOPACKAGEDEBUG = "1"
-         FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
-         FILES_${PN}-dbg = "/usr/src/debug/"
-         FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
+         FILES:${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
+         FILES:${PN}-dbg = "/usr/src/debug/"
+         FILES:${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
 
    :term:`NON_MULTILIB_RECIPES`
       A list of recipes that should not be built for multilib. OE-Core's
@@ -4959,7 +4959,7 @@ system and gives an overview of their function and contents.
       allows variables to be set for a single recipe within configuration
       (``.conf``) files. Here is an example::
 
-         FOO_pn-myrecipe = "myrecipe-specific value"
+         FOO:pn-myrecipe = "myrecipe-specific value"
 
       .. note::
 
@@ -5107,7 +5107,7 @@ system and gives an overview of their function and contents.
       can attach it to a specific image recipe by using the recipe name
       override::
 
-         PACKAGE_EXCLUDE_pn-target_image = "package_name"
+         PACKAGE_EXCLUDE:pn-target_image = "package_name"
 
       If you choose to not install a package using this variable and some
       other package is dependent on it (i.e. listed in a recipe's
@@ -5344,18 +5344,18 @@ system and gives an overview of their function and contents.
 
          Or, you can just append the variable::
 
-            PACKAGECONFIG_append = " f4"
+            PACKAGECONFIG:append = " f4"
 
       -  *Configuration file:* This method is identical to changing the
          block through an append file except you edit your ``local.conf``
          or ``mydistro.conf`` file. As with append files previously
          described, you can either completely override the variable::
 
-            PACKAGECONFIG_pn-recipename = "f4 f5"
+            PACKAGECONFIG:pn-recipename = "f4 f5"
 
          Or, you can just amend the variable::
 
-            PACKAGECONFIG_append_pn-recipename = " f4"
+            PACKAGECONFIG:append:pn-recipename = " f4"
 
    :term:`PACKAGECONFIG_CONFARGS`
       A space-separated list of configuration options generated from the
@@ -5775,13 +5775,13 @@ system and gives an overview of their function and contents.
       :term:`OVERRIDES` to set a machine-specific
       override. Here is an example::
 
-         PREFERRED_VERSION_linux-yocto_qemux86 = "5.0%"
+         PREFERRED_VERSION_linux-yocto:qemux86 = "5.0%"
 
       Although not recommended, worst case, you can also use the
       "forcevariable" override, which is the strongest override possible.
       Here is an example::
 
-         PREFERRED_VERSION_linux-yocto_forcevariable = "5.0%"
+         PREFERRED_VERSION_linux-yocto:forcevariable = "5.0%"
 
       .. note::
 
@@ -5809,7 +5809,7 @@ system and gives an overview of their function and contents.
       the ``local.conf`` configuration file in the
       :term:`Build Directory`::
 
-         PREMIRRORS_prepend = "\
+         PREMIRRORS:prepend = "\
              git://.*/.* http://www.yoctoproject.org/sources/ \n \
              ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
              http://.*/.* http://www.yoctoproject.org/sources/ \n \
@@ -5992,7 +5992,7 @@ system and gives an overview of their function and contents.
       Like all package-controlling variables, you must always use them in
       conjunction with a package name override. Here is an example::
 
-         RCONFLICTS_${PN} = "another_conflicting_package_name"
+         RCONFLICTS:${PN} = "another_conflicting_package_name"
 
       BitBake, which the OpenEmbedded build system uses, supports
       specifying versioned dependencies. Although the syntax varies
@@ -6000,7 +6000,7 @@ system and gives an overview of their function and contents.
       from you. Here is the general syntax to specify versions with the
       :term:`RCONFLICTS` variable::
 
-         RCONFLICTS_${PN} = "package (operator version)"
+         RCONFLICTS:${PN} = "package (operator version)"
 
       For ``operator``, you can specify the following:
 
@@ -6013,7 +6013,7 @@ system and gives an overview of their function and contents.
       For example, the following sets up a dependency on version 1.2 or
       greater of the package ``foo``::
 
-         RCONFLICTS_${PN} = "foo (>= 1.2)"
+         RCONFLICTS:${PN} = "foo (>= 1.2)"
 
    :term:`RDEPENDS`
       Lists runtime dependencies of a package. These dependencies are other
@@ -6022,7 +6022,7 @@ system and gives an overview of their function and contents.
       package ``foo`` needs the packages ``bar`` and ``baz`` to be
       installed::
 
-         RDEPENDS_foo = "bar baz"
+         RDEPENDS:foo = "bar baz"
 
       The most common types of package
       runtime dependencies are automatically detected and added. Therefore,
@@ -6063,7 +6063,7 @@ system and gives an overview of their function and contents.
       on the ``perl`` package. In this case, you would use the following
       :term:`RDEPENDS` statement::
 
-         RDEPENDS_${PN}-dev += "perl"
+         RDEPENDS:${PN}-dev += "perl"
 
       In the example,
       the development package depends on the ``perl`` package. Thus, the
@@ -6092,7 +6092,7 @@ system and gives an overview of their function and contents.
       from you. Here is the general syntax to specify versions with the
       :term:`RDEPENDS` variable::
 
-         RDEPENDS_${PN} = "package (operator version)"
+         RDEPENDS:${PN} = "package (operator version)"
 
       For ``operator``, you can specify the following:
 
@@ -6112,7 +6112,7 @@ system and gives an overview of their function and contents.
       For example, the following sets up a dependency on version 1.2 or
       greater of the package ``foo``::
 
-         RDEPENDS_${PN} = "foo (>= 1.2)"
+         RDEPENDS:${PN} = "foo (>= 1.2)"
 
       For information on build-time dependencies, see the
       :term:`DEPENDS` variable. You can also see the
@@ -6247,7 +6247,7 @@ system and gives an overview of their function and contents.
       variable in conjunction with a package name override. Here is an
       example::
 
-         RPROVIDES_${PN} = "widget-abi-2"
+         RPROVIDES:${PN} = "widget-abi-2"
 
    :term:`RRECOMMENDS`
       A list of packages that extends the usability of a package being
@@ -6278,7 +6278,7 @@ system and gives an overview of their function and contents.
       support wireless functionality. In this case, you would use the
       following::
 
-         RRECOMMENDS_${PN}-dev += "wireless_package_name"
+         RRECOMMENDS:${PN}-dev += "wireless_package_name"
 
       In the
       example, the package name (``${PN}-dev``) must appear as it would in
@@ -6291,7 +6291,7 @@ system and gives an overview of their function and contents.
       Here is the general syntax to specify versions with the
       :term:`RRECOMMENDS` variable::
 
-         RRECOMMENDS_${PN} = "package (operator version)"
+         RRECOMMENDS:${PN} = "package (operator version)"
 
       For ``operator``, you can specify the following:
 
@@ -6304,7 +6304,7 @@ system and gives an overview of their function and contents.
       For example, the following sets up a recommend on version 1.2 or
       greater of the package ``foo``::
 
-         RRECOMMENDS_${PN} = "foo (>= 1.2)"
+         RRECOMMENDS:${PN} = "foo (>= 1.2)"
 
    :term:`RREPLACES`
       A list of packages replaced by a package. The package manager uses
@@ -6316,7 +6316,7 @@ system and gives an overview of their function and contents.
       As with all package-controlling variables, you must use this variable
       in conjunction with a package name override. Here is an example::
 
-         RREPLACES_${PN} = "other_package_being_replaced"
+         RREPLACES:${PN} = "other_package_being_replaced"
 
       BitBake, which the OpenEmbedded build system uses, supports
       specifying versioned replacements. Although the syntax varies
@@ -6324,7 +6324,7 @@ system and gives an overview of their function and contents.
       from you. Here is the general syntax to specify versions with the
       :term:`RREPLACES` variable::
 
-         RREPLACES_${PN} = "package (operator version)"
+         RREPLACES:${PN} = "package (operator version)"
 
       For ``operator``, you can specify the following:
 
@@ -6337,7 +6337,7 @@ system and gives an overview of their function and contents.
       For example, the following sets up a replacement using version 1.2
       or greater of the package ``foo``::
 
-          RREPLACES_${PN} = "foo (>= 1.2)"
+          RREPLACES:${PN} = "foo (>= 1.2)"
 
    :term:`RSUGGESTS`
       A list of additional packages that you can suggest for installation
@@ -6348,7 +6348,7 @@ system and gives an overview of their function and contents.
       variable in conjunction with a package name override. Here is an
       example::
 
-         RSUGGESTS_${PN} = "useful_package another_package"
+         RSUGGESTS:${PN} = "useful_package another_package"
 
    :term:`S`
       The location in the :term:`Build Directory` where
@@ -7609,7 +7609,7 @@ system and gives an overview of their function and contents.
       override to indicate the package to which the value applies. Here is
       an example from the connman recipe::
 
-         SYSTEMD_SERVICE_${PN} = "connman.service"
+         SYSTEMD_SERVICE:${PN} = "connman.service"
 
    :term:`SYSVINIT_ENABLED_GETTYS`
       When using
@@ -7947,14 +7947,14 @@ system and gives an overview of their function and contents.
       your own tests to the list of tests by appending :term:`TEST_SUITES` as
       follows::
 
-         TEST_SUITES_append = " mytest"
+         TEST_SUITES:append = " mytest"
 
       Alternatively, you can
       provide the "auto" option to have all applicable tests run against
       the image.
       ::
 
-         TEST_SUITES_append = " auto"
+         TEST_SUITES:append = " auto"
 
       Using this option causes the
       build system to automatically run tests that are applicable to the
@@ -8215,7 +8215,7 @@ system and gives an overview of their function and contents.
       The BitBake configuration file (``meta/conf/bitbake.conf``) defines
       :term:`TUNE_FEATURES` as follows::
 
-         TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
+         TUNE_FEATURES ??= "${TUNE_FEATURES:tune-${DEFAULTTUNE}}"
 
       See the :term:`DEFAULTTUNE` variable for more information.
 
@@ -8241,13 +8241,13 @@ system and gives an overview of their function and contents.
       the architecture, ABI, and tuning of output packages. The specific
       tune is defined using the "_tune" override as follows::
 
-         TUNE_PKGARCH_tune-tune = "tune"
+         TUNE_PKGARCH:tune-tune = "tune"
 
       These tune-specific package architectures are defined in the machine
       include files. Here is an example of the "core2-32" tuning as used in
       the ``meta/conf/machine/include/tune-core2.inc`` file::
 
-         TUNE_PKGARCH_tune-core2-32 = "core2-32"
+         TUNE_PKGARCH:tune-core2-32 = "core2-32"
 
    :term:`TUNEABI`
       An underlying Application Binary Interface (ABI) used by a particular
@@ -8614,7 +8614,7 @@ system and gives an overview of their function and contents.
 
       Here is an example from the ``dbus`` recipe::
 
-         USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
+         USERADD_PARAM:${PN} = "--system --home ${localstatedir}/lib/dbus \
                                 --no-create-home --shell /bin/false \
                                 --user-group messagebus"
 
-- 
2.25.1

