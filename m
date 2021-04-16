Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.281.1618595776799312059
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 10:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id C721C100004;
	Fri, 16 Apr 2021 17:56:14 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 3/3] manuals: code insertion simplification over two lines
Date: Fri, 16 Apr 2021 19:55:49 +0200
Message-Id: <20210416175549.161851-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
References: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This simplifies paragraphs ending with a colon and followed
by code insertion.

Automatically substituted through the command:
sed -i -z "s/:\n\s*::/::/g" file.rst

This generates identical HTML output.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst     | 1020 ++++++-----------
 documentation/dev-manual/qemu.rst             |   24 +-
 documentation/dev-manual/start.rst            |   30 +-
 documentation/kernel-dev/advanced.rst         |   87 +-
 documentation/kernel-dev/common.rst           |  225 ++--
 documentation/kernel-dev/concepts-appx.rst    |    6 +-
 documentation/kernel-dev/faq.rst              |    6 +-
 documentation/kernel-dev/maint-appx.rst       |   15 +-
 documentation/overview-manual/concepts.rst    |   51 +-
 .../development-environment.rst               |    6 +-
 documentation/ref-manual/classes.rst          |   87 +-
 .../ref-manual/devtool-reference.rst          |   51 +-
 documentation/ref-manual/faq.rst              |   12 +-
 documentation/ref-manual/features.rst         |    3 +-
 documentation/ref-manual/images.rst           |    3 +-
 documentation/ref-manual/kickstart.rst        |    6 +-
 documentation/ref-manual/migration-1.3.rst    |    3 +-
 documentation/ref-manual/migration-1.4.rst    |    6 +-
 documentation/ref-manual/migration-1.6.rst    |    6 +-
 documentation/ref-manual/migration-1.7.rst    |    6 +-
 documentation/ref-manual/migration-2.0.rst    |    9 +-
 documentation/ref-manual/migration-2.1.rst    |    9 +-
 documentation/ref-manual/migration-2.2.rst    |   12 +-
 documentation/ref-manual/migration-2.3.rst    |   16 +-
 documentation/ref-manual/migration-2.5.rst    |    6 +-
 documentation/ref-manual/migration-2.6.rst    |   15 +-
 documentation/ref-manual/migration-3.1.rst    |    3 +-
 documentation/ref-manual/qa-checks.rst        |    9 +-
 documentation/ref-manual/structure.rst        |   18 +-
 .../ref-manual/system-requirements.rst        |   69 +-
 documentation/ref-manual/tasks.rst            |   48 +-
 documentation/ref-manual/terms.rst            |    3 +-
 documentation/ref-manual/variables.rst        |  849 +++++---------
 .../sdk-manual/appendix-customizing.rst       |   27 +-
 documentation/sdk-manual/appendix-obtain.rst  |   30 +-
 documentation/sdk-manual/extensible.rst       |   81 +-
 documentation/sdk-manual/using.rst            |    6 +-
 documentation/sdk-manual/working-projects.rst |   60 +-
 38 files changed, 974 insertions(+), 1949 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b3ee2b13b4..dcd3a11c3e 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -49,15 +49,13 @@ Follow these general steps to create your layer without using tools:
    (e.g. the cloned ``poky`` repository).
 
    While not strictly required, prepend the name of the directory with
-   the string "meta-". For example:
-   ::
+   the string "meta-". For example::
 
       meta-mylayer
       meta-GUI_xyz
       meta-mymachine
 
-   With rare exceptions, a layer's name follows this form:
-   ::
+   With rare exceptions, a layer's name follows this form::
 
       meta-root_name
 
@@ -77,8 +75,7 @@ Follow these general steps to create your layer without using tools:
    :yocto_git:`Source Repositories </poky/tree/meta-yocto-bsp/conf>`
    demonstrates the required syntax. For your layer, you need to replace
    "yoctobsp" with a unique identifier for your layer (e.g. "machinexyz"
-   for a layer named "meta-machinexyz"):
-   ::
+   for a layer named "meta-machinexyz")::
 
       # We have a conf and classes directory, add to BBPATH
       BBPATH .= ":${LAYERDIR}"
@@ -195,8 +192,7 @@ following list:
       machine "one". To do so, you use an append file named
       ``base-files.bbappend`` and create a dependency on "foo" by
       altering the :term:`DEPENDS`
-      variable:
-      ::
+      variable::
 
          DEPENDS = "foo"
 
@@ -209,14 +205,12 @@ following list:
       ``foo``.
 
       To make sure your changes apply only when building machine "one",
-      use a machine override with the ``DEPENDS`` statement:
-      ::
+      use a machine override with the ``DEPENDS`` statement::
 
          DEPENDS_one = "foo"
 
       You should follow the same strategy when using ``_append``
-      and ``_prepend`` operations:
-      ::
+      and ``_prepend`` operations::
 
          DEPENDS_append_one = " foo"
          DEPENDS_prepend_one = "foo "
@@ -224,8 +218,7 @@ following list:
       As an actual example, here's a
       snippet from the generic kernel include file ``linux-yocto.inc``,
       wherein the kernel compile and link options are adjusted in the
-      case of a subset of the supported architectures:
-      ::
+      case of a subset of the supported architectures::
 
          DEPENDS_append_aarch64 = " libgcc"
          KERNEL_CC_append_aarch64 = " ${TOOLCHAIN_OPTIONS}"
@@ -252,8 +245,7 @@ following list:
       file, you can use an append file to cause the build to use your
       own version of the file. For example, an append file in your layer
       at ``meta-one/recipes-core/base-files/base-files.bbappend`` could
-      extend :term:`FILESPATH` using :term:`FILESEXTRAPATHS` as follows:
-      ::
+      extend :term:`FILESPATH` using :term:`FILESEXTRAPATHS` as follows::
 
          FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
 
@@ -375,8 +367,7 @@ the COMMON and DISTRO related tests. Furthermore, if your layer is a BSP
 layer, the layer must pass the COMMON and BSP set of tests.
 
 To execute the script, enter the following commands from your build
-directory:
-::
+directory::
 
    $ source oe-init-build-env
    $ yocto-check-layer your_layer_directory
@@ -432,8 +423,7 @@ enable it. To enable your layer, simply add your layer's path to the
 ``BBLAYERS`` variable in your ``conf/bblayers.conf`` file, which is
 found in the :term:`Build Directory`.
 The following example shows how to enable a layer named
-``meta-mylayer``:
-::
+``meta-mylayer``::
 
    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -488,8 +478,7 @@ As an example, consider the main formfactor recipe and a corresponding
 formfactor append file both from the :term:`Source Directory`.
 Here is the main
 formfactor recipe, which is named ``formfactor_0.0.bb`` and located in
-the "meta" layer at ``meta/recipes-bsp/formfactor``:
-::
+the "meta" layer at ``meta/recipes-bsp/formfactor``::
 
    SUMMARY = "Device formfactor information"
    DESCRIPTION = "A formfactor configuration file provides information about the \
@@ -521,8 +510,7 @@ during the build.
 
 Following is the append file, which is named ``formfactor_0.0.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
-file is in the layer at ``recipes-bsp/formfactor``:
-::
+file is in the layer at ``recipes-bsp/formfactor``::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -570,8 +558,7 @@ build system to calculate it based on the layer's dependencies.
 
 To specify the layer's priority manually, use the
 :term:`BBFILE_PRIORITY`
-variable and append the layer's root name:
-::
+variable and append the layer's root name::
 
    BBFILE_PRIORITY_mylayer = "1"
 
@@ -595,8 +582,7 @@ with their paths and priorities and on ``.bbappend`` files and their
 applicable recipes can help to reveal potential problems.
 
 For help on the BitBake layer management tool, use the following
-command:
-::
+command::
 
    $ bitbake-layers --help
    NOTE: Starting bitbake server...
@@ -676,8 +662,7 @@ The following list describes the available commands:
       variable values, you need to tidy these up yourself. Consider the
       following example. Here, the ``bitbake-layers`` command adds the
       line ``#### bbappended ...`` so that you know where the following
-      lines originate:
-      ::
+      lines originate::
 
          ...
          DESCRIPTION = "A useful utility"
@@ -691,8 +676,7 @@ The following list describes the available commands:
          EXTRA_OECONF += "--enable-somethingelse"
 
 
-      Ideally, you would tidy up these utilities as follows:
-      ::
+      Ideally, you would tidy up these utilities as follows::
 
          ...
          DESCRIPTION = "Customized utility"
@@ -746,14 +730,12 @@ create a layer with the following:
 
 In its simplest form, you can use the following command form to create a
 layer. The command creates a layer whose name corresponds to
-"your_layer_name" in the current directory:
-::
+"your_layer_name" in the current directory::
 
    $ bitbake-layers create-layer your_layer_name
 
 As an example, the following command creates a layer named ``meta-scottrif``
-in your home directory:
-::
+in your home directory::
 
    $ cd /usr/home
    $ bitbake-layers create-layer meta-scottrif
@@ -770,8 +752,7 @@ default, you can use the ``--example-recipe-name`` option.
 
 The easiest way to see how the ``bitbake-layers create-layer`` command
 works is to experiment with the script. You can also read the usage
-information by entering the following:
-::
+information by entering the following::
 
    $ bitbake-layers create-layer --help
    NOTE: Starting bitbake server...
@@ -799,16 +780,14 @@ Once you create your general layer, you must add it to your
 makes the OpenEmbedded build system aware of your layer so that it can
 search it for metadata.
 
-Add your layer by using the ``bitbake-layers add-layer`` command:
-::
+Add your layer by using the ``bitbake-layers add-layer`` command::
 
    $ bitbake-layers add-layer your_layer_name
 
 Here is an example that adds a
 layer named ``meta-scottrif`` to the configuration file. Following the
 command that adds the layer is another ``bitbake-layers`` command that
-shows the layers that are in your ``bblayers.conf`` file:
-::
+shows the layers that are in your ``bblayers.conf`` file::
 
    $ bitbake-layers add-layer meta-scottrif
    NOTE: Starting bitbake server...
@@ -851,8 +830,7 @@ variable changes are in effect for every build and consequently affect
 all images, which might not be what you require.
 
 To add a package to your image using the local configuration file, use
-the ``IMAGE_INSTALL`` variable with the ``_append`` operator:
-::
+the ``IMAGE_INSTALL`` variable with the ``_append`` operator::
 
    IMAGE_INSTALL_append = " strace"
 
@@ -870,8 +848,7 @@ takes effect.
 
 As shown in its simplest use, ``IMAGE_INSTALL_append`` affects all
 images. It is possible to extend the syntax so that the variable applies
-to a specific image only. Here is an example:
-::
+to a specific image only. Here is an example::
 
    IMAGE_INSTALL_append_pn-core-image-minimal = " strace"
 
@@ -942,8 +919,7 @@ Customizing Images Using Custom .bb Files
 
 You can also customize an image by creating a custom recipe that defines
 additional software as part of the image. The following example shows
-the form for the two lines you need:
-::
+the form for the two lines you need::
 
    IMAGE_INSTALL = "packagegroup-core-x11-base package1 package2"
    inherit core-image
@@ -958,8 +934,7 @@ The other method for creating a custom image is to base it on an
 existing image. For example, if you want to create an image based on
 ``core-image-sato`` but add the additional package ``strace`` to the
 image, copy the ``meta/recipes-sato/images/core-image-sato.bb`` to a new
-``.bb`` and add the following line to the end of the copy:
-::
+``.bb`` and add the following line to the end of the copy::
 
    IMAGE_INSTALL += "strace"
 
@@ -990,8 +965,7 @@ in the ``packagegroup-base.bb`` recipe.
 Here is a short, fabricated example showing the same basic pieces for a
 hypothetical packagegroup defined in ``packagegroup-custom.bb``, where
 the variable ``PN`` is the standard way to abbreviate the reference to
-the full packagegroup name ``packagegroup-custom``:
-::
+the full packagegroup name ``packagegroup-custom``::
 
    DESCRIPTION = "My Custom Package Groups"
 
@@ -1033,13 +1007,11 @@ configured hostname written to ``/etc/hostname`` is "qemux86".
 
 You can customize this name by altering the value of the "hostname"
 variable in the ``base-files`` recipe using either an append file or a
-configuration file. Use the following in an append file:
-::
+configuration file. Use the following in an append file::
 
    hostname = "myhostname"
 
-Use the following in a configuration file:
-::
+Use the following in a configuration file::
 
    hostname_pn-base-files = "myhostname"
 
@@ -1054,8 +1026,7 @@ you can easily reset the default hostname.
 
 Another point of interest is that if you unset the variable, the image
 will have no default hostname in the filesystem. Here is an example that
-unsets the variable in a configuration file:
-::
+unsets the variable in a configuration file::
 
   hostname_pn-base-files = ""
 
@@ -1136,8 +1107,7 @@ To run the tool, you just need to be in your
 :term:`Build Directory` and have sourced the
 build environment setup script (i.e.
 :ref:`structure-core-script`).
-To get help on the tool, use the following command:
-::
+To get help on the tool, use the following command::
 
    $ recipetool -h
    NOTE: Starting bitbake server...
@@ -1166,8 +1136,7 @@ locates it properly in the layer that contains your source files.
 Following are some syntax examples:
 
  - Use this syntax to generate a recipe based on source. Once generated,
-   the recipe resides in the existing source code layer:
-   ::
+   the recipe resides in the existing source code layer::
 
       recipetool create -o OUTFILE source
 
@@ -1180,8 +1149,7 @@ Following are some syntax examples:
 
  - Use this syntax to generate a recipe based on source. The options
    direct ``recipetool`` to generate debugging information. Once generated,
-   the recipe resides in the existing source code layer:
-   ::
+   the recipe resides in the existing source code layer::
 
       recipetool create -d -o OUTFILE source
 
@@ -1236,8 +1204,7 @@ the recipe.
    recipe through the layer's ``conf/layer.conf`` file and the
    :term:`BBFILES` variable. This
    variable sets up a path from which the build system can locate
