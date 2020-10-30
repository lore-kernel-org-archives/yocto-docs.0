Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.381.1604088212165008298
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 13:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:40038 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYacR-006dhU-Lg
	for docs@lists.yoctoproject.org; Fri, 30 Oct 2020 16:03:30 -0400
Date: Fri, 30 Oct 2020 16:03:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] reST syntax: normalize using "::" to start literal blocks
Message-ID: <c779b194-309e-38ec-44e7-a06acec9b670@crashcourse.ca>
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
Content-Type: multipart/mixed; boundary="8323328-588776955-1604088207=:8802"

--8323328-588776955-1604088207=:8802
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Currently, there is some chaos regarding how to introduce a literal
block in reST; the standard and simplest way is to end the
introductory sentence with "::" (with no leading space before the
"::", follow this with a blank line, then the indented block content.

As it is, there is a variety of ways being used to do this, so a
simple script using Perl is used to normalize all of this variety. The
script:

  #!/bin/sh

  #
  #  collapse [:.] at end of line followed by bare "::" into
  # trailing "::"
  #

  for r in $(find . -name "*.rst") ; do
      perl -0777 -pi -e 's/[:.]\n::\n/::\n/g' ${r}
  done

  #
  #  simplify ": ::" at end of line to "::"
  #

  for r in $(find . -name "*.rst") ; do
      perl -pi -e 's/: ::$/::/' ${r}
  done

As you can see, the first loop both collapses two lines into one,
while modifying a trailing "." to a trailing ":" in the introductory
sentence because, well, it should have been a colon in the first
place.

The second loop is self-explanatory.

The above represents the entire processing done on the documentation.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  ok, here's an improved version of "::" normalization. it appears to
build, but i'm open to suggestions.

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index c9622d364..21b016fda 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -223,7 +223,7 @@ an entire Linux distribution, including the toolchain, from source.

       You can significantly speed up your build and guard against fetcher
       failures by using mirrors. To use mirrors, add these lines to your
-      local.conf file in the Build directory: ::
+      local.conf file in the Build directory::

          SSTATE_MIRRORS = "\
          file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index d0275eea9..d0bd1d699 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -26,7 +26,7 @@ A BSP consists of a file structure inside a base directory.
 Collectively, you can think of the base directory, its file structure,
 and the contents as a BSP layer. Although not a strict requirement, BSP
 layers in the Yocto Project use the following well-established naming
-convention: ::
+convention::

    meta-bsp_root_name

@@ -58,7 +58,7 @@ Each repository is a BSP layer supported by the Yocto Project (e.g.
 ``meta-raspberrypi`` and ``meta-intel``). Each of these layers is a
 repository unto itself and clicking on the layer name displays two URLs
 from which you can clone the layer's repository to your local system.
-Here is an example that clones the Raspberry Pi BSP layer: ::
+Here is an example that clones the Raspberry Pi BSP layer::

    $ git clone git://git.yoctoproject.org/meta-raspberrypi

@@ -84,7 +84,7 @@ established after you run the OpenEmbedded build environment setup
 script (i.e. :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``).
 Adding the root directory allows the :term:`OpenEmbedded Build System`
 to recognize the BSP
-layer and from it build an image. Here is an example: ::
+layer and from it build an image. Here is an example::

    BBLAYERS ?= " \
       /usr/local/src/yocto/meta \
@@ -113,7 +113,7 @@ this type of layer is OpenEmbedded's
 `meta-openembedded <https://github.com/openembedded/meta-openembedded>`__
 layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
 In cases like this, you need to include the names of the actual layers
-you want to work with, such as: ::
+you want to work with, such as::

    BBLAYERS ?= " \
      /usr/local/src/yocto/meta \
@@ -194,7 +194,7 @@ section.

    #. *Check Out the Proper Branch:* The branch you check out for
       ``meta-intel`` must match the same branch you are using for the
-      Yocto Project release (e.g. ``&DISTRO_NAME_NO_CAP;``): ::
+      Yocto Project release (e.g. ``&DISTRO_NAME_NO_CAP;``)::

          $ cd meta-intel
          $ git checkout -b &DISTRO_NAME_NO_CAP; remotes/origin/&DISTRO_NAME_NO_CAP;
@@ -217,7 +217,7 @@ section.
    The process is identical to the process used for the ``meta-intel``
    layer except for the layer's name. For example, if you determine that
    your hardware most closely matches the ``meta-raspberrypi``, clone
-   that layer: ::
+   that layer::

       $ git clone git://git.yoctoproject.org/meta-raspberrypi
       Cloning into 'meta-raspberrypi'...
@@ -456,7 +456,7 @@ The following sections describe each part of the proposed BSP format.
 License Files
 -------------

-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::

    meta-bsp_root_name/bsp_license_file

@@ -476,7 +476,7 @@ section in the Yocto Project Development Tasks Manual.
 README File
 -----------

-You can find this file in the BSP Layer at: ::
+You can find this file in the BSP Layer at::

    meta-bsp_root_name/README

@@ -493,7 +493,7 @@ name of the BSP maintainer with his or her contact information.
 README.sources File
 -------------------

-You can find this file in the BSP Layer at: ::
+You can find this file in the BSP Layer at::

    meta-bsp_root_name/README.sources

@@ -514,7 +514,7 @@ used to generate the images that ship with the BSP.
 Pre-built User Binaries
 -----------------------

-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::

    meta-bsp_root_name/binary/bootable_images

@@ -539,7 +539,7 @@ information on the Metadata.
 Layer Configuration File
 ------------------------

-You can find this file in the BSP Layer at: ::
+You can find this file in the BSP Layer at::

    meta-bsp_root_name/conf/layer.conf

@@ -563,7 +563,7 @@ template). ::
    LAYERDEPENDS_bsp = "intel"

 To illustrate the string substitutions, here are the corresponding
-statements from the Raspberry Pi ``conf/layer.conf`` file: ::
+statements from the Raspberry Pi ``conf/layer.conf`` file::

    # We have a conf and classes directory, append to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -591,7 +591,7 @@ recognize the BSP.
 Hardware Configuration Options
 ------------------------------

