Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.4606.1604008852796127201
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 15:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:40486 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYFyQ-0025QS-M5
	for docs@lists.yoctoproject.org; Thu, 29 Oct 2020 18:00:51 -0400
Date: Thu, 29 Oct 2020 18:00:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] normalize use of trailing "::" across docs
Message-ID: <afdb4476-bdb4-3df0-be7-457ebd473db0@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.1
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-1068545881-1604008846=:17086"

--8323328-1068545881-1604008846=:17086
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


Rather than terminate a line with a single ":" and follow that up with
a line of simply "::" to start a code block, we can simply terminate
the text line with "::" which has the same effect. While we're there,
we can change a few terminating "." to "::" just for aesthetics.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  this appears to build, but some confirmation would be nice.

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 0630040e6..ede7b494c 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -379,8 +379,7 @@ the COMMON and DISTRO related tests. Furthermore, if your layer is a BSP
 layer, the layer must pass the COMMON and BSP set of tests.

 To execute the script, enter the following commands from your build
-directory:
-::
+directory::

    $ source oe-init-build-env
    $ yocto-check-layer your_layer_directory
@@ -436,8 +435,7 @@ enable it. To enable your layer, simply add your layer's path to the
 ``BBLAYERS`` variable in your ``conf/bblayers.conf`` file, which is
 found in the :term:`Build Directory`.
 The following example shows how to enable a layer named
-``meta-mylayer``:
-::
+``meta-mylayer``::

    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -494,8 +492,7 @@ As an example, consider the main formfactor recipe and a corresponding
 formfactor append file both from the :term:`Source Directory`.
 Here is the main
 formfactor recipe, which is named ``formfactor_0.0.bb`` and located in
-the "meta" layer at ``meta/recipes-bsp/formfactor``:
-::
+the "meta" layer at ``meta/recipes-bsp/formfactor``::

    SUMMARY = "Device formfactor information"
    DESCRIPTION = "A formfactor configuration file provides information about the \
@@ -527,8 +524,7 @@ during the build.

 Following is the append file, which is named ``formfactor_0.0.bbappend``
 and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
-file is in the layer at ``recipes-bsp/formfactor``:
-::
+file is in the layer at ``recipes-bsp/formfactor``::

    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

@@ -576,8 +572,7 @@ build system to calculate it based on the layer's dependencies.

 To specify the layer's priority manually, use the
 :term:`BBFILE_PRIORITY`
-variable and append the layer's root name:
-::
+variable and append the layer's root name::

    BBFILE_PRIORITY_mylayer = "1"

@@ -601,8 +596,7 @@ with their paths and priorities and on ``.bbappend`` files and their
 applicable recipes can help to reveal potential problems.

 For help on the BitBake layer management tool, use the following
-command:
-::
+command::

    $ bitbake-layers --help
    NOTE: Starting bitbake server...
@@ -752,14 +746,12 @@ create a layer with the following:

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
@@ -776,8 +768,7 @@ default, you can use the ``--example-recipe-name`` option.

 The easiest way to see how the ``bitbake-layers create-layer`` command
 works is to experiment with the script. You can also read the usage
-information by entering the following:
-::
+information by entering the following::

    $ bitbake-layers create-layer --help
    NOTE: Starting bitbake server...
@@ -805,16 +796,14 @@ Once you create your general layer, you must add it to your
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
@@ -861,8 +850,7 @@ variable changes are in effect for every build and consequently affect
 all images, which might not be what you require.

 To add a package to your image using the local configuration file, use
-the ``IMAGE_INSTALL`` variable with the ``_append`` operator:
-::
+the ``IMAGE_INSTALL`` variable with the ``_append`` operator::

    IMAGE_INSTALL_append = " strace"

@@ -880,8 +868,7 @@ takes effect.

 As shown in its simplest use, ``IMAGE_INSTALL_append`` affects all
 images. It is possible to extend the syntax so that the variable applies
-to a specific image only. Here is an example:
-::
+to a specific image only. Here is an example::

    IMAGE_INSTALL_append_pn-core-image-minimal = " strace"

@@ -956,8 +943,7 @@ Customizing Images Using Custom .bb Files

 You can also customize an image by creating a custom recipe that defines
 additional software as part of the image. The following example shows
-the form for the two lines you need:
-::
+the form for the two lines you need::

    IMAGE_INSTALL = "packagegroup-core-x11-base package1 package2"
    inherit core-image
@@ -972,8 +958,7 @@ The other method for creating a custom image is to base it on an
 existing image. For example, if you want to create an image based on
 ``core-image-sato`` but add the additional package ``strace`` to the
 image, copy the ``meta/recipes-sato/images/core-image-sato.bb`` to a new
-``.bb`` and add the following line to the end of the copy:
-::
+``.bb`` and add the following line to the end of the copy::

    IMAGE_INSTALL += "strace"

@@ -1006,8 +991,7 @@ in the ``packagegroup-base.bb`` recipe.
 Here is a short, fabricated example showing the same basic pieces for a
 hypothetical packagegroup defined in ``packagegroup-custom.bb``, where
 the variable ``PN`` is the standard way to abbreviate the reference to
-the full packagegroup name ``packagegroup-custom``:
-::
+the full packagegroup name ``packagegroup-custom``::

    DESCRIPTION = "My Custom Package Groups"

@@ -1051,13 +1035,11 @@ configured hostname written to ``/etc/hostname`` is "qemux86".

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

@@ -1072,8 +1054,7 @@ you can easily reset the default hostname.

 Another point of interest is that if you unset the variable, the image
 will have no default hostname in the filesystem. Here is an example that
-unsets the variable in a configuration file:
-::
+unsets the variable in a configuration file::

   hostname_pn-base-files = ""

@@ -1164,8 +1145,7 @@ To run the tool, you just need to be in your
 :term:`Build Directory` and have sourced the
 build environment setup script (i.e.
 :ref:`structure-core-script`).
-To get help on the tool, use the following command:
-::
+To get help on the tool, use the following command::

    $ recipetool -h
    NOTE: Starting bitbake server...
@@ -1311,8 +1291,7 @@ Assuming you have sourced the build environment setup script (i.e.
 :ref:`structure-core-script`) and you are in
 the :term:`Build Directory`, use
 BitBake to process your recipe. All you need to provide is the
-``basename`` of the recipe as described in the previous section:
-::
+``basename`` of the recipe as described in the previous section::

    $ bitbake basename

@@ -1324,8 +1303,7 @@ compilation and packaging files, and so forth.

 The path to the per-recipe temporary work directory depends on the
 context in which it is being built. The quickest way to find this path
-is to have BitBake return it by running the following:
-::
+is to have BitBake return it by running the following::

    $ bitbake -e basename | grep ^WORKDIR=

@@ -1334,8 +1312,7 @@ top-level folder named ``poky``, a default Build Directory at
 ``poky/build``, and a ``qemux86-poky-linux`` machine target system.
 Furthermore, suppose your recipe is named ``foo_1.3.0.bb``. In this
 case, the work directory the build system uses to build the package
-would be as follows:
-::
+would be as follows::

    poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0

@@ -1389,8 +1366,7 @@ recipe to match the new version.
 Here is a simple example from the
 ``meta/recipes-devtools/strace/strace_5.5.bb`` recipe where the source
 comes from a single tarball. Notice the use of the
-:term:`PV` variable:
-::
+:term:`PV` variable::

    SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \

@@ -1406,8 +1382,7 @@ you must specify :term:`SRCREV` and
 you should specify :term:`PV` to include
 the revision with :term:`SRCPV`. Here
 is an example from the recipe
-``meta/recipes-kernel/blktrace/blktrace_git.bb``:
-::
+``meta/recipes-kernel/blktrace/blktrace_git.bb``::

    SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"

@@ -1429,8 +1404,7 @@ SCM URLs), you need to provide the ``md5`` and ``sha256`` checksums for
 each URL. For these cases, you provide a name for each URL as part of
 the ``SRC_URI`` and then reference that name in the subsequent checksum
 statements. Here is an example combining lines from the files
-``git.inc`` and ``git_2.24.1.bb``:
-::
+``git.inc`` and ``git_2.24.1.bb``::

    SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
               ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
@@ -1464,8 +1438,7 @@ This final example is a bit more complicated and is from the
 ``meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb`` recipe. The
 example's ``SRC_URI`` statement identifies multiple files as the source
 files for the recipe: a tarball, a patch file, a desktop file, and an
-icon.
-::
+icon::

    SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
               file://xwc.patch \
@@ -1797,8 +1770,7 @@ standard mainline kernel, not your own custom one.
 When you use custom kernel headers you need to get them from
 :term:`STAGING_KERNEL_DIR`,
 which is the directory with kernel headers that are required to build
-out-of-tree modules. Your recipe will also need the following:
-::
+out-of-tree modules. Your recipe will also need the following::

    do_configure[depends] += "virtual/kernel:do_shared_workdir"

@@ -2127,8 +2099,7 @@ task as defined by the the
 automatically populate the sysroot. It is possible to modify the list of
 directories that populate the sysroot. The following example shows how
 you could add the ``/opt`` directory to the list of directories within a
-recipe:
-::
+recipe::

    SYSROOT_DIRS += "/opt"

@@ -2154,8 +2125,7 @@ kernel recipe. Suppose you have three kernel recipes whose
 in some way uses a :term:`PROVIDES`
 statement that essentially identifies itself as being able to provide
 ``virtual/kernel``. Here is one way through the
-:ref:`kernel <ref-classes-kernel>` class:
-::
+:ref:`kernel <ref-classes-kernel>` class::

    PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"

@@ -2173,8 +2143,7 @@ include file, which is a machine (i.e.
 :term:`MACHINE`) configuration file.
 This include file is the reason all x86-based machines use the
 ``linux-yocto`` kernel. Here are the relevant lines from the include
-file:
-::
+file::

    PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ??= "4.15%"
@@ -2182,8 +2151,7 @@ file:
 When you use a virtual provider, you do not have to "hard code" a recipe
 name as a build dependency. You can use the
 :term:`DEPENDS` variable to state the
-build is dependent on ``virtual/kernel`` for example:
-::
+build is dependent on ``virtual/kernel`` for example::

    DEPENDS = "virtual/kernel"

@@ -2191,8 +2159,7 @@ During the build, the OpenEmbedded build system picks
 the correct recipe needed for the ``virtual/kernel`` dependency based on
 the ``PREFERRED_PROVIDER`` variable. If you want to use the small kernel
 mentioned at the beginning of this section, configure your build as
-follows:
-::
+follows::

    PREFERRED_PROVIDER_virtual/kernel ??= "kernel-small"

@@ -2245,8 +2212,7 @@ In order to ensure the versions compare properly, the recommended
 convention is to set :term:`PV` within the
 recipe to "previous_version+current_version". You can use an additional
 variable so that you can use the current version elsewhere. Here is an
-example:
-::
+example::

    REALPV = "0.8.16-rc1"
    PV = "0.8.15+${REALPV}"
@@ -2267,8 +2233,7 @@ required, specify
 ``${``\ :term:`PN`\ ``}`` in place of
 PACKAGENAME.

