Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.6099.1620981343368169496
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 79A8C40002;
	Fri, 14 May 2021 08:35:41 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/6] ref-manual: simplify style
Date: Fri, 14 May 2021 10:35:22 +0200
Message-Id: <20210514083527.281767-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
References: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst          | 12 +--
 .../ref-manual/devtool-reference.rst          | 10 +--
 documentation/ref-manual/faq.rst              |  2 +-
 documentation/ref-manual/kickstart.rst        |  2 +-
 documentation/ref-manual/qa-checks.rst        |  8 +-
 documentation/ref-manual/release-process.rst  |  4 +-
 documentation/ref-manual/resources.rst        | 12 ++-
 documentation/ref-manual/structure.rst        |  8 +-
 .../ref-manual/system-requirements.rst        |  8 +-
 documentation/ref-manual/tasks.rst            |  3 +-
 documentation/ref-manual/variables.rst        | 76 +++++++++----------
 11 files changed, 69 insertions(+), 76 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index ffa17139fe..6dd0cbbd41 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1006,7 +1006,7 @@ package name override, in this example ``${PN}``, must be used::
    INSANE_SKIP_${PN} += "dev-so"
 
 Please keep in mind that the QA checks
-exist in order to detect real or potential problems in the packaged
+are meant to detect real or potential problems in the packaged
 output. So exercise caution when disabling these checks.
 
 Here are the tests you can list with the ``WARN_QA`` and
@@ -1085,8 +1085,8 @@ Here are the tests you can list with the ``WARN_QA`` and
 -  ``dev-so:`` Checks that the ``.so`` symbolic links are in the
    ``-dev`` package and not in any of the other packages. In general,
    these symlinks are only useful for development purposes. Thus, the
-   ``-dev`` package is the correct location for them. Some very rare
-   cases do exist for dynamically loaded modules where these symlinks
+   ``-dev`` package is the correct location for them. In very rare
+   cases, such as dynamically loaded modules, these symlinks
    are needed instead in the main package.
 
 -  ``file-rdeps:`` Checks that file-level dependencies identified by
@@ -1676,7 +1676,7 @@ couple different ways:
            nativesdk-myrecipe.bb
 
 
-   Not doing so can lead to subtle problems because code exists that
+   Not doing so can lead to subtle problems because there is code that
    depends on the naming convention.
 
 Although applied differently, the ``nativesdk`` class is used with both
@@ -1714,10 +1714,10 @@ section in the Yocto Project Development Tasks Manual.
 ``oelint.bbclass``
 ==================
 
-The ``oelint`` class is an obsolete lint checking tool that exists in
+The ``oelint`` class is an obsolete lint checking tool available in
 ``meta/classes`` in the :term:`Source Directory`.
 
-A number of classes exist that could be generally useful in OE-Core but
+There are some classes that could be generally useful in OE-Core but
 are never actually used within OE-Core itself. The ``oelint`` class is
 one such example. However, being aware of this class can reduce the
 proliferation of different versions of similar classes across multiple
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 0ce3219831..1862c481df 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -403,8 +403,8 @@ Upgrading a Recipe
 
 As software matures, upstream recipes are upgraded to newer versions. As
 a developer, you need to keep your local recipes up-to-date with the
-upstream version releases. Several methods exist by which you can
-upgrade recipes. You can read about them in the ":ref:`dev-manual/common-tasks:upgrading recipes`"
+upstream version releases. There are several ways of upgrading recipes.
+You can read about them in the ":ref:`dev-manual/common-tasks:upgrading recipes`"
 section of the Yocto Project Development Tasks Manual. This section
 overviews the ``devtool upgrade`` command.
 
@@ -516,8 +516,8 @@ you do, the package manager is bypassed.
    should never use it to update an image that will be used in
    production.
 
-Some conditions exist that could prevent a deployed application from
-behaving as expected. When both of the following conditions exist, your
+Some conditions could prevent a deployed application from
+behaving as expected. When both of the following conditions are met, your
 application has the potential to not behave correctly when run on the
 target:
 
@@ -528,7 +528,7 @@ target:
 -  The target does not physically have the packages on which the
    application depends installed.
 
-If both of these conditions exist, your application will not behave as
+If both of these conditions are met, your application will not behave as
 expected. The reason for this misbehavior is because the
 ``devtool deploy-target`` command does not deploy the packages (e.g.
 libraries) on which your new application depends. The assumption is that
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index e7bca829a3..f1b564a60e 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -312,7 +312,7 @@ HTTPS requests and direct them to the ``http://`` sources mirror. You
 can use ``file://`` URLs to point to local directories or network shares
 as well.
 