-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::

    meta-bsp_root_name/conf/machine/*.conf

@@ -622,7 +622,7 @@ For example, many ``tune-*`` files (e.g. ``tune-arm1136jf-s.inc``,

 To use an include file, you simply include them in the machine
 configuration file. For example, the Raspberry Pi BSP
-``raspberrypi3.conf`` contains the following statement: ::
+``raspberrypi3.conf`` contains the following statement::

    include conf/machine/include/rpi-base.inc

@@ -631,7 +631,7 @@ configuration file. For example, the Raspberry Pi BSP
 Miscellaneous BSP-Specific Recipe Files
 ---------------------------------------

-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::

    meta-bsp_root_name/recipes-bsp/*

@@ -641,7 +641,7 @@ Raspberry Pi BSP, there is the ``formfactor_0.0.bbappend`` file, which
 is an append file used to augment the recipe that starts the build.
 Furthermore, there are machine-specific settings used during the build
 that are defined by the ``machconfig`` file further down in the
-directory. Here is the ``machconfig`` file for the Raspberry Pi BSP: ::
+directory. Here is the ``machconfig`` file for the Raspberry Pi BSP::

    HAVE_TOUCHSCREEN=0
    HAVE_KEYBOARD=1
@@ -663,7 +663,7 @@ directory. Here is the ``machconfig`` file for the Raspberry Pi BSP: ::
 Display Support Files
 ---------------------

-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::

    meta-bsp_root_name/recipes-graphics/*

@@ -676,7 +676,7 @@ to support a display are kept here.
 Linux Kernel Configuration
 --------------------------

-You can find these files in the BSP Layer at: ::
+You can find these files in the BSP Layer at::

    meta-bsp_root_name/recipes-kernel/linux/linux*.bbappend
    meta-bsp_root_name/recipes-kernel/linux/*.bb
@@ -699,7 +699,7 @@ Suppose you are using the ``linux-yocto_4.4.bb`` recipe to build the
 kernel. In other words, you have selected the kernel in your
 ``"bsp_root_name".conf`` file by adding
 :term:`PREFERRED_PROVIDER` and :term:`PREFERRED_VERSION`
-statements as follows: ::
+statements as follows::

    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "4.4%"
@@ -719,7 +719,7 @@ in the Yocto Project Linux Kernel Development Manual.

 An alternate scenario is when you create your own kernel recipe for the
 BSP. A good example of this is the Raspberry Pi BSP. If you examine the
-``recipes-kernel/linux`` directory you see the following: ::
+``recipes-kernel/linux`` directory you see the following::

    linux-raspberrypi-dev.bb
    linux-raspberrypi.inc
@@ -1063,7 +1063,7 @@ BSP-specific configuration file named ``interfaces`` to the
 also supports several other machines:

 #. Edit the ``init-ifupdown_1.0.bbappend`` file so that it contains the
-   following: ::
+   following::

       FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

@@ -1071,14 +1071,14 @@ also supports several other machines:
    directory.

 #. Create and place the new ``interfaces`` configuration file in the
-   BSP's layer here: ::
+   BSP's layer here::

       meta-xyz/recipes-core/init-ifupdown/files/xyz-machine-one/interfaces

    .. note::

       If the ``meta-xyz`` layer did not support multiple machines, you would place
-      the interfaces configuration file in the layer here: ::
+      the interfaces configuration file in the layer here::

          meta-xyz/recipes-core/init-ifupdown/files/interfaces

@@ -1231,7 +1231,7 @@ BSP Layer Configuration Example
 -------------------------------

 The layer's ``conf`` directory contains the ``layer.conf`` configuration
-file. In this example, the ``conf/layer.conf`` is the following: ::
+file. In this example, the ``conf/layer.conf`` is the following::

    # We have a conf and classes directory, add to BBPATH
    BBPATH .= ":${LAYERDIR}"
@@ -1263,7 +1263,7 @@ configuration file is what makes a layer a BSP layer as compared to a
 general or kernel layer.

 One or more machine configuration files exist in the
-``bsp_layer/conf/machine/`` directory of the layer: ::
+``bsp_layer/conf/machine/`` directory of the layer::

    bsp_layer/conf/machine/machine1\.conf
    bsp_layer/conf/machine/machine2\.conf
@@ -1273,7 +1273,7 @@ One or more machine configuration files exist in the
 For example, the machine configuration file for the `BeagleBone and
 BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
 located in the layer ``poky/meta-yocto-bsp/conf/machine`` and is named
-``beaglebone-yocto.conf``: ::
+``beaglebone-yocto.conf``::

    #@TYPE: Machine
    #@NAME: Beaglebone-yocto machine
@@ -1468,7 +1468,7 @@ BSP Kernel Recipe Example
 -------------------------

 The kernel recipe used to build the kernel image for the BeagleBone
-device was established in the machine configuration: ::
+device was established in the machine configuration::

    PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
    PREFERRED_VERSION_linux-yocto ?= "5.0%"
@@ -1479,7 +1479,7 @@ metadata used to build the kernel. In this case, a kernel append file
 kernel recipe (i.e. ``linux-yocto_5.0.bb``), which is located in
 :yocto_git:`/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/linux`.

-Following is the contents of the append file: ::
+Following is the contents of the append file::

    KBRANCH_genericx86 = "v5.0/standard/base"
    KBRANCH_genericx86-64 = "v5.0/standard/base"
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 27aacde60..0181c8bf3 100644
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
@@ -2355,8 +2320,7 @@ under ``files``) requires a recipe that has the file listed in the
 ``do_compile`` and ``do_install`` tasks. The ``S`` variable defines the
 directory containing the source code, which is set to
 :term:`WORKDIR` in this case - the
-directory BitBake uses for the build.
-::
+directory BitBake uses for the build::

    SUMMARY = "Simple helloworld application"
    SECTION = "examples"
@@ -2432,13 +2396,11 @@ Otherwise, BitBake runs an empty ``do_install`` task by default.
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
@@ -2483,8 +2445,7 @@ application into multiple packages.
 Following is an example that uses the ``libxpm`` recipe. By default,
 this recipe generates a single package that contains the library along
 with a few binaries. You can modify the recipe to split the binaries
-into separate packages:
-::
+into separate packages::

    require xorg-lib-common.inc

@@ -2947,8 +2908,7 @@ of adding a suitable ``defconfig`` file. The file needs to be added into
 a location similar to ``defconfig`` files used for other machines in a
 given kernel recipe. A possible way to do this is by listing the file in
 the ``SRC_URI`` and adding the machine to the expression in
-``COMPATIBLE_MACHINE``:
-::
+``COMPATIBLE_MACHINE``::

    COMPATIBLE_MACHINE = '(qemux86|qemumips)'

@@ -2977,8 +2937,7 @@ contains directories for specific machines such as ``qemuarm`` and
 defaults, see the ``meta/recipes-bsp/formfactor/files/config`` file
 found in the same area.

-Following is an example for "qemuarm" machine:
-::
+Following is an example for "qemuarm" machine::

    HAVE_TOUCHSCREEN=1
    HAVE_KEYBOARD=1
@@ -3193,8 +3152,7 @@ This next set of examples describes how to use the AUH:
       $ upgrade-helper.py -e all

 Once you have run the AUH utility, you can find the results in the AUH
-build directory:
-::
+build directory::

    ${BUILDDIR}/upgrade-helper/timestamp

@@ -3221,15 +3179,13 @@ section in the Yocto Project Application Development and the Extensible
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

@@ -3255,15 +3211,13 @@ could add it easily using the
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
@@ -3304,8 +3258,7 @@ directory automatically upgrades the recipe for you:
    NOTE: New recipe is /home/scottrif/poky/build/workspace/recipes/nano/nano_2.9.3.bb

 Continuing with this example, you can use ``devtool build`` to build the
-newly upgraded recipe:
-::
+newly upgraded recipe::

    $ devtool build nano
    NOTE: Starting bitbake server...
@@ -3330,8 +3283,7 @@ and submit commits for the changes generated by the upgrade process.

 Once the tree is clean, you can clean things up in this example with the
 following command from the ``${BUILDDIR}/workspace/sources/nano``
-directory:
-::
+directory::

    $ devtool finish nano meta-oe
    NOTE: Starting bitbake server...
@@ -3438,8 +3390,7 @@ build packages is available in the Build Directory as defined by the
 :term:`S` variable. Below is the default
 value for the ``S`` variable as defined in the
 ``meta/conf/bitbake.conf`` configuration file in the
-:term:`Source Directory`:
-::
+:term:`Source Directory`::

    S = "${WORKDIR}/${BP}"

@@ -3458,8 +3409,7 @@ usually set ``S`` to ``${WORKDIR}/git``.

 The path to the work directory for the recipe
 (:term:`WORKDIR`) is defined as
-follows:
-::
+follows::

    ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}

@@ -3485,8 +3435,7 @@ As an example, assume a Source Directory top-level folder named
 ``poky``, a default Build Directory at ``poky/build``, and a
 ``qemux86-poky-linux`` machine target system. Furthermore, suppose your
 recipe is named ``foo_1.3.0.bb``. In this case, the work directory the
-build system uses to build the package would be as follows:
-::
+build system uses to build the package would be as follows::

    poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0

@@ -3605,8 +3554,7 @@ this way can be helpful when debugging a build or preparing software to
 be used with the OpenEmbedded build system.

 Following is an example that uses ``devshell`` on a target named
-``matchbox-desktop``:
-::
+``matchbox-desktop``::

   $ bitbake matchbox-desktop -c devshell

@@ -3635,8 +3583,7 @@ corresponding ``run.*`` script in the
 directory (e.g., ``run.do_configure.``\ `pid`). If a task's script does
 not exist, which would be the case if the task was skipped by way of the
 sstate cache, you can create the task by first running it outside of the
-``devshell``:
-::
+``devshell``::

    $ bitbake -c task

@@ -3685,8 +3632,7 @@ specified target. Then a new terminal is opened. Additionally, key
 Python objects and code are available in the same way they are to
 BitBake tasks, in particular, the data store 'd'. So, commands such as
 the following are useful when exploring the data store and running
-functions:
-::
+functions::

    pydevshell> d.getVar("STAGING_DIR")
    '/media/build1/poky/build/tmp/sysroots'
@@ -3706,8 +3652,7 @@ helpful when debugging a build or preparing software to be used with the
 OpenEmbedded build system.

 Following is an example that uses ``devpyshell`` on a target named
-``matchbox-desktop``:
-::
+``matchbox-desktop``::

    $ bitbake matchbox-desktop -c devpyshell

@@ -3958,15 +3903,13 @@ essentially that the

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

@@ -3976,8 +3919,7 @@ task on which the ``do_image`` task in the recipe depends is the
 with the "arm" multiconfig.

 Once you set up this dependency, you can build the "x86" multiconfig
-using a BitBake command as follows:
-::
+using a BitBake command as follows::

    $ bitbake mc:x86:core-image-sato

@@ -3988,8 +3930,7 @@ dependency, BitBake also executes through the ``do_rootfs`` task for the

 Having a recipe depend on the root filesystem of another build might not
 seem that useful. Consider this change to the statement in the
-``core-image-sato`` recipe:
-::
+``core-image-sato`` recipe::

    do_image[mcdepends] = "mc:x86:arm:core-image-minimal:do_image"

@@ -4214,8 +4155,7 @@ happens, which changes the way you build them. You can also modify the
 filesystem itself or select a different filesystem.

 First, find out what is hogging your root filesystem by running the
-``dirsize.py`` script from your root directory:
-::
+``dirsize.py`` script from your root directory::

    $ cd root-directory-of-image
    $ dirsize.py 100000 > dirsize-100k.log
@@ -4230,8 +4170,7 @@ the root filesystem that take up large amounts of memory.

 You need to be sure that what you eliminate does not cripple the
 functionality you need. One way to see how packages relate to each other
-is by using the Dependency Explorer UI with the BitBake command:
-::
+is by using the Dependency Explorer UI with the BitBake command::

    $ cd image-directory
    $ bitbake -u taskexp -g image
@@ -4247,8 +4186,7 @@ instead of ``udev``.

 Use your ``local.conf`` file to make changes. For example, to eliminate
 ``udev`` and ``glib``, set the following in the local configuration
-file:
-::
+file::

    VIRTUAL-RUNTIME_dev_manager = ""

@@ -4276,8 +4214,7 @@ building? Which drivers do you build by default?
    You can modify the kernel source if you want to help with boot time.

 Run the ``ksize.py`` script from the top-level Linux build directory to
-get an idea of what is making up the kernel:
-::
+get an idea of what is making up the kernel::

    $ cd top-level-linux-build-directory
    $ ksize.py > ksize.log
@@ -4291,8 +4228,7 @@ in a compressed kernel image. Look to reduce the areas that are large
 and taking up around the "90% rule."

 To examine, or drill down, into any particular area, use the ``-d``
-option with the script:
-::
+option with the script::

    $ ksize.py -d > ksize.log

@@ -4549,15 +4485,13 @@ to do is inherit the
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
@@ -4574,8 +4508,7 @@ directory separate from the external source directory as specified by
 to have the source built in the same directory in which it resides, or
 some other nominated directory, you can set
 :term:`EXTERNALSRC_BUILD`
-to point to that directory:
-::
+to point to that directory::

    EXTERNALSRC_BUILD_pn-myrecipe = "path-to-your-source-tree"

@@ -4851,8 +4784,7 @@ library files.
    static library files through ``${PN}-dev``.

 Following is part of the BitBake configuration file, where you can see
-how the static library files are defined:
-::
+how the static library files are defined::

    PACKAGE_BEFORE_PN ?= ""
    PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
@@ -4960,8 +4892,7 @@ After you have set up the recipes, you need to define the actual
 combination of multiple libraries you want to build. You accomplish this
 through your ``local.conf`` configuration file in the
 :term:`Build Directory`. An example
-configuration would be as follows:
-::
+configuration would be as follows::

    MACHINE = "qemux86-64"
    require conf/multilib.conf
@@ -4977,14 +4908,12 @@ on this particular tuning, see

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

@@ -5079,8 +5008,7 @@ you have other recipes that depend on a given library, you need to use
 the :term:`DEPENDS` variable to
 create the dependency. Continuing with the same example, if you want to
 have a recipe depend on the 1.8 version of the ``clutter`` library, use
-the following in your recipe:
-::
+the following in your recipe::

    DEPENDS = "clutter-1.8"

@@ -5123,8 +5051,7 @@ follows:
 -  Support for large images exists.

 To use the x32 psABI, you need to edit your ``conf/local.conf``
-configuration file as follows:
-::
+configuration file as follows::

    MACHINE = "qemux86-64"
    DEFAULTTUNE = "x86-64-x32"
@@ -5133,8 +5060,7 @@ configuration file as follows:

 Once you have set
 up your configuration file, use BitBake to build an image that supports
-the x32 psABI. Here is an example:
-::
+the x32 psABI. Here is an example::

    $ bitbake core-image-sato

@@ -5441,8 +5367,7 @@ Getting Help

 You can get general help for the ``wic`` command by entering the ``wic``
 command by itself or by entering the command with a help argument as
-follows:
-::
+follows::

    $ wic -h
    $ wic --help
@@ -5450,32 +5375,27 @@ follows:

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
@@ -5494,8 +5414,7 @@ command to return the available Wic images as follows:
 Once you know the list of available
 Wic images, you can use ``help`` with the command to get help on a
 particular image. For example, the following command returns help on the
-"beaglebone-yocto" image:
-::
+"beaglebone-yocto" image::

    $ wic list beaglebone-yocto help

@@ -5532,8 +5451,7 @@ can point to arbitrary kernel, root filesystem locations, and so forth.
 Contrast this behavior with cooked mode where Wic looks in the Build
 Directory (e.g. ``tmp/deploy/images/``\ machine).

-The general form of the ``wic`` command in raw mode is:
-::
+The general form of the ``wic`` command in raw mode is::

    $ wic create wks_file options ...

@@ -5591,8 +5509,7 @@ a kickstart file and the name of the image from which to use artifacts
 by using the "-e" option. Wic looks in the Build Directory (e.g.
 ``tmp/deploy/images/``\ machine) for artifacts.

-The general form of the ``wic`` command using Cooked Mode is as follows:
-::
+The general form of the ``wic`` command using Cooked Mode is as follows::

    $ wic create wks_file -e IMAGE_NAME

@@ -5617,14 +5534,12 @@ Using an Existing Kickstart File
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
@@ -5642,15 +5557,13 @@ Use the following command to list the available kickstart files:

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
@@ -5710,8 +5623,7 @@ When the Wic implementation needs to invoke a partition-specific
 implementation, it looks for the plugin with the same name as the
 ``--source`` parameter used in the kickstart file given to that
 partition. For example, if the partition is set up using the following
-command in a kickstart file:
-::
+command in a kickstart file::

    part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024

@@ -5722,8 +5634,7 @@ members of the matching source plugin (i.e. ``bootimg-pcbios``) in the
 To be more concrete, here is the corresponding plugin definition from
 the ``bootimg-pcbios.py`` file for the previous command along with an
 example method called by the Wic implementation when it needs to prepare
-a partition using an implementation-specific function:
-::
+a partition using an implementation-specific function::

                 .
                 .
@@ -5818,8 +5729,7 @@ Generate an Image using an Existing Kickstart File
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 This example runs in Cooked Mode and uses the ``mkefidisk`` kickstart
-file:
-::
+file::

    $ wic create mkefidisk -e core-image-minimal
    INFO: Building wic-tools...
@@ -5855,8 +5765,7 @@ and kickstart file information.
 Continuing with the example, you can now write the image from the Build
 Directory onto a USB stick, or whatever media for which you built your
 image, and boot from the media. You can write the image by using
-``bmaptool`` or ``dd``:
-::
+``bmaptool`` or ``dd``::

    $ oe-run-native bmaptool copy mkefidisk-201804191017-sda.direct /dev/sdX

@@ -5895,8 +5804,7 @@ will need to boot from ``sdb`` instead of ``sda``, which is what the

 The example begins by making a copy of the ``directdisk-gpt.wks`` file
 in the ``scripts/lib/image/canned-wks`` directory and then by changing
-the lines that specify the target disk from which to boot.
-::
+the lines that specify the target disk from which to boot::

    $ cp /home/stephano/poky/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
         /home/stephano/poky/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
@@ -5904,8 +5812,7 @@ the lines that specify the target disk from which to boot.
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
 example changes the following two lines and leaves the remaining lines
-untouched:
-::
+untouched::

    part /boot --source bootimg-pcbios --ondisk sdb --label boot --active --align 1024
    part / --source rootfs --ondisk sdb --fstype=ext4 --label platform --align 1024 --use-uuid
@@ -5914,8 +5821,7 @@ Once the lines are changed, the
 example generates the ``directdisksdb-gpt`` image. The command points
 the process at the ``core-image-minimal`` artifacts for the Next Unit of
 Computing (nuc) :term:`MACHINE` the
-``local.conf``.
-::
+``local.conf``::

    $ wic create directdisksdb-gpt -e core-image-minimal
    INFO: Building wic-tools...
@@ -5942,8 +5848,7 @@ Computing (nuc) :term:`MACHINE` the

 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot
-the resulting media:
-::
+the resulting media::

    $ sudo dd if=directdisksdb-gpt-201710090938-sdb.direct of=/dev/sdb
    140966+0 records in
@@ -5957,8 +5862,7 @@ Using a Modified Kickstart File and Running in Raw Mode
 This next example manually specifies each build artifact (runs in Raw
 Mode) and uses a modified kickstart file. The example also uses the
 ``-o`` option to cause Wic to create the output somewhere other than the
-default output directory, which is the current directory:
-::
+default output directory, which is the current directory::

    $ wic create /home/stephano/my_yocto/test.wks -o /home/stephano/testwic \
         --rootfs-dir /home/stephano/build/master/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs \
@@ -6155,8 +6059,7 @@ any type of image. Use these steps to flash an image using Bmaptool:
          $ sudo chmod 666 /dev/sdX
          $ oe-run-native bmap-tools-native bmaptool copy build-directory/tmp/deploy/images/machine/image.wic /dev/sdX

-For help on the ``bmaptool`` command, use the following command:
-::
+For help on the ``bmaptool`` command, use the following command::

    $ bmaptool --help

@@ -6251,8 +6154,7 @@ your build output more secure. The security flags are in the

 Use the following line in your ``local.conf`` file or in your custom
 distribution configuration file to enable the security compiler and
-linker flags for your build:
-::
+linker flags for your build::

    require conf/distro/include/security_flags.inc

@@ -6436,8 +6338,7 @@ The OpenEmbedded build system uses the environment variable
 configuration information that ultimately ends up in the
 :term:`Build Directory` ``conf`` directory.
 By default, ``TEMPLATECONF`` is set as follows in the ``poky``
-repository:
-::
+repository::

    TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}

@@ -6465,8 +6366,7 @@ Changing the ``.templateconf`` as follows causes the OpenEmbedded build
 system to look in your directory and base its configuration files on the
 ``*.sample`` configuration files it finds. The final configuration files
 (i.e. ``local.conf`` and ``bblayers.conf`` ultimately still end up in
-your Build Directory, but they are based on your ``*.sample`` files.
-::
+your Build Directory, but they are based on your ``*.sample`` files::

    TEMPLATECONF=${TEMPLATECONF:-meta-mylayer/myconf}

@@ -6479,8 +6379,7 @@ display BitBake targets as part of the script output. Customizing this
 targets appears as part of the script's output.

 Here is the default list of targets displayed as a result of running
-either of the setup scripts:
-::
+either of the setup scripts::

    You can now run 'bitbake <target>'

@@ -6501,8 +6400,7 @@ Conserving Disk Space During Builds

 To help conserve disk space during builds, you can add the following
 statement to your project's ``local.conf`` configuration file found in
-the :term:`Build Directory`:
-::
+the :term:`Build Directory`::

    INHERIT += "rm_work"

@@ -6690,8 +6588,7 @@ The simplest form for a PR Service is for it to exist for a single host
 development system that builds the package feed (building system). For
 this scenario, you can enable a local PR Service by setting
 :term:`PRSERV_HOST` in your
-``local.conf`` file in the :term:`Build Directory`:
-::
+``local.conf`` file in the :term:`Build Directory`::

    PRSERV_HOST = "localhost:0"

@@ -6702,8 +6599,7 @@ stopping the server.
 If you have a more complex setup where multiple host development systems
 work against a common, shared package feed, you have a single PR Service
 running and it is connected to each building system. For this scenario,
-you need to start the PR Service using the ``bitbake-prserv`` command:
-::
+you need to start the PR Service using the ``bitbake-prserv`` command::

    bitbake-prserv --host ip --port port --start

@@ -6715,8 +6611,7 @@ server and port.
 It is also recommended you use build history, which adds some sanity
 checks to binary package versions, in conjunction with the server that
 is running the PR Service. To enable build history, add the following to
-each building system's ``local.conf`` file:
-::
+each building system's ``local.conf`` file::

    # It is recommended to activate "buildhistory" for testing the PR service
    INHERIT += "buildhistory"
@@ -6787,15 +6682,13 @@ the specific source code revision from which to build. You set the
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

@@ -6865,8 +6758,7 @@ package for each one it finds by appending to the
 :term:`PACKAGES` variable and
 setting the appropriate values for ``FILES_packagename``,
 ``RDEPENDS_packagename``, ``DESCRIPTION_packagename``, and so forth.
-Here is an example from the ``lighttpd`` recipe:
-::
+Here is an example from the ``lighttpd`` recipe::

    python populate_packages_prepend () {
        lighttpd_libdir = d.expand('${libdir}')
@@ -6909,8 +6801,7 @@ directory of the ``poky`` :ref:`source repository <yocto-project-repositories>`.
 also find examples in ``meta/classes/kernel.bbclass``.

 Following is a reference that shows ``do_split_packages`` mandatory and
-optional arguments:
-::
+optional arguments::

    Mandatory arguments

@@ -6998,8 +6889,7 @@ any dependencies on optional modules from other recipes are satisfied by
 your recipe. You can be sure these dependencies are satisfied by using
 the :term:`PACKAGES_DYNAMIC`
 variable. Here is an example that continues with the ``lighttpd`` recipe
-shown earlier:
-::
+shown earlier::

    PACKAGES_DYNAMIC = "lighttpd-module-.*"

@@ -7128,15 +7018,13 @@ target's package database(s) later once your image is up and running.
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

@@ -7186,8 +7074,7 @@ your packaging choice (i.e. the
 :term:`PACKAGE_CLASSES`
 setting), simply start the server. The following example assumes a build
 directory of ``~/poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
-setting of "package_rpm":
-::
+setting of "package_rpm"::

    $ cd ~/poky/build/tmp/deploy/rpm
    $ python3 -m http.server
@@ -7380,8 +7267,7 @@ Signing RPM Packages

 To enable signing RPM packages, you must set up the following
 configurations in either your ``local.config`` or ``distro.config``
-file:
-::
+file::

    # Inherit sign_rpm.bbclass to enable signing functionality
    INHERIT += " sign_rpm"
@@ -7412,8 +7298,7 @@ signed package feeds for IPK and RPM packages.

 The steps you need to take to enable signed package feed use are similar
 to the steps used to sign RPM packages. You must define the following in
-your ``local.config`` or ``distro.config`` file:
-::
+your ``local.config`` or ``distro.config`` file::

    INHERIT += "sign_package_feed"
    PACKAGE_FEED_GPG_NAME = "key_name"
@@ -7452,8 +7337,7 @@ hand, the test can be anything from a simple shell script that runs a
 binary and checks the output to an elaborate system of test binaries and
 data files.

-The test generates output in the format used by Automake:
-::
+The test generates output in the format used by Automake::

    result: testname

@@ -7475,8 +7359,7 @@ To add package testing to your build, add the
 :term:`DISTRO_FEATURES` and
 :term:`EXTRA_IMAGE_FEATURES`
 variables to your ``local.conf`` file, which is found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    DISTRO_FEATURES_append = " ptest"
    EXTRA_IMAGE_FEATURES += "ptest-pkgs"
@@ -7631,8 +7514,7 @@ which is a file browser web application.
    You must know the ``cute-files`` module version.

 The first thing you need to do is use ``devtool`` and the NPM fetcher to
-create the recipe:
-::
+create the recipe::

    $ devtool add "npm://registry.npmjs.org;package=cute-files;version=1.0.2"

@@ -7660,8 +7542,7 @@ runs.
    practical way to have the licenses for all of the dependencies
    represented in the license manifest of the image.

-The ``devtool edit-recipe`` command lets you take a look at the recipe:
-::
+The ``devtool edit-recipe`` command lets you take a look at the recipe::

    $ devtool edit-recipe cute-files
    SUMMARY = "Turn any folder on your computer into a cute file browser, available on the local network."
@@ -7694,8 +7575,7 @@ Three key points exist in the previous example:
    :ref:`npm <ref-classes-npm>` class to package
    up all the modules.

-You can run the following command to build the ``cute-files`` package:
-::
+You can run the following command to build the ``cute-files`` package::

    $ devtool build cute-files

@@ -7703,8 +7583,7 @@ Remember that ``nodejs`` must be installed on
 the target before your package.

 Assuming 192.168.7.2 for the target's IP address, use the following
-command to deploy your package:
-::
+command to deploy your package::

    $ devtool deploy-target -s cute-files root@192.168.7.2

@@ -7745,15 +7624,13 @@ projects method, you provide ``devtool`` with an URL that points to the
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
@@ -7805,8 +7682,7 @@ by the literal sequence '\\n'. The separator can be redefined using the
 variable flag ``separator``.

 The following is an example that adds two custom fields for ipk
-packages:
-::
+packages::

    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup:Applications/Spreadsheets"

@@ -7836,8 +7712,7 @@ adding statements to your configuration file so that the build process
 checks local directories first for existing tarballs before checking the
 Internet.

-Here is an efficient way to set it up in your ``local.conf`` file:
-::
+Here is an efficient way to set it up in your ``local.conf`` file::

    SOURCE_MIRROR_URL ?= "file:///home/you/your-download-dir/"
    INHERIT += "own-mirrors"
@@ -7868,8 +7743,7 @@ download directory :ref:`structure-build-downloads`,
 which is located with :term:`DL_DIR`.

 Use the following BitBake command form to fetch all the necessary
-sources without starting the build:
-::
+sources without starting the build::

    $ bitbake target --runall=fetch

@@ -7916,15 +7790,13 @@ following sections.
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

@@ -7932,8 +7804,7 @@ Doing so removes any
 redundant SysVinit scripts.

 To remove initscripts from your image altogether, set this variable
-also:
-::
+also::

    VIRTUAL-RUNTIME_initscripts = ""

@@ -7943,8 +7814,7 @@ For information on the backfill variable, see
 Using systemd for the Main Image and Using SysVinit for the Rescue Image
 ------------------------------------------------------------------------

-Set these variables in your distribution configuration file as follows:
-::
+Set these variables in your distribution configuration file as follows::

    DISTRO_FEATURES_append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
@@ -7980,8 +7850,7 @@ Using Persistent and Pre-Populated\ ``/dev``

 To use the static method for device population, you need to set the
 :term:`USE_DEVFS` variable to "0"
-as follows:
-::
+as follows::

    USE_DEVFS = "0"

@@ -7993,8 +7862,7 @@ machine or distro configuration file. Alternatively, you can set this
 variable in your ``local.conf`` configuration file.

 If you do not define the ``IMAGE_DEVICE_TABLES`` variable, the default
-``device_table-minimal.txt`` is used:
-::
+``device_table-minimal.txt`` is used::

    IMAGE_DEVICE_TABLES = "device_table-mymachine.txt"

@@ -8008,8 +7876,7 @@ Using ``devtmpfs`` and a Device Manager

 To use the dynamic method for device population, you need to use (or be
 sure to set) the :term:`USE_DEVFS`
-variable to "1", which is the default:
-::
+variable to "1", which is the default::

    USE_DEVFS = "1"

@@ -8026,8 +7893,7 @@ To have more control over the device nodes, you can use a device manager
 like ``udev`` or ``busybox-mdev``. You choose the device manager by
 defining the ``VIRTUAL-RUNTIME_dev_manager`` variable in your machine or
 distro configuration file. Alternatively, you can set this variable in
-your ``local.conf`` configuration file:
-::
+your ``local.conf`` configuration file::

    VIRTUAL-RUNTIME_dev_manager = "udev"

@@ -8050,14 +7916,12 @@ Subversion (SVN), Git, and Bazaar (BZR) repositories.

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

@@ -8065,20 +7929,17 @@ Then, you can add the following to your
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
@@ -8130,15 +7991,13 @@ Creating the Root Filesystem
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

@@ -8235,8 +8094,7 @@ Build history is disabled by default. To enable it, add the following
 ``INHERIT`` statement and set the
 :term:`BUILDHISTORY_COMMIT`
 variable to "1" at the end of your ``conf/local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "1"
@@ -8324,8 +8182,7 @@ and actual revisions might differ when
 :term:`SRCREV` is set to
 ${:term:`AUTOREV`}. Here is an
 example assuming
-``buildhistory/packages/qemux86-poky-linux/linux-yocto/latest_srcrev``):
-::
+``buildhistory/packages/qemux86-poky-linux/linux-yocto/latest_srcrev``)::

    # SRCREV_machine = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
    SRCREV_machine = "38cd560d5022ed2dbd1ab0dca9642e47c98a0aa1"
@@ -8338,8 +8195,7 @@ collect the stored ``SRCREV`` values from build history and report them
 in a format suitable for use in global configuration (e.g.,
 ``local.conf`` or a distro include file) to override floating
 ``AUTOREV`` values to a fixed set of revisions. Here is some example
-output from this command:
-::
+output from this command::

    $ buildhistory-collect-srcrevs -a
    # i586-poky-linux
@@ -8454,8 +8310,7 @@ image. If you are just interested in this information and not interested
 in collecting specific package or SDK information, you can enable
 writing only image information without any history by adding the
 following to your ``conf/local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    INHERIT += "buildhistory"
    BUILDHISTORY_COMMIT = "0"
@@ -8554,8 +8409,7 @@ interface.
 To see any changes that have occurred (assuming you have
 :term:`BUILDHISTORY_COMMIT` = "1"),
 you can simply use any Git command that allows you to view the history
-of a repository. Here is one method:
-::
+of a repository. Here is one method::

    $ git log -p

@@ -8565,8 +8419,7 @@ however, that this method does show changes that are not significant

 A command-line tool called ``buildhistory-diff`` does exist, though,
 that queries the Git repository and prints just the differences that
-might be significant in human-readable form. Here is an example:
-::
+might be significant in human-readable form. Here is an example::

    $ ~/poky/poky/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
@@ -8893,8 +8746,7 @@ wish to experiment with automated hardware testing, you can use the
 the required power action. This script requires either KDialog or Zenity
 to be installed. To use this script, set the
 :term:`TEST_POWERCONTROL_CMD`
-variable as follows:
-::
+variable as follows::

    TEST_POWERCONTROL_CMD = "${COREBASE}/scripts/contrib/dialog-power-control"

@@ -8916,8 +8768,7 @@ connecting to a remote console server. Regardless of the case, the
 command simply needs to connect to the serial console and forward that
 connection to standard input and output as any normal terminal program
 does. For example, to use the picocom terminal program on serial device
-``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows:
-::
+``/dev/ttyUSB0`` at 115200bps, you would set the variable as follows::

    TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"

@@ -8925,8 +8776,7 @@ For local
 devices where the serial port device disappears when the device reboots,
 an additional "serdevtry" wrapper script is provided. To use this
 wrapper, simply prefix the terminal command with
-``${COREBASE}/scripts/contrib/serdevtry``:
-::
+``${COREBASE}/scripts/contrib/serdevtry``::

    TEST_SERIALCONTROL_CMD = "${COREBASE}/scripts/contrib/serdevtry picocom -b 115200 /dev/ttyUSB0"

@@ -9032,16 +8882,14 @@ test execution off to a scheduler. You can only export tests that are
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

@@ -9050,28 +8898,24 @@ Exporting the tests places them in the
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
@@ -9221,8 +9065,7 @@ data:

 Following is an example JSON file that handles test "foo" installing
 package "bar" and test "foobar" installing packages "foo" and "bar".
-Once the test is complete, the packages are removed from the DUT.
-::
+Once the test is complete, the packages are removed from the DUT::

      {
          "foo": {
@@ -9367,14 +9210,12 @@ variables>` did not work out as expected.
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

@@ -9397,8 +9238,7 @@ variable flags (varflags) set on the variable. The output can be very
 helpful during debugging.

 Variables that are exported to the environment are preceded by
-``export`` in the output of ``bitbake -e``. See the following example:
-::
+``export`` in the output of ``bitbake -e``. See the following example::

    export CC="i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/ulf/poky/build/tmp/sysroots/qemux86"

@@ -9470,8 +9310,7 @@ Following are a few of the available ``oe-pkgdata-util`` subcommands.
    of the recipes that produce the given packages.

 For more information on the ``oe-pkgdata-util`` command, use the help
-facility:
-::
+facility::

    $ oe-pkgdata-util --help
    $ oe-pkgdata-util subcommand --help
@@ -9486,8 +9325,7 @@ before the one you have specified. Dependency information can help you
 understand why a recipe is built.

 To generate dependency information for a recipe, run the following
-command:
-::
+command::

    $ bitbake -g recipename

@@ -9535,8 +9373,7 @@ format and can be converted to images (e.g. using the ``dot`` tool from
       displays paths between graph nodes.

 You can use a different method to view dependency information by using
-the following command:
-::
+the following command::

    $ bitbake -g -u taskexp recipename

@@ -9564,8 +9401,7 @@ If you are unsure whether a variable dependency is being picked up
 automatically for a given task, you can list the variable dependencies
 BitBake has determined by doing the following:

-1. Build the recipe containing the task:
-::
+1. Build the recipe containing the task::

    $ bitbake recipename

@@ -9620,8 +9456,7 @@ call ``bitbake-diffsigs`` with just one file, the command behaves like

 You can also use BitBake to dump out the signature construction
 information without executing tasks by using either of the following
-BitBake command-line options:
-::
+BitBake command-line options::

    ‐‐dump-signatures=SIGNATURE_HANDLER
    -S SIGNATURE_HANDLER
@@ -9714,8 +9549,7 @@ behavior in most cases is: ``do_fetch``, ``do_unpack``, ``do_patch``,
 ``do_build`` and any tasks on which it depends build first. Some tasks,
 such as ``do_devshell``, are not part of the default build chain. If you
 wish to run a task that is not part of the default build chain, you can
-use the ``-c`` option in BitBake. Here is an example:
-::
+use the ``-c`` option in BitBake. Here is an example::

    $ bitbake matchbox-desktop -c devshell

@@ -9740,8 +9574,7 @@ out), then you can use the ``-f`` option.
    [\ :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ]
    variable flag is already set for the task.

-The following example shows one way you can use the ``-f`` option:
-::
+The following example shows one way you can use the ``-f`` option::

    $ bitbake matchbox-desktop
              .
@@ -9770,8 +9603,7 @@ Using this option invalidates the given task and then runs the
 :ref:`ref-tasks-build` task, which is
 the default task if no task is given, and the tasks on which it depends.
 You could replace the final two commands in the previous example with
-the following single command:
-::
+the following single command::

    $ bitbake matchbox-desktop -C compile

@@ -9803,8 +9635,7 @@ task dependency mechanisms.


 You can view a list of tasks in a given package by running the
-``do_listtasks`` task as follows:
-::
+``do_listtasks`` task as follows::

    $ bitbake matchbox-desktop -c listtasks

@@ -9832,8 +9663,7 @@ Building with No Dependencies
 -----------------------------

 To build a specific recipe (``.bb`` file), you can use the following
-command form:
-::
+command form::

    $ bitbake -b somepath/somerecipe.bb

@@ -9902,8 +9732,7 @@ in the log, use the "debug" loglevel.
 Following is an example written in Python. The code handles logging for
 a function that determines the number of tasks needed to be run. See the
 ":ref:`ref-tasks-listtasks`"
-section for additional information:
-::
+section for additional information::

    python do_listtasks() {
        bb.debug(2, "Starting to figure out the task list")
@@ -9929,8 +9758,7 @@ The syntax you use for recipes written in Bash is similar to that of
 recipes written in Python described in the previous section.

 Following is an example written in Bash. The code logs the progress of
-the ``do_my_function`` function.
-::
+the ``do_my_function`` function::

    do_my_function() {
        bbdebug 2 "Running do_my_function"
@@ -10065,13 +9893,11 @@ build, set the
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

@@ -10079,8 +9905,7 @@ For information on how to use a
 ``devshell``, see the "`Using a Development
 Shell <#platdev-appdev-devshell>`__" section.

-In the ``devshell``, do the following:
-::
+In the ``devshell``, do the following::

    $ make clean
    $ make tools/snep-send.o
@@ -10088,8 +9913,7 @@ In the ``devshell``, do the following:
 The ``devshell`` commands cause the failure to clearly
 be visible. In this case, a missing dependency exists for the "neard"
 Makefile target. Here is some abbreviated, sample output with the
-missing dependency clearly visible at the end:
-::
+missing dependency clearly visible at the end::

    i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/scott-lenovo/......
       .
@@ -10110,8 +9934,7 @@ Creating a Patch for the Fix

 Because there is a missing dependency for the Makefile target, you need
 to patch the ``Makefile.am`` file, which is generated from
-``Makefile.in``. You can use Quilt to create the patch:
-::
+``Makefile.in``. You can use Quilt to create the patch::

    $ quilt new parallelmake.patch
    Patch patches/parallelmake.patch is now on top
@@ -10123,14 +9946,12 @@ For more information on using Quilt, see the

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
@@ -10138,8 +9959,7 @@ patch:
 Once
 the patch file exists, you need to add it back to the originating recipe
 folder. Here is an example assuming a top-level
-:term:`Source Directory` named ``poky``:
-::
+:term:`Source Directory` named ``poky``::

    $ cp patches/parallelmake.patch poky/meta/recipes-connectivity/neard/neard

@@ -10147,8 +9967,7 @@ The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
 :term:`SRC_URI` statement includes
 the patch file. The recipe file is in the folder above the patch. Here
-is what the edited ``SRC_URI`` statement would look like:
-::
+is what the edited ``SRC_URI`` statement would look like::

    SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
               file://neard.in \
@@ -10157,8 +9976,7 @@ is what the edited ``SRC_URI`` statement would look like:
              "

 With the patch complete and moved to the correct folder and the
-``SRC_URI`` statement updated, you can exit the ``devshell``:
-::
+``SRC_URI`` statement updated, you can exit the ``devshell``::

    $ exit

@@ -10166,16 +9984,14 @@ Testing the Build
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
@@ -11014,8 +10830,7 @@ Specifying the ``LIC_FILES_CHKSUM`` Variable

 The ``LIC_FILES_CHKSUM`` variable contains checksums of the license text
 in the source code for the recipe. Following is an example of how to
-specify ``LIC_FILES_CHKSUM``:
-::
+specify ``LIC_FILES_CHKSUM``::

    LIC_FILES_CHKSUM = "file://COPYING;md5=xxxx \
                        file://licfile1.txt;beginline=5;endline=29;md5=yyyy \
@@ -11038,8 +10853,7 @@ variable as the default directory when searching files listed in
 ``LIC_FILES_CHKSUM``. The previous example employs the default
 directory.

-Consider this next example:
-::
+Consider this next example::

    LIC_FILES_CHKSUM = "file://src/ls.c;beginline=5;endline=16;\
                                        md5=bb14ed3c4cda583abc85401304b5cd4e"
@@ -11103,15 +10917,13 @@ are defined on a recipe-by-recipe basis through the
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

@@ -11126,8 +10938,7 @@ could add either the string "commercial_gst-plugins-ugly" or the more
 general string "commercial" to ``LICENSE_FLAGS_WHITELIST``. See the
 "`License Flag Matching <#license-flag-matching>`__" section for a full
 explanation of how ``LICENSE_FLAGS`` matching works. Here is the
-example:
-::
+example::

    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly"

@@ -11135,8 +10946,7 @@ Likewise, to additionally enable the package built from the recipe
 containing ``LICENSE_FLAGS = "license_${PN}_${PV}"``, and assuming that
 the actual recipe name was ``emgd_1.10.bb``, the following string would
 enable that package as well as the original ``gst-plugins-ugly``
-package:
-::
+package::

    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly license_emgd_1.10"

@@ -11148,8 +10958,7 @@ or characters. A partial string will match any license that contains the
 given string as the first portion of its license. For example, the
 following whitelist string will also match both of the packages
 previously mentioned as well as any other packages that have licenses
-starting with "commercial" or "license".
-::
+starting with "commercial" or "license"::

    LICENSE_FLAGS_WHITELIST = "commercial license"

@@ -11192,8 +11001,7 @@ matches any expanded ``LICENSE_FLAGS`` definition that starts with the
 string "commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
 hypothetical recipes named "foo" and "bar" assuming those recipes simply
-specify the following:
-::
+specify the following::

    LICENSE_FLAGS = "commercial"

@@ -11231,8 +11039,7 @@ Other Variables Related to Commercial Licenses

 Other helpful variables related to commercial license handling exist and
 are defined in the
-``poky/meta/conf/distro/include/default-distrovars.inc`` file:
-::
+``poky/meta/conf/distro/include/default-distrovars.inc`` file::

    COMMERCIAL_AUDIO_PLUGINS ?= ""
    COMMERCIAL_VIDEO_PLUGINS ?= ""
@@ -11240,8 +11047,7 @@ are defined in the
 If you
 want to enable these components, you can do so by making sure you have
 statements similar to the following in your ``local.conf`` configuration
-file:
-::
+file::

    COMMERCIAL_AUDIO_PLUGINS = "gst-plugins-ugly-mad \
        gst-plugins-ugly-mpegaudioparse"
@@ -11253,8 +11059,7 @@ file:
 Of course, you could also create a matching whitelist for those
 components using the more general "commercial" in the whitelist, but
 that would also enable all the other packages with ``LICENSE_FLAGS``
-containing "commercial", which you may or may not want:
-::
+containing "commercial", which you may or may not want::

    LICENSE_FLAGS_WHITELIST = "commercial"

@@ -11334,8 +11139,7 @@ of compliance in mind.
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
 the ``local.conf`` file found in the
-:term:`Build Directory`:
-::
+:term:`Build Directory`::

    INHERIT += "archiver"
    ARCHIVER_MODE[src] = "original"
@@ -11391,8 +11195,7 @@ One requirement that is often overlooked is inclusion of license text.
 This requirement also needs to be dealt with prior to generating the
 final image. Some licenses require the license text to accompany the
 binary. You can achieve this by adding the following to your
-``local.conf`` file:
-::
+``local.conf`` file::

    COPY_LIC_MANIFEST = "1"
    COPY_LIC_DIRS = "1"
@@ -11459,8 +11262,7 @@ thing a development organization might want to consider for end-user
 convenience is to modify ``meta-poky/conf/bblayers.conf.sample`` to
 ensure that when the end user utilizes the released build system to
 build an image, the development organization's layers are included in
-the ``bblayers.conf`` file automatically:
-::
+the ``bblayers.conf`` file automatically::

    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
@@ -11528,8 +11330,7 @@ variable. Using this variable also avoids QA errors when you use a
 non-common, non-CLOSED license in a recipe.

 The following is an example that uses the ``LICENSE.Abilis.txt`` file as
-the license from the fetched source:
-::
+the license from the fetched source::

    NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"

@@ -11564,16 +11365,14 @@ inheriting the
 :ref:`report-error <ref-classes-report-error>`
 class by adding the following statement to the end of your
 ``local.conf`` file in your
-:term:`Build Directory`.
-::
+:term:`Build Directory`::

    INHERIT += "report-error"

 By default, the error reporting feature stores information in
 ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 However, you can specify a directory to use by adding the following to
-your ``local.conf`` file:
-::
+your ``local.conf`` file::

    ERR_REPORT_DIR = "path"

@@ -11582,8 +11381,7 @@ reporting causes the build process to collect the errors and store them
 in a file as previously described. When the build system encounters an
 error, it includes a command as part of the console output. You can run
 the command to send the error file to the server. For example, the
-following command sends the errors to an upstream server:
-::
+following command sends the errors to an upstream server::

    $ send-error-report /home/brandusa/project/poky/build/tmp/log/error-report/error_report_201403141617.txt

@@ -11591,8 +11389,7 @@ In the previous example, the errors are sent to a public database
 available at https://errors.yoctoproject.org, which is used by the
 entire community. If you specify a particular server, you can send the
 errors to a different database. Use the following command for more
-information on available options:
-::
+information on available options::

    $ send-error-report --help

@@ -11610,8 +11407,7 @@ Disabling the Tool

 To disable the error reporting feature, simply remove or comment out the
 following statement from the end of your ``local.conf`` file in your
-:term:`Build Directory`.
-::
+:term:`Build Directory`::

    INHERIT += "report-error"

@@ -11676,8 +11472,7 @@ Wayland with Kernel Mode Setting
 (`KMS <https://wiki.archlinux.org/index.php/Kernel_Mode_Setting>`__)
 support, include the "wayland" flag in the
 :term:`DISTRO_FEATURES`
-statement in your ``local.conf`` file:
-::
+statement in your ``local.conf`` file::

    DISTRO_FEATURES_append = " wayland"

@@ -11694,8 +11489,7 @@ Installing Wayland and Weston
 To install the Wayland feature into an image, you must include the
 following
 :term:`CORE_IMAGE_EXTRA_INSTALL`
-statement in your ``local.conf`` file:
-::
+statement in your ``local.conf`` file::

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
index 830b3e88c..6bd88033b 100644
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

@@ -1895,31 +1872,26 @@ Here is an example that looks at what has changed in the ``emenlow``
 branch of the ``linux-yocto-3.19`` kernel. The lower commit range is the
 commit associated with the ``standard/base`` branch, while the upper
 commit range is the commit associated with the ``standard/emenlow``
-branch.
-::
+branch::

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

@@ -1928,15 +1900,13 @@ Showing a Particular Feature or Branch Change

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
diff --git a/documentation/profile-manual/profile-manual-intro.rst b/documentation/profile-manual/profile-manual-intro.rst
index 0d435e0c0..53a032b3f 100644
--- a/documentation/profile-manual/profile-manual-intro.rst
+++ b/documentation/profile-manual/profile-manual-intro.rst
@@ -43,12 +43,12 @@ an 'sdk' image e.g. ::
    $ bitbake core-image-sato-sdk

 or alternatively by adding 'tools-profile' to the EXTRA_IMAGE_FEATURES line in
-your local.conf: ::
+your local.conf::

    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile"

 If you use the 'tools-profile' method, you don't need to build an sdk image -
-the tracing and profiling tools will be included in non-sdk images as well e.g.: ::
+the tracing and profiling tools will be included in non-sdk images as well e.g.::

    $ bitbake core-image-sato

@@ -59,7 +59,7 @@ the tracing and profiling tools will be included in non-sdk images as well e.g.:

    You can prevent that by setting the
    :term:`INHIBIT_PACKAGE_STRIP`
-   variable to "1" in your ``local.conf`` when you build the image: ::
+   variable to "1" in your ``local.conf`` when you build the image::

       INHIBIT_PACKAGE_STRIP = "1"

@@ -69,11 +69,11 @@ If you've already built a stripped image, you can generate debug
 packages (xxx-dbg) which you can manually install as needed.

 To generate debug info for packages, you can add dbg-pkgs to
-EXTRA_IMAGE_FEATURES in local.conf. For example: ::
+EXTRA_IMAGE_FEATURES in local.conf. For example::

    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"

 Additionally, in order to generate the right type of debuginfo, we also need to
-set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file: ::
+set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::

    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
diff --git a/documentation/profile-manual/profile-manual-usage.rst b/documentation/profile-manual/profile-manual-usage.rst
index d3c020a1c..75887f2ff 100644
--- a/documentation/profile-manual/profile-manual-usage.rst
+++ b/documentation/profile-manual/profile-manual-usage.rst
@@ -52,7 +52,7 @@ For this section, we'll assume you've already performed the basic setup
 outlined in the ":ref:`profile-manual/profile-manual-intro:General Setup`" section.

 In particular, you'll get the most mileage out of perf if you profile an
-image built with the following in your ``local.conf`` file: ::
+image built with the following in your ``local.conf`` file::

    INHIBIT_PACKAGE_STRIP = "1"

@@ -68,7 +68,7 @@ Basic Perf Usage

 The perf tool is pretty much self-documenting. To remind yourself of the
 available commands, simply type 'perf', which will show you basic usage
-along with the available perf subcommands: ::
+along with the available perf subcommands::

    root@crownbay:~# perf

@@ -116,7 +116,7 @@ applets in Yocto. ::
 The quickest and easiest way to get some basic overall data about what's
 going on for a particular workload is to profile it using 'perf stat'.
 'perf stat' basically profiles using a few default counters and displays
-the summed counts at the end of the run: ::
+the summed counts at the end of the run::

    root@crownbay:~# perf stat wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -145,7 +145,7 @@ Also, note that 'perf stat' isn't restricted to a fixed set of counters
 - basically any event listed in the output of 'perf list' can be tallied
 by 'perf stat'. For example, suppose we wanted to see a summary of all
 the events related to kernel memory allocation/freeing along with cache
-hits and misses: ::
+hits and misses::

    root@crownbay:~# perf stat -e kmem:* -e cache-references -e cache-misses wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -197,7 +197,7 @@ directory. ::
 To see the results in a
 'text-based UI' (tui), simply run 'perf report', which will read the
 perf.data file in the current working directory and display the results
-in an interactive UI: ::
+in an interactive UI::

    root@crownbay:~# perf report

@@ -223,7 +223,7 @@ Before we do that, however, let's try running a different profile, one
 which shows something a little more interesting. The only difference
 between the new profile and the previous one is that we'll add the -g
 option, which will record not just the address of a sampled function,
-but the entire callchain to the sampled function as well: ::
+but the entire callchain to the sampled function as well::

    root@crownbay:~# perf record -g wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -299,7 +299,7 @@ busybox binary, which is actually stripped out by the Yocto build
 system.

 One way around that is to put the following in your ``local.conf`` file
-when you build the image: ::
+when you build the image::

    INHIBIT_PACKAGE_STRIP = "1"

@@ -308,26 +308,26 @@ what can we do to get perf to resolve the symbols? Basically we need to
 install the debuginfo for the busybox package.

 To generate the debug info for the packages in the image, we can add
-``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example: ::
+``dbg-pkgs`` to :term:`EXTRA_IMAGE_FEATURES` in ``local.conf``. For example::

    EXTRA_IMAGE_FEATURES = "debug-tweaks tools-profile dbg-pkgs"

 Additionally, in order to generate the type of debuginfo that perf
 understands, we also need to set
 :term:`PACKAGE_DEBUG_SPLIT_STYLE`
-in the ``local.conf`` file: ::
+in the ``local.conf`` file::

    PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'

 Once we've done that, we can install the
 debuginfo for busybox. The debug packages once built can be found in
 ``build/tmp/deploy/rpm/*`` on the host system. Find the busybox-dbg-...rpm
-file and copy it to the target. For example: ::
+file and copy it to the target. For example::

    [trz@empanada core2]$ scp /home/trz/yocto/crownbay-tracing-dbg/build/tmp/deploy/rpm/core2_32/busybox-dbg-1.20.2-r2.core2_32.rpm root@192.168.1.31:
    busybox-dbg-1.20.2-r2.core2_32.rpm                     100% 1826KB   1.8MB/s   00:01

-Now install the debug rpm on the target: ::
+Now install the debug rpm on the target::

    root@crownbay:~# rpm -i busybox-dbg-1.20.2-r2.core2_32.rpm

@@ -388,7 +388,7 @@ traditional tools can also make use of the expanded possibilities now
 available to them, and in some cases have, as mentioned previously).

 We can get a list of the available events that can be used to profile a
-workload via 'perf list': ::
+workload via 'perf list'::

    root@crownbay:~# perf list

@@ -531,7 +531,7 @@ workload via 'perf list': ::
 Only a subset of these would be of interest to us when looking at this
 workload, so let's choose the most likely subsystems (identified by the
 string before the colon in the Tracepoint events) and do a 'perf stat'
-run using only those wildcarded subsystems: ::
+run using only those wildcarded subsystems::

    root@crownbay:~# perf stat -e skb:* -e net:* -e napi:* -e sched:* -e workqueue:* -e irq:* -e syscalls:* wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Performance counter stats for 'wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2':
@@ -593,7 +593,7 @@ run using only those wildcarded subsystems: ::


 Let's pick one of these tracepoints
-and tell perf to do a profile using it as the sampling event: ::
+and tell perf to do a profile using it as the sampling event::

    root@crownbay:~# perf record -g -e sched:sched_wakeup wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2

@@ -650,14 +650,14 @@ individual steps that go into the higher-level behavior exposed by the
 coarse-grained profiling data.

 As a concrete example, we can trace all the events we think might be
-applicable to our workload: ::
+applicable to our workload::

    root@crownbay:~# perf record -g -e skb:* -e net:* -e napi:* -e sched:sched_switch -e sched:sched_wakeup -e irq:*
     -e syscalls:sys_enter_read -e syscalls:sys_exit_read -e syscalls:sys_enter_write -e syscalls:sys_exit_write
     wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2

 We can look at the raw trace output using 'perf script' with no
-arguments: ::
+arguments::

    root@crownbay:~# perf script

@@ -741,7 +741,7 @@ two programming language bindings, one for Python and one for Perl.

 Now that we have the trace data in perf.data, we can use 'perf script
 -g' to generate a skeleton script with handlers for the read/write
-entry/exit events we recorded: ::
+entry/exit events we recorded::

    root@crownbay:~# perf script -g python
    generated Python script: perf-script.py
@@ -761,7 +761,7 @@ with its parameters. For example:
                   print "skbaddr=%u, len=%u, name=%s\n" % (skbaddr, len, name),

 We can run that script directly to print all of the events contained in the
-perf.data file: ::
+perf.data file::

    root@crownbay:~# perf script -s perf-script.py

@@ -839,7 +839,7 @@ result of all the per-event tallies. For that, we use the special
             for event_name, count in counts.iteritems():
                     print "%-40s %10s\n" % (event_name, count)

-The end result is a summary of all the events recorded in the trace: ::
+The end result is a summary of all the events recorded in the trace::

    skb__skb_copy_datagram_iovec                  13148
    irq__softirq_entry                             4796
@@ -883,13 +883,13 @@ To do system-wide profiling or tracing, you typically use the -a flag to
 'perf record'.

 To demonstrate this, open up one window and start the profile using the
--a flag (press Ctrl-C to stop tracing): ::
+-a flag (press Ctrl-C to stop tracing)::

    root@crownbay:~# perf record -g -a
    ^C[ perf record: Woken up 6 times to write data ]
    [ perf record: Captured and wrote 1.400 MB perf.data (~61172 samples) ]

-In another window, run the wget test: ::
+In another window, run the wget test::

    root@crownbay:~# wget http://downloads.yoctoproject.org/mirror/sources/linux-2.6.19.2.tar.bz2
    Connecting to downloads.yoctoproject.org (140.211.169.59:80)
@@ -909,7 +909,7 @@ unresolvable symbols in the expanded Xorg callchain).
 Note also that we have both kernel and userspace entries in the above
 snapshot. We can also tell perf to focus on userspace but providing a
 modifier, in this case 'u', to the 'cycles' hardware counter when we
-record a profile: ::
+record a profile::

    root@crownbay:~# perf record -g -a -e cycles:u
    ^C[ perf record: Woken up 2 times to write data ]
@@ -929,13 +929,13 @@ the entries associated with the libc-xxx.so DSO.
    :align: center

 We can also use the system-wide -a switch to do system-wide tracing.
-Here we'll trace a couple of scheduler events: ::
+Here we'll trace a couple of scheduler events::

    root@crownbay:~# perf record -a -e sched:sched_switch -e sched:sched_wakeup
    ^C[ perf record: Woken up 38 times to write data ]
    [ perf record: Captured and wrote 9.780 MB perf.data (~427299 samples) ]

-We can look at the raw output using 'perf script' with no arguments: ::
+We can look at the raw output using 'perf script' with no arguments::

    root@crownbay:~# perf script

@@ -960,7 +960,7 @@ do with what we're interested in, namely events that schedule 'perf'
 itself in and out or that wake perf up. We can get rid of those by using
 the '--filter' option - for each event we specify using -e, we can add a
 --filter after that to filter out trace events that contain fields with
-specific values: ::
+specific values::

    root@crownbay:~# perf record -a -e sched:sched_switch --filter 'next_comm != perf && prev_comm != perf' -e sched:sched_wakeup --filter 'comm != perf'
    ^C[ perf record: Woken up 38 times to write data ]
@@ -1025,7 +1025,7 @@ perf isn't restricted to the fixed set of static tracepoints listed by
 'perf list'. Users can also add their own 'dynamic' tracepoints anywhere
 in the kernel. For instance, suppose we want to define our own
 tracepoint on do_fork(). We can do that using the 'perf probe' perf
-subcommand: ::
+subcommand::

    root@crownbay:~# perf probe do_fork
    Added new event:
@@ -1039,7 +1039,7 @@ Adding a new tracepoint via
 'perf probe' results in an event with all the expected files and format
 in /sys/kernel/debug/tracing/events, just the same as for static
 tracepoints (as discussed in more detail in the trace events subsystem
-section: ::
+section::

    root@crownbay:/sys/kernel/debug/tracing/events/probe/do_fork# ls -al
    drwxr-xr-x    2 root     root             0 Oct 28 11:42 .
@@ -1064,7 +1064,7 @@ section: ::
    print fmt: "(%lx)", REC->__probe_ip

 We can list all dynamic tracepoints currently in
-existence: ::
+existence::

    root@crownbay:~# perf probe -l
     probe:do_fork (on do_fork)
@@ -1072,13 +1072,13 @@ existence: ::

 Let's record system-wide ('sleep 30' is a
 trick for recording system-wide but basically do nothing and then wake
-up after 30 seconds): ::
+up after 30 seconds)::

    root@crownbay:~# perf record -g -a -e probe:do_fork sleep 30
    [ perf record: Woken up 1 times to write data ]
    [ perf record: Captured and wrote 0.087 MB perf.data (~3812 samples) ]

-Using 'perf script' we can see each do_fork event that fired: ::
+Using 'perf script' we can see each do_fork event that fired::

    root@crownbay:~# perf script

@@ -1174,7 +1174,7 @@ addressed by a Yocto bug: `Bug 3388 - perf: enable man pages for basic
 functionality <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3388>`__.

 The man pages in text form, along with some other files, such as a set
-of examples, can be found in the 'perf' directory of the kernel tree: ::
+of examples, can be found in the 'perf' directory of the kernel tree::

    tools/perf/Documentation

@@ -1212,7 +1212,7 @@ Basic ftrace usage
 'ftrace' essentially refers to everything included in the /tracing
 directory of the mounted debugfs filesystem (Yocto follows the standard
 convention and mounts it at /sys/kernel/debug). Here's a listing of all
-the files found in /sys/kernel/debug/tracing on a Yocto system: ::
+the files found in /sys/kernel/debug/tracing on a Yocto system::

    root@sugarbay:/sys/kernel/debug/tracing# ls
    README                      kprobe_events               trace
@@ -1237,12 +1237,12 @@ the ftrace documentation.

 We'll start by looking at some of the available built-in tracers.

-cat'ing the 'available_tracers' file lists the set of available tracers: ::
+cat'ing the 'available_tracers' file lists the set of available tracers::

    root@sugarbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop

-The 'current_tracer' file contains the tracer currently in effect: ::
+The 'current_tracer' file contains the tracer currently in effect::

    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
    nop
@@ -1252,7 +1252,7 @@ The above listing of current_tracer shows that the
 there's actually no tracer currently in effect.

 echo'ing one of the available_tracers into current_tracer makes the
-specified tracer the current tracer: ::
+specified tracer the current tracer::

    root@sugarbay:/sys/kernel/debug/tracing# echo function > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat current_tracer
@@ -1262,7 +1262,7 @@ The above sets the current tracer to be the 'function tracer'. This tracer
 traces every function call in the kernel and makes it available as the
 contents of the 'trace' file. Reading the 'trace' file lists the
 currently buffered function calls that have been traced by the function
-tracer: ::
+tracer::

    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less

@@ -1321,7 +1321,7 @@ great way to learn about how the kernel code works in a dynamic sense.

 It is a little more difficult to follow the call chains than it needs to
 be - luckily there's a variant of the function tracer that displays the
-callchains explicitly, called the 'function_graph' tracer: ::
+callchains explicitly, called the 'function_graph' tracer::

    root@sugarbay:/sys/kernel/debug/tracing# echo function_graph > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
@@ -1457,7 +1457,7 @@ One especially important directory contained within the
 /sys/kernel/debug/tracing directory is the 'events' subdirectory, which
 contains representations of every tracepoint in the system. Listing out
 the contents of the 'events' subdirectory, we see mainly another set of
-subdirectories: ::
+subdirectories::

    root@sugarbay:/sys/kernel/debug/tracing# cd events
    root@sugarbay:/sys/kernel/debug/tracing/events# ls -al
@@ -1506,7 +1506,7 @@ subdirectories: ::
 Each one of these subdirectories
 corresponds to a 'subsystem' and contains yet again more subdirectories,
 each one of those finally corresponding to a tracepoint. For example,
-here are the contents of the 'kmem' subsystem: ::
+here are the contents of the 'kmem' subsystem::

    root@sugarbay:/sys/kernel/debug/tracing/events# cd kmem
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem# ls -al
@@ -1528,7 +1528,7 @@ here are the contents of the 'kmem' subsystem: ::
    drwxr-xr-x    2 root     root             0 Nov 14 23:19 mm_page_pcpu_drain

 Let's see what's inside the subdirectory for a
-specific tracepoint, in this case the one for kmalloc: ::
+specific tracepoint, in this case the one for kmalloc::

    root@sugarbay:/sys/kernel/debug/tracing/events/kmem# cd kmalloc
    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# ls -al
@@ -1544,7 +1544,7 @@ tracepoint describes the event in memory, which is used by the various
 tracing tools that now make use of these tracepoint to parse the event
 and make sense of it, along with a 'print fmt' field that allows tools
 like ftrace to display the event as text. Here's what the format of the
-kmalloc event looks like: ::
+kmalloc event looks like::

    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# cat format
    name: kmalloc
@@ -1583,20 +1583,20 @@ The 'enable' file
 in the tracepoint directory is what allows the user (or tools such as
 trace-cmd) to actually turn the tracepoint on and off. When enabled, the
 corresponding tracepoint will start appearing in the ftrace 'trace' file
-described previously. For example, this turns on the kmalloc tracepoint: ::
+described previously. For example, this turns on the kmalloc tracepoint::

    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# echo 1 > enable

 At the moment, we're not interested in the function tracer or
 some other tracer that might be in effect, so we first turn it off, but
 if we do that, we still need to turn tracing on in order to see the
-events in the output buffer: ::
+events in the output buffer::

    root@sugarbay:/sys/kernel/debug/tracing# echo nop > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# echo 1 > tracing_on

 Now, if we look at the the 'trace' file, we see nothing
-but the kmalloc events we just turned on: ::
+but the kmalloc events we just turned on::

    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
    # tracer: nop
@@ -1642,7 +1642,7 @@ but the kmalloc events we just turned on: ::
             <idle>-0     [000] ..s3 18156.400660: kmalloc: call_site=ffffffff81619b36 ptr=ffff88006d554800 bytes_req=512 bytes_alloc=512 gfp_flags=GFP_ATOMIC
    matchbox-termin-1361  [001] ...1 18156.552800: kmalloc: call_site=ffffffff81614050 ptr=ffff88006db34800 bytes_req=576 bytes_alloc=1024 gfp_flags=GFP_KERNEL|GFP_REPEAT

-To again disable the kmalloc event, we need to send 0 to the enable file: ::
+To again disable the kmalloc event, we need to send 0 to the enable file::

    root@sugarbay:/sys/kernel/debug/tracing/events/kmem/kmalloc# echo 0 > enable

@@ -1686,12 +1686,12 @@ a per-CPU graphical display. It directly uses 'trace-cmd' as the
 plumbing that accomplishes all that underneath the covers (and actually
 displays the trace-cmd command it uses, as we'll see).

-To start a trace using kernelshark, first start kernelshark: ::
+To start a trace using kernelshark, first start kernelshark::

    root@sugarbay:~# kernelshark

 Then bring up the 'Capture' dialog by
-choosing from the kernelshark menu: ::
+choosing from the kernelshark menu::

    Capture | Record

@@ -1743,12 +1743,12 @@ ftrace Documentation
 --------------------

 The documentation for ftrace can be found in the kernel Documentation
-directory: ::
+directory::

    Documentation/trace/ftrace.txt

 The documentation for the trace event subsystem can also be found in the kernel
-Documentation directory: ::
+Documentation directory::

    Documentation/trace/events.txt

@@ -1805,7 +1805,7 @@ which it extracts from the open syscall's argstr.
 Normally, to execute this
 probe, you'd simply install systemtap on the system you want to probe,
 and directly run the probe on that system e.g. assuming the name of the
-file containing the above text is trace_open.stp: ::
+file containing the above text is trace_open.stp::

    # stap trace_open.stp

@@ -1848,7 +1848,7 @@ target, with arguments if necessary.
 In order to do this from a remote host, however, you need to have access
 to the build for the image you booted. The 'crosstap' script provides
 details on how to do this if you run the script on the host without
-having done a build: ::
+having done a build::

    $ crosstap root@192.168.1.88 trace_open.stp

@@ -1908,7 +1908,7 @@ Running a Script on a Target
 ----------------------------

 Once you've done that, you should be able to run a systemtap script on
-the target: ::
+the target::

    $ cd /path/to/yocto
    $ source oe-init-build-env
@@ -1926,17 +1926,17 @@ the target: ::
    You can also run generated qemu images with a command like 'runqemu qemux86-64'

 Once you've done that, you can cd to whatever
-directory contains your scripts and use 'crosstap' to run the script: ::
+directory contains your scripts and use 'crosstap' to run the script::

    $ cd /path/to/my/systemap/script
    $ crosstap root@192.168.7.2 trace_open.stp

-If you get an error connecting to the target e.g.: ::
+If you get an error connecting to the target e.g.::

    $ crosstap root@192.168.7.2 trace_open.stp
    error establishing ssh connection on remote 'root@192.168.7.2'

-Try ssh'ing to the target and see what happens: ::
+Try ssh'ing to the target and see what happens::

    $ ssh root@192.168.7.2

@@ -2073,7 +2073,7 @@ tracing.
 Collecting and viewing a trace on the target (inside a shell)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-First, from the host, ssh to the target: ::
+First, from the host, ssh to the target::

    $ ssh -l root 192.168.1.47
    The authenticity of host '192.168.1.47 (192.168.1.47)' can't be established.
@@ -2082,30 +2082,30 @@ First, from the host, ssh to the target: ::
    Warning: Permanently added '192.168.1.47' (RSA) to the list of known hosts.
    root@192.168.1.47's password:

-Once on the target, use these steps to create a trace: ::
+Once on the target, use these steps to create a trace::

    root@crownbay:~# lttng create
    Spawning a session daemon
    Session auto-20121015-232120 created.
    Traces will be written in /home/root/lttng-traces/auto-20121015-232120

-Enable the events you want to trace (in this case all kernel events): ::
+Enable the events you want to trace (in this case all kernel events)::

    root@crownbay:~# lttng enable-event --kernel --all
    All kernel events are enabled in channel channel0

-Start the trace: ::
+Start the trace::

    root@crownbay:~# lttng start
    Tracing started for session auto-20121015-232120

 And then stop the trace after awhile or after running a particular workload that
-you want to trace: ::
+you want to trace::

    root@crownbay:~# lttng stop
    Tracing stopped for session auto-20121015-232120

-You can now view the trace in text form on the target: ::
+You can now view the trace in text form on the target::

    root@crownbay:~# lttng view
    [23:21:56.989270399] (+?.?????????) sys_geteuid: { 1 }, { }
@@ -2151,14 +2151,14 @@ You can now view the trace in text form on the target: ::

 You can now safely destroy the trace
 session (note that this doesn't delete the trace - it's still there in
-~/lttng-traces): ::
+~/lttng-traces)::

    root@crownbay:~# lttng destroy
    Session auto-20121015-232120 destroyed at /home/root

 Note that the trace is saved in a directory of the same name as returned by
 'lttng create', under the ~/lttng-traces directory (note that you can change this by
-supplying your own name to 'lttng create'): ::
+supplying your own name to 'lttng create')::

    root@crownbay:~# ls -al ~/lttng-traces
    drwxrwx---    3 root     root          1024 Oct 15 23:21 .
@@ -2174,18 +2174,18 @@ generated by the lttng-ust build.

 The 'hello' test program isn't installed on the rootfs by the lttng-ust
 build, so we need to copy it over manually. First cd into the build
-directory that contains the hello executable: ::
+directory that contains the hello executable::

    $ cd build/tmp/work/core2_32-poky-linux/lttng-ust/2.0.5-r0/git/tests/hello/.libs

-Copy that over to the target machine: ::
+Copy that over to the target machine::

    $ scp hello root@192.168.1.20:

 You now have the instrumented lttng 'hello world' test program on the
 target, ready to test.

-First, from the host, ssh to the target: ::
+First, from the host, ssh to the target::

    $ ssh -l root 192.168.1.47
    The authenticity of host '192.168.1.47 (192.168.1.47)' can't be established.
@@ -2194,35 +2194,35 @@ First, from the host, ssh to the target: ::
    Warning: Permanently added '192.168.1.47' (RSA) to the list of known hosts.
    root@192.168.1.47's password:

-Once on the target, use these steps to create a trace: ::
+Once on the target, use these steps to create a trace::

    root@crownbay:~# lttng create
    Session auto-20190303-021943 created.
    Traces will be written in /home/root/lttng-traces/auto-20190303-021943

-Enable the events you want to trace (in this case all userspace events): ::
+Enable the events you want to trace (in this case all userspace events)::

    root@crownbay:~# lttng enable-event --userspace --all
    All UST events are enabled in channel channel0

-Start the trace: ::
+Start the trace::

    root@crownbay:~# lttng start
    Tracing started for session auto-20190303-021943

-Run the instrumented hello world program: ::
+Run the instrumented hello world program::

    root@crownbay:~# ./hello
    Hello, World!
    Tracing... done.

 And then stop the trace after awhile or after running a particular workload
-that you want to trace: ::
+that you want to trace::

    root@crownbay:~# lttng stop
    Tracing stopped for session auto-20190303-021943

-You can now view the trace in text form on the target: ::
+You can now view the trace in text form on the target::

    root@crownbay:~# lttng view
    [02:31:14.906146544] (+?.?????????) hello:1424 ust_tests_hello:tptest: { cpu_id = 1 }, { intfield = 0, intfield2 = 0x0, longfield = 0, netintfield = 0, netintfieldhex = 0x0, arrfield1 = [ [0] = 1, [1] = 2, [2] = 3 ], arrfield2 = "test", _seqfield1_length = 4, seqfield1 = [ [0] = 116, [1] = 101, [2] = 115, [3] = 116 ], _seqfield2_length = 4,  seqfield2 = "test", stringfield = "test", floatfield = 2222, doublefield = 2, boolfield = 1 }
@@ -2234,7 +2234,7 @@ You can now view the trace in text form on the target: ::
    .

 You can now safely destroy the trace session (note that this doesn't delete the
-trace - it's still there in ~/lttng-traces): ::
+trace - it's still there in ~/lttng-traces)::

    root@crownbay:~# lttng destroy
    Session auto-20190303-021943 destroyed at /home/root
@@ -2287,7 +2287,7 @@ Basic blktrace Usage
 --------------------

 To record a trace, simply run the 'blktrace' command, giving it the name
-of the block device you want to trace activity on: ::
+of the block device you want to trace activity on::

    root@crownbay:~# blktrace /dev/sdc

@@ -2308,7 +2308,7 @@ dumps them to userspace for blkparse to merge and sort later). ::
     Total:                  8660 events (dropped 0),      406 KiB data

 If you examine the files saved to disk, you see multiple files, one per CPU and
-with the device name as the first part of the filename: ::
+with the device name as the first part of the filename::

    root@crownbay:~# ls -al
    drwxr-xr-x    6 root     root          1024 Oct 27 22:39 .
@@ -2318,7 +2318,7 @@ with the device name as the first part of the filename: ::

 To view the trace events, simply invoke 'blkparse' in the directory
 containing the trace files, giving it the device name that forms the
-first part of the filenames: ::
+first part of the filenames::

    root@crownbay:~# blkparse sdc

@@ -2418,7 +2418,7 @@ Live Mode

 blktrace and blkparse are designed from the ground up to be able to
 operate together in a 'pipe mode' where the stdout of blktrace can be
-fed directly into the stdin of blkparse: ::
+fed directly into the stdin of blkparse::

    root@crownbay:~# blktrace /dev/sdc -o - | blkparse -i -

@@ -2431,7 +2431,7 @@ identify and capture conditions of interest.

 There's actually another blktrace command that implements the above
 pipeline as a single command, so the user doesn't have to bother typing
-in the above command sequence: ::
+in the above command sequence::

    root@crownbay:~# btrace /dev/sdc

@@ -2446,19 +2446,19 @@ the traced device at all by providing native support for sending all
 trace data over the network.

 To have blktrace operate in this mode, start blktrace on the target
-system being traced with the -l option, along with the device to trace: ::
+system being traced with the -l option, along with the device to trace::

    root@crownbay:~# blktrace -l /dev/sdc
    server: waiting for connections...

 On the host system, use the -h option to connect to the target system,
-also passing it the device to trace: ::
+also passing it the device to trace::

    $ blktrace -d /dev/sdc -h 192.168.1.43
    blktrace: connecting to 192.168.1.43
    blktrace: connected!

-On the target system, you should see this: ::
+On the target system, you should see this::

    server: connection from 192.168.1.43

@@ -2469,7 +2469,7 @@ In another shell, execute a workload you want to trace. ::
    linux-2.6.19.2.tar.b 100% \|*******************************\| 41727k 0:00:00 ETA

 When it's done, do a Ctrl-C on the host system to stop the
-trace: ::
+trace::

    ^C=== sdc ===
     CPU  0:                 7691 events,      361 KiB data
@@ -2477,7 +2477,7 @@ trace: ::
     Total:                 11800 events (dropped 0),      554 KiB data

 On the target system, you should also see a trace summary for the trace
-just ended: ::
+just ended::

    server: end of run for 192.168.1.43:sdc
    === sdc ===
@@ -2486,20 +2486,20 @@ just ended: ::
     Total:                 11800 events (dropped 0),      554 KiB data

 The blktrace instance on the host will
-save the target output inside a hostname-timestamp directory: ::
+save the target output inside a hostname-timestamp directory::

    $ ls -al
    drwxr-xr-x   10 root     root          1024 Oct 28 02:40 .
    drwxr-sr-x    4 root     root          1024 Oct 26 18:24 ..
    drwxr-xr-x    2 root     root          1024 Oct 28 02:40 192.168.1.43-2012-10-28-02:40:56

-cd into that directory to see the output files: ::
+cd into that directory to see the output files::

    $ ls -l
    -rw-r--r--    1 root     root        369193 Oct 28 02:44 sdc.blktrace.0
    -rw-r--r--    1 root     root        197278 Oct 28 02:44 sdc.blktrace.1

-And run blkparse on the host system using the device name: ::
+And run blkparse on the host system using the device name::

    $ blkparse sdc

@@ -2562,25 +2562,25 @@ userspace tools.

 To enable tracing for a given device, use /sys/block/xxx/trace/enable,
 where xxx is the device name. This for example enables tracing for
-/dev/sdc: ::
+/dev/sdc::

    root@crownbay:/sys/kernel/debug/tracing# echo 1 > /sys/block/sdc/trace/enable

 Once you've selected the device(s) you want
-to trace, selecting the 'blk' tracer will turn the blk tracer on: ::
+to trace, selecting the 'blk' tracer will turn the blk tracer on::

    root@crownbay:/sys/kernel/debug/tracing# cat available_tracers
    blk function_graph function nop

    root@crownbay:/sys/kernel/debug/tracing# echo blk > current_tracer

-Execute the workload you're interested in: ::
+Execute the workload you're interested in::

    root@crownbay:/sys/kernel/debug/tracing# cat /media/sdc/testfile.txt

 And look at the output (note here that we're using 'trace_pipe' instead of
 trace to capture this trace - this allows us to wait around on the pipe
-for data to appear): ::
+for data to appear)::

    root@crownbay:/sys/kernel/debug/tracing# cat trace_pipe
                cat-3587  [001] d..1  3023.276361:   8,32   Q   R 1699848 + 8 [cat]
@@ -2599,7 +2599,7 @@ for data to appear): ::
                cat-3587  [001] d..1  3023.276497:   8,32   m   N cfq3587 activate rq, drv=1
                cat-3587  [001] d..2  3023.276500:   8,32   D   R 1699848 + 8 [cat]

-And this turns off tracing for the specified device: ::
+And this turns off tracing for the specified device::

    root@crownbay:/sys/kernel/debug/tracing# echo 0 > /sys/block/sdc/trace/enable

@@ -2619,6 +2619,6 @@ section can be found here:

 The above manpages, along with manpages for the other blktrace utilities
 (btt, blkiomon, etc) can be found in the /doc directory of the blktrace
-tools git repo: ::
+tools git repo::

    $ git clone git://git.kernel.dk/blktrace.git
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 8c2b34be5..7012a883a 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -125,7 +125,7 @@ file.

 Following is the applicable code for setting various proxy types in the
 ``.wgetrc`` file. By default, these settings are disabled with comments.
-To use them, remove the comments: ::
+To use them, remove the comments::

    # You can set the default proxies for Wget to use for http, https, and ftp.
    # They will override the value in the environment.
@@ -172,8 +172,7 @@ always been traced back to hardware or virtualization issues.
 **A:** If you get an error message that indicates GNU ``libiconv`` is
 not in use but ``iconv.h`` has been included from ``libiconv``, you need
 to check to see if you have a previously installed version of the header
-file in ``/usr/local/include``.
-::
+file in ``/usr/local/include``::

    #error GNU libiconv not in use but included iconv.h is from libiconv

@@ -209,8 +208,7 @@ section in the Yocto Project Development Tasks Manual.
 **A:** You need to create a form factor file as described in the
 ":ref:`bsp-filelayout-misc-recipes`" section in
 the Yocto Project Board Support Packages (BSP) Developer's Guide. Set
-the ``HAVE_TOUCHSCREEN`` variable equal to one as follows:
-::
+the ``HAVE_TOUCHSCREEN`` variable equal to one as follows::

    HAVE_TOUCHSCREEN=1

@@ -224,7 +222,7 @@ to add a BSP-specific netbase that includes an interfaces file. See the
 the Yocto Project Board Support Packages (BSP) Developer's Guide for
 information on creating these types of miscellaneous recipe files.

-For example, add the following files to your layer: ::
+For example, add the following files to your layer::

    meta-MACHINE/recipes-bsp/netbase/netbase/MACHINE/interfaces
    meta-MACHINE/recipes-bsp/netbase/netbase_5.0.bbappend
@@ -300,7 +298,7 @@ fail.

 As an example, you could add a specific server for the build system to
 attempt before any others by adding something like the following to the
-``local.conf`` configuration file: ::
+``local.conf`` configuration file::

    PREMIRRORS_prepend = "\
        git://.*/.* http://www.yoctoproject.org/sources/ \n \