-   recipes. Here is the typical use:
-   ::
+   recipes. Here is the typical use::
 
       BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
                   ${LAYERDIR}/recipes-*/*/*.bbappend"
@@ -1249,8 +1216,7 @@ the recipe.
    ":ref:`dev-manual/common-tasks:understanding and creating layers`" section.
 
 -  *Naming Your Recipe:* When you name your recipe, you need to follow
-   this naming convention:
-   ::
+   this naming convention::
 
       basename_version.bb
 
@@ -1276,8 +1242,7 @@ Assuming you have sourced the build environment setup script (i.e.
 :ref:`structure-core-script`) and you are in
 the :term:`Build Directory`, use
 BitBake to process your recipe. All you need to provide is the
-``basename`` of the recipe as described in the previous section:
-::
+``basename`` of the recipe as described in the previous section::
 
    $ bitbake basename
 
@@ -1289,8 +1254,7 @@ compilation and packaging files, and so forth.
 
 The path to the per-recipe temporary work directory depends on the
 context in which it is being built. The quickest way to find this path
-is to have BitBake return it by running the following:
-::
+is to have BitBake return it by running the following::
 
    $ bitbake -e basename | grep ^WORKDIR=
 
@@ -1299,8 +1263,7 @@ top-level folder named ``poky``, a default Build Directory at
 ``poky/build``, and a ``qemux86-poky-linux`` machine target system.
 Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
 case, the work directory the build system uses to build the package
-would be as follows:
-::
+would be as follows::
 
    poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
@@ -1352,8 +1315,7 @@ recipe to match the new version.
 Here is a simple example from the
 ``meta/recipes-devtools/strace/strace_5.5.bb`` recipe where the source
 comes from a single tarball. Notice the use of the
-:term:`PV` variable:
-::
+:term:`PV` variable::
 
    SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
 
@@ -1369,8 +1331,7 @@ you must specify :term:`SRCREV` and
 you should specify :term:`PV` to include
 the revision with :term:`SRCPV`. Here
 is an example from the recipe
-``meta/recipes-kernel/blktrace/blktrace_git.bb``:
-::
+``meta/recipes-kernel/blktrace/blktrace_git.bb``::
 
    SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
 
@@ -1392,8 +1353,7 @@ SCM URLs), you need to provide the ``md5`` and ``sha256`` checksums for
 each URL. For these cases, you provide a name for each URL as part of
 the ``SRC_URI`` and then reference that name in the subsequent checksum
 statements. Here is an example combining lines from the files
-``git.inc`` and ``git_2.24.1.bb``:
-::
+``git.inc`` and ``git_2.24.1.bb``::
 
    SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
               ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
@@ -1512,8 +1472,7 @@ variables:
    include ``COPYING``, ``LICENSE``, and ``README`` files. You could
    also find the information near the top of a source file. For example,
    given a piece of software licensed under the GNU General Public
-   License version 2, you would set ``LICENSE`` as follows:
-   ::
+   License version 2, you would set ``LICENSE`` as follows::
 
       LICENSE = "GPLv2"
 
@@ -1543,8 +1502,7 @@ variables:
    See the ":ref:`dev-manual/common-tasks:fetching code`" section for
    additional information.
 
-   Here is an example that assumes the software has a ``COPYING`` file:
-   ::
+   Here is an example that assumes the software has a ``COPYING`` file::
 
       LIC_FILES_CHKSUM = "file://COPYING;md5=xxx"
 
@@ -1747,8 +1705,7 @@ standard mainline kernel, not your own custom one.
 When you use custom kernel headers you need to get them from
 :term:`STAGING_KERNEL_DIR`,
 which is the directory with kernel headers that are required to build
-out-of-tree modules. Your recipe will also need the following:
-::
+out-of-tree modules. Your recipe will also need the following::
 
    do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
@@ -1779,8 +1736,7 @@ Here are some common issues that cause failures.
 
    To fix the problem, you need to either satisfy the missing dependency
    in the Makefile or whatever script produced the Makefile, or (as a
-   workaround) set :term:`PARALLEL_MAKE` to an empty string:
-   ::
+   workaround) set :term:`PARALLEL_MAKE` to an empty string::
 
       PARALLEL_MAKE = ""
 
@@ -1889,8 +1845,7 @@ installed correctly.
       missing dependencies between targets that can result in race
       conditions. If you experience intermittent failures during
       ``do_install``, you might be able to work around them by disabling
-      parallel Makefile installs by adding the following to the recipe:
-      ::
+      parallel Makefile installs by adding the following to the recipe::
 
          PARALLEL_MAKEINST = ""
 
@@ -2006,8 +1961,7 @@ take. The following list describes the process:
    :term:`MACHINE` value is passed
    into the configure script or a patch is applied only for a particular
    machine), you should mark them as such by adding the following to the
-   recipe:
-   ::
+   recipe::
 
       PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -2016,8 +1970,7 @@ take. The following list describes the process:
    all (e.g. recipes that simply package script files or configuration
    files), you should use the
    :ref:`allarch <ref-classes-allarch>` class to
-   do this for you by adding this to your recipe:
-   ::
+   do this for you by adding this to your recipe::
 
       inherit allarch
 
@@ -2061,8 +2014,7 @@ used by the :ref:`ref-tasks-populate_sysroot` task as defined by the the
 :term:`SYSROOT_DIRS` variable to automatically populate the sysroot. It
 is possible to modify the list of directories that populate the sysroot.
 The following example shows how you could add the ``/opt`` directory to
-the list of directories within a recipe:
-::
+the list of directories within a recipe::
 
    SYSROOT_DIRS += "/opt"
 
@@ -2091,8 +2043,7 @@ kernel recipe. Suppose you have three kernel recipes whose
 in some way uses a :term:`PROVIDES`
 statement that essentially identifies itself as being able to provide
 ``virtual/kernel``. Here is one way through the
-:ref:`kernel <ref-classes-kernel>` class:
-::
+:ref:`kernel <ref-classes-kernel>` class::
 
    PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
 
@@ -2107,8 +2058,7 @@ an example, consider the :yocto_git:`x86-base.inc
 </poky/tree/meta/conf/machine/include/x86-base.inc>` include file, which is a
 machine (i.e. :term:`MACHINE`) configuration file. This include file is the
 reason all x86-based machines use the ``linux-yocto`` kernel. Here are the
-relevant lines from the include file:
-::
+relevant lines from the include file::
 
    PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ??= "4.15%"
@@ -2116,8 +2066,7 @@ relevant lines from the include file:
 When you use a virtual provider, you do not have to "hard code" a recipe
 name as a build dependency. You can use the
 :term:`DEPENDS` variable to state the
-build is dependent on ``virtual/kernel`` for example:
-::
+build is dependent on ``virtual/kernel`` for example::
 
    DEPENDS = "virtual/kernel"
 
@@ -2125,8 +2074,7 @@ During the build, the OpenEmbedded build system picks
 the correct recipe needed for the ``virtual/kernel`` dependency based on
 the ``PREFERRED_PROVIDER`` variable. If you want to use the small kernel
 mentioned at the beginning of this section, configure your build as
-follows:
-::
+follows::
 
    PREFERRED_PROVIDER_virtual/kernel ??= "kernel-small"
 
@@ -2178,8 +2126,7 @@ In order to ensure the versions compare properly, the recommended
 convention is to set :term:`PV` within the
 recipe to "previous_version+current_version". You can use an additional
 variable so that you can use the current version elsewhere. Here is an
-example:
-::
+example::
 
    REALPV = "0.8.16-rc1"
    PV = "0.8.15+${REALPV}"
@@ -2198,8 +2145,7 @@ required, specify
 ``${``\ :term:`PN`\ ``}`` in place of
 PACKAGENAME.
 
-A post-installation function has the following structure:
-::
+A post-installation function has the following structure::
 
    pkg_postinst_PACKAGENAME() {
        # Commands to carry out
@@ -2352,13 +2298,11 @@ Otherwise, BitBake runs an empty ``do_install`` task by default.
 Some applications might require extra parameters to be passed to the
 compiler. For example, the application might need an additional header
 path. You can accomplish this by adding to the ``CFLAGS`` variable. The
-following example shows this:
-::
+following example shows this::
 
    CFLAGS_prepend = "-I ${S}/include "
 
-In the following example, ``mtd-utils`` is a makefile-based package:
-::
+In the following example, ``mtd-utils`` is a makefile-based package::
 
    SUMMARY = "Tools for managing memory technology devices"
    SECTION = "base"
@@ -2403,8 +2347,7 @@ application into multiple packages.
 Following is an example that uses the ``libxpm`` recipe. By default,
 this recipe generates a single package that contains the library along
 with a few binaries. You can modify the recipe to split the binaries
-into separate packages:
-::
+into separate packages::
 
    require xorg-lib-common.inc
 
@@ -2498,8 +2441,7 @@ doing the following:
    that replaces ``do_configure`` and ``do_compile`` with custom
    versions, then you can use the
    ``[``\ :ref:`noexec <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
-   flag to turn the tasks into no-ops, as follows:
-   ::
+   flag to turn the tasks into no-ops, as follows::
 
       do_configure[noexec] = "1"
       do_compile[noexec] = "1"
@@ -2558,8 +2500,7 @@ chapter of the BitBake User Manual.
    supported.
 
    The following example shows some of the ways you can use variables in
-   recipes:
-   ::
+   recipes::
 
       S = "${WORKDIR}/postfix-${PV}"
       CFLAGS += "-DNO_ASM"
@@ -2572,8 +2513,7 @@ chapter of the BitBake User Manual.
    syntax, although access to OpenEmbedded variables and internal
    methods are also available.
 
-   The following is an example function from the ``sed`` recipe:
-   ::
+   The following is an example function from the ``sed`` recipe::
 
       do_install () {
           autotools_do_install
@@ -2594,16 +2534,14 @@ chapter of the BitBake User Manual.
    from other files (``include`` and ``require``) and export variables
    to the environment (``export``).
 
-   The following example shows the use of some of these keywords:
-   ::
+   The following example shows the use of some of these keywords::
 
       export POSTCONF = "${STAGING_BINDIR}/postconf"
       inherit autoconf
       require otherfile.inc
 
 -  *Comments (#):* Any lines that begin with the hash character (``#``)
-   are treated as comment lines and are ignored:
-   ::
+   are treated as comment lines and are ignored::
 
       # This is a comment
 
@@ -2615,8 +2553,7 @@ in the BitBake User Manual.
 
 -  *Line Continuation (\\):* Use the backward slash (``\``) character to
    split a statement over multiple lines. Place the slash character at
-   the end of the line that is to be continued on the next line:
-   ::
+   the end of the line that is to be continued on the next line::
 
        VAR = "A really long \
               line"
@@ -2627,8 +2564,7 @@ in the BitBake User Manual.
       slash character.
 
 -  *Using Variables (${VARNAME}):* Use the ``${VARNAME}`` syntax to
-   access the contents of a variable:
-   ::
+   access the contents of a variable::
 
       SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/zlib-${PV}.tar.gz"
 
@@ -2648,8 +2584,7 @@ in the BitBake User Manual.
       when you make the assignment, but this is not generally needed.
 
 -  *Quote All Assignments ("value"):* Use double quotes around values in
-   all variable assignments (e.g. ``"value"``). Following is an example:
-   ::
+   all variable assignments (e.g. ``"value"``). Following is an example::
 
       VAR1 = "${OTHERVAR}"
       VAR2 = "The version is ${PV}"
@@ -2663,13 +2598,11 @@ in the BitBake User Manual.
 
    Here is an example where ``VAR1`` is set to "New value" if it is
    currently empty. However, if ``VAR1`` has already been set, it
-   remains unchanged:
-   ::
+   remains unchanged::
 
       VAR1 ?= "New value"
 
-   In this next example, ``VAR1`` is left with the value "Original value":
-   ::
+   In this next example, ``VAR1`` is left with the value "Original value"::
 
       VAR1 = "Original value"
       VAR1 ?= "New value"
@@ -2682,8 +2615,7 @@ in the BitBake User Manual.
       This operator adds a space between the existing content of the
       variable and the new content.
 
-   Here is an example:
-   ::
+   Here is an example::
 
       SRC_URI += "file://fix-makefile.patch"
 
@@ -2695,8 +2627,7 @@ in the BitBake User Manual.
       This operator adds a space between the new content and the
       existing content of the variable.
 
-   Here is an example:
-   ::
+   Here is an example::
 
       VAR =+ "Starts"
 
@@ -2708,15 +2639,13 @@ in the BitBake User Manual.
 
    The following example shows the space being explicitly added to the
    start to ensure the appended value is not merged with the existing
-   value:
-   ::
+   value::
 
       SRC_URI_append = " file://fix-makefile.patch"
 
    You can also use
    the ``_append`` operator with overrides, which results in the actions
-   only being performed for the specified target or machine:
-   ::
+   only being performed for the specified target or machine::
 
       SRC_URI_append_sh4 = " file://fix-makefile.patch"
 
@@ -2728,15 +2657,13 @@ in the BitBake User Manual.
 
    The following example shows the space being explicitly added to the
    end to ensure the prepended value is not merged with the existing
-   value:
-   ::
+   value::
 
       CFLAGS_prepend = "-I${S}/myincludes "
 
    You can also use the
    ``_prepend`` operator with overrides, which results in the actions
-   only being performed for the specified target or machine:
-   ::
+   only being performed for the specified target or machine::
 
       CFLAGS_prepend_sh4 = "-I${S}/myincludes "
 
@@ -2746,8 +2673,7 @@ in the BitBake User Manual.
    value to "standard/base" for any target
    :term:`MACHINE`, except for
    qemuarm where it should be set to "standard/arm-versatile-926ejs",
-   you would do the following:
-   ::
+   you would do the following::
 
       KBRANCH = "standard/base"
       KBRANCH_qemuarm = "standard/arm-versatile-926ejs"
@@ -2770,8 +2696,7 @@ in the BitBake User Manual.
    search and replacement on a variable).
 
    You indicate Python code using the ``${@python_code}`` syntax for the
-   variable assignment:
-   ::
+   variable assignment::
 
       SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz
 
@@ -2861,8 +2786,7 @@ of adding a suitable ``defconfig`` file. The file needs to be added into
 a location similar to ``defconfig`` files used for other machines in a
 given kernel recipe. A possible way to do this is by listing the file in
 the ``SRC_URI`` and adding the machine to the expression in
-``COMPATIBLE_MACHINE``:
-::
+``COMPATIBLE_MACHINE``::
 
    COMPATIBLE_MACHINE = '(qemux86|qemumips)'
 
@@ -2889,8 +2813,7 @@ contains directories for specific machines such as ``qemuarm`` and
 defaults, see the ``meta/recipes-bsp/formfactor/files/config`` file
 found in the same area.
 
-Following is an example for "qemuarm" machine:
-::
+Following is an example for "qemuarm" machine::
 
    HAVE_TOUCHSCREEN=1
    HAVE_KEYBOARD=1
@@ -2961,22 +2884,19 @@ The following steps describe how to set up the AUH utility:
 2. *Make Sure Git is Configured:* The AUH utility requires Git to be
    configured because AUH uses Git to save upgrades. Thus, you must have
    Git user and email configured. The following command shows your
-   configurations:
-   ::
+   configurations::
 
       $ git config --list
 
    If you do not have the user and
-   email configured, you can use the following commands to do so:
-   ::
+   email configured, you can use the following commands to do so::
 
       $ git config --global user.name some_name
       $ git config --global user.email username@domain.com
 
 3. *Clone the AUH Repository:* To use AUH, you must clone the repository
    onto your development host. The following command uses Git to create
-   a local copy of the repository on your system:
-   ::
+   a local copy of the repository on your system::
 
       $ git clone  git://git.yoctoproject.org/auto-upgrade-helper
       Cloning into 'auto-upgrade-helper'... remote: Counting objects: 768, done.
@@ -2992,8 +2912,7 @@ The following steps describe how to set up the AUH utility:
 4. *Create a Dedicated Build Directory:* Run the
    :ref:`structure-core-script`
    script to create a fresh build directory that you use exclusively for
-   running the AUH utility:
-   ::
+   running the AUH utility::
 
       $ cd poky
       $ source oe-init-build-env your_AUH_build_directory
@@ -3010,8 +2929,7 @@ The following steps describe how to set up the AUH utility:
    -  If you want to enable :ref:`Build
       History <dev-manual/common-tasks:maintaining build output quality>`,
       which is optional, you need the following lines in the
-      ``conf/local.conf`` file:
-      ::
+      ``conf/local.conf`` file::
 
          INHERIT =+ "buildhistory"
          BUILDHISTORY_COMMIT = "1"
@@ -3024,23 +2942,20 @@ The following steps describe how to set up the AUH utility:
    -  If you want to enable testing through the
       :ref:`testimage <ref-classes-testimage*>`
       class, which is optional, you need to have the following set in
-      your ``conf/local.conf`` file:
-      ::
+      your ``conf/local.conf`` file::
 
          INHERIT += "testimage"
 
       .. note::
 
          If your distro does not enable by default ptest, which Poky
-         does, you need the following in your ``local.conf`` file:
-         ::
+         does, you need the following in your ``local.conf`` file::
 
                  DISTRO_FEATURES_append = " ptest"
 
 
 6. *Optionally Start a vncserver:* If you are running in a server
-   without an X11 session, you need to start a vncserver:
-   ::
+   without an X11 session, you need to start a vncserver::
 
       $ vncserver :1
       $ export DISPLAY=:1
@@ -3064,45 +2979,38 @@ The following steps describe how to set up the AUH utility:
 This next set of examples describes how to use the AUH:
 
 -  *Upgrading a Specific Recipe:* To upgrade a specific recipe, use the
-   following form:
-   ::
+   following form::
 
       $ upgrade-helper.py recipe_name
 
-   For example, this command upgrades the ``xmodmap`` recipe:
-   ::
+   For example, this command upgrades the ``xmodmap`` recipe::
 
       $ upgrade-helper.py xmodmap
 
 -  *Upgrading a Specific Recipe to a Particular Version:* To upgrade a
-   specific recipe to a particular version, use the following form:
-   ::
+   specific recipe to a particular version, use the following form::
 
       $ upgrade-helper.py recipe_name -t version
 
-   For example, this command upgrades the ``xmodmap`` recipe to version 1.2.3:
-   ::
+   For example, this command upgrades the ``xmodmap`` recipe to version 1.2.3::
 
       $ upgrade-helper.py xmodmap -t 1.2.3
 
 -  *Upgrading all Recipes to the Latest Versions and Suppressing Email
    Notifications:* To upgrade all recipes to their most recent versions
-   and suppress the email notifications, use the following command:
-   ::
+   and suppress the email notifications, use the following command::
 
       $ upgrade-helper.py all
 
 -  *Upgrading all Recipes to the Latest Versions and Send Email
    Notifications:* To upgrade all recipes to their most recent versions
    and send email messages to maintainers for each attempted recipe as
-   well as a status email, use the following command:
-   ::
+   well as a status email, use the following command::
 
       $ upgrade-helper.py -e all
 
 Once you have run the AUH utility, you can find the results in the AUH
-build directory:
-::
+build directory::
 
    ${BUILDDIR}/upgrade-helper/timestamp
 
@@ -3127,15 +3035,13 @@ section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) Manual.
 
 To see all the command-line options available with ``devtool upgrade``,
-use the following help command:
-::
+use the following help command::
 
    $ devtool upgrade -h
 
 If you want to find out what version a recipe is currently at upstream
 without any attempt to upgrade your local version of the recipe, you can
-use the following command:
-::
+use the following command::
 
    $ devtool latest-version recipe_name
 
@@ -3161,15 +3067,13 @@ could add it easily using the
 ":ref:`bitbake-layers <bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script>`"
 script. For example, suppose you use the ``nano.bb`` recipe from the
 ``meta-oe`` layer in the ``meta-openembedded`` repository. For this
-example, assume that the layer has been cloned into following area:
-::
+example, assume that the layer has been cloned into following area::
 
    /home/scottrif/meta-openembedded
 
 The following command from your
 :term:`Build Directory` adds the layer to
-your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``):
-::
+your build configuration (i.e. ``${BUILDDIR}/conf/bblayers.conf``)::
 
    $ bitbake-layers add-layer /home/scottrif/meta-openembedded/meta-oe
    NOTE: Starting bitbake server...
@@ -3210,8 +3114,7 @@ directory automatically upgrades the recipe for you:
    NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb
 
 Continuing with this example, you can use ``devtool build`` to build the
-newly upgraded recipe:
-::
+newly upgraded recipe::
 
    $ devtool build nano
    NOTE: Starting bitbake server...
@@ -3236,8 +3139,7 @@ and submit commits for the changes generated by the upgrade process.
 
 Once the tree is clean, you can clean things up in this example with the
 following command from the ``${BUILDDIR}/workspace/sources/nano``
-directory:
-::
+directory::
 
    $ devtool finish nano meta-oe
    NOTE: Starting bitbake server...
@@ -3341,8 +3243,7 @@ build packages is available in the Build Directory as defined by the
 :term:`S` variable. Below is the default
 value for the ``S`` variable as defined in the
 ``meta/conf/bitbake.conf`` configuration file in the
-:term:`Source Directory`:
-::
+:term:`Source Directory`::
 
    S = "${WORKDIR}/${BP}"
 
@@ -3353,16 +3254,14 @@ usually set ``S`` to ``${WORKDIR}/git``.
 .. note::
 
    The :term:`BP` represents the base recipe name, which consists of the name
-   and version:
-   ::
+   and version::
 
            BP = "${BPN}-${PV}"
 
 
 The path to the work directory for the recipe
 (:term:`WORKDIR`) is defined as
-follows:
-::
+follows::
 
    ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}
 
@@ -3388,8 +3287,7 @@ As an example, assume a Source Directory top-level folder named
 ``poky``, a default Build Directory at ``poky/build``, and a
 ``qemux86-poky-linux`` machine target system. Furthermore, suppose your
 recipe is named ``foo_1.3.0.bb``. In this case, the work directory the
-build system uses to build the package would be as follows:
-::
+build system uses to build the package would be as follows::
 
    poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
@@ -3426,15 +3324,13 @@ Follow these general steps:
 
 3. *Create a New Patch:* Before modifying source code, you need to
    create a new patch. To create a new patch file, use ``quilt new`` as
-   below:
-   ::
+   below::
 
       $ quilt new my_changes.patch
 
 4. *Notify Quilt and Add Files:* After creating the patch, you need to
    notify Quilt about the files you plan to edit. You notify Quilt by
-   adding the files to the patch you just created:
-   ::
+   adding the files to the patch you just created::
 
       $ quilt add file1.c file2.c file3.c
 
@@ -3443,8 +3339,7 @@ Follow these general steps:
 
 6. *Test Your Changes:* Once you have modified the source code, the
    easiest way to test your changes is by calling the ``do_compile``
-   task as shown in the following example:
-   ::
+   task as shown in the following example::
 
       $ bitbake -c compile -f package
 
@@ -3481,8 +3376,7 @@ Follow these general steps:
    that holds the recipe (``.bb``) file or the append (``.bbappend``)
    file. Placing the patch here guarantees that the OpenEmbedded build
    system will find the patch. Next, add the patch into the ``SRC_URI``
-   of the recipe. Here is an example:
-   ::
+   of the recipe. Here is an example::
 
       SRC_URI += "file://my_changes.patch"
 
@@ -3503,8 +3397,7 @@ this way can be helpful when debugging a build or preparing software to
 be used with the OpenEmbedded build system.
 
 Following is an example that uses ``devshell`` on a target named
-``matchbox-desktop``:
-::
+``matchbox-desktop``::
 
   $ bitbake matchbox-desktop -c devshell
 
@@ -3533,8 +3426,7 @@ corresponding ``run.*`` script in the
 directory (e.g., ``run.do_configure.``\ `pid`). If a task's script does
 not exist, which would be the case if the task was skipped by way of the
 sstate cache, you can create the task by first running it outside of the
-``devshell``:
-::
+``devshell``::
 
    $ bitbake -c task
 
@@ -3581,8 +3473,7 @@ specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
 BitBake tasks, in particular, the data store 'd'. So, commands such as
 the following are useful when exploring the data store and running
-functions:
-::
+functions::
 
    pydevshell> d.getVar("STAGING_DIR")
    '/media/build1/poky/build/tmp/sysroots'
@@ -3602,8 +3493,7 @@ helpful when debugging a build or preparing software to be used with the
 OpenEmbedded build system.
 
 Following is an example that uses ``devpyshell`` on a target named
-``matchbox-desktop``:
-::
+``matchbox-desktop``::
 
    $ bitbake matchbox-desktop -c devpyshell
 
@@ -3664,8 +3554,7 @@ The following figure and list overviews the build process:
 
 2. *Initialize the Build Environment:* Initialize the build environment
    by sourcing the build environment script (i.e.
-   :ref:`structure-core-script`):
-   ::
+   :ref:`structure-core-script`)::
 
       $ source oe-init-build-env [build_dir]
 
@@ -3690,8 +3579,7 @@ The following figure and list overviews the build process:
    and a centralized tarball download directory through the
    :term:`DL_DIR` variable.
 
-4. *Build the Image:* Build the image using the ``bitbake`` command:
-   ::
+4. *Build the Image:* Build the image using the ``bitbake`` command::
 
       $ bitbake target
 
@@ -3710,8 +3598,7 @@ The following figure and list overviews the build process:
    Project Reference Manual.
 
    As an example, the following command builds the
-   ``core-image-minimal`` image:
-   ::
+   ``core-image-minimal`` image::
 
       $ bitbake core-image-minimal
 
@@ -3763,8 +3650,7 @@ Follow these steps to set up and execute multiple configuration builds:
 
    Here is an example showing the minimal statements needed in a
    configuration file for a "qemux86" target whose temporary build
-   directory is ``tmpmultix86``:
-   ::
+   directory is ``tmpmultix86``::
 
       MACHINE = "qemux86"
       TMPDIR = "${TOPDIR}/tmpmultix86"
@@ -3789,8 +3675,7 @@ Follow these steps to set up and execute multiple configuration builds:
    variable in your ``conf/local.conf`` configuration file to specify
    each multiconfig. Continuing with the example from the previous
    figure, the ``BBMULTICONFIG`` variable needs to enable two
-   multiconfigs: "x86" and "arm" by specifying each configuration file:
-   ::
+   multiconfigs: "x86" and "arm" by specifying each configuration file::
 
       BBMULTICONFIG = "x86 arm"
 
@@ -3804,13 +3689,11 @@ Follow these steps to set up and execute multiple configuration builds:
       with "".
 
 -  *Launch BitBake*: Use the following BitBake command form to launch
-   the multiple configuration build:
-   ::
+   the multiple configuration build::
 
       $ bitbake [mc:multiconfigname:]target [[[mc:multiconfigname:]target] ... ]
 
-   For the example in this section, the following command applies:
-   ::
+   For the example in this section, the following command applies::
 
       $ bitbake mc:x86:core-image-minimal mc:arm:core-image-sato mc::core-image-base
 
@@ -3844,15 +3727,13 @@ essentially that the
 
 To enable dependencies in a multiple configuration build, you must
 declare the dependencies in the recipe using the following statement
-form:
-::
+form::
 
    task_or_package[mcdepends] = "mc:from_multiconfig:to_multiconfig:recipe_name:task_on_which_to_depend"
 
 To better show how to use this statement, consider the example scenario
 from the first paragraph of this section. The following statement needs
-to be added to the recipe that builds the ``core-image-sato`` image:
-::
+to be added to the recipe that builds the ``core-image-sato`` image::
 
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_rootfs"
 
@@ -3862,8 +3743,7 @@ task on which the ``do_image`` task in the recipe depends is the
 with the "arm" multiconfig.
 
 Once you set up this dependency, you can build the "x86" multiconfig
-using a BitBake command as follows:
-::
+using a BitBake command as follows::
 
    $ bitbake mc:x86:core-image-sato
 
@@ -3874,8 +3754,7 @@ dependency, BitBake also executes through the ``do_rootfs`` task for the
 
 Having a recipe depend on the root filesystem of another build might not
 seem that useful. Consider this change to the statement in the
-``core-image-sato`` recipe:
-::
+``core-image-sato`` recipe::
 
    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"
 
@@ -4091,8 +3970,7 @@ happens, which changes the way you build them. You can also modify the
 filesystem itself or select a different filesystem.
 
 First, find out what is hogging your root filesystem by running the
-``dirsize.py`` script from your root directory:
-::
+``dirsize.py`` script from your root directory::
 
    $ cd root-directory-of-image
    $ dirsize.py 100000 > dirsize-100k.log
@@ -4107,8 +3985,7 @@ the root filesystem that take up large amounts of memory.
 
 You need to be sure that what you eliminate does not cripple the
 functionality you need. One way to see how packages relate to each other
-is by using the Dependency Explorer UI with the BitBake command:
-::
+is by using the Dependency Explorer UI with the BitBake command::
 
    $ cd image-directory
    $ bitbake -u taskexp -g image
@@ -4124,8 +4001,7 @@ instead of ``udev``.
 
 Use your ``local.conf`` file to make changes. For example, to eliminate
 ``udev`` and ``glib``, set the following in the local configuration
-file:
-::
+file::
 
    VIRTUAL-RUNTIME_dev_manager = ""
 
@@ -4153,8 +4029,7 @@ building? Which drivers do you build by default?
    You can modify the kernel source if you want to help with boot time.
 
 Run the ``ksize.py`` script from the top-level Linux build directory to
-get an idea of what is making up the kernel:
-::
+get an idea of what is making up the kernel::
 
    $ cd top-level-linux-build-directory
    $ ksize.py > ksize.log
@@ -4168,8 +4043,7 @@ in a compressed kernel image. Look to reduce the areas that are large
 and taking up around the "90% rule."
 
 To examine, or drill down, into any particular area, use the ``-d``
-option with the script:
-::
+option with the script::
 
    $ ksize.py -d > ksize.log
 
@@ -4316,8 +4190,7 @@ your tunings to best consider build times and package feed maintenance.
    machine-architecture dependent, make sure your recipe enables the
    "machine" package architecture through the
    :term:`MACHINE_ARCH`
-   variable:
-   ::
+   variable::
 
       PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -4325,8 +4198,7 @@ your tunings to best consider build times and package feed maintenance.
    specifically enable a package architecture through the
    :term:`PACKAGE_ARCH`, The
    OpenEmbedded build system defaults to the
-   :term:`TUNE_PKGARCH` setting:
-   ::
+   :term:`TUNE_PKGARCH` setting::
 
       PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
@@ -4426,15 +4298,13 @@ to do is inherit the
 and then set the
 :term:`EXTERNALSRC` variable to
 point to your external source code. Here are the statements to put in
-your ``local.conf`` file:
-::
+your ``local.conf`` file::
 
    INHERIT += "externalsrc"
    EXTERNALSRC_pn-myrecipe = "path-to-your-source-tree"
 
 This next example shows how to accomplish the same thing by setting
-``EXTERNALSRC`` in the recipe itself or in the recipe's append file:
-::
+``EXTERNALSRC`` in the recipe itself or in the recipe's append file::
 
    EXTERNALSRC = "path"
    EXTERNALSRC_BUILD = "path"
@@ -4451,8 +4321,7 @@ directory separate from the external source directory as specified by
 to have the source built in the same directory in which it resides, or
 some other nominated directory, you can set
 :term:`EXTERNALSRC_BUILD`
-to point to that directory:
-::
+to point to that directory::
 
    EXTERNALSRC_BUILD_pn-myrecipe = "path-to-your-source-tree"
 
@@ -4475,8 +4344,7 @@ Follow these steps to populate your Downloads directory:
    an empty location or one that does not yet exist.
 
 2. *Generate Tarballs of the Source Git Repositories:* Edit your
-   ``local.conf`` configuration file as follows:
-   ::
+   ``local.conf`` configuration file as follows::
 
       DL_DIR = "/home/your-download-dir/"
       BB_GENERATE_MIRROR_TARBALLS = "1"
@@ -4489,8 +4357,7 @@ Follow these steps to populate your Downloads directory:
    variable for more information.
 
 3. *Populate Your Downloads Directory Without Building:* Use BitBake to
-   fetch your sources but inhibit the build:
-   ::
+   fetch your sources but inhibit the build::
 
       $ bitbake target --runonly=fetch
 
@@ -4536,8 +4403,7 @@ directory:
    ``${``\ :term:`TMPDIR`\ ``}``
    directory or using a new :term:`Build Directory`.
 
-3. *Build Your Target:* Use BitBake to build your target:
-   ::
+3. *Build Your Target:* Use BitBake to build your target::
 
       $ bitbake target
 
@@ -4550,8 +4416,7 @@ directory:
       The offline build does not work if recipes attempt to find the
       latest version of software by setting
       :term:`SRCREV` to
-      ``${``\ :term:`AUTOREV`\ ``}``:
-      ::
+      ``${``\ :term:`AUTOREV`\ ``}``::
 
          SRCREV = "${AUTOREV}"
 
@@ -4670,8 +4535,7 @@ that can help you speed up the build:
 -  Disable static library generation for recipes derived from
    ``autoconf`` or ``libtool``: Following is an example showing how to
    disable static libraries and still provide an override to handle
-   exceptions:
-   ::
+   exceptions::
 
       STATICLIBCONF = "--disable-static"
       STATICLIBCONF_sqlite3-native = ""
@@ -4726,8 +4590,7 @@ library files.
    static library files through ``${PN}-dev``.
 
 Following is part of the BitBake configuration file, where you can see
-how the static library files are defined:
-::
+how the static library files are defined::
 
    PACKAGE_BEFORE_PN ?= ""
    PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
@@ -4833,8 +4696,7 @@ After you have set up the recipes, you need to define the actual
 combination of multiple libraries you want to build. You accomplish this
 through your ``local.conf`` configuration file in the
 :term:`Build Directory`. An example
-configuration would be as follows:
-::
+configuration would be as follows::
 
    MACHINE = "qemux86-64"
    require conf/multilib.conf
@@ -4850,14 +4712,12 @@ on this particular tuning, see
 
 The example then includes ``lib32-glib-2.0`` in all the images, which
 illustrates one method of including a multiple library dependency. You
-can use a normal image build to include this dependency, for example:
-::
+can use a normal image build to include this dependency, for example::
 
    $ bitbake core-image-sato
 
 You can also build Multilib packages
-specifically with a command like this:
-::
+specifically with a command like this::
 
    $ bitbake lib32-glib-2.0
 
@@ -4952,8 +4812,7 @@ you have other recipes that depend on a given library, you need to use
 the :term:`DEPENDS` variable to
 create the dependency. Continuing with the same example, if you want to
 have a recipe depend on the 1.8 version of the ``clutter`` library, use
-the following in your recipe:
-::
+the following in your recipe::
 
    DEPENDS = "clutter-1.8"
 
@@ -4996,8 +4855,7 @@ follows:
 -  Support for large images exists.
 
 To use the x32 psABI, you need to edit your ``conf/local.conf``
-configuration file as follows:
-::
+configuration file as follows::
 
    MACHINE = "qemux86-64"
    DEFAULTTUNE = "x86-64-x32"
@@ -5006,8 +4864,7 @@ configuration file as follows:
 
 Once you have set
 up your configuration file, use BitBake to build an image that supports
-the x32 psABI. Here is an example:
-::
+the x32 psABI. Here is an example::
 
    $ bitbake core-image-sato
 
@@ -5066,8 +4923,7 @@ library package involves the following:
 3. Try to build the recipe. If you encounter build errors that look like
    something is unable to find ``.so`` libraries, check where these
    libraries are located in the source tree and add the following to the
-   recipe:
-   ::
+   recipe::
 
       GIR_EXTRA_LIBS_PATH = "${B}/something/.libs"
 
@@ -5097,8 +4953,7 @@ perhaps QEMU does not work on your build host and target architecture
 combination. If so, you can use either of the following methods to
 disable GIR file generations:
 
--  Add the following to your distro configuration:
-   ::
+-  Add the following to your distro configuration::
 
       DISTRO_FEATURES_BACKFILL_CONSIDERED = "gobject-introspection-data"
 
@@ -5106,8 +4961,7 @@ disable GIR file generations:
    QEMU but will still enable building introspection tools and libraries
    (i.e. building them does not require the use of QEMU).
 
--  Add the following to your machine configuration:
-   ::
+-  Add the following to your machine configuration::
 
       MACHINE_FEATURES_BACKFILL_CONSIDERED = "qemu-usermode"
 
@@ -5140,8 +4994,7 @@ working in an image:
 
 3. Launch a Terminal and then start Python in the terminal.
 
-4. Enter the following in the terminal:
-   ::
+4. Enter the following in the terminal::
 
       >>> from gi.repository import GLib
       >>> GLib.get_host_name()
@@ -5289,8 +5142,7 @@ system needs to meet the following requirements:
    form generated by the OpenEmbedded build system.
 
 -  You must build several native tools, which are built to run on the
-   build system:
-   ::
+   build system::
 
       $ bitbake parted-native dosfstools-native mtools-native
 
@@ -5306,8 +5158,7 @@ Getting Help
 
 You can get general help for the ``wic`` command by entering the ``wic``
 command by itself or by entering the command with a help argument as
-follows:
-::
+follows::
 
    $ wic -h
    $ wic --help
@@ -5315,32 +5166,27 @@ follows:
 
 Currently, Wic supports seven commands: ``cp``, ``create``, ``help``,
 ``list``, ``ls``, ``rm``, and ``write``. You can get help for all these
-commands except "help" by using the following form:
-::
+commands except "help" by using the following form::
 
    $ wic help command
 
 For example, the following command returns help for the ``write``
-command:
-::
+command::
 
    $ wic help write
 
 Wic supports help for three topics: ``overview``, ``plugins``, and
-``kickstart``. You can get help for any topic using the following form:
-::
+``kickstart``. You can get help for any topic using the following form::
 
    $ wic help topic
 
-For example, the following returns overview help for Wic:
-::
+For example, the following returns overview help for Wic::
 
    $ wic help overview
 
 One additional level of help exists for Wic. You can get help on
 individual images through the ``list`` command. You can use the ``list``
-command to return the available Wic images as follows:
-::
+command to return the available Wic images as follows::
 
    $ wic list images
      genericx86                    		Create an EFI disk image for genericx86*
@@ -5359,8 +5205,7 @@ command to return the available Wic images as follows:
 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a
 particular image. For example, the following command returns help on the
-"beaglebone-yocto" image:
-::
+"beaglebone-yocto" image::
 
    $ wic list beaglebone-yocto help
 
@@ -5397,8 +5242,7 @@ can point to arbitrary kernel, root filesystem locations, and so forth.
 Contrast this behavior with cooked mode where Wic looks in the Build
 Directory (e.g. ``tmp/deploy/images/``\ machine).
 
-The general form of the ``wic`` command in raw mode is:
-::
+The general form of the ``wic`` command in raw mode is::
 
    $ wic create wks_file options ...
 
@@ -5456,8 +5300,7 @@ a kickstart file and the name of the image from which to use artifacts
 by using the "-e" option. Wic looks in the Build Directory (e.g.
 ``tmp/deploy/images/``\ machine) for artifacts.
 
-The general form of the ``wic`` command using Cooked Mode is as follows:
-::
+The general form of the ``wic`` command using Cooked Mode is as follows::
 
    $ wic create wks_file -e IMAGE_NAME
 
@@ -5480,14 +5323,12 @@ Using an Existing Kickstart File
 If you do not want to create your own kickstart file, you can use an
 existing file provided by the Wic installation. As shipped, kickstart
 files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
-following two locations:
-::
+following two locations::
 
    poky/meta-yocto-bsp/wic
    poky/scripts/lib/wic/canned-wks
 
-Use the following command to list the available kickstart files:
-::
+Use the following command to list the available kickstart files::
 
    $ wic list images
      genericx86                    		Create an EFI disk image for genericx86*
@@ -5505,15 +5346,13 @@ Use the following command to list the available kickstart files:
 
 When you use an existing file, you
 do not have to use the ``.wks`` extension. Here is an example in Raw
-Mode that uses the ``directdisk`` file:
-::
+Mode that uses the ``directdisk`` file::
 
    $ wic create directdisk -r rootfs_dir -b bootimg_dir \
          -k kernel_dir -n native_sysroot
 
 Here are the actual partition language commands used in the
-``genericx86.wks`` file to generate an image:
-::
+``genericx86.wks`` file to generate an image::
 
    # short-description: Create an EFI disk image for genericx86*
    # long-description: Creates a partitioned EFI disk image for genericx86* machines
@@ -5571,8 +5410,7 @@ When the Wic implementation needs to invoke a partition-specific
 implementation, it looks for the plugin with the same name as the
 ``--source`` parameter used in the kickstart file given to that
 partition. For example, if the partition is set up using the following
-command in a kickstart file:
-::
+command in a kickstart file::
 
    part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
 
@@ -5583,8 +5421,7 @@ members of the matching source plugin (i.e. ``bootimg-pcbios``) in the
 To be more concrete, here is the corresponding plugin definition from
 the ``bootimg-pcbios.py`` file for the previous command along with an
 example method called by the Wic implementation when it needs to prepare
-a partition using an implementation-specific function:
-::
+a partition using an implementation-specific function::
 
                 .
                 .
@@ -5675,8 +5512,7 @@ Generate an Image using an Existing Kickstart File
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 This example runs in Cooked Mode and uses the ``mkefidisk`` kickstart
-file:
-::
+file::
 
    $ wic create mkefidisk -e core-image-minimal
    INFO: Building wic-tools...
@@ -5712,8 +5548,7 @@ and kickstart file information.
 Continuing with the example, you can now write the image from the Build
 Directory onto a USB stick, or whatever media for which you built your
 image, and boot from the media. You can write the image by using
-``bmaptool`` or ``dd``:
-::
+``bmaptool`` or ``dd``::
 
    $ oe-run-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX
 
@@ -5761,8 +5596,7 @@ the lines that specify the target disk from which to boot.
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
 example changes the following two lines and leaves the remaining lines
-untouched:
-::
+untouched::
 
    part /boot --source bootimg-pcbios --ondisk sdb --label boot --active --align 1024
    part / --source rootfs --ondisk sdb --fstype=ext4 --label platform --align 1024 --use-uuid
@@ -5799,8 +5633,7 @@ Computing (nuc) :term:`MACHINE` the
 
 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot
-the resulting media:
-::
+the resulting media::
 
    $ sudo dd if=directdisksdb-gpt-201710090938-sdb.direct of=/dev/sdb
    140966+0 records in
@@ -5814,8 +5647,7 @@ Using a Modified Kickstart File and Running in Raw Mode
 This next example manually specifies each build artifact (runs in Raw
 Mode) and uses a modified kickstart file. The example also uses the
 ``-o`` option to cause Wic to create the output somewhere other than the
-default output directory, which is the current directory:
-::
+default output directory, which is the current directory::
 
    $ wic create /home/stephano/my_yocto/test.wks -o /home/stephano/testwic \
         --rootfs-dir /home/stephano/build/master/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
@@ -5860,8 +5692,7 @@ The following example examines the contents of the Wic image, deletes
 the existing kernel, and then inserts a new kernel:
 
 1. *List the Partitions:* Use the ``wic ls`` command to list all the
-   partitions in the Wic image:
-   ::
+   partitions in the Wic image::
 
       $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic
       Num     Start        End          Size      Fstype
@@ -5877,8 +5708,7 @@ the existing kernel, and then inserts a new kernel:
    .. note::
 
       You can get command usage on any Wic command using the following
-      form:
-      ::
+      form::
 
               $ wic help command
 
@@ -5886,14 +5716,12 @@ the existing kernel, and then inserts a new kernel:
       For example, the following command shows you the various ways to
       use the
       wic ls
-      command:
-      ::
+      command::
 
               $ wic help ls
 
 
-   The following command shows what is in partition one:
-   ::
+   The following command shows what is in partition one::
 
         $ wic ls tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1
         Volume in drive : is boot
@@ -5915,8 +5743,7 @@ the existing kernel, and then inserts a new kernel:
 
       If you see the following error, you need to update or create a
       ``~/.mtoolsrc`` file and be sure to have the line "mtools_skip_check=1"
-      in the file. Then, run the Wic command again:
-      ::
+      in the file. Then, run the Wic command again::
 
               ERROR: _exec_cmd: /usr/bin/mdir -i /tmp/wic-parttfokuwra ::/ returned '1' instead of 0
                output: Total number of sectors (47824) not a multiple of sectors per track (32)!
@@ -5924,8 +5751,7 @@ the existing kernel, and then inserts a new kernel:
 
 
 3. *Remove the Old Kernel:* Use the ``wic rm`` command to remove the
-   ``vmlinuz`` file (kernel):
-   ::
+   ``vmlinuz`` file (kernel)::
 
       $ wic rm tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
 
@@ -5937,8 +5763,7 @@ the existing kernel, and then inserts a new kernel:
    kernel will be in the ``workspace/sources`` area.
 
    The following example assumes ``devtool`` was used to build the
-   kernel:
-   ::
+   kernel::
 
       $ wic cp poky_sdk/tmp/work/qemux86-poky-linux/linux-yocto/4.12.12+git999-r0/linux-yocto-4.12.12+git999/arch/x86/boot/bzImage \
                poky/build/tmp/deploy/images/qemux86/core-image-minimal-qemux86.wic:1/vmlinuz
@@ -5968,14 +5793,12 @@ system image files much faster.
    -  If you are using Ubuntu or Debian distributions, you can install
       the ``bmap-tools`` package using the following command and then
       use the tool without specifying ``PATH`` even from the root
-      account:
-      ::
+      account::
 
          $ sudo apt-get install bmap-tools
 
    -  If you are unable to install the ``bmap-tools`` package, you will
-      need to build Bmaptool before using it. Use the following command:
-      ::
+      need to build Bmaptool before using it. Use the following command::
 
          $ bitbake bmap-tools-native
 
@@ -5984,15 +5807,13 @@ that while this example uses a Wic image, you can use Bmaptool to flash
 any type of image. Use these steps to flash an image using Bmaptool:
 
 1. *Update your local.conf File:* You need to have the following set
-   in your ``local.conf`` file before building your image:
-   ::
+   in your ``local.conf`` file before building your image::
 
       IMAGE_FSTYPES += "wic wic.bmap"
 
 2. *Get Your Image:* Either have your image ready (pre-built with the
    :term:`IMAGE_FSTYPES`
-   setting previously mentioned) or take the step to build the image:
-   ::
+   setting previously mentioned) or take the step to build the image::
 
       $ bitbake image
 
@@ -6000,20 +5821,17 @@ any type of image. Use these steps to flash an image using Bmaptool:
    depending on your particular setup. The following commands assume the
    image resides in the Build Directory's ``deploy/images/`` area:
 
-   -  If you have write access to the media, use this command form:
-      ::
+   -  If you have write access to the media, use this command form::
 
          $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
    -  If you do not have write access to the media, set your permissions
-      first and then use the same command form:
-      ::
+      first and then use the same command form::
 
          $ sudo chmod 666 /dev/sdX
          $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX
 
-For help on the ``bmaptool`` command, use the following command:
-::
+For help on the ``bmaptool`` command, use the following command::
 
    $ bmaptool --help
 
@@ -6107,8 +5925,7 @@ your build output more secure. The security flags are in the
 
 Use the following line in your ``local.conf`` file or in your custom
 distribution configuration file to enable the security compiler and
-linker flags for your build:
-::
+linker flags for your build::
 
    require conf/distro/include/security_flags.inc
 
@@ -6123,8 +5940,7 @@ system to make your images more secure:
    When creating a new project, the default is to provide you with an
    initial ``local.conf`` file that enables this feature using the
    :term:`EXTRA_IMAGE_FEATURES`
-   variable with the line:
-   ::
+   variable with the line::
 
       EXTRA_IMAGE_FEATURES = "debug-tweaks"
 
@@ -6250,8 +6066,7 @@ layer. The following steps provide some more detail:
    :term:`DISTRO` variable to point to
    your distribution's configuration file. For example, if your
    distribution's configuration file is named ``mydistro.conf``, then
-   you point to it as follows:
-   ::
+   you point to it as follows::
 
       DISTRO = "mydistro"
 
@@ -6292,8 +6107,7 @@ The OpenEmbedded build system uses the environment variable
 configuration information that ultimately ends up in the
 :term:`Build Directory` ``conf`` directory.
 By default, ``TEMPLATECONF`` is set as follows in the ``poky``
-repository:
-::
+repository::
 
    TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}
 
@@ -6335,8 +6149,7 @@ display BitBake targets as part of the script output. Customizing this
 targets appears as part of the script's output.
 
 Here is the default list of targets displayed as a result of running
-either of the setup scripts:
-::
+either of the setup scripts::
 
    You can now run 'bitbake <target>'
 
@@ -6355,8 +6168,7 @@ Conserving Disk Space During Builds
 
 To help conserve disk space during builds, you can add the following
 statement to your project's ``local.conf`` configuration file found in
-the :term:`Build Directory`:
-::
+the :term:`Build Directory`::
 
    INHERIT += "rm_work"
 
@@ -6534,8 +6346,7 @@ The simplest form for a PR Service is for it to exist for a single host
 development system that builds the package feed (building system). For
 this scenario, you can enable a local PR Service by setting
 :term:`PRSERV_HOST` in your
-``local.conf`` file in the :term:`Build Directory`:
-::
+``local.conf`` file in the :term:`Build Directory`::
 
    PRSERV_HOST = "localhost:0"
 
@@ -6546,8 +6357,7 @@ stopping the server.
 If you have a more complex setup where multiple host development systems
 work against a common, shared package feed, you have a single PR Service
 running and it is connected to each building system. For this scenario,
-you need to start the PR Service using the ``bitbake-prserv`` command:
-::
+you need to start the PR Service using the ``bitbake-prserv`` command::
 
    bitbake-prserv --host ip --port port --start
 
@@ -6559,8 +6369,7 @@ server and port.
 It is also recommended you use build history, which adds some sanity
 checks to binary package versions, in conjunction with the server that
 is running the PR Service. To enable build history, add the following to
-each building system's ``local.conf`` file:
-::
+each building system's ``local.conf`` file::
 
    # It is recommended to activate "buildhistory" for testing the PR service
    INHERIT += "buildhistory"
@@ -6629,15 +6438,13 @@ the specific source code revision from which to build. You set the
 ``SRCREV`` variable to
 :term:`AUTOREV` to cause the
 OpenEmbedded build system to automatically use the latest revision of
-the software:
-::
+the software::
 
    SRCREV = "${AUTOREV}"
 
 Furthermore, you need to reference ``SRCPV`` in ``PV`` in order to
 automatically update the version whenever the revision of the source
-code changes. Here is an example:
-::
+code changes. Here is an example::
 
    PV = "1.0+git${SRCPV}"
 
@@ -6707,8 +6514,7 @@ package for each one it finds by appending to the
 :term:`PACKAGES` variable and
 setting the appropriate values for ``FILES_packagename``,
 ``RDEPENDS_packagename``, ``DESCRIPTION_packagename``, and so forth.
-Here is an example from the ``lighttpd`` recipe:
-::
+Here is an example from the ``lighttpd`` recipe::
 
    python populate_packages_prepend () {
        lighttpd_libdir = d.expand('${libdir}')
@@ -6751,8 +6557,7 @@ directory of the ``poky`` :ref:`source repository <overview-manual/development-e
 also find examples in ``meta/classes/kernel.bbclass``.
 
 Following is a reference that shows ``do_split_packages`` mandatory and
-optional arguments:
-::
+optional arguments::
 
    Mandatory arguments
 
@@ -6840,8 +6645,7 @@ any dependencies on optional modules from other recipes are satisfied by
 your recipe. You can be sure these dependencies are satisfied by using
 the :term:`PACKAGES_DYNAMIC`
 variable. Here is an example that continues with the ``lighttpd`` recipe
-shown earlier:
-::
+shown earlier::
 
    PACKAGES_DYNAMIC = "lighttpd-module-.*"
 
@@ -6933,8 +6737,7 @@ variable to specify the format:
    :term:`Build Directory` (e.g.
    ``poky/build/conf/local.conf``).
 
-2. Select the desired package format as follows:
-   ::
+2. Select the desired package format as follows::
 
       PACKAGE_CLASSES ?= "package_packageformat"
 
@@ -6968,15 +6771,13 @@ target's package database(s) later once your image is up and running.
 Whenever you perform any sort of build step that can potentially
 generate a package or modify existing package, it is always a good idea
 to re-generate the package index after the build by using the following
-command:
-::
+command::
 
    $ bitbake package-index
 
 It might be tempting to build the
 package and the package index at the same time with a command such as
-the following:
-::
+the following::
 
    $ bitbake some-package package-index
 
@@ -7024,8 +6825,7 @@ your packaging choice (i.e. the
 :term:`PACKAGE_CLASSES`
 setting), simply start the server. The following example assumes a build
 directory of ``poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
-setting of "package_rpm":
-::
+setting of "package_rpm"::
 
    $ cd poky/build/tmp/deploy/rpm
    $ python3 -m http.server
@@ -7091,8 +6891,7 @@ for all architectures. You cannot do both:
    architectures.
 
 -  *Create a Single (Full) Package Index:* Define a single base URL that
-   identifies where a full package database is located:
-   ::
+   identifies where a full package database is located::
 
       [oe-packages]
       baseurl=http://my.server/rpm
@@ -7210,8 +7009,7 @@ Signing RPM Packages
 
 To enable signing RPM packages, you must set up the following
 configurations in either your ``local.config`` or ``distro.config``
-file:
-::
+file::
 
    # Inherit sign_rpm.bbclass to enable signing functionality
    INHERIT += " sign_rpm"
@@ -7242,8 +7040,7 @@ signed package feeds for IPK and RPM packages.
 
 The steps you need to take to enable signed package feed use are similar
 to the steps used to sign RPM packages. You must define the following in
-your ``local.config`` or ``distro.config`` file:
-::
+your ``local.config`` or ``distro.config`` file::
 
    INHERIT += "sign_package_feed"
    PACKAGE_FEED_GPG_NAME = "key_name"
@@ -7282,8 +7079,7 @@ hand, the test can be anything from a simple shell script that runs a
 binary and checks the output to an elaborate system of test binaries and
 data files.
 
-The test generates output in the format used by Automake:
-::
+The test generates output in the format used by Automake::
 
    result: testname
 
@@ -7305,8 +7101,7 @@ To add package testing to your build, add the
 :term:`DISTRO_FEATURES` and
 :term:`EXTRA_IMAGE_FEATURES`
 variables to your ``local.conf`` file, which is found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::
 
    DISTRO_FEATURES_append = " ptest"
    EXTRA_IMAGE_FEATURES += "ptest-pkgs"
@@ -7331,16 +7126,14 @@ test. Here is what you have to do for each recipe:
 
 -  *Be sure the recipe inherits
    the* :ref:`ptest <ref-classes-ptest>` *class:*
-   Include the following line in each recipe:
-   ::
+   Include the following line in each recipe::
 
       inherit ptest
 
 -  *Create run-ptest:* This script starts your test. Locate the
    script where you will refer to it using
    :term:`SRC_URI`. Here is an
-   example that starts a test for ``dbus``:
-   ::
+   example that starts a test for ``dbus``::
 
       #!/bin/sh
       cd test
@@ -7352,8 +7145,7 @@ test. Here is what you have to do for each recipe:
    :term:`DEPENDS` and
    :term:`RDEPENDS` variables in
    your recipe in order for the package to meet the dependencies. Here
-   is an example where the package has a runtime dependency on "make":
-   ::
+   is an example where the package has a runtime dependency on "make"::
 
       RDEPENDS_${PN}-ptest += "make"
 
@@ -7374,8 +7166,7 @@ test. Here is what you have to do for each recipe:
 
    Regardless, you still must add a ``do_compile_ptest`` function to
    build the test suite. Add a function similar to the following to your
-   recipe:
-   ::
+   recipe::
 
       do_compile_ptest() {
           oe_runmake buildtest-TESTS
@@ -7457,8 +7248,7 @@ which is a file browser web application.
    You must know the ``cute-files`` module version.
 
 The first thing you need to do is use ``devtool`` and the NPM fetcher to
-create the recipe:
-::
+create the recipe::
 
    $ devtool add "npm://registry.npmjs.org;package=cute-files;version=1.0.2"
 
@@ -7486,8 +7276,7 @@ runs.
    practical way to have the licenses for all of the dependencies
    represented in the license manifest of the image.
 
-The ``devtool edit-recipe`` command lets you take a look at the recipe:
-::
+The ``devtool edit-recipe`` command lets you take a look at the recipe::
 
    $ devtool edit-recipe cute-files
    SUMMARY = "Turn any folder on your computer into a cute file browser, available on the local network."
@@ -7520,8 +7309,7 @@ Three key points exist in the previous example:
    :ref:`npm <ref-classes-npm>` class to package
    up all the modules.
 
-You can run the following command to build the ``cute-files`` package:
-::
+You can run the following command to build the ``cute-files`` package::
 
    $ devtool build cute-files
 
@@ -7529,8 +7317,7 @@ Remember that ``nodejs`` must be installed on
 the target before your package.
 
 Assuming 192.168.7.2 for the target's IP address, use the following
-command to deploy your package:
-::
+command to deploy your package::
 
    $ devtool deploy-target -s cute-files root@192.168.7.2
 
@@ -7569,15 +7356,13 @@ projects method, you provide ``devtool`` with an URL that points to the
 source files.
 
 Replicating the same example, (i.e. ``cute-files``) use the following
-command:
-::
+command::
 
    $ devtool add https://github.com/martinaglv/cute-files.git
 
 The
 recipe this command generates is very similar to the recipe created in
-the previous section. However, the ``SRC_URI`` looks like the following:
-::
+the previous section. However, the ``SRC_URI`` looks like the following::
 
    SRC_URI = " \
        git://github.com/martinaglv/cute-files.git;protocol=https \
@@ -7629,8 +7414,7 @@ by the literal sequence '\\n'. The separator can be redefined using the
 variable flag ``separator``.
 
 The following is an example that adds two custom fields for ipk
-packages:
-::
+packages::
 
    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup:Applications/Spreadsheets"
 
@@ -7660,8 +7444,7 @@ adding statements to your configuration file so that the build process
 checks local directories first for existing tarballs before checking the
 Internet.
 
-Here is an efficient way to set it up in your ``local.conf`` file:
-::
+Here is an efficient way to set it up in your ``local.conf`` file::
 
    SOURCE_MIRROR_URL ?= "file:///home/you/your-download-dir/"
    INHERIT += "own-mirrors"
@@ -7692,8 +7475,7 @@ download directory :ref:`structure-build-downloads`,
 which is located with :term:`DL_DIR`.
 
 Use the following BitBake command form to fetch all the necessary
-sources without starting the build:
-::
+sources without starting the build::
 
    $ bitbake target --runall=fetch
 
@@ -7740,15 +7522,13 @@ following sections.
 Using systemd Exclusively
 -------------------------
 
-Set these variables in your distribution configuration file as follows:
-::
+Set these variables in your distribution configuration file as follows::
 
    DISTRO_FEATURES_append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
 
 You can also prevent the SysVinit distribution feature from
-being automatically enabled as follows:
-::
+being automatically enabled as follows::
 
    DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 
@@ -7756,8 +7536,7 @@ Doing so removes any
 redundant SysVinit scripts.
 
 To remove initscripts from your image altogether, set this variable
-also:
-::
+also::
 
    VIRTUAL-RUNTIME_initscripts = ""
 
@@ -7767,8 +7546,7 @@ For information on the backfill variable, see
 Using systemd for the Main Image and Using SysVinit for the Rescue Image
 ------------------------------------------------------------------------
 
-Set these variables in your distribution configuration file as follows:
-::
+Set these variables in your distribution configuration file as follows::
 
    DISTRO_FEATURES_append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -7800,8 +7578,7 @@ Using Persistent and Pre-Populated\ ``/dev``
 
 To use the static method for device population, you need to set the
 :term:`USE_DEVFS` variable to "0"
-as follows:
-::
+as follows::
 
    USE_DEVFS = "0"
 
@@ -7813,8 +7590,7 @@ machine or distro configuration file. Alternatively, you can set this
 variable in your ``local.conf`` configuration file.
 
 If you do not define the ``IMAGE_DEVICE_TABLES`` variable, the default
-``device_table-minimal.txt`` is used:
-::
+``device_table-minimal.txt`` is used::
 
    IMAGE_DEVICE_TABLES = "device_table-mymachine.txt"
 
@@ -7826,8 +7602,7 @@ Using ``devtmpfs`` and a Device Manager
 
 To use the dynamic method for device population, you need to use (or be
 sure to set) the :term:`USE_DEVFS`
-variable to "1", which is the default:
-::
+variable to "1", which is the default::
 
    USE_DEVFS = "1"
 
@@ -7844,8 +7619,7 @@ To have more control over the device nodes, you can use a device manager
 like ``udev`` or ``busybox-mdev``. You choose the device manager by
 defining the ``VIRTUAL-RUNTIME_dev_manager`` variable in your machine or
 distro configuration file. Alternatively, you can set this variable in
-your ``local.conf`` configuration file:
-::
+your ``local.conf`` configuration file::
 
    VIRTUAL-RUNTIME_dev_manager = "udev"
 
@@ -7866,14 +7640,12 @@ Subversion (SVN), Git, and Bazaar (BZR) repositories.
 
 To enable this behavior, the :term:`PV` of
 the recipe needs to reference
-:term:`SRCPV`. Here is an example:
-::
+:term:`SRCPV`. Here is an example::
 
    PV = "1.2.3+git${SRCPV}"
 
 Then, you can add the following to your
-``local.conf``:
-::
+``local.conf``::
 
    SRCREV_pn-PN = "${AUTOREV}"
 
@@ -7881,20 +7653,17 @@ Then, you can add the following to your
 which you want to enable automatic source revision updating.
 
 If you do not want to update your local configuration file, you can add
-the following directly to the recipe to finish enabling the feature:
-::
+the following directly to the recipe to finish enabling the feature::
 
    SRCREV = "${AUTOREV}"
 
 The Yocto Project provides a distribution named ``poky-bleeding``, whose
-configuration file contains the line:
-::
+configuration file contains the line::
 
    require conf/distro/include/poky-floating-revisions.inc
 
 This line pulls in the
-listed include file that contains numerous lines of exactly that form:
-::
+listed include file that contains numerous lines of exactly that form::
 
    #SRCREV_pn-opkg-native ?= "${AUTOREV}"
    #SRCREV_pn-opkg-sdk ?= "${AUTOREV}"
@@ -7946,15 +7715,13 @@ Creating the Root Filesystem
 To create the read-only root filesystem, simply add the
 "read-only-rootfs" feature to your image, normally in one of two ways.
 The first way is to add the "read-only-rootfs" image feature in the
-image's recipe file via the ``IMAGE_FEATURES`` variable:
-::
+image's recipe file via the ``IMAGE_FEATURES`` variable::
 
    IMAGE_FEATURES += "read-only-rootfs"
 
 As an alternative, you can add the same feature
 from within your build directory's ``local.conf`` file with the
-associated ``EXTRA_IMAGE_FEATURES`` variable, as in:
-::
+associated ``EXTRA_IMAGE_FEATURES`` variable, as in::
 
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
 
@@ -8051,8 +7818,7 @@ Build history is disabled by default. To enable it, add the following
 ``INHERIT`` statement and set the
 :term:`BUILDHISTORY_COMMIT`
 variable to "1" at the end of your ``conf/local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::
 
    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "1"
@@ -8140,8 +7906,7 @@ and actual revisions might differ when
 :term:`SRCREV` is set to
 ${:term:`AUTOREV`}. Here is an
 example assuming
-``buildhistory/packages/qemux86-poky-linux/linux-yocto/latest_srcrev``):
-::
+``buildhistory/packages/qemux86-poky-linux/linux-yocto/latest_srcrev``)::
 
    # SRCREV_machine = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
    SRCREV_machine = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
@@ -8154,8 +7919,7 @@ collect the stored ``SRCREV`` values from build history and report them
 in a format suitable for use in global configuration (e.g.,
 ``local.conf`` or a distro include file) to override floating
 ``AUTOREV`` values to a fixed set of revisions. Here is some example
-output from this command:
-::
+output from this command::
 
    $ buildhistory-collect-srcrevs -a
    # i586-poky-linux
@@ -8270,8 +8034,7 @@ image. If you are just interested in this information and not interested
 in collecting specific package or SDK information, you can enable
 writing only image information without any history by adding the
 following to your ``conf/local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::
 
    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "0"
@@ -8370,8 +8133,7 @@ interface.
 To see any changes that have occurred (assuming you have
 :term:`BUILDHISTORY_COMMIT` = "1"),
 you can simply use any Git command that allows you to view the history
-of a repository. Here is one method:
-::
+of a repository. Here is one method::
 
    $ git log -p
 
@@ -8381,8 +8143,7 @@ however, that this method does show changes that are not significant
 
 A command-line tool called ``buildhistory-diff`` does exist, though,
 that queries the Git repository and prints just the differences that
-might be significant in human-readable form. Here is an example:
-::
+might be significant in human-readable form. Here is an example::
 
    $ poky/poky/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
@@ -8402,8 +8163,7 @@ might be significant in human-readable form. Here is an example:
 .. note::
 
    The ``buildhistory-diff`` tool requires the ``GitPython``
-   package. Be sure to install it using Pip3 as follows:
-   ::
+   package. Be sure to install it using Pip3 as follows::
 
          $ pip3 install GitPython --user
 
@@ -8473,8 +8233,7 @@ In order to run tests, you need to do the following:
             with sudo.
 
          -  The package recipe ``qemu-helper-native`` is required to run
-            this script. Build the package using the following command:
-            ::
+            this script. Build the package using the following command::
 
                $ bitbake qemu-helper-native
 
@@ -8609,8 +8368,7 @@ not need any information in this section. You can skip down to the
 If you did set ``TEST_TARGET`` to "SystemdbootTarget", you also need to
 perform a one-time setup of your master image by doing the following:
 
-1. *Set EFI_PROVIDER:* Be sure that ``EFI_PROVIDER`` is as follows:
-   ::
+1. *Set EFI_PROVIDER:* Be sure that ``EFI_PROVIDER`` is as follows::
 
       EFI_PROVIDER = "systemd-boot"
 
@@ -8648,16 +8406,14 @@ The final thing you need to do when setting ``TEST_TARGET`` to
 "SystemdbootTarget" is to set up the test image:
 
 1. *Set up your local.conf file:* Make sure you have the following
-   statements in your ``local.conf`` file:
-   ::
+   statements in your ``local.conf`` file::
 
       IMAGE_FSTYPES += "tar.gz"
       INHERIT += "testimage"
       TEST_TARGET = "SystemdbootTarget"
       TEST_TARGET_IP = "192.168.2.3"
 
-2. *Build your test image:* Use BitBake to build the image:
-   ::
+2. *Build your test image:* Use BitBake to build the image::
 
       $ bitbake core-image-sato
 
@@ -8671,8 +8427,7 @@ power:
    ``TEST_POWERCONTROL_EXTRA_ARGS`` as a command that runs on the host
    and does power cycling. The test code passes one argument to that
    command: off, on or cycle (off then on). Here is an example that
-   could appear in your ``local.conf`` file:
-   ::
+   could appear in your ``local.conf`` file::
 
       TEST_POWERCONTROL_CMD = "powercontrol.exp test 10.11.12.1 nuc1"
 
@@ -8705,8 +8460,7 @@ wish to experiment with automated hardware testing, you can use the
 the required power action. This script requires either KDialog or Zenity
 to be installed. To use this script, set the
 :term:`TEST_POWERCONTROL_CMD`
-variable as follows:
-::
+variable as follows::
 
    TEST_POWERCONTROL_CMD = "${COREBASE}/scripts/contrib/dialog-power-control"
 
@@ -8728,8 +8482,7 @@ connecting to a remote console server. Regardless of the case, the
 command simply needs to connect to the serial console and forward that
 connection to standard input and output as any normal terminal program
 does. For example, to use the picocom terminal program on serial device
-``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows:
-::
+``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows::
 
    TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"
 
@@ -8737,8 +8490,7 @@ For local
 devices where the serial port device disappears when the device reboots,
 an additional "serdevtry" wrapper script is provided. To use this
 wrapper, simply prefix the terminal command with
-``${COREBASE}/scripts/contrib/serdevtry``:
-::
+``${COREBASE}/scripts/contrib/serdevtry``::
 
    TEST_SERIALCONTROL_CMD = "${COREBASE}/scripts/contrib/serdevtry picocom -b 115200 /dev/ttyUSB0"
 
@@ -8752,27 +8504,23 @@ You can start the tests automatically or manually:
    set the
    :term:`TESTIMAGE_AUTO`
    variable to "1" in your ``local.conf`` file in the
-   :term:`Build Directory`:
-   ::
+   :term:`Build Directory`::
 
       TESTIMAGE_AUTO = "1"
 
    Next, build your image. If the image successfully builds, the
-   tests run:
-   ::
+   tests run::
 
       bitbake core-image-sato
 
 -  *Manually running tests:* To manually run the tests, first globally
    inherit the
    :ref:`testimage <ref-classes-testimage*>` class
-   by editing your ``local.conf`` file:
-   ::
+   by editing your ``local.conf`` file::
 
       INHERIT += "testimage"
 
-   Next, use BitBake to run the tests:
-   ::
+   Next, use BitBake to run the tests::
 
       bitbake -c testimage image
 
@@ -8815,18 +8563,15 @@ handling.
 
 Here are some things to keep in mind when running tests:
 
--  The default tests for the image are defined as:
-   ::
+-  The default tests for the image are defined as::
 
       DEFAULT_TEST_SUITES_pn-image = "ping ssh df connman syslog xorg scp vnc date rpm dnf dmesg"
 
--  Add your own test to the list of the by using the following:
-   ::
+-  Add your own test to the list of the by using the following::
 
       TEST_SUITES_append = " mytest"
 
--  Run a specific list of tests as follows:
-   ::
+-  Run a specific list of tests as follows::
 
      TEST_SUITES = "test1 test2 test3"
 
@@ -8842,16 +8587,14 @@ test execution off to a scheduler. You can only export tests that are
 defined in :term:`TEST_SUITES`.
 
 If your image is already built, make sure the following are set in your
-``local.conf`` file:
-::
+``local.conf`` file::
 
    INHERIT += "testexport"
    TEST_TARGET_IP = "IP-address-for-the-test-target"
    TEST_SERVER_IP = "IP-address-for-the-test-server"
 
 You can then export the tests with the
-following BitBake command form:
-::
+following BitBake command form::
 
    $ bitbake image -c testexport
 
@@ -8860,28 +8603,24 @@ Exporting the tests places them in the
 ``tmp/testexport/``\ image, which is controlled by the
 ``TEST_EXPORT_DIR`` variable.
 
-You can now run the tests outside of the build environment:
-::
+You can now run the tests outside of the build environment::
 
    $ cd tmp/testexport/image
    $ ./runexported.py testdata.json
 
 Here is a complete example that shows IP addresses and uses the
-``core-image-sato`` image:
-::
+``core-image-sato`` image::
 
    INHERIT += "testexport"
    TEST_TARGET_IP = "192.168.7.2"
    TEST_SERVER_IP = "192.168.7.1"
 
-Use BitBake to export the tests:
-::
+Use BitBake to export the tests::
 
    $ bitbake core-image-sato -c testexport
 
 Run the tests outside of
-the build environment using the following:
-::
+the build environment using the following::
 
    $ cd tmp/testexport/core-image-sato
    $ ./runexported.py testdata.json
@@ -9157,14 +8896,12 @@ variables>` did not work out as expected.
 BitBake's ``-e`` option is used to display variable values after
 parsing. The following command displays the variable values after the
 configuration files (i.e. ``local.conf``, ``bblayers.conf``,
-``bitbake.conf`` and so forth) have been parsed:
-::
+``bitbake.conf`` and so forth) have been parsed::
 
    $ bitbake -e
 
 The following command displays variable values after a specific recipe has
-been parsed. The variables include those from the configuration as well:
-::
+been parsed. The variables include those from the configuration as well::
 
    $ bitbake -e recipename
 
@@ -9187,8 +8924,7 @@ variable flags (varflags) set on the variable. The output can be very
 helpful during debugging.
 
 Variables that are exported to the environment are preceded by
-``export`` in the output of ``bitbake -e``. See the following example:
-::
+``export`` in the output of ``bitbake -e``. See the following example::
 
    export CC="i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/ulf/poky/build/tmp/sysroots/qemux86"
 
@@ -9250,8 +8986,7 @@ Following are a few of the available ``oe-pkgdata-util`` subcommands.
 -  ``oe-pkgdata-util find-path path ...``: Lists the names of
    the packages that contain the given paths. For example, the following
    tells us that ``/usr/share/man/man1/make.1`` is contained in the
-   ``make-doc`` package:
-   ::
+   ``make-doc`` package::
 
       $ oe-pkgdata-util find-path /usr/share/man/man1/make.1
       make-doc: /usr/share/man/man1/make.1
@@ -9260,8 +8995,7 @@ Following are a few of the available ``oe-pkgdata-util`` subcommands.
    of the recipes that produce the given packages.
 
 For more information on the ``oe-pkgdata-util`` command, use the help
-facility:
-::
+facility::
 
    $ oe-pkgdata-util --help
    $ oe-pkgdata-util subcommand --help
@@ -9274,8 +9008,7 @@ before the one you have specified. Dependency information can help you
 understand why a recipe is built.
 
 To generate dependency information for a recipe, run the following
-command:
-::
+command::
 
    $ bitbake -g recipename
 
@@ -9305,8 +9038,7 @@ format and can be converted to images (e.g. using the ``dot`` tool from
       provide useful information.
 
       As an example, the ``task-depends.dot`` file contains lines such
-      as the following:
-      ::
+      as the following::
 
          "libxslt.do_configure" -> "libxml2.do_populate_sysroot"
 
@@ -9323,8 +9055,7 @@ format and can be converted to images (e.g. using the ``dot`` tool from
       displays paths between graph nodes.
 
 You can use a different method to view dependency information by using
-the following command:
-::
+the following command::
 
    $ bitbake -g -u taskexp recipename
 
@@ -9350,8 +9081,7 @@ If you are unsure whether a variable dependency is being picked up
 automatically for a given task, you can list the variable dependencies
 BitBake has determined by doing the following:
 
-1. Build the recipe containing the task:
-   ::
+1. Build the recipe containing the task::
 
    $ bitbake recipename
 
@@ -9362,8 +9092,7 @@ BitBake has determined by doing the following:
    checksum for the task. As an example, for the
    :ref:`ref-tasks-fetch` task of the
    ``db`` recipe, the ``sigdata`` file might be found in the following
-   location:
-   ::
+   location::
 
       ${BUILDDIR}/tmp/stamps/i586-poky-linux/db/6.0.30-r1.do_fetch.sigdata.7c048c18222b16ff0bcee2000ef648b1
 
@@ -9375,8 +9104,7 @@ BitBake has determined by doing the following:
    same information as ``sigdata`` files.
 
 3. Run ``bitbake-dumpsig`` on the ``sigdata`` or ``siginfo`` file. Here
-   is an example:
-   ::
+   is an example::
 
       $ bitbake-dumpsig ${BUILDDIR}/tmp/stamps/i586-poky-linux/db/6.0.30-r1.do_fetch.sigdata.7c048c18222b16ff0bcee2000ef648b1
 
@@ -9406,8 +9134,7 @@ call ``bitbake-diffsigs`` with just one file, the command behaves like
 
 You can also use BitBake to dump out the signature construction
 information without executing tasks by using either of the following
-BitBake command-line options:
-::
+BitBake command-line options::
 
    ‐‐dump-signatures=SIGNATURE_HANDLER
    -S SIGNATURE_HANDLER
@@ -9494,8 +9221,7 @@ behavior in most cases is: ``do_fetch``, ``do_unpack``, ``do_patch``,
 ``do_build`` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
-use the ``-c`` option in BitBake. Here is an example:
-::
+use the ``-c`` option in BitBake. Here is an example::
 
    $ bitbake matchbox-desktop -c devshell
 
@@ -9520,8 +9246,7 @@ out), then you can use the ``-f`` option.
    [\ :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ]
    variable flag is already set for the task.
 
-The following example shows one way you can use the ``-f`` option:
-::
+The following example shows one way you can use the ``-f`` option::
 
    $ bitbake matchbox-desktop
              .
@@ -9550,8 +9275,7 @@ Using this option invalidates the given task and then runs the
 :ref:`ref-tasks-build` task, which is
 the default task if no task is given, and the tasks on which it depends.
 You could replace the final two commands in the previous example with
-the following single command:
-::
+the following single command::
 
    $ bitbake matchbox-desktop -C compile
 
@@ -9575,16 +9299,14 @@ task dependency mechanisms.
    and build output might not be in the clean state they would be in for
    a "normal" build, depending on what actions you took. To get rid of
    such warnings, you can remove the work directory and rebuild the
-   recipe, as follows:
-   ::
+   recipe, as follows::
 
       $ bitbake matchbox-desktop -c clean
       $ bitbake matchbox-desktop
 
 
 You can view a list of tasks in a given package by running the
-``do_listtasks`` task as follows:
-::
+``do_listtasks`` task as follows::
 
    $ bitbake matchbox-desktop -c listtasks
 
@@ -9608,8 +9330,7 @@ Building with No Dependencies
 -----------------------------
 
 To build a specific recipe (``.bb`` file), you can use the following
-command form:
-::
+command form::
 
    $ bitbake -b somepath/somerecipe.bb
 
@@ -9678,8 +9399,7 @@ in the log, use the "debug" loglevel.
 Following is an example written in Python. The code handles logging for
 a function that determines the number of tasks needed to be run. See the
 ":ref:`ref-tasks-listtasks`"
-section for additional information:
-::
+section for additional information::
 
    python do_listtasks() {
        bb.debug(2, "Starting to figure out the task list")
@@ -9841,21 +9561,18 @@ build, set the
 :term:`PARALLEL_MAKE` variable
 in your ``local.conf`` file to a high number (e.g. "-j 20"). Using a
 high value for ``PARALLEL_MAKE`` increases the chances of the race
-condition showing up:
-::
+condition showing up::
 
    $ bitbake neard
 
-Once the local build for "neard" completes, start a ``devshell`` build:
-::
+Once the local build for "neard" completes, start a ``devshell`` build::
 
    $ bitbake neard -c devshell
 
 For information on how to use a ``devshell``, see the
 ":ref:`dev-manual/common-tasks:using a development shell`" section.
 
-In the ``devshell``, do the following:
-::
+In the ``devshell``, do the following::
 
    $ make clean
    $ make tools/snep-send.o
@@ -9863,8 +9580,7 @@ In the ``devshell``, do the following:
 The ``devshell`` commands cause the failure to clearly
 be visible. In this case, a missing dependency exists for the "neard"
 Makefile target. Here is some abbreviated, sample output with the
-missing dependency clearly visible at the end:
-::
+missing dependency clearly visible at the end::
 
    i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/scott-lenovo/......
       .
@@ -9885,8 +9601,7 @@ Creating a Patch for the Fix
 
 Because there is a missing dependency for the Makefile target, you need
 to patch the ``Makefile.am`` file, which is generated from
-``Makefile.in``. You can use Quilt to create the patch:
-::
+``Makefile.in``. You can use Quilt to create the patch::
 
    $ quilt new parallelmake.patch
    Patch patches/parallelmake.patch is now on top
@@ -9898,14 +9613,12 @@ For more information on using Quilt, see the
 
 At this point you need to make the edits to ``Makefile.am`` to add the
 missing dependency. For our example, you have to add the following line
-to the file:
-::
+to the file::
 
    tools/snep-send.$(OBJEXT): include/near/dbus.h
 
 Once you have edited the file, use the ``refresh`` command to create the
-patch:
-::
+patch::
 
    $ quilt refresh
    Refreshed patch patches/parallelmake.patch
@@ -9913,8 +9626,7 @@ patch:
 Once
 the patch file exists, you need to add it back to the originating recipe
 folder. Here is an example assuming a top-level
-:term:`Source Directory` named ``poky``:
-::
+:term:`Source Directory` named ``poky``::
 
    $ cp patches/parallelmake.patch poky/meta/recipes-connectivity/neard/neard
 
@@ -9922,8 +9634,7 @@ The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
 :term:`SRC_URI` statement includes
 the patch file. The recipe file is in the folder above the patch. Here
-is what the edited ``SRC_URI`` statement would look like:
-::
+is what the edited ``SRC_URI`` statement would look like::
 
    SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
               file://neard.in \
@@ -9932,8 +9643,7 @@ is what the edited ``SRC_URI`` statement would look like:
              "
 
 With the patch complete and moved to the correct folder and the
-``SRC_URI`` statement updated, you can exit the ``devshell``:
-::
+``SRC_URI`` statement updated, you can exit the ``devshell``::
 
    $ exit
 
@@ -9941,16 +9651,14 @@ Testing the Build
 ~~~~~~~~~~~~~~~~~
 
 With everything in place, you can get back to trying the build again
-locally:
-::
+locally::
 
    $ bitbake neard
 
 This build should succeed.
 
 Now you can open up a ``devshell`` again and repeat the clean and make
-operations as follows:
-::
+operations as follows::
 
    $ bitbake neard -c devshell
    $ make clean
@@ -10005,24 +9713,21 @@ debug symbols from the server.
 
 To run a debuginfod server, you need to do the following:
 
--  Ensure that this variable is set in your ``local.conf`` file:
-   ::
+-  Ensure that this variable is set in your ``local.conf`` file::
 
       PACKAGECONFIG_pn-elfutils-native = "debuginfod libdebuginfod"
 
    This :term:`PACKAGECONFIG` option enables debuginfod and libdebuginfod for
    "elfutils-native".
 
--  Run the following commands to set up the "debuginfod" server:
-   ::
+-  Run the following commands to set up the "debuginfod" server::
 
       $ oe-debuginfod
 
 
 To use debuginfod on the target, you need the following:
 
--  Ensure that this variable is set in your ``local.conf`` file:
-   ::
+-  Ensure that this variable is set in your ``local.conf`` file::
 
       DEBUGINFOD_URLS = "http://localhost:8002/"
 
@@ -10069,8 +9774,7 @@ debugger.
 1. *Configure your build system to construct the companion debug
    filesystem:*
 
-   In your ``local.conf`` file, set the following:
-   ::
+   In your ``local.conf`` file, set the following::
 
       IMAGE_GEN_DEBUGFS = "1"
       IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
@@ -10090,8 +9794,7 @@ debugger.
 2. *Configure the system to include gdbserver in the target filesystem:*
 
    Make the following addition in either your ``local.conf`` file or in
-   an image recipe:
-   ::
+   an image recipe::
 
       IMAGE_INSTALL_append = " gdbserver"
 
@@ -10101,29 +9804,25 @@ debugger.
 3. *Build the environment:*
 
    Use the following command to construct the image and the companion
-   Debug Filesystem:
-   ::
+   Debug Filesystem::
 
       $ bitbake image
 
    Build the cross GDB component and
    make it available for debugging. Build the SDK that matches the
    image. Building the SDK is best for a production build that can be
-   used later for debugging, especially during long term maintenance:
-   ::
+   used later for debugging, especially during long term maintenance::
 
       $ bitbake -c populate_sdk image
 
    Alternatively, you can build the minimal toolchain components that
    match the target. Doing so creates a smaller than typical SDK and
    only contains a minimal set of components with which to build simple
-   test applications, as well as run the debugger:
-   ::
+   test applications, as well as run the debugger::
 
       $ bitbake meta-toolchain
 
-   A final method is to build Gdb itself within the build system:
-   ::
+   A final method is to build Gdb itself within the build system::
 
       $ bitbake gdb-cross-<architecture>
 
@@ -10140,8 +9839,7 @@ debugger.
 
 4. *Set up the* ``debugfs``\ *:*
 
-   Run the following commands to set up the ``debugfs``:
-   ::
+   Run the following commands to set up the ``debugfs``::
 
       $ mkdir debugfs
       $ cd debugfs
@@ -10180,8 +9878,7 @@ debugger.
    Documentation <https://www.gnu.org/software/gdb/documentation/>`__.
 
    After running gdbserver on the target, you need to run Gdb on the
-   host and configure it and connect to the target. Use these commands:
-   ::
+   host and configure it and connect to the target. Use these commands::
 
       $ cd directory-holding-the-debugfs-directory
       $ arch-gdb
@@ -10212,8 +9909,7 @@ debugger.
    If the binary is processed through the debug splitting in
    OpenEmbedded, you should also copy the debug items (i.e. ``.debug``
    contents and corresponding ``/usr/src/debug`` files) from the work
-   directory. Here is an example:
-   ::
+   directory. Here is an example::
 
       $ bitbake bash
       $ bitbake -c devshell bash
@@ -10234,25 +9930,21 @@ debug on the target hardware.
 To support this kind of debugging, you need do the following:
 
 -  Ensure that GDB is on the target. You can do this by adding "gdb" to
-   :term:`IMAGE_INSTALL`:
-   ::
+   :term:`IMAGE_INSTALL`::
 
       IMAGE_INSTALL_append = " gdb"
 
-   Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`:
-   ::
+   Alternatively, you can add "tools-debug" to :term:`IMAGE_FEATURES`::
 
       IMAGE_FEATURES_append = " tools-debug"
 
 -  Ensure that debug symbols are present. You can make sure these
-   symbols are present by installing ``-dbg``:
-   ::
+   symbols are present by installing ``-dbg``::
 
       IMAGE_INSTALL_append = "packagename-dbg"
 
    Alternatively, you can do the following to include
-   all the debug symbols:
-   ::
+   all the debug symbols::
 
       IMAGE_FEATURES_append = " dbg-pkgs"
 
@@ -10262,8 +9954,7 @@ To support this kind of debugging, you need do the following:
    of optimization used by the compiler. For example, when adding the
    following line to your ``local.conf`` file, you will reduce optimization
    from :term:`FULL_OPTIMIZATION` of "-O2" to :term:`DEBUG_OPTIMIZATION`
-   of "-O -fno-omit-frame-pointer":
-   ::
+   of "-O -fno-omit-frame-pointer"::
 
            DEBUG_BUILD = "1"
 
@@ -10307,8 +9998,7 @@ Here are some other tips that you might find useful:
    Using GNU Grep, you can use the following shell function to
    recursively search through common recipe-related files, skipping
    binary files, ``.git`` directories, and the Build Directory (assuming
-   its name starts with "build"):
-   ::
+   its name starts with "build")::
 
       g() {
           grep -Ir \
@@ -10321,8 +10011,7 @@ Here are some other tips that you might find useful:
                "$@"
       }
 
-   Following are some usage examples:
-   ::
+   Following are some usage examples::
 
       $ g FOO # Search recursively for "FOO"
       $ g -i foo # Search recursively for "foo", ignoring case
@@ -10581,8 +10270,7 @@ Preparing Changes for Submission
       specific convention for bug references - any commit that addresses
       a specific bug should use the following form for the detailed
       description. Be sure to use the actual bug-tracking ID from
-      Bugzilla for bug-id:
-      ::
+      Bugzilla for bug-id::
 
          Fixes [YOCTO #bug-id]
 
@@ -10608,8 +10296,7 @@ without using the scripts once the steps in
    provide the command, you must include a revision list or a number of
    patches as part of the command. For example, either of these two
    commands takes your most recent single commit and formats it as an
-   email message in the current directory:
-   ::
+   email message in the current directory::
 
       $ git format-patch -1
 
@@ -10701,8 +10388,7 @@ been followed:
 
 1. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
    permissions to push to an upstream contrib repository, push the
-   change to that repository:
-   ::
+   change to that repository::
 
       $ git push upstream_remote_repo local_branch_name
 
@@ -10711,8 +10397,7 @@ been followed:
    working in a local branch named `your_name`\ ``/README``. The following
    command pushes your local commits to the ``meta-intel-contrib``
    upstream repository and puts the commit in a branch named
-   `your_name`\ ``/README``:
-   ::
+   `your_name`\ ``/README``::
 
       $ git push meta-intel-contrib your_name/README
 
@@ -10729,8 +10414,7 @@ been followed:
 
    -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
       enter the following command to bring up a short list of all
-      commits against a specific file:
-      ::
+      commits against a specific file::
 
          git shortlog -- filename
 
@@ -10764,8 +10448,7 @@ been followed:
    First, create the pull request. For example, the following command
    runs the script, specifies the upstream repository in the contrib
    directory into which you pushed the change, and provides a subject
-   line in the created patch files:
-   ::
+   line in the created patch files::
 
       $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
 
@@ -10778,8 +10461,7 @@ been followed:
    editing the cover letter, send the pull request. For example, the
    following command runs the script and specifies the patch directory
    and email address. In this example, the email address is a mailing
-   list:
-   ::
+   list::
 
       $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@yoctoproject.org
 
@@ -10788,8 +10470,7 @@ been followed:
    .. note::
 
       For help on using these scripts, simply provide the ``-h``
-      argument as follows:
-      ::
+      argument as follows::
 
               $ poky/scripts/create-pull-request -h
               $ poky/scripts/send-pull-request -h
@@ -10901,8 +10582,7 @@ Specifying the ``LIC_FILES_CHKSUM`` Variable
 
 The ``LIC_FILES_CHKSUM`` variable contains checksums of the license text
 in the source code for the recipe. Following is an example of how to
-specify ``LIC_FILES_CHKSUM``:
-::
+specify ``LIC_FILES_CHKSUM``::
 
    LIC_FILES_CHKSUM = "file://COPYING;md5=xxxx \
                        file://licfile1.txt;beginline=5;endline=29;md5=yyyy \
@@ -10925,8 +10605,7 @@ variable as the default directory when searching files listed in
 ``LIC_FILES_CHKSUM``. The previous example employs the default
 directory.
 
-Consider this next example:
-::
+Consider this next example::
 
    LIC_FILES_CHKSUM = "file://src/ls.c;beginline=5;endline=16;\
                                        md5=bb14ed3c4cda583abc85401304b5cd4e"
@@ -10988,15 +10667,13 @@ are defined on a recipe-by-recipe basis through the
 :term:`LICENSE_FLAGS` variable
 definition in the affected recipe. For instance, the
 ``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` recipe
-contains the following statement:
-::
+contains the following statement::
 
    LICENSE_FLAGS = "commercial"
 
 Here is a
 slightly more complicated example that contains both an explicit recipe
-name and version (after variable expansion):
-::
+name and version (after variable expansion)::
 
    LICENSE_FLAGS = "license_${PN}_${PV}"
 
@@ -11011,8 +10688,7 @@ could add either the string "commercial_gst-plugins-ugly" or the more
 general string "commercial" to ``LICENSE_FLAGS_WHITELIST``. See the
 ":ref:`dev-manual/common-tasks:license flag matching`" section for a full
 explanation of how ``LICENSE_FLAGS`` matching works. Here is the
-example:
-::
+example::
 
    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly"
 
@@ -11020,8 +10696,7 @@ Likewise, to additionally enable the package built from the recipe
 containing ``LICENSE_FLAGS = "license_${PN}_${PV}"``, and assuming that
 the actual recipe name was ``emgd_1.10.bb``, the following string would
 enable that package as well as the original ``gst-plugins-ugly``
-package:
-::
+package::
 
    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly license_emgd_1.10"
 
@@ -11077,8 +10752,7 @@ matches any expanded ``LICENSE_FLAGS`` definition that starts with the
 string "commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
 hypothetical recipes named "foo" and "bar" assuming those recipes simply
-specify the following:
-::
+specify the following::
 
    LICENSE_FLAGS = "commercial"
 
@@ -11116,8 +10790,7 @@ Other Variables Related to Commercial Licenses
 
 Other helpful variables related to commercial license handling exist and
 are defined in the
-``poky/meta/conf/distro/include/default-distrovars.inc`` file:
-::
+``poky/meta/conf/distro/include/default-distrovars.inc`` file::
 
    COMMERCIAL_AUDIO_PLUGINS ?= ""
    COMMERCIAL_VIDEO_PLUGINS ?= ""
@@ -11125,8 +10798,7 @@ are defined in the
 If you
 want to enable these components, you can do so by making sure you have
 statements similar to the following in your ``local.conf`` configuration
-file:
-::
+file::
 
    COMMERCIAL_AUDIO_PLUGINS = "gst-plugins-ugly-mad \
        gst-plugins-ugly-mpegaudioparse"
@@ -11138,8 +10810,7 @@ file:
 Of course, you could also create a matching whitelist for those
 components using the more general "commercial" in the whitelist, but
 that would also enable all the other packages with ``LICENSE_FLAGS``
-containing "commercial", which you may or may not want:
-::
+containing "commercial", which you may or may not want::
 
    LICENSE_FLAGS_WHITELIST = "commercial"
 
@@ -11219,8 +10890,7 @@ of compliance in mind.
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
 the ``local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::
 
    INHERIT += "archiver"
    ARCHIVER_MODE[src] = "original"
@@ -11276,8 +10946,7 @@ One requirement that is often overlooked is inclusion of license text.
 This requirement also needs to be dealt with prior to generating the
 final image. Some licenses require the license text to accompany the
 binary. You can achieve this by adding the following to your
-``local.conf`` file:
-::
+``local.conf`` file::
 
    COPY_LIC_MANIFEST = "1"
    COPY_LIC_DIRS = "1"
@@ -11344,8 +11013,7 @@ thing a development organization might want to consider for end-user
 convenience is to modify ``meta-poky/conf/bblayers.conf.sample`` to
 ensure that when the end user utilizes the released build system to
 build an image, the development organization's layers are included in
-the ``bblayers.conf`` file automatically:
-::
+the ``bblayers.conf`` file automatically::
 
    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -11413,8 +11081,7 @@ variable. Using this variable also avoids QA errors when you use a
 non-common, non-CLOSED license in a recipe.
 
 The following is an example that uses the ``LICENSE.Abilis.txt`` file as
-the license from the fetched source:
-::
+the license from the fetched source::
 
    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
@@ -11457,8 +11124,7 @@ class by adding the following statement to the end of your
 By default, the error reporting feature stores information in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 However, you can specify a directory to use by adding the following to
-your ``local.conf`` file:
-::
+your ``local.conf`` file::
 
    ERR_REPORT_DIR = "path"
 
@@ -11467,8 +11133,7 @@ reporting causes the build process to collect the errors and store them
 in a file as previously described. When the build system encounters an
 error, it includes a command as part of the console output. You can run
 the command to send the error file to the server. For example, the
-following command sends the errors to an upstream server:
-::
+following command sends the errors to an upstream server::
 
    $ send-error-report /home/brandusa/project/poky/build/tmp/log/error-report/error_report_201403141617.txt
 
@@ -11476,8 +11141,7 @@ In the previous example, the errors are sent to a public database
 available at https://errors.yoctoproject.org, which is used by the
 entire community. If you specify a particular server, you can send the
 errors to a different database. Use the following command for more
-information on available options:
-::
+information on available options::
 
    $ send-error-report --help
 
@@ -11557,8 +11221,7 @@ Wayland with Kernel Mode Setting
 (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
 support, include the "wayland" flag in the
 :term:`DISTRO_FEATURES`
-statement in your ``local.conf`` file:
-::
+statement in your ``local.conf`` file::
 
    DISTRO_FEATURES_append = " wayland"
 
@@ -11573,8 +11236,7 @@ Installing Wayland and Weston
 To install the Wayland feature into an image, you must include the
 following
 :term:`CORE_IMAGE_EXTRA_INSTALL`
-statement in your ``local.conf`` file:
-::
+statement in your ``local.conf`` file::
 
    CORE_IMAGE_EXTRA_INSTALL += "wayland weston"
 
@@ -11589,14 +11251,12 @@ Alternatively, you can run Weston through the command-line interpretor
 (CLI), which is better suited for development work. To run Weston under
 the CLI, you need to do the following after your image is built:
 
-1. Run these commands to export ``XDG_RUNTIME_DIR``:
-   ::
+1. Run these commands to export ``XDG_RUNTIME_DIR``::
 
       mkdir -p /tmp/$USER-weston
       chmod 0700 /tmp/$USER-weston
       export XDG_RUNTIME_DIR=/tmp/$USER-weston
 
-2. Launch Weston in the shell:
-   ::
+2. Launch Weston in the shell::
 
       weston
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 92799d6d25..2b6d3d76c7 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -55,16 +55,14 @@ available. Follow these general steps to run QEMU:
 
    -  If you cloned the ``poky`` repository or you downloaded and
       unpacked a Yocto Project release tarball, you can source the build
-      environment script (i.e. :ref:`structure-core-script`):
-      ::
+      environment script (i.e. :ref:`structure-core-script`)::
 
          $ cd poky
          $ source oe-init-build-env
 
    -  If you installed a cross-toolchain, you can run the script that
       initializes the toolchain. For example, the following commands run
-      the initialization script from the default ``poky_sdk`` directory:
-      ::
+      the initialization script from the default ``poky_sdk`` directory::
 
          . poky_sdk/environment-setup-core2-64-poky-linux
 
@@ -86,8 +84,7 @@ available. Follow these general steps to run QEMU:
    Extensible Software Development Kit (eSDK) manual for information on
    how to extract a root filesystem.
 
-4. *Run QEMU:* The basic ``runqemu`` command syntax is as follows:
-   ::
+4. *Run QEMU:* The basic ``runqemu`` command syntax is as follows::
 
       $ runqemu [option ] [...]
 
@@ -222,18 +219,15 @@ using an NFS server.
    Should you need to start, stop, or restart the NFS share, you can use
    the following commands:
 
-   -  The following command starts the NFS share:
-      ::
+   -  The following command starts the NFS share::
 
          runqemu-export-rootfs start file-system-location
 
-   -  The following command stops the NFS share:
-      ::
+   -  The following command stops the NFS share::
 
          runqemu-export-rootfs stop file-system-location
 
-   -  The following command restarts the NFS share:
-      ::
+   -  The following command restarts the NFS share::
 
          runqemu-export-rootfs restart file-system-location
 
@@ -313,8 +307,7 @@ present, the toolchain is also automatically used.
 QEMU Command-Line Syntax
 ========================
 
-The basic ``runqemu`` command syntax is as follows:
-::
+The basic ``runqemu`` command syntax is as follows::
 
    $ runqemu [option ] [...]
 
@@ -325,8 +318,7 @@ timestamp when it needs to look for an image. Minimally, through the use
 of options, you must provide either a machine name, a virtual machine
 image (``*wic.vmdk``), or a kernel image (``*.bin``).
 
-Following is the command-line help output for the ``runqemu`` command:
-::
+Following is the command-line help output for the ``runqemu`` command::
 
    $ runqemu --help
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 84abf4c51f..f8c8637d47 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -486,8 +486,7 @@ your Yocto Project build host:
    distribution.
 
 3. *Check your Linux distribution is using WSLv2:* Open a Windows
-   PowerShell and run:
-   ::
+   PowerShell and run::
 
       C:\WINDOWS\system32> wsl -l -v
       NAME    STATE   VERSION
@@ -514,8 +513,7 @@ your Yocto Project build host:
 
    1. *Find the location of your VHDX file:* First you need to find the
       distro app package directory, to achieve this open a Windows
-      Powershell as Administrator and run:
-      ::
+      Powershell as Administrator and run::
 
          C:\WINDOWS\system32> Get-AppxPackage -Name "*Ubuntu*" | Select PackageFamilyName
          PackageFamilyName
@@ -525,8 +523,7 @@ your Yocto Project build host:
 
       You should now
       replace the PackageFamilyName and your user on the following path
-      to find your VHDX file:
-      ::
+      to find your VHDX file::
 
           ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
           Mode                 LastWriteTime         Length Name
@@ -536,8 +533,7 @@ your Yocto Project build host:
       ``C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx``
 
    2. *Optimize your VHDX file:* Open a Windows Powershell as
-      Administrator to optimize your VHDX file, shutting down WSL first:
-      ::
+      Administrator to optimize your VHDX file, shutting down WSL first::
 
          C:\WINDOWS\system32> wsl --shutdown
          C:\WINDOWS\system32> optimize-vhd -Path C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\ext4.vhdx -Mode full
@@ -741,8 +737,7 @@ Follow these steps to create a local version of the upstream
 
 2. *Clone the Repository:* The following example command clones the
    ``poky`` repository and uses the default name "poky" for your local
-   repository:
-   ::
+   repository::
 
       $ git clone git://git.yoctoproject.org/poky
       Cloning into 'poky'...
@@ -764,8 +759,7 @@ Follow these steps to create a local version of the upstream
 
    Once the local repository is created, you can change to that
    directory and check its status. Here, the single "master" branch
-   exists on your system and by default, it is checked out:
-   ::
+   exists on your system and by default, it is checked out::
 
       $ cd poky
       $ git status
@@ -826,8 +820,7 @@ and then specifically check out that development branch.
 
 3. *Check out the Branch:* Check out the development branch in which you
    want to work. For example, to access the files for the Yocto Project
-   &DISTRO; Release (&DISTRO_NAME;), use the following command:
-   ::
+   &DISTRO; Release (&DISTRO_NAME;), use the following command::
 
       $ git checkout -b &DISTRO_NAME_NO_CAP; origin/&DISTRO_NAME_NO_CAP;
       Branch &DISTRO_NAME_NO_CAP; set up to track remote branch &DISTRO_NAME_NO_CAP; from origin.
@@ -839,8 +832,7 @@ and then specifically check out that development branch.
 
    The following command displays the branches that are now part of your
    local poky repository. The asterisk character indicates the branch
-   that is currently checked out for work:
-   ::
+   that is currently checked out for work::
 
       $ git branch
         master
@@ -867,14 +859,12 @@ similar to checking out by branch name except you use tag names.
    section.
 
 2. *Fetch the Tag Names:* To checkout the branch based on a tag name,
-   you need to fetch the upstream tags into your local repository:
-   ::
+   you need to fetch the upstream tags into your local repository::
 
       $ git fetch --tags
       $
 
-3. *List the Tag Names:* You can list the tag names now:
-   ::
+3. *List the Tag Names:* You can list the tag names now::
 
       $ git tag
       1.1_M1.final
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index fb6dfca85f..b0d03851b3 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -67,8 +67,7 @@ to indicate the branch.
 .. note::
 
    You can use the ``KBRANCH`` value to define an alternate branch typically
-   with a machine override as shown here from the ``meta-yocto-bsp`` layer:
-   ::
+   with a machine override as shown here from the ``meta-yocto-bsp`` layer::
 
            KBRANCH_edgerouter = "standard/edgerouter"
 
@@ -106,15 +105,13 @@ You can use the
 variable to include features (configuration fragments, patches, or both)
 that are not already included by the ``KMACHINE`` and
 ``LINUX_KERNEL_TYPE`` variable combination. For example, to include a
-feature specified as "features/netfilter/netfilter.scc", specify:
-::
+feature specified as "features/netfilter/netfilter.scc", specify::
 
    KERNEL_FEATURES += "features/netfilter/netfilter.scc"
 
 To include a
 feature called "cfg/sound.scc" just for the ``qemux86`` machine,
-specify:
-::
+specify::
 
    KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
 
@@ -157,8 +154,7 @@ types to form the final description of what will be assembled and built.
 While the kernel Metadata syntax does not enforce any logical separation
 of configuration fragments, patches, features or kernel types, best
 practices dictate a logical separation of these types of Metadata. The
-following Metadata file hierarchy is recommended:
-::
+following Metadata file hierarchy is recommended::
 
    base/
       bsp/
@@ -222,8 +218,7 @@ used with the ``linux-yocto-4.12`` kernel as defined outside of the
 recipe space (i.e. ``yocto-kernel-cache``). This Metadata consists of
 two files: ``smp.scc`` and ``smp.cfg``. You can find these files in the
 ``cfg`` directory of the ``yocto-4.12`` branch in the
-``yocto-kernel-cache`` Git repository:
-::
+``yocto-kernel-cache`` Git repository::
 
    cfg/smp.scc:
       define KFEATURE_DESCRIPTION "Enable SMP for 32 bit builds"
@@ -265,8 +260,7 @@ non-hardware fragment.
 
 As described in the
 ":ref:`kernel-dev/common:validating configuration`" section, you can
-use the following BitBake command to audit your configuration:
-::
+use the following BitBake command to audit your configuration::
 
    $ bitbake linux-yocto -c kernel_configcheck -f
 
@@ -287,8 +281,7 @@ in the ``patches/build`` directory of the ``yocto-4.12`` branch in the
 ``yocto-kernel-cache`` Git repository.
 
 The following listings show the ``build.scc`` file and part of the
-``modpost-mask-trivial-warnings.patch`` file:
-::
+``modpost-mask-trivial-warnings.patch`` file::
 
    patches/build/build.scc:
       patch arm-serialize-build-targets.patch
@@ -334,8 +327,7 @@ Features
 
 Features are complex kernel Metadata types that consist of configuration
 fragments, patches, and possibly other feature description files. As an
-example, consider the following generic listing:
-::
+example, consider the following generic listing::
 
    features/myfeature.scc
       define KFEATURE_DESCRIPTION "Enable myfeature"
@@ -371,15 +363,13 @@ the ``linux-yocto_4.12.bb`` kernel recipe found in
 ``poky/meta/recipes-kernel/linux``, a
 :ref:`require <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>` directive
 includes the ``poky/meta/recipes-kernel/linux/linux-yocto.inc`` file,
-which has the following statement that defines the default kernel type:
-::
+which has the following statement that defines the default kernel type::
 
    LINUX_KERNEL_TYPE ??= "standard"
 
 Another example would be the real-time kernel (i.e.
 ``linux-yocto-rt_4.12.bb``). This kernel recipe directly sets the kernel
-type as follows:
-::
+type as follows::
 
    LINUX_KERNEL_TYPE = "preempt-rt"
 
@@ -412,8 +402,7 @@ for Linux Yocto kernels:
 For any given kernel type, the Metadata is defined by the ``.scc`` (e.g.
 ``standard.scc``). Here is a partial listing for the ``standard.scc``
 file, which is found in the ``ktypes/standard`` directory of the
-``yocto-kernel-cache`` Git repository:
-::
+``yocto-kernel-cache`` Git repository::
 
    # Include this kernel type fragment to get the standard features and
    # configuration values.
@@ -482,15 +471,13 @@ Description Overview
 For simplicity, consider the following root BSP layer description files
 for the BeagleBone board. These files employ both a structure and naming
 convention for consistency. The naming convention for the file is as
-follows:
-::
+follows::
 
    bsp_root_name-kernel_type.scc
 
 Here are some example root layer
 BSP filenames for the BeagleBone Board BSP, which is supported by the
-Yocto Project:
-::
+Yocto Project::
 
    beaglebone-standard.scc
    beaglebone-preempt-rt.scc
@@ -498,8 +485,7 @@ Yocto Project:
 Each file uses the root name (i.e "beaglebone") BSP name followed by the
 kernel type.
 
-Examine the ``beaglebone-standard.scc`` file:
-::
+Examine the ``beaglebone-standard.scc`` file::
 
    define KMACHINE beaglebone
    define KTYPE standard
@@ -533,8 +519,7 @@ description file match.
 
 To separate your kernel policy from your hardware configuration, you
 include a kernel type (``ktype``), such as "standard". In the previous
-example, this is done using the following:
-::
+example, this is done using the following::
 
    include ktypes/standard/standard.scc
 
@@ -544,13 +529,11 @@ policy. See the ":ref:`kernel-dev/advanced:kernel types`" section for more
 information.
 
 To aggregate common configurations and features specific to the kernel
-for `mybsp`, use the following:
-::
+for `mybsp`, use the following::
 
    include mybsp.scc
 
-You can see that in the BeagleBone example with the following:
-::
+You can see that in the BeagleBone example with the following::
 
    include beaglebone.scc
 
@@ -558,15 +541,13 @@ For information on how to break a complete ``.config`` file into the various
 configuration fragments, see the ":ref:`kernel-dev/common:creating configuration fragments`" section.
 
 Finally, if you have any configurations specific to the hardware that
-are not in a ``*.scc`` file, you can include them as follows:
-::
+are not in a ``*.scc`` file, you can include them as follows::
 
    kconf hardware mybsp-extra.cfg
 
 The BeagleBone example does not include these
 types of configurations. However, the Malta 32-bit board does
-("mti-malta32"). Here is the ``mti-malta32-le-standard.scc`` file:
-::
+("mti-malta32"). Here is the ``mti-malta32-le-standard.scc`` file::
 
    define KMACHINE mti-malta32-le
    define KMACHINE qemumipsel
@@ -623,8 +604,7 @@ found on the machine. This ``minnow.scc`` description file is then
 included in each of the three "minnow" description files for the
 supported kernel types (i.e. "standard", "preempt-rt", and "tiny").
 Consider the "minnow" description for the "standard" kernel type (i.e.
-``minnow-standard.scc``):
-::
+``minnow-standard.scc``)::
 
    define KMACHINE minnow
    define KTYPE standard
@@ -656,8 +636,7 @@ that defines all enabled hardware for the BSP that is common to all
 kernel types. Using this command significantly reduces duplication.
 
 Now consider the "minnow" description for the "tiny" kernel type (i.e.
-``minnow-tiny.scc``):
-::
+``minnow-tiny.scc``)::
 
    define KMACHINE minnow
    define KTYPE tiny
@@ -720,8 +699,7 @@ See the ":ref:`kernel-dev/common:modifying an existing recipe`"
 section for more information.
 
 Here is an example that shows a trivial tree of kernel Metadata stored
-in recipe-space within a BSP layer:
-::
+in recipe-space within a BSP layer::
 
    meta-my_bsp_layer/
    `-- recipes-kernel
@@ -744,8 +722,7 @@ value when changing the content of files not explicitly listed in the
 
 If the BSP description is in recipe space, you cannot simply list the
 ``*.scc`` in the ``SRC_URI`` statement. You need to use the following
-form from your kernel append file:
-::
+form from your kernel append file::
 
    SRC_URI_append_myplatform = " \
        file://myplatform;type=kmeta;destsuffix=myplatform \
@@ -759,8 +736,7 @@ reside in a separate repository. The OpenEmbedded build system adds the
 Metadata to the build as a "type=kmeta" repository through the
 :term:`SRC_URI` variable. As an
 example, consider the following ``SRC_URI`` statement from the
-``linux-yocto_4.12.bb`` kernel recipe:
-::
+``linux-yocto_4.12.bb`` kernel recipe::
 
    SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
               git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
@@ -844,14 +820,12 @@ patches into a feature.
 
 Once you have a new branch, you can set up your kernel Metadata to use
 the branch a couple different ways. In the recipe, you can specify the
-new branch as the ``KBRANCH`` to use for the board as follows:
-::
+new branch as the ``KBRANCH`` to use for the board as follows::
 
    KBRANCH = "mynewbranch"
 
 Another method is to use the ``branch`` command in the BSP
-description:
-::
+description::
 
    mybsp.scc:
       define KMACHINE mybsp
@@ -865,15 +839,13 @@ description:
 
 If you find yourself with numerous branches, you might consider using a
 hierarchical branching system similar to what the Yocto Linux Kernel Git
-repositories use:
-::
+repositories use::
 
    common/kernel_type/machine
 
 If you had two kernel types, "standard" and "small" for instance, three
 machines, and common as ``mydir``, the branches in your Git repository
-might look like this:
-::
+might look like this::
 
    mydir/base
    mydir/standard/base
@@ -905,8 +877,7 @@ that have to be regularly updated. The Yocto Project Linux kernel tools
 provide for this with the ``git merge`` command.
 
 To merge a feature branch into a BSP, insert the ``git merge`` command
-after any ``branch`` commands:
-::
+after any ``branch`` commands::
 
    mybsp.scc:
       define KMACHINE mybsp
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 56217b9d38..3f35d8412f 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -54,8 +54,7 @@ section:
 
 1. *Initialize the BitBake Environment:* Before building an extensible
    SDK, you need to initialize the BitBake build environment by sourcing
-   the build environment script (i.e. :ref:`structure-core-script`):
-   ::
+   the build environment script (i.e. :ref:`structure-core-script`)::
 
       $ cd poky
       $ source oe-init-build-env
@@ -83,16 +82,14 @@ section:
 
    In this example we wish to build for qemux86 so we must set the
    ``MACHINE`` variable to "qemux86" and also add the "kernel-modules".
-   As described we do this by appending to ``conf/local.conf``:
-   ::
+   As described we do this by appending to ``conf/local.conf``::
 
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
 
 3. *Create a Layer for Patches:* You need to create a layer to hold
    patches created for the kernel image. You can use the
-   ``bitbake-layers create-layer`` command as follows:
-   ::
+   ``bitbake-layers create-layer`` command as follows::
 
       $ cd poky/build
       $ bitbake-layers create-layer ../../meta-mylayer
@@ -116,8 +113,7 @@ section:
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
    :term:`BBLAYERS` variable in the
-   ``bblayers.conf`` file as follows:
-   ::
+   ``bblayers.conf`` file as follows::
 
       $ cd poky/build
       $ bitbake-layers add-layer ../../meta-mylayer
@@ -125,16 +121,14 @@ section:
       $
 
 5. *Build the Extensible SDK:* Use BitBake to build the extensible SDK
-   specifically for use with images to be run using QEMU:
-   ::
+   specifically for use with images to be run using QEMU::
 
       $ cd poky/build
       $ bitbake core-image-minimal -c populate_sdk_ext
 
    Once
    the build finishes, you can find the SDK installer file (i.e.
-   ``*.sh`` file) in the following directory:
-   ::
+   ``*.sh`` file) in the following directory::
 
       poky/build/tmp/deploy/sdk
 
@@ -143,8 +137,7 @@ section:
 
 6. *Install the Extensible SDK:* Use the following command to install
    the SDK. For this example, install the SDK in the default
-   ``poky_sdk`` directory:
-   ::
+   ``poky_sdk`` directory::
 
       $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-minimal-i586-toolchain-ext-&DISTRO;.sh
@@ -172,8 +165,7 @@ section:
    BitBake shell used to build the installer.
 
    After opening a new shell, run the SDK environment setup script as
-   directed by the output from installing the SDK:
-   ::
+   directed by the output from installing the SDK::
 
       $ source poky_sdk/environment-setup-i586-poky-linux
       "SDK environment now set up; additionally you may now run devtool to perform development tasks.
@@ -186,8 +178,7 @@ section:
 
 8. *Build the Clean Image:* The final step in preparing to work on the
    kernel is to build an initial image using ``devtool`` in the new
-   terminal you just set up and initialized for SDK work:
-   ::
+   terminal you just set up and initialized for SDK work::
 
       $ devtool build-image
       Parsing recipes: 100% |##########################################| Time: 0:00:05
@@ -269,16 +260,14 @@ section:
 
    In this example we wish to build for qemux86 so we must set the
    ``MACHINE`` variable to "qemux86" and also add the "kernel-modules".
-   As described we do this by appending to ``conf/local.conf``:
-   ::
+   As described we do this by appending to ``conf/local.conf``::
 
       MACHINE = "qemux86"
       MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-modules"
 
 3. *Create a Layer for Patches:* You need to create a layer to hold
    patches created for the kernel image. You can use the
-   ``bitbake-layers create-layer`` command as follows:
-   ::
+   ``bitbake-layers create-layer`` command as follows::
 
       $ cd poky/build
       $ bitbake-layers create-layer ../../meta-mylayer
@@ -301,8 +290,7 @@ section:
 4. *Inform the BitBake Build Environment About Your Layer:* As directed
    when you created your layer, you need to add the layer to the
    :term:`BBLAYERS` variable in the
-   ``bblayers.conf`` file as follows:
-   ::
+   ``bblayers.conf`` file as follows::
 
       $ cd poky/build
       $ bitbake-layers add-layer ../../meta-mylayer
@@ -350,8 +338,7 @@ section:
    the ``yocto-4.12`` branch.
 
    The following commands show how to create a local copy of the
-   ``yocto-kernel-cache`` and be in the ``yocto-4.12`` branch:
-   ::
+   ``yocto-kernel-cache`` and be in the ``yocto-4.12`` branch::
 
       $ cd ~
       $ git clone git://git.yoctoproject.org/yocto-kernel-cache --branch yocto-4.12
@@ -394,8 +381,7 @@ following section describes how to create a layer without the aid of
 tools. These steps assume creation of a layer named ``mylayer`` in your
 home directory:
 
-1. *Create Structure*: Create the layer's structure:
-   ::
+1. *Create Structure*: Create the layer's structure::
 
       $ mkdir meta-mylayer
       $ mkdir meta-mylayer/conf
@@ -409,8 +395,7 @@ home directory:
 
 2. *Create the Layer Configuration File*: Move to the
    ``meta-mylayer/conf`` directory and create the ``layer.conf`` file as
-   follows:
-   ::
+   follows::
 
       # We have a conf and classes directory, add to BBPATH
       BBPATH .= ":${LAYERDIR}"
@@ -429,8 +414,7 @@ home directory:
    ``meta-mylayer/recipes-kernel/linux`` directory and create the
    kernel's append file. This example uses the ``linux-yocto-4.12``
    kernel. Thus, the name of the append file is
-   ``linux-yocto_4.12.bbappend``:
-   ::
+   ``linux-yocto_4.12.bbappend``::
 
       FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -483,8 +467,7 @@ The append file should initially extend the
 :term:`FILESPATH` search path by
 prepending the directory that contains your files to the
 :term:`FILESEXTRAPATHS`
-variable as follows:
-::
+variable as follows::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -492,8 +475,7 @@ The path ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``
 expands to "linux-yocto" in the current directory for this example. If
 you add any new files that modify the kernel recipe and you have
 extended ``FILESPATH`` as described above, you must place the files in
-your layer in the following area:
-::
+your layer in the following area::
 
    your-layer/recipes-kernel/linux/linux-yocto/
 
@@ -582,8 +564,7 @@ To group related configurations into multiple files, you perform a
 similar procedure. Here is an example that groups separate
 configurations specifically for Ethernet and graphics into their own
 files and adds the configurations by using a ``SRC_URI`` statement like
-the following in your append file:
-::
+the following in your append file::
 
    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -627,8 +608,7 @@ reference them in :term:`SRC_URI`
 statements.
 
 For example, you can apply a three-patch series by adding the following
-lines to your linux-yocto ``.bbappend`` file in your layer:
-::
+lines to your linux-yocto ``.bbappend`` file in your layer::
 
    SRC_URI += "file://0001-first-change.patch"
    SRC_URI += "file://0002-second-change.patch"
@@ -658,8 +638,7 @@ If you have a complete, working Linux kernel ``.config`` file you want
 to use for the configuration, as before, copy that file to the
 appropriate ``${PN}`` directory in your layer's ``recipes-kernel/linux``
 directory, and rename the copied file to "defconfig". Then, add the
-following lines to the linux-yocto ``.bbappend`` file in your layer:
-::
+following lines to the linux-yocto ``.bbappend`` file in your layer::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
@@ -685,8 +664,7 @@ Generally speaking, the preferred approach is to determine the
 incremental change you want to make and add that as a configuration
 fragment. For example, if you want to add support for a basic serial
 console, create a file named ``8250.cfg`` in the ``${PN}`` directory
-with the following content (without indentation):
-::
+with the following content (without indentation)::
 
    CONFIG_SERIAL_8250=y
    CONFIG_SERIAL_8250_CONSOLE=y
@@ -698,8 +676,7 @@ with the following content (without indentation):
 
 Next, include this
 configuration fragment and extend the ``FILESPATH`` variable in your
-``.bbappend`` file:
-::
+``.bbappend`` file::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://8250.cfg"
@@ -718,8 +695,7 @@ It might be desirable to have kernel configuration fragment support
 through a ``defconfig`` file that is pulled from the kernel source tree
 for the configured machine. By default, the OpenEmbedded build system
 looks for ``defconfig`` files in the layer used for Metadata, which is
-"out-of-tree", and then configures them using the following:
-::
+"out-of-tree", and then configures them using the following::
 
    SRC_URI += "file://defconfig"
 
@@ -732,16 +708,14 @@ append files, you can direct the OpenEmbedded build system to use a
 ``defconfig`` file that is "in-tree".
 
 To specify an "in-tree" ``defconfig`` file, use the following statement
-form:
-::
+form::
 
    KBUILD_DEFCONFIG_KMACHINE ?= "defconfig_file"
 
 Here is an example
 that assigns the ``KBUILD_DEFCONFIG`` variable based on "raspberrypi2"
 and provides the path to the "in-tree" ``defconfig`` file to be used for
-a Raspberry Pi 2, which is based on the Broadcom 2708/2709 chipset:
-::
+a Raspberry Pi 2, which is based on the Broadcom 2708/2709 chipset::
 
    KBUILD_DEFCONFIG_raspberrypi2 ?= "bcm2709_defconfig"
 
@@ -792,8 +766,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``"
       section for more information.
 
-   Use the following ``devtool`` command to check out the code:
-   ::
+   Use the following ``devtool`` command to check out the code::
 
       $ devtool modify linux-yocto
 
@@ -819,14 +792,12 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
       noted where you can find the source files (e.g.
       ``poky_sdk/workspace/sources/linux-yocto``). Change to where the
       kernel source code is before making your edits to the
-      ``calibrate.c`` file:
-      ::
+      ``calibrate.c`` file::
 
          $ cd poky_sdk/workspace/sources/linux-yocto
 
    2. *Edit the source file*: Edit the ``init/calibrate.c`` file to have
-      the following changes:
-      ::
+      the following changes::
 
          void calibrate_delay(void)
          {
@@ -846,8 +817,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
                    .
 
 3. *Build the Updated Kernel Source:* To build the updated kernel
-   source, use ``devtool``:
-   ::
+   source, use ``devtool``::
 
       $ devtool build linux-yocto
 
@@ -872,8 +842,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    using QEMU to verify your changes:
 
    1. *Boot the image*: Boot the modified image in the QEMU emulator
-      using this command:
-      ::
+      using this command::
 
          $ runqemu qemux86
 
@@ -891,8 +860,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
 
 6. *Stage and commit your changes*: Within your eSDK terminal, change
    your working directory to where you modified the ``calibrate.c`` file
-   and use these Git commands to stage and commit your changes:
-   ::
+   and use these Git commands to stage and commit your changes::
 
       $ cd poky_sdk/workspace/sources/linux-yocto
       $ git status
@@ -921,8 +889,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using \`\`devtool\`\``" Se
    image that includes your kernel patches. Execute the following
    command from your
    :term:`Build Directory` in the terminal
-   set up to run BitBake:
-   ::
+   set up to run BitBake::
 
       $ cd poky/build
       $ bitbake core-image-minimal
@@ -966,14 +933,12 @@ Section.
    1. *Change the working directory*: You need to locate the source
       files in the local copy of the kernel Git repository. Change to
       where the kernel source code is before making your edits to the
-      ``calibrate.c`` file:
-      ::
+      ``calibrate.c`` file::
 
          $ cd ~/linux-yocto-4.12/init
 
    2. *Edit the source file*: Edit the ``calibrate.c`` file to have the
-      following changes:
-      ::
+      following changes::
 
          void calibrate_delay(void)
          {
@@ -993,8 +958,7 @@ Section.
                    .
 
 2. *Stage and Commit Your Changes:* Use standard Git commands to stage
-   and commit the changes you just made:
-   ::
+   and commit the changes you just made::
 
       $ git add calibrate.c
       $ git commit -m "calibrate.c - Added some printk statements"
@@ -1009,13 +973,11 @@ Section.
    updated kernel source files. Add
    :term:`SRC_URI` and
    :term:`SRCREV` statements similar
-   to the following to your ``local.conf``:
-   ::
+   to the following to your ``local.conf``::
 
       $ cd poky/build/conf
 
-   Add the following to the ``local.conf``:
-   ::
+   Add the following to the ``local.conf``::
 
       SRC_URI_pn-linux-yocto = "git:///path-to/linux-yocto-4.12;protocol=file;name=machine;branch=standard/base; \
                                 git:///path-to/yocto-kernel-cache;protocol=file;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
@@ -1031,16 +993,14 @@ Section.
 
 4. *Build the Image:* With the source modified, your changes staged and
    committed, and the ``local.conf`` file pointing to the kernel files,
-   you can now use BitBake to build the image:
-   ::
+   you can now use BitBake to build the image::
 
       $ cd poky/build
       $ bitbake core-image-minimal
 
 5. *Boot the image*: Boot the modified image in the QEMU emulator using
    this command. When prompted to login to the QEMU console, use "root"
-   with no password:
-   ::
+   with no password::
 
       $ cd poky/build
       $ runqemu qemux86
@@ -1059,8 +1019,7 @@ Section.
 
 7. *Generate the Patch File:* Once you are sure that your patch works
    correctly, you can generate a ``*.patch`` file in the kernel source
-   repository:
-   ::
+   repository::
 
       $ cd ~/linux-yocto-4.12/init
       $ git format-patch -1
@@ -1073,8 +1032,7 @@ Section.
    ``meta-mylayer``. When the layer was created using the
    ``yocto-create`` script, no additional hierarchy was created to
    support patches. Before moving the patch file, you need to add
-   additional structure to your layer using the following commands:
-   ::
+   additional structure to your layer using the following commands::
 
       $ cd ~/meta-mylayer
       $ mkdir recipes-kernel
@@ -1083,8 +1041,7 @@ Section.
 
    Once you have created this
    hierarchy in your layer, you can move the patch file using the
-   following command:
-   ::
+   following command::
 
       $ mv ~/linux-yocto-4.12/init/0001-calibrate.c-Added-some-printk-statements.patch ~/meta-mylayer/recipes-kernel/linux/linux-yocto
 
@@ -1093,8 +1050,7 @@ Section.
    the OpenEmbedded build system to find the patch. The append file
    needs to be in your layer's ``recipes-kernel/linux`` directory and it
    must be named ``linux-yocto_4.12.bbappend`` and have the following
-   contents:
-   ::
+   contents::
 
       FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
       SRC_URI_append = "file://0001-calibrate.c-Added-some-printk-statements.patch"
@@ -1113,8 +1069,7 @@ Section.
       To build ``core-image-minimal`` again and see the effects of your patch,
       you can essentially eliminate the temporary source files saved in
       ``poky/build/tmp/work/...`` and residual effects of the build by entering
-      the following sequence of commands:
-      ::
+      the following sequence of commands::
 
               $ cd poky/build
               $ bitbake -c cleanall yocto-linux
@@ -1160,8 +1115,7 @@ environment, you must do the following:
 -  You must be sure of the state of your build's configuration in the
    :term:`Source Directory`.
 
--  Your build host must have the following two packages installed:
-   ::
+-  Your build host must have the following two packages installed::
 
       libncurses5-dev
       libtinfo-dev
@@ -1169,8 +1123,7 @@ environment, you must do the following:
 The following commands initialize the BitBake environment, run the
 :ref:`ref-tasks-kernel_configme`
 task, and launch ``menuconfig``. These commands assume the Source
-Directory's top-level folder is ``poky``:
-::
+Directory's top-level folder is ``poky``::
 
    $ cd poky
    $ source oe-init-build-env
@@ -1232,8 +1185,7 @@ the ``.config`` file would be:
 
 Within the ``.config`` file, you can see the kernel settings. For
 example, the following entry shows that symmetric multi-processor
-support is not set:
-::
+support is not set::
 
    # CONFIG_SMP is not set
 
@@ -1274,8 +1226,7 @@ your layer's ``recipes-kernel/linux`` directory, and rename the copied
 file to "defconfig" (e.g.
 ``~/meta-mylayer/recipes-kernel/linux/linux-yocto/defconfig``). Then,
 add the following lines to the linux-yocto ``.bbappend`` file in your
-layer:
-::
+layer::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
@@ -1323,8 +1274,7 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 It is simple to create a configuration fragment. One method is to use
 shell commands. For example, issuing the following from the shell
 creates a configuration fragment file named ``my_smp.cfg`` that enables
-multi-processor support within the kernel:
-::
+multi-processor support within the kernel::
 
    $ echo "CONFIG_SMP=y" >> my_smp.cfg
 
@@ -1342,8 +1292,7 @@ To create a configuration fragment using this method, follow these
 steps:
 
 1. *Complete a Build Through Kernel Configuration:* Complete a build at
-   least through the kernel configuration task as follows:
-   ::
+   least through the kernel configuration task as follows::
 
       $ bitbake linux-yocto -c kernel_configme -f
 
@@ -1352,8 +1301,7 @@ steps:
    your build state might become unknown, it is best to run this task
    prior to starting ``menuconfig``.
 
-2. *Launch menuconfig:* Run the ``menuconfig`` command:
-   ::
+2. *Launch menuconfig:* Run the ``menuconfig`` command::
 
       $ bitbake linux-yocto -c menuconfig
 
@@ -1361,8 +1309,7 @@ steps:
    to prepare a configuration fragment. The resulting file
    ``fragment.cfg`` is placed in the
    ``${``\ :term:`WORKDIR`\ ``}``
-   directory:
-   ::
+   directory::
 
       $ bitbake linux-yocto -c diffconfig
 
@@ -1387,8 +1334,7 @@ options in a file called ``myconfig.cfg``. If you put that file inside a
 directory named ``linux-yocto`` that resides in the same directory as
 the kernel's append file within your layer and then add the following
 statements to the kernel's append file, those configuration options will
-be picked up and applied when the kernel is built:
-::
+be picked up and applied when the kernel is built::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://myconfig.cfg"
@@ -1397,8 +1343,7 @@ As mentioned earlier, you can group related configurations into multiple
 files and name them all in the ``SRC_URI`` statement as well. For
 example, you could group separate configurations specifically for
 Ethernet and graphics into their own files and add those by using a
-``SRC_URI`` statement like the following in your append file:
-::
+``SRC_URI`` statement like the following in your append file::
 
    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -1409,8 +1354,7 @@ Validating Configuration
 
 You can use the
 :ref:`ref-tasks-kernel_configcheck`
-task to provide configuration validation:
-::
+task to provide configuration validation::
 
    $ bitbake linux-yocto -c kernel_configcheck -f
 
@@ -1537,8 +1481,7 @@ To streamline the configuration, do the following:
    successfully. Use this configuration file as your baseline.
 
 2. *Run Configure and Check Tasks:* Separately run the
-   ``do_kernel_configme`` and ``do_kernel_configcheck`` tasks:
-   ::
+   ``do_kernel_configme`` and ``do_kernel_configcheck`` tasks::
 
       $ bitbake linux-yocto -c kernel_configme -f
       $ bitbake linux-yocto -c kernel_configcheck -f
@@ -1572,8 +1515,7 @@ Expanding Variables
 Sometimes it is helpful to determine what a variable expands to during a
 build. You can examine the values of variables by examining the
 output of the ``bitbake -e`` command. The output is long and is more
-easily managed in a text file, which allows for easy searches:
-::
+easily managed in a text file, which allows for easy searches::
 
    $ bitbake -e virtual/kernel > some_text_file
 
@@ -1590,15 +1532,13 @@ source directory. Follow these steps to clean up the version string:
 
 1. *Discover the Uncommitted Changes:* Go to the kernel's locally cloned
    Git repository (source directory) and use the following Git command
-   to list the files that have been changed, added, or removed:
-   ::
+   to list the files that have been changed, added, or removed::
 
       $ git status
 
 2. *Commit the Changes:* You should commit those changes to the kernel
    source tree regardless of whether or not you will save, export, or
-   use the changes:
-   ::
+   use the changes::
 
       $ git add
       $ git commit -s -a -m "getting rid of -dirty"
@@ -1633,8 +1573,7 @@ linux-yocto custom recipe (``linux-yocto-custom.bb``) that uses
 ``kernel.org`` sources and the Yocto Project Linux kernel tools for
 managing kernel Metadata. You can find this recipe in the ``poky`` Git
 repository of the Yocto Project :yocto_git:`Source Repository <>`
-at:
-::
+at::
 
    poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
 
@@ -1655,8 +1594,7 @@ Here are some basic steps you can use to work with your own sources:
    ``defconfig`` file or configuration fragment files in your layer.
    When you use the ``linux-yocto-custom.bb`` recipe, you must specify a
    configuration. If you do not have a ``defconfig`` file, you can run
-   the following:
-   ::
+   the following::
 
       $ make defconfig
 
@@ -1708,8 +1646,7 @@ Here are some basic steps you can use to work with your own sources:
       ``LINUX_VERSION`` with the Source Control Manager (SCM) revision
       as derived from the :term:`SRCPV`
       variable. The combined results are a string with the following
-      form:
-      ::
+      form::
 
          3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8d2022b9852c60d32f0d770931e3cf343e2
 
@@ -1723,8 +1660,7 @@ Here are some basic steps you can use to work with your own sources:
       triggers an explicit build failure. You must change it to match a
       list of the machines that your new recipe supports. For example,
       to support the ``qemux86`` and ``qemux86-64`` machines, use the
-      following form:
-      ::
+      following form::
 
          COMPATIBLE_MACHINE = "qemux86|qemux86-64"
 
@@ -1807,8 +1743,7 @@ Typically, you will need to set the following variables:
 
 Depending on the build system used by the module sources, you might need
 to make some adjustments. For example, a typical module ``Makefile``
-looks much like the one provided with the ``hello-mod`` template:
-::
+looks much like the one provided with the ``hello-mod`` template::
 
    obj-m := hello.o
 
@@ -1845,8 +1780,7 @@ them appropriately for your machine configuration file:
 -  :term:`MACHINE_EXTRA_RRECOMMENDS`
 
 Modules are often not required for boot and can be excluded from certain
-build configurations. The following allows for the most flexibility:
-::
+build configurations. The following allows for the most flexibility::
 
    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-mymodule"
 
@@ -1895,26 +1829,22 @@ branch.
 
    $ git whatchanged origin/standard/base..origin/standard/emenlow
 
-To see short, one line summaries of changes use the ``git log`` command:
-::
+To see short, one line summaries of changes use the ``git log`` command::
 
    $ git log --oneline origin/standard/base..origin/standard/emenlow
 
-Use this command to see code differences for the changes:
-::
+Use this command to see code differences for the changes::
 
    $ git diff origin/standard/base..origin/standard/emenlow
 
 Use this command to see the commit log messages and the text
-differences:
-::
+differences::
 
    $ git show origin/standard/base..origin/standard/emenlow
 
 Use this command to create individual patches for each change. Here is
 an example that creates patch files for each commit and places them
-in your ``Documents`` directory:
-::
+in your ``Documents`` directory::
 
    $ git format-patch -o $HOME/Documents origin/standard/base..origin/standard/emenlow
 
@@ -1923,15 +1853,13 @@ Showing a Particular Feature or Branch Change
 
 Tags in the Yocto Project kernel tree divide changes for significant
 features or branches. The ``git show`` tag command shows changes based
-on a tag. Here is an example that shows ``systemtap`` changes:
-::
+on a tag. Here is an example that shows ``systemtap`` changes::
 
    $ git show systemtap
 
 You can use the ``git branch --contains`` tag command to
 show the branches that contain a particular feature. This command shows
-the branches that contain the ``systemtap`` feature:
-::
+the branches that contain the ``systemtap`` feature::
 
    $ git branch --contains systemtap
 
@@ -1986,8 +1914,7 @@ build.
          searched during the build as potential feature directories.
 
    Continuing with the example, suppose the "test.scc" feature you are
-   adding has a ``test.scc`` file in the following directory:
-   ::
+   adding has a ``test.scc`` file in the following directory::
 
       my_recipe
       |
@@ -2001,8 +1928,7 @@ build.
    a similarly named configuration fragment file ``test.cfg``.
 
 2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
-   recipe's ``SRC_URI`` statement:
-   ::
+   recipe's ``SRC_URI`` statement::
 
       SRC_URI_append = " file://test.scc"
 
@@ -2011,8 +1937,7 @@ build.
 
 3. *Specify the Feature as a Kernel Feature:* Use the
    ``KERNEL_FEATURES`` statement to specify the feature as a kernel
-   feature:
-   ::
+   feature::
 
       KERNEL_FEATURES_append = " test.scc"
 
diff --git a/documentation/kernel-dev/concepts-appx.rst b/documentation/kernel-dev/concepts-appx.rst
index 4b6dbe5ef9..63e67315fa 100644
--- a/documentation/kernel-dev/concepts-appx.rst
+++ b/documentation/kernel-dev/concepts-appx.rst
@@ -359,8 +359,7 @@ To determine whether or not a given option is "hardware" or
 "non-hardware", the kernel Metadata in ``yocto-kernel-cache`` contains
 files that classify individual or groups of options as either hardware
 or non-hardware. To better show this, consider a situation where the
-``yocto-kernel-cache`` contains the following files:
-::
+``yocto-kernel-cache`` contains the following files::
 
    yocto-kernel-cache/features/drm-psb/hardware.cfg
    yocto-kernel-cache/features/kgdb/hardware.cfg
@@ -400,8 +399,7 @@ provides explanations for the various files:
    (i.e. ``hardware.kcf`` or ``non-hardware.kcf``).
 
 Here is a specific example using the
-``kernel-cache/bsp/mti-malta32/hardware.cfg``:
-::
+``kernel-cache/bsp/mti-malta32/hardware.cfg``::
 
    CONFIG_SERIAL_8250
    CONFIG_SERIAL_8250_CONSOLE
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index c2106f81e1..8169511445 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -57,8 +57,7 @@ These other variables are useful for installing specific modules:
 
 For example, set the following in the ``qemux86.conf`` file to include
 the ``ab123`` kernel modules with images built for the ``qemux86``
-machine:
-::
+machine::
 
    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-ab123"
 
@@ -71,8 +70,7 @@ How do I change the Linux kernel command line?
 The Linux kernel command line is
 typically specified in the machine config using the ``APPEND`` variable.
 For example, you can add some helpful debug information doing the
-following:
-::
+following::
 
    APPEND += "printk.time=y initcall_debug debug"
 
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index 44c43893e2..f84ab6e239 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -28,8 +28,7 @@ in the Yocto Project Linux kernel in any clone of the Yocto Project
 Linux kernel source repository and ``yocto-kernel-cache`` Git trees. For
 example, the following commands clone the Yocto Project baseline Linux
 kernel that branches off ``linux.org`` version 4.12 and the
-``yocto-kernel-cache``, which contains stores of kernel Metadata:
-::
+``yocto-kernel-cache``, which contains stores of kernel Metadata::
 
    $ git clone git://git.yoctoproject.org/linux-yocto-4.12
    $ git clone git://git.yoctoproject.org/linux-kernel-cache
@@ -42,16 +41,14 @@ section.
 
 Once you have cloned the kernel Git repository and the cache of Metadata
 on your local machine, you can discover the branches that are available
-in the repository using the following Git command:
-::
+in the repository using the following Git command::
 
    $ git branch -a
 
 Checking out a branch allows you to work with a particular Yocto Linux
 kernel. For example, the following commands check out the
 "standard/beagleboard" branch of the Yocto Linux kernel repository and
-the "yocto-4.12" branch of the ``yocto-kernel-cache`` repository:
-::
+the "yocto-4.12" branch of the ``yocto-kernel-cache`` repository::
 
    $ cd ~/linux-yocto-4.12
    $ git checkout -b my-kernel-4.12 remotes/origin/standard/beagleboard
@@ -111,8 +108,7 @@ patch, or BSP:
 
    For a typical build, the target of the search is a feature
    description in an ``.scc`` file whose name follows this format (e.g.
-   ``beaglebone-standard.scc`` and ``beaglebone-preempt-rt.scc``):
-   ::
+   ``beaglebone-standard.scc`` and ``beaglebone-preempt-rt.scc``)::
 
       bsp_root_name-kernel_type.scc
 
@@ -222,8 +218,7 @@ build process generates a build tree that is separate from your kernel's
 local Git source repository tree. This build tree has a name that uses
 the following form, where ``${MACHINE}`` is the metadata name of the
 machine (BSP) and "kernel_type" is one of the Yocto Project supported
-kernel types (e.g. "standard"):
-::
+kernel types (e.g. "standard")::
 
    linux-${MACHINE}-kernel_type-build
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ada5143b2a..2e3f1af442 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -55,8 +55,7 @@ This section briefly introduces BitBake. If you want more information on
 BitBake, see the :doc:`BitBake User Manual <bitbake:index>`.
 
 To see a list of the options BitBake supports, use either of the
-following commands:
-::
+following commands::
 
    $ bitbake -h
    $ bitbake --help
@@ -66,8 +65,7 @@ The most common usage for BitBake is ``bitbake recipename``, where
 to as the "target"). The target often equates to the first part of a
 recipe's filename (e.g. "foo" for a recipe named ``foo_1.3.0-r0.bb``).
 So, to process the ``matchbox-desktop_1.2.3.bb`` recipe file, you might
-type the following:
-::
+type the following::
 
    $ bitbake matchbox-desktop
 
@@ -1068,15 +1066,13 @@ the image. The formats used for the root filesystem depend on the
 support compression.
 
 As an example, a dynamically created task when creating a particular
-image type would take the following form:
-::
+image type would take the following form::
 
    do_image_type
 
 So, if the type
 as specified by the ``IMAGE_FSTYPES`` were ``ext4``, the dynamically
-generated task would be as follows:
-::
+generated task would be as follows::
 
    do_image_ext4
 
@@ -1478,8 +1474,7 @@ cross-compiler that is used internally within BitBake only.
    gcc-cross
    .
 
-The chain of events that occurs when the standard toolchain is bootstrapped:
-::
+The chain of events that occurs when the standard toolchain is bootstrapped::
 
    binutils-cross -> linux-libc-headers -> gcc-cross -> libgcc-initial -> glibc -> libgcc -> gcc-runtime
 
@@ -1528,8 +1523,7 @@ might not be the same machine as the Build Host.
    can take advantage of pre-built images that ship with the Yocto
    Project and already contain cross-development toolchain installers.
 
-Here is the bootstrap process for the relocatable toolchain:
-::
+Here is the bootstrap process for the relocatable toolchain::
 
    gcc -> binutils-crosssdk -> gcc-crosssdk-initial -> linux-libc-headers -> glibc-initial -> nativesdk-glibc -> gcc-crosssdk -> gcc-cross-canadian
 
@@ -1703,8 +1697,7 @@ to the task.
 
 Like the ``WORKDIR`` case, situations exist where dependencies should be
 ignored. For these situations, you can instruct the build process to
-ignore a dependency by using a line like the following:
-::
+ignore a dependency by using a line like the following::
 
    PACKAGE_ARCHS[vardepsexclude] = "MACHINE"
 
@@ -1714,8 +1707,7 @@ reference it.
 
 Equally, there are cases where you need to add dependencies BitBake is
 not able to find. You can accomplish this by using a line like the
-following:
-::
+following::
 
    PACKAGE_ARCHS[vardeps] = "MACHINE"
 
@@ -1745,8 +1737,7 @@ and the dependent task hashes can be influenced. Within the BitBake
 configuration file, you can give BitBake some extra information to help
 it construct the basehash. The following statement effectively results
 in a list of global variable dependency excludes (i.e. variables never
-included in any checksum):
-::
+included in any checksum)::
 
    BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \\
        SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \\
@@ -1771,8 +1762,7 @@ desired. This file defines the two basic signature generators
 "OEBasicHash". By default, a dummy "noop" signature handler is enabled
 in BitBake. This means that behavior is unchanged from previous
 versions. OE-Core uses the "OEBasicHash" signature handler by default
-through this setting in the ``bitbake.conf`` file:
-::
+through this setting in the ``bitbake.conf`` file::
 
    BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 
@@ -1826,8 +1816,7 @@ The Yocto Project team has tried to keep the details of the
 implementation hidden in ``sstate`` class. From a user's perspective,
 adding shared state wrapping to a task is as simple as this
 :ref:`ref-tasks-deploy` example taken
-from the :ref:`deploy <ref-classes-deploy>` class:
-::
+from the :ref:`deploy <ref-classes-deploy>` class::
 
    DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
    SSTATETASKS += "do_deploy"
@@ -1871,8 +1860,7 @@ The following list explains the previous example:
       instead, skipping the ``do_deploy`` task.
 
 -  The following task definition is glue logic needed to make the
-   previous settings effective:
-   ::
+   previous settings effective::
 
       python do_deploy_setscene () {
           sstate_setscene(d)
@@ -1898,8 +1886,7 @@ The following list explains the previous example:
       In cases where ``sstate-inputdirs`` and ``sstate-outputdirs`` would be
       the same, you can use ``sstate-plaindirs``. For example, to preserve the
       ${:term:`PKGD`} and ${:term:`PKGDEST`} output from the ``do_package``
-      task, use the following:
-      ::
+      task, use the following::
 
               do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
 
@@ -1917,24 +1904,21 @@ The following list explains the previous example:
    multiple directories. For example, the following declares
    ``PKGDESTWORK`` and ``SHLIBWORK`` as shared state input directories,
    which populates the shared state cache, and ``PKGDATA_DIR`` and
-   ``SHLIBSDIR`` as the corresponding shared state output directories:
-   ::
+   ``SHLIBSDIR`` as the corresponding shared state output directories::
 
       do_package[sstate-inputdirs] = "${PKGDESTWORK} ${SHLIBSWORKDIR}"
       do_package[sstate-outputdirs] = "${PKGDATA_DIR} ${SHLIBSDIR}"
 
 -  These methods also include the ability to take a lockfile when
    manipulating shared state directory structures, for cases where file
-   additions or removals are sensitive:
-   ::
+   additions or removals are sensitive::
 
       do_package[sstate-lockfile] = "${PACKAGELOCK}"
 
 Behind the scenes, the shared state code works by looking in
 :term:`SSTATE_DIR` and
 :term:`SSTATE_MIRRORS` for
-shared state files. Here is an example:
-::
+shared state files. Here is an example::
 
    SSTATE_MIRRORS ?= "\
        file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
@@ -2116,8 +2100,7 @@ accomplished using fakeroot.
    under fakeroot. Otherwise, the task cannot run root-only operations,
    and cannot see the fake file ownership and permissions set by the
    other task. You need to also add a dependency on
-   ``virtual/fakeroot-native:do_populate_sysroot``, giving the following:
-   ::
+   ``virtual/fakeroot-native:do_populate_sysroot``, giving the following::
 
       fakeroot do_mytask () {
           ...
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index a33f89e4fa..1decf01e43 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -430,8 +430,7 @@ local working area (also called a branch) that tracks a specific
 development branch from the upstream source Git repository. in other
 words, you can define your local Git environment to work on any
 development branch in the repository. To help illustrate, consider the
-following example Git commands:
-::
+following example Git commands::
 
    $ cd ~
    $ git clone git://git.yoctoproject.org/poky
@@ -476,8 +475,7 @@ create and checkout a local working Git branch based on a tag name. When
 you do this, you get a snapshot of the Git repository that reflects the
 state of the files when the change was made associated with that tag.
 The most common use is to checkout a working branch that matches a
-specific Yocto Project release. Here is an example:
-::
+specific Yocto Project release. Here is an example::
 
    $ cd ~
    $ git clone git://git.yoctoproject.org/poky
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 52a50faf67..9a1fc2c93f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -168,8 +168,7 @@ example use for this class.
    the "subpath" parameter limits the checkout to a specific subpath
    of the tree. Here is an example where ``${BP}`` is used so that the files
    are extracted into the subdirectory expected by the default value of
-   ``S``:
-   ::
+   ``S``::
 
            SRC_URI = "git://example.com/downloads/somepackage.rpm;subpath=${BP}"
 
@@ -221,8 +220,7 @@ each recipe you wish to blacklist. Specify the :term:`PN`
 value as a variable flag (varflag) and provide a reason, which is
 reported, if the package is requested to be built as the value. For
 example, if you want to blacklist a recipe called "exoticware", you add
-the following to your ``local.conf`` or distribution configuration:
-::
+the following to your ``local.conf`` or distribution configuration::
 
    INHERIT += "blacklist"
    PNBLACKLIST[exoticware] = "Not supported by our organization."
@@ -470,8 +468,7 @@ information about using ``devshell``.
 The ``devupstream`` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
-tarball. Following is an example:
-::
+tarball. Following is an example::
 
    BBCLASSEXTEND = "devupstream:target"
    SRC_URI_class-devupstream = "git://git.example.com/example"
@@ -481,8 +478,7 @@ Adding the above statements to your recipe creates a variant that has
 :term:`DEFAULT_PREFERENCE` set to "-1".
 Consequently, you need to select the variant of the recipe to use it.
 Any development-specific adjustments can be done by using the
-``class-devupstream`` override. Here is an example:
-::
+``class-devupstream`` override. Here is an example::
 
    DEPENDS_append_class-devupstream = " gperf-native"
    do_configure_prepend_class-devupstream() {
@@ -544,8 +540,7 @@ By default, this class expects the source code to support recipe builds
 that use the :term:`B` variable to point to the directory in
 which the OpenEmbedded build system places the generated objects built
 from the recipes. By default, the ``B`` directory is set to the
-following, which is separate from the source directory (``S``):
-::
+following, which is separate from the source directory (``S``)::
 
    ${WORKDIR}/${BPN}/{PV}/
 
@@ -581,8 +576,7 @@ be performed using the
    useradd
    class to add user and group configuration to a specific recipe.
 
-Here is an example that uses this class in an image recipe:
-::
+Here is an example that uses this class in an image recipe::
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -595,8 +589,7 @@ Here is an example that uses this class in an image recipe:
        "
 
 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords:
-::
+passwords::
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -604,8 +597,7 @@ passwords:
        useradd -P tester01 tester-sue; \
        "
 
-Finally, here is an example that sets the root password to "1876*18":
-::
+Finally, here is an example that sets the root password to "1876*18"::
 
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -867,8 +859,7 @@ system need to either inherit the ``icecc`` class or nobody should.
 At the distribution level, you can inherit the ``icecc`` class to be
 sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
-:term:`ICECC_DISABLED` variable to "1" as follows:
-::
+:term:`ICECC_DISABLED` variable to "1" as follows::
 
    INHERIT_DISTRO_append = " icecc"
    ICECC_DISABLED ??= "1"
@@ -876,8 +867,7 @@ inheriting the class, you can then disable the feature by setting the
 This practice
 makes sure everyone is using the same signatures but also requires
 individuals that do want to use Icecream to enable the feature
-individually as follows in your ``local.conf`` file:
-::
+individually as follows in your ``local.conf`` file::
 
    ICECC_DISABLED = ""
 
@@ -925,8 +915,7 @@ types.
 
 By default, the :ref:`image <ref-classes-image>` class automatically
 enables the ``image_types`` class. The ``image`` class uses the
-``IMGCLASSES`` variable as follows:
-::
+``IMGCLASSES`` variable as follows::
 
    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
    IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
@@ -968,8 +957,7 @@ during the :ref:`ref-tasks-rootfs` task, which optimizes
 the size of libraries contained in the image.
 
 By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows:
-::
+the :term:`USER_CLASSES` variable as follows::
 
    USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
@@ -984,8 +972,7 @@ the dynamic linking of shared libraries to reduce executable startup
 time.
 
 By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows:
-::
+the :term:`USER_CLASSES` variable as follows::
 
    USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
@@ -1014,8 +1001,7 @@ configuration). However, to skip one or more checks in recipes, you
 should use :term:`INSANE_SKIP`. For example, to skip
 the check for symbolic link ``.so`` files in the main package of a
 recipe, add the following to the recipe. You need to realize that the
-package name override, in this example ``${PN}``, must be used:
-::
+package name override, in this example ``${PN}``, must be used::
 
    INSANE_SKIP_${PN} += "dev-so"
 
@@ -1152,8 +1138,7 @@ The following list shows the tests you can list with the ``WARN_QA`` and
 
 -  ``invalid-packageconfig:`` Checks that no undefined features are
    being added to :term:`PACKAGECONFIG`. For
-   example, any name "foo" for which the following form does not exist:
-   ::
+   example, any name "foo" for which the following form does not exist::
 
       PACKAGECONFIG[foo] = "..."
 
@@ -1636,8 +1621,7 @@ a couple different ways:
    .. note::
 
       When creating a recipe this way, the recipe name must follow this
-      naming convention:
-      ::
+      naming convention::
 
          myrecipe-native.bb
 
@@ -1645,8 +1629,7 @@ a couple different ways:
       Not using this naming convention can lead to subtle problems
       caused by existing code that depends on that naming convention.
 
--  Create or modify a target recipe that contains the following:
-   ::
+-  Create or modify a target recipe that contains the following::
 
       BBCLASSEXTEND = "native"
 
@@ -1677,8 +1660,7 @@ couple different ways:
    inherit statement in the recipe after all other inherit statements so
    that the ``nativesdk`` class is inherited last.
 
--  Create a ``nativesdk`` variant of any recipe by adding the following:
-   ::
+-  Create a ``nativesdk`` variant of any recipe by adding the following::
 
        BBCLASSEXTEND = "nativesdk"
 
@@ -1689,8 +1671,7 @@ couple different ways:
 
 .. note::
 
-   When creating a recipe, you must follow this naming convention:
-   ::
+   When creating a recipe, you must follow this naming convention::
 
            nativesdk-myrecipe.bb
 
@@ -1753,8 +1734,7 @@ before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.
 
 To use this class, inherit it globally and specify
-:term:`SOURCE_MIRROR_URL`. Here is an example:
-::
+:term:`SOURCE_MIRROR_URL`. Here is an example::
 
    INHERIT += "own-mirrors"
    SOURCE_MIRROR_URL = "http://example.com/my-source-mirror"
@@ -2017,8 +1997,7 @@ established and then populates the SDK. After populating the SDK, the
 contains the cross-compiler and associated tooling, and the target,
 which contains a target root filesystem that is configured for the SDK
 usage. These two images reside in :term:`SDK_OUTPUT`,
-which consists of the following:
-::
+which consists of the following::
 
    ${SDK_OUTPUT}/${SDK_ARCH}-nativesdk-pkgs
    ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/target-pkgs
@@ -2180,8 +2159,7 @@ installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.
 
 If a recipe needs the ``.la`` files to be installed, then the recipe can
-override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows:
-::
+override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::
 
    REMOVE_LIBTOOL_LA = "0"
 
@@ -2231,8 +2209,7 @@ recipe, enabling ``rm_work`` will potentially result in your changes to
 the source being lost. To exclude some recipes from having their work
 directories deleted by ``rm_work``, you can add the names of the recipe
 or recipes you are working on to the ``RM_WORK_EXCLUDE`` variable, which
-can also be set in your ``local.conf`` file. Here is an example:
-::
+can also be set in your ``local.conf`` file. Here is an example::
 
    RM_WORK_EXCLUDE += "busybox glibc"
 
@@ -2531,8 +2508,7 @@ You should set :term:`SYSTEMD_SERVICE` to the
 name of the service file. You should also use a package name override to
 indicate the package to which the value applies. If the value applies to
 the recipe's main package, use ``${``\ :term:`PN`\ ``}``. Here
-is an example from the connman recipe:
-::
+is an example from the connman recipe::
 
    SYSTEMD_SERVICE_${PN} = "connman.service"
 
@@ -2608,8 +2584,7 @@ The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.
 
 The ``testimage.bbclass`` runs tests on an image when called using the
-following:
-::
+following::
 
    $ bitbake -c testimage image
 
@@ -2628,8 +2603,7 @@ section in the Yocto Project Development Tasks Manual.
 
 This class supports running automated tests against software development
 kits (SDKs). The ``testsdk`` class runs tests on an SDK when called
-using the following:
-::
+using the following::
 
    $ bitbake -c testsdk image
 
@@ -2684,8 +2658,7 @@ the environment for installed SDKs.
 The ``typecheck`` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
-variable using the "type" varflag. Here is an example:
-::
+variable using the "type" varflag. Here is an example::
 
    IMAGE_FEATURES[type] = "list"
 
@@ -2695,14 +2668,12 @@ variable using the "type" varflag. Here is an example:
 ========================
 
 The ``uboot-config`` class provides support for U-Boot configuration for
-a machine. Specify the machine in your recipe as follows:
-::
+a machine. Specify the machine in your recipe as follows::
 
    UBOOT_CONFIG ??= <default>
    UBOOT_CONFIG[foo] = "config,images"
 
-You can also specify the machine using this method:
-::
+You can also specify the machine using this method::
 
    UBOOT_MACHINE = "config"
 
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 629aa2ffb9..0ce3219831 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -22,8 +22,7 @@ Getting Help
 
 The ``devtool`` command line is organized similarly to Git in that it
 has a number of sub-commands for each function. You can run
-``devtool --help`` to see all the commands:
-::
+``devtool --help`` to see all the commands::
 
    $ devtool -h
    NOTE: Starting bitbake server...
@@ -79,8 +78,7 @@ has a number of sub-commands for each function. You can run
 
 As directed in the general help output, you can
 get more syntax on a specific command by providing the command name and
-using "--help":
-::
+using "--help"::
 
    $ devtool add --help
    NOTE: Starting bitbake server...
@@ -172,8 +170,7 @@ you. The source files the recipe uses should exist in an external area.
 
 The following example creates and adds a new recipe named ``jackson`` to
 a workspace layer the tool creates. The source code built by the recipes
-resides in ``/home/user/sources/jackson``:
-::
+resides in ``/home/user/sources/jackson``::
 
    $ devtool add jackson /home/user/sources/jackson
 
@@ -201,8 +198,7 @@ unpacking files from a remote URI. In some cases, you might want to
 specify a source revision by branch, tag, or commit hash. You can
 specify these options when using the ``devtool add`` command:
 
--  To specify a source branch, use the ``--srcbranch`` option:
-   ::
+-  To specify a source branch, use the ``--srcbranch`` option::
 
       $ devtool add --srcbranch &DISTRO_NAME_NO_CAP; jackson /home/user/sources/jackson
 
@@ -210,8 +206,7 @@ specify these options when using the ``devtool add`` command:
    branch.
 
 -  To specify a specific tag or commit hash, use the ``--srcrev``
-   option:
-   ::
+   option::
 
       $ devtool add --srcrev &DISTRO_REL_TAG; jackson /home/user/sources/jackson
       $ devtool add --srcrev some_commit_hash /home/user/sources/jackson
@@ -269,8 +264,7 @@ The ``devtool modify`` command extracts the source for a recipe, sets it
 up as a Git repository if the source had not already been fetched from
 Git, checks out a branch for development, and applies any patches from
 the recipe as commits on top. You can use the following command to
-checkout the source files:
-::
+checkout the source files::
 
    $ devtool modify recipe
 
@@ -309,8 +303,7 @@ compile, and test the code.
 
 When you are satisfied with the results and you have committed your
 changes to the Git repository, you can then run the
-``devtool update-recipe`` to create the patches and update the recipe:
-::
+``devtool update-recipe`` to create the patches and update the recipe::
 
    $ devtool update-recipe recipe
 
@@ -321,8 +314,7 @@ Often, you might want to apply customizations made to your software in
 your own layer rather than apply them to the original recipe. If so, you
 can use the ``-a`` or ``--append`` option with the
 ``devtool update-recipe`` command. These options allow you to specify
-the layer into which to write an append file:
-::
+the layer into which to write an append file::
 
    $ devtool update-recipe recipe -a base-layer-directory
 
@@ -358,8 +350,7 @@ particular recipe.
       recipe's latest version tag.
 
 As with all ``devtool`` commands, you can get help on the individual
-command:
-::
+command::
 
    $ devtool check-upgrade-status -h
    NOTE: Starting bitbake server...
@@ -462,8 +453,7 @@ files have been modified, the command preserves the modified files in a
 separate "attic" subdirectory under the workspace layer.
 
 Here is an example that resets the workspace directory that contains the
-``mtr`` recipe:
-::
+``mtr`` recipe::
 
    $ devtool reset mtr
    NOTE: Cleaning sysroot for recipe mtr...
@@ -482,8 +472,7 @@ Use the ``devtool build`` command to build your recipe. The
 When you use the ``devtool build`` command, you must supply the root
 name of the recipe (i.e. do not provide versions, paths, or extensions).
 You can use either the "-s" or the "--disable-parallel-make" options to
-disable parallel makes during the build. Here is an example:
-::
+disable parallel makes during the build. Here is an example::
 
    $ devtool build recipe
 
@@ -499,8 +488,7 @@ device for testing. For proper integration into a final image, you need
 to edit your custom image recipe appropriately.
 
 When you use the ``devtool build-image`` command, you must supply the
-name of the image. This command has no command line options:
-::
+name of the image. This command has no command line options::
 
    $ devtool build-image image
 
@@ -510,8 +498,7 @@ Deploying Your Software on the Target Machine
 =============================================
 
 Use the ``devtool deploy-target`` command to deploy the recipe's build
-output to the live target machine:
-::
+output to the live target machine::
 
    $ devtool deploy-target recipe target
 
@@ -582,15 +569,13 @@ new workspace layer, it is populated with the ``README`` file and the
 ``conf`` directory only.
 
 The following example creates a new workspace layer in your current
-working and by default names the workspace layer "workspace":
-::
+working and by default names the workspace layer "workspace"::
 
    $ devtool create-workspace
 
 You can create a workspace layer anywhere by supplying a pathname with
 the command. The following command creates a new workspace layer named
-"new-workspace":
-::
+"new-workspace"::
 
    $ devtool create-workspace /home/scottrif/new-workspace
 
@@ -603,15 +588,13 @@ Use the ``devtool status`` command to list the recipes currently in your
 workspace. Information includes the paths to their respective external
 source trees.
 
-The ``devtool status`` command has no command-line options:
-::
+The ``devtool status`` command has no command-line options::
 
    $ devtool status
 
 Following is sample output after using
 :ref:`devtool add <ref-manual/devtool-reference:adding a new recipe to the workspace layer>`
-to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory:
-::
+to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
    $ devtool status
    mtr:/home/scottrif/poky/build/workspace/sources/mtr (/home/scottrif/poky/build/workspace/recipes/mtr/mtr_0.86.bb)
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index a9103f83c6..e7bca829a3 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -209,8 +209,7 @@ section in the Yocto Project Development Tasks Manual.
 **A:** You need to create a form factor file as described in the
 ":ref:`bsp-guide/bsp:miscellaneous bsp-specific recipe files`" section in
 the Yocto Project Board Support Packages (BSP) Developer's Guide. Set
-the ``HAVE_TOUCHSCREEN`` variable equal to one as follows:
-::
+the ``HAVE_TOUCHSCREEN`` variable equal to one as follows::
 
    HAVE_TOUCHSCREEN=1
 
@@ -313,8 +312,7 @@ HTTPS requests and direct them to the ``http://`` sources mirror. You
 can use ``file://`` URLs to point to local directories or network shares
 as well.
 
-Aside from the previous technique, these options also exist:
-::
+Aside from the previous technique, these options also exist::
 
    BB_NO_NETWORK = "1"
 
@@ -322,8 +320,7 @@ This statement tells BitBake to issue an error
 instead of trying to access the Internet. This technique is useful if
 you want to ensure code builds only from local sources.
 
-Here is another technique:
-::
+Here is another technique::
 
    BB_FETCH_PREMIRRORONLY = "1"
 
@@ -331,8 +328,7 @@ This statement
 limits the build system to pulling source from the ``PREMIRRORS`` only.
 Again, this technique is useful for reproducing builds.
 
-Here is another technique:
-::
+Here is another technique::
 
    BB_GENERATE_MIRROR_TARBALLS = "1"
 
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 89c06eb65f..eb4947d594 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -26,8 +26,7 @@ One method you can use to determine which recipes are checking to see if
 a particular feature is contained or not is to ``grep`` through the
 :term:`Metadata` for the feature. Here is an example that
 discovers the recipes whose build is potentially changed based on a
-given feature:
-::
+given feature::
 
    $ cd poky
    $ git grep 'contains.*MACHINE_FEATURES.*feature'
diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index 6b4e958a85..b2db1a7734 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -18,8 +18,7 @@ image you want.
    are going to build an image using non-GPLv3 and similarly licensed
    components, you must make the following changes in the ``local.conf``
    file before using the BitBake command to build the minimal or base
-   image:
-   ::
+   image::
 
            1. Comment out the EXTRA_IMAGE_FEATURES line
            2. Set INCOMPATIBLE_LICENSE = "GPL-3.0 LGPL-3.0 AGPL-3.0"
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index b87cdc13b1..843292b528 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -30,8 +30,7 @@ Command: part or partition
 ==========================
 
 Either of these commands creates a partition on the system and uses the
-following syntax:
-::
+following syntax::
 
    part [mntpoint]
    partition [mntpoint]
@@ -59,8 +58,7 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
    versions of these application are currently excluded.
 
 Here is an example that uses "/" as the mountpoint. The command uses
-``--ondisk`` to force the partition onto the ``sdb`` disk:
-::
+``--ondisk`` to force the partition onto the ``sdb`` disk::
 
       part / --source rootfs --ondisk sdb --fstype=ext3 --label platform --align 1024
 
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index 7c522dc123..b90767ff90 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/ref-manual/migration-1.3.rst
@@ -181,8 +181,7 @@ Linux Kernel Naming
 -------------------
 
 The naming scheme for kernel output binaries has been changed to now
-include :term:`PE` as part of the filename:
-::
+include :term:`PE` as part of the filename::
 
    KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 
diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/ref-manual/migration-1.4.rst
index f5fac7a2ac..deb848749c 100644
--- a/documentation/ref-manual/migration-1.4.rst
+++ b/documentation/ref-manual/migration-1.4.rst
@@ -40,8 +40,7 @@ Differences include the following:
 
 -  *Shared State Code:* The shared state code has been optimized to
    avoid running unnecessary tasks. For example, the following no longer
-   populates the target sysroot since that is not necessary:
-   ::
+   populates the target sysroot since that is not necessary::
 
       $ bitbake -c rootfs some-image
 
@@ -136,8 +135,7 @@ Target Package Management with RPM
 If runtime package management is enabled and the RPM backend is
 selected, Smart is now installed for package download, dependency
 resolution, and upgrades instead of Zypper. For more information on how
-to use Smart, run the following command on the target:
-::
+to use Smart, run the following command on the target::
 
    smart --help
 
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index fe3e04d685..5a18d63103 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/ref-manual/migration-1.6.rst
@@ -53,8 +53,7 @@ Matching Branch Requirement for Git Fetching
 When fetching source from a Git repository using
 :term:`SRC_URI`, BitBake will now validate the
 :term:`SRCREV` value against the branch. You can specify
-the branch using the following form:
-::
+the branch using the following form::
 
       SRC_URI = "git://server.name/repository;branch=branchname"
 
@@ -248,8 +247,7 @@ the ``autotools`` or ``autotools_stage``\ classes.
 
 ``qemu-native`` now builds without SDL-based graphical output support by
 default. The following additional lines are needed in your
-``local.conf`` to enable it:
-::
+``local.conf`` to enable it::
 
    PACKAGECONFIG_pn-qemu-native = "sdl"
    ASSUME_PROVIDED += "libsdl-native"
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 9cf467f28b..46bf126583 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -15,8 +15,7 @@ optional features. The method used to set defaults for these options
 means that existing ``local.conf`` files will need to be modified to
 append to ``PACKAGECONFIG`` for ``qemu-native`` and ``nativesdk-qemu``
 instead of setting it. In other words, to enable graphical output for
-QEMU, you should now have these lines in ``local.conf``:
-::
+QEMU, you should now have these lines in ``local.conf``::
 
    PACKAGECONFIG_append_pn-qemu-native = " sdl"
    PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
@@ -80,8 +79,7 @@ disable the scripts due to the scripts previously requiring error-prone
 path substitution. Software that links against these libraries using
 these scripts should use the much more robust ``pkg-config`` instead.
 The list of recipes changed in this version (and their configuration
-scripts) is as follows:
-::
+scripts) is as follows::
 
    directfb (directfb-config)
    freetype (freetype-config)
diff --git a/documentation/ref-manual/migration-2.0.rst b/documentation/ref-manual/migration-2.0.rst
index 9da60dfdcb..8319b0ee36 100644
--- a/documentation/ref-manual/migration-2.0.rst
+++ b/documentation/ref-manual/migration-2.0.rst
@@ -25,8 +25,7 @@ and the porting guide at
 https://gcc.gnu.org/gcc-5/porting_to.html.
 
 Alternatively, you can switch back to GCC 4.9 or 4.8 by setting
-``GCCVERSION`` in your configuration, as follows:
-::
+``GCCVERSION`` in your configuration, as follows::
 
    GCCVERSION = "4.9%"
 
@@ -91,8 +90,7 @@ unlikely to require any changes to Metadata. However, these minor
 changes in behavior exist:
 
 -  All potential overrides are now visible in the variable history as
-   seen when you run the following:
-   ::
+   seen when you run the following::
 
       $ bitbake -e
 
@@ -200,8 +198,7 @@ changes.
 
 Additionally, work directories for old versions of recipes are now
 pruned. If you wish to disable pruning old work directories, you can set
-the following variable in your configuration:
-::
+the following variable in your configuration::
 
    SSTATE_PRUNE_OBSOLETEWORKDIR = "0"
 
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 1eb9ab5525..32d193f0ff 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -42,8 +42,7 @@ defaulted to False if not specified. Now, however, no default exists so
 one must be specified. You must change any ``getVar()`` calls that do
 not specify the final expand parameter to calls that do specify the
 parameter. You can run the following ``sed`` command at the base of a
-layer to make this change:
-::
+layer to make this change::
 
    sed -e 's:\(\.getVar([^,()]*\)):\1, False):g' -i `grep -ril getVar *`
    sed -e 's:\(\.getVarFlag([^,()]*,[^,()]*\)):\1, False):g' -i `grep -ril getVarFlag *`
@@ -285,8 +284,7 @@ The following changes have been made for the Poky distribution:
    Any recipe that needs to opt-out of having the "--disable-static"
    option specified on the configure command line either because it is
    not a supported option for the configure script or because static
-   libraries are needed should set the following variable:
-   ::
+   libraries are needed should set the following variable::
 
       DISABLE_STATIC = ""
 
@@ -369,8 +367,7 @@ These additional changes exist:
 -  Previously, the following list of packages were removed if
    package-management was not in
    :term:`IMAGE_FEATURES`, regardless of any
-   dependencies:
-   ::
+   dependencies::
 
       update-rc.d
       base-passwd
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index d11735163e..a9d3cde7b7 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -144,8 +144,7 @@ The new ``runqemu`` is a Python script. Machine knowledge is no longer
 hardcoded into ``runqemu``. You can choose to use the ``qemuboot``
 configuration file to define the BSP's own arguments and to make it
 bootable with ``runqemu``. If you use a configuration file, use the
-following form:
-::
+following form::
 
    image-name-machine.qemuboot.conf
 
@@ -160,8 +159,7 @@ rootfs). QEMU boot arguments can be set in BSP's configuration file and
 the ``qemuboot`` class will save them to ``qemuboot.conf``.
 
 If you want to use ``runqemu`` without a configuration file, use the
-following command form:
-::
+following command form::
 
    $ runqemu machine rootfs kernel [options]
 
@@ -244,8 +242,7 @@ recipes. You need to fix these recipes so that they use the expected
 ``LDFLAGS``. Depending on how the software is built, the build system
 used by the software (e.g. a Makefile) might need to be patched.
 However, sometimes making this fix is as simple as adding the following
-to the recipe:
-::
+to the recipe::
 
    TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -258,8 +255,7 @@ The ``KERNEL_IMAGE_BASE_NAME`` variable no longer uses the
 :term:`KERNEL_IMAGETYPE` variable to create the
 image's base name. Because the OpenEmbedded build system can now build
 multiple kernel image types, this part of the kernel image base name as
-been removed leaving only the following:
-::
+been removed leaving only the following::
 
    KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 0541eb3e74..dfbda612ae 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -114,8 +114,7 @@ Changes to Scripts
 The following changes to scripts took place:
 
 -  ``oe-find-native-sysroot``: The usage for the
-   ``oe-find-native-sysroot`` script has changed to the following:
-   ::
+   ``oe-find-native-sysroot`` script has changed to the following::
 
       $ . oe-find-native-sysroot recipe
 
@@ -124,8 +123,7 @@ The following changes to scripts took place:
    was not necessary to provide the script with the command.
 
 -  ``oe-run-native``: The usage for the ``oe-run-native`` script has
-   changed to the following:
-   ::
+   changed to the following::
 
       $ oe-run-native native_recipe tool
 
@@ -453,14 +451,11 @@ The following miscellaneous changes have occurred:
    tools.
 
 -  The ``USE_LDCONFIG`` variable has been replaced with the "ldconfig"
-   ``DISTRO_FEATURES`` feature. Distributions that previously set:
-   ::
+   ``DISTRO_FEATURES`` feature. Distributions that previously set::
 
       USE_LDCONFIG = "0"
 
-   should now instead use the following:
-
-   ::
+   should now instead use the following::
 
       DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " ldconfig"
 
@@ -478,8 +473,7 @@ The following miscellaneous changes have occurred:
    order to allow module packages from multiple kernel versions to
    co-exist on a target system. If you wish to return to the previous
    naming scheme that does not include the version suffix, use the
-   following:
-   ::
+   following::
 
       KERNEL_MODULE_PACKAGE_SUFFIX = ""
 
diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
index fd5f2f88e0..86a0da9c40 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/ref-manual/migration-2.5.rst
@@ -138,13 +138,11 @@ The following are BitBake changes:
    tree" tasks have been removed (e.g. ``fetchall``, ``checkuriall``,
    and the ``*all`` tasks provided by the ``distrodata`` and
    ``archiver`` classes). There is a BitBake option to complete this for
-   any arbitrary task. For example:
-   ::
+   any arbitrary task. For example::
 
       bitbake <target> -c fetchall
 
-   should now be replaced with:
-   ::
+   should now be replaced with::
 
       bitbake <target> --runall=fetch
 
diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
index aeac509808..d1c6c0c5f5 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/ref-manual/migration-2.6.rst
@@ -161,13 +161,11 @@ The following changes have been made:
    allows easier and more direct changes.
 
    The ``IMAGE_VERSION_SUFFIX`` variable is set in the ``bitbake.conf``
-   configuration file as follows:
-   ::
+   configuration file as follows::
 
       IMAGE_VERSION_SUFFIX = "-${DATETIME}"
 
--  Several variables have changed names for consistency:
-   ::
+-  Several variables have changed names for consistency::
 
       Old Variable Name             New Variable Name
       ========================================================
@@ -292,8 +290,7 @@ avoids the ``systemd`` recipe from becoming machine-specific for cases
 where machine-specific configurations need to be applied (e.g. for
 ``qemu*`` machines).
 
-Currently, the new recipe packages the following files:
-::
+Currently, the new recipe packages the following files::
 
    ${sysconfdir}/machine-id
    ${sysconfdir}/systemd/coredump.conf
@@ -393,8 +390,7 @@ If you wish to disable Python profile-guided optimization regardless of
 the value of ``MACHINE_FEATURES``, then ensure that
 :term:`PACKAGECONFIG` for the ``python3`` recipe
 does not contain "pgo". You could accomplish the latter using the
-following at the configuration level:
-::
+following at the configuration level::
 
    PACKAGECONFIG_remove_pn-python3 = "pgo"
 
@@ -411,8 +407,7 @@ The following miscellaneous changes occurred:
 -  Default to using the Thumb-2 instruction set for armv7a and above. If
    you have any custom recipes that build software that needs to be
    built with the ARM instruction set, change the recipe to set the
-   instruction set as follows:
-   ::
+   instruction set as follows::
 
       ARM_INSTRUCTION_SET = "arm"
 
diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/ref-manual/migration-3.1.rst
index c62aba7d48..7822285a87 100644
--- a/documentation/ref-manual/migration-3.1.rst
+++ b/documentation/ref-manual/migration-3.1.rst
@@ -71,8 +71,7 @@ when building a simple image such as core-image-minimal. If you do not
 need runtime tests enabled for core components, then it is recommended
 that you remove "ptest" from
 :term:`DISTRO_FEATURES` to save a significant
-amount of build time e.g. by adding the following in your configuration:
-::
+amount of build time e.g. by adding the following in your configuration::
 
    DISTRO_FEATURES_remove = "ptest"
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 79d2d4266a..9cc4c577c7 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -221,8 +221,7 @@ Errors and Warnings
    Typically, the way to solve this performance issue is to add "-fPIC"
    or "-fpic" to the compiler command-line options. For example, given
    software that reads :term:`CFLAGS` when you build it,
-   you could add the following to your recipe:
-   ::
+   you could add the following to your recipe::
 
       CFLAGS_append = " -fPIC "
 
@@ -240,8 +239,7 @@ Errors and Warnings
    variable is being passed to the linker command. A common workaround
    for this situation is to pass in ``LDFLAGS`` using
    :term:`TARGET_CC_ARCH` within the recipe as
-   follows:
-   ::
+   follows::
 
       TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -265,8 +263,7 @@ Errors and Warnings
 
    The ``/usr/share/info/dir`` should not be packaged. Add the following
    line to your :ref:`ref-tasks-install` task or to your
-   ``do_install_append`` within the recipe as follows:
-   ::
+   ``do_install_append`` within the recipe as follows::
 
       rm ${D}${infodir}/dir
    
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 0f2093a8d4..f8dc7d2821 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -153,8 +153,7 @@ When you run this script, your Yocto Project environment is set up, a
 :term:`Build Directory` is created, your working
 directory becomes the Build Directory, and you are presented with some
 simple suggestions as to what to do next, including a list of some
-possible targets to build. Here is an example:
-::
+possible targets to build. Here is an example::
 
    $ source oe-init-build-env
 
@@ -185,8 +184,7 @@ creates the ``build/`` directory in your current working directory. If
 you provide a Build Directory argument when you ``source`` the script,
 you direct the OpenEmbedded build system to create a Build Directory of
 your choice. For example, the following command creates a Build
-Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`:
-::
+Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`::
 
    $ source oe-init-build-env ~/mybuilds
 
@@ -269,8 +267,7 @@ and to ``meta/conf/`` when you are building from the OpenEmbedded-Core
 environment. Because the script variable points to the source of the
 ``local.conf.sample`` file, this implies that you can configure your
 build environment from any layer by setting the variable in the
-top-level build environment setup script as follows:
-::
+top-level build environment setup script as follows::
 
    TEMPLATECONF=your_layer/conf
 
@@ -309,8 +306,7 @@ Project development environment, and to ``meta/conf/`` when you are
 building from the OpenEmbedded-Core environment. Because the script
 variable points to the source of the ``bblayers.conf.sample`` file, this
 implies that you can base your build from any layer by setting the
-variable in the top-level build environment setup script as follows:
-::
+variable in the top-level build environment setup script as follows::
 
    TEMPLATECONF=your_layer/conf
 
@@ -463,8 +459,7 @@ image again.
 If you do accidentally delete files here, you will need to force them to
 be re-created. In order to do that, you will need to know the target
 that produced them. For example, these commands rebuild and re-create
-the kernel files:
-::
+the kernel files::
 
    $ bitbake -c clean virtual/kernel
    $ bitbake virtual/kernel
@@ -535,8 +530,7 @@ recipe-specific :term:`WORKDIR` directories. Thus, the
 This directory holds information that BitBake uses for accounting
 purposes to track what tasks have run and when they have run. The
 directory is sub-divided by architecture, package name, and version.
-Following is an example:
-::
+Following is an example::
 
       stamps/all-poky-linux/distcc-config/1.0-r0.do_build-2fdd....2do
 
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 80378cedb7..4fa4d3ef52 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -120,8 +120,7 @@ supported Ubuntu or Debian Linux distribution:
       might experience QEMU build failures due to the package installing
       its own custom ``/usr/include/linux/soundcard.h`` on the Debian
       system. If you run into this situation, either of the following
-      solutions exist:
-      ::
+      solutions exist::
 
          $ sudo apt-get build-dep qemu
          $ sudo apt-get remove oss4-dev
@@ -132,14 +131,12 @@ supported Ubuntu or Debian Linux distribution:
 
          $ sudo pip3 install GitPython pylint==1.9.5
 
--  *Essentials:* Packages needed to build an image on a headless system:
-   ::
+-  *Essentials:* Packages needed to build an image on a headless system::
 
       $ sudo apt-get install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
 -  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals:
-   ::
+   Yocto Project documentation manuals::
 
       $ sudo apt-get install make python3-pip
       &PIP3_HOST_PACKAGES_DOC;
@@ -157,14 +154,12 @@ The following list shows the required packages by function given a
 supported Fedora Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
-   system:
-   ::
+   system::
 
       $ sudo dnf install &FEDORA_HOST_PACKAGES_ESSENTIAL;
 
 -  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals:
-   ::
+   Yocto Project documentation manuals::
 
       $ sudo dnf install make python3-pip which
       &PIP3_HOST_PACKAGES_DOC;
@@ -176,14 +171,12 @@ The following list shows the required packages by function given a
 supported openSUSE Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
-   system:
-   ::
+   system::
 
       $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
 
 -  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals:
-   ::
+   Yocto Project documentation manuals::
 
       $ sudo zypper install make python3-pip which
       &PIP3_HOST_PACKAGES_DOC;
@@ -196,8 +189,7 @@ The following list shows the required packages by function given a
 supported CentOS-7 Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
-   system:
-   ::
+   system::
 
       $ sudo yum install &CENTOS7_HOST_PACKAGES_ESSENTIAL;
 
@@ -212,8 +204,7 @@ supported CentOS-7 Linux distribution:
          ``epel-release``.
 
 -  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals:
-   ::
+   Yocto Project documentation manuals::
 
       $ sudo yum install make python3-pip which
       &PIP3_HOST_PACKAGES_DOC;
@@ -225,8 +216,7 @@ The following list shows the required packages by function given a
 supported CentOS-8 Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
-   system:
-   ::
+   system::
 
       $ sudo dnf install &CENTOS8_HOST_PACKAGES_ESSENTIAL;
 
@@ -244,8 +234,7 @@ supported CentOS-8 Linux distribution:
          ``epel-release``.
 
 -  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals:
-   ::
+   Yocto Project documentation manuals::
 
       $ sudo dnf install make python3-pip which
       &PIP3_HOST_PACKAGES_DOC;
@@ -287,8 +276,7 @@ The ``install-buildtools`` script is the easiest of the three methods by
 which you can get these tools. It downloads a pre-built buildtools
 installer and automatically installs the tools for you:
 
-1. Execute the ``install-buildtools`` script. Here is an example:
-   ::
+1. Execute the ``install-buildtools`` script. Here is an example::
 
       $ cd poky
       $ scripts/install-buildtools --without-extended-buildtools \
@@ -302,22 +290,19 @@ installer and automatically installs the tools for you:
    installation is functional.
 
    To avoid the need of ``sudo`` privileges, the ``install-buildtools``
-   script will by default tell the installer to install in:
-   ::
+   script will by default tell the installer to install in::
 
       /path/to/poky/buildtools
 
    If your host development system needs the additional tools provided
    in the ``buildtools-extended`` tarball, you can instead execute the
-   ``install-buildtools`` script with the default parameters:
-   ::
+   ``install-buildtools`` script with the default parameters::
 
       $ cd poky
       $ scripts/install-buildtools
 
 2. Source the tools environment setup script by using a command like the
-   following:
-   ::
+   following::
 
       $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
 
@@ -342,13 +327,11 @@ steps:
 1. Locate and download the ``*.sh`` at &YOCTO_RELEASE_DL_URL;/buildtools/
 
 2. Execute the installation script. Here is an example for the
-   traditional installer:
-   ::
+   traditional installer::
 
       $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
 
-   Here is an example for the extended installer:
-   ::
+   Here is an example for the extended installer::
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
@@ -357,8 +340,7 @@ steps:
    ``/home/your-username/buildtools``
 
 3. Source the tools environment setup script by using a command like the
-   following:
-   ::
+   following::
 
       $ source /home/your_username/buildtools/environment-setup-i586-poky-linux
 
@@ -390,13 +372,11 @@ installer:
    your build environment with the setup script
    (:ref:`structure-core-script`).
 
-2. Run the BitBake command to build the tarball:
-   ::
+2. Run the BitBake command to build the tarball::
 
       $ bitbake buildtools-tarball
 
-   or run the BitBake command to build the extended tarball:
-   ::
+   or run the BitBake command to build the extended tarball::
 
       $ bitbake buildtools-extended-tarball
 
@@ -415,13 +395,11 @@ installer:
 
 4. On the machine that does not meet the requirements, run the ``.sh``
    file to install the tools. Here is an example for the traditional
-   installer:
-   ::
+   installer::
 
       $ sh ~/Downloads/x86_64-buildtools-nativesdk-standalone-&DISTRO;.sh
 
-   Here is an example for the extended installer:
-   ::
+   Here is an example for the extended installer::
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
@@ -430,8 +408,7 @@ installer:
    ``/home/your_username/buildtools``
 
 5. Source the tools environment setup script by using a command like the
-   following:
-   ::
+   following::
 
       $ source /home/your_username/buildtools/environment-setup-x86_64-poky-linux
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 9fe1c296aa..001edf6bb3 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -93,8 +93,7 @@ output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
 The ``do_deploy`` task is not added as a task by default and
 consequently needs to be added manually. If you want the task to run
 after :ref:`ref-tasks-compile`, you can add it by doing
-the following:
-::
+the following::
 
       addtask deploy after do_compile
 
@@ -103,8 +102,7 @@ Adding ``do_deploy`` after other tasks works the same way.
 .. note::
 
    You do not need to add ``before do_build`` to the ``addtask`` command
-   (though it is harmless), because the ``base`` class contains the following:
-   ::
+   (though it is harmless), because the ``base`` class contains the following::
 
            do_build[recrdeptask] += "do_deploy"
 
@@ -302,13 +300,11 @@ Patch files, by default, are ``*.patch`` and ``*.diff`` files created
 and kept in a subdirectory of the directory holding the recipe file. For
 example, consider the
 :yocto_git:`bluez5 </poky/tree/meta/recipes-connectivity/bluez5>`
-recipe from the OE-Core layer (i.e. ``poky/meta``):
-::
+recipe from the OE-Core layer (i.e. ``poky/meta``)::
 
    poky/meta/recipes-connectivity/bluez5
 
-This recipe has two patch files located here:
-::
+This recipe has two patch files located here::
 
    poky/meta/recipes-connectivity/bluez5/bluez5
 
@@ -323,8 +319,7 @@ and patch files needed to build the package.
 As mentioned earlier, the build system treats files whose file types are
 ``.patch`` and ``.diff`` as patch files. However, you can use the
 "apply=yes" parameter with the ``SRC_URI`` statement to indicate any
-file as a patch file:
-::
+file as a patch file::
 
    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -334,8 +329,7 @@ file as a patch file:
 Conversely, if you have a directory full of patch files and you want to
 exclude some so that the ``do_patch`` task does not apply them during
 the patch phase, you can use the "apply=no" parameter with the
-``SRC_URI`` statement:
-::
+``SRC_URI`` statement::
 
    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -455,8 +449,7 @@ of the recipe exists upstream and a status of not updated, updated, or
 unknown.
 
 To check the upstream version and status of a recipe, use the following
-devtool commands:
-::
+devtool commands::
 
    $ devtool latest-version
    $ devtool check-upgrade-status
@@ -467,8 +460,7 @@ chapter for more information on
 section for information on checking the upgrade status of a recipe.
 
 To build the ``checkpkg`` task, use the ``bitbake`` command with the
-"-c" option and task name:
-::
+"-c" option and task name::
 
    $ bitbake core-image-minimal -c checkpkg
 
@@ -494,8 +486,7 @@ Removes all output files for a target from the
 :ref:`ref-tasks-install`, and
 :ref:`ref-tasks-package`).
 
-You can run this task using BitBake as follows:
-::
+You can run this task using BitBake as follows::
 
    $ bitbake -c clean recipe
 
@@ -519,8 +510,7 @@ downloaded source files for a target (i.e. the contents of
 identical to the :ref:`ref-tasks-cleansstate` task
 with the added removal of downloaded source files.
 
-You can run this task using BitBake as follows:
-::
+You can run this task using BitBake as follows::
 
    $ bitbake -c cleanall recipe
 
@@ -540,8 +530,7 @@ target. Essentially, the ``do_cleansstate`` task is identical to the
 shared state (:ref:`sstate <overview-manual/concepts:shared state cache>`)
 cache.
 
-You can run this task using BitBake as follows:
-::
+You can run this task using BitBake as follows::
 
    $ bitbake -c cleansstate recipe
 
@@ -553,8 +542,7 @@ scratch is guaranteed.
 
    The ``do_cleansstate`` task cannot remove sstate from a remote sstate
    mirror. If you need to build a target from scratch using remote mirrors, use
-   the "-f" option as follows:
-   ::
+   the "-f" option as follows::
 
       $ bitbake -f -c do_cleansstate target
 
@@ -687,8 +675,7 @@ changes made by the user with other methods (i.e. using
 (:ref:`ref-tasks-kernel_menuconfig`). Once the
 file of differences is created, it can be used to create a config
 fragment that only contains the differences. You can invoke this task
-from the command line as follows:
-::
+from the command line as follows::
 
    $ bitbake linux-yocto -c diffconfig
 
@@ -718,8 +705,7 @@ Validates the configuration produced by the
 configuration does not appear in the final ``.config`` file or when you
 override a policy configuration in a hardware configuration fragment.
 You can run this task explicitly and view the output by using the
-following command:
-::
+following command::
 
    $ bitbake linux-yocto -c kernel_configcheck -f
 
@@ -750,8 +736,7 @@ tool, which you then use to modify the kernel configuration.
 
 .. note::
 
-   You can also invoke this tool from the command line as follows:
-   ::
+   You can also invoke this tool from the command line as follows::
 
            $ bitbake linux-yocto -c menuconfig
 
@@ -793,8 +778,7 @@ instead of the default defconfig. The saved defconfig contains the
 differences between the default defconfig and the changes made by the
 user using other methods (i.e. the
 :ref:`ref-tasks-kernel_menuconfig` task. You
-can invoke the task using the following command:
-::
+can invoke the task using the following command::
 
    $ bitbake linux-yocto -c savedefconfig
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 32bb75b271..0af9af6485 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -26,8 +26,7 @@ universal, the list includes them just in case:
 
       When you name an append file, you can use the "``%``" wildcard character
       to allow for matching recipe names. For example, suppose you have an
-      append file named as follows:
-      ::
+      append file named as follows::
 
          busybox_1.21.%.bbappend
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9435aec458..64521b89bb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -24,8 +24,7 @@ system and gives an overview of their function and contents.
 
       ABI extensions are set in the machine include files. For example, the
       ``meta/conf/machine/include/arm/arch-arm.inc`` file sets the
-      following extension:
-      ::
+      following extension::
 
          ABIEXTENSION = "eabi"
 
@@ -37,8 +36,7 @@ system and gives an overview of their function and contents.
       requirement on the existence of the package.
 
       Like all package-controlling variables, you must always use them in
-      conjunction with a package name override, as in:
-      ::
+      conjunction with a package name override, as in::
 
          ALLOW_EMPTY_${PN} = "1"
          ALLOW_EMPTY_${PN}-dev = "1"
@@ -54,8 +52,7 @@ system and gives an overview of their function and contents.
       To use the variable, list out the package's commands that also exist
       as part of another package. For example, if the ``busybox`` package
       has four commands that also exist as part of another package, you
-      identify them as follows:
-      ::
+      identify them as follows::
 
          ALTERNATIVE_busybox = "sh sed test bracket"
 
@@ -68,8 +65,7 @@ system and gives an overview of their function and contents.
       locations. For example, if the ``bracket`` command provided by the
       ``busybox`` package is duplicated through another package, you must
       use the ``ALTERNATIVE_LINK_NAME`` variable to specify the actual
-      location:
-      ::
+      location::
 
          ALTERNATIVE_LINK_NAME[bracket] = "/usr/bin/["
 
@@ -90,8 +86,7 @@ system and gives an overview of their function and contents.
       default regardless of the command name or package, a default for
       specific duplicated commands regardless of the package, or a default
       for specific commands tied to particular packages. Here are the
-      available syntax forms:
-      ::
+      available syntax forms::
 
          ALTERNATIVE_PRIORITY = "priority"
          ALTERNATIVE_PRIORITY[name] = "priority"
@@ -107,8 +102,7 @@ system and gives an overview of their function and contents.
       default location for all duplicated commands regardless of the
       command name or package, a default for specific duplicated commands
       regardless of the package, or a default for specific commands tied to
-      particular packages. Here are the available syntax forms:
-      ::
+      particular packages. Here are the available syntax forms::
 
          ALTERNATIVE_TARGET = "target"
          ALTERNATIVE_TARGET[name] = "target"
@@ -159,8 +153,7 @@ system and gives an overview of their function and contents.
       determines the type of information used to create a released archive.
       You can use this variable to create archives of patched source,
       original source, configured source, and so forth by employing the
-      following variable flags (varflags):
-      ::
+      following variable flags (varflags)::
 
          ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
          ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
@@ -193,14 +186,12 @@ system and gives an overview of their function and contents.
       system. Separate multiple entries using spaces.
 
       As an example, use the following form to add an ``shlib`` provider of
-      shlibname in packagename with the optional version:
-      ::
+      shlibname in packagename with the optional version::
 
          shlibname:packagename[_version]
 
       Here is an example that adds a shared library named ``libEGL.so.1``
-      as being provided by the ``libegl-implementation`` package:
-      ::
+      as being provided by the ``libegl-implementation`` package::
 
          ASSUME_SHLIBS = "libEGL.so.1:libegl-implementation"
 
@@ -224,8 +215,7 @@ system and gives an overview of their function and contents.
 
    :term:`AUTOREV`
       When ``SRCREV`` is set to the value of this variable, it specifies to
-      use the latest source revision in the repository. Here is an example:
-      ::
+      use the latest source revision in the repository. Here is an example::
 
          SRCREV = "${AUTOREV}"
 
@@ -286,8 +276,7 @@ system and gives an overview of their function and contents.
       The directory within the :term:`Build Directory` in
       which the OpenEmbedded build system places generated objects during a
       recipe's build process. By default, this directory is the same as the
-      :term:`S` directory, which is defined as:
-      ::
+      :term:`S` directory, which is defined as::
 
          S = "${WORKDIR}/${BP}"
 
@@ -301,15 +290,13 @@ system and gives an overview of their function and contents.
       packages are packages installed only through the
       :term:`RRECOMMENDS` variable. You can prevent any
       of these "recommended" packages from being installed by listing them
-      with the ``BAD_RECOMMENDATIONS`` variable:
-      ::
+      with the ``BAD_RECOMMENDATIONS`` variable::
 
          BAD_RECOMMENDATIONS = "package_name package_name package_name ..."
 
       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override:
-      ::
+      override::
 
          BAD_RECOMMENDATIONS_pn-target_image = "package_name"
 
@@ -394,8 +381,7 @@ system and gives an overview of their function and contents.
 
       You can change the default behavior by setting this variable to "1",
       "yes", or "true" in your ``local.conf`` file, which is located in the
-      :term:`Build Directory`: Here is an example:
-      ::
+      :term:`Build Directory`: Here is an example::
 
          BB_DANGLINGAPPENDS_WARNONLY = "1"
 
@@ -444,8 +430,7 @@ system and gives an overview of their function and contents.
                not specify G, M, or K, Kbytes is assumed by
                default.  Do not use GB, MB, or KB.
 
-      Here are some examples:
-      ::
+      Here are some examples::
 
          BB_DISKMON_DIRS = "ABORT,${TMPDIR},1G,100K WARN,${SSTATE_DIR},1G,100K"
          BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},1G"
@@ -485,8 +470,7 @@ system and gives an overview of their function and contents.
 
       If you do not provide a ``BB_DISKMON_WARNINTERVAL`` variable and you
       do use ``BB_DISKMON_DIRS`` with the "WARN" action, the disk
-      monitoring interval defaults to the following:
-      ::
+      monitoring interval defaults to the following::
 
          BB_DISKMON_WARNINTERVAL = "50M,5K"
 
@@ -509,8 +493,7 @@ system and gives an overview of their function and contents.
                G, M, or K for Gbytes, Mbytes, or Kbytes,
                respectively. You cannot use GB, MB, or KB.
 
-      Here is an example:
-      ::
+      Here is an example::
 
          BB_DISKMON_DIRS = "WARN,${SSTATE_DIR},1G,100K"
          BB_DISKMON_WARNINTERVAL = "50M,5K"
@@ -566,8 +549,7 @@ system and gives an overview of their function and contents.
       long the BitBake server stays resident between invocations.
 
       For example, the following statement in your ``local.conf`` file
-      instructs the server to be unloaded after 20 seconds of inactivity:
-      ::
+      instructs the server to be unloaded after 20 seconds of inactivity::
 
          BB_SERVER_TIMEOUT = "20"
 
@@ -585,8 +567,7 @@ system and gives an overview of their function and contents.
       "``multilib:``\ multilib_name".
 
       To build a different variant of the recipe with a minimal amount of
-      code, it usually is as simple as adding the following to your recipe:
-      ::
+      code, it usually is as simple as adding the following to your recipe::
 
          BBCLASSEXTEND =+ "native nativesdk"
          BBCLASSEXTEND =+ "multilib:multilib_name"
@@ -662,8 +643,7 @@ system and gives an overview of their function and contents.
 
       Use the following form for ``BBFILES_DYNAMIC``:
       collection_name:filename_pattern The following example identifies two
-      collection names and two filename patterns:
-      ::
+      collection names and two filename patterns::
 
          BBFILES_DYNAMIC += " \
             clang-layer:${LAYERDIR}/bbappends/meta-clang/*/*/*.bbappend \
@@ -691,8 +671,7 @@ system and gives an overview of their function and contents.
    :term:`BBLAYERS`
       Lists the layers to enable during the build. This variable is defined
       in the ``bblayers.conf`` configuration file in the :term:`Build Directory`.
-      Here is an example:
-      ::
+      Here is an example::
 
          BBLAYERS = " \
              /home/scottrif/poky/meta \
@@ -721,8 +700,7 @@ system and gives an overview of their function and contents.
 
       The following example uses a complete regular expression to tell
       BitBake to ignore all recipe and recipe append files in the
-      ``meta-ti/recipes-misc/`` directory:
-      ::
+      ``meta-ti/recipes-misc/`` directory::
 
          BBMASK = "meta-ti/recipes-misc/"
 
@@ -746,8 +724,7 @@ system and gives an overview of their function and contents.
       building targets with multiple configurations. Use this variable in
       your ``conf/local.conf`` configuration file. Specify a
       multiconfigname for each configuration file you are using. For
-      example, the following line specifies three configuration files:
-      ::
+      example, the following line specifies three configuration files::
 
          BBMULTICONFIG = "configA configB configC"
 
@@ -770,8 +747,7 @@ system and gives an overview of their function and contents.
          If you run BitBake from a directory outside of the
          :term:`Build Directory`, you must be sure to set ``BBPATH``
          to point to the Build Directory. Set the variable as you would any
-         environment variable and then run BitBake:
-         ::
+         environment variable and then run BitBake::
 
                  $ BBPATH = "build_directory"
                  $ export BBPATH
@@ -783,8 +759,7 @@ system and gives an overview of their function and contents.
       BitBake remote server.
 
       Use the following format to export the variable to the BitBake
-      environment:
-      ::
+      environment::
 
          export BBSERVER=localhost:$port
 
@@ -803,8 +778,7 @@ system and gives an overview of their function and contents.
       replaced.
 
       To add multiple scripts, separate them by spaces. Here is an example
-      from the ``libpng`` recipe:
-      ::
+      from the ``libpng`` recipe::
 
          BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
@@ -834,8 +808,7 @@ system and gives an overview of their function and contents.
    :term:`BP`
       The base recipe name and version but without any special recipe name
       suffix (i.e. ``-native``, ``lib64-``, and so forth). ``BP`` is
-      comprised of the following:
-      ::
+      comprised of the following::
 
          ${BPN}-${PV}
 
@@ -975,8 +948,7 @@ system and gives an overview of their function and contents.
       you should set this value to "1".
 
       By default, the ``buildhistory`` class does not commit the build
-      history output in a local Git repository:
-      ::
+      history output in a local Git repository::
 
          BUILDHISTORY_COMMIT ?= "0"
 
@@ -992,8 +964,7 @@ system and gives an overview of their function and contents.
       email@host". Providing an email address or host that is not valid
       does not produce an error.
 
-      By default, the ``buildhistory`` class sets the variable as follows:
-      ::
+      By default, the ``buildhistory`` class sets the variable as follows::
 
          BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 
@@ -1003,8 +974,7 @@ system and gives an overview of their function and contents.
       information is kept. For more information on how the variable works,
       see the ``buildhistory.class``.
 
-      By default, the ``buildhistory`` class sets the directory as follows:
-      ::
+      By default, the ``buildhistory`` class sets the directory as follows::
 
          BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 
@@ -1032,8 +1002,7 @@ system and gives an overview of their function and contents.
          each file staged (i.e. the output of the task).
 
       By default, the ``buildhistory`` class enables the following
-      features:
-      ::
+      features::
 
          BUILDHISTORY_FEATURES ?= "image package sdk"
 
@@ -1049,8 +1018,7 @@ system and gives an overview of their function and contents.
       Consequently, you can include files that might not always be present.
 
       By default, the ``buildhistory`` class provides paths to the
-      following files:
-      ::
+      following files::
 
          BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 
@@ -1067,8 +1035,7 @@ system and gives an overview of their function and contents.
       that you have set up manually using ``git remote`` within the local
       repository.
 
-      By default, the ``buildhistory`` class sets the variable as follows:
-      ::
+      By default, the ``buildhistory`` class sets the variable as follows::
 
          BUILDHISTORY_PUSH_REPO ?= ""
 
@@ -1152,8 +1119,7 @@ system and gives an overview of their function and contents.
          ``bitbake.conf`` file.
 
       As an example, the following override allows you to install extra
-      files, but only when building for the target:
-      ::
+      files, but only when building for the target::
 
          do_install_append_class-target() {
              install my-extra-file ${D}${sysconfdir}
@@ -1161,8 +1127,7 @@ system and gives an overview of their function and contents.
 
       Here is an example where ``FOO`` is set to
       "native" when building for the build host, and to "other" when not
-      building for the build host:
-      ::
+      building for the build host::
 
          FOO_class-native = "native"
          FOO = "other"
@@ -1235,8 +1200,7 @@ system and gives an overview of their function and contents.
 
       To add a new feature item pointing to a wildcard, use a variable flag
       to specify the feature item name and use the value to specify the
-      wildcard. Here is an example:
-      ::
+      wildcard. Here is an example::
 
          COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
 
@@ -1268,8 +1232,7 @@ system and gives an overview of their function and contents.
 
       To use the ``CONFFILES`` variable, provide a package name override
       that identifies the resulting package. Then, provide a
-      space-separated list of files. Here is an example:
-      ::
+      space-separated list of files. Here is an example::
 
          CONFFILES_${PN} += "${sysconfdir}/file1 \
              ${sysconfdir}/file2 ${sysconfdir}/file3"
@@ -1524,8 +1487,7 @@ system and gives an overview of their function and contents.
       The destination directory. The location in the :term:`Build Directory`
       where components are installed by the
       :ref:`ref-tasks-install` task. This location defaults
-      to:
-      ::
+      to::
 
          ${WORKDIR}/image
 
@@ -1547,8 +1509,7 @@ system and gives an overview of their function and contents.
       which is the default behavior, ``DEBIAN_NOAUTONAME`` specifies a
       particular package should not be renamed according to Debian library
       package naming. You must use the package name as an override when you
-      set this variable. Here is an example from the ``fontconfig`` recipe:
-      ::
+      set this variable. Here is an example from the ``fontconfig`` recipe::
 
          DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
@@ -1558,8 +1519,7 @@ system and gives an overview of their function and contents.
       the library name for an individual package. Overriding the library
       name in these cases is rare. You must use the package name as an
       override when you set this variable. Here is an example from the
-      ``dbus`` recipe:
-      ::
+      ``dbus`` recipe::
 
          DEBIANNAME_${PN} = "dbus-1"
 
@@ -1610,8 +1570,7 @@ system and gives an overview of their function and contents.
       needed by the recipe at build time.
 
       As an example, consider a recipe ``foo`` that contains the following
-      assignment:
-      ::
+      assignment::
 
           DEPENDS = "bar"
 
@@ -1635,8 +1594,7 @@ system and gives an overview of their function and contents.
       As another example, ``DEPENDS`` can also be used to add utilities
       that run on the build machine during the build. For example, a recipe
       that makes use of a code generator built by the recipe ``codegen``
-      might have the following:
-      ::
+      might have the following::
 
          DEPENDS = "codegen-native"
 
@@ -1702,8 +1660,7 @@ system and gives an overview of their function and contents.
 
       The BitBake configuration file initially defines the
       ``DEPLOY_DIR_DEB`` variable as a sub-folder of
-      :term:`DEPLOY_DIR`:
-      ::
+      :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 
@@ -1738,8 +1695,7 @@ system and gives an overview of their function and contents.
       "package_ipk".
 
       The BitBake configuration file initially defines this variable as a
-      sub-folder of :term:`DEPLOY_DIR`:
-      ::
+      sub-folder of :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 
@@ -1759,8 +1715,7 @@ system and gives an overview of their function and contents.
       "package_rpm".
 
       The BitBake configuration file initially defines this variable as a
-      sub-folder of :term:`DEPLOY_DIR`:
-      ::
+      sub-folder of :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 
@@ -1780,8 +1735,7 @@ system and gives an overview of their function and contents.
       "package_tar".
 
       The BitBake configuration file initially defines this variable as a
-      sub-folder of :term:`DEPLOY_DIR`:
-      ::
+      sub-folder of :term:`DEPLOY_DIR`::
 
          DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 
@@ -1796,8 +1750,7 @@ system and gives an overview of their function and contents.
    :term:`DEPLOYDIR`
       When inheriting the :ref:`deploy <ref-classes-deploy>` class, the
       ``DEPLOYDIR`` points to a temporary work area for deployed files that
-      is set in the ``deploy`` class as follows:
-      ::
+      is set in the ``deploy`` class as follows::
 
          DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 
@@ -1824,8 +1777,7 @@ system and gives an overview of their function and contents.
       :term:`Source Directory`.
 
       Within that ``poky.conf`` file, the ``DISTRO`` variable is set as
-      follows:
-      ::
+      follows::
 
          DISTRO = "poky"
 
@@ -1899,8 +1851,7 @@ system and gives an overview of their function and contents.
       able to reuse the default
       :term:`DISTRO_FEATURES` options without the
       need to write out the full set. Here is an example that uses
-      ``DISTRO_FEATURES_DEFAULT`` from a custom distro configuration file:
-      ::
+      ``DISTRO_FEATURES_DEFAULT`` from a custom distro configuration file::
 
          DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} myfeature"
 
@@ -1948,8 +1899,7 @@ system and gives an overview of their function and contents.
       of the :term:`Source Directory`.
 
       Within that ``poky.conf`` file, the ``DISTRO_NAME`` variable is set
-      as follows:
-      ::
+      as follows::
 
          DISTRO_NAME = "Poky (Yocto Project Reference Distro)"
 
@@ -2065,8 +2015,7 @@ system and gives an overview of their function and contents.
 
       You can set ``ERR_REPORT_DIR`` to the path you want the error
       reporting tool to store the debug files as follows in your
-      ``local.conf`` file:
-      ::
+      ``local.conf`` file::
 
          ERR_REPORT_DIR = "path"
 
@@ -2094,8 +2043,7 @@ system and gives an overview of their function and contents.
       package's particular libraries only and not the whole package.
 
       Use the ``EXCLUDE_FROM_SHLIBS`` variable by setting it to "1" for a
-      particular package:
-      ::
+      particular package::
 
          EXCLUDE_FROM_SHLIBS = "1"
 
@@ -2129,8 +2077,7 @@ system and gives an overview of their function and contents.
       The full package version specification as it appears on the final
       packages produced by a recipe. The variable's value is normally used
       to fix a runtime dependency to the exact same version of another
-      package in the same recipe:
-      ::
+      package in the same recipe::
 
          RDEPENDS_${PN}-additional-module = "${PN} (= ${EXTENDPKGV})"
 
@@ -2230,8 +2177,7 @@ system and gives an overview of their function and contents.
       Specifies additional options for the image creation command that has
       been specified in :term:`IMAGE_CMD`. When setting
       this variable, use an override for the associated image type. Here is
-      an example:
-      ::
+      an example::
 
          EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 
@@ -2255,8 +2201,7 @@ system and gives an overview of their function and contents.
       added to the beginning of the environment variable ``PATH``. As an
       example, the following prepends
       "${STAGING_BINDIR_NATIVE}/foo:${STAGING_BINDIR_NATIVE}/bar:" to
-      ``PATH``:
-      ::
+      ``PATH``::
 
          EXTRANATIVEPATH = "foo bar"
 
@@ -2294,8 +2239,7 @@ system and gives an overview of their function and contents.
 
       The set list of commands you can configure using the
       ``EXTRA_USERS_PARAMS`` is shown in the ``extrausers`` class. These
-      commands map to the normal Unix commands of the same names:
-      ::
+      commands map to the normal Unix commands of the same names::
 
          # EXTRA_USERS_PARAMS = "\
          # useradd -p '' tester; \
@@ -2321,8 +2265,7 @@ system and gives an overview of their function and contents.
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
       When setting the value, ``FEATURE_PACKAGES`` should have the name of
-      the feature item as an override. Here is an example:
-      ::
+      the feature item as an override. Here is an example::
 
          FEATURE_PACKAGES_widget = "package1 package2"
 
@@ -2342,8 +2285,7 @@ system and gives an overview of their function and contents.
       OPKG to support runtime package management of IPK packages. You set
       this variable in your ``local.conf`` file.
 
-      Consider the following example:
-      ::
+      Consider the following example::
 
          FEED_DEPLOYDIR_BASE_URI = "http://192.168.7.1/BOARD-dir"
 
@@ -2362,8 +2304,7 @@ system and gives an overview of their function and contents.
       To use the ``FILES`` variable, provide a package name override that
       identifies the resulting package. Then, provide a space-separated
       list of files or paths that identify the files you want included as
-      part of the resulting package. Here is an example:
-      ::
+      part of the resulting package. Here is an example::
 
          FILES_${PN} += "${bindir}/mydir1 ${bindir}/mydir2/myfile"
 
@@ -2398,8 +2339,7 @@ system and gives an overview of their function and contents.
       symbolic link (symlink) for shared libraries on the target platform.
 
       The following statement from the ``bitbake.conf`` shows how it is
-      set:
-      ::
+      set::
 
          FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
 
@@ -2413,8 +2353,7 @@ system and gives an overview of their function and contents.
 
       Best practices dictate that you accomplish this by using
       ``FILESEXTRAPATHS`` from within a ``.bbappend`` file and that you
-      prepend paths as follows:
-      ::
+      prepend paths as follows::
 
          FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -2436,8 +2375,7 @@ system and gives an overview of their function and contents.
          are directing BitBake to extend the path by prepending directories
          to the search path.
 
-      Here is another common use:
-      ::
+      Here is another common use::
 
          FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
@@ -2445,15 +2383,13 @@ system and gives an overview of their function and contents.
       ``FILESPATH`` variable to include a directory named ``files`` that is
       in the same directory as the corresponding append file.
 
-      This next example specifically adds three paths:
-      ::
+      This next example specifically adds three paths::
 
          FILESEXTRAPATHS_prepend := "path_1:path_2:path_3:"
 
       A final example shows how you can extend the search path and include
       a :term:`MACHINE`-specific override, which is useful
-      in a BSP layer:
-      ::
+      in a BSP layer::
 
           FILESEXTRAPATHS_prepend_intel-x86-common := "${THISDIR}/${PN}:"
 
@@ -2485,8 +2421,7 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
       section of the BitBake User Manual.
 
-      By default, the ``FILESOVERRIDES`` variable is defined as:
-      ::
+      By default, the ``FILESOVERRIDES`` variable is defined as::
 
          FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
@@ -2507,8 +2442,7 @@ system and gives an overview of their function and contents.
 
       The default value for the ``FILESPATH`` variable is defined in the
       ``base.bbclass`` class found in ``meta/classes`` in the
-      :term:`Source Directory`:
-      ::
+      :term:`Source Directory`::
 
          FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
              "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
@@ -2533,8 +2467,7 @@ system and gives an overview of their function and contents.
 
       You can take advantage of this searching behavior in useful ways. For
       example, consider a case where the following directory structure
-      exists for general and machine-specific configurations:
-      ::
+      exists for general and machine-specific configurations::
 
          files/defconfig
          files/MACHINEA/defconfig
@@ -2662,16 +2595,14 @@ system and gives an overview of their function and contents.
       Programming (ROP) attacks much more difficult to execute.
 
       By default the ``security_flags.inc`` file enables PIE by setting the
-      variable as follows:
-      ::
+      variable as follows::
 
          GCCPIE ?= "--enable-default-pie"
 
    :term:`GCCVERSION`
       Specifies the default version of the GNU C Compiler (GCC) used for
       compilation. By default, ``GCCVERSION`` is set to "8.x" in the
-      ``meta/conf/distro/include/tcmode-default.inc`` include file:
-      ::
+      ``meta/conf/distro/include/tcmode-default.inc`` include file::
 
          GCCVERSION ?= "8.%"
 
@@ -2706,8 +2637,7 @@ system and gives an overview of their function and contents.
       passed to the ``groupadd`` command if you wish to add a group to the
       system when the package is installed.
 
-      Here is an example from the ``dbus`` recipe:
-      ::
+      Here is an example from the ``dbus`` recipe::
 
          GROUPADD_PARAM_${PN} = "-r netdev"
 
@@ -2855,13 +2785,11 @@ system and gives an overview of their function and contents.
       section.
 
       Setting this variable to "1" in your ``local.conf`` disables the
-      function:
-      ::
+      function::
 
          ICECC_DISABLED ??= "1"
 
-      To enable the function, set the variable as follows:
-      ::
+      To enable the function, set the variable as follows::
 
          ICECC_DISABLED = ""
 
@@ -2946,8 +2874,7 @@ system and gives an overview of their function and contents.
       installed name, separate it from the original name with a semi-colon
       (;). Source files need to be located in
       :term:`DEPLOY_DIR_IMAGE`. Here are two
-      examples:
-      ::
+      examples::
 
          IMAGE_EFI_BOOT_FILES = "${KERNEL_IMAGETYPE};bz2"
          IMAGE_EFI_BOOT_FILES = "${KERNEL_IMAGETYPE} microcode.cpio"
@@ -2956,8 +2883,7 @@ system and gives an overview of their function and contents.
       this case, the destination file must have the same name as the base
       name of the source file path. To install files into a directory
       within the target location, pass its name after a semi-colon (;).
-      Here are two examples:
-      ::
+      Here are two examples::
 
          IMAGE_EFI_BOOT_FILES = "boot/loader/*"
          IMAGE_EFI_BOOT_FILES = "boot/loader/*;boot/"
@@ -2982,8 +2908,7 @@ system and gives an overview of their function and contents.
       installed name, separate it from the original name with a semi-colon
       (;). Source files need to be located in
       :term:`DEPLOY_DIR_IMAGE`. Here are two
-      examples:
-      ::
+      examples::
 
          IMAGE_BOOT_FILES = "u-boot.img uImage;kernel"
          IMAGE_BOOT_FILES = "u-boot.${UBOOT_SUFFIX} ${KERNEL_IMAGETYPE}"
@@ -2992,8 +2917,7 @@ system and gives an overview of their function and contents.
       this case, the destination file must have the same name as the base
       name of the source file path. To install files into a directory
       within the target location, pass its name after a semi-colon (;).
-      Here are two examples:
-      ::
+      Here are two examples::
 
          IMAGE_BOOT_FILES = "bcm2835-bootfiles/*"
          IMAGE_BOOT_FILES = "bcm2835-bootfiles/*;boot/"
@@ -3026,8 +2950,7 @@ system and gives an overview of their function and contents.
       type, which corresponds to the value set in
       :term:`IMAGE_FSTYPES`, (e.g. ``ext3``,
       ``btrfs``, and so forth). When setting this variable, you should use
-      an override for the associated type. Here is an example:
-      ::
+      an override for the associated type. Here is an example::
 
          IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} \
              --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
@@ -3071,8 +2994,7 @@ system and gives an overview of their function and contents.
       Specifies the formats the OpenEmbedded build system uses during the
       build when creating the root filesystem. For example, setting
       ``IMAGE_FSTYPES`` as follows causes the build system to create root
-      filesystems using two formats: ``.ext3`` and ``.tar.bz2``:
-      ::
+      filesystems using two formats: ``.ext3`` and ``.tar.bz2``::
 
          IMAGE_FSTYPES = "ext3 tar.bz2"
 
@@ -3103,8 +3025,7 @@ system and gives an overview of their function and contents.
       auto-generated entries in ``IMAGE_INSTALL`` in addition to its
       default contents.
 
-      When you use this variable, it is best to use it as follows:
-      ::
+      When you use this variable, it is best to use it as follows::
 
          IMAGE_INSTALL_append = " package-name"
 
@@ -3147,8 +3068,7 @@ system and gives an overview of their function and contents.
       into separate packages. Setting the ``IMAGE_LINGUAS`` variable
       ensures that any locale packages that correspond to packages already
       selected for installation into the image are also installed. Here is
-      an example:
-      ::
+      an example::
 
          IMAGE_LINGUAS = "pt-br de-de"
 
@@ -3167,8 +3087,7 @@ system and gives an overview of their function and contents.
       The name of the output image symlink (which does not include
       the version part as :term:`IMAGE_NAME` does). The default value
       is derived using the :term:`IMAGE_BASENAME` and :term:`MACHINE`
-      variables:
-      ::
+      variables::
 
          IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
 
@@ -3176,14 +3095,12 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_MANIFEST`
       The manifest file for the image. This file lists all the installed
       packages that make up the image. The file contains package
-      information on a line-per-package basis as follows:
-      ::
+      information on a line-per-package basis as follows::
 
           packagename packagearch version
 
       The :ref:`image <ref-classes-image>` class defines the manifest
-      file as follows:
-      ::
+      file as follows::
 
          IMAGE_MANIFEST ="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
 
@@ -3197,8 +3114,7 @@ system and gives an overview of their function and contents.
       The name of the output image files minus the extension. This variable
       is derived using the :term:`IMAGE_BASENAME`,
       :term:`MACHINE`, and :term:`IMAGE_VERSION_SUFFIX`
-      variables:
-      ::
+      variables::
 
          IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
@@ -3229,8 +3145,7 @@ system and gives an overview of their function and contents.
       to boot and allows for basic post installs while still leaving a
       small amount of free disk space. If 30% free space is inadequate, you
       can increase the default value. For example, the following setting
-      gives you 50% free space added to the image:
-      ::
+      gives you 50% free space added to the image::
 
          IMAGE_OVERHEAD_FACTOR = "1.5"
 
@@ -3271,8 +3186,7 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the final image output files. You can specify
-      functions separated by semicolons:
-      ::
+      functions separated by semicolons::
 
          IMAGE_POSTPROCESS_COMMAND += "function; ... "
 
@@ -3285,8 +3199,7 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded build
       system creates the final image output files. You can specify
-      functions separated by semicolons:
-      ::
+      functions separated by semicolons::
 
          IMAGE_PREPROCESS_COMMAND += "function; ... "
 
@@ -3317,14 +3230,12 @@ system and gives an overview of their function and contents.
       This variable is particularly useful when you want to ensure that a
       specific amount of free disk space is available on a device after an
       image is installed and running. For example, to be sure 5 Gbytes of
-      free disk space is available, set the variable as follows:
-      ::
+      free disk space is available, set the variable as follows::
 
          IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
 
       For example, the Yocto Project Build Appliance specifically requests
-      40 Gbytes of extra space with the line:
-      ::
+      40 Gbytes of extra space with the line::
 
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
@@ -3335,8 +3246,7 @@ system and gives an overview of their function and contents.
       the generated image, a requested size for the image, and requested
       additional free disk space to be added to the image. Programatically,
       the build system determines the final size of the generated image as
-      follows:
-      ::
+      follows::
 
          if (image-du * overhead) < rootfs-size:
              internal-rootfs-size = rootfs-size + xspace
@@ -3355,8 +3265,7 @@ system and gives an overview of their function and contents.
 
    :term:`IMAGE_TYPEDEP`
       Specifies a dependency from one image type on another. Here is an
-      example from the :ref:`image-live <ref-classes-image-live>` class:
-      ::
+      example from the :ref:`image-live <ref-classes-image-live>` class::
 
          IMAGE_TYPEDEP_live = "ext3"
 
@@ -3443,8 +3352,7 @@ system and gives an overview of their function and contents.
       variable. Once the variable is defined in the ``include`` file, you
       can use the variable to set the ``PR`` values in each recipe. You
       will notice that when you set a recipe's ``PR`` you can provide more
-      granular revisioning by appending values to the ``INC_PR`` variable:
-      ::
+      granular revisioning by appending values to the ``INC_PR`` variable::
 
          recipes-graphics/xorg-font/xorg-font-common.inc:INC_PR = "r2"
          recipes-graphics/xorg-font/encodings_1.0.4.bb:PR = "${INC_PR}.1"
@@ -3467,8 +3375,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          This functionality is only regularly tested using the following
-         setting:
-         ::
+         setting::
 
                  INCOMPATIBLE_LICENSE = "GPL-3.0 LGPL-3.0 AGPL-3.0"
 
@@ -3482,8 +3389,7 @@ system and gives an overview of their function and contents.
          It is possible to define a list of licenses that are allowed to be
          used instead of the licenses that are excluded. To do this, define
          a variable ``COMPATIBLE_LICENSES`` with the names of the licenses
-         that are allowed. Then define ``INCOMPATIBLE_LICENSE`` as:
-         ::
+         that are allowed. Then define ``INCOMPATIBLE_LICENSE`` as::
 
                  INCOMPATIBLE_LICENSE = "${@' '.join(sorted(set(d.getVar('AVAILABLE_LICENSES').split()) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"
 
@@ -3508,8 +3414,7 @@ system and gives an overview of their function and contents.
       unlikely that you want to edit this variable.
 
       The default value of the variable is set as follows in the
-      ``meta/conf/distro/defaultsetup.conf`` file:
-      ::
+      ``meta/conf/distro/defaultsetup.conf`` file::
 
          INHERIT_DISTRO ?= "debian devshell sstate license"
 
@@ -3533,8 +3438,7 @@ system and gives an overview of their function and contents.
 
       To prevent the build system from splitting out debug information
       during packaging, set the ``INHIBIT_PACKAGE_DEBUG_SPLIT`` variable as
-      follows:
-      ::
+      follows::
 
          INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
@@ -3646,15 +3550,13 @@ system and gives an overview of their function and contents.
 
       Setting the variable to "1" in a configuration file causes the
       OpenEmbedded build system to generate a kernel image with the
-      initramfs specified in ``INITRAMFS_IMAGE`` bundled within:
-      ::
+      initramfs specified in ``INITRAMFS_IMAGE`` bundled within::
 
          INITRAMFS_IMAGE_BUNDLE = "1"
 
       By default, the
       :ref:`kernel <ref-classes-kernel>` class sets this variable to a
-      null string as follows:
-      ::
+      null string as follows::
 
          INITRAMFS_IMAGE_BUNDLE ?= ""
 
@@ -3672,15 +3574,13 @@ system and gives an overview of their function and contents.
    :term:`INITRAMFS_LINK_NAME`
       The link name of the initial RAM filesystem image. This variable is
       set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
-      follows:
-      ::
+      follows::
 
          INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value of the
       ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the same
-      file, has the following value:
-      ::
+      file, has the following value::
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -3690,14 +3590,12 @@ system and gives an overview of their function and contents.
    :term:`INITRAMFS_NAME`
       The base name of the initial RAM filesystem image. This variable is
       set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
-      follows:
-      ::
+      follows::
 
          INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
 
       The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value:
-      ::
+      variable, which is set in the same file, has the following value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
@@ -3735,8 +3633,7 @@ system and gives an overview of their function and contents.
       variable.
 
    :term:`INITSCRIPT_PARAMS`
-      Specifies the options to pass to ``update-rc.d``. Here is an example:
-      ::
+      Specifies the options to pass to ``update-rc.d``. Here is an example::
 
          INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
@@ -3756,8 +3653,7 @@ system and gives an overview of their function and contents.
       recipe. For example, to skip the check for symbolic link ``.so``
       files in the main package of a recipe, add the following to the
       recipe. The package name override must be used, which in this example
-      is ``${PN}``:
-      ::
+      is ``${PN}``::
 
          INSANE_SKIP_${PN} += "dev-so"
 
@@ -3799,8 +3695,7 @@ system and gives an overview of their function and contents.
       kernel's append file. For example, if you are using the
       ``linux-yocto_4.12`` kernel, the kernel recipe file is the
       ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` file. ``KBRANCH``
-      is set as follows in that kernel recipe file:
-      ::
+      is set as follows in that kernel recipe file::
 
          KBRANCH ?= "standard/base"
 
@@ -3812,8 +3707,7 @@ system and gives an overview of their function and contents.
       Beaglebone, EdgeRouter, and generic versions of both 32 and 64-bit IA
       machines (``meta-yocto-bsp``) is named
       ``meta-yocto-bsp/recipes-kernel/linux/linux-yocto_4.12.bbappend``.
-      Here are the related statements from that append file:
-      ::
+      Here are the related statements from that append file::
 
          KBRANCH_genericx86 = "standard/base"
          KBRANCH_genericx86-64 = "standard/base"
@@ -3839,19 +3733,16 @@ system and gives an overview of their function and contents.
       ``defconfig`` file.
 
       To use the variable, set it in the append file for your kernel recipe
-      using the following form:
-      ::
+      using the following form::
 
          KBUILD_DEFCONFIG_KMACHINE ?= defconfig_file
 
       Here is an example from a "raspberrypi2" ``KMACHINE`` build that uses
-      a ``defconfig`` file named "bcm2709_defconfig":
-      ::
+      a ``defconfig`` file named "bcm2709_defconfig"::
 
          KBUILD_DEFCONFIG_raspberrypi2 = "bcm2709_defconfig"
 
-      As an alternative, you can use the following within your append file:
-      ::
+      As an alternative, you can use the following within your append file::
 
          KBUILD_DEFCONFIG_pn-linux-yocto ?= defconfig_file
 
@@ -3872,8 +3763,7 @@ system and gives an overview of their function and contents.
 
       The value of ``KERNEL_ARTIFACT_NAME``, which is set in the
       ``meta/classes/kernel-artifact-names.bbclass`` file, has the
-      following default value:
-      ::
+      following default value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
@@ -3905,15 +3795,13 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
-      follows:
-      ::
+      follows::
 
          KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The
       value of the ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in
-      the same file, has the following value:
-      ::
+      the same file, has the following value::
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -3923,14 +3811,12 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_DTB_NAME`
       The base name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
-      follows:
-      ::
+      follows::
 
          KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
       The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value:
-      ::
+      variable, which is set in the same file, has the following value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
@@ -3965,8 +3851,7 @@ system and gives an overview of their function and contents.
       For example, the following example from the ``linux-yocto-rt_4.12``
       kernel recipe adds "netfilter" and "taskstats" features to all BSPs
       as well as "virtio" configurations to all QEMU machines. The last two
-      statements add specific configurations to targeted machine types:
-      ::
+      statements add specific configurations to targeted machine types::
 
          KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
          KERNEL_FEATURES_append = "${KERNEL_EXTRA_FEATURES}"
@@ -3977,15 +3862,13 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
       variable is set in the ``meta/classes/kernel-artifact-names.bbclass``
-      file as follows:
-      ::
+      file as follows::
 
          KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value of the
       ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the same
-      file, has the following value:
-      ::
+      file, has the following value::
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -3995,28 +3878,24 @@ system and gives an overview of their function and contents.
    :term:`KERNEL_FIT_NAME`
       The base name of the kernel flattened image tree (FIT) image. This
       variable is set in the ``meta/classes/kernel-artifact-names.bbclass``
-      file as follows:
-      ::
+      file as follows::
 
          KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
       The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value:
-      ::
+      variable, which is set in the same file, has the following value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
    :term:`KERNEL_IMAGE_LINK_NAME`
       The link name for the kernel image. This variable is set in the
-      ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
-      ::
+      ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
 
          KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value of
       the ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the same
-      file, has the following value:
-      ::
+      file, has the following value::
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -4038,15 +3917,13 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_IMAGE_NAME`
       The base name of the kernel image. This variable is set in the
-      ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
-      ::
+      ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
 
          KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
       The value of the
       :term:`KERNEL_ARTIFACT_NAME` variable,
-      which is set in the same file, has the following value:
-      ::
+      which is set in the same file, has the following value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
@@ -4074,8 +3951,7 @@ system and gives an overview of their function and contents.
       configuration file, an append file for the recipe, or the recipe
       itself).
 
-      Specify it as follows:
-      ::
+      Specify it as follows::
 
          KERNEL_MODULE_AUTOLOAD += "module_name1 module_name2 module_name3"
 
@@ -4083,8 +3959,7 @@ system and gives an overview of their function and contents.
       system to populate the ``/etc/modules-load.d/modname.conf`` file with
       the list of modules to be auto-loaded on boot. The modules appear
       one-per-line in the file. Here is an example of the most common use
-      case:
-      ::
+      case::
 
          KERNEL_MODULE_AUTOLOAD += "module_name"
 
@@ -4146,8 +4021,7 @@ system and gives an overview of their function and contents.
       Provides a short description of a configuration fragment. You use
       this variable in the ``.scc`` file that describes a configuration
       fragment file. Here is the variable used in a file named ``smp.scc``
-      to describe SMP being enabled:
-      ::
+      to describe SMP being enabled::
 
           define KFEATURE_DESCRIPTION "Enable SMP"
 
@@ -4163,8 +4037,7 @@ system and gives an overview of their function and contents.
 
       These mappings between different names occur in the Yocto Linux
       Kernel's ``meta`` branch. As an example take a look in the
-      ``common/recipes-kernel/linux/linux-yocto_3.19.bbappend`` file:
-      ::
+      ``common/recipes-kernel/linux/linux-yocto_3.19.bbappend`` file::
 
          LINUX_VERSION_core2-32-intel-common = "3.19.0"
          COMPATIBLE_MACHINE_core2-32-intel-common = "${MACHINE}"
@@ -4202,8 +4075,7 @@ system and gives an overview of their function and contents.
    :term:`LAYERDEPENDS`
       Lists the layers, separated by spaces, on which this recipe depends.
       Optionally, you can specify a specific layer version for a dependency
-      by adding it to the end of the layer name. Here is an example:
-      ::
+      by adding it to the end of the layer name. Here is an example::
 
          LAYERDEPENDS_mylayer = "anotherlayer (=3)"
 
@@ -4228,8 +4100,7 @@ system and gives an overview of their function and contents.
 
       Optionally, you can specify a specific layer version for a
       recommendation by adding the version to the end of the layer name.
-      Here is an example:
-      ::
+      Here is an example::
 
          LAYERRECOMMENDS_mylayer = "anotherlayer (=3)"
 
@@ -4253,8 +4124,7 @@ system and gives an overview of their function and contents.
       For the list, use the Yocto Project
       :yocto_wiki:`Release Name </Releases>` (e.g.
       &DISTRO_NAME_NO_CAP;). To specify multiple OE-Core versions for the
-      layer, use a space-separated list:
-      ::
+      layer, use a space-separated list::
 
          LAYERSERIES_COMPAT_layer_root_name = "&DISTRO_NAME_NO_CAP; &DISTRO_NAME_NO_CAP_MINUS_ONE;"
 
@@ -4335,8 +4205,7 @@ system and gives an overview of their function and contents.
          :term:`SPDXLICENSEMAP` flag names defined in
          ``meta/conf/licenses.conf``.
 
-      Here are some examples:
-      ::
+      Here are some examples::
 
          LICENSE = "LGPLv2.1 | GPLv3"
          LICENSE = "MPL-1 & LGPLv2.1"
@@ -4353,8 +4222,7 @@ system and gives an overview of their function and contents.
       situations where components of the output have different licenses.
       For example, a piece of software whose code is licensed under GPLv2
       but has accompanying documentation licensed under the GNU Free
-      Documentation License 1.2 could be specified as follows:
-      ::
+      Documentation License 1.2 could be specified as follows::
 
          LICENSE = "GFDL-1.2 & GPLv2"
          LICENSE_${PN} = "GPLv2"
@@ -4409,8 +4277,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system uses ``COMMON_LICENSE_DIR`` to define the
       directory that holds common license text used during the build. The
       ``LICENSE_PATH`` variable allows you to extend that location to other
-      areas that have additional licenses:
-      ::
+      areas that have additional licenses::
 
          LICENSE_PATH += "path-to-additional-common-licenses"
 
@@ -4434,14 +4301,12 @@ system and gives an overview of their function and contents.
       being built using the OpenEmbedded build system is based. You define
       this variable in the kernel recipe. For example, the
       ``linux-yocto-3.4.bb`` kernel recipe found in
-      ``meta/recipes-kernel/linux`` defines the variables as follows:
-      ::
+      ``meta/recipes-kernel/linux`` defines the variables as follows::
 
          LINUX_VERSION ?= "3.4.24"
 
       The ``LINUX_VERSION`` variable is used to define :term:`PV`
-      for the recipe:
-      ::
+      for the recipe::
 
          PV = "${LINUX_VERSION}+git${SRCPV}"
 
@@ -4449,16 +4314,14 @@ system and gives an overview of their function and contents.
       A string extension compiled into the version string of the Linux
       kernel built with the OpenEmbedded build system. You define this
       variable in the kernel recipe. For example, the linux-yocto kernel
-      recipes all define the variable as follows:
-      ::
+      recipes all define the variable as follows::
 
          LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
       Defining this variable essentially sets the Linux kernel
       configuration item ``CONFIG_LOCALVERSION``, which is visible through
       the ``uname`` command. Here is an example that shows the extension
-      assuming it was set as previously shown:
-      ::
+      assuming it was set as previously shown::
 
          $ uname -r
          3.7.0-rc8-custom
@@ -4475,8 +4338,7 @@ system and gives an overview of their function and contents.
       ``MACHINE`` in the ``local.conf`` file found in the
       :term:`Build Directory`. By default, ``MACHINE`` is set to
       "qemux86", which is an x86-based architecture machine to be emulated
-      using QEMU:
-      ::
+      using QEMU::
 
          MACHINE ?= "qemux86"
 
@@ -4488,8 +4350,7 @@ system and gives an overview of their function and contents.
       ``meta/conf/machine``.
 
       The list of machines supported by the Yocto Project as shipped
-      include the following:
-      ::
+      include the following::
 
          MACHINE ?= "qemuarm"
          MACHINE ?= "qemuarm64"
@@ -4535,8 +4396,7 @@ system and gives an overview of their function and contents.
       As an example, suppose the machine for which you are building
       requires ``example-init`` to be run during boot to initialize the
       hardware. In this case, you would use the following in the machine's
-      ``.conf`` configuration file:
-      ::
+      ``.conf`` configuration file::
 
          MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "example-init"
 
@@ -4567,8 +4427,7 @@ system and gives an overview of their function and contents.
       "recommends" relationship so that in the latter case, the build will
       not fail due to the missing package. To accomplish this, assuming the
       package for the module was called ``kernel-module-ab123``, you would
-      use the following in the machine's ``.conf`` configuration file:
-      ::
+      use the following in the machine's ``.conf`` configuration file::
 
          MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "kernel-module-ab123"
 
@@ -4604,8 +4463,7 @@ system and gives an overview of their function and contents.
       exist, so it is acceptable for the build process to depend upon
       finding the package. In this case, assuming the package for the
       firmware was called ``wifidriver-firmware``, you would use the
-      following in the ``.conf`` file for the machine:
-      ::
+      following in the ``.conf`` file for the machine::
 
          MACHINE_EXTRA_RDEPENDS += "wifidriver-firmware"
 
@@ -4631,8 +4489,7 @@ system and gives an overview of their function and contents.
       the build to succeed instead of failing as a result of the package
       not being found. To accomplish this, assuming the package for the
       module was called ``kernel-module-examplewifi``, you would use the
-      following in the ``.conf`` file for the machine:
-      ::
+      following in the ``.conf`` file for the machine::
 
          MACHINE_EXTRA_RRECOMMENDS += "kernel-module-examplewifi"
 
@@ -4671,16 +4528,14 @@ system and gives an overview of their function and contents.
       should apply to a machine. For example, all machines emulated in QEMU
       (e.g. ``qemuarm``, ``qemux86``, and so forth) include a file named
       ``meta/conf/machine/include/qemu.inc`` that prepends the following
-      override to ``MACHINEOVERRIDES``:
-      ::
+      override to ``MACHINEOVERRIDES``::
 
          MACHINEOVERRIDES =. "qemuall:"
 
       This
       override allows variables to be overridden for all machines emulated
       in QEMU, like in the following example from the ``connman-conf``
-      recipe:
-      ::
+      recipe::
 
          SRC_URI_append_qemuall = " file://wired.config \
              file://wired-setup \
@@ -4734,27 +4589,23 @@ system and gives an overview of their function and contents.
       recipes by using :term:`DEPENDS`, then a dependency on
       "foo" will automatically get rewritten to a dependency on
       "nativesdk-foo". However, dependencies like the following will not
-      get rewritten automatically:
-      ::
+      get rewritten automatically::
 
          do_foo[depends] += "recipe:do_foo"
 
       If you want such a dependency to also get transformed, you can do the
-      following:
-      ::
+      following::
 
          do_foo[depends] += "${MLPREFIX}recipe:do_foo"
 
    module_autoload
       This variable has been replaced by the ``KERNEL_MODULE_AUTOLOAD``
       variable. You should replace all occurrences of ``module_autoload``
-      with additions to ``KERNEL_MODULE_AUTOLOAD``, for example:
-      ::
+      with additions to ``KERNEL_MODULE_AUTOLOAD``, for example::
 
          module_autoload_rfcomm = "rfcomm"
 
-      should now be replaced with:
-      ::
+      should now be replaced with::
 
          KERNEL_MODULE_AUTOLOAD += "rfcomm"
 
@@ -4773,8 +4624,7 @@ system and gives an overview of their function and contents.
       :term:`KERNEL_MODULE_AUTOLOAD`
       variable.
 
-      Here is the general syntax:
-      ::
+      Here is the general syntax::
 
          module_conf_module_name = "modprobe.d-syntax"
 
@@ -4786,8 +4636,7 @@ system and gives an overview of their function and contents.
       Including ``module_conf`` causes the OpenEmbedded build system to
       populate the ``/etc/modprobe.d/modname.conf`` file with
       ``modprobe.d`` syntax lines. Here is an example that adds the options
-      ``arg1`` and ``arg2`` to a module named ``mymodule``:
-      ::
+      ``arg1`` and ``arg2`` to a module named ``mymodule``::
 
          module_conf_mymodule = "options mymodule arg1=val1 arg2=val2"
 
@@ -4801,15 +4650,13 @@ system and gives an overview of their function and contents.
 
    :term:`MODULE_TARBALL_LINK_NAME`
       The link name of the kernel module tarball. This variable is set in
-      the ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
-      ::
+      the ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
 
          MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
       The value
       of the ``KERNEL_ARTIFACT_LINK_NAME`` variable, which is set in the
-      same file, has the following value:
-      ::
+      same file, has the following value::
 
          KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
@@ -4817,14 +4664,12 @@ system and gives an overview of their function and contents.
 
    :term:`MODULE_TARBALL_NAME`
       The base name of the kernel module tarball. This variable is set in
-      the ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
-      ::
+      the ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
 
          MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
       The value of the :term:`KERNEL_ARTIFACT_NAME` variable,
-      which is set in the same file, has the following value:
-      ::
+      which is set in the same file, has the following value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
@@ -4834,8 +4679,7 @@ system and gives an overview of their function and contents.
       target systems to be put into different subdirectories of the same
       output directory.
 
-      The default value of this variable is:
-      ::
+      The default value of this variable is::
 
          ${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}
 
@@ -4874,15 +4718,13 @@ system and gives an overview of their function and contents.
       not exist in common licenses.
 
       The following example shows how to add ``NO_GENERIC_LICENSE`` to a
-      recipe:
-      ::
+      recipe::
 
          NO_GENERIC_LICENSE[license_name] = "license_file_in_fetched_source"
 
       The following is an example that
       uses the ``LICENSE.Abilis.txt`` file as the license from the fetched
-      source:
-      ::
+      source::
 
          NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
@@ -4923,8 +4765,7 @@ system and gives an overview of their function and contents.
       Disables auto package from splitting ``.debug`` files. If a recipe
       requires ``FILES_${PN}-dbg`` to be set manually, the
       ``NOAUTOPACKAGEDEBUG`` can be defined allowing you to define the
-      content of the debug package. For example:
-      ::
+      content of the debug package. For example::
 
          NOAUTOPACKAGEDEBUG = "1"
          FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
@@ -5016,8 +4857,7 @@ system and gives an overview of their function and contents.
       As an example, if the string "an-override" appears as an element in
       the colon-separated list in ``OVERRIDES``, then the following
       assignment will override ``FOO`` with the value "overridden" at the
-      end of parsing:
-      ::
+      end of parsing::
 
          FOO_an-override = "overridden"
 
@@ -5032,8 +4872,7 @@ system and gives an overview of their function and contents.
       :term:`DISTROOVERRIDES` variables. Another
       important override included by default is ``pn-${PN}``. This override
       allows variables to be set for a single recipe within configuration
-      (``.conf``) files. Here is an example:
-      ::
+      (``.conf``) files. Here is an example::
 
          FOO_pn-myrecipe = "myrecipe-specific value"
 
@@ -5045,8 +4884,7 @@ system and gives an overview of their function and contents.
          Project Development Tasks Manual for more information.
 
    :term:`P`
-      The recipe name and version. ``P`` is comprised of the following:
-      ::
+      The recipe name and version. ``P`` is comprised of the following::
 
          ${PN}-${PV}
 
@@ -5082,8 +4920,7 @@ system and gives an overview of their function and contents.
       However, if your recipe's output packages are built specific to the
       target machine rather than generally for the architecture of the
       machine, you should set ``PACKAGE_ARCH`` to the value of
-      :term:`MACHINE_ARCH` in the recipe as follows:
-      ::
+      :term:`MACHINE_ARCH` in the recipe as follows::
 
          PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -5119,8 +4956,7 @@ system and gives an overview of their function and contents.
       The build system uses only the first argument in the list as the
       package manager when creating your image or SDK. However, packages
       will be created using any additional packaging classes you specify.
-      For example, if you use the following in your ``local.conf`` file:
-      ::
+      For example, if you use the following in your ``local.conf`` file::
 
          PACKAGE_CLASSES ?= "package_ipk"
 
@@ -5178,15 +5014,13 @@ system and gives an overview of their function and contents.
 
    :term:`PACKAGE_EXCLUDE`
       Lists packages that should not be installed into an image. For
-      example:
-      ::
+      example::
 
          PACKAGE_EXCLUDE = "package_name package_name package_name ..."
 
       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override:
-      ::
+      override::
 
          PACKAGE_EXCLUDE_pn-target_image = "package_name"
 
@@ -5230,8 +5064,7 @@ system and gives an overview of their function and contents.
 
       Consider the following example where the ``PACKAGE_FEED_URIS``,
       ``PACKAGE_FEED_BASE_PATHS``, and ``PACKAGE_FEED_ARCHS`` variables are
-      defined in your ``local.conf`` file:
-      ::
+      defined in your ``local.conf`` file::
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                               https://example.com/packagerepos/updates"
@@ -5260,8 +5093,7 @@ system and gives an overview of their function and contents.
 
       Consider the following example where the ``PACKAGE_FEED_URIS``,
       ``PACKAGE_FEED_BASE_PATHS``, and ``PACKAGE_FEED_ARCHS`` variables are
-      defined in your ``local.conf`` file:
-      ::
+      defined in your ``local.conf`` file::
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                               https://example.com/packagerepos/updates"
@@ -5290,8 +5122,7 @@ system and gives an overview of their function and contents.
 
       Consider the following example where the ``PACKAGE_FEED_URIS``,
       ``PACKAGE_FEED_BASE_PATHS``, and ``PACKAGE_FEED_ARCHS`` variables are
-      defined in your ``local.conf`` file:
-      ::
+      defined in your ``local.conf`` file::
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
                               https://example.com/packagerepos/updates"
@@ -5356,8 +5187,7 @@ system and gives an overview of their function and contents.
       recipe on a per-recipe basis. ``PACKAGECONFIG`` blocks are defined in
       recipes when you specify features and then arguments that define
       feature behaviors. Here is the basic block structure (broken over
-      multiple lines for readability):
-      ::
+      multiple lines for readability)::
 
          PACKAGECONFIG ??= "f1 f2 f3 ..."
          PACKAGECONFIG[f1] = "\
@@ -5423,26 +5253,22 @@ system and gives an overview of their function and contents.
       -  *Append file:* Create an append file named
          recipename\ ``.bbappend`` in your layer and override the value of
          ``PACKAGECONFIG``. You can either completely override the
-         variable:
-         ::
+         variable::
 
             PACKAGECONFIG = "f4 f5"
 
-         Or, you can just append the variable:
-         ::
+         Or, you can just append the variable::
 
             PACKAGECONFIG_append = " f4"
 
       -  *Configuration file:* This method is identical to changing the
          block through an append file except you edit your ``local.conf``
          or ``mydistro.conf`` file. As with append files previously
-         described, you can either completely override the variable:
-         ::
+         described, you can either completely override the variable::
 
             PACKAGECONFIG_pn-recipename = "f4 f5"
 
-         Or, you can just amend the variable:
-         ::
+         Or, you can just amend the variable::
 
             PACKAGECONFIG_append_pn-recipename = " f4"
 
@@ -5467,8 +5293,7 @@ system and gives an overview of their function and contents.
 
    :term:`PACKAGES`
       The list of packages the recipe creates. The default value is the
-      following:
-      ::
+      following::
 
          ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}
 
@@ -5594,8 +5419,7 @@ system and gives an overview of their function and contents.
       patched, it uses "patch".
 
       If you wish to use an alternative patching tool, set the variable in
-      the recipe using one of the following:
-      ::
+      the recipe using one of the following::
 
          PATCHTOOL = "patch"
          PATCHTOOL = "quilt"
@@ -5641,8 +5465,7 @@ system and gives an overview of their function and contents.
    :term:`PKGD`
       Points to the destination directory for files to be packaged before
       they are split into individual packages. This directory defaults to
-      the following:
-      ::
+      the following::
 
          ${WORKDIR}/package
 
@@ -5654,8 +5477,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-packagedata` task packages data
       for each recipe and installs it into this temporary, shared area.
       This directory defaults to the following, which you should not
-      change:
-      ::
+      change::
 
          ${STAGING_DIR_HOST}/pkgdata
 
@@ -5670,8 +5492,7 @@ system and gives an overview of their function and contents.
    :term:`PKGDEST`
       Points to the parent directory for files to be packaged after they
       have been split into individual packages. This directory defaults to
-      the following:
-      ::
+      the following::
 
          ${WORKDIR}/packages-split
 
@@ -5682,8 +5503,7 @@ system and gives an overview of their function and contents.
    :term:`PKGDESTWORK`
       Points to a temporary work area where the
       :ref:`ref-tasks-package` task saves package metadata.
-      The ``PKGDESTWORK`` location defaults to the following:
-      ::
+      The ``PKGDESTWORK`` location defaults to the following::
 
          ${WORKDIR}/pkgdata
 
@@ -5732,16 +5552,14 @@ system and gives an overview of their function and contents.
 
       To prevent a recipe from being built, use the ``PNBLACKLIST``
       variable in your ``local.conf`` file. Here is an example that
-      prevents ``myrecipe`` from being built:
-      ::
+      prevents ``myrecipe`` from being built::
 
          PNBLACKLIST[myrecipe] = "Not supported by our organization."
 
    :term:`POPULATE_SDK_POST_HOST_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the host part of the SDK. You can specify
-      functions separated by semicolons:
-      ::
+      functions separated by semicolons::
 
           POPULATE_SDK_POST_HOST_COMMAND += "function; ... "
 
@@ -5753,8 +5571,7 @@ system and gives an overview of their function and contents.
    :term:`POPULATE_SDK_POST_TARGET_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the target part of the SDK. You can specify
-      functions separated by semicolons:
-      ::
+      functions separated by semicolons::
 
          POPULATE_SDK_POST_TARGET_COMMAND += "function; ... "
 
@@ -5804,8 +5621,7 @@ system and gives an overview of their function and contents.
       preferred provider). You should always suffix this variable with the
       name of the provided item. And, you should define the variable using
       the preferred recipe's name (:term:`PN`). Here is a common
-      example:
-      ::
+      example::
 
          PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 
@@ -5813,8 +5629,7 @@ system and gives an overview of their function and contents.
       The ``PREFERRED_PROVIDER`` variable is set with the name (``PN``) of
       the recipe you prefer to provide "virtual/kernel".
 
-      Following are more examples:
-      ::
+      Following are more examples::
 
          PREFERRED_PROVIDER_virtual/xserver = "xserver-xf86"
          PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
@@ -5842,8 +5657,7 @@ system and gives an overview of their function and contents.
       through the "``%``" character. You can use the character to match any
       number of characters, which can be useful when specifying versions
       that contain long revision numbers that potentially change. Here are
-      two examples:
-      ::
+      two examples::
 
          PREFERRED_VERSION_python = "3.4.0"
          PREFERRED_VERSION_linux-yocto = "5.0%"
@@ -5857,35 +5671,30 @@ system and gives an overview of their function and contents.
       The specified version is matched against :term:`PV`, which
       does not necessarily match the version part of the recipe's filename.
       For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
-      where ``foo_git.bb`` contains the following assignment:
-      ::
+      where ``foo_git.bb`` contains the following assignment::
 
          PV = "1.1+git${SRCPV}"
 
       In this case, the correct way to select
-      ``foo_git.bb`` is by using an assignment such as the following:
-      ::
+      ``foo_git.bb`` is by using an assignment such as the following::
 
          PREFERRED_VERSION_foo = "1.1+git%"
 
       Compare that previous example
-      against the following incorrect example, which does not work:
-      ::
+      against the following incorrect example, which does not work::
 
          PREFERRED_VERSION_foo = "git"
 
       Sometimes the ``PREFERRED_VERSION`` variable can be set by
       configuration files in a way that is hard to change. You can use
       :term:`OVERRIDES` to set a machine-specific
-      override. Here is an example:
-      ::
+      override. Here is an example::
 
          PREFERRED_VERSION_linux-yocto_qemux86 = "5.0%"
 
       Although not recommended, worst case, you can also use the
       "forcevariable" override, which is the strongest override possible.
-      Here is an example:
-      ::
+      Here is an example::
 
          PREFERRED_VERSION_linux-yocto_forcevariable = "5.0%"
 
@@ -5913,8 +5722,7 @@ system and gives an overview of their function and contents.
       Typically, you could add a specific server for the build system to
       attempt before any others by adding something like the following to
       the ``local.conf`` configuration file in the
-      :term:`Build Directory`:
-      ::
+      :term:`Build Directory`::
 
          PREMIRRORS_prepend = "\
              git://.*/.* http://www.yoctoproject.org/sources/ \n \
