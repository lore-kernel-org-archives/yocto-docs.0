Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.13290.1628102076825433486
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 11:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 64137E0003;
	Wed,  4 Aug 2021 18:34:35 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/6] dev-manual: overrides syntax updates
Date: Wed,  4 Aug 2021 20:34:22 +0200
Message-Id: <20210804183426.22333-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
References: <20210804183426.22333-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with openembedded-core/scripts/contrib/convert-overrides.py

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 196 +++++++++++-----------
 1 file changed, 98 insertions(+), 98 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 7fa0df4d39..2ada8ed5cb 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -212,27 +212,27 @@ following list:
       You should follow the same strategy when using ``_append``
       and ``_prepend`` operations::
 
-         DEPENDS_append_one = " foo"
-         DEPENDS_prepend_one = "foo "
+         DEPENDS:append_one = " foo"
+         DEPENDS:prepend_one = "foo "
 
       As an actual example, here's a
       snippet from the generic kernel include file ``linux-yocto.inc``,
       wherein the kernel compile and link options are adjusted in the
       case of a subset of the supported architectures::
 
-         DEPENDS_append_aarch64 = " libgcc"
-         KERNEL_CC_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
-         KERNEL_LD_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
+         DEPENDS:append:aarch64 = " libgcc"
+         KERNEL_CC:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
+         KERNEL_LD:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
 
-         DEPENDS_append_nios2 = " libgcc"
-         KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
-         KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
+         DEPENDS:append:nios2 = " libgcc"
+         KERNEL_CC:append:nios2 = " ${TOOLCHAIN_OPTIONS}"
+         KERNEL_LD:append:nios2 = " ${TOOLCHAIN_OPTIONS}"
 
-         DEPENDS_append_arc = " libgcc"
-         KERNEL_CC_append_arc = " ${TOOLCHAIN_OPTIONS}"
-         KERNEL_LD_append_arc = " ${TOOLCHAIN_OPTIONS}"
+         DEPENDS:append:arc = " libgcc"
+         KERNEL_CC:append:arc = " ${TOOLCHAIN_OPTIONS}"
+         KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
 
-         KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
+         KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
 
       .. note::
 
@@ -247,7 +247,7 @@ following list:
       at ``meta-one/recipes-core/base-files/base-files.bbappend`` could
       extend :term:`FILESPATH` using :term:`FILESEXTRAPATHS` as follows::
 
-         FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
+         FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
 
       The build for machine "one" will pick up your machine-specific file as
       long as you have the file in
@@ -512,7 +512,7 @@ Following is the append file, which is named ``formfactor_0.0.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
 file is in the layer at ``recipes-bsp/formfactor``::
 
-   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 By default, the build system uses the
 :term:`FILESPATH` variable to
@@ -832,7 +832,7 @@ all images, which might not be what you require.
 To add a package to your image using the local configuration file, use
 the :term:`IMAGE_INSTALL` variable with the ``_append`` operator::
 
-   IMAGE_INSTALL_append = " strace"
+   IMAGE_INSTALL:append = " strace"
 
 Use of the syntax is important -
 specifically, the space between the quote and the package name, which is
@@ -850,7 +850,7 @@ As shown in its simplest use, ``IMAGE_INSTALL_append`` affects all
 images. It is possible to extend the syntax so that the variable applies
 to a specific image only. Here is an example::
 
-   IMAGE_INSTALL_append_pn-core-image-minimal = " strace"
+   IMAGE_INSTALL:append:pn-core-image-minimal = " strace"
 
 This example adds ``strace`` to the ``core-image-minimal`` image only.
 
@@ -976,17 +976,17 @@ the full packagegroup name ``packagegroup-custom``::
        ${PN}-tools \
        "
 
-   RDEPENDS_${PN}-apps = "\
+   RDEPENDS:${PN}-apps = "\
        dropbear \
        portmap \
        psplash"
 
-   RDEPENDS_${PN}-tools = "\
+   RDEPENDS:${PN}-tools = "\
        oprofile \
        oprofileui-server \
        lttng-tools"
 