-Aside from the previous technique, these options also exist::
+Here are other options::
 
    BB_NO_NETWORK = "1"
 
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 843292b528..8308ffff5b 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -210,5 +210,5 @@ supports the following options:
 
 -  ``--configfile``: Specifies a user-defined configuration file for
    the bootloader. You can provide a full pathname for the file or a
-   file that exists in the ``canned-wks`` folder. This option overrides
+   file located in the ``canned-wks`` folder. This option overrides
    all other bootloader options.
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 9cc4c577c7..2e98713a27 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -97,7 +97,7 @@ Errors and Warnings
 
 -  ``<packagename1> rdepends on <packagename2>, but it isn't a build dependency? [build-deps]``
 
-   A runtime dependency exists between the two specified packages, but
+   There is a runtime dependency between the two specified packages, but
    there is nothing explicit within the recipe to enable the
    OpenEmbedded build system to ensure that dependency is satisfied.
    This condition is usually triggered by an
@@ -303,7 +303,7 @@ Errors and Warnings
 
 -  ``<packagename> rdepends on <debug_packagename> [debug-deps]``
 
-   A dependency exists between the specified non-dbg package (i.e. a
+   There is a dependency between the specified non-dbg package (i.e. a
    package whose name does not end in ``-dbg``) and a package that is a
    ``dbg`` package. The ``dbg`` packages contain debug symbols and are
    brought in using several different methods:
@@ -326,7 +326,7 @@ Errors and Warnings
 
 -  ``<packagename> rdepends on <dev_packagename> [dev-deps]``
 
-   A dependency exists between the specified non-dev package (a package
+   There is a dependency between the specified non-dev package (a package
    whose name does not end in ``-dev``) and a package that is a ``dev``
    package. The ``dev`` packages contain development headers and are
    usually brought in using several different methods:
@@ -753,6 +753,6 @@ how to work with the QA checks, see the
 
 .. note::
 
-   Please keep in mind that the QA checks exist in order to detect real
+   Please keep in mind that the QA checks are meant to detect real
    or potential problems in the packaged output. So exercise caution
    when disabling these checks.
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 93ab6ed08a..935a2e39bb 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -82,14 +82,14 @@ stable release.
    bug fixes and security fixes only. Policy dictates that features are
    not backported to a stable release. This policy means generic recipe
    version upgrades are unlikely to be accepted for backporting. The
-   exception to this policy occurs when a strong reason exists such as
+   exception to this policy occurs when there is a strong reason such as
    the fix happens to also be the preferred upstream approach.
 
 Stable release branches have strong maintenance for about a year after
 their initial release. Should significant issues be found for any
 release regardless of its age, fixes could be backported to older
 releases. For issues that are not backported given an older release,
-Community LTS trees and branches exist where community members share
+Community LTS trees and branches allow community members to share
 patches for older releases. However, these types of patches do not go
 through the same release process as do point releases. You can find more
 information about stable branch maintenance at
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 663f0d96d5..5ffd2b3991 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -10,7 +10,7 @@ Introduction
 ============
 
 The Yocto Project team is happy for people to experiment with the Yocto
-Project. A number of places exist to find help if you run into
+Project. There is a number of places where you can find help if you run into
 difficulties or find bugs. This presents information about contributing
 and participating in the Yocto Project.
 
@@ -43,8 +43,7 @@ the Yocto Project itself (e.g. when discovering an issue with some
 component of the build system that acts contrary to the documentation or
 your expectations).
 
-A general procedure and guidelines exist for when you use Bugzilla to
-submit a bug. For information on how to use Bugzilla to submit a bug
+For a general procedure and guidelines on how to use Bugzilla to submit a bug
 against the Yocto Project, see the following:
 
 -  The ":ref:`dev-manual/common-tasks:submitting a defect against the yocto project`"
@@ -59,7 +58,7 @@ For information on Bugzilla in general, see https://www.bugzilla.org/about/.
 Mailing lists
 =============
 
-A number of mailing lists maintained by the Yocto Project exist as well
+There are multiple mailing lists maintained by the Yocto Project as well
 as related OpenEmbedded mailing lists for discussion, patch submission
 and announcements. To subscribe to one of the following mailing lists,
 click on the appropriate URL in the following list and follow the
@@ -156,9 +155,8 @@ Here is a list of resources you might find helpful:
 
 -  :yocto_docs:`Yocto Project Mega-Manual </singleindex.html>`\ *:* This manual
    is simply a single HTML file comprised of the bulk of the Yocto
-   Project manuals. The Mega-Manual primarily exists as a vehicle by
-   which you can easily search for phrases and terms used in the Yocto
-   Project documentation set.
+   Project manuals. It makes it easy to search for phrases and terms used
+   in the Yocto Project documentation set.
 
 -  :doc:`/profile-manual/index` *:* This manual presents a set of
    common and generally useful tracing and profiling schemes along with
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 2106a8083b..36c9efc1e2 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -510,8 +510,8 @@ should be automatic, and recipes should not directly reference
 -----------------------
 
 Previous versions of the OpenEmbedded build system used to create a
-global shared sysroot per machine along with a native sysroot. Beginning
-with the 2.3 version of the Yocto Project, sysroots exist in
+global shared sysroot per machine along with a native sysroot. Since
+the 2.3 version of the Yocto Project, there are sysroots in
 recipe-specific :term:`WORKDIR` directories. Thus, the
 ``build/tmp/sysroots/`` directory is unused.
 
@@ -601,7 +601,7 @@ constructed using the architecture of the given build (e.g.
 name, and the version of the recipe (i.e.
 :term:`PE`\ ``:``\ :term:`PV`\ ``-``\ :term:`PR`).
 
-A number of key subdirectories exist within each recipe work directory:
+Here are key subdirectories within each recipe work directory:
 
 -  ``${WORKDIR}/temp``: Contains the log files of each task executed for
    this recipe, the "run" files for each executed task, which contain
@@ -624,7 +624,7 @@ A number of key subdirectories exist within each recipe work directory:
 
 -  ``${WORKDIR}/packages-split``: Contains the output of the
    ``do_package`` task after the output has been split into individual
-   packages. Subdirectories exist for each individual package created by
+   packages. There are subdirectories for each individual package created by
    the recipe.
 
 -  ``${WORKDIR}/recipe-sysroot``: A directory populated with the target
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index fc251945db..87d68df493 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -66,9 +66,8 @@ distributions:
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
       releases are one hundred percent compatible with each officially
-      supported Linux distribution, instances might exist where you
-      encounter a problem while using the Yocto Project on a specific
-      distribution.
+      supported Linux distribution, you may still encounter problems
+      that happen only with a specific distribution.
 
    -  Yocto Project releases are tested against the stable Linux
       distributions in the above list. The Yocto Project should work
@@ -119,8 +118,7 @@ supported Ubuntu or Debian Linux distribution:
    -  If your build system has the ``oss4-dev`` package installed, you
       might experience QEMU build failures due to the package installing
       its own custom ``/usr/include/linux/soundcard.h`` on the Debian
-      system. If you run into this situation, either of the following
-      solutions exist::
+      system. If you run into this situation, try either of these solutions::
 
          $ sudo apt-get build-dep qemu
          $ sudo apt-get remove oss4-dev
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 001edf6bb3..5bceb79b8d 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -823,6 +823,5 @@ sections from a size-sensitive configuration.
 After the kernel is unpacked but before it is patched, this task makes
 sure that the machine and metadata branches as specified by the
 :term:`SRCREV` variables actually exist on the specified
-branches. If these branches do not exist and
-:term:`AUTOREV` is not being used, the
+branches. Otherwise, if :term:`AUTOREV` is not being used, the
 ``do_validate_branches`` task fails during the build.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0b61f77cb4..a3401a4f1b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -49,10 +49,9 @@ system and gives an overview of their function and contents.
       alternatives system to create a different binary naming scheme so the
       commands can co-exist.
 
-      To use the variable, list out the package's commands that also exist
-      as part of another package. For example, if the ``busybox`` package
-      has four commands that also exist as part of another package, you
-      identify them as follows::
+      To use the variable, list out the package's commands that are also
+      provided by another package. For example, if the ``busybox`` package
+      has four such commands, you identify them as follows::
 
          ALTERNATIVE_busybox = "sh sed test bracket"
 
@@ -306,8 +305,8 @@ system and gives an overview of their function and contents.
       variable), the OpenEmbedded build system ignores your request and
       will install the packages to avoid dependency errors.
 
-      Support for this variable exists only when using the IPK and RPM
-      packaging backend. Support does not exist for DEB.
+      This variable is supported only when using the IPK and RPM
+      packaging backends. DEB is not supported.
 
       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`PACKAGE_EXCLUDE` variables for related
@@ -336,8 +335,8 @@ system and gives an overview of their function and contents.
       -  This host list is only used if ``BB_NO_NETWORK`` is either not set
          or set to "0".
 
-      -  Limited support for wildcard matching against the beginning of
-         host names exists. For example, the following setting matches
+      -  There is limited support for wildcard matching against the beginning of
+         host names. For example, the following setting matches
          ``git.gnu.org``, ``ftp.gnu.org``, and ``foo.git.gnu.org``.
          ::
 
@@ -558,7 +557,7 @@ system and gives an overview of their function and contents.
 
    :term:`BBCLASSEXTEND`
       Allows you to extend a recipe so that it builds variants of the
-      software. Common variants for recipes exist such as "natives" like
+      software. There are common variants for recipes as "natives" like
       ``quilt-native``, which is a copy of Quilt built to run on the build
       system; "crosses" such as ``gcc-cross``, which is a compiler built to
       run on the build machine but produces binaries that run on the target
@@ -1237,7 +1236,7 @@ system and gives an overview of their function and contents.
          CONFFILES_${PN} += "${sysconfdir}/file1 \
              ${sysconfdir}/file2 ${sysconfdir}/file3"
 
-      A relationship exists between the ``CONFFILES`` and ``FILES``
+      There is a relationship between the ``CONFFILES`` and ``FILES``
       variables. The files listed within ``CONFFILES`` must be a subset of
       the files listed within ``FILES``. Because the configuration files
       you provide with ``CONFFILES`` are simply being identified so that
@@ -1417,8 +1416,8 @@ system and gives an overview of their function and contents.
    :term:`COREBASE_FILES`
       Lists files from the :term:`COREBASE` directory that
       should be copied other than the layers listed in the
-      ``bblayers.conf`` file. The ``COREBASE_FILES`` variable exists for
-      the purpose of copying metadata from the OpenEmbedded build system
+      ``bblayers.conf`` file. The ``COREBASE_FILES`` variable allows
+      to copy metadata from the OpenEmbedded build system
       into the extensible SDK.
 
       Explicitly listing files in ``COREBASE`` is needed because it
@@ -2460,8 +2459,8 @@ system and gives an overview of their function and contents.
             ``FILESEXTRAPATHS`` variable.
 
       You can take advantage of this searching behavior in useful ways. For
-      example, consider a case where the following directory structure
-      exists for general and machine-specific configurations::
+      example, consider a case where there is the following directory structure
+      for general and machine-specific configurations::
 
          files/defconfig
          files/MACHINEA/defconfig
@@ -3013,8 +3012,8 @@ system and gives an overview of their function and contents.
 
       Image recipes set ``IMAGE_INSTALL`` to specify the packages to
       install into an image through ``image.bbclass``. Additionally,
-      "helper" classes such as the
-      :ref:`core-image <ref-classes-core-image>` class exist that can
+      there are "helper" classes such as the
+      :ref:`core-image <ref-classes-core-image>` class which can
       take lists used with ``IMAGE_FEATURES`` and turn them into
       auto-generated entries in ``IMAGE_INSTALL`` in addition to its
       default contents.
@@ -3465,8 +3464,8 @@ system and gives an overview of their function and contents.
          Use of the ``INHIBIT_SYSROOT_STRIP`` variable occurs in rare and
          special circumstances. For example, suppose you are building
          bare-metal firmware by using an external GCC toolchain. Furthermore,
-         even if the toolchain's binaries are strippable, other files exist
-         that are needed for the build that are not strippable.
+         even if the toolchain's binaries are strippable, there are other files
+         needed for the build that are not strippable.
 
    :term:`INITRAMFS_FSTYPES`
       Defines the format for the output image of an initial RAM filesystem
@@ -3817,7 +3816,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Legacy support exists for specifying the full path to the device
+         There is legacy support for specifying the full path to the device
          tree. However, providing just the ``.dtb`` file is preferred.
 
       In order to use this variable, the
@@ -4042,7 +4041,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNELDEPMODDEPEND`
       Specifies whether the data referenced through
-      :term:`PKGDATA_DIR` is needed or not. The
+      :term:`PKGDATA_DIR` is needed or not.
       ``KERNELDEPMODDEPEND`` does not control whether or not that data
       exists, but simply whether or not it is used. If you do not need to
       use the data, set the ``KERNELDEPMODDEPEND`` variable in your
@@ -4227,8 +4226,8 @@ system and gives an overview of their function and contents.
       -  Separate license names using \| (pipe) when there is a choice
          between licenses.
 
-      -  Separate license names using & (ampersand) when multiple licenses
-         exist that cover different parts of the source.
+      -  Separate license names using & (ampersand) when there are
+         multiple licenses for different parts of the source.
 
       -  You can use spaces between license names.
 
@@ -4376,8 +4375,8 @@ system and gives an overview of their function and contents.
 
       The variable corresponds to a machine configuration file of the same
       name, through which machine-specific configurations are set. Thus,
-      when ``MACHINE`` is set to "qemux86" there exists the corresponding
-      ``qemux86.conf`` machine configuration file, which can be found in
+      when ``MACHINE`` is set to "qemux86", the corresponding
+      ``qemux86.conf`` machine configuration file can be found in
       the :term:`Source Directory` in
       ``meta/conf/machine``.
 
@@ -4742,7 +4741,7 @@ system and gives an overview of their function and contents.
 
    :term:`NO_GENERIC_LICENSE`
       Avoids QA errors when you use a non-common, non-CLOSED license in a
-      recipe. Packages exist, such as the linux-firmware package, with many
+      recipe. There are packages, such as the linux-firmware package, with many
       licenses that are not in any way common. Also, new licenses are added
       occasionally to avoid introducing a lot of common license files,
       which are only applicable to a specific package.
@@ -4786,8 +4785,8 @@ system and gives an overview of their function and contents.
          functionality, such as kernel modules. It is up to you to add
          packages with the :term:`IMAGE_INSTALL` variable.
 
-      Support for this variable exists only when using the IPK and RPM
-      packaging backend. Support does not exist for DEB.
+      This variable is only supported when using the IPK and RPM
+      packaging backends. DEB is not supported.
 
       See the :term:`BAD_RECOMMENDATIONS` and
       the :term:`PACKAGE_EXCLUDE` variables for
@@ -5064,8 +5063,8 @@ system and gives an overview of their function and contents.
       an iterative development process to remove specific components from a
       system.
 
-      Support for this variable exists only when using the IPK and RPM
-      packaging backend. Support does not exist for DEB.
+      This variable is supported only when using the IPK and RPM
+      packaging backends. DEB is not supported.
 
       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`BAD_RECOMMENDATIONS` variables for
@@ -6211,7 +6210,7 @@ system and gives an overview of their function and contents.
       :term:`PACKAGE_EXCLUDE` variables.
 
       Packages specified in ``RRECOMMENDS`` need not actually be produced.
-      However, a recipe must exist that provides each package, either
+      However, there must be a recipe providing each package, either
       through the :term:`PACKAGES` or
       :term:`PACKAGES_DYNAMIC` variables or the
       :term:`RPROVIDES` variable, or an error will occur
@@ -6979,8 +6978,8 @@ system and gives an overview of their function and contents.
 
       -  ``az://`` - Fetches files from an Azure Storage account.
 
-      Standard and recipe-specific options for ``SRC_URI`` exist. Here are
-      standard options:
+      There are standard and recipe-specific options for ``SRC_URI``. Here are
+      standard ones:
 
       -  ``apply`` - Whether to apply the patch or not. The default
          action is to apply the patch.
@@ -7667,8 +7666,8 @@ system and gives an overview of their function and contents.
    :term:`TARGET_OS`
       Specifies the target's operating system. The variable can be set to
       "linux" for glibc-based systems (GNU C Library) and to "linux-musl"
-      for musl libc. For ARM/EABI targets, "linux-gnueabi" and
-      "linux-musleabi" possible values exist.
+      for musl libc. For ARM/EABI targets, the possible values are
+      "linux-gnueabi" and "linux-musleabi".
 
    :term:`TARGET_PREFIX`
       Specifies the prefix used for the toolchain binary target tools.
@@ -8369,11 +8368,10 @@ system and gives an overview of their function and contents.
       configure options are simply not passed to the configure script (e.g.
       should be removed from :term:`EXTRA_OECONF` or
       :term:`PACKAGECONFIG_CONFARGS`).
-      However, common options, for example, exist that are passed to all
-      configure scripts at a class level that might not be valid for some
-      configure scripts. It follows that no benefit exists in seeing a
-      warning about these options. For these cases, the options are added
-      to ``UNKNOWN_CONFIGURE_WHITELIST``.
+      However, there are common options that are passed to all
+      configure scripts at a class level, but might not be valid for some
+      configure scripts. Therefore warnings about these options are useless.
+      For these cases, the options are added to ``UNKNOWN_CONFIGURE_WHITELIST``.
 
       The configure arguments check that uses
       ``UNKNOWN_CONFIGURE_WHITELIST`` is part of the
-- 
2.25.1