@@ -5950,8 +5758,7 @@ system and gives an overview of their function and contents.
       standard version of the library.
 
       Libraries specified in this variable should be specified by their
-      file name. For example, from the Firefox recipe in meta-browser:
-      ::
+      file name. For example, from the Firefox recipe in meta-browser::
 
          PRIVATE_LIBS = "libmozjs.so \
                          libxpcom.so \
@@ -5975,8 +5782,7 @@ system and gives an overview of their function and contents.
       ``DEPENDS``.
 
       Consider the following example ``PROVIDES`` statement from the recipe
-      file ``eudev_3.2.9.bb``:
-      ::
+      file ``eudev_3.2.9.bb``::
 
          PROVIDES += "udev"
 
@@ -6013,8 +5819,7 @@ system and gives an overview of their function and contents.
          the component that manages the ``/dev`` directory.
 
          Setting the "preferred provider" for runtime dependencies is as
-         simple as using the following assignment in a configuration file:
-         ::
+         simple as using the following assignment in a configuration file::
 
                  VIRTUAL-RUNTIME_dev_manager = "udev"
 
@@ -6024,8 +5829,7 @@ system and gives an overview of their function and contents.
 
       The ``conf/local.conf.sample.extended`` configuration file in the
       :term:`Source Directory` shows how the