@@ -313,8 +311,7 @@ HTTPS requests and direct them to the ``http://`` sources mirror. You
 can use ``file://`` URLs to point to local directories or network shares
 as well.

-Aside from the previous technique, these options also exist:
-::
+Aside from the previous technique, these options also exist::

    BB_NO_NETWORK = "1"

@@ -322,8 +319,7 @@ This statement tells BitBake to issue an error
 instead of trying to access the Internet. This technique is useful if
 you want to ensure code builds only from local sources.

-Here is another technique:
-::
+Here is another technique::

    BB_FETCH_PREMIRRORONLY = "1"

@@ -331,8 +327,7 @@ This statement
 limits the build system to pulling source from the ``PREMIRRORS`` only.
 Again, this technique is useful for reproducing builds.

-Here is another technique:
-::
+Here is another technique::

    BB_GENERATE_MIRROR_TARBALLS = "1"

@@ -343,7 +338,7 @@ however, the technique can simply waste time during the build.

 Finally, consider an example where you are behind an HTTP-only firewall.
 You could make the following changes to the ``local.conf`` configuration
-file as long as the ``PREMIRRORS`` server is current: ::
+file as long as the ``PREMIRRORS`` server is current::

    PREMIRRORS_prepend = "\
        ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index 5f975850b..a39ccad8d 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/ref-manual/migration-1.3.rst