-A post-installation function has the following structure:
-::
+A post-installation function has the following structure::

    pkg_postinst_PACKAGENAME() {
        # Commands to carry out
@@ -2432,13 +2397,11 @@ Otherwise, BitBake runs an empty ``do_install`` task by default.
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
@@ -2483,8 +2446,7 @@ application into multiple packages.
 Following is an example that uses the ``libxpm`` recipe. By default,
 this recipe generates a single package that contains the library along
 with a few binaries. You can modify the recipe to split the binaries
-into separate packages:
-::
+into separate packages::

    require xorg-lib-common.inc

@@ -2940,8 +2902,7 @@ of adding a suitable ``defconfig`` file. The file needs to be added into
 a location similar to ``defconfig`` files used for other machines in a
 given kernel recipe. A possible way to do this is by listing the file in
 the ``SRC_URI`` and adding the machine to the expression in
-``COMPATIBLE_MACHINE``:
-::
+``COMPATIBLE_MACHINE``::

    COMPATIBLE_MACHINE = '(qemux86|qemumips)'

@@ -2970,8 +2931,7 @@ contains directories for specific machines such as ``qemuarm`` and
 defaults, see the ``meta/recipes-bsp/formfactor/files/config`` file
 found in the same area.

-Following is an example for "qemuarm" machine:
-::
+Following is an example for "qemuarm" machine::

    HAVE_TOUCHSCREEN=1
    HAVE_KEYBOARD=1
@@ -3186,8 +3146,7 @@ This next set of examples describes how to use the AUH:
       $ upgrade-helper.py -e all

 Once you have run the AUH utility, you can find the results in the AUH
-build directory:
-::
+build directory::

    ${BUILDDIR}/upgrade-helper/timestamp

@@ -3214,15 +3173,13 @@ section in the Yocto Project Application Development and the Extensible
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

@@ -3248,15 +3205,13 @@ could add it easily using the
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
@@ -3297,8 +3252,7 @@ directory automatically upgrades the recipe for you:
    NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb

 Continuing with this example, you can use ``devtool build`` to build the
-newly upgraded recipe:
-::
+newly upgraded recipe::

    $ devtool build nano
    NOTE: Starting bitbake server...
@@ -3323,8 +3277,7 @@ and submit commits for the changes generated by the upgrade process.

 Once the tree is clean, you can clean things up in this example with the
 following command from the ``${BUILDDIR}/workspace/sources/nano``
-directory:
-::
+directory::

    $ devtool finish nano meta-oe
    NOTE: Starting bitbake server...
@@ -3431,8 +3384,7 @@ build packages is available in the Build Directory as defined by the
 :term:`S` variable. Below is the default
 value for the ``S`` variable as defined in the
 ``meta/conf/bitbake.conf`` configuration file in the
-:term:`Source Directory`:
-::
+:term:`Source Directory`::

    S = "${WORKDIR}/${BP}"

@@ -3451,8 +3403,7 @@ usually set ``S`` to ``${WORKDIR}/git``.

 The path to the work directory for the recipe
 (:term:`WORKDIR`) is defined as
-follows:
-::
+follows::

    ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}

@@ -3478,8 +3429,7 @@ As an example, assume a Source Directory top-level folder named
 ``poky``, a default Build Directory at ``poky/build``, and a
 ``qemux86-poky-linux`` machine target system. Furthermore, suppose your
 recipe is named ``foo_1.3.0.bb``. In this case, the work directory the
-build system uses to build the package would be as follows:
-::
+build system uses to build the package would be as follows::

    poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0

@@ -3598,8 +3548,7 @@ this way can be helpful when debugging a build or preparing software to
 be used with the OpenEmbedded build system.

 Following is an example that uses ``devshell`` on a target named
-``matchbox-desktop``:
-::
+``matchbox-desktop``::

   $ bitbake matchbox-desktop -c devshell

@@ -3628,8 +3577,7 @@ corresponding ``run.*`` script in the
 directory (e.g., ``run.do_configure.``\ `pid`). If a task's script does
 not exist, which would be the case if the task was skipped by way of the
 sstate cache, you can create the task by first running it outside of the
-``devshell``:
-::
+``devshell``::

    $ bitbake -c task

@@ -3678,8 +3626,7 @@ specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
 BitBake tasks, in particular, the data store 'd'. So, commands such as
 the following are useful when exploring the data store and running
-functions:
-::
+functions::

    pydevshell> d.getVar("STAGING_DIR")
    '/media/build1/poky/build/tmp/sysroots'
@@ -3699,8 +3646,7 @@ helpful when debugging a build or preparing software to be used with the
 OpenEmbedded build system.

 Following is an example that uses ``devpyshell`` on a target named
-``matchbox-desktop``:
-::
+``matchbox-desktop``::

    $ bitbake matchbox-desktop -c devpyshell

@@ -3951,15 +3897,13 @@ essentially that the

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

@@ -3969,8 +3913,7 @@ task on which the ``do_image`` task in the recipe depends is the
 with the "arm" multiconfig.

 Once you set up this dependency, you can build the "x86" multiconfig
-using a BitBake command as follows:
-::
+using a BitBake command as follows::

    $ bitbake mc:x86:core-image-sato

@@ -3981,8 +3924,7 @@ dependency, BitBake also executes through the ``do_rootfs`` task for the

 Having a recipe depend on the root filesystem of another build might not
 seem that useful. Consider this change to the statement in the
-``core-image-sato`` recipe:
-::
+``core-image-sato`` recipe::

    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"

@@ -4207,10 +4149,9 @@ happens, which changes the way you build them. You can also modify the
 filesystem itself or select a different filesystem.

 First, find out what is hogging your root filesystem by running the
-``dirsize.py`` script from your root directory:
-::
+``dirsize.py`` script from your root directory::

-   $ cd root-directory-of-image
+   $ cd root-directory-of-image:
    $ dirsize.py 100000 > dirsize-100k.log
    $ cat dirsize-100k.log

@@ -4223,8 +4164,7 @@ the root filesystem that take up large amounts of memory.

 You need to be sure that what you eliminate does not cripple the
 functionality you need. One way to see how packages relate to each other
-is by using the Dependency Explorer UI with the BitBake command:
-::
+is by using the Dependency Explorer UI with the BitBake command::

    $ cd image-directory
    $ bitbake -u taskexp -g image
@@ -4240,8 +4180,7 @@ instead of ``udev``.

 Use your ``local.conf`` file to make changes. For example, to eliminate
 ``udev`` and ``glib``, set the following in the local configuration
-file:
-::
+file::

    VIRTUAL-RUNTIME_dev_manager = ""

@@ -4269,8 +4208,7 @@ building? Which drivers do you build by default?
    You can modify the kernel source if you want to help with boot time.

 Run the ``ksize.py`` script from the top-level Linux build directory to
-get an idea of what is making up the kernel:
-::
+get an idea of what is making up the kernel::

    $ cd top-level-linux-build-directory
    $ ksize.py > ksize.log
@@ -4284,8 +4222,7 @@ in a compressed kernel image. Look to reduce the areas that are large
 and taking up around the "90% rule."

 To examine, or drill down, into any particular area, use the ``-d``
-option with the script:
-::
+option with the script::

    $ ksize.py -d > ksize.log

@@ -4542,15 +4479,13 @@ to do is inherit the
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
@@ -4567,8 +4502,7 @@ directory separate from the external source directory as specified by
 to have the source built in the same directory in which it resides, or
 some other nominated directory, you can set
 :term:`EXTERNALSRC_BUILD`
-to point to that directory:
-::
+to point to that directory::

    EXTERNALSRC_BUILD_pn-myrecipe = "path-to-your-source-tree"

@@ -4844,8 +4778,7 @@ library files.
    static library files through ``${PN}-dev``.

 Following is part of the BitBake configuration file, where you can see
-how the static library files are defined:
-::
+how the static library files are defined::

    PACKAGE_BEFORE_PN ?= ""
    PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
@@ -4953,8 +4886,7 @@ After you have set up the recipes, you need to define the actual
 combination of multiple libraries you want to build. You accomplish this
 through your ``local.conf`` configuration file in the
 :term:`Build Directory`. An example
-configuration would be as follows:
-::
+configuration would be as follows::

    MACHINE = "qemux86-64"
    require conf/multilib.conf
@@ -4970,14 +4902,12 @@ on this particular tuning, see

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

@@ -5072,8 +5002,7 @@ you have other recipes that depend on a given library, you need to use
 the :term:`DEPENDS` variable to
 create the dependency. Continuing with the same example, if you want to
 have a recipe depend on the 1.8 version of the ``clutter`` library, use
-the following in your recipe:
-::
+the following in your recipe::

    DEPENDS = "clutter-1.8"

@@ -5116,8 +5045,7 @@ follows:
 -  Support for large images exists.

 To use the x32 psABI, you need to edit your ``conf/local.conf``
-configuration file as follows:
-::
+configuration file as follows::

    MACHINE = "qemux86-64"
    DEFAULTTUNE = "x86-64-x32"
@@ -5126,8 +5054,7 @@ configuration file as follows:

 Once you have set
 up your configuration file, use BitBake to build an image that supports
-the x32 psABI. Here is an example:
-::
+the x32 psABI. Here is an example::

    $ bitbake core-image-sato

@@ -5434,8 +5361,7 @@ Getting Help

 You can get general help for the ``wic`` command by entering the ``wic``
 command by itself or by entering the command with a help argument as
-follows:
-::
+follows::

    $ wic -h
    $ wic --help
@@ -5443,32 +5369,27 @@ follows:

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
@@ -5487,8 +5408,7 @@ command to return the available Wic images as follows:
 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a
 particular image. For example, the following command returns help on the
-"beaglebone-yocto" image:
-::
+"beaglebone-yocto" image::

    $ wic list beaglebone-yocto help

@@ -5525,8 +5445,7 @@ can point to arbitrary kernel, root filesystem locations, and so forth.
 Contrast this behavior with cooked mode where Wic looks in the Build
 Directory (e.g. ``tmp/deploy/images/``\ machine).

-The general form of the ``wic`` command in raw mode is:
-::
+The general form of the ``wic`` command in raw mode is::

    $ wic create wks_file options ...

@@ -5584,8 +5503,7 @@ a kickstart file and the name of the image from which to use artifacts
 by using the "-e" option. Wic looks in the Build Directory (e.g.
 ``tmp/deploy/images/``\ machine) for artifacts.

-The general form of the ``wic`` command using Cooked Mode is as follows:
-::
+The general form of the ``wic`` command using Cooked Mode is as follows::

    $ wic create wks_file -e IMAGE_NAME

@@ -5610,14 +5528,12 @@ Using an Existing Kickstart File
 If you do not want to create your own kickstart file, you can use an
 existing file provided by the Wic installation. As shipped, kickstart
 files can be found in the :ref:`overview-manual/overview-manual-development-environment:yocto project source repositories` in the
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
@@ -5635,15 +5551,13 @@ Use the following command to list the available kickstart files:

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
@@ -5703,8 +5617,7 @@ When the Wic implementation needs to invoke a partition-specific
 implementation, it looks for the plugin with the same name as the
 ``--source`` parameter used in the kickstart file given to that
 partition. For example, if the partition is set up using the following
-command in a kickstart file:
-::
+command in a kickstart file::

    part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024

@@ -5715,8 +5628,7 @@ members of the matching source plugin (i.e. ``bootimg-pcbios``) in the
 To be more concrete, here is the corresponding plugin definition from
 the ``bootimg-pcbios.py`` file for the previous command along with an
 example method called by the Wic implementation when it needs to prepare
-a partition using an implementation-specific function:
-::
+a partition using an implementation-specific function::

                 .
                 .
@@ -5811,8 +5723,7 @@ Generate an Image using an Existing Kickstart File
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 This example runs in Cooked Mode and uses the ``mkefidisk`` kickstart
-file:
-::
+file::

    $ wic create mkefidisk -e core-image-minimal
    INFO: Building wic-tools...
@@ -5848,8 +5759,7 @@ and kickstart file information.
 Continuing with the example, you can now write the image from the Build
 Directory onto a USB stick, or whatever media for which you built your
 image, and boot from the media. You can write the image by using
-``bmaptool`` or ``dd``:
-::
+``bmaptool`` or ``dd``::

    $ oe-run-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX

@@ -5888,8 +5798,7 @@ will need to boot from ``sdb`` instead of ``sda``, which is what the

 The example begins by making a copy of the ``directdisk-gpt.wks`` file
 in the ``scripts/lib/image/canned-wks`` directory and then by changing
-the lines that specify the target disk from which to boot.
-::
+the lines that specify the target disk from which to boot::

    $ cp /home/stephano/poky/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
         /home/stephano/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
@@ -5897,8 +5806,7 @@ the lines that specify the target disk from which to boot.
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
 example changes the following two lines and leaves the remaining lines
-untouched:
-::
+untouched::

    part /boot --source bootimg-pcbios --ondisk sdb --label boot --active --align 1024
    part / --source rootfs --ondisk sdb --fstype=ext4 --label platform --align 1024 --use-uuid
@@ -5907,8 +5815,7 @@ Once the lines are changed, the
 example generates the ``directdisksdb-gpt`` image. The command points
 the process at the ``core-image-minimal`` artifacts for the Next Unit of
 Computing (nuc) :term:`MACHINE` the