-      ``PRSERV_HOST`` variable is set:
-      ::
+      ``PRSERV_HOST`` variable is set::
 
          PRSERV_HOST = "localhost:0"
 
@@ -6086,8 +5890,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system automatically sets it for you.
 
       The variable allows recipes to use common infrastructure such as the
-      following:
-      ::
+      following::
 
          DEPENDS += "${PYTHON_PN}-native"
 
@@ -6102,8 +5905,7 @@ system and gives an overview of their function and contents.
       will not be installed if conflicting packages are not first removed.
 
       Like all package-controlling variables, you must always use them in
-      conjunction with a package name override. Here is an example:
-      ::
+      conjunction with a package name override. Here is an example::
 
          RCONFLICTS_${PN} = "another_conflicting_package_name"
 
@@ -6111,8 +5913,7 @@ system and gives an overview of their function and contents.
       specifying versioned dependencies. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      ``RCONFLICTS`` variable:
-      ::
+      ``RCONFLICTS`` variable::
 
          RCONFLICTS_${PN} = "package (operator version)"
 
@@ -6125,8 +5926,7 @@ system and gives an overview of their function and contents.
       - >=
 
       For example, the following sets up a dependency on version 1.2 or
-      greater of the package ``foo``:
-      ::
+      greater of the package ``foo``::
 
          RCONFLICTS_${PN} = "foo (>= 1.2)"
 