-   RRECOMMENDS_${PN}-tools = "\
+   RRECOMMENDS:${PN}-tools = "\
        kernel-module-oprofile"
 
 In the previous example, two package group packages are created with
@@ -1013,7 +1013,7 @@ configuration file. Use the following in an append file::
 
 Use the following in a configuration file::
 
-   hostname_pn-base-files = "myhostname"
+   hostname:pn-base-files = "myhostname"
 
 Changing the default value of the variable "hostname" can be useful in
 certain situations. For example, suppose you need to do extensive
@@ -1028,7 +1028,7 @@ Another point of interest is that if you unset the variable, the image
 will have no default hostname in the filesystem. Here is an example that
 unsets the variable in a configuration file::
 
-  hostname_pn-base-files = ""
+  hostname:pn-base-files = ""
 
 Having no default hostname in the filesystem is suitable for
 environments that use dynamic hostnames such as virtual machines.
@@ -2300,7 +2300,7 @@ compiler. For example, the application might need an additional header
 path. You can accomplish this by adding to the :term:`CFLAGS` variable. The
 following example shows this::
 
-   CFLAGS_prepend = "-I ${S}/include "
+   CFLAGS:prepend = "-I ${S}/include "
 
 In the following example, ``mtd-utils`` is a makefile-based package::
 
@@ -2330,9 +2330,9 @@ In the following example, ``mtd-utils`` is a makefile-based package::
 
    PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
 
-   FILES_mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
-   FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
-   FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
+   FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
+   FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
+   FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
 
    PARALLEL_MAKE = ""
 
@@ -2360,8 +2360,8 @@ into separate packages::
    XORG_PN = "libXpm"
 
    PACKAGES =+ "sxpm cxpm"
-   FILES_cxpm = "${bindir}/cxpm"
-   FILES_sxpm = "${bindir}/sxpm"
+   FILES:cxpm = "${bindir}/cxpm"
+   FILES:sxpm = "${bindir}/sxpm"
 
 In the previous example, we want to ship the ``sxpm`` and ``cxpm``
 binaries in separate packages. Since ``bindir`` would be packaged into
@@ -2504,7 +2504,7 @@ chapter of the BitBake User Manual.
 
       S = "${WORKDIR}/postfix-${PV}"
       CFLAGS += "-DNO_ASM"
-      SRC_URI_append = " file://fixup.patch"
+      SRC_URI:append = " file://fixup.patch"
 
 -  *Functions:* Functions provide a series of actions to be performed.
    You usually use functions to override the default implementation of a
@@ -2641,13 +2641,13 @@ in the BitBake User Manual.
    start to ensure the appended value is not merged with the existing
    value::
 
-      SRC_URI_append = " file://fix-makefile.patch"
+      SRC_URI:append = " file://fix-makefile.patch"
 
    You can also use
    the ``_append`` operator with overrides, which results in the actions
    only being performed for the specified target or machine::
 
-      SRC_URI_append_sh4 = " file://fix-makefile.patch"
+      SRC_URI:append:sh4 = " file://fix-makefile.patch"
 
 -  *Prepending (_prepend):* Use the ``_prepend`` operator to prepend
    values to existing variables. This operator does not add any
@@ -2659,13 +2659,13 @@ in the BitBake User Manual.
    end to ensure the prepended value is not merged with the existing
    value::
 
-      CFLAGS_prepend = "-I${S}/myincludes "
+      CFLAGS:prepend = "-I${S}/myincludes "
 
    You can also use the
    ``_prepend`` operator with overrides, which results in the actions
    only being performed for the specified target or machine::
 
-      CFLAGS_prepend_sh4 = "-I${S}/myincludes "
+      CFLAGS:prepend:sh4 = "-I${S}/myincludes "
 
 -  *Overrides:* You can use overrides to set a value conditionally,
    typically based on how the recipe is being built. For example, to set
@@ -2676,7 +2676,7 @@ in the BitBake User Manual.
    you would do the following::
 
       KBRANCH = "standard/base"