-``local.conf``.
-::
+``local.conf``::

    $ wic create directdisksdb-gpt -e core-image-minimal
    INFO: Building wic-tools...
@@ -5935,8 +5842,7 @@ Computing (nuc) :term:`MACHINE` the

 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot
-the resulting media:
-::
+the resulting media::

    $ sudo dd if=directdisksdb-gpt-201710090938-sdb.direct of=/dev/sdb
    140966+0 records in
@@ -5950,8 +5856,7 @@ Using a Modified Kickstart File and Running in Raw Mode
 This next example manually specifies each build artifact (runs in Raw
 Mode) and uses a modified kickstart file. The example also uses the
 ``-o`` option to cause Wic to create the output somewhere other than the
-default output directory, which is the current directory:
-::
+default output directory, which is the current directory::

    $ wic create /home/stephano/my_yocto/test.wks -o /home/stephano/testwic \
         --rootfs-dir /home/stephano/build/master/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
@@ -6148,8 +6053,7 @@ any type of image. Use these steps to flash an image using Bmaptool:
          $ sudo chmod 666 /dev/sdX
          $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX

-For help on the ``bmaptool`` command, use the following command:
-::
+For help on the ``bmaptool`` command, use the following command::

    $ bmaptool --help

@@ -6244,8 +6148,7 @@ your build output more secure. The security flags are in the

 Use the following line in your ``local.conf`` file or in your custom
 distribution configuration file to enable the security compiler and
-linker flags for your build:
-::
+linker flags for your build::

    require conf/distro/include/security_flags.inc

@@ -6429,8 +6332,7 @@ The OpenEmbedded build system uses the environment variable
 configuration information that ultimately ends up in the
 :term:`Build Directory` ``conf`` directory.
 By default, ``TEMPLATECONF`` is set as follows in the ``poky``
-repository:
-::
+repository::

    TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}

@@ -6472,8 +6374,7 @@ display BitBake targets as part of the script output. Customizing this
 targets appears as part of the script's output.

 Here is the default list of targets displayed as a result of running
-either of the setup scripts:
-::
+either of the setup scripts::

    You can now run 'bitbake <target>'

@@ -6494,8 +6395,7 @@ Conserving Disk Space During Builds

 To help conserve disk space during builds, you can add the following
 statement to your project's ``local.conf`` configuration file found in
-the :term:`Build Directory`:
-::
+the :term:`Build Directory`::

    INHERIT += "rm_work"

@@ -6683,8 +6583,7 @@ The simplest form for a PR Service is for it to exist for a single host
 development system that builds the package feed (building system). For
 this scenario, you can enable a local PR Service by setting
 :term:`PRSERV_HOST` in your
-``local.conf`` file in the :term:`Build Directory`:
-::
+``local.conf`` file in the :term:`Build Directory`::

    PRSERV_HOST = "localhost:0"

@@ -6695,8 +6594,7 @@ stopping the server.
 If you have a more complex setup where multiple host development systems
 work against a common, shared package feed, you have a single PR Service
 running and it is connected to each building system. For this scenario,
-you need to start the PR Service using the ``bitbake-prserv`` command:
-::
+you need to start the PR Service using the ``bitbake-prserv`` command::

    bitbake-prserv --host ip --port port --start

@@ -6708,8 +6606,7 @@ server and port.
 It is also recommended you use build history, which adds some sanity
 checks to binary package versions, in conjunction with the server that
 is running the PR Service. To enable build history, add the following to
-each building system's ``local.conf`` file:
-::
+each building system's ``local.conf`` file::

    # It is recommended to activate "buildhistory" for testing the PR service
    INHERIT += "buildhistory"
@@ -6780,15 +6677,13 @@ the specific source code revision from which to build. You set the
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

@@ -6858,8 +6753,7 @@ package for each one it finds by appending to the
 :term:`PACKAGES` variable and
 setting the appropriate values for ``FILES_packagename``,
 ``RDEPENDS_packagename``, ``DESCRIPTION_packagename``, and so forth.
-Here is an example from the ``lighttpd`` recipe:
-::
+Here is an example from the ``lighttpd`` recipe::

    python populate_packages_prepend () {
        lighttpd_libdir = d.expand('${libdir}')
@@ -6902,8 +6796,7 @@ directory of the ``poky`` :ref:`source repository <yocto-project-repositories>`.
 also find examples in ``meta/classes/kernel.bbclass``.

 Following is a reference that shows ``do_split_packages`` mandatory and
-optional arguments:
-::
+optional arguments::

    Mandatory arguments

@@ -6991,8 +6884,7 @@ any dependencies on optional modules from other recipes are satisfied by
 your recipe. You can be sure these dependencies are satisfied by using
 the :term:`PACKAGES_DYNAMIC`
 variable. Here is an example that continues with the ``lighttpd`` recipe
-shown earlier:
-::
+shown earlier::

    PACKAGES_DYNAMIC = "lighttpd-module-.*"

@@ -7121,15 +7013,13 @@ target's package database(s) later once your image is up and running.
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

@@ -7179,8 +7069,7 @@ your packaging choice (i.e. the
 :term:`PACKAGE_CLASSES`
 setting), simply start the server. The following example assumes a build
 directory of ``~/poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
-setting of "package_rpm":
-::
+setting of "package_rpm"::

    $ cd ~/poky/build/tmp/deploy/rpm
    $ python3 -m http.server
@@ -7373,8 +7262,7 @@ Signing RPM Packages

 To enable signing RPM packages, you must set up the following
 configurations in either your ``local.config`` or ``distro.config``
-file:
-::
+file::

    # Inherit sign_rpm.bbclass to enable signing functionality
    INHERIT += " sign_rpm"
@@ -7405,8 +7293,7 @@ signed package feeds for IPK and RPM packages.

 The steps you need to take to enable signed package feed use are similar
 to the steps used to sign RPM packages. You must define the following in
-your ``local.config`` or ``distro.config`` file:
-::
+your ``local.config`` or ``distro.config`` file::

    INHERIT += "sign_package_feed"
    PACKAGE_FEED_GPG_NAME = "key_name"
@@ -7445,8 +7332,7 @@ hand, the test can be anything from a simple shell script that runs a
 binary and checks the output to an elaborate system of test binaries and
 data files.

-The test generates output in the format used by Automake:
-::
+The test generates output in the format used by Automake::

    result: testname

@@ -7468,8 +7354,7 @@ To add package testing to your build, add the
 :term:`DISTRO_FEATURES` and
 :term:`EXTRA_IMAGE_FEATURES`
 variables to your ``local.conf`` file, which is found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    DISTRO_FEATURES_append = " ptest"
    EXTRA_IMAGE_FEATURES += "ptest-pkgs"
@@ -7624,8 +7509,7 @@ which is a file browser web application.
    You must know the ``cute-files`` module version.

 The first thing you need to do is use ``devtool`` and the NPM fetcher to
-create the recipe:
-::
+create the recipe::

    $ devtool add "npm://registry.npmjs.org;package=cute-files;version=1.0.2"

@@ -7653,8 +7537,7 @@ runs.
    practical way to have the licenses for all of the dependencies
    represented in the license manifest of the image.

-The ``devtool edit-recipe`` command lets you take a look at the recipe:
-::
+The ``devtool edit-recipe`` command lets you take a look at the recipe::

    $ devtool edit-recipe cute-files
    SUMMARY = "Turn any folder on your computer into a cute file browser, available on the local network."
@@ -7687,8 +7570,7 @@ Three key points exist in the previous example:
    :ref:`npm <ref-classes-npm>` class to package
    up all the modules.

-You can run the following command to build the ``cute-files`` package:
-::
+You can run the following command to build the ``cute-files`` package::

    $ devtool build cute-files

@@ -7696,8 +7578,7 @@ Remember that ``nodejs`` must be installed on
 the target before your package.

 Assuming 192.168.7.2 for the target's IP address, use the following
-command to deploy your package:
-::
+command to deploy your package::

    $ devtool deploy-target -s cute-files root@192.168.7.2

@@ -7738,15 +7619,13 @@ projects method, you provide ``devtool`` with an URL that points to the
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
@@ -7798,8 +7677,7 @@ by the literal sequence '\\n'. The separator can be redefined using the
 variable flag ``separator``.

 The following is an example that adds two custom fields for ipk
-packages:
-::
+packages::

    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup:Applications/Spreadsheets"

@@ -7829,8 +7707,7 @@ adding statements to your configuration file so that the build process
 checks local directories first for existing tarballs before checking the
 Internet.

-Here is an efficient way to set it up in your ``local.conf`` file:
-::
+Here is an efficient way to set it up in your ``local.conf`` file::

    SOURCE_MIRROR_URL ?= "file:///home/you/your-download-dir/"
    INHERIT += "own-mirrors"
@@ -7909,15 +7786,13 @@ following sections.
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

@@ -7925,8 +7800,7 @@ Doing so removes any
 redundant SysVinit scripts.

 To remove initscripts from your image altogether, set this variable
-also:
-::
+also::

    VIRTUAL-RUNTIME_initscripts = ""

@@ -7936,8 +7810,7 @@ For information on the backfill variable, see
 Using systemd for the Main Image and Using SysVinit for the Rescue Image
 ------------------------------------------------------------------------

-Set these variables in your distribution configuration file as follows:
-::
+Set these variables in your distribution configuration file as follows::

    DISTRO_FEATURES_append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -7973,8 +7846,7 @@ Using Persistent and Pre-Populated\ ``/dev``

 To use the static method for device population, you need to set the
 :term:`USE_DEVFS` variable to "0"
-as follows:
-::
+as follows::

    USE_DEVFS = "0"

@@ -7986,8 +7858,7 @@ machine or distro configuration file. Alternatively, you can set this
 variable in your ``local.conf`` configuration file.

 If you do not define the ``IMAGE_DEVICE_TABLES`` variable, the default
-``device_table-minimal.txt`` is used:
-::
+``device_table-minimal.txt`` is used::

    IMAGE_DEVICE_TABLES = "device_table-mymachine.txt"

@@ -8001,8 +7872,7 @@ Using ``devtmpfs`` and a Device Manager

 To use the dynamic method for device population, you need to use (or be
 sure to set) the :term:`USE_DEVFS`
-variable to "1", which is the default:
-::
+variable to "1", which is the default::

    USE_DEVFS = "1"

@@ -8019,8 +7889,7 @@ To have more control over the device nodes, you can use a device manager
 like ``udev`` or ``busybox-mdev``. You choose the device manager by
 defining the ``VIRTUAL-RUNTIME_dev_manager`` variable in your machine or
 distro configuration file. Alternatively, you can set this variable in
-your ``local.conf`` configuration file:
-::
+your ``local.conf`` configuration file::

    VIRTUAL-RUNTIME_dev_manager = "udev"

@@ -8043,14 +7912,12 @@ Subversion (SVN), Git, and Bazaar (BZR) repositories.

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

@@ -8058,20 +7925,17 @@ Then, you can add the following to your
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
@@ -8130,8 +7994,7 @@ image's recipe file via the ``IMAGE_FEATURES`` variable:

 As an alternative, you can add the same feature
 from within your build directory's ``local.conf`` file with the
-associated ``EXTRA_IMAGE_FEATURES`` variable, as in:
-::
+associated ``EXTRA_IMAGE_FEATURES`` variable, as in::

    EXTRA_IMAGE_FEATURES = "read-only-rootfs"

@@ -8228,8 +8091,7 @@ Build history is disabled by default. To enable it, add the following
 ``INHERIT`` statement and set the
 :term:`BUILDHISTORY_COMMIT`
 variable to "1" at the end of your ``conf/local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "1"
@@ -8317,8 +8179,7 @@ and actual revisions might differ when
 :term:`SRCREV` is set to
 ${:term:`AUTOREV`}. Here is an
 example assuming
-``buildhistory/packages/qemux86-poky-linux/linux-yocto/latest_srcrev``):
-::
+``buildhistory/packages/qemux86-poky-linux/linux-yocto/latest_srcrev``)::

    # SRCREV_machine = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
    SRCREV_machine = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
@@ -8331,8 +8192,7 @@ collect the stored ``SRCREV`` values from build history and report them
 in a format suitable for use in global configuration (e.g.,
 ``local.conf`` or a distro include file) to override floating
 ``AUTOREV`` values to a fixed set of revisions. Here is some example