@@ -6135,8 +5935,7 @@ system and gives an overview of their function and contents.
       packages that must be installed in order for the package to function
       correctly. As an example, the following assignment declares that the
       package ``foo`` needs the packages ``bar`` and ``baz`` to be
-      installed:
-      ::
+      installed::
 
          RDEPENDS_foo = "bar baz"
 
@@ -6177,8 +5976,7 @@ system and gives an overview of their function and contents.
       name (remember that a single recipe can build multiple packages). For
       example, suppose you are building a development package that depends
       on the ``perl`` package. In this case, you would use the following
-      ``RDEPENDS`` statement:
-      ::
+      ``RDEPENDS`` statement::
 
          RDEPENDS_${PN}-dev += "perl"
 
@@ -6207,8 +6005,7 @@ system and gives an overview of their function and contents.
       specifying versioned dependencies. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      ``RDEPENDS`` variable:
-      ::
+      ``RDEPENDS`` variable::
 
          RDEPENDS_${PN} = "package (operator version)"
 
@@ -6228,8 +6025,7 @@ system and gives an overview of their function and contents.
          specification.
 
       For example, the following sets up a dependency on version 1.2 or
-      greater of the package ``foo``:
-      ::
+      greater of the package ``foo``::
 
          RDEPENDS_${PN} = "foo (>= 1.2)"
 