@@ -29,7 +29,7 @@ location (either local or remote) and then point to it in
 :term:`SSTATE_MIRRORS`, you need to append "PATH"
 to the end of the mirror URL so that the path used by BitBake before the
 mirror substitution is appended to the path used to access the mirror.
-Here is an example: ::
+Here is an example::

    SSTATE_MIRRORS = "file://.* http://someserver.tld/share/sstate/PATH"

@@ -181,14 +181,13 @@ Linux Kernel Naming
 -------------------

 The naming scheme for kernel output binaries has been changed to now
-include :term:`PE` as part of the filename:
-::
+include :term:`PE` as part of the filename::

    KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"

 Because the ``PE`` variable is not set by default, these binary files
 could result with names that include two dash characters. Here is an
-example: ::
+example::

    bzImage--3.10.9+git0+cd502a8814_7144bcc4b8-r0-qemux86-64-20130830085431.bin

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
index a6c4c8a93..545668630 100644
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

@@ -207,7 +206,7 @@ functions to call and not arbitrary shell commands:

 For
 migration purposes, you can simply wrap shell commands in a shell
-function and then call the function. Here is an example: ::
+function and then call the function. Here is an example::

    my_postprocess_function() {
       echo "hello" > ${IMAGE_ROOTFS}/hello.txt
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
diff --git a/documentation/ref-manual/migration-1.8.rst b/documentation/ref-manual/migration-1.8.rst
index d601e6b63..a577c0c78 100644
--- a/documentation/ref-manual/migration-1.8.rst
+++ b/documentation/ref-manual/migration-1.8.rst
@@ -56,7 +56,7 @@ you can now remove them.
 Additionally, a ``bluetooth`` class has been added to make selection of
 the appropriate bluetooth support within a recipe a little easier. If
 you wish to make use of this class in a recipe, add something such as
-the following: ::
+the following::

    inherit bluetooth
    PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
@@ -84,7 +84,7 @@ where the ``linux.inc`` file in ``meta-oe`` was updated.

 Recipes that rely on the kernel source code and do not inherit the
 module classes might need to add explicit dependencies on the
-``do_shared_workdir`` kernel task, for example: ::
+``do_shared_workdir`` kernel task, for example::

    do_configure[depends] += "virtual/kernel:do_shared_workdir"

@@ -131,7 +131,7 @@ One of the improvements is to attempt to run "make clean" during the
 ``do_configure`` task if a ``Makefile`` exists. Some software packages
 do not provide a working clean target within their make files. If you
 have such recipes, you need to set
-:term:`CLEANBROKEN` to "1" within the recipe, for example: ::
+:term:`CLEANBROKEN` to "1" within the recipe, for example::

    CLEANBROKEN = "1"

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
index 8afa8ffdd..4a6956e72 100644
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

@@ -179,7 +177,7 @@ Supported machines are as follows:

 Consider the
 following example, which uses the ``qemux86-64`` machine, provides a
-root filesystem, provides an image, and uses the ``nographic`` option: ::
+root filesystem, provides an image, and uses the ``nographic`` option::

    $ runqemu qemux86-64 tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4 tmp/deploy/images/qemux86-64/bzImage nographic

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

diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
index 1aeddc81c..ab1027037 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/ref-manual/migration-2.5.rst
@@ -169,7 +169,7 @@ one of the packages provided by the Python recipe. You can no longer run
 ``bitbake python-foo`` or have a
 :term:`DEPENDS` on ``python-foo``,
 but doing either of the following causes the package to work as
-expected: ::
+expected::

    IMAGE_INSTALL_append = " python-foo"

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
index 4fcd2490d..299173713 100644
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

@@ -179,12 +178,12 @@ parameter instead of the earlier ``name`` which overlapped with the
 generic ``name`` parameter. All recipes using the npm fetcher will need
 to be changed as a result.

-An example of the new scheme: ::
+An example of the new scheme::

    SRC_URI = "npm://registry.npmjs.org;package=array-flatten;version=1.1.1 \
               npmsw://${THISDIR}/npm-shrinkwrap.json"

-Another example where the sources are fetched from git rather than an npm repository: ::
+Another example where the sources are fetched from git rather than an npm repository::

    SRC_URI = "git://github.com/foo/bar.git;protocol=https \
               npmsw://${THISDIR}/npm-shrinkwrap.json"
diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
index 9b65e26c4..4645edab0 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/ref-manual/migration-3.2.rst
@@ -90,12 +90,12 @@ If you have anonymous python or in-line python conditionally adding
 dependencies in your custom recipes, and you intend for those recipes to
 work with multilib, then you will need to ensure that ``${MLPREFIX}``
 is prefixed on the package names in the dependencies, for example
-(from the ``glibc`` recipe): ::
+(from the ``glibc`` recipe)::

     RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"

 This also applies when conditionally adding packages to :term:`PACKAGES` where
-those packages have dependencies, for example (from the ``alsa-plugins`` recipe): ::
+those packages have dependencies, for example (from the ``alsa-plugins`` recipe)::

     PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
     ...
@@ -229,7 +229,7 @@ needs ``/etc/ld.so.conf`` to be present at image build time:

 When some recipe installs libraries to a non-standard location, and
 therefore installs in a file in ``/etc/ld.so.conf.d/foo.conf``, we
-need ``/etc/ld.so.conf`` containing: ::
+need ``/etc/ld.so.conf`` containing::

   include /etc/ld.so.conf.d/*.conf

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 249b58e60..f326978cf 100644
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
@@ -573,8 +570,7 @@ By default, this class expects the source code to support recipe builds
 that use the :term:`B` variable to point to the directory in
 which the OpenEmbedded build system places the generated objects built
 from the recipes. By default, the ``B`` directory is set to the
-following, which is separate from the source directory (``S``):
-::
+following, which is separate from the source directory (``S``)::

    ${WORKDIR}/${BPN}/{PV}/

@@ -610,8 +606,7 @@ be performed using the
    useradd
    class to add user and group configuration to a specific recipe.

-Here is an example that uses this class in an image recipe:
-::
+Here is an example that uses this class in an image recipe::

    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -624,8 +619,7 @@ Here is an example that uses this class in an image recipe:
        "

 Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
-passwords:
-::
+passwords::

    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -633,8 +627,7 @@ passwords:
        useradd -P tester01 tester-sue; \
        "

-Finally, here is an example that sets the root password to "1876*18":
-::
+Finally, here is an example that sets the root password to "1876*18"::

    inherit extrausers
    EXTRA_USERS_PARAMS = "\
@@ -896,8 +889,7 @@ system need to either inherit the ``icecc`` class or nobody should.
 At the distribution level, you can inherit the ``icecc`` class to be
 sure that all builders start with the same sstate signatures. After
 inheriting the class, you can then disable the feature by setting the
-:term:`ICECC_DISABLED` variable to "1" as follows:
-::
+:term:`ICECC_DISABLED` variable to "1" as follows::

    INHERIT_DISTRO_append = " icecc"
    ICECC_DISABLED ??= "1"
@@ -905,8 +897,7 @@ inheriting the class, you can then disable the feature by setting the
 This practice
 makes sure everyone is using the same signatures but also requires
 individuals that do want to use Icecream to enable the feature
-individually as follows in your ``local.conf`` file:
-::
+individually as follows in your ``local.conf`` file::

    ICECC_DISABLED = ""

@@ -954,8 +945,7 @@ types.

 By default, the :ref:`image <ref-classes-image>` class automatically
 enables the ``image_types`` class. The ``image`` class uses the
-``IMGCLASSES`` variable as follows:
-::
+``IMGCLASSES`` variable as follows::

    IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
    IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
@@ -997,8 +987,7 @@ during the :ref:`ref-tasks-rootfs` task, which optimizes
 the size of libraries contained in the image.

 By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows:
-::
+the :term:`USER_CLASSES` variable as follows::

    USER_CLASSES ?= "buildstats image-mklibs image-prelink"

@@ -1013,8 +1002,7 @@ the dynamic linking of shared libraries to reduce executable startup
 time.

 By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows:
-::
+the :term:`USER_CLASSES` variable as follows::

    USER_CLASSES ?= "buildstats image-mklibs image-prelink"

@@ -1043,8 +1031,7 @@ configuration). However, to skip one or more checks in recipes, you
 should use :term:`INSANE_SKIP`. For example, to skip
 the check for symbolic link ``.so`` files in the main package of a
 recipe, add the following to the recipe. You need to realize that the
-package name override, in this example ``${PN}``, must be used:
-::
+package name override, in this example ``${PN}``, must be used::

    INSANE_SKIP_${PN} += "dev-so"

@@ -1760,8 +1747,7 @@ before attempting to fetch it from the upstream specified in
 :term:`SRC_URI` within each recipe.

 To use this class, inherit it globally and specify
-:term:`SOURCE_MIRROR_URL`. Here is an example:
-::
+:term:`SOURCE_MIRROR_URL`. Here is an example::

    INHERIT += "own-mirrors"
    SOURCE_MIRROR_URL = "http://example.com/my-source-mirror"
@@ -2024,8 +2010,7 @@ established and then populates the SDK. After populating the SDK, the
 contains the cross-compiler and associated tooling, and the target,
 which contains a target root filesystem that is configured for the SDK
 usage. These two images reside in :term:`SDK_OUTPUT`,
-which consists of the following:
-::
+which consists of the following::

    ${SDK_OUTPUT}/${SDK_ARCH}-nativesdk-pkgs
    ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/target-pkgs
@@ -2184,8 +2169,7 @@ installed by ``libtool``. Removing these files results in them being
 absent from both the sysroot and target packages.

 If a recipe needs the ``.la`` files to be installed, then the recipe can
-override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows:
-::
+override the removal by setting ``REMOVE_LIBTOOL_LA`` to "0" as follows::

    REMOVE_LIBTOOL_LA = "0"

@@ -2224,8 +2208,7 @@ recipe are no longer needed. However, by default, the build system
 preserves these files for inspection and possible debugging purposes. If
 you would rather have these files deleted to save disk space as the
 build progresses, you can enable ``rm_work`` by adding the following to
-your ``local.conf`` file, which is found in the :term:`Build Directory`.
-::
+your ``local.conf`` file, which is found in the :term:`Build Directory`::

    INHERIT += "rm_work"

@@ -2235,8 +2218,7 @@ recipe, enabling ``rm_work`` will potentially result in your changes to
 the source being lost. To exclude some recipes from having their work
 directories deleted by ``rm_work``, you can add the names of the recipe
 or recipes you are working on to the ``RM_WORK_EXCLUDE`` variable, which
-can also be set in your ``local.conf`` file. Here is an example:
-::
+can also be set in your ``local.conf`` file. Here is an example::

    RM_WORK_EXCLUDE += "busybox glibc"

@@ -2544,8 +2526,7 @@ You should set :term:`SYSTEMD_SERVICE` to the
 name of the service file. You should also use a package name override to
 indicate the package to which the value applies. If the value applies to
 the recipe's main package, use ``${``\ :term:`PN`\ ``}``. Here
-is an example from the connman recipe:
-::
+is an example from the connman recipe::

    SYSTEMD_SERVICE_${PN} = "connman.service"

@@ -2621,8 +2602,7 @@ The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.

 The ``testimage.bbclass`` runs tests on an image when called using the
-following:
-::
+following::

    $ bitbake -c testimage image

@@ -2641,8 +2621,7 @@ section in the Yocto Project Development Tasks Manual.

 This class supports running automated tests against software development
 kits (SDKs). The ``testsdk`` class runs tests on an SDK when called
-using the following:
-::
+using the following::

    $ bitbake -c testsdk image

@@ -2697,8 +2676,7 @@ the environment for installed SDKs.
 The ``typecheck`` class provides support for validating the values of
 variables set at the configuration level against their defined types.
 The OpenEmbedded build system allows you to define the type of a
-variable using the "type" varflag. Here is an example:
-::
+variable using the "type" varflag. Here is an example::

    IMAGE_FEATURES[type] = "list"

@@ -2708,14 +2686,12 @@ variable using the "type" varflag. Here is an example:
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
index 9b9ddf53f..4fe49d28f 100644
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

@@ -562,8 +551,7 @@ Use the ``devtool undeploy-target`` command to remove deployed build
 output from the target machine. For the ``devtool undeploy-target``
 command to work, you must have previously used the
 ":ref:`devtool deploy-target <ref-manual/ref-devtool-reference:deploying your software on the target machine>`"
-command.
-::
+command::

    $ devtool undeploy-target recipe target

@@ -582,15 +570,13 @@ new workspace layer, it is populated with the ``README`` file and the
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

@@ -603,15 +589,13 @@ Use the ``devtool status`` command to list the recipes currently in your
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
diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/ref-images.rst
index 56ec8562f..a1b33d46d 100644
--- a/documentation/ref-manual/ref-images.rst
+++ b/documentation/ref-manual/ref-images.rst
@@ -27,7 +27,7 @@ image you want.

 From within the ``poky`` Git repository, you can use the following
 command to display the list of directories within the :term:`Source Directory`
-that contain image recipe files: ::
+that contain image recipe files::

    $ ls meta*/recipes*/images/*.bb

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

diff --git a/documentation/ref-manual/ref-qa-checks.rst b/documentation/ref-manual/ref-qa-checks.rst
index 54977dcb2..a16b7d8c1 100644
--- a/documentation/ref-manual/ref-qa-checks.rst
+++ b/documentation/ref-manual/ref-qa-checks.rst
@@ -675,7 +675,7 @@ Errors and Warnings
     task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
     lines in order to apply the patch. Consider this example:

-    Patch to be applied: ::
+    Patch to be applied::

         --- filename
         +++ filename
@@ -687,7 +687,7 @@ Errors and Warnings
          context line 5
          context line 6

-    Original source code: ::
+    Original source code::

         different context line 1
         different context line 2
@@ -696,7 +696,7 @@ Errors and Warnings
         different context line 5
         different context line 6

-    Outcome (after applying patch with fuzz): ::
+    Outcome (after applying patch with fuzz)::

         different context line 1
         different context line 2
@@ -716,14 +716,14 @@ Errors and Warnings
     *How to eliminate patch fuzz warnings*

     Use the ``devtool`` command as explained by the warning. First, unpack the
-    source into devtool workspace: ::
+    source into devtool workspace::

             devtool modify <recipe>

     This will apply all of the patches, and create new commits out of them in
     the workspace - with the patch context updated.

-    Then, replace the patches in the recipe layer: ::
+    Then, replace the patches in the recipe layer::

             devtool finish --force-patch-refresh <recipe> <layer_path>

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

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index e552351e3..146d8d147 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -716,7 +716,7 @@ system and gives an overview of their function and contents.

       If you want to mask out multiple directories or recipes, you can
       specify multiple regular expression fragments. This next example
-      masks out multiple directories and individual recipes: ::
+      masks out multiple directories and individual recipes::

          BBMASK += "/meta-ti/recipes-misc/ meta-ti/recipes-ti/packagegroup/"
          BBMASK += "/meta-oe/recipes-support/"
@@ -4808,13 +4808,13 @@ system and gives an overview of their function and contents.
       Prevents installation of all "recommended-only" packages.
       Recommended-only packages are packages installed only through the
       :term:`RRECOMMENDS` variable). Setting the
-      ``NO_RECOMMENDATIONS`` variable to "1" turns this feature on: ::
+      ``NO_RECOMMENDATIONS`` variable to "1" turns this feature on::

          NO_RECOMMENDATIONS = "1"

       You can set this variable globally in your ``local.conf`` file or you
       can attach it to a specific image recipe by using the recipe name
-      override: ::
+      override::

          NO_RECOMMENDATIONS_pn-target_image = "1"

@@ -6832,7 +6832,7 @@ system and gives an overview of their function and contents.
       ``/proc/console`` before enabling them using getty. This variable
       allows aliasing in the format: <device>:<alias>. If a device was
       listed as "sclp_line0" in ``/dev/`` and "ttyS0" was listed in
-      ``/proc/console``, you would do the following: ::
+      ``/proc/console``, you would do the following::

          SERIAL_CONSOLES_CHECK = "slcp_line0:ttyS0"

@@ -6842,7 +6842,7 @@ system and gives an overview of their function and contents.
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
       signatures of tasks from one recipe when they depend on tasks from
-      another recipe. For example: ::
+      another recipe. For example::

          SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "intone->mplayer2"

@@ -6850,7 +6850,7 @@ system and gives an overview of their function and contents.

       You can use the special token ``"*"`` on the left-hand side of the
       dependency to match all recipes except the one on the right-hand
-      side. Here is an example: ::
+      side. Here is an example::

          SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"

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
index 5ff75ada2..7f03b8fa9 100644
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
@@ -843,8 +840,7 @@ name and version, just the name, or just the version as part of the
 command line.

 Sometimes the name or version determined from the source tree might be
-incorrect. For such a case, you must reset the recipe:
-::
+incorrect. For such a case, you must reset the recipe::

    $ devtool reset -n recipename

@@ -870,8 +866,7 @@ the ``DEPENDS`` variable in the original recipe to include the new
 recipe.

 If you need to add runtime dependencies, you can do so by adding the
-following to your recipe:
-::
+following to your recipe::

    RDEPENDS_${PN} += "dependency1 dependency2 ..."

@@ -1018,8 +1013,7 @@ You can use the ``devtool add`` command two different ways to add
 Node.js modules: 1) Through ``npm`` and, 2) from a repository or local
 source.

-Use the following form to add Node.js modules through ``npm``:
-::
+Use the following form to add Node.js modules through ``npm``::

    $ devtool add "npm://registry.npmjs.org;name=forever;version=0.15.1"

@@ -1043,8 +1037,7 @@ these behaviors ensure the reproducibility and integrity of the build.

 As mentioned earlier, you can also add Node.js modules directly from a
 repository or local source tree. To add modules this way, use
-``devtool add`` in the following form:
-::
+``devtool add`` in the following form::

    $ devtool add https://github.com/diversario/node-ssdp

@@ -1233,15 +1226,13 @@ need to restore the original files that existed prior to running the
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

@@ -1274,22 +1265,19 @@ populated on-demand. Sometimes you must explicitly install extra items
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

@@ -1307,8 +1295,7 @@ If you are working with an installed extensible SDK that gets
 occasionally updated (e.g. a third-party SDK), then you will need to
 manually "pull down" the updates into the installed SDK.

-To update your installed SDK, use ``devtool`` as follows:
-::
+To update your installed SDK, use ``devtool`` as follows::

    $ devtool sdk-update

diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/sdk-using.rst
index 4b151e45c..3ed745df3 100644
--- a/documentation/sdk-manual/sdk-using.rst
+++ b/documentation/sdk-manual/sdk-using.rst
@@ -56,8 +56,7 @@ libraries appropriate for developing against that image.

 The names of the tarball installer scripts are such that a string
 representing the host system appears first in the filename and then is
-immediately followed by a string representing the target architecture.
-::
+immediately followed by a string representing the target architecture::

    poky-glibc-host_system-image_type-arch-toolchain-release_version.sh

@@ -80,8 +79,7 @@ immediately followed by a string representing the target architecture.

 For example, the following SDK installer is for a 64-bit
 development host system and a i586-tuned target architecture based off
-the SDK for ``core-image-sato`` and using the current DISTRO snapshot:
-::
+the SDK for ``core-image-sato`` and using the current DISTRO snapshot::

    poky-glibc-x86_64-core-image-sato-i586-toolchain-DISTRO.sh

@@ -146,8 +144,7 @@ begin with the string "``environment-setup``" and include as part of
 their name the tuned target architecture. As an example, the following
 commands set the working directory to where the SDK was installed and
 then source the environment setup script. In this example, the setup
-script is for an IA-based target machine using i586 tuning:
-::
+script is for an IA-based target machine using i586 tuning::

    $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux

diff --git a/documentation/sdk-manual/sdk-working-projects.rst b/documentation/sdk-manual/sdk-working-projects.rst
index 5c828fd58..a2f61143c 100644
--- a/documentation/sdk-manual/sdk-working-projects.rst
+++ b/documentation/sdk-manual/sdk-working-projects.rst
@@ -220,8 +220,7 @@ demonstrates these variable behaviors.
 In a new shell environment variables are not established for the SDK
 until you run the setup script. For example, the following commands show
 a null value for the compiler variable (i.e.
-:term:`CC`).
-::
+:term:`CC`)::

    $ echo ${CC}

@@ -231,8 +230,7 @@ Running the
 SDK setup script for a 64-bit build host and an i586-tuned target
 architecture for a ``core-image-sato`` image using the current 3.1.2
 Yocto Project release and then echoing that variable shows the value
-established through the script:
-::
+established through the script::

    $ source /opt/poky/3.1.2/environment-setup-i586-poky-linux
    $ echo ${CC}


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-588776955-1604088207=:8802--