-output from this command:
-::
+output from this command::

    $ buildhistory-collect-srcrevs -a
    # i586-poky-linux
@@ -8447,8 +8307,7 @@ image. If you are just interested in this information and not interested
 in collecting specific package or SDK information, you can enable
 writing only image information without any history by adding the
 following to your ``conf/local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "0"
@@ -8547,8 +8406,7 @@ interface.
 To see any changes that have occurred (assuming you have
 :term:`BUILDHISTORY_COMMIT` = "1"),
 you can simply use any Git command that allows you to view the history
-of a repository. Here is one method:
-::
+of a repository. Here is one method::

    $ git log -p

@@ -8558,8 +8416,7 @@ however, that this method does show changes that are not significant

 A command-line tool called ``buildhistory-diff`` does exist, though,
 that queries the Git repository and prints just the differences that
-might be significant in human-readable form. Here is an example:
-::
+might be significant in human-readable form. Here is an example::

    $ ~/poky/poky/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
@@ -8886,8 +8743,7 @@ wish to experiment with automated hardware testing, you can use the
 the required power action. This script requires either KDialog or Zenity
 to be installed. To use this script, set the
 :term:`TEST_POWERCONTROL_CMD`
-variable as follows:
-::
+variable as follows::

    TEST_POWERCONTROL_CMD = "${COREBASE}/scripts/contrib/dialog-power-control"

@@ -8909,8 +8765,7 @@ connecting to a remote console server. Regardless of the case, the
 command simply needs to connect to the serial console and forward that
 connection to standard input and output as any normal terminal program
 does. For example, to use the picocom terminal program on serial device
-``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows:
-::
+``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows::

    TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"

@@ -8918,8 +8773,7 @@ For local
 devices where the serial port device disappears when the device reboots,
 an additional "serdevtry" wrapper script is provided. To use this
 wrapper, simply prefix the terminal command with
-``${COREBASE}/scripts/contrib/serdevtry``:
-::
+``${COREBASE}/scripts/contrib/serdevtry``::

    TEST_SERIALCONTROL_CMD = "${COREBASE}/scripts/contrib/serdevtry picocom -b 115200 /dev/ttyUSB0"

@@ -9025,16 +8879,14 @@ test execution off to a scheduler. You can only export tests that are
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

@@ -9043,28 +8895,24 @@ Exporting the tests places them in the
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
@@ -9360,14 +9208,12 @@ variables>` did not work out as expected.
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

@@ -9390,8 +9236,7 @@ variable flags (varflags) set on the variable. The output can be very
 helpful during debugging.

 Variables that are exported to the environment are preceded by
-``export`` in the output of ``bitbake -e``. See the following example:
-::
+``export`` in the output of ``bitbake -e``. See the following example::

    export CC="i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/ulf/poky/build/tmp/sysroots/qemux86"

@@ -9463,8 +9308,7 @@ Following are a few of the available ``oe-pkgdata-util`` subcommands.
    of the recipes that produce the given packages.

 For more information on the ``oe-pkgdata-util`` command, use the help
-facility:
-::
+facility::

    $ oe-pkgdata-util --help
    $ oe-pkgdata-util subcommand --help
@@ -9479,8 +9323,7 @@ before the one you have specified. Dependency information can help you
 understand why a recipe is built.

 To generate dependency information for a recipe, run the following
-command:
-::
+command::

    $ bitbake -g recipename

@@ -9528,8 +9371,7 @@ format and can be converted to images (e.g. using the ``dot`` tool from
       displays paths between graph nodes.

 You can use a different method to view dependency information by using
-the following command:
-::
+the following command::

    $ bitbake -g -u taskexp recipename

@@ -9557,8 +9399,7 @@ If you are unsure whether a variable dependency is being picked up
 automatically for a given task, you can list the variable dependencies
 BitBake has determined by doing the following:

-1. Build the recipe containing the task:
-::
+1. Build the recipe containing the task::

    $ bitbake recipename

@@ -9613,8 +9454,7 @@ call ``bitbake-diffsigs`` with just one file, the command behaves like

 You can also use BitBake to dump out the signature construction
 information without executing tasks by using either of the following
-BitBake command-line options:
-::
+BitBake command-line options::

    ‐‐dump-signatures=SIGNATURE_HANDLER
    -S SIGNATURE_HANDLER
@@ -9707,8 +9547,7 @@ behavior in most cases is: ``do_fetch``, ``do_unpack``, ``do_patch``,
 ``do_build`` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
-use the ``-c`` option in BitBake. Here is an example:
-::
+use the ``-c`` option in BitBake. Here is an example::

    $ bitbake matchbox-desktop -c devshell

@@ -9733,8 +9572,7 @@ out), then you can use the ``-f`` option.
    [\ :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ]
    variable flag is already set for the task.

-The following example shows one way you can use the ``-f`` option:
-::
+The following example shows one way you can use the ``-f`` option::

    $ bitbake matchbox-desktop
              .
@@ -9763,8 +9601,7 @@ Using this option invalidates the given task and then runs the
 :ref:`ref-tasks-build` task, which is
 the default task if no task is given, and the tasks on which it depends.
 You could replace the final two commands in the previous example with
-the following single command:
-::
+the following single command::

    $ bitbake matchbox-desktop -C compile

@@ -9796,8 +9633,7 @@ task dependency mechanisms.


 You can view a list of tasks in a given package by running the
-``do_listtasks`` task as follows:
-::
+``do_listtasks`` task as follows::

    $ bitbake matchbox-desktop -c listtasks

@@ -9825,8 +9661,7 @@ Building with No Dependencies
 -----------------------------

 To build a specific recipe (``.bb`` file), you can use the following
-command form:
-::
+command form::

    $ bitbake -b somepath/somerecipe.bb

@@ -9895,8 +9730,7 @@ in the log, use the "debug" loglevel.
 Following is an example written in Python. The code handles logging for
 a function that determines the number of tasks needed to be run. See the
 ":ref:`ref-tasks-listtasks`"
-section for additional information:
-::
+section for additional information::

    python do_listtasks() {
        bb.debug(2, "Starting to figure out the task list")
@@ -10058,13 +9892,11 @@ build, set the
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

@@ -10072,8 +9904,7 @@ For information on how to use a
 ``devshell``, see the "`Using a Development
 Shell <#platdev-appdev-devshell>`__" section.

-In the ``devshell``, do the following:
-::
+In the ``devshell``, do the following::

    $ make clean
    $ make tools/snep-send.o
@@ -10081,8 +9912,7 @@ In the ``devshell``, do the following:
 The ``devshell`` commands cause the failure to clearly
 be visible. In this case, a missing dependency exists for the "neard"
 Makefile target. Here is some abbreviated, sample output with the
-missing dependency clearly visible at the end:
-::
+missing dependency clearly visible at the end::

    i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/scott-lenovo/......
       .
@@ -10103,8 +9933,7 @@ Creating a Patch for the Fix

 Because there is a missing dependency for the Makefile target, you need
 to patch the ``Makefile.am`` file, which is generated from
-``Makefile.in``. You can use Quilt to create the patch:
-::
+``Makefile.in``. You can use Quilt to create the patch::

    $ quilt new parallelmake.patch
    Patch patches/parallelmake.patch is now on top
@@ -10116,14 +9945,12 @@ For more information on using Quilt, see the

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
@@ -10131,8 +9958,7 @@ patch:
 Once
 the patch file exists, you need to add it back to the originating recipe
 folder. Here is an example assuming a top-level
-:term:`Source Directory` named ``poky``:
-::
+:term:`Source Directory` named ``poky``::

    $ cp patches/parallelmake.patch poky/meta/recipes-connectivity/neard/neard

@@ -10140,8 +9966,7 @@ The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
 :term:`SRC_URI` statement includes
 the patch file. The recipe file is in the folder above the patch. Here
-is what the edited ``SRC_URI`` statement would look like:
-::
+is what the edited ``SRC_URI`` statement would look like::

    SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
               file://neard.in \
@@ -10150,8 +9975,7 @@ is what the edited ``SRC_URI`` statement would look like:
              "

 With the patch complete and moved to the correct folder and the
-``SRC_URI`` statement updated, you can exit the ``devshell``:
-::
+``SRC_URI`` statement updated, you can exit the ``devshell``::

    $ exit

@@ -10159,16 +9983,14 @@ Testing the Build
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
@@ -11007,8 +10829,7 @@ Specifying the ``LIC_FILES_CHKSUM`` Variable

 The ``LIC_FILES_CHKSUM`` variable contains checksums of the license text
 in the source code for the recipe. Following is an example of how to
-specify ``LIC_FILES_CHKSUM``:
-::
+specify ``LIC_FILES_CHKSUM``::

    LIC_FILES_CHKSUM = "file://COPYING;md5=xxxx \
                        file://licfile1.txt;beginline=5;endline=29;md5=yyyy \
@@ -11031,8 +10852,7 @@ variable as the default directory when searching files listed in
 ``LIC_FILES_CHKSUM``. The previous example employs the default
 directory.

-Consider this next example:
-::
+Consider this next example::

    LIC_FILES_CHKSUM = "file://src/ls.c;beginline=5;endline=16;\
                                        md5=bb14ed3c4cda583abc85401304b5cd4e"
@@ -11096,15 +10916,13 @@ are defined on a recipe-by-recipe basis through the
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

@@ -11119,8 +10937,7 @@ could add either the string "commercial_gst-plugins-ugly" or the more
 general string "commercial" to ``LICENSE_FLAGS_WHITELIST``. See the
 "`License Flag Matching <#license-flag-matching>`__" section for a full
 explanation of how ``LICENSE_FLAGS`` matching works. Here is the
-example:
-::
+example::

    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly"

@@ -11128,8 +10945,7 @@ Likewise, to additionally enable the package built from the recipe
 containing ``LICENSE_FLAGS = "license_${PN}_${PV}"``, and assuming that
 the actual recipe name was ``emgd_1.10.bb``, the following string would
 enable that package as well as the original ``gst-plugins-ugly``
-package:
-::
+package::

    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly license_emgd_1.10"

@@ -11185,8 +11001,7 @@ matches any expanded ``LICENSE_FLAGS`` definition that starts with the
 string "commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
 hypothetical recipes named "foo" and "bar" assuming those recipes simply
-specify the following:
-::
+specify the following::

    LICENSE_FLAGS = "commercial"

@@ -11224,8 +11039,7 @@ Other Variables Related to Commercial Licenses

 Other helpful variables related to commercial license handling exist and
 are defined in the
-``poky/meta/conf/distro/include/default-distrovars.inc`` file:
-::
+``poky/meta/conf/distro/include/default-distrovars.inc`` file::

    COMMERCIAL_AUDIO_PLUGINS ?= ""
    COMMERCIAL_VIDEO_PLUGINS ?= ""
@@ -11233,8 +11047,7 @@ are defined in the
 If you
 want to enable these components, you can do so by making sure you have
 statements similar to the following in your ``local.conf`` configuration
-file:
-::
+file::

    COMMERCIAL_AUDIO_PLUGINS = "gst-plugins-ugly-mad \
        gst-plugins-ugly-mpegaudioparse"
@@ -11246,8 +11059,7 @@ file:
 Of course, you could also create a matching whitelist for those
 components using the more general "commercial" in the whitelist, but
 that would also enable all the other packages with ``LICENSE_FLAGS``
-containing "commercial", which you may or may not want:
-::
+containing "commercial", which you may or may not want::

    LICENSE_FLAGS_WHITELIST = "commercial"

@@ -11327,8 +11139,7 @@ of compliance in mind.
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
 the ``local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    INHERIT += "archiver"
    ARCHIVER_MODE[src] = "original"
@@ -11384,8 +11195,7 @@ One requirement that is often overlooked is inclusion of license text.
 This requirement also needs to be dealt with prior to generating the
 final image. Some licenses require the license text to accompany the
 binary. You can achieve this by adding the following to your
-``local.conf`` file:
-::
+``local.conf`` file::

    COPY_LIC_MANIFEST = "1"
    COPY_LIC_DIRS = "1"
@@ -11452,8 +11262,7 @@ thing a development organization might want to consider for end-user
 convenience is to modify ``meta-poky/conf/bblayers.conf.sample`` to
 ensure that when the end user utilizes the released build system to
 build an image, the development organization's layers are included in