@@ -6270,8 +6066,7 @@ system and gives an overview of their function and contents.
 
    :term:`ROOT_HOME`
       Defines the root home directory. By default, this directory is set as
-      follows in the BitBake configuration file:
-      ::
+      follows in the BitBake configuration file::
 
          ROOT_HOME ??= "/home/root"
 
@@ -6284,8 +6079,7 @@ system and gives an overview of their function and contents.
       You can override the default by setting the variable in any layer or
       in the ``local.conf`` file. Because the default is set using a "weak"
       assignment (i.e. "??="), you can use either of the following forms to
-      define your override:
-      ::
+      define your override::
 
          ROOT_HOME = "/root"
          ROOT_HOME ?= "/root"
@@ -6303,8 +6097,7 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS_POSTINSTALL_COMMAND`
       Specifies a list of functions to call after the OpenEmbedded build
       system has installed packages. You can specify functions separated by
-      semicolons:
-      ::
+      semicolons::
 
          ROOTFS_POSTINSTALL_COMMAND += "function; ... "
 
@@ -6317,8 +6110,7 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the root filesystem. You can specify functions
-      separated by semicolons:
-      ::
+      separated by semicolons::
 
          ROOTFS_POSTPROCESS_COMMAND += "function; ... "
 
@@ -6333,8 +6125,7 @@ system and gives an overview of their function and contents.
       system has removed unnecessary packages. When runtime package
       management is disabled in the image, several packages are removed
       including ``base-passwd``, ``shadow``, and ``update-alternatives``.
-      You can specify functions separated by semicolons:
-      ::
+      You can specify functions separated by semicolons::
 
          ROOTFS_POSTUNINSTALL_COMMAND += "function; ... "
 
@@ -6347,8 +6138,7 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded build
       system has created the root filesystem. You can specify functions
-      separated by semicolons:
-      ::
+      separated by semicolons::
 
          ROOTFS_PREPROCESS_COMMAND += "function; ... "
 
@@ -6370,8 +6160,7 @@ system and gives an overview of their function and contents.
 
       As with all package-controlling variables, you must always use the
       variable in conjunction with a package name override. Here is an
-      example:
-      ::
+      example::
 
          RPROVIDES_${PN} = "widget-abi-2"
 
@@ -6402,8 +6191,7 @@ system and gives an overview of their function and contents.
       particular package whose usability is being extended. For example,
       suppose you are building a development package that is extended to
       support wireless functionality. In this case, you would use the
-      following:
-      ::
+      following::
 
          RRECOMMENDS_${PN}-dev += "wireless_package_name"
 
@@ -6416,8 +6204,7 @@ system and gives an overview of their function and contents.
       specifying versioned recommends. Although the syntax varies depending
       on the packaging format, BitBake hides these differences from you.
       Here is the general syntax to specify versions with the
-      ``RRECOMMENDS`` variable:
-      ::
+      ``RRECOMMENDS`` variable::
 
          RRECOMMENDS_${PN} = "package (operator version)"
 
@@ -6430,8 +6217,7 @@ system and gives an overview of their function and contents.
       - >=
 
       For example, the following sets up a recommend on version 1.2 or
-      greater of the package ``foo``:
-      ::
+      greater of the package ``foo``::
 
          RRECOMMENDS_${PN} = "foo (>= 1.2)"
 
@@ -6443,8 +6229,7 @@ system and gives an overview of their function and contents.
       the other package to the ``RCONFLICTS`` variable.
 
       As with all package-controlling variables, you must use this variable
-      in conjunction with a package name override. Here is an example:
-      ::
+      in conjunction with a package name override. Here is an example::
 
          RREPLACES_${PN} = "other_package_being_replaced"
 
@@ -6452,8 +6237,7 @@ system and gives an overview of their function and contents.
       specifying versioned replacements. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      ``RREPLACES`` variable:
-      ::
+      ``RREPLACES`` variable::
 
          RREPLACES_${PN} = "package (operator version)"
 
@@ -6466,8 +6250,7 @@ system and gives an overview of their function and contents.
       - >=
 
       For example, the following sets up a replacement using version 1.2
-      or greater of the package ``foo``:
-      ::
+      or greater of the package ``foo``::
 
           RREPLACES_${PN} = "foo (>= 1.2)"
 
@@ -6478,8 +6261,7 @@ system and gives an overview of their function and contents.
 
       As with all package-controlling variables, you must always use this
       variable in conjunction with a package name override. Here is an
-      example:
-      ::
+      example::
 
          RSUGGESTS_${PN} = "useful_package another_package"
 
@@ -6497,8 +6279,7 @@ system and gives an overview of their function and contents.
       As an example, assume a :term:`Source Directory`
       top-level folder named ``poky`` and a default Build Directory at
       ``poky/build``. In this case, the work directory the build system
-      uses to keep the unpacked recipe for ``db`` is the following:
-      ::
+      uses to keep the unpacked recipe for ``db`` is the following::
 
          poky/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/db-5.1.19
 
@@ -6508,8 +6289,7 @@ system and gives an overview of their function and contents.
       repositories are cloned to ``${WORKDIR}/git`` during
       :ref:`ref-tasks-fetch`. Since this path is different
       from the default value of ``S``, you must set it specifically so the
-      source can be located:
-      ::
+      source can be located::
 
          SRC_URI = "git://path/to/repo.git"
          S = "${WORKDIR}/git"
@@ -6544,8 +6324,7 @@ system and gives an overview of their function and contents.
       The directory set up and used by the
       :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which
       the SDK is deployed. The ``populate_sdk_base`` class defines
-      ``SDK_DEPLOY`` as follows:
-      ::
+      ``SDK_DEPLOY`` as follows::
 
          SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
@@ -6553,8 +6332,7 @@ system and gives an overview of their function and contents.
       The parent directory used by the OpenEmbedded build system when
       creating SDK output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class defines
-      the variable as follows:
-      ::
+      the variable as follows::
 
          SDK_DIR = "${WORKDIR}/sdk"
 
@@ -6579,14 +6357,12 @@ system and gives an overview of their function and contents.
       The manifest file for the host part of the SDK. This file lists all
       the installed packages that make up the host part of the SDK. The
       file contains package information on a line-per-package basis as
-      follows:
-      ::
+      follows::
 
          packagename packagearch version
 
       The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class
-      defines the manifest file as follows:
-      ::
+      defines the manifest file as follows::
 
          SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 
@@ -6624,8 +6400,7 @@ system and gives an overview of their function and contents.
       A list of classes to remove from the :term:`INHERIT`
       value globally within the extensible SDK configuration. The
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class sets the
-      default value:
-      ::
+      default value::
 
          SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 
@@ -6688,8 +6463,7 @@ system and gives an overview of their function and contents.
       :term:`DISTRO`, :term:`TCLIBC`,
       :term:`SDK_ARCH`,
       :term:`IMAGE_BASENAME`, and
-      :term:`TUNE_PKGARCH` variables:
-      ::
+      :term:`TUNE_PKGARCH` variables::
 
          SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}"
 
@@ -6700,8 +6474,7 @@ system and gives an overview of their function and contents.
    :term:`SDK_OUTPUT`
       The location used by the OpenEmbedded build system when creating SDK
       output. The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
-      class defines the variable as follows:
-      ::
+      class defines the variable as follows::
 
          SDK_DIR = "${WORKDIR}/sdk"
          SDK_OUTPUT = "${SDK_DIR}/image"
@@ -6766,14 +6539,12 @@ system and gives an overview of their function and contents.
       The manifest file for the target part of the SDK. This file lists all
       the installed packages that make up the target part of the SDK. The
       file contains package information on a line-per-package basis as
-      follows:
-      ::
+      follows::
 
          packagename packagearch version
 
       The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class
-      defines the manifest file as follows:
-      ::
+      defines the manifest file as follows::
 
          SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 
@@ -6793,8 +6564,7 @@ system and gives an overview of their function and contents.
       this title is based on the :term:`DISTRO_NAME` or
       :term:`DISTRO` variable and is set in the
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class as
-      follows:
-      ::
+      follows::
 
          SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
@@ -6817,8 +6587,7 @@ system and gives an overview of their function and contents.
    :term:`SDK_VERSION`
       Specifies the version of the SDK. The Poky distribution configuration file
       (``/meta-poky/conf/distro/poky.conf``) sets the default
-      ``SDK_VERSION`` as follows:
-      ::
+      ``SDK_VERSION`` as follows::
 
          SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}', 'snapshot')}"
 
@@ -6831,8 +6600,7 @@ system and gives an overview of their function and contents.
       default, this directory is based on the :term:`DISTRO`
       variable and is set in the
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class as
-      follows:
-      ::
+      follows::
 
          SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
@@ -6846,8 +6614,7 @@ system and gives an overview of their function and contents.
 
    :term:`SDKIMAGE_FEATURES`
       Equivalent to ``IMAGE_FEATURES``. However, this variable applies to
-      the SDK generated from an image using the following command:
-      ::
+      the SDK generated from an image using the following command::
 
          $ bitbake -c populate_sdk imagename
 
@@ -6899,8 +6666,7 @@ system and gives an overview of their function and contents.
       Defines a serial console (TTY) to enable using
       `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
       value that specifies the baud rate followed by the TTY device name