-      KBRANCH_qemuarm = "standard/arm-versatile-926ejs"
+      KBRANCH:qemuarm = "standard/arm-versatile-926ejs"
 
    Overrides are also used to separate
    alternate values of a variable in other situations. For example, when
@@ -2951,7 +2951,7 @@ The following steps describe how to set up the AUH utility:
          If your distro does not enable by default ptest, which Poky
          does, you need the following in your ``local.conf`` file::
 
-                 DISTRO_FEATURES_append = " ptest"
+                 DISTRO_FEATURES:append = " ptest"
 
 
 6. *Optionally Start a vncserver:* If you are running in a server
@@ -4301,7 +4301,7 @@ point to your external source code. Here are the statements to put in
 your ``local.conf`` file::
 
    INHERIT += "externalsrc"
-   EXTERNALSRC_pn-myrecipe = "path-to-your-source-tree"
+   EXTERNALSRC:pn-myrecipe = "path-to-your-source-tree"
 
 This next example shows how to accomplish the same thing by setting
 :term:`EXTERNALSRC` in the recipe itself or in the recipe's append file::
@@ -4323,7 +4323,7 @@ some other nominated directory, you can set
 :term:`EXTERNALSRC_BUILD`
 to point to that directory::
 
-   EXTERNALSRC_BUILD_pn-myrecipe = "path-to-your-source-tree"
+   EXTERNALSRC_BUILD:pn-myrecipe = "path-to-your-source-tree"
 
 Replicating a Build Offline
 ---------------------------
@@ -4597,7 +4597,7 @@ how the static library files are defined::
    PACKAGES_DYNAMIC = "^${PN}-locale-.*"
    FILES = ""
 