-the ``bblayers.conf`` file automatically:
-::
+the ``bblayers.conf`` file automatically::

    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -11521,8 +11330,7 @@ variable. Using this variable also avoids QA errors when you use a
 non-common, non-CLOSED license in a recipe.

 The following is an example that uses the ``LICENSE.Abilis.txt`` file as
-the license from the fetched source:
-::
+the license from the fetched source::

    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"

@@ -11565,8 +11373,7 @@ class by adding the following statement to the end of your
 By default, the error reporting feature stores information in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 However, you can specify a directory to use by adding the following to
-your ``local.conf`` file:
-::
+your ``local.conf`` file::

    ERR_REPORT_DIR = "path"

@@ -11575,8 +11382,7 @@ reporting causes the build process to collect the errors and store them
 in a file as previously described. When the build system encounters an
 error, it includes a command as part of the console output. You can run
 the command to send the error file to the server. For example, the
-following command sends the errors to an upstream server:
-::
+following command sends the errors to an upstream server::

    $ send-error-report /home/brandusa/project/poky/build/tmp/log/error-report/error_report_201403141617.txt

@@ -11584,8 +11390,7 @@ In the previous example, the errors are sent to a public database
 available at https://errors.yoctoproject.org, which is used by the
 entire community. If you specify a particular server, you can send the
 errors to a different database. Use the following command for more
-information on available options:
-::
+information on available options::

    $ send-error-report --help

@@ -11603,8 +11408,7 @@ Disabling the Tool

 To disable the error reporting feature, simply remove or comment out the
 following statement from the end of your ``local.conf`` file in your
-:term:`Build Directory`.
-::
+:term:`Build Directory`::

    INHERIT += "report-error"

@@ -11669,8 +11473,8 @@ Wayland with Kernel Mode Setting
 (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
 support, include the "wayland" flag in the
 :term:`DISTRO_FEATURES`
-statement in your ``local.conf`` file:
-::
+s:tatement in your ``local.conf`` file:
+

    DISTRO_FEATURES_append = " wayland"

@@ -11687,8 +11491,8 @@ Installing Wayland and Weston
 To install the Wayland feature into an image, you must include the
 following
 :term:`CORE_IMAGE_EXTRA_INSTALL`
-statement in your ``local.conf`` file:
-::
+s:tatement in your ``local.conf`` file:
+

    CORE_IMAGE_EXTRA_INSTALL += "wayland weston"

diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index c91e8b538..341ecc84d 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -325,8 +325,7 @@ present, the toolchain is also automatically used.
 QEMU Command-Line Syntax
 ========================

-The basic ``runqemu`` command syntax is as follows:
-::
+The basic ``runqemu`` command syntax is as follows::

    $ runqemu [option ] [...]

@@ -337,8 +336,7 @@ timestamp when it needs to look for an image. Minimally, through the use
 of options, you must provide either a machine name, a virtual machine
 image (``*wic.vmdk``), or a kernel image (``*.bin``).

-Following is the command-line help output for the ``runqemu`` command:
-::
+Following is the command-line help output for the ``runqemu`` command::

    $ runqemu --help

diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index 444037c3a..2d0dc8208 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -108,15 +108,13 @@ You can use the
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

@@ -159,8 +157,7 @@ types to form the final description of what will be assembled and built.
 While the kernel Metadata syntax does not enforce any logical separation
 of configuration fragments, patches, features or kernel types, best
 practices dictate a logical separation of these types of Metadata. The
-following Metadata file hierarchy is recommended:
-::
+following Metadata file hierarchy is recommended::

    base/
       bsp/
@@ -224,8 +221,7 @@ used with the ``linux-yocto-4.12`` kernel as defined outside of the
 recipe space (i.e. ``yocto-kernel-cache``). This Metadata consists of
 two files: ``smp.scc`` and ``smp.cfg``. You can find these files in the
 ``cfg`` directory of the ``yocto-4.12`` branch in the
-``yocto-kernel-cache`` Git repository:
-::
+``yocto-kernel-cache`` Git repository::

    cfg/smp.scc:
       define KFEATURE_DESCRIPTION "Enable SMP for 32 bit builds"
@@ -267,8 +263,7 @@ non-hardware fragment.

 As described in the
 ":ref:`kernel-dev/kernel-dev-common:validating configuration`" section, you can
-use the following BitBake command to audit your configuration:
-::
+use the following BitBake command to audit your configuration::

    $ bitbake linux-yocto -c kernel_configcheck -f

@@ -289,8 +284,7 @@ in the ``patches/build`` directory of the ``yocto-4.12`` branch in the
 ``yocto-kernel-cache`` Git repository.

 The following listings show the ``build.scc`` file and part of the
-``modpost-mask-trivial-warnings.patch`` file:
-::
+``modpost-mask-trivial-warnings.patch`` file::

    patches/build/build.scc:
       patch arm-serialize-build-targets.patch
@@ -336,8 +330,7 @@ Features

 Features are complex kernel Metadata types that consist of configuration
 fragments, patches, and possibly other feature description files. As an
-example, consider the following generic listing:
-::
+example, consider the following generic listing::

    features/myfeature.scc
       define KFEATURE_DESCRIPTION "Enable myfeature"
@@ -373,15 +366,13 @@ the ``linux-yocto_4.12.bb`` kernel recipe found in
 ``poky/meta/recipes-kernel/linux``, a
 :ref:`require <bitbake:require-inclusion>` directive
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

@@ -414,8 +405,7 @@ for Linux Yocto kernels:
 For any given kernel type, the Metadata is defined by the ``.scc`` (e.g.
 ``standard.scc``). Here is a partial listing for the ``standard.scc``
 file, which is found in the ``ktypes/standard`` directory of the
-``yocto-kernel-cache`` Git repository:
-::
+``yocto-kernel-cache`` Git repository::

    # Include this kernel type fragment to get the standard features and
    # configuration values.
@@ -486,15 +476,13 @@ Description Overview
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
@@ -502,8 +490,7 @@ Yocto Project:
 Each file uses the root name (i.e "beaglebone") BSP name followed by the
 kernel type.

-Examine the ``beaglebone-standard.scc`` file:
-::
+Examine the ``beaglebone-standard.scc`` file::

    define KMACHINE beaglebone
    define KTYPE standard
@@ -537,8 +524,7 @@ description file match.

 To separate your kernel policy from your hardware configuration, you
 include a kernel type (``ktype``), such as "standard". In the previous
-example, this is done using the following:
-::
+example, this is done using the following::

    include ktypes/standard/standard.scc

@@ -548,13 +534,11 @@ policy. See the "`Kernel Types <#kernel-types>`__" section for more
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

@@ -562,15 +546,13 @@ For information on how to break a complete ``.config`` file into the various
 configuration fragments, see the ":ref:`creating-config-fragments`" section.

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
@@ -629,8 +611,7 @@ found on the machine. This ``minnow.scc`` description file is then
 included in each of the three "minnow" description files for the
 supported kernel types (i.e. "standard", "preempt-rt", and "tiny").
 Consider the "minnow" description for the "standard" kernel type (i.e.
-``minnow-standard.scc``):
-::
+``minnow-standard.scc``)::

    define KMACHINE minnow
    define KTYPE standard
@@ -662,8 +643,7 @@ that defines all enabled hardware for the BSP that is common to all
 kernel types. Using this command significantly reduces duplication.

 Now consider the "minnow" description for the "tiny" kernel type (i.e.
-``minnow-tiny.scc``):
-::
+``minnow-tiny.scc``)::

    define KMACHINE minnow
    define KTYPE tiny
@@ -726,8 +706,7 @@ See the ":ref:`kernel-dev/kernel-dev-common:modifying an existing recipe`"
 section for more information.

 Here is an example that shows a trivial tree of kernel Metadata stored