-      separated by a space. You cannot specify more than one TTY device:
-      ::
+      separated by a space. You cannot specify more than one TTY device::
 
          SERIAL_CONSOLE = "115200 ttyS0"
 
@@ -6913,8 +6679,7 @@ system and gives an overview of their function and contents.
       Defines a serial console (TTY) to enable using
       `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
       value that specifies the baud rate followed by the TTY device name
-      separated by a semicolon. Use spaces to separate multiple devices:
-      ::
+      separated by a semicolon. Use spaces to separate multiple devices::
 
          SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
@@ -7044,8 +6809,7 @@ system and gives an overview of their function and contents.
 
       To use this variable, you must globally inherit the
       :ref:`own-mirrors <ref-classes-own-mirrors>` class and then provide
-      the URL to your mirrors. Here is the general syntax:
-      ::
+      the URL to your mirrors. Here is the general syntax::
 
          INHERIT += "own-mirrors"
          SOURCE_MIRROR_URL = "http://example.com/my_source_mirror"
@@ -7076,8 +6840,7 @@ system and gives an overview of their function and contents.
       U-Boot recipe.
 
       The SPL file type is set to "null" by default in the ``u-boot.inc``
-      file as follows:
-      ::
+      file as follows::
 
          # Some versions of u-boot build an SPL (Second Program Loader) image that
          # should be packaged along with the u-boot binary as well as placed in the
@@ -7236,8 +6999,7 @@ system and gives an overview of their function and contents.
 
       -  ``name`` - Specifies a name to be used for association with
          ``SRC_URI`` checksums or :term:`SRCREV` when you have more than one
-         file or git repository specified in ``SRC_URI``. For example:
-         ::
+         file or git repository specified in ``SRC_URI``. For example::
 
             SRC_URI = "git://example.com/foo.git;name=first \
                        git://example.com/bar.git;name=second \
@@ -7268,16 +7030,14 @@ system and gives an overview of their function and contents.
 
       The ``SRCPV`` variable is defined in the ``meta/conf/bitbake.conf``
       configuration file in the :term:`Source Directory` as
-      follows:
-      ::
+      follows::
 
          SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
       Recipes that need to define ``PV`` do so with the help of the
       ``SRCPV``. For example, the ``ofono`` recipe (``ofono_git.bb``)
       located in ``meta/recipes-connectivity`` in the Source Directory
-      defines ``PV`` as follows:
-      ::
+      defines ``PV`` as follows::
 
          PV = "0.12-git${SRCPV}"
 
@@ -7328,8 +7088,7 @@ system and gives an overview of their function and contents.
       :term:`NATIVELSBSTRING` set by the
       :ref:`uninative <ref-classes-uninative>` class. For example, the
       following maps the local search path ``universal-4.9`` to the
-      server-provided path server_url_sstate_path:
-      ::
+      server-provided path server_url_sstate_path::
 
          SSTATE_MIRRORS ?= "file://universal-4.9/(.*) http://server_url_sstate_path/universal-4.8/\1 \n"
 
@@ -7524,8 +7283,7 @@ system and gives an overview of their function and contents.
       to an actual stamp file is constructed by evaluating this string and
       then appending additional information. Currently, the default
       assignment for ``STAMP`` as set in the ``meta/conf/bitbake.conf``
-      file is:
-      ::
+      file is::
 
          STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 
@@ -7562,8 +7320,7 @@ system and gives an overview of their function and contents.
    :term:`SYSLINUX_DEFAULT_CONSOLE`
       Specifies the kernel boot default console. If you want to use a
       console other than the default, set this variable in your recipe as
-      follows where "X" is the console number you want to use:
-      ::
+      follows where "X" is the console number you want to use::
 
          SYSLINUX_DEFAULT_CONSOLE = "console=ttyX"
 
@@ -7582,8 +7339,7 @@ system and gives an overview of their function and contents.
       Specifies the alternate serial port or turns it off. To turn off
       serial, set this variable to an empty string in your recipe. The
       variable's default value is set in the
-      :ref:`syslinux <ref-classes-syslinux>` class as follows:
-      ::
+      :ref:`syslinux <ref-classes-syslinux>` class as follows::
 
          SYSLINUX_SERIAL ?= "0 115200"
 
@@ -7592,8 +7348,7 @@ system and gives an overview of their function and contents.
    :term:`SYSLINUX_SERIAL_TTY`
       Specifies the alternate console=tty... kernel boot argument. The
       variable's default value is set in the
-      :ref:`syslinux <ref-classes-syslinux>` class as follows:
-      ::
+      :ref:`syslinux <ref-classes-syslinux>` class as follows::
 
          SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
 
@@ -7616,8 +7371,7 @@ system and gives an overview of their function and contents.
    :term:`SYSROOT_DIRS`
       Directories that are staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. By
-      default, the following directories are staged:
-      ::
+      default, the following directories are staged::
 
          SYSROOT_DIRS = " \
              ${includedir} \
@@ -7632,8 +7386,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-populate_sysroot` task. You
       can use this variable to exclude certain subdirectories of
       directories listed in :term:`SYSROOT_DIRS` from