-   FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+   FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
                ${sysconfdir} ${sharedstatedir} ${localstatedir} \
                ${base_bindir}/* ${base_sbindir}/* \
                ${base_libdir}/*${SOLIBS} \
@@ -4607,24 +4607,24 @@ how the static library files are defined::
                ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
                ${libdir}/bonobo/servers"
 
-   FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
+   FILES:${PN}-bin = "${bindir}/* ${sbindir}/*"
 
-   FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
+   FILES:${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
                ${datadir}/gnome/help"
-   SECTION_${PN}-doc = "doc"
+   SECTION:${PN}-doc = "doc"
 
    FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
-   FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
+   FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                    ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                    ${datadir}/aclocal ${base_libdir}/*.o \
                    ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
-   SECTION_${PN}-dev = "devel"
-   ALLOW_EMPTY_${PN}-dev = "1"
-   RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
+   SECTION:${PN}-dev = "devel"
+   ALLOW_EMPTY:${PN}-dev = "1"
+   RDEPENDS:${PN}-dev = "${PN} (= ${EXTENDPKGV})"
 
-   FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
-   SECTION_${PN}-staticdev = "devel"
-   RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
+   FILES:${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
+   SECTION:${PN}-staticdev = "devel"
+   RDEPENDS:${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
 Combining Multiple Versions of Library Files into One Image
 -----------------------------------------------------------
@@ -4701,8 +4701,8 @@ configuration would be as follows::
    MACHINE = "qemux86-64"
    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
-   DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
-   IMAGE_INSTALL_append = "lib32-glib-2.0"
+   DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
+   IMAGE_INSTALL:append = "lib32-glib-2.0"
 
 This example enables an additional library named
 ``lib32`` alongside the normal target packages. When combining these
@@ -4749,7 +4749,7 @@ Here are the implementation details for the RPM Package Management System:
    :term:`Build Directory`. For
    example, consider ``lib32`` in a ``qemux86-64`` image. The possible
    architectures in the system are "all", "qemux86_64",
-   "lib32_qemux86_64", and "lib32_x86".
+   "lib32:qemux86_64", and "lib32:x86".
 
 -  The ``${MLPREFIX}`` variable is stripped from ``${PN}`` during RPM
    packaging. The naming for a normal RPM package and a Multilib RPM
@@ -4768,7 +4768,7 @@ Here are the implementation details for the IPK Package Management System:
 -  The ``${MLPREFIX}`` is not stripped from ``${PN}`` during IPK
    packaging. The naming for a normal RPM package and a Multilib IPK
    package in a ``qemux86-64`` system resolves to something like
-   ``bash_4.1-r2.x86_64.ipk`` and ``lib32-bash_4.1-rw_x86.ipk``,
+   ``bash_4.1-r2.x86_64.ipk`` and ``lib32-bash_4.1-rw:x86.ipk``,
    respectively.
 
 -  The IPK deploy folder is not modified with ``${MLPREFIX}`` because
@@ -4857,7 +4857,7 @@ configuration file as follows::
 
    MACHINE = "qemux86-64"
    DEFAULTTUNE = "x86-64-x32"
-   baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE') \
+   baselib = "${@d.getVar('BASE_LIB:tune-' + (d.getVar('DEFAULTTUNE') \
        or 'INVALID')) or 'lib'}"
 
 Once you have set
@@ -6514,7 +6514,7 @@ setting the appropriate values for ``FILES_packagename``,
 ``RDEPENDS_packagename``, ``DESCRIPTION_packagename``, and so forth.
 Here is an example from the ``lighttpd`` recipe::
 
-   python populate_packages_prepend () {
+   python populate_packages:prepend () {
        lighttpd_libdir = d.expand('${libdir}')
        do_split_packages(d, lighttpd_libdir, '^mod_(.*).so$',
                         'lighttpd-module-%s', 'Lighttpd module for %s',
@@ -7101,7 +7101,7 @@ To add package testing to your build, add the
 variables to your ``local.conf`` file, which is found in the
 :term:`Build Directory`::
 
-   DISTRO_FEATURES_append = " ptest"
+   DISTRO_FEATURES:append = " ptest"
    EXTRA_IMAGE_FEATURES += "ptest-pkgs"
 
 Once your build is complete, the ptest files are installed into the
@@ -7145,7 +7145,7 @@ test. Here is what you have to do for each recipe:
    your recipe in order for the package to meet the dependencies. Here
    is an example where the package has a runtime dependency on "make"::
 
-      RDEPENDS_${PN}-ptest += "make"
+      RDEPENDS:${PN}-ptest += "make"
 
 -  *Add a function to build the test suite:* Not many packages support
    cross-compilation of their test suites. Consequently, you usually
@@ -7289,11 +7289,11 @@ The ``devtool edit-recipe`` command lets you take a look at the recipe::
        "
    S = "${WORKDIR}/npm"
    inherit npm
-   LICENSE_${PN} = "MIT"
-   LICENSE_${PN}-accepts = "MIT"
-   LICENSE_${PN}-array-flatten = "MIT"
+   LICENSE:${PN} = "MIT"
+   LICENSE:${PN}-accepts = "MIT"
+   LICENSE:${PN}-array-flatten = "MIT"
    ...
-   LICENSE_${PN}-vary = "MIT"
+   LICENSE:${PN}-vary = "MIT"
 
 Here are three key points in the previous example:
 
@@ -7523,7 +7523,7 @@ Using systemd Exclusively
 
 Set these variables in your distribution configuration file as follows::
 
-   DISTRO_FEATURES_append = " systemd"
+   DISTRO_FEATURES:append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
 
 You can also prevent the SysVinit distribution feature from
@@ -7547,7 +7547,7 @@ Using systemd for the Main Image and Using SysVinit for the Rescue Image
 
 Set these variables in your distribution configuration file as follows::
 
-   DISTRO_FEATURES_append = " systemd"
+   DISTRO_FEATURES:append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
 
 Doing so causes your main image to use the
@@ -7646,7 +7646,7 @@ the recipe needs to reference
 Then, you can add the following to your
 ``local.conf``::
 
-   SRCREV_pn-PN = "${AUTOREV}"
+   SRCREV:pn-PN = "${AUTOREV}"
 
 :term:`PN` is the name of the recipe for
 which you want to enable automatic source revision updating.
@@ -7669,17 +7669,17 @@ listed include file that contains numerous lines of exactly that form::
    #SRCREV_pn-opkg ?= "${AUTOREV}"
    #SRCREV_pn-opkg-utils-native ?= "${AUTOREV}"
    #SRCREV_pn-opkg-utils ?= "${AUTOREV}"
-   SRCREV_pn-gconf-dbus ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-common ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-config-gtk ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-desktop ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-keyboard ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-panel-2 ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-themes-extra ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-terminal ?= "${AUTOREV}"
-   SRCREV_pn-matchbox-wm ?= "${AUTOREV}"
-   SRCREV_pn-settings-daemon ?= "${AUTOREV}"
-   SRCREV_pn-screenshot ?= "${AUTOREV}"
+   SRCREV:pn-gconf-dbus ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-common ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-config-gtk ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-desktop ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-keyboard ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-panel-2 ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-themes-extra ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-terminal ?= "${AUTOREV}"
+   SRCREV:pn-matchbox-wm ?= "${AUTOREV}"
+   SRCREV:pn-settings-daemon ?= "${AUTOREV}"
+   SRCREV:pn-screenshot ?= "${AUTOREV}"
    . . .
 
 These lines allow you to
@@ -7922,25 +7922,25 @@ output from this command::
 
    $ buildhistory-collect-srcrevs -a
    # i586-poky-linux
-   SRCREV_pn-glibc = "b8079dd0d360648e4e8de48656c5c38972621072"
-   SRCREV_pn-glibc-initial = "b8079dd0d360648e4e8de48656c5c38972621072"
-   SRCREV_pn-opkg-utils = "53274f087565fd45d8452c5367997ba6a682a37a"
-   SRCREV_pn-kmod = "fd56638aed3fe147015bfa10ed4a5f7491303cb4"
+   SRCREV:pn-glibc = "b8079dd0d360648e4e8de48656c5c38972621072"
+   SRCREV:pn-glibc-initial = "b8079dd0d360648e4e8de48656c5c38972621072"
+   SRCREV:pn-opkg-utils = "53274f087565fd45d8452c5367997ba6a682a37a"
+   SRCREV:pn-kmod = "fd56638aed3fe147015bfa10ed4a5f7491303cb4"
    # x86_64-linux
-   SRCREV_pn-gtk-doc-stub-native = "1dea266593edb766d6d898c79451ef193eb17cfa"
-   SRCREV_pn-dtc-native = "65cc4d2748a2c2e6f27f1cf39e07a5dbabd80ebf"
-   SRCREV_pn-update-rc.d-native = "eca680ddf28d024954895f59a241a622dd575c11"
-   SRCREV_glibc_pn-cross-localedef-native = "b8079dd0d360648e4e8de48656c5c38972621072"
-   SRCREV_localedef_pn-cross-localedef-native = "c833367348d39dad7ba018990bfdaffaec8e9ed3"
-   SRCREV_pn-prelink-native = "faa069deec99bf61418d0bab831c83d7c1b797ca"
-   SRCREV_pn-opkg-utils-native = "53274f087565fd45d8452c5367997ba6a682a37a"
-   SRCREV_pn-kern-tools-native = "23345b8846fe4bd167efdf1bd8a1224b2ba9a5ff"
-   SRCREV_pn-kmod-native = "fd56638aed3fe147015bfa10ed4a5f7491303cb4"
+   SRCREV:pn-gtk-doc-stub-native = "1dea266593edb766d6d898c79451ef193eb17cfa"
+   SRCREV:pn-dtc-native = "65cc4d2748a2c2e6f27f1cf39e07a5dbabd80ebf"
+   SRCREV:pn-update-rc.d-native = "eca680ddf28d024954895f59a241a622dd575c11"
+   SRCREV_glibc:pn-cross-localedef-native = "b8079dd0d360648e4e8de48656c5c38972621072"
+   SRCREV_localedef:pn-cross-localedef-native = "c833367348d39dad7ba018990bfdaffaec8e9ed3"
+   SRCREV:pn-prelink-native = "faa069deec99bf61418d0bab831c83d7c1b797ca"
+   SRCREV:pn-opkg-utils-native = "53274f087565fd45d8452c5367997ba6a682a37a"
+   SRCREV:pn-kern-tools-native = "23345b8846fe4bd167efdf1bd8a1224b2ba9a5ff"
+   SRCREV:pn-kmod-native = "fd56638aed3fe147015bfa10ed4a5f7491303cb4"
    # qemux86-poky-linux
-   SRCREV_machine_pn-linux-yocto = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
-   SRCREV_meta_pn-linux-yocto = "a227f20eff056e511d504b2e490f3774ab260d6f"
+   SRCREV_machine:pn-linux-yocto = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
+   SRCREV_meta:pn-linux-yocto = "a227f20eff056e511d504b2e490f3774ab260d6f"
    # all-poky-linux
-   SRCREV_pn-update-rc.d = "eca680ddf28d024954895f59a241a622dd575c11"
+   SRCREV:pn-update-rc.d = "eca680ddf28d024954895f59a241a622dd575c11"
 
 .. note::
 
@@ -8564,11 +8564,11 @@ Here are some things to keep in mind when running tests:
 
 -  The default tests for the image are defined as::
 
-      DEFAULT_TEST_SUITES_pn-image = "ping ssh df connman syslog xorg scp vnc date rpm dnf dmesg"
+      DEFAULT_TEST_SUITES:pn-image = "ping ssh df connman syslog xorg scp vnc date rpm dnf dmesg"
 
 -  Add your own test to the list of the by using the following::
 
-      TEST_SUITES_append = " mytest"
+      TEST_SUITES:append = " mytest"
 
 -  Run a specific list of tests as follows::
 
@@ -9715,7 +9715,7 @@ To run a ``debuginfod`` server, you need to do the following:
    (it already is in ``OpenEmbedded-core`` defaults and ``poky`` reference distribution).
    If not, set in your distro config file or in ``local.conf``::
 
-      DISTRO_FEATURES_append = " debuginfod"
+      DISTRO_FEATURES:append = " debuginfod"
 
    This distro feature enables the server and client library in ``elfutils``,
    and enables ``debuginfod`` support in clients (at the moment, ``gdb`` and ``binutils``).
@@ -9802,7 +9802,7 @@ debugger.
    Make the following addition in either your ``local.conf`` file or in
    an image recipe::
 
-      IMAGE_INSTALL_append = " gdbserver"
+      IMAGE_INSTALL:append = " gdbserver"
 
    The change makes
    sure the ``gdbserver`` package is included.
@@ -9938,21 +9938,21 @@ To support this kind of debugging, you need do the following:
 -  Ensure that GDB is on the target. You can do this by adding "gdb" to
    :term:`IMAGE_INSTALL`::
 
-      IMAGE_INSTALL_append = " gdb"
+      IMAGE_INSTALL:append = " gdb"
 
    Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`::
 
-      IMAGE_FEATURES_append = " tools-debug"
+      IMAGE_FEATURES:append = " tools-debug"
 
 -  Ensure that debug symbols are present. You can make sure these
    symbols are present by installing ``-dbg``::
 
-      IMAGE_INSTALL_append = "packagename-dbg"
+      IMAGE_INSTALL:append = "packagename-dbg"
 
    Alternatively, you can do the following to include
    all the debug symbols::
 
-      IMAGE_FEATURES_append = " dbg-pkgs"
+      IMAGE_FEATURES:append = " dbg-pkgs"
 
 .. note::
 
@@ -11274,7 +11274,7 @@ support, include the "wayland" flag in the
 :term:`DISTRO_FEATURES`
 statement in your ``local.conf`` file::
 
-   DISTRO_FEATURES_append = " wayland"
+   DISTRO_FEATURES:append = " wayland"
 
 .. note::
 
-- 
2.25.1