-in recipe-space within a BSP layer:
-::
+in recipe-space within a BSP layer::

    meta-my_bsp_layer/
    `-- recipes-kernel
@@ -750,8 +729,7 @@ value when changing the content of files not explicitly listed in the

 If the BSP description is in recipe space, you cannot simply list the
 ``*.scc`` in the ``SRC_URI`` statement. You need to use the following
-form from your kernel append file:
-::
+form from your kernel append file::

    SRC_URI_append_myplatform = " \
        file://myplatform;type=kmeta;destsuffix=myplatform \
@@ -765,8 +743,7 @@ reside in a separate repository. The OpenEmbedded build system adds the
 Metadata to the build as a "type=kmeta" repository through the
 :term:`SRC_URI` variable. As an
 example, consider the following ``SRC_URI`` statement from the
-``linux-yocto_4.12.bb`` kernel recipe:
-::
+``linux-yocto_4.12.bb`` kernel recipe::

    SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
               git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
@@ -850,14 +827,12 @@ patches into a feature.

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
@@ -871,15 +846,13 @@ description:

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
@@ -911,8 +884,7 @@ that have to be regularly updated. The Yocto Project Linux kernel tools
 provide for this with the ``git merge`` command.

 To merge a feature branch into a BSP, insert the ``git merge`` command
-after any ``branch`` commands:
-::
+after any ``branch`` commands::

    mybsp.scc:
       define KMACHINE mybsp
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index 830b3e88c..235ffd817 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -485,8 +485,7 @@ The append file should initially extend the
 :term:`FILESPATH` search path by
 prepending the directory that contains your files to the
 :term:`FILESEXTRAPATHS`
-variable as follows:
-::
+variable as follows::

    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

@@ -494,8 +493,7 @@ The path ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``
 expands to "linux-yocto" in the current directory for this example. If
 you add any new files that modify the kernel recipe and you have
 extended ``FILESPATH`` as described above, you must place the files in
-your layer in the following area:
-::
+your layer in the following area::

    your-layer/recipes-kernel/linux/linux-yocto/

@@ -513,8 +511,7 @@ As an example, consider the following append file used by the BSPs in

 The following listing shows the file. Be aware that the actual commit ID
 strings in this example listing might be different than the actual
-strings in the file from the ``meta-yocto-bsp`` layer upstream.
-::
+strings in the file from the ``meta-yocto-bsp`` layer upstream::

    KBRANCH_genericx86  = "standard/base"
    KBRANCH_genericx86-64  = "standard/base"
@@ -575,8 +572,7 @@ For example, suppose you had some configuration options in a file called
 ``network_configs.cfg``. You can place that file inside a directory
 named ``linux-yocto`` and then add a ``SRC_URI`` statement such as the
 following to the append file. When the OpenEmbedded build system builds
-the kernel, the configuration options are picked up and applied.
-::
+the kernel, the configuration options are picked up and applied::

    SRC_URI += "file://network_configs.cfg"

@@ -584,8 +580,7 @@ To group related configurations into multiple files, you perform a
 similar procedure. Here is an example that groups separate
 configurations specifically for Ethernet and graphics into their own
 files and adds the configurations by using a ``SRC_URI`` statement like
-the following in your append file:
-::
+the following in your append file::

    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -629,8 +624,7 @@ reference them in :term:`SRC_URI`
 statements.

 For example, you can apply a three-patch series by adding the following
-lines to your linux-yocto ``.bbappend`` file in your layer:
-::
+lines to your linux-yocto ``.bbappend`` file in your layer::

    SRC_URI += "file://0001-first-change.patch"
    SRC_URI += "file://0002-second-change.patch"
@@ -660,8 +654,7 @@ If you have a complete, working Linux kernel ``.config`` file you want
 to use for the configuration, as before, copy that file to the
 appropriate ``${PN}`` directory in your layer's ``recipes-kernel/linux``
 directory, and rename the copied file to "defconfig". Then, add the
-following lines to the linux-yocto ``.bbappend`` file in your layer:
-::
+following lines to the linux-yocto ``.bbappend`` file in your layer::

    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
@@ -687,8 +680,7 @@ Generally speaking, the preferred approach is to determine the
 incremental change you want to make and add that as a configuration
 fragment. For example, if you want to add support for a basic serial
 console, create a file named ``8250.cfg`` in the ``${PN}`` directory
-with the following content (without indentation):
-::
+with the following content (without indentation)::

    CONFIG_SERIAL_8250=y
    CONFIG_SERIAL_8250_CONSOLE=y
@@ -700,8 +692,7 @@ with the following content (without indentation):

 Next, include this
 configuration fragment and extend the ``FILESPATH`` variable in your
-``.bbappend`` file:
-::
+``.bbappend`` file::

    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://8250.cfg"
@@ -720,8 +711,7 @@ It might be desirable to have kernel configuration fragment support
 through a ``defconfig`` file that is pulled from the kernel source tree
 for the configured machine. By default, the OpenEmbedded build system
 looks for ``defconfig`` files in the layer used for Metadata, which is
-"out-of-tree", and then configures them using the following:
-::
+"out-of-tree", and then configures them using the following::

    SRC_URI += "file://defconfig"

@@ -734,16 +724,14 @@ append files, you can direct the OpenEmbedded build system to use a
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

@@ -1172,8 +1160,7 @@ environment, you must do the following:
 The following commands initialize the BitBake environment, run the
 :ref:`ref-tasks-kernel_configme`
 task, and launch ``menuconfig``. These commands assume the Source
-Directory's top-level folder is ``~/poky``:
-::
+Directory's top-level folder is ``~/poky``::

    $ cd poky
    $ source oe-init-build-env
@@ -1235,8 +1222,7 @@ the ``.config`` file would be:

 Within the ``.config`` file, you can see the kernel settings. For
 example, the following entry shows that symmetric multi-processor
-support is not set:
-::
+support is not set::

    # CONFIG_SMP is not set

@@ -1277,8 +1263,7 @@ your layer's ``recipes-kernel/linux`` directory, and rename the copied
 file to "defconfig" (e.g.
 ``~/meta-mylayer/recipes-kernel/linux/linux-yocto/defconfig``). Then,
 add the following lines to the linux-yocto ``.bbappend`` file in your
-layer:
-::
+layer::

    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
@@ -1328,8 +1313,7 @@ appear in the ``.config`` file, which is in the :term:`Build Directory`.
 It is simple to create a configuration fragment. One method is to use
 shell commands. For example, issuing the following from the shell
 creates a configuration fragment file named ``my_smp.cfg`` that enables
-multi-processor support within the kernel:
-::
+multi-processor support within the kernel::

    $ echo "CONFIG_SMP=y" >> my_smp.cfg

@@ -1392,8 +1376,7 @@ options in a file called ``myconfig.cfg``. If you put that file inside a
 directory named ``linux-yocto`` that resides in the same directory as
 the kernel's append file within your layer and then add the following
 statements to the kernel's append file, those configuration options will
-be picked up and applied when the kernel is built:
-::
+be picked up and applied when the kernel is built::

    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://myconfig.cfg"
@@ -1402,8 +1385,7 @@ As mentioned earlier, you can group related configurations into multiple
 files and name them all in the ``SRC_URI`` statement as well. For
 example, you could group separate configurations specifically for
 Ethernet and graphics into their own files and add those by using a
-``SRC_URI`` statement like the following in your append file:
-::
+``SRC_URI`` statement like the following in your append file::

    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -1414,8 +1396,7 @@ Validating Configuration

 You can use the
 :ref:`ref-tasks-kernel_configcheck`
-task to provide configuration validation:
-::
+task to provide configuration validation::

    $ bitbake linux-yocto -c kernel_configcheck -f

@@ -1577,8 +1558,7 @@ Expanding Variables
 Sometimes it is helpful to determine what a variable expands to during a
 build. You can examine the values of variables by examining the
 output of the ``bitbake -e`` command. The output is long and is more
-easily managed in a text file, which allows for easy searches:
-::
+easily managed in a text file, which allows for easy searches::

    $ bitbake -e virtual/kernel > some_text_file

@@ -1639,8 +1619,7 @@ linux-yocto custom recipe (``linux-yocto-custom.bb``) that uses
 ``kernel.org`` sources and the Yocto Project Linux kernel tools for
 managing kernel Metadata. You can find this recipe in the ``poky`` Git
 repository of the Yocto Project :yocto_git:`Source Repository <>`
-at:
-::
+at::

    poky/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb

@@ -1812,8 +1791,7 @@ Typically, you will need to set the following variables:

 Depending on the build system used by the module sources, you might need
 to make some adjustments. For example, a typical module ``Makefile``
-looks much like the one provided with the ``hello-mod`` template:
-::
+looks much like the one provided with the ``hello-mod`` template::

    obj-m := hello.o

@@ -1850,8 +1828,7 @@ them appropriately for your machine configuration file:
 -  :term:`MACHINE_EXTRA_RRECOMMENDS`

 Modules are often not required for boot and can be excluded from certain
-build configurations. The following allows for the most flexibility:
-::
+build configurations. The following allows for the most flexibility::

    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-mymodule"

@@ -1900,26 +1877,22 @@ branch.

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
 an example that that creates patch files for each commit and places them
-in your ``Documents`` directory:
-::
+in your ``Documents`` directory::

    $ git format-patch -o $HOME/Documents origin/standard/base..origin/standard/emenlow

@@ -1928,15 +1901,13 @@ Showing a Particular Feature or Branch Change

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

diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.rst b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
index 681faee52..3108299e0 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
@@ -361,8 +361,7 @@ To determine whether or not a given option is "hardware" or
 "non-hardware", the kernel Metadata in ``yocto-kernel-cache`` contains
 files that classify individual or groups of options as either hardware
 or non-hardware. To better show this, consider a situation where the
-``yocto-kernel-cache`` contains the following files:
-::
+``yocto-kernel-cache`` contains the following files::

    yocto-kernel-cache/features/drm-psb/hardware.cfg
    yocto-kernel-cache/features/kgdb/hardware.cfg
@@ -402,8 +401,7 @@ provides explanations for the various files:
    (i.e. ``hardware.kcf`` or ``non-hardware.kcf``).

 Here is a specific example using the
-``kernel-cache/bsp/mti-malta32/hardware.cfg``:
-::
+``kernel-cache/bsp/mti-malta32/hardware.cfg``::

    CONFIG_SERIAL_8250
    CONFIG_SERIAL_8250_CONSOLE
diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index d6be98a0a..a83af347a 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -59,8 +59,7 @@ These other variables are useful for installing specific modules:

 For example, set the following in the ``qemux86.conf`` file to include
 the ``ab123`` kernel modules with images built for the ``qemux86``
-machine:
-::
+machine::

    MACHINE_EXTRA_RRECOMMENDS += "kernel-module-ab123"

@@ -73,8 +72,7 @@ How do I change the Linux kernel command line?
 The Linux kernel command line is
 typically specified in the machine config using the ``APPEND`` variable.
 For example, you can add some helpful debug information doing the
-following:
-::
+following::

    APPEND += "printk.time=y initcall_debug debug"

diff --git a/documentation/kernel-dev/kernel-dev-maint-appx.rst b/documentation/kernel-dev/kernel-dev-maint-appx.rst
index 69f680688..56bc73d46 100644
--- a/documentation/kernel-dev/kernel-dev-maint-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-maint-appx.rst
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
@@ -222,8 +219,7 @@ build process generates a build tree that is separate from your kernel's
 local Git source repository tree. This build tree has a name that uses
 the following form, where ``${MACHINE}`` is the metadata name of the
 machine (BSP) and "kernel_type" is one of the Yocto Project supported
-kernel types (e.g. "standard"):
-::
+kernel types (e.g. "standard")::

    linux-${MACHINE}-kernel_type-build

diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index d9f50e519..a9e4cc7e8 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -57,8 +57,7 @@ This section briefly introduces BitBake. If you want more information on
 BitBake, see the :doc:`BitBake User Manual <bitbake:index>`.

 To see a list of the options BitBake supports, use either of the
-following commands:
-::
+following commands::

    $ bitbake -h
    $ bitbake --help
@@ -68,8 +67,7 @@ The most common usage for BitBake is ``bitbake recipename``, where
 to as the "target"). The target often equates to the first part of a
 recipe's filename (e.g. "foo" for a recipe named ``foo_1.3.0-r0.bb``).
 So, to process the ``matchbox-desktop_1.2.3.bb`` recipe file, you might
-type the following:
-::
+type the following::

    $ bitbake matchbox-desktop

@@ -1101,15 +1099,13 @@ the image. The formats used for the root filesystem depend on the
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

@@ -1516,8 +1512,7 @@ cross-compiler that is used internally within BitBake only.
    .

 The chain of events that occurs when ``gcc-cross`` is bootstrapped is as
-follows:
-::
+follows::

    gcc -> binutils-cross -> gcc-cross-initial -> linux-libc-headers -> glibc-initial -> glibc -> gcc-cross -> gcc-runtime

@@ -1575,8 +1570,7 @@ might not be the same machine as the Build Host.
    can take advantage of pre-built images that ship with the Yocto
    Project and already contain cross-development toolchain installers.

-Here is the bootstrap process for the relocatable toolchain:
-::
+Here is the bootstrap process for the relocatable toolchain::

    gcc -> binutils-crosssdk -> gcc-crosssdk-initial -> linux-libc-headers -> glibc-initial -> nativesdk-glibc -> gcc-crosssdk -> gcc-cross-canadian

@@ -1754,8 +1748,7 @@ to the task.

 Like the ``WORKDIR`` case, situations exist where dependencies should be
 ignored. For these situations, you can instruct the build process to
-ignore a dependency by using a line like the following:
-::
+ignore a dependency by using a line like the following::

    PACKAGE_ARCHS[vardepsexclude] = "MACHINE"

@@ -1765,8 +1758,7 @@ reference it.

 Equally, there are cases where you need to add dependencies BitBake is
 not able to find. You can accomplish this by using a line like the
-following:
-::
+following::

    PACKAGE_ARCHS[vardeps] = "MACHINE"

@@ -1796,8 +1788,7 @@ and the dependent task hashes can be influenced. Within the BitBake
 configuration file, you can give BitBake some extra information to help
 it construct the basehash. The following statement effectively results
 in a list of global variable dependency excludes (i.e. variables never
-included in any checksum):
-::
+included in any checksum)::

    BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \\
        SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \\
@@ -1822,8 +1813,7 @@ desired. This file defines the two basic signature generators
 "OEBasicHash". By default, a dummy "noop" signature handler is enabled
 in BitBake. This means that behavior is unchanged from previous
 versions. OE-Core uses the "OEBasicHash" signature handler by default
-through this setting in the ``bitbake.conf`` file:
-::
+through this setting in the ``bitbake.conf`` file::

    BB_SIGNATURE_HANDLER ?= "OEBasicHash"

@@ -1877,8 +1867,7 @@ The Yocto Project team has tried to keep the details of the
 implementation hidden in ``sstate`` class. From a user's perspective,
 adding shared state wrapping to a task is as simple as this
 :ref:`ref-tasks-deploy` example taken
-from the :ref:`deploy <ref-classes-deploy>` class:
-::
+from the :ref:`deploy <ref-classes-deploy>` class::

    DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
    SSTATETASKS += "do_deploy"
@@ -1983,8 +1972,7 @@ The following list explains the previous example:
 Behind the scenes, the shared state code works by looking in
 :term:`SSTATE_DIR` and
 :term:`SSTATE_MIRRORS` for
-shared state files. Here is an example:
-::
+shared state files. Here is an example::

    SSTATE_MIRRORS ?= "\
        file://.\* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index 4bedd6df6..e3f4bc491 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -435,8 +435,7 @@ local working area (also called a branch) that tracks a specific
 development branch from the upstream source Git repository. in other
 words, you can define your local Git environment to work on any
 development branch in the repository. To help illustrate, consider the
-following example Git commands:
-::
+following example Git commands::

    $ cd ~
    $ git clone git://git.yoctoproject.org/poky
@@ -482,8 +481,7 @@ create and checkout a local working Git branch based on a tag name. When
 you do this, you get a snapshot of the Git repository that reflects the
 state of the files when the change was made associated with that tag.
 The most common use is to checkout a working branch that matches a
-specific Yocto Project release. Here is an example:
-::
+specific Yocto Project release. Here is an example::

    $ cd ~
    $ git clone git://git.yoctoproject.org/poky
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 7a1614028..e6dc8084d 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -209,8 +209,7 @@ section in the Yocto Project Development Tasks Manual.
 **A:** You need to create a form factor file as described in the
 ":ref:`bsp-filelayout-misc-recipes`" section in
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

diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index 5f975850b..8e3477809 100644
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
index daaea0ffa..358508423 100644
--- a/documentation/ref-manual/migration-1.4.rst
+++ b/documentation/ref-manual/migration-1.4.rst
@@ -136,8 +136,7 @@ Target Package Management with RPM
 If runtime package management is enabled and the RPM backend is
 selected, Smart is now installed for package download, dependency
 resolution, and upgrades instead of Zypper. For more information on how
-to use Smart, run the following command on the target:
-::
+to use Smart, run the following command on the target::

    smart --help

diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index a6c4c8a93..8a2c809a6 100644
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
index 5a5151ec1..6afbc525c 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -15,8 +15,7 @@ optional features. The method used to set defaults for these options
 means that existing ``local.conf`` files will need to be be modified to
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
index 4eea94887..5b1c34bb2 100644
--- a/documentation/ref-manual/migration-2.0.rst
+++ b/documentation/ref-manual/migration-2.0.rst
@@ -25,8 +25,7 @@ and the porting guide at
 https://gcc.gnu.org/gcc-5/porting_to.html.

 Alternatively, you can switch back to GCC 4.9 or 4.8 by setting
-``GCCVERSION`` in your configuration, as follows:
-::
+``GCCVERSION`` in your configuration, as follows::

    GCCVERSION = "4.9%"

@@ -200,8 +199,7 @@ changes.

 Additionally, work directories for old versions of recipes are now
 pruned. If you wish to disable pruning old work directories, you can set
-the following variable in your configuration:
-::
+the following variable in your configuration::

    SSTATE_PRUNE_OBSOLETEWORKDIR = "0"

diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 0220221e0..1f71e44cb 100644
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
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index 8afa8ffdd..dd67af524 100644
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

diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
index 2f0da48ab..d50962bc8 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/ref-manual/migration-2.6.rst
@@ -292,8 +292,7 @@ avoids the ``systemd`` recipe from becoming machine-specific for cases
 where machine-specific configurations need to be applied (e.g. for
 ``qemu*`` machines).

-Currently, the new recipe packages the following files:
-::
+Currently, the new recipe packages the following files::

    ${sysconfdir}/machine-id
    ${sysconfdir}/systemd/coredump.conf
@@ -393,8 +392,7 @@ If you wish to disable Python profile-guided optimization regardless of
 the value of ``MACHINE_FEATURES``, then ensure that
 :term:`PACKAGECONFIG` for the ``python3`` recipe
 does not contain "pgo". You could accomplish the latter using the
-following at the configuration level:
-::
+following at the configuration level::

    PACKAGECONFIG_remove_pn-python3 = "pgo"

diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/ref-manual/migration-3.1.rst
index 4fcd2490d..0e1d02ef6 100644
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

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 028729ffe..7e095cfca 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -221,8 +221,7 @@ each recipe you wish to blacklist. Specify the :term:`PN`
 value as a variable flag (varflag) and provide a reason, which is
 reported, if the package is requested to be built as the value. For
 example, if you want to blacklist a recipe called "exoticware", you add
-the following to your ``local.conf`` or distribution configuration:
-::
+the following to your ``local.conf`` or distribution configuration::

    INHERIT += "blacklist"
    PNBLACKLIST[exoticware] = "Not supported by our organization."
@@ -470,8 +469,7 @@ information about using ``devshell``.
 The ``devupstream`` class uses
 :term:`BBCLASSEXTEND` to add a variant of the
 recipe that fetches from an alternative URI (e.g. Git) instead of a
-tarball. Following is an example:
-::
+tarball. Following is an example::

    BBCLASSEXTEND = "devupstream:target"
    SRC_URI_class-devupstream = "git://git.example.com/example"
@@ -481,8 +479,7 @@ Adding the above statements to your recipe creates a variant that has
 :term:`DEFAULT_PREFERENCE` set to "-1".
 Consequently, you need to select the variant of the recipe to use it.
 Any development-specific adjustments can be done by using the
-``class-devupstream`` override. Here is an example:
-::
+``class-devupstream`` override. Here is an example::

    DEPENDS_append_class-devupstream = " gperf-native"
    do_configure_prepend_class-devupstream() {
@@ -588,8 +585,7 @@ By default, this class expects the source code to support recipe builds
 that use the :term:`B` variable to point to the directory in
 which the OpenEmbedded build system places the generated objects built
 from the recipes. By default, the ``B`` directory is set to the
-following, which is separate from the source directory (``S``):
-::
+following, which is separate from the source directory (``S``)::

    ${WORKDIR}/${BPN}/{PV}/

@@ -625,8 +621,7 @@ be performed using the
    useradd
    class to add user and group configuration to a specific recipe.

-Here is an example that uses this class in an image recipe:
-::
+Here is an example that uses this class in an image recipe::

    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -639,8 +634,7 @@ Here is an example that uses this class in an image recipe:
        "

 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords:
-::
+passwords::

    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -648,8 +642,7 @@ passwords:
        useradd -P tester01 tester-sue; \
        "

-Finally, here is an example that sets the root password to "1876*18":
-::
+Finally, here is an example that sets the root password to "1876*18"::

    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -885,8 +878,7 @@ system need to either inherit the ``icecc`` class or nobody should.
 At the distribution level, you can inherit the ``icecc`` class to be
 sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
-:term:`ICECC_DISABLED` variable to "1" as follows:
-::
+:term:`ICECC_DISABLED` variable to "1" as follows::

    INHERIT_DISTRO_append = " icecc"
    ICECC_DISABLED ??= "1"
@@ -894,8 +886,7 @@ inheriting the class, you can then disable the feature by setting the
 This practice
 makes sure everyone is using the same signatures but also requires
 individuals that do want to use Icecream to enable the feature
-individually as follows in your ``local.conf`` file:
-::
+individually as follows in your ``local.conf`` file::

    ICECC_DISABLED = ""

@@ -943,8 +934,7 @@ types.

 By default, the :ref:`image <ref-classes-image>` class automatically
 enables the ``image_types`` class. The ``image`` class uses the
-``IMGCLASSES`` variable as follows:
-::
+``IMGCLASSES`` variable as follows::

    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
    IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
@@ -986,8 +976,7 @@ during the :ref:`ref-tasks-rootfs` task, which optimizes
 the size of libraries contained in the image.

 By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows:
-::
+the :term:`USER_CLASSES` variable as follows::

    USER_CLASSES ?= "buildstats image-mklibs image-prelink"

@@ -1002,8 +991,7 @@ the dynamic linking of shared libraries to reduce executable startup
 time.

 By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows:
-::
+the :term:`USER_CLASSES` variable as follows::

    USER_CLASSES ?= "buildstats image-mklibs image-prelink"

@@ -1032,8 +1020,7 @@ configuration). However, to skip one or more checks in recipes, you
 should use :term:`INSANE_SKIP`. For example, to skip
 the check for symbolic link ``.so`` files in the main package of a
 recipe, add the following to the recipe. You need to realize that the
-package name override, in this example ``${PN}``, must be used:
-::
+package name override, in this example ``${PN}``, must be used::

    INSANE_SKIP_${PN} += "dev-so"

@@ -1749,8 +1736,7 @@ before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.

 To use this class, inherit it globally and specify
-:term:`SOURCE_MIRROR_URL`. Here is an example:
-::
+:term:`SOURCE_MIRROR_URL`. Here is an example::

    INHERIT += "own-mirrors"
    SOURCE_MIRROR_URL = "http://example.com/my-source-mirror"
@@ -2013,8 +1999,7 @@ established and then populates the SDK. After populating the SDK, the
 contains the cross-compiler and associated tooling, and the target,
 which contains a target root filesystem that is configured for the SDK
 usage. These two images reside in :term:`SDK_OUTPUT`,
-which consists of the following:
-::
+which consists of the following::

    ${SDK_OUTPUT}/${SDK_ARCH}-nativesdk-pkgs
    ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/target-pkgs
@@ -2173,8 +2158,7 @@ installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.

 If a recipe needs the ``.la`` files to be installed, then the recipe can
-override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows:
-::
+override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::

    REMOVE_LIBTOOL_LA = "0"

@@ -2213,8 +2197,7 @@ recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
 you would rather have these files deleted to save disk space as the
 build progresses, you can enable ``rm_work`` by adding the following to
-your ``local.conf`` file, which is found in the :term:`Build Directory`.
-::
+your ``local.conf`` file, which is found in the :term:`Build Directory`::

    INHERIT += "rm_work"

@@ -2224,8 +2207,7 @@ recipe, enabling ``rm_work`` will potentially result in your changes to
 the source being lost. To exclude some recipes from having their work
 directories deleted by ``rm_work``, you can add the names of the recipe
 or recipes you are working on to the ``RM_WORK_EXCLUDE`` variable, which
-can also be set in your ``local.conf`` file. Here is an example:
-::
+can also be set in your ``local.conf`` file. Here is an example::

    RM_WORK_EXCLUDE += "busybox glibc"

@@ -2533,8 +2515,7 @@ You should set :term:`SYSTEMD_SERVICE` to the
 name of the service file. You should also use a package name override to
 indicate the package to which the value applies. If the value applies to
 the recipe's main package, use ``${``\ :term:`PN`\ ``}``. Here
-is an example from the connman recipe:
-::
+is an example from the connman recipe::

    SYSTEMD_SERVICE_${PN} = "connman.service"

@@ -2610,8 +2591,7 @@ The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.

 The ``testimage.bbclass`` runs tests on an image when called using the
-following:
-::
+following::

    $ bitbake -c testimage image

@@ -2630,8 +2610,7 @@ section in the Yocto Project Development Tasks Manual.

 This class supports running automated tests against software development
 kits (SDKs). The ``testsdk`` class runs tests on an SDK when called
-using the following:
-::
+using the following::

    $ bitbake -c testsdk image

@@ -2686,8 +2665,7 @@ the environment for installed SDKs.
 The ``typecheck`` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
-variable using the "type" varflag. Here is an example:
-::
+variable using the "type" varflag. Here is an example::

    IMAGE_FEATURES[type] = "list"

@@ -2697,14 +2675,12 @@ variable using the "type" varflag. Here is an example:
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

diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index 9b9ddf53f..c60e07bf7 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
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

@@ -269,8 +266,7 @@ The ``devtool modify`` command extracts the source for a recipe, sets it
 up as a Git repository if the source had not already been fetched from
 Git, checks out a branch for development, and applies any patches from
 the recipe as commits on top. You can use the following command to
-checkout the source files:
-::
+checkout the source files::

    $ devtool modify recipe

@@ -309,8 +305,7 @@ compile, and test the code.

 When you are satisfied with the results and you have committed your
 changes to the Git repository, you can then run the
-``devtool update-recipe`` to create the patches and update the recipe:
-::
+``devtool update-recipe`` to create the patches and update the recipe::

    $ devtool update-recipe recipe

@@ -321,8 +316,7 @@ Often, you might want to apply customizations made to your software in
 your own layer rather than apply them to the original recipe. If so, you
 can use the ``-a`` or ``--append`` option with the
 ``devtool update-recipe`` command. These options allow you to specify
-the layer into which to write an append file:
-::
+the layer into which to write an append file::

    $ devtool update-recipe recipe -a base-layer-directory

@@ -358,8 +352,7 @@ particular recipe.
       recipe's latest version tag.

 As with all ``devtool`` commands, you can get help on the individual
-command:
-::
+command::

    $ devtool check-upgrade-status -h
    NOTE: Starting bitbake server...
@@ -462,8 +455,7 @@ files have been modified, the command preserves the modified files in a
 separate "attic" subdirectory under the workspace layer.

 Here is an example that resets the workspace directory that contains the
-``mtr`` recipe:
-::
+``mtr`` recipe::

    $ devtool reset mtr
    NOTE: Cleaning sysroot for recipe mtr...
@@ -482,8 +474,7 @@ Use the ``devtool build`` command to build your recipe. The
 When you use the ``devtool build`` command, you must supply the root
 name of the recipe (i.e. do not provide versions, paths, or extensions).
 You can use either the "-s" or the "--disable-parallel-make" options to
-disable parallel makes during the build. Here is an example:
-::
+disable parallel makes during the build. Here is an example::

    $ devtool build recipe

@@ -499,8 +490,7 @@ device for testing. For proper integration into a final image, you need
 to edit your custom image recipe appropriately.

 When you use the ``devtool build-image`` command, you must supply the
-name of the image. This command has no command line options:
-::
+name of the image. This command has no command line options::

    $ devtool build-image image

@@ -510,8 +500,7 @@ Deploying Your Software on the Target Machine
 =============================================

 Use the ``devtool deploy-target`` command to deploy the recipe's build
-output to the live target machine:
-::
+output to the live target machine::

    $ devtool deploy-target recipe target

@@ -582,15 +571,13 @@ new workspace layer, it is populated with the ``README`` file and the
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

@@ -603,15 +590,13 @@ Use the ``devtool status`` command to list the recipes currently in your
 workspace. Information includes the paths to their respective external
 source trees.

-The ``devtool status`` command has no command-line options:
-::
+The ``devtool status`` command has no command-line options::

    $ devtool status

 Following is sample output after using
 :ref:`devtool add <ref-manual/ref-devtool-reference:adding a new recipe to the workspace layer>`
-to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory:
-::
+to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::

    $ devtool status
    mtr:/home/scottrif/poky/build/workspace/sources/mtr (/home/scottrif/poky/build/workspace/recipes/mtr/mtr_0.86.bb)
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index f28ad2bb4..dbd9801fe 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -26,8 +26,7 @@ One method you can use to determine which recipes are checking to see if
 a particular feature is contained or not is to ``grep`` through the
 :term:`Metadata` for the feature. Here is an example that
 discovers the recipes whose build is potentially changed based on a
-given feature:
-::
+given feature::

    $ cd poky
    $ git grep 'contains.*MACHINE_FEATURES.*feature'
diff --git a/documentation/ref-manual/ref-kickstart.rst b/documentation/ref-manual/ref-kickstart.rst
index 7f6d4ebe1..098a7cd6c 100644
--- a/documentation/ref-manual/ref-kickstart.rst
+++ b/documentation/ref-manual/ref-kickstart.rst
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

diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index db1ea9797..5d5238653 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
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

diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 9ef014139..86a8e521e 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -93,8 +93,7 @@ output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
 The ``do_deploy`` task is not added as a task by default and
 consequently needs to be added manually. If you want the task to run
 after :ref:`ref-tasks-compile`, you can add it by doing
-the following:
-::
+the following::

       addtask deploy after do_compile

@@ -302,13 +301,11 @@ Patch files, by default, are ``*.patch`` and ``*.diff`` files created
 and kept in a subdirectory of the directory holding the recipe file. For
 example, consider the
 :yocto_git:`bluez5 </cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/bluez5>`
-recipe from the OE-Core layer (i.e. ``poky/meta``):
-::
+recipe from the OE-Core layer (i.e. ``poky/meta``)::

    poky/meta/recipes-connectivity/bluez5

-This recipe has two patch files located here:
-::
+This recipe has two patch files located here::

    poky/meta/recipes-connectivity/bluez5/bluez5

@@ -323,8 +320,7 @@ and patch files needed to build the package.
 As mentioned earlier, the build system treats files whose file types are
 ``.patch`` and ``.diff`` as patch files. However, you can use the
 "apply=yes" parameter with the ``SRC_URI`` statement to indicate any
-file as a patch file:
-::
+file as a patch file::

    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -334,8 +330,7 @@ file as a patch file:
 Conversely, if you have a directory full of patch files and you want to
 exclude some so that the ``do_patch`` task does not apply them during
 the patch phase, you can use the "apply=no" parameter with the
-``SRC_URI`` statement:
-::
+``SRC_URI`` statement::

    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -455,8 +450,7 @@ of the recipe exists upstream and a status of not updated, updated, or
 unknown.

 To check the upstream version and status of a recipe, use the following
-devtool commands:
-::
+devtool commands::

    $ devtool latest-version
    $ devtool check-upgrade-status
@@ -467,8 +461,7 @@ chapter for more information on
 section for information on checking the upgrade status of a recipe.

 To build the ``checkpkg`` task, use the ``bitbake`` command with the
-"-c" option and task name:
-::
+"-c" option and task name::

    $ bitbake core-image-minimal -c checkpkg

@@ -494,8 +487,7 @@ Removes all output files for a target from the
 :ref:`ref-tasks-install`, and
 :ref:`ref-tasks-package`).

-You can run this task using BitBake as follows:
-::
+You can run this task using BitBake as follows::

    $ bitbake -c clean recipe

@@ -519,8 +511,7 @@ downloaded source files for a target (i.e. the contents of
 identical to the :ref:`ref-tasks-cleansstate` task
 with the added removal of downloaded source files.

-You can run this task using BitBake as follows:
-::
+You can run this task using BitBake as follows::

    $ bitbake -c cleanall recipe

@@ -540,8 +531,7 @@ target. Essentially, the ``do_cleansstate`` task is identical to the
 shared state (:ref:`sstate <overview-manual/overview-manual-concepts:shared state cache>`)
 cache.

-You can run this task using BitBake as follows:
-::
+You can run this task using BitBake as follows::

    $ bitbake -c cleansstate recipe

@@ -687,8 +677,7 @@ changes made by the user with other methods (i.e. using
 (:ref:`ref-tasks-kernel_menuconfig`). Once the
 file of differences is created, it can be used to create a config
 fragment that only contains the differences. You can invoke this task
-from the command line as follows:
-::
+from the command line as follows::

    $ bitbake linux-yocto -c diffconfig

@@ -718,8 +707,7 @@ Validates the configuration produced by the
 configuration does not appear in the final ``.config`` file or when you
 override a policy configuration in a hardware configuration fragment.
 You can run this task explicitly and view the output by using the
-following command:
-::
+following command::

    $ bitbake linux-yocto -c kernel_configcheck -f

@@ -793,8 +781,7 @@ instead of the default defconfig. The saved defconfig contains the
 differences between the default defconfig and the changes made by the
 user using other methods (i.e. the
 :ref:`ref-tasks-kernel_menuconfig` task. You
-can invoke the task using the following command:
-::
+can invoke the task using the following command::

    $ bitbake linux-yocto -c savedefconfig

diff --git a/documentation/sdk-manual/sdk-appendix-customizing.rst b/documentation/sdk-manual/sdk-appendix-customizing.rst
index 5a33f6385..1b72e8270 100644
--- a/documentation/sdk-manual/sdk-appendix-customizing.rst
+++ b/documentation/sdk-manual/sdk-appendix-customizing.rst
@@ -151,8 +151,7 @@ from the :term:`DISTRO` variable.
 The
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
 class defines the default value of the ``SDK_TITLE`` variable as
-follows:
-::
+follows::

    SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"

@@ -164,8 +163,7 @@ an example, assume you have your own layer for your distribution named
 does the default "poky" distribution. If so, you could update the
 ``SDK_TITLE`` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
-form:
-::
+form::

    SDK_TITLE = "your_title"

@@ -221,8 +219,7 @@ installation directory for the SDK is based on the
 :term:`SDKEXTPATH` variables from
 within the
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
-class as follows:
-::
+class as follows::

    SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"

@@ -239,8 +236,7 @@ assume you have your own layer for your distribution named
 does the default "poky" distribution. If so, you could update the
 ``SDKEXTPATH`` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
-form:
-::
+form::

    SDKEXTPATH = "some_path_for_your_installed_sdk"

@@ -316,8 +312,7 @@ everything needed to reconstruct the image for which the SDK was built.
 This bundling can lead to an SDK installer file that is a Gigabyte or
 more in size. If the size of this file causes a problem, you can build
 an SDK that has just enough in it to install and provide access to the
-``devtool command`` by setting the following in your configuration:
-::
+``devtool command`` by setting the following in your configuration::

    SDK_EXT_TYPE = "minimal"

@@ -339,8 +334,7 @@ information enables the ``devtool search`` command to return useful
 results.

 To facilitate this wider range of information, you would need to set the
-following:
-::
+following::

    SDK_INCLUDE_PKGDATA = "1"

diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/sdk-extensible.rst
index 5ff75ada2..0d01dd40f 100644
--- a/documentation/sdk-manual/sdk-extensible.rst
+++ b/documentation/sdk-manual/sdk-extensible.rst
@@ -62,8 +62,7 @@ The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
 immediately followed by a string representing the target architecture.
 An extensible SDK has the string "-ext" as part of the name. Following
-is the general form:
-::
+is the general form::

    poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh

@@ -86,8 +85,7 @@ is the general form:

 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current DISTRO snapshot:
-::
+the SDK for ``core-image-sato`` and using the current DISTRO snapshot::

    poky-glibc-x86_64-core-image-sato-i586-toolchain-ext-DISTRO.sh

@@ -155,8 +153,7 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning:
-::
+script is for an IA-based target machine using i586 tuning::

    $ cd /home/scottrif/poky_sdk
    $ source environment-setup-core2-64-poky-linux
@@ -337,8 +334,7 @@ command:
    depends on what you are going to do with the new code.

    If you need to eventually move the build output to the target
-   hardware, use the following ``devtool`` command:
-   :;
+   hardware, use the following ``devtool`` command::

       $ devtool build recipe

@@ -843,8 +839,7 @@ name and version, just the name, or just the version as part of the
 command line.

 Sometimes the name or version determined from the source tree might be
-incorrect. For such a case, you must reset the recipe:
-::
+incorrect. For such a case, you must reset the recipe::

    $ devtool reset -n recipename

@@ -870,8 +865,7 @@ the ``DEPENDS`` variable in the original recipe to include the new
 recipe.

 If you need to add runtime dependencies, you can do so by adding the
-following to your recipe:
-::
+following to your recipe::

    RDEPENDS_${PN} += "dependency1 dependency2 ..."

@@ -1018,8 +1012,7 @@ You can use the ``devtool add`` command two different ways to add
 Node.js modules: 1) Through ``npm`` and, 2) from a repository or local
 source.

-Use the following form to add Node.js modules through ``npm``:
-::
+Use the following form to add Node.js modules through ``npm``::

    $ devtool add "npm://registry.npmjs.org;name=forever;version=0.15.1"

@@ -1043,8 +1036,7 @@ these behaviors ensure the reproducibility and integrity of the build.

 As mentioned earlier, you can also add Node.js modules directly from a
 repository or local source tree. To add modules this way, use
-``devtool add`` in the following form:
-::
+``devtool add`` in the following form::

    $ devtool add https://github.com/diversario/node-ssdp

@@ -1233,15 +1225,13 @@ need to restore the original files that existed prior to running the
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

@@ -1274,22 +1264,19 @@ populated on-demand. Sometimes you must explicitly install extra items
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

@@ -1307,8 +1294,7 @@ If you are working with an installed extensible SDK that gets
 occasionally updated (e.g. a third-party SDK), then you will need to
 manually "pull down" the updates into the installed SDK.

-To update your installed SDK, use ``devtool`` as follows:
-::
+To update your installed SDK, use ``devtool`` as follows::

    $ devtool sdk-update

diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/sdk-using.rst
index 4b151e45c..9b9440cd6 100644
--- a/documentation/sdk-manual/sdk-using.rst
+++ b/documentation/sdk-manual/sdk-using.rst
@@ -80,8 +80,7 @@ immediately followed by a string representing the target architecture.

 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current DISTRO snapshot:
-::
+the SDK for ``core-image-sato`` and using the current DISTRO snapshot::

    poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.sh

@@ -146,8 +145,7 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning:
-::
+script is for an IA-based target machine using i586 tuning::

    $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux

diff --git a/documentation/sdk-manual/sdk-working-projects.rst b/documentation/sdk-manual/sdk-working-projects.rst
index 5c828fd58..5e2ad975b 100644
--- a/documentation/sdk-manual/sdk-working-projects.rst
+++ b/documentation/sdk-manual/sdk-working-projects.rst
@@ -231,8 +231,7 @@ Running the
 SDK setup script for a 64-bit build host and an i586-tuned target
 architecture for a ``core-image-sato`` image using the current 3.1.2
 Yocto Project release and then echoing that variable shows the value
-established through the script:
-::
+established through the script::

    $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux
    $ echo ${CC}


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1068545881-1604008846=:17086--