-      staging. By default, the following directories are not staged:
-      ::
+      staging. By default, the following directories are not staged::
 
          SYSROOT_DIRS_BLACKLIST = " \
              ${mandir} \
@@ -7650,8 +7403,7 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-populate_sysroot` task for
       ``-native`` recipes, in addition to those specified in
       :term:`SYSROOT_DIRS`. By default, the following
-      extra directories are staged:
-      ::
+      extra directories are staged::
 
          SYSROOT_DIRS_NATIVE = " \
              ${bindir} \
@@ -7680,8 +7432,7 @@ system and gives an overview of their function and contents.
       :term:`SYSTEMD_SERVICE` should start
       automatically or not. By default, the service is enabled to
       automatically start at boot time. The default setting is in the
-      :ref:`systemd <ref-classes-systemd>` class as follows:
-      ::
+      :ref:`systemd <ref-classes-systemd>` class as follows::
 
          SYSTEMD_AUTO_ENABLE ??= "enable"
 
@@ -7692,8 +7443,7 @@ system and gives an overview of their function and contents.
       "systemd-boot", the ``SYSTEMD_BOOT_CFG`` variable specifies the
       configuration file that should be used. By default, the
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      ``SYSTEMD_BOOT_CFG`` as follows:
-      ::
+      ``SYSTEMD_BOOT_CFG`` as follows::
 
          SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
 
@@ -7706,8 +7456,7 @@ system and gives an overview of their function and contents.
       list of entry files (``*.conf``) to install that contain one boot
       entry per file. By default, the
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      ``SYSTEMD_BOOT_ENTRIES`` as follows:
-      ::
+      ``SYSTEMD_BOOT_ENTRIES`` as follows::
 
           SYSTEMD_BOOT_ENTRIES ?= ""
 
@@ -7719,8 +7468,7 @@ system and gives an overview of their function and contents.
       "systemd-boot", the ``SYSTEMD_BOOT_TIMEOUT`` variable specifies the
       boot menu timeout in seconds. By default, the
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      ``SYSTEMD_BOOT_TIMEOUT`` as follows:
-      ::
+      ``SYSTEMD_BOOT_TIMEOUT`` as follows::
 
          SYSTEMD_BOOT_TIMEOUT ?= "10"
 
@@ -7732,8 +7480,7 @@ system and gives an overview of their function and contents.
       this variable locates the systemd unit files when they are not found
       in the main recipe's package. By default, the ``SYSTEMD_PACKAGES``
       variable is set such that the systemd unit files are assumed to
-      reside in the recipes main package:
-      ::
+      reside in the recipes main package::
 
          SYSTEMD_PACKAGES ?= "${PN}"
 
@@ -7747,8 +7494,7 @@ system and gives an overview of their function and contents.
 
       When you specify this file in your recipe, use a package name
       override to indicate the package to which the value applies. Here is
-      an example from the connman recipe:
-      ::
+      an example from the connman recipe::
 
          SYSTEMD_SERVICE_${PN} = "connman.service"
 
@@ -7766,8 +7512,7 @@ system and gives an overview of their function and contents.
    :term:`T`
       This variable points to a directory were BitBake places temporary
       files, which consist mostly of task logs and scripts, when building a
-      particular recipe. The variable is typically set as follows:
-      ::
+      particular recipe. The variable is typically set as follows::
 
          T = "${WORKDIR}/temp"
 
@@ -7801,8 +7546,7 @@ system and gives an overview of their function and contents.
       Specifies architecture-specific assembler flags for the target
       system. ``TARGET_AS_ARCH`` is initialized from
       :term:`TUNE_ASARGS` by default in the BitBake
-      configuration file (``meta/conf/bitbake.conf``):
-      ::
+      configuration file (``meta/conf/bitbake.conf``)::
 
          TARGET_AS_ARCH = "${TUNE_ASARGS}"
 
@@ -7869,8 +7613,7 @@ system and gives an overview of their function and contents.
       Specifies architecture-specific linker flags for the target system.
       ``TARGET_LD_ARCH`` is initialized from
       :term:`TUNE_LDARGS` by default in the BitBake
-      configuration file (``meta/conf/bitbake.conf``):
-      ::
+      configuration file (``meta/conf/bitbake.conf``)::
 
          TARGET_LD_ARCH = "${TUNE_LDARGS}"
 
@@ -8051,8 +7794,7 @@ system and gives an overview of their function and contents.
       program does.
 
       For example, to use the Picocom terminal program on serial device
-      ``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows:
-      ::
+      ``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows::
 
          TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"
 
@@ -8090,8 +7832,7 @@ system and gives an overview of their function and contents.
 
       Tests include ``ping``, ``ssh``, ``df`` among others. You can add
       your own tests to the list of tests by appending ``TEST_SUITES`` as
-      follows:
-      ::
+      follows::
 
          TEST_SUITES_append = " mytest"
 
@@ -8110,8 +7851,7 @@ system and gives an overview of their function and contents.
       another test must appear later in the list than the test on which
       they depend. For example, if you append the list of tests with two
       tests (``test_A`` and ``test_B``) where ``test_B`` is dependent on
-      ``test_A``, then you must order the tests as follows:
-      ::
+      ``test_A``, then you must order the tests as follows::
 
          TEST_SUITES = "test_A test_B"
 
@@ -8121,8 +7861,7 @@ system and gives an overview of their function and contents.
 
    :term:`TEST_TARGET`
       Specifies the target controller to use when running tests against a
-      test image. The default controller to use is "qemu":
-      ::
+      test image. The default controller to use is "qemu"::
 
          TEST_TARGET = "qemu"
 
@@ -8161,8 +7900,7 @@ system and gives an overview of their function and contents.
       set to "qemu".
 
       When you specify the IP address, you can also include a port. Here is
-      an example:
-      ::
+      an example::
 
          TEST_TARGET_IP = "192.168.1.4:2201"
 
@@ -8211,8 +7949,7 @@ system and gives an overview of their function and contents.
 
       If you want to establish this directory in a location other than the
       default, you can uncomment and edit the following statement in the
-      ``conf/local.conf`` file in the :term:`Source Directory`:
-      ::
+      ``conf/local.conf`` file in the :term:`Source Directory`::
 
          #TMPDIR = "${TOPDIR}/tmp"
 
@@ -8231,8 +7968,7 @@ system and gives an overview of their function and contents.
       packages specified by this variable are part of the toolchain set
       that runs on the :term:`SDKMACHINE`, and each
       package should usually have the prefix ``nativesdk-``. For example,
-      consider the following command when building an SDK:
-      ::
+      consider the following command when building an SDK::
 
          $ bitbake -c populate_sdk imagename
 
@@ -8253,8 +7989,7 @@ system and gives an overview of their function and contents.
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-      the ``TOOLCHAIN_OUTPUTNAME`` variable as follows:
-      ::
+      the ``TOOLCHAIN_OUTPUTNAME`` variable as follows::
 
          TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
@@ -8310,8 +8045,7 @@ system and gives an overview of their function and contents.
       ``TUNE_ARCH`` is tied closely to
       :term:`TARGET_ARCH`, which defines the target
       machine's architecture. The BitBake configuration file
-      (``meta/conf/bitbake.conf``) sets ``TARGET_ARCH`` as follows:
-      ::
+      (``meta/conf/bitbake.conf``) sets ``TARGET_ARCH`` as follows::
 
          TARGET_ARCH = "${TUNE_ARCH}"
 
@@ -8333,8 +8067,7 @@ system and gives an overview of their function and contents.
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`. For example, the
       ``meta/conf/machine/include/x86/arch-x86.inc`` file defines the flags
-      for the x86 architecture as follows:
-      ::
+      for the x86 architecture as follows::
 
          TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 
@@ -8367,8 +8100,7 @@ system and gives an overview of their function and contents.
       are not conflicting and that they are supported.
 
       The BitBake configuration file (``meta/conf/bitbake.conf``) defines
-      ``TUNE_FEATURES`` as follows:
-      ::
+      ``TUNE_FEATURES`` as follows::
 
          TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 
@@ -8381,8 +8113,7 @@ system and gives an overview of their function and contents.
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`. For example, the
       ``meta/conf/machine/include/x86/arch-x86.inc`` file defines the flags
-      for the x86 architecture as follows:
-      ::
+      for the x86 architecture as follows::
 
          TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
 
@@ -8395,15 +8126,13 @@ system and gives an overview of their function and contents.
    :term:`TUNE_PKGARCH`
       The package architecture understood by the packaging system to define
       the architecture, ABI, and tuning of output packages. The specific
-      tune is defined using the "_tune" override as follows:
-      ::
+      tune is defined using the "_tune" override as follows::
 
          TUNE_PKGARCH_tune-tune = "tune"
 
       These tune-specific package architectures are defined in the machine
       include files. Here is an example of the "core2-32" tuning as used in
-      the ``meta/conf/machine/include/tune-core2.inc`` file:
-      ::
+      the ``meta/conf/machine/include/tune-core2.inc`` file::
 
          TUNE_PKGARCH_tune-core2-32 = "core2-32"
 
@@ -8449,8 +8178,7 @@ system and gives an overview of their function and contents.
       the :term:`Source Directory`. Here is an example from
       the ``meta/conf/machine/include/mips/arch-mips.inc`` include file
       that lists the "o32" and "n64" features as conflicting with the "n32"
-      feature:
-      ::
+      feature::
 
          TUNECONFLICTS[n32] = "o32 n64"
 
@@ -8459,8 +8187,7 @@ system and gives an overview of their function and contents.
       feature. The specified feature is stored as a flag. Valid features
       are specified in the machine include files (e.g.
       ``meta/conf/machine/include/arm/arch-arm.inc``). Here is an example
-      from that file:
-      ::
+      from that file::
 
          TUNEVALID[bigendian] = "Enable big-endian mode."
 
@@ -8516,8 +8243,7 @@ system and gives an overview of their function and contents.
       Appends a string to the name of the local version of the U-Boot
       image. For example, assuming the version of the U-Boot image built
       was "2013.10", the full version string reported by U-Boot would be
-      "2013.10-yocto" given the following statement:
-      ::
+      "2013.10-yocto" given the following statement::
 
          UBOOT_LOCALVERSION = "-yocto"
 
@@ -8691,8 +8417,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system to enable extra features (e.g.
       ``buildstats``, ``image-mklibs``, and so forth).
 
-      The default list is set in your ``local.conf`` file:
-      ::
+      The default list is set in your ``local.conf`` file::
 
          USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
@@ -8712,8 +8437,7 @@ system and gives an overview of their function and contents.
       ``USERADD_ERROR_DYNAMIC`` variable is by default not set. If you plan
       on using statically assigned ``gid`` and ``uid`` values, you should
       set the ``USERADD_ERROR_DYNAMIC`` variable in your ``local.conf``
-      file as follows:
-      ::
+      file as follows::
 
          USERADD_ERROR_DYNAMIC = "error"
 
@@ -8743,8 +8467,7 @@ system and gives an overview of their function and contents.
       When applying static group identification (``gid``) values, the
       OpenEmbedded build system looks in :term:`BBPATH` for a
       ``files/group`` file and then applies those ``uid`` values. Set the
-      variable as follows in your ``local.conf`` file:
-      ::
+      variable as follows in your ``local.conf`` file::
 
 
          USERADD_GID_TABLES = "files/group"
@@ -8761,8 +8484,7 @@ system and gives an overview of their function and contents.
 
       You must set this variable if the recipe inherits the class. For
       example, the following enables adding a user for the main package in
-      a recipe:
-      ::
+      a recipe::
 
          USERADD_PACKAGES = "${PN}"
 
@@ -8778,8 +8500,7 @@ system and gives an overview of their function and contents.
       the ``useradd`` command if you add a user to the system when the
       package is installed.
 
-      Here is an example from the ``dbus`` recipe:
-      ::
+      Here is an example from the ``dbus`` recipe::
 
          USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
                                 --no-create-home --shell /bin/false \
@@ -8797,8 +8518,7 @@ system and gives an overview of their function and contents.
       When applying static user identification (``uid``) values, the
       OpenEmbedded build system looks in :term:`BBPATH` for a
       ``files/passwd`` file and then applies those ``uid`` values. Set the
-      variable as follows in your ``local.conf`` file:
-      ::
+      variable as follows in your ``local.conf`` file::
 
          USERADD_UID_TABLES = "files/passwd"
 
@@ -8869,8 +8589,7 @@ system and gives an overview of their function and contents.
       With the ``WKS_FILE_DEPENDS`` variable, you have the possibility to
       specify a list of additional dependencies (e.g. native tools,
       bootloaders, and so forth), that are required to build Wic images.
-      Following is an example:
-      ::
+      Following is an example::
 
          WKS_FILE_DEPENDS = "some-native-tool"
 
@@ -8884,8 +8603,7 @@ system and gives an overview of their function and contents.
       :term:`TMPDIR` directory structure and is specific to
       the recipe being built and the system for which it is being built.
 
-      The ``WORKDIR`` directory is defined as follows:
-      ::
+      The ``WORKDIR`` directory is defined as follows::
 
          ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}
 
@@ -8904,8 +8622,7 @@ system and gives an overview of their function and contents.
       ``qemux86-poky-linux`` machine target system. Furthermore, suppose
       your recipe is named ``foo_1.3.0-r0.bb``. In this case, the work
       directory the build system uses to build the package would be as
-      follows:
-      ::
+      follows::
 
          poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 8e7115046b..fb2d78452b 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -149,8 +149,7 @@ from the :term:`DISTRO` variable.
 The
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
 class defines the default value of the ``SDK_TITLE`` variable as
-follows:
-::
+follows::
 
    SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
@@ -162,8 +161,7 @@ an example, assume you have your own layer for your distribution named
 does the default "poky" distribution. If so, you could update the
 ``SDK_TITLE`` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
-form:
-::
+form::
 
    SDK_TITLE = "your_title"
 
@@ -194,8 +192,7 @@ the installed SDKs to update the installed SDKs by using the
 3. Build the extensible SDK normally (i.e., use the
    ``bitbake -c populate_sdk_ext`` imagename command).
 
-4. Publish the SDK using the following command:
-   ::
+4. Publish the SDK using the following command::
 
       $ oe-publish-sdk some_path/sdk-installer.sh path_to_shared_http_directory
 
@@ -218,8 +215,7 @@ installation directory for the SDK is based on the
 :term:`SDKEXTPATH` variables from
 within the
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
-class as follows:
-::
+class as follows::
 
    SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
@@ -236,8 +232,7 @@ assume you have your own layer for your distribution named
 does the default "poky" distribution. If so, you could update the
 ``SDKEXTPATH`` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
-form:
-::
+form::
 
    SDKEXTPATH = "some_path_for_your_installed_sdk"
 
@@ -272,8 +267,7 @@ source, you need to do a number of things:
 
 3. Set the appropriate configuration so that the produced SDK knows how
    to find the configuration. The variable you need to set is
-   :term:`SSTATE_MIRRORS`:
-   ::
+   :term:`SSTATE_MIRRORS`::
 
       SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
 
@@ -287,8 +281,7 @@ source, you need to do a number of things:
       side, and its contents will not interfere with the build), then
       you can set the variable in your ``local.conf`` or custom distro
       configuration file. You can then "whitelist" the variable through
-      to the SDK by adding the following:
-      ::
+      to the SDK by adding the following::
 
          SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 
@@ -313,8 +306,7 @@ everything needed to reconstruct the image for which the SDK was built.
 This bundling can lead to an SDK installer file that is a Gigabyte or
 more in size. If the size of this file causes a problem, you can build
 an SDK that has just enough in it to install and provide access to the
-``devtool command`` by setting the following in your configuration:
-::
+``devtool command`` by setting the following in your configuration::
 
    SDK_EXT_TYPE = "minimal"
 
@@ -336,8 +328,7 @@ information enables the ``devtool search`` command to return useful
 results.
 
 To facilitate this wider range of information, you would need to set the
-following:
-::
+following::
 
    SDK_INCLUDE_PKGDATA = "1"
 
diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index 3c1dc52d19..0ce828aa29 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -25,8 +25,7 @@ Follow these steps to locate and hand-install the toolchain:
    download the installer appropriate for your build host, target
    hardware, and image type.
 
-   The installer files (``*.sh``) follow this naming convention:
-   ::
+   The installer files (``*.sh``) follow this naming convention::
 
       poky-glibc-host_system-core-image-type-arch-toolchain[-ext]-release.sh
 
@@ -55,15 +54,13 @@ Follow these steps to locate and hand-install the toolchain:
 
    For example, if your build host is a 64-bit x86 system and you need
    an extended SDK for a 64-bit core2 target, go into the ``x86_64``
-   folder and download the following installer:
-   ::
+   folder and download the following installer::
 
       poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
 4. *Run the Installer:* Be sure you have execution privileges and run
    the installer. Following is an example from the ``Downloads``
-   directory:
-   ::
+   directory::
 
       $ ~/Downloads/poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
@@ -132,8 +129,7 @@ build the SDK installer. Follow these steps:
       using to build the installer. If
       SDKMACHINE
       is not set appropriately, the build fails and provides an error
-      message similar to the following:
-      ::
+      message similar to the following::
 
               The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is
               set to i686 (likely via setting SDKMACHINE) which is different from the architecture of the build machine (x86_64).
@@ -144,8 +140,7 @@ build the SDK installer. Follow these steps:
    SDK and populate the SDK image, use the following command form. Be
    sure to replace image with an image (e.g. "core-image-sato"): $
    bitbake image -c populate_sdk You can do the same for the extensible
-   SDK using this command form:
-   ::
+   SDK using this command form::
 
       $ bitbake image -c populate_sdk_ext
 
@@ -170,8 +165,7 @@ build the SDK installer. Follow these steps:
          libc-staticdev"
 
 7. *Run the Installer:* You can now run the SDK installer from
-   ``tmp/deploy/sdk`` in the Build Directory. Following is an example:
-   ::
+   ``tmp/deploy/sdk`` in the Build Directory. Following is an example::
 
       $ cd poky/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
@@ -211,8 +205,7 @@ Follow these steps to extract the root filesystem:
    which you can use with QEMU directly.
 
    The pre-built root filesystem image files follow these naming
-   conventions:
-   ::
+   conventions::
 
       core-image-profile-arch.tar.bz2
 
@@ -233,8 +226,7 @@ Follow these steps to extract the root filesystem:
 
    For example, if you plan on using a BeagleBone device as your target
    hardware and your image is a ``core-image-sato-sdk`` image, you can
-   download the following file:
-   ::
+   download the following file::
 
       core-image-sato-sdk-beaglebone-yocto.tar.bz2
 
@@ -246,8 +238,7 @@ Follow these steps to extract the root filesystem:
    installed the toolchain (e.g. ``poky_sdk``).
 
    Following is an example based on the toolchain installed in the
-   ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section:
-   ::
+   ":ref:`sdk-manual/appendix-obtain:locating pre-built sdk installers`" section::
 
       $ source poky_sdk/environment-setup-core2-64-poky-linux
 
@@ -258,8 +249,7 @@ Follow these steps to extract the root filesystem:
    from a previously built root filesystem image that was downloaded
    from the :yocto_dl:`Index of Releases </releases/yocto/yocto-&DISTRO;/machines/>`.
    This command extracts the root filesystem into the ``core2-64-sato``
-   directory:
-   ::
+   directory::
 
       $ runqemu-extract-sdk ~/Downloads/core-image-sato-sdk-beaglebone-yocto.tar.bz2 ~/beaglebone-sato
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index baa432ef3b..04bafaed9e 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -59,8 +59,7 @@ The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
 immediately followed by a string representing the target architecture.
 An extensible SDK has the string "-ext" as part of the name. Following
-is the general form:
-::
+is the general form::
 
    poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh
 
@@ -83,8 +82,7 @@ is the general form:
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current &DISTRO; snapshot:
-::
+the SDK for ``core-image-sato`` and using the current &DISTRO; snapshot::
 
    poky-glibc-x86_64-core-image-sato-i586-toolchain-ext-&DISTRO;.sh
 
@@ -150,8 +148,7 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning:
-::
+script is for an IA-based target machine using i586 tuning::
 
    $ cd /home/scottrif/poky_sdk
    $ source environment-setup-core2-64-poky-linux
@@ -258,8 +255,7 @@ command:
       to be extracted. In this situation, the source code is extracted
       to the default workspace - you do not want the files in some
       specific location outside of the workspace. Thus, everything you
-      need will be located in the workspace:
-      ::
+      need will be located in the workspace::
 
          $ devtool add recipe fetchuri
 
@@ -283,8 +279,7 @@ command:
       Furthermore, the first positional argument srctree in this case
       identifies where the ``devtool add`` command will locate the
       extracted code outside of the workspace. You need to specify an
-      empty directory:
-      ::
+      empty directory::
 
          $ devtool add recipe srctree fetchuri
 
@@ -300,8 +295,7 @@ command:
       ``devtool`` workspace.
 
       The following command provides a new recipe name and identifies
-      the existing source tree location:
-      ::
+      the existing source tree location::
 
          $ devtool add recipe srctree
 
@@ -317,8 +311,7 @@ command:
 
 2. *Edit the Recipe*: You can use ``devtool edit-recipe`` to open up the
    editor as defined by the ``$EDITOR`` environment variable and modify
-   the file:
-   ::
+   the file::
 
       $ devtool edit-recipe recipe
 
@@ -338,8 +331,7 @@ command:
    On the other hand, if you want an image to contain the recipe's
    packages from the workspace for immediate deployment onto a device
    (e.g. for testing purposes), you can use the ``devtool build-image``
-   command:
-   ::
+   command::
 
       $ devtool build-image image
 
@@ -435,8 +427,7 @@ command:
       outside the workspace (i.e. ``meta-``\ layername).
 
       The following command identifies the recipe and, by default,
-      extracts the source files:
-      ::
+      extracts the source files::
 
          $ devtool modify recipe
 
@@ -474,8 +465,7 @@ command:
       The following command tells ``devtool`` the recipe with which to
       work and, in this case, identifies a local area for the extracted
       source files that exists outside of the default ``devtool``
-      workspace:
-      ::
+      workspace::
 
          $ devtool modify recipe srctree
 
@@ -508,8 +498,7 @@ command:
       The following command tells ``devtool`` the recipe with which to
       work, uses the "-n" option to indicate source does not need to be
       extracted, and uses srctree to point to the previously extracted
-      source files:
-      ::
+      source files::
 
          $ devtool modify -n recipe srctree
 
@@ -532,8 +521,7 @@ command:
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
-   hardware, use the following ``devtool`` command:
-   ::
+   hardware, use the following ``devtool`` command::
 
       $ devtool build recipe
 
@@ -556,8 +544,7 @@ command:
       development machine.
 
    You can deploy your build output to that target hardware by using the
-   ``devtool deploy-target`` command:
-   ::
+   ``devtool deploy-target`` command::
 
       $ devtool deploy-target recipe target
 
@@ -651,8 +638,7 @@ The following diagram shows the common development flow used with the
    A common situation is where third-party software has undergone a
    revision so that it has been upgraded. The recipe you have access to
    is likely in your own layer. Thus, you need to upgrade the recipe to
-   use the newer version of the software:
-   ::
+   use the newer version of the software::
 
       $ devtool upgrade -V version recipe
 
@@ -703,16 +689,14 @@ The following diagram shows the common development flow used with the
    depends on what you are going to do with the new code.
 
    If you need to eventually move the build output to the target
-   hardware, use the following ``devtool`` command:
-   ::
+   hardware, use the following ``devtool`` command::
 
       $ devtool build recipe
 
    On the other hand, if you want an image to contain the recipe's
    packages from the workspace for immediate deployment onto a device
    (e.g. for testing purposes), you can use the ``devtool build-image``
-   command:
-   ::
+   command::
 
       $ devtool build-image image
 
@@ -828,8 +812,7 @@ name and version, just the name, or just the version as part of the
 command line.
 
 Sometimes the name or version determined from the source tree might be
-incorrect. For such a case, you must reset the recipe:
-::
+incorrect. For such a case, you must reset the recipe::
 
    $ devtool reset -n recipename
 
@@ -853,8 +836,7 @@ the ``DEPENDS`` variable in the original recipe to include the new
 recipe.
 
 If you need to add runtime dependencies, you can do so by adding the
-following to your recipe:
-::
+following to your recipe::
 
    RDEPENDS_${PN} += "dependency1 dependency2 ..."
 
@@ -938,8 +920,7 @@ mind:
    the command line, add the variable setting to
    :term:`EXTRA_OEMAKE` or
    :term:`PACKAGECONFIG_CONFARGS`
-   within the recipe. Here is an example using ``EXTRA_OEMAKE``:
-   ::
+   within the recipe. Here is an example using ``EXTRA_OEMAKE``::
 
       EXTRA_OEMAKE += "'CC=${CC}' 'CXX=${CXX}'"
 
@@ -993,8 +974,7 @@ You can use the ``devtool add`` command two different ways to add
 Node.js modules: 1) Through ``npm`` and, 2) from a repository or local
 source.
 
-Use the following form to add Node.js modules through ``npm``:
-::
+Use the following form to add Node.js modules through ``npm``::
 
    $ devtool add "npm://registry.npmjs.org;name=forever;version=0.15.1"
 
@@ -1018,8 +998,7 @@ these behaviors ensure the reproducibility and integrity of the build.
 
 As mentioned earlier, you can also add Node.js modules directly from a
 repository or local source tree. To add modules this way, use
-``devtool add`` in the following form:
-::
+``devtool add`` in the following form::
 
    $ devtool add https://github.com/diversario/node-ssdp
 
@@ -1196,15 +1175,13 @@ need to restore the original files that existed prior to running the
 ``devtool deploy-target`` command. Because the ``devtool deploy-target``
 command backs up any files it overwrites, you can use the
 ``devtool undeploy-target`` command to restore those files and remove
-any other files the recipe deployed. Consider the following example:
-::
+any other files the recipe deployed. Consider the following example::
 
    $ devtool undeploy-target lighttpd root@192.168.7.2
 
 If you have deployed
 multiple applications, you can remove them all using the "-a" option
-thus restoring the target device to its original state:
-::
+thus restoring the target device to its original state::
 
    $ devtool undeploy-target -a root@192.168.7.2
 
@@ -1235,22 +1212,19 @@ populated on-demand. Sometimes you must explicitly install extra items
 into the SDK. If you need these extra items, you can first search for
 the items using the ``devtool search`` command. For example, suppose you
 need to link to libGL but you are not sure which recipe provides libGL.
-You can use the following command to find out:
-::
+You can use the following command to find out::
 
    $ devtool search libGL mesa
 
 A free implementation of the OpenGL API Once you know the recipe
-(i.e. ``mesa`` in this example), you can install it:
-::
+(i.e. ``mesa`` in this example), you can install it::
 
    $ devtool sdk-install mesa
 
 By default, the ``devtool sdk-install`` command assumes
 the item is available in pre-built form from your SDK provider. If the
 item is not available and it is acceptable to build the item from
-source, you can add the "-s" option as follows:
-::
+source, you can add the "-s" option as follows::
 
    $ devtool sdk-install -s mesa
 
@@ -1266,8 +1240,7 @@ If you are working with an installed extensible SDK that gets
 occasionally updated (e.g. a third-party SDK), then you will need to
 manually "pull down" the updates into the installed SDK.
 
-To update your installed SDK, use ``devtool`` as follows:
-::
+To update your installed SDK, use ``devtool`` as follows::
 
    $ devtool sdk-update
 
diff --git a/documentation/sdk-manual/using.rst b/documentation/sdk-manual/using.rst
index 62967f5572..fa0e8d4098 100644
--- a/documentation/sdk-manual/using.rst
+++ b/documentation/sdk-manual/using.rst
@@ -77,8 +77,7 @@ immediately followed by a string representing the target architecture.
 
 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current DISTRO snapshot:
-::
+the SDK for ``core-image-sato`` and using the current DISTRO snapshot::
 
    poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.sh
 
@@ -141,8 +140,7 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning:
-::
+script is for an IA-based target machine using i586 tuning::
 
    $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index f880cbe0d5..ad84ce2b87 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -45,16 +45,14 @@ project:
    respectively.
 
    Use the following command to create an empty README file, which is
-   required by GNU Coding Standards:
-   ::
+   required by GNU Coding Standards::
 
       $ touch README
 
    Create the remaining
    three files as follows:
 
-   -  ``hello.c``:
-      ::
+   -  ``hello.c``::
 
          #include <stdio.h>
 
@@ -63,8 +61,7 @@ project:
                  printf("Hello World!\n");
              }
 
-   -  ``configure.ac``:
-      ::
+   -  ``configure.ac``::
 
          AC_INIT(hello,0.1)
          AM_INIT_AUTOMAKE([foreign])
@@ -72,8 +69,7 @@ project:
          AC_CONFIG_FILES(Makefile)
          AC_OUTPUT
 
-   -  ``Makefile.am``:
-      ::
+   -  ``Makefile.am``::
 
          bin_PROGRAMS = hello
          hello_SOURCES = hello.c
@@ -87,8 +83,7 @@ project:
    which is followed by the string "poky-linux". For this example, the
    command sources a script from the default SDK installation directory
    that uses the 32-bit Intel x86 Architecture and the &DISTRO; Yocto
-   Project release:
-   ::
+   Project release::
 
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
@@ -113,8 +108,7 @@ project:
    the cross-compiler. The
    :term:`CONFIGURE_FLAGS`
    environment variable provides the minimal arguments for GNU
-   configure:
-   ::
+   configure::
 
       $ ./configure ${CONFIGURE_FLAGS}
 
@@ -127,14 +121,12 @@ project:
    ``armv5te-poky-linux-gnueabi``. You will notice that the name of the
    script is ``environment-setup-armv5te-poky-linux-gnueabi``. Thus, the
    following command works to update your project and rebuild it using
-   the appropriate cross-toolchain tools:
-   ::
+   the appropriate cross-toolchain tools::
 
      $ ./configure --host=armv5te-poky-linux-gnueabi --with-libtool-sysroot=sysroot_dir
 
 5. *Make and Install the Project:* These two commands generate and
-   install the project into the destination directory:
-   ::
+   install the project into the destination directory::
 
       $ make
       $ make install DESTDIR=./tmp
@@ -157,8 +149,7 @@ project:
 
 6. *Execute Your Project:* To execute the project, you would need to run
    it on your target hardware. If your target hardware happens to be
-   your build host, you could run the project as follows:
-   ::
+   your build host, you could run the project as follows::
 
       $ ./tmp/usr/local/bin/hello
 
@@ -203,8 +194,7 @@ regarding variable behavior:
 .. note::
 
    Regardless of how you set your variables, if you use the "-e" option
-   with ``make``, the variables from the SDK setup script take precedence:
-   ::
+   with ``make``, the variables from the SDK setup script take precedence::
 
       $ make -e target
 
@@ -226,8 +216,7 @@ Running the
 SDK setup script for a 64-bit build host and an i586-tuned target
 architecture for a ``core-image-sato`` image using the current &DISTRO;
 Yocto Project release and then echoing that variable shows the value
-established through the script:
-::
+established through the script::
 
    $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
    $ echo ${CC}
@@ -252,8 +241,7 @@ example:
 
    Create the three files as follows:
 
-   -  ``main.c``:
-      ::
+   -  ``main.c``::
 
          #include "module.h"
          void sample_func();
@@ -263,14 +251,12 @@ example:
              return 0;
          }
 
-   -  ``module.h``:
-      ::
+   -  ``module.h``::
 
          #include <stdio.h>
          void sample_func();
 
-   -  ``module.c``:
-      ::
+   -  ``module.c``::
 
          #include "module.h"
          void sample_func()
@@ -288,8 +274,7 @@ example:
    which is followed by the string "poky-linux". For this example, the
    command sources a script from the default SDK installation directory
    that uses the 32-bit Intel x86 Architecture and the &DISTRO_NAME; Yocto
-   Project release:
-   ::
+   Project release::
 
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
@@ -297,8 +282,7 @@ example:
    two lines that can be used to set the ``CC`` variable. One line is
    identical to the value that is set when you run the SDK environment
    setup script, and the other line sets ``CC`` to "gcc", the default
-   GNU compiler on the build host:
-   ::
+   GNU compiler on the build host::
 
       # CC=i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux
       # CC="gcc"
@@ -315,8 +299,7 @@ example:
 4. *Make the Project:* Use the ``make`` command to create the binary
    output file. Because variables are commented out in the Makefile, the
    value used for ``CC`` is the value set when the SDK environment setup
-   file was run:
-   ::
+   file was run::
 
       $ make
       i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux -I . -c main.c
@@ -351,8 +334,7 @@ example:
    variable as part of the command line. Go into the Makefile and
    re-insert the comment character so that running ``make`` uses the
    established SDK compiler. However, when you run ``make``, use a
-   command-line argument to set ``CC`` to "gcc":
-   ::
+   command-line argument to set ``CC`` to "gcc"::
 
       $ make clean
       rm -rf *.o
@@ -376,8 +358,7 @@ example:
    environment variable.
 
    In this last case, edit Makefile again to use the "gcc" compiler but
-   then use the "-e" option on the ``make`` command line:
-   ::
+   then use the "-e" option on the ``make`` command line::
 
       $ make clean
       rm -rf *.o
@@ -402,8 +383,7 @@ example:
    Makefile.
 
 5. *Execute Your Project:* To execute the project (i.e. ``target_bin``),
-   use the following command:
-   ::
+   use the following command::
 
       $ ./target_bin
       Hello World!
-- 
2.25.1

