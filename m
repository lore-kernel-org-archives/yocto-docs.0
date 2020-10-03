Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.2953.1601713426447137296
 for <docs@lists.yoctoproject.org>;
 Sat, 03 Oct 2020 01:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.231, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay11.mail.gandi.net (Postfix) with ESMTPA id 6F23110000B;
	Sat,  3 Oct 2020 08:23:44 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 3/3] docs: ref-manual: ref-variables: add links to terms in glossary
Date: Sat,  3 Oct 2020 10:23:36 +0200
Message-Id: <20201003082336.55703-3-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201003082336.55703-1-foss@0leil.net>
References: <20201003082336.55703-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before the move to Sphinx, it used to be possible to get a direct link to a
variable from the term glossary. It is very useful when pointing people to
a specific variable when manually looking for it in the glossary.

Let's add this "feature" back.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-variables.rst | 1174 ++++++++++----------
 1 file changed, 587 insertions(+), 587 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 3a4a5551e..35baf9b81 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -18,7 +18,7 @@ system and gives an overview of their function and contents.
 
 .. glossary::
 
-   ABIEXTENSION
+   :term:`ABIEXTENSION`
       Extension to the Application Binary Interface (ABI) field of the GNU
       canonical architecture name (e.g. "eabi").
 
@@ -29,7 +29,7 @@ system and gives an overview of their function and contents.
 
          ABIEXTENSION = "eabi"
 
-   ALLOW_EMPTY
+   :term:`ALLOW_EMPTY`
       Specifies whether to produce an output package even if it is empty.
       By default, BitBake does not produce empty packages. This default
       behavior can cause issues when there is an
@@ -44,7 +44,7 @@ system and gives an overview of their function and contents.
          ALLOW_EMPTY_${PN}-dev = "1"
          ALLOW_EMPTY_${PN}-staticdev = "1"
 
-   ALTERNATIVE
+   :term:`ALTERNATIVE`
       Lists commands in a package that need an alternative binary naming
       scheme. Sometimes the same command is provided in multiple packages.
       When this occurs, the OpenEmbedded build system needs to use the
@@ -63,7 +63,7 @@ system and gives an overview of their function and contents.
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
       section.
 
-   ALTERNATIVE_LINK_NAME
+   :term:`ALTERNATIVE_LINK_NAME`
       Used by the alternatives system to map duplicated commands to actual
       locations. For example, if the ``bracket`` command provided by the
       ``busybox`` package is duplicated through another package, you must
@@ -84,7 +84,7 @@ system and gives an overview of their function and contents.
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
       section.
 
-   ALTERNATIVE_PRIORITY
+   :term:`ALTERNATIVE_PRIORITY`
       Used by the alternatives system to create default priorities for
       duplicated commands. You can use the variable to create a single
       default regardless of the command name or package, a default for
@@ -101,7 +101,7 @@ system and gives an overview of their function and contents.
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
       section.
 
-   ALTERNATIVE_TARGET
+   :term:`ALTERNATIVE_TARGET`
       Used by the alternatives system to create default link locations for
       duplicated commands. You can use the variable to create a single
       default location for all duplicated commands regardless of the
@@ -132,17 +132,17 @@ system and gives an overview of their function and contents.
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
       section.
 
-   APPEND
+   :term:`APPEND`
       An override list of append strings for each target specified with
       :term:`LABELS`.
 
       See the :ref:`grub-efi <ref-classes-grub-efi>` class for more
       information on how this variable is used.
 
-   AR
+   :term:`AR`
       The minimal command and arguments used to run ``ar``.
 
-   ARCHIVER_MODE
+   :term:`ARCHIVER_MODE`
       When used with the :ref:`archiver <ref-classes-archiver>` class,
       determines the type of information used to create a released archive.
       You can use this variable to create archives of patched source,
@@ -162,10 +162,10 @@ system and gives an overview of their function and contents.
       For information on how the variable works, see the
       ``meta/classes/archiver.bbclass`` file in the :term:`Source Directory`.
 
-   AS
+   :term:`AS`
       Minimal command and arguments needed to run the assembler.
 
-   ASSUME_PROVIDED
+   :term:`ASSUME_PROVIDED`
       Lists recipe names (:term:`PN` values) BitBake does not
       attempt to build. Instead, BitBake assumes these recipes have already
       been built.
@@ -175,7 +175,7 @@ system and gives an overview of their function and contents.
       when specified, allows for the Git binary from the host to be used
       rather than building ``git-native``.
 
-   ASSUME_SHLIBS
+   :term:`ASSUME_SHLIBS`
       Provides additional ``shlibs`` provider mapping information, which
       adds to or overwrites the information provided automatically by the
       system. Separate multiple entries using spaces.
@@ -192,11 +192,11 @@ system and gives an overview of their function and contents.
 
          ASSUME_SHLIBS = "libEGL.so.1:libegl-implementation"
 
-   AUTHOR
+   :term:`AUTHOR`
       The email address used to contact the original author or authors in
       order to send patches and forward bugs.
 
-   AUTO_LIBNAME_PKGS
+   :term:`AUTO_LIBNAME_PKGS`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
       which is the default behavior, ``AUTO_LIBNAME_PKGS`` specifies which
       packages should be checked for libraries and renamed according to
@@ -205,12 +205,12 @@ system and gives an overview of their function and contents.
       The default value is "${PACKAGES}", which causes the debian class to
       act on all packages that are explicitly generated by the recipe.
 
-   AUTO_SYSLINUXMENU
+   :term:`AUTO_SYSLINUXMENU`
       Enables creating an automatic menu for the syslinux bootloader. You
       must set this variable in your recipe. The
       :ref:`syslinux <ref-classes-syslinux>` class checks this variable.
 
-   AUTOREV
+   :term:`AUTOREV`
       When ``SRCREV`` is set to the value of this variable, it specifies to
       use the latest source revision in the repository. Here is an example:
       ::
@@ -230,7 +230,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
-   AVAILABLE_LICENSES
+   :term:`AVAILABLE_LICENSES`
       List of licenses found in the directories specified by
       :term:`COMMON_LICENSE_DIR` and
       :term:`LICENSE_PATH`.
@@ -247,7 +247,7 @@ system and gives an overview of their function and contents.
          license.bbclass
          ).
 
-   AVAILTUNES
+   :term:`AVAILTUNES`
       The list of defined CPU and Application Binary Interface (ABI)
       tunings (i.e. "tunes") available for use by the OpenEmbedded build
       system.
@@ -264,7 +264,7 @@ system and gives an overview of their function and contents.
       ":ref:`Basic Syntax <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:basic syntax>`" section in the BitBake
       User Manual for more information.
 
-   B
+   :term:`B`
       The directory within the :term:`Build Directory` in
       which the OpenEmbedded build system places generated objects during a
       recipe's build process. By default, this directory is the same as the
@@ -278,7 +278,7 @@ system and gives an overview of their function and contents.
       separating these directories. The build system defaults to using
       separate directories for ``gcc`` and some kernel recipes.
 
-   BAD_RECOMMENDATIONS
+   :term:`BAD_RECOMMENDATIONS`
       Lists "recommended-only" packages to not install. Recommended-only
       packages are packages installed only through the
       :term:`RRECOMMENDS` variable. You can prevent any
@@ -308,7 +308,7 @@ system and gives an overview of their function and contents.
       :term:`PACKAGE_EXCLUDE` variables for related
       information.
 
-   BASE_LIB
+   :term:`BASE_LIB`
       The library directory name for the CPU or Application Binary
       Interface (ABI) tune. The ``BASE_LIB`` applies only in the Multilib
       context. See the ":ref:`dev-manual/dev-manual-common-tasks:combining multiple versions of library files into one image`"
@@ -319,11 +319,11 @@ system and gives an overview of their function and contents.
       the :term:`Source Directory`. If Multilib is not
       being used, the value defaults to "lib".
 
-   BASE_WORKDIR
+   :term:`BASE_WORKDIR`
       Points to the base of the work directory for all recipes. The default
       value is "${TMPDIR}/work".
 
-   BB_ALLOWED_NETWORKS
+   :term:`BB_ALLOWED_NETWORKS`
       Specifies a space-delimited list of hosts that the fetcher is allowed
       to use to obtain the required source code. Following are
       considerations surrounding this variable:
@@ -362,7 +362,7 @@ system and gives an overview of their function and contents.
       host listed in ``SRC_URI`` after a successful fetch from the
       ``PREMIRRORS`` occurs.
 
-   BB_DANGLINGAPPENDS_WARNONLY
+   :term:`BB_DANGLINGAPPENDS_WARNONLY`
       Defines how BitBake handles situations where an append file
       (``.bbappend``) has no corresponding recipe file (``.bb``). This
       condition often occurs when layers get out of sync (e.g. ``oe-core``
@@ -381,7 +381,7 @@ system and gives an overview of their function and contents.
 
          BB_DANGLINGAPPENDS_WARNONLY = "1"
 
-   BB_DISKMON_DIRS
+   :term:`BB_DISKMON_DIRS`
       Monitors disk space and available inodes during the build and allows
       you to control the build based on these parameters.
 
@@ -453,7 +453,7 @@ system and gives an overview of their function and contents.
       free inodes in the ``${TMPDIR}`` directory drops below 100 Kbytes. No
       disk space monitoring for the directory itself occurs in this case.
 
-   BB_DISKMON_WARNINTERVAL
+   :term:`BB_DISKMON_WARNINTERVAL`
       Defines the disk space and free inode warning intervals. To set these
       intervals, define the variable in your ``conf/local.conf`` file in
       the :term:`Build Directory`.
@@ -503,7 +503,7 @@ system and gives an overview of their function and contents.
       a respective interval is reached beyond the initial warning (i.e. 1
       Gbytes and 100 Kbytes).
 
-   BB_GENERATE_MIRROR_TARBALLS
+   :term:`BB_GENERATE_MIRROR_TARBALLS`
       Causes tarballs of the source control repositories (e.g. Git
       repositories), including metadata, to be placed in the
       :term:`DL_DIR` directory.
@@ -522,7 +522,7 @@ system and gives an overview of their function and contents.
       clean up your ``DL_DIR`` directory by deleting any Git or other
       source control work directories.
 
-   BB_NUMBER_THREADS
+   :term:`BB_NUMBER_THREADS`
       The maximum number of tasks BitBake should run in parallel at any one
       time. The OpenEmbedded build system automatically configures this
       variable to be equal to the number of cores on the build system. For
@@ -540,7 +540,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
-   BB_SERVER_TIMEOUT
+   :term:`BB_SERVER_TIMEOUT`
       Specifies the time (in seconds) after which to unload the BitBake
       server due to inactivity. Set ``BB_SERVER_TIMEOUT`` to determine how
       long the BitBake server stays resident between invocations.
@@ -554,7 +554,7 @@ system and gives an overview of their function and contents.
       If you want the server to never be unloaded,
       set ``BB_SERVER_TIMEOUT`` to "-1".
 
-   BBCLASSEXTEND
+   :term:`BBCLASSEXTEND`
       Allows you to extend a recipe so that it builds variants of the
       software. Common variants for recipes exist such as "natives" like
       ``quilt-native``, which is a copy of Quilt built to run on the build
@@ -585,18 +585,18 @@ system and gives an overview of their function and contents.
          since ``include`` statements are processed when the recipe is
          parsed.
 
-   BBFILE_COLLECTIONS
+   :term:`BBFILE_COLLECTIONS`
       Lists the names of configured layers. These names are used to find
       the other ``BBFILE_*`` variables. Typically, each layer will append
       its name to this variable in its ``conf/layer.conf`` file.
 
-   BBFILE_PATTERN
+   :term:`BBFILE_PATTERN`
       Variable that expands to match files from
       :term:`BBFILES` in a particular layer. This variable
       is used in the ``conf/layer.conf`` file and must be suffixed with the
       name of the specific layer (e.g. ``BBFILE_PATTERN_emenlow``).
 
-   BBFILE_PRIORITY
+   :term:`BBFILE_PRIORITY`
       Assigns the priority for recipe files in each layer.
 
       This variable is useful in situations where the same recipe appears
@@ -623,7 +623,7 @@ system and gives an overview of their function and contents.
          bitbake-layers show-layers
          to list all configured layers along with their priorities.
 
-   BBFILES
+   :term:`BBFILES`
       A space-separated list of recipe files BitBake uses to build
       software.
 
@@ -632,7 +632,7 @@ system and gives an overview of their function and contents.
       For details on the syntax, see the documentation by following the
       previous link.
 
-   BBFILES_DYNAMIC
+   :term:`BBFILES_DYNAMIC`
       Activates content when identified layers are present. You identify
       the layers by the collections that the layers define.
 
@@ -659,16 +659,16 @@ system and gives an overview of their function and contents.
              /work/my-layer/bbappends/meta-security-isafw/*/*/*.bbappend
              /work/my-layer/bbappends/openembedded-core/meta/*/*/*.bbappend
 
-   BBINCLUDELOGS
+   :term:`BBINCLUDELOGS`
       Variable that controls how BitBake displays logs on build failure.
 
-   BBINCLUDELOGS_LINES
+   :term:`BBINCLUDELOGS_LINES`
       If :term:`BBINCLUDELOGS` is set, specifies the
       maximum number of lines from the task log file to print when
       reporting a failed task. If you do not set ``BBINCLUDELOGS_LINES``,
       the entire log is printed.
 
-   BBLAYERS
+   :term:`BBLAYERS`
       Lists the layers to enable during the build. This variable is defined
       in the ``bblayers.conf`` configuration file in the :term:`Build Directory`.
       Here is an example:
@@ -683,7 +683,7 @@ system and gives an overview of their function and contents.
       This example enables four layers, one of which is a custom,
       user-defined layer named ``meta-mykernel``.
 
-   BBMASK
+   :term:`BBMASK`
       Prevents BitBake from processing recipes and recipe append files.
 
       You can use the ``BBMASK`` variable to "hide" these ``.bb`` and
@@ -720,7 +720,7 @@ system and gives an overview of their function and contents.
          When specifying a directory name, use the trailing slash character
          to ensure you match just that directory name.
 
-   BBMULTICONFIG
+   :term:`BBMULTICONFIG`
       Specifies each additional separate configuration when you are
       building targets with multiple configurations. Use this variable in
       your ``conf/local.conf`` configuration file. Specify a
@@ -740,7 +740,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-building-images-for-multiple-targets-using-multiple-configurations`"
       section in the Yocto Project Development Tasks Manual.
 
-   BBPATH
+   :term:`BBPATH`
       Used by BitBake to locate ``.bbclass`` and configuration files. This
       variable is analogous to the ``PATH`` variable.
 
@@ -759,7 +759,7 @@ system and gives an overview of their function and contents.
                  $ bitbake target
 
 
-   BBSERVER
+   :term:`BBSERVER`
       If defined in the BitBake environment, ``BBSERVER`` points to the
       BitBake remote server.
 
@@ -774,7 +774,7 @@ system and gives an overview of their function and contents.
       Consequently, ``BBSERVER`` is excluded from checksum and dependency
       data.
 
-   BINCONFIG
+   :term:`BINCONFIG`
       When inheriting the
       :ref:`binconfig-disabled <ref-classes-binconfig-disabled>` class,
       this variable specifies binary configuration scripts to disable in
@@ -789,7 +789,7 @@ system and gives an overview of their function and contents.
 
          BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-   BINCONFIG_GLOB
+   :term:`BINCONFIG_GLOB`
       When inheriting the :ref:`binconfig <ref-classes-binconfig>` class,
       this variable specifies a wildcard for configuration scripts that
       need editing. The scripts are edited to correct any paths that have
@@ -816,7 +816,7 @@ system and gives an overview of their function and contents.
       information on the class in the
       ":ref:`binconfig.bbclass <ref-classes-binconfig>`" section.
 
-   BP
+   :term:`BP`
       The base recipe name and version but without any special recipe name
       suffix (i.e. ``-native``, ``lib64-``, and so forth). ``BP`` is
       comprised of the following:
@@ -824,7 +824,7 @@ system and gives an overview of their function and contents.
 
          ${BPN}-${PV}
 
-   BPN
+   :term:`BPN`
       This variable is a version of the :term:`PN` variable with
       common prefixes and suffixes removed, such as ``nativesdk-``,
       ``-cross``, ``-native``, and multilib's ``lib64-`` and ``lib32-``.
@@ -833,73 +833,73 @@ system and gives an overview of their function and contents.
       :term:`SPECIAL_PKGSUFFIX` variables,
       respectively.
 
-   BUGTRACKER
+   :term:`BUGTRACKER`
       Specifies a URL for an upstream bug tracking website for a recipe.
       The OpenEmbedded build system does not use this variable. Rather, the
       variable is a useful pointer in case a bug in the software being
       built needs to be manually reported.
 
-   BUILD_ARCH
+   :term:`BUILD_ARCH`
       Specifies the architecture of the build host (e.g. ``i686``). The
       OpenEmbedded build system sets the value of ``BUILD_ARCH`` from the
       machine name reported by the ``uname`` command.
 
-   BUILD_AS_ARCH
+   :term:`BUILD_AS_ARCH`
       Specifies the architecture-specific assembler flags for the build
       host. By default, the value of ``BUILD_AS_ARCH`` is empty.
 
-   BUILD_CC_ARCH
+   :term:`BUILD_CC_ARCH`
       Specifies the architecture-specific C compiler flags for the build
       host. By default, the value of ``BUILD_CC_ARCH`` is empty.
 
-   BUILD_CCLD
+   :term:`BUILD_CCLD`
       Specifies the linker command to be used for the build host when the C
       compiler is being used as the linker. By default, ``BUILD_CCLD``
       points to GCC and passes as arguments the value of
       :term:`BUILD_CC_ARCH`, assuming
       ``BUILD_CC_ARCH`` is set.
 
-   BUILD_CFLAGS
+   :term:`BUILD_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
       build host. When building in the ``-native`` context,
       :term:`CFLAGS` is set to the value of this variable by
       default.
 
-   BUILD_CPPFLAGS
+   :term:`BUILD_CPPFLAGS`
       Specifies the flags to pass to the C preprocessor (i.e. to both the C
       and the C++ compilers) when building for the build host. When
       building in the ``-native`` context, :term:`CPPFLAGS`
       is set to the value of this variable by default.
 
-   BUILD_CXXFLAGS
+   :term:`BUILD_CXXFLAGS`
       Specifies the flags to pass to the C++ compiler when building for the
       build host. When building in the ``-native`` context,
       :term:`CXXFLAGS` is set to the value of this variable
       by default.
 
-   BUILD_FC
+   :term:`BUILD_FC`
       Specifies the Fortran compiler command for the build host. By
       default, ``BUILD_FC`` points to Gfortran and passes as arguments the
       value of :term:`BUILD_CC_ARCH`, assuming
       ``BUILD_CC_ARCH`` is set.
 
-   BUILD_LD
+   :term:`BUILD_LD`
       Specifies the linker command for the build host. By default,
       ``BUILD_LD`` points to the GNU linker (ld) and passes as arguments
       the value of :term:`BUILD_LD_ARCH`, assuming
       ``BUILD_LD_ARCH`` is set.
 
-   BUILD_LD_ARCH
+   :term:`BUILD_LD_ARCH`
       Specifies architecture-specific linker flags for the build host. By
       default, the value of ``BUILD_LD_ARCH`` is empty.
 
-   BUILD_LDFLAGS
+   :term:`BUILD_LDFLAGS`
       Specifies the flags to pass to the linker when building for the build
       host. When building in the ``-native`` context,
       :term:`LDFLAGS` is set to the value of this variable
       by default.
 
-   BUILD_OPTIMIZATION
+   :term:`BUILD_OPTIMIZATION`
       Specifies the optimization flags passed to the C compiler when
       building for the build host or the SDK. The flags are passed through
       the :term:`BUILD_CFLAGS` and
@@ -908,25 +908,25 @@ system and gives an overview of their function and contents.
       The default value of the ``BUILD_OPTIMIZATION`` variable is "-O2
       -pipe".
 
-   BUILD_OS
+   :term:`BUILD_OS`
       Specifies the operating system in use on the build host (e.g.
       "linux"). The OpenEmbedded build system sets the value of
       ``BUILD_OS`` from the OS reported by the ``uname`` command - the
       first word, converted to lower-case characters.
 
-   BUILD_PREFIX
+   :term:`BUILD_PREFIX`
       The toolchain binary prefix used for native recipes. The OpenEmbedded
       build system uses the ``BUILD_PREFIX`` value to set the
       :term:`TARGET_PREFIX` when building for
       ``native`` recipes.
 
-   BUILD_STRIP
+   :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from
       binaries produced for the build host. By default, ``BUILD_STRIP``
       points to
       ``${``\ :term:`BUILD_PREFIX`\ ``}strip``.
 
-   BUILD_SYS
+   :term:`BUILD_SYS`
       Specifies the system, including the architecture and the operating
       system, to use when building for the build host (i.e. when building
       ``native`` recipes).
@@ -937,11 +937,11 @@ system and gives an overview of their function and contents.
       :term:`BUILD_OS`. You do not need to set the
       ``BUILD_SYS`` variable yourself.
 
-   BUILD_VENDOR
+   :term:`BUILD_VENDOR`
       Specifies the vendor name to use when building for the build host.
       The default value is an empty string ("").
 
-   BUILDDIR
+   :term:`BUILDDIR`
       Points to the location of the :term:`Build Directory`.
       You can define this directory indirectly through the
       ````` <#structure-core-script>`__ script by passing in a Build
@@ -949,7 +949,7 @@ system and gives an overview of their function and contents.
       not provide a Build Directory path, the ``BUILDDIR`` defaults to
       ``build`` in the current directory.
 
-   BUILDHISTORY_COMMIT
+   :term:`BUILDHISTORY_COMMIT`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies whether or not to commit the build
       history output in a local Git repository. If set to "1", this local
@@ -965,7 +965,7 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_COMMIT ?= "0"
 
-   BUILDHISTORY_COMMIT_AUTHOR
+   :term:`BUILDHISTORY_COMMIT_AUTHOR`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the author to use for each Git commit.
       In order for the ``BUILDHISTORY_COMMIT_AUTHOR`` variable to work, the
@@ -982,7 +982,7 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 
-   BUILDHISTORY_DIR
+   :term:`BUILDHISTORY_DIR`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the directory in which build history
       information is kept. For more information on how the variable works,
@@ -993,7 +993,7 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 
-   BUILDHISTORY_FEATURES
+   :term:`BUILDHISTORY_FEATURES`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the build history features to be
       enabled. For more information on how build history works, see the
@@ -1022,7 +1022,7 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_FEATURES ?= "image package sdk"
 
-   BUILDHISTORY_IMAGE_FILES
+   :term:`BUILDHISTORY_IMAGE_FILES`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies a list of paths to files copied from
       the image contents into the build history directory under an
@@ -1039,7 +1039,7 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 
-   BUILDHISTORY_PUSH_REPO
+   :term:`BUILDHISTORY_PUSH_REPO`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable optionally specifies a remote repository to
       which build history pushes Git changes. In order for
@@ -1057,38 +1057,38 @@ system and gives an overview of their function and contents.
 
          BUILDHISTORY_PUSH_REPO ?= ""
 
-   BUILDSDK_CFLAGS
+   :term:`BUILDSDK_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
       SDK. When building in the ``nativesdk-`` context,
       :term:`CFLAGS` is set to the value of this variable by
       default.
 
-   BUILDSDK_CPPFLAGS
+   :term:`BUILDSDK_CPPFLAGS`
       Specifies the flags to pass to the C pre-processor (i.e. to both the
       C and the C++ compilers) when building for the SDK. When building in
       the ``nativesdk-`` context, :term:`CPPFLAGS` is set
       to the value of this variable by default.
 
-   BUILDSDK_CXXFLAGS
+   :term:`BUILDSDK_CXXFLAGS`
       Specifies the flags to pass to the C++ compiler when building for the
       SDK. When building in the ``nativesdk-`` context,
       :term:`CXXFLAGS` is set to the value of this variable
       by default.
 
-   BUILDSDK_LDFLAGS
+   :term:`BUILDSDK_LDFLAGS`
       Specifies the flags to pass to the linker when building for the SDK.
       When building in the ``nativesdk-`` context,
       :term:`LDFLAGS` is set to the value of this variable
       by default.
 
-   BUILDSTATS_BASE
+   :term:`BUILDSTATS_BASE`
       Points to the location of the directory that holds build statistics
       when you use and enable the
       :ref:`buildstats <ref-classes-buildstats>` class. The
       ``BUILDSTATS_BASE`` directory defaults to
       ``${``\ :term:`TMPDIR`\ ``}/buildstats/``.
 
-   BUSYBOX_SPLIT_SUID
+   :term:`BUSYBOX_SPLIT_SUID`
       For the BusyBox recipe, specifies whether to split the output
       executable file into two parts: one for features that require
       ``setuid root``, and one for the remaining features (i.e. those that
@@ -1098,15 +1098,15 @@ system and gives an overview of their function and contents.
       splitting the output executable file. Set the variable to "0" to get
       a single output executable file.
 
-   CACHE
+   :term:`CACHE`
       Specifies the directory BitBake uses to store a cache of the
       :term:`Metadata` so it does not need to be parsed every time
       BitBake is started.
 
-   CC
+   :term:`CC`
       The minimal command and arguments used to run the C compiler.
 
-   CFLAGS
+   :term:`CFLAGS`
       Specifies the flags to pass to the C compiler. This variable is
       exported to an environment variable and thus made visible to the
       software being built during the compilation step.
@@ -1123,7 +1123,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILDSDK_CFLAGS` when building for
          an SDK (i.e. ``nativesdk-``)
 
-   CLASSOVERRIDE
+   :term:`CLASSOVERRIDE`
       An internal variable specifying the special class override that
       should currently apply (e.g. "class-target", "class-native", and so
       forth). The classes that use this variable (e.g.
@@ -1158,14 +1158,14 @@ system and gives an overview of their function and contents.
       that it is included in the default value of
       :term:`OVERRIDES`.
 
-   CLEANBROKEN
+   :term:`CLEANBROKEN`
       If set to "1" within a recipe, ``CLEANBROKEN`` specifies that the
       ``make clean`` command does not work for the software being built.
       Consequently, the OpenEmbedded build system will not try to run
       ``make clean`` during the :ref:`ref-tasks-configure`
       task, which is the default behavior.
 
-   COMBINED_FEATURES
+   :term:`COMBINED_FEATURES`
       Provides a list of hardware features that are enabled in both
       :term:`MACHINE_FEATURES` and
       :term:`DISTRO_FEATURES`. This select list of
@@ -1175,12 +1175,12 @@ system and gives an overview of their function and contents.
       optional at the distribution level, in case the hardware supports
       Bluetooth but you do not ever intend to use it.
 
-   COMMON_LICENSE_DIR
+   :term:`COMMON_LICENSE_DIR`
       Points to ``meta/files/common-licenses`` in the
       :term:`Source Directory`, which is where generic license
       files reside.
 
-   COMPATIBLE_HOST
+   :term:`COMPATIBLE_HOST`
       A regular expression that resolves to one or more hosts (when the
       recipe is native) or one or more targets (when the recipe is
       non-native) with which a recipe is compatible. The regular expression
@@ -1191,7 +1191,7 @@ system and gives an overview of their function and contents.
       parsing speed since the build system skips parsing recipes not
       compatible with the current system.
 
-   COMPATIBLE_MACHINE
+   :term:`COMPATIBLE_MACHINE`
       A regular expression that resolves to one or more target machines
       with which a recipe is compatible. The regular expression is matched
       against :term:`MACHINEOVERRIDES`. You can use
@@ -1201,7 +1201,7 @@ system and gives an overview of their function and contents.
       speed since the build system skips parsing recipes not compatible
       with the current machine.
 
-   COMPLEMENTARY_GLOB
+   :term:`COMPLEMENTARY_GLOB`
       Defines wildcards to match when installing a list of complementary
       packages for all the packages explicitly (or implicitly) installed in
       an image.
@@ -1230,7 +1230,7 @@ system and gives an overview of their function and contents.
 
          COMPLEMENTARY_GLOB[dev-pkgs] = '*-dev'
 
-   COMPONENTS_DIR
+   :term:`COMPONENTS_DIR`
       Stores sysroot components for each recipe. The OpenEmbedded build
       system uses ``COMPONENTS_DIR`` when constructing recipe-specific
       sysroots for other recipes.
@@ -1240,12 +1240,12 @@ system and gives an overview of their function and contents.
       (i.e.
       "``${``\ :term:`TMPDIR`\ ``}/sysroots-components``").
 
-   CONF_VERSION
+   :term:`CONF_VERSION`
       Tracks the version of the local configuration file (i.e.
       ``local.conf``). The value for ``CONF_VERSION`` increments each time
       ``build/conf/`` compatibility changes.
 
-   CONFFILES
+   :term:`CONFFILES`
       Identifies editable or configurable files that are part of a package.
       If the Package Management System (PMS) is being used to update
       packages on the target system, it is possible that configuration
@@ -1291,7 +1291,7 @@ system and gives an overview of their function and contents.
          Source Directory
          .
 
-   CONFIG_INITRAMFS_SOURCE
+   :term:`CONFIG_INITRAMFS_SOURCE`
       Identifies the initial RAM filesystem (initramfs) source files. The
       OpenEmbedded build system receives and uses this kernel Kconfig
       variable as an environment variable. By default, the variable is set
@@ -1312,15 +1312,15 @@ system and gives an overview of their function and contents.
       ":ref:`building-an-initramfs-image`" section
       in the Yocto Project Development Tasks Manual.
 
-   CONFIG_SITE
+   :term:`CONFIG_SITE`
       A list of files that contains ``autoconf`` test results relevant to
       the current build. This variable is used by the Autotools utilities
       when running ``configure``.
 
-   CONFIGURE_FLAGS
+   :term:`CONFIGURE_FLAGS`
       The minimal arguments for GNU configure.
 
-   CONFLICT_DISTRO_FEATURES
+   :term:`CONFLICT_DISTRO_FEATURES`
       When inheriting the
       :ref:`distro_features_check <ref-classes-distro_features_check>`
       class, this variable identifies distribution features that would be
@@ -1329,7 +1329,7 @@ system and gives an overview of their function and contents.
       appears in ``DISTRO_FEATURES`` within the current configuration, an
       error occurs and the build stops.
 
-   COPYLEFT_LICENSE_EXCLUDE
+   :term:`COPYLEFT_LICENSE_EXCLUDE`
       A space-separated list of licenses to exclude from the source
       archived by the :ref:`archiver <ref-classes-archiver>` class. In
       other words, if a license in a recipe's
@@ -1350,7 +1350,7 @@ system and gives an overview of their function and contents.
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
       is inherited by the ``archiver`` class.
 
-   COPYLEFT_LICENSE_INCLUDE
+   :term:`COPYLEFT_LICENSE_INCLUDE`
       A space-separated list of licenses to include in the source archived
       by the :ref:`archiver <ref-classes-archiver>` class. In other
       words, if a license in a recipe's :term:`LICENSE`
@@ -1362,7 +1362,7 @@ system and gives an overview of their function and contents.
       is inherited by the ``archiver`` class. The default value includes
       "GPL*", "LGPL*", and "AGPL*".
 
-   COPYLEFT_PN_EXCLUDE
+   :term:`COPYLEFT_PN_EXCLUDE`
       A list of recipes to exclude in the source archived by the
       :ref:`archiver <ref-classes-archiver>` class. The
       ``COPYLEFT_PN_EXCLUDE`` variable overrides the license inclusion and
@@ -1376,7 +1376,7 @@ system and gives an overview of their function and contents.
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
       is inherited by the ``archiver`` class.
 
-   COPYLEFT_PN_INCLUDE
+   :term:`COPYLEFT_PN_INCLUDE`
       A list of recipes to include in the source archived by the
       :ref:`archiver <ref-classes-archiver>` class. The
       ``COPYLEFT_PN_INCLUDE`` variable overrides the license inclusion and
@@ -1390,7 +1390,7 @@ system and gives an overview of their function and contents.
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
       is inherited by the ``archiver`` class.
 
-   COPYLEFT_RECIPE_TYPES
+   :term:`COPYLEFT_RECIPE_TYPES`
       A space-separated list of recipe types to include in the source
       archived by the :ref:`archiver <ref-classes-archiver>` class.
       Recipe types are ``target``, ``native``, ``nativesdk``, ``cross``,
@@ -1400,7 +1400,7 @@ system and gives an overview of their function and contents.
       is set by the :ref:`copyleft_filter <ref-classes-copyleft_filter>`
       class, which is inherited by the ``archiver`` class.
 
-   COPY_LIC_DIRS
+   :term:`COPY_LIC_DIRS`
       If set to "1" along with the
       :term:`COPY_LIC_MANIFEST` variable, the
       OpenEmbedded build system copies into the image the license files,
@@ -1421,7 +1421,7 @@ system and gives an overview of their function and contents.
          " section in the Yocto Project Development Tasks Manual for
          information on providing license text.
 
-   COPY_LIC_MANIFEST
+   :term:`COPY_LIC_MANIFEST`
       If set to "1", the OpenEmbedded build system copies the license
       manifest for the image to
       ``/usr/share/common-licenses/license.manifest`` within the image
@@ -1440,7 +1440,7 @@ system and gives an overview of their function and contents.
          " section in the Yocto Project Development Tasks Manual for
          information on providing license text.
 
-   CORE_IMAGE_EXTRA_INSTALL
+   :term:`CORE_IMAGE_EXTRA_INSTALL`
       Specifies the list of packages to be added to the image. You should
       only set this variable in the ``local.conf`` configuration file found
       in the :term:`Build Directory`.
@@ -1448,7 +1448,7 @@ system and gives an overview of their function and contents.
       This variable replaces ``POKY_EXTRA_INSTALL``, which is no longer
       supported.
 
-   COREBASE
+   :term:`COREBASE`
       Specifies the parent directory of the OpenEmbedded-Core Metadata
       layer (i.e. ``meta``).
 
@@ -1459,7 +1459,7 @@ system and gives an overview of their function and contents.
       points to the ``poky`` folder because it is the parent directory of
       the ``poky/meta`` layer.
 
-   COREBASE_FILES
+   :term:`COREBASE_FILES`
       Lists files from the :term:`COREBASE` directory that
       should be copied other than the layers listed in the
       ``bblayers.conf`` file. The ``COREBASE_FILES`` variable exists for
@@ -1472,10 +1472,10 @@ system and gives an overview of their function and contents.
       of ``COREBASE_FILES`` is used in order to only copy the files that
       are actually needed.
 
-   CPP
+   :term:`CPP`
       The minimal command and arguments used to run the C preprocessor.
 
-   CPPFLAGS
+   :term:`CPPFLAGS`
       Specifies the flags to pass to the C pre-processor (i.e. to both the
       C and the C++ compilers). This variable is exported to an environment
       variable and thus made visible to the software being built during the
@@ -1493,7 +1493,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILDSDK_CPPFLAGS` when building
          for an SDK (i.e. ``nativesdk-``)
 
-   CROSS_COMPILE
+   :term:`CROSS_COMPILE`
       The toolchain binary prefix for the target tools. The
       ``CROSS_COMPILE`` variable is the same as the
       :term:`TARGET_PREFIX` variable.
@@ -1505,14 +1505,14 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
-   CVSDIR
+   :term:`CVSDIR`
       The directory in which files checked out under the CVS system are
       stored.
 
-   CXX
+   :term:`CXX`
       The minimal command and arguments used to run the C++ compiler.
 
-   CXXFLAGS
+   :term:`CXXFLAGS`
       Specifies the flags to pass to the C++ compiler. This variable is
       exported to an environment variable and thus made visible to the
       software being built during the compilation step.
@@ -1529,7 +1529,7 @@ system and gives an overview of their function and contents.
       -  :term:`BUILDSDK_CXXFLAGS` when building
          for an SDK (i.e. ``nativesdk-``)
 
-   D
+   :term:`D`
       The destination directory. The location in the :term:`Build Directory`
       where components are installed by the
       :ref:`ref-tasks-install` task. This location defaults
@@ -1544,15 +1544,15 @@ system and gives an overview of their function and contents.
          fakeroot
          .
 
-   DATE
+   :term:`DATE`
       The date the build was started. Dates appear using the year, month,
       and day (YMD) format (e.g. "20150209" for February 9th, 2015).
 
-   DATETIME
+   :term:`DATETIME`
       The date and time on which the current build started. The format is
       suitable for timestamps.
 
-   DEBIAN_NOAUTONAME
+   :term:`DEBIAN_NOAUTONAME`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
       which is the default behavior, ``DEBIAN_NOAUTONAME`` specifies a
       particular package should not be renamed according to Debian library
@@ -1562,7 +1562,7 @@ system and gives an overview of their function and contents.
 
          DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
-   DEBIANNAME
+   :term:`DEBIANNAME`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
       which is the default behavior, ``DEBIANNAME`` allows you to override
       the library name for an individual package. Overriding the library
@@ -1573,16 +1573,16 @@ system and gives an overview of their function and contents.
 
          DEBIANNAME_${PN} = "dbus-1"
 
-   DEBUG_BUILD
+   :term:`DEBUG_BUILD`
       Specifies to build packages with debugging information. This
       influences the value of the ``SELECTED_OPTIMIZATION`` variable.
 
-   DEBUG_OPTIMIZATION
+   :term:`DEBUG_OPTIMIZATION`
       The options to pass in ``TARGET_CFLAGS`` and ``CFLAGS`` when
       compiling a system for debugging. This variable defaults to "-O
       -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe".
 
-   DEFAULT_PREFERENCE
+   :term:`DEFAULT_PREFERENCE`
       Specifies a weak bias for recipe selection priority.
 
       The most common usage of this is variable is to set it to "-1" within
@@ -1600,7 +1600,7 @@ system and gives an overview of their function and contents.
          if that variable is different between two layers that contain
          different versions of the same recipe.
 
-   DEFAULTTUNE
+   :term:`DEFAULTTUNE`
       The default CPU and Application Binary Interface (ABI) tunings (i.e.
       the "tune") used by the OpenEmbedded build system. The
       ``DEFAULTTUNE`` helps define
@@ -1611,7 +1611,7 @@ system and gives an overview of their function and contents.
       the setting using available tunes as defined with
       :term:`AVAILTUNES`.
 
-   DEPENDS
+   :term:`DEPENDS`
       Lists a recipe's build-time dependencies. These are dependencies on
       other recipes whose contents (e.g. headers and shared libraries) are
       needed by the recipe at build time.
@@ -1686,7 +1686,7 @@ system and gives an overview of their function and contents.
       BitBake User Manual for additional information on tasks and
       dependencies.
 
-   DEPLOY_DIR
+   :term:`DEPLOY_DIR`
       Points to the general area that the OpenEmbedded build system uses to
       place images, packages, SDKs, and other output files that are ready
       to be used outside of the build system. By default, this directory
@@ -1701,7 +1701,7 @@ system and gives an overview of their function and contents.
       ":ref:`sdk-dev-environment`" sections all in the
       Yocto Project Overview and Concepts Manual.
 
-   DEPLOY_DIR_DEB
+   :term:`DEPLOY_DIR_DEB`
       Points to the area that the OpenEmbedded build system uses to place
       Debian packages that are ready to be used outside of the build
       system. This variable applies only when
@@ -1723,7 +1723,7 @@ system and gives an overview of their function and contents.
       Feeds <package-feeds-dev-environment>`" section
       in the Yocto Project Overview and Concepts Manual.
 
-   DEPLOY_DIR_IMAGE
+   :term:`DEPLOY_DIR_IMAGE`
       Points to the area that the OpenEmbedded build system uses to place
       images and other associated output files that are ready to be
       deployed onto the target machine. The directory is machine-specific
@@ -1738,7 +1738,7 @@ system and gives an overview of their function and contents.
       ":ref:`sdk-dev-environment`" sections both in
       the Yocto Project Overview and Concepts Manual.
 
-   DEPLOY_DIR_IPK
+   :term:`DEPLOY_DIR_IPK`
       Points to the area that the OpenEmbedded build system uses to place
       IPK packages that are ready to be used outside of the build system.
       This variable applies only when
@@ -1759,7 +1759,7 @@ system and gives an overview of their function and contents.
       Feeds <package-feeds-dev-environment>`" section
       in the Yocto Project Overview and Concepts Manual.
 
-   DEPLOY_DIR_RPM
+   :term:`DEPLOY_DIR_RPM`
       Points to the area that the OpenEmbedded build system uses to place
       RPM packages that are ready to be used outside of the build system.
       This variable applies only when
@@ -1780,7 +1780,7 @@ system and gives an overview of their function and contents.
       Feeds <package-feeds-dev-environment>`" section
       in the Yocto Project Overview and Concepts Manual.
 
-   DEPLOY_DIR_TAR
+   :term:`DEPLOY_DIR_TAR`
       Points to the area that the OpenEmbedded build system uses to place
       tarballs that are ready to be used outside of the build system. This
       variable applies only when
@@ -1801,7 +1801,7 @@ system and gives an overview of their function and contents.
       Feeds <package-feeds-dev-environment>`" section
       in the Yocto Project Overview and Concepts Manual.
 
-   DEPLOYDIR
+   :term:`DEPLOYDIR`
       When inheriting the :ref:`deploy <ref-classes-deploy>` class, the
       ``DEPLOYDIR`` points to a temporary work area for deployed files that
       is set in the ``deploy`` class as follows:
@@ -1814,12 +1814,12 @@ system and gives an overview of their function and contents.
       them into :term:`DEPLOY_DIR_IMAGE`
       afterwards.
 
-   DESCRIPTION
+   :term:`DESCRIPTION`
       The package description used by package managers. If not set,
       ``DESCRIPTION`` takes the value of the :term:`SUMMARY`
       variable.
 
-   DISTRO
+   :term:`DISTRO`
       The short name of the distribution. For information on the long name
       of the distribution, see the :term:`DISTRO_NAME`
       variable.
@@ -1851,10 +1851,10 @@ system and gives an overview of their function and contents.
          meta/conf/distro/defaultsetup.conf
          also in the Source Directory.
 
-   DISTRO_CODENAME
+   :term:`DISTRO_CODENAME`
       Specifies a codename for the distribution being built.
 
-   DISTRO_EXTRA_RDEPENDS
+   :term:`DISTRO_EXTRA_RDEPENDS`
       Specifies a list of distro-specific packages to add to all images.
       This variable takes affect through ``packagegroup-base`` so the
       variable only really applies to the more full-featured images that
@@ -1862,13 +1862,13 @@ system and gives an overview of their function and contents.
       distro policy out of generic images. As with all other distro
       variables, you set this variable in the distro ``.conf`` file.
 
-   DISTRO_EXTRA_RRECOMMENDS
+   :term:`DISTRO_EXTRA_RRECOMMENDS`
       Specifies a list of distro-specific packages to add to all images if
       the packages exist. The packages might not exist or be empty (e.g.
       kernel modules). The list of packages are automatically installed but
       you can remove them.
 
-   DISTRO_FEATURES
+   :term:`DISTRO_FEATURES`
       The software support you want in your distribution for various
       features. You define your distribution features in the distribution
       configuration file.
@@ -1887,7 +1887,7 @@ system and gives an overview of their function and contents.
       provide with this variable, see the "`Distro
       Features <#ref-features-distro>`__" section.
 
-   DISTRO_FEATURES_BACKFILL
+   :term:`DISTRO_FEATURES_BACKFILL`
       Features to be added to ``DISTRO_FEATURES`` if not also present in
       ``DISTRO_FEATURES_BACKFILL_CONSIDERED``.
 
@@ -1898,13 +1898,13 @@ system and gives an overview of their function and contents.
       Backfilling <#ref-features-backfill>`__" section for more
       information.
 
-   DISTRO_FEATURES_BACKFILL_CONSIDERED
+   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
       Features from ``DISTRO_FEATURES_BACKFILL`` that should not be
       backfilled (i.e. added to ``DISTRO_FEATURES``) during the build. See
       the "`Feature Backfilling <#ref-features-backfill>`__" section for
       more information.
 
-   DISTRO_FEATURES_DEFAULT
+   :term:`DISTRO_FEATURES_DEFAULT`
       A convenience variable that gives you the default list of distro
       features with the exception of any features specific to the C library
       (``libc``).
@@ -1918,7 +1918,7 @@ system and gives an overview of their function and contents.
 
          DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} myfeature"
 
-   DISTRO_FEATURES_FILTER_NATIVE
+   :term:`DISTRO_FEATURES_FILTER_NATIVE`
       Specifies a list of features that if present in the target
       :term:`DISTRO_FEATURES` value should be
       included in ``DISTRO_FEATURES`` when building native recipes. This
@@ -1926,7 +1926,7 @@ system and gives an overview of their function and contents.
       :term:`DISTRO_FEATURES_NATIVE`
       variable.
 
-   DISTRO_FEATURES_FILTER_NATIVESDK
+   :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
       Specifies a list of features that if present in the target
       :term:`DISTRO_FEATURES` value should be
       included in ``DISTRO_FEATURES`` when building nativesdk recipes. This
@@ -1934,7 +1934,7 @@ system and gives an overview of their function and contents.
       :term:`DISTRO_FEATURES_NATIVESDK`
       variable.
 
-   DISTRO_FEATURES_NATIVE
+   :term:`DISTRO_FEATURES_NATIVE`
       Specifies a list of features that should be included in
       :term:`DISTRO_FEATURES` when building native
       recipes. This variable is used in addition to the features filtered
@@ -1942,7 +1942,7 @@ system and gives an overview of their function and contents.
       :term:`DISTRO_FEATURES_FILTER_NATIVE`
       variable.
 
-   DISTRO_FEATURES_NATIVESDK
+   :term:`DISTRO_FEATURES_NATIVESDK`
       Specifies a list of features that should be included in
       :term:`DISTRO_FEATURES` when building
       nativesdk recipes. This variable is used in addition to the features
@@ -1950,7 +1950,7 @@ system and gives an overview of their function and contents.
       :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
       variable.
 
-   DISTRO_NAME
+   :term:`DISTRO_NAME`
       The long name of the distribution. For information on the short name
       of the distribution, see the :term:`DISTRO` variable.
 
@@ -1980,10 +1980,10 @@ system and gives an overview of their function and contents.
          meta/conf/distro/defaultsetup.conf
          also in the Source Directory.
 
-   DISTRO_VERSION
+   :term:`DISTRO_VERSION`
       The version of the distribution.
 
-   DISTROOVERRIDES
+   :term:`DISTROOVERRIDES`
       A colon-separated list of overrides specific to the current
       distribution. By default, this list includes the value of
       :term:`DISTRO`.
@@ -1995,7 +1995,7 @@ system and gives an overview of their function and contents.
       is included in the default value of
       :term:`OVERRIDES`.
 
-   DL_DIR
+   :term:`DL_DIR`
       The central download directory used by the build process to store
       downloads. By default, ``DL_DIR`` gets files suitable for mirroring
       for everything except Git repositories. If you want tarballs of Git
@@ -2034,7 +2034,7 @@ system and gives an overview of their function and contents.
       ":yocto_wiki:`Working Behind a Network Proxy </wiki/Working_Behind_a_Network_Proxy>`"
       Wiki page.
 
-   DOC_COMPRESS
+   :term:`DOC_COMPRESS`
       When inheriting the :ref:`compress_doc <ref-classes-compress_doc>`
       class, this variable sets the compression policy used when the
       OpenEmbedded build system compresses man pages and info pages. By
@@ -2044,7 +2044,7 @@ system and gives an overview of their function and contents.
       For information on policies and on how to use this variable, see the
       comments in the ``meta/classes/compress_doc.bbclass`` file.
 
-   EFI_PROVIDER
+   :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
       ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the
       ``EFI_PROVIDER`` variable specifies the EFI bootloader to use. The
@@ -2054,12 +2054,12 @@ system and gives an overview of their function and contents.
       :ref:`image-live <ref-classes-image-live>` classes for more
       information.
 
-   ENABLE_BINARY_LOCALE_GENERATION
+   :term:`ENABLE_BINARY_LOCALE_GENERATION`
       Variable that controls which locales for ``glibc`` are generated
       during the build (useful if the target device has 64Mbytes of RAM or
       less).
 
-   ERR_REPORT_DIR
+   :term:`ERR_REPORT_DIR`
       When used with the :ref:`report-error <ref-classes-report-error>`
       class, specifies the path used for storing the debug files created by
       the :ref:`error reporting
@@ -2075,14 +2075,14 @@ system and gives an overview of their function and contents.
 
          ERR_REPORT_DIR = "path"
 
-   ERROR_QA
+   :term:`ERROR_QA`
       Specifies the quality assurance checks whose failures are reported as
       errors by the OpenEmbedded build system. You set this variable in
       your distribution configuration file. For a list of the checks you
       can control with this variable, see the
       ":ref:`insane.bbclass <ref-classes-insane>`" section.
 
-   EXCLUDE_FROM_SHLIBS
+   :term:`EXCLUDE_FROM_SHLIBS`
       Triggers the OpenEmbedded build system's shared libraries resolver to
       exclude an entire package when scanning for shared libraries.
 
@@ -2106,7 +2106,7 @@ system and gives an overview of their function and contents.
 
          EXCLUDE_FROM_SHLIBS = "1"
 
-   EXCLUDE_FROM_WORLD
+   :term:`EXCLUDE_FROM_WORLD`
       Directs BitBake to exclude a recipe from world builds (i.e.
       ``bitbake world``). During world builds, BitBake locates, parses and
       builds all recipes found in every layer exposed in the
@@ -2125,7 +2125,7 @@ system and gives an overview of their function and contents.
          only ensures that the recipe is not explicitly added to the list
          of build targets in a world build.
 
-   EXTENDPE
+   :term:`EXTENDPE`
       Used with file and pathnames to create a prefix for a recipe's
       version based on the recipe's :term:`PE` value. If ``PE``
       is set and greater than zero for a recipe, ``EXTENDPE`` becomes that
@@ -2135,7 +2135,7 @@ system and gives an overview of their function and contents.
 
       See the :term:`STAMP` variable for an example.
 
-   EXTENDPKGV
+   :term:`EXTENDPKGV`
       The full package version specification as it appears on the final
       packages produced by a recipe. The variable's value is normally used
       to fix a runtime dependency to the exact same version of another
@@ -2147,7 +2147,7 @@ system and gives an overview of their function and contents.
       The dependency relationships are intended to force the package
       manager to upgrade these types of packages in lock-step.
 
-   EXTERNAL_KERNEL_TOOLS
+   :term:`EXTERNAL_KERNEL_TOOLS`
       When set, the ``EXTERNAL_KERNEL_TOOLS`` variable indicates that these
       tools are not in the source tree.
 
@@ -2158,7 +2158,7 @@ system and gives an overview of their function and contents.
       :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
       ``meta/classes`` to see how the variable is used.
 
-   EXTERNALSRC
+   :term:`EXTERNALSRC`
       When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
       class, this variable points to the source tree, which is outside of
       the OpenEmbedded build system. When set, this variable sets the
@@ -2171,7 +2171,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
-   EXTERNALSRC_BUILD
+   :term:`EXTERNALSRC_BUILD`
       When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
       class, this variable points to the directory in which the recipe's
       source code is built, which is outside of the OpenEmbedded build
@@ -2185,7 +2185,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
 
-   EXTRA_AUTORECONF
+   :term:`EXTRA_AUTORECONF`
       For recipes inheriting the :ref:`autotools <ref-classes-autotools>`
       class, you can use ``EXTRA_AUTORECONF`` to specify extra options to
       pass to the ``autoreconf`` command that is executed during the
@@ -2193,7 +2193,7 @@ system and gives an overview of their function and contents.
 
       The default value is "--exclude=autopoint".
 
-   EXTRA_IMAGE_FEATURES
+   :term:`EXTRA_IMAGE_FEATURES`
       A list of additional features to include in an image. When listing
       more than one feature, separate them with a space.
 
@@ -2237,7 +2237,7 @@ system and gives an overview of their function and contents.
       variable, see the ":ref:`usingpoky-extend-customimage-imagefeatures`"
       section in the Yocto Project Development Tasks Manual.
 
-   EXTRA_IMAGECMD
+   :term:`EXTRA_IMAGECMD`
       Specifies additional options for the image creation command that has
       been specified in :term:`IMAGE_CMD`. When setting
       this variable, use an override for the associated image type. Here is
@@ -2246,7 +2246,7 @@ system and gives an overview of their function and contents.
 
          EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 
-   EXTRA_IMAGEDEPENDS
+   :term:`EXTRA_IMAGEDEPENDS`
       A list of recipes to build that do not provide packages for
       installing into the root filesystem.
 
@@ -2261,7 +2261,7 @@ system and gives an overview of their function and contents.
          \*RDEPENDS and \*RRECOMMENDS
          variables.
 
-   EXTRANATIVEPATH
+   :term:`EXTRANATIVEPATH`
       A list of subdirectories of
       ``${``\ :term:`STAGING_BINDIR_NATIVE`\ ``}``
       added to the beginning of the environment variable ``PATH``. As an
@@ -2272,16 +2272,16 @@ system and gives an overview of their function and contents.
 
          EXTRANATIVEPATH = "foo bar"
 
-   EXTRA_OECMAKE
+   :term:`EXTRA_OECMAKE`
       Additional `CMake <https://cmake.org/overview/>`__ options. See the
       :ref:`cmake <ref-classes-cmake>` class for additional information.
 
-   EXTRA_OECONF
+   :term:`EXTRA_OECONF`
       Additional ``configure`` script options. See
       :term:`PACKAGECONFIG_CONFARGS` for
       additional information on passing configure script options.
 
-   EXTRA_OEMAKE
+   :term:`EXTRA_OEMAKE`
       Additional GNU ``make`` options.
 
       Because the ``EXTRA_OEMAKE`` defaults to "", you need to set the
@@ -2291,12 +2291,12 @@ system and gives an overview of their function and contents.
       :term:`PARALLEL_MAKEINST` also make use of
       ``EXTRA_OEMAKE`` to pass the required flags.
 
-   EXTRA_OESCONS
+   :term:`EXTRA_OESCONS`
       When inheriting the :ref:`scons <ref-classes-scons>` class, this
       variable specifies additional configuration options you want to pass
       to the ``scons`` command line.
 
-   EXTRA_USERS_PARAMS
+   :term:`EXTRA_USERS_PARAMS`
       When inheriting the :ref:`extrausers <ref-classes-extrausers>`
       class, this variable provides image level user and group operations.
       This is a more global method of providing user and group
@@ -2318,7 +2318,7 @@ system and gives an overview of their function and contents.
          # usermod -s /bin/sh tester; \
          # "
 
-   FEATURE_PACKAGES
+   :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
       When setting the value, ``FEATURE_PACKAGES`` should have the name of
@@ -2340,7 +2340,7 @@ system and gives an overview of their function and contents.
          variable with package groups, which are discussed elsewhere in the
          documentation.
 
-   FEED_DEPLOYDIR_BASE_URI
+   :term:`FEED_DEPLOYDIR_BASE_URI`
       Points to the base URL of the server and location within the
       document-root that provides the metadata and packages required by
       OPKG to support runtime package management of IPK packages. You set
@@ -2358,7 +2358,7 @@ system and gives an overview of their function and contents.
       a set of configuration files for you in your target that work with
       the feed.
 
-   FILES
+   :term:`FILES`
       The list of files and directories that are placed in a package. The
       :term:`PACKAGES` variable lists the packages
       generated by a recipe.
@@ -2395,7 +2395,7 @@ system and gives an overview of their function and contents.
       the :term:`CONFFILES` variable for information on
       how to identify these files to the PMS.
 
-   FILES_SOLIBSDEV
+   :term:`FILES_SOLIBSDEV`
       Defines the file specification to match
       :term:`SOLIBSDEV`. In other words,
       ``FILES_SOLIBSDEV`` defines the full path name of the development
@@ -2407,7 +2407,7 @@ system and gives an overview of their function and contents.
 
          FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
 
-   FILESEXTRAPATHS
+   :term:`FILESEXTRAPATHS`
       Extends the search path the OpenEmbedded build system uses when
       looking for files and patches as it processes recipes and append
       files. The default directories BitBake uses when it processes recipes
@@ -2479,7 +2479,7 @@ system and gives an overview of their function and contents.
       files that reside in different layers but are used for the same
       recipe to correctly extend the path.
 
-   FILESOVERRIDES
+   :term:`FILESOVERRIDES`
       A subset of :term:`OVERRIDES` used by the
       OpenEmbedded build system for creating
       :term:`FILESPATH`. The ``FILESOVERRIDES`` variable
@@ -2503,7 +2503,7 @@ system and gives an overview of their function and contents.
          variable. The values match up with expected overrides and are used
          in an expected manner by the build system.
 
-   FILESPATH
+   :term:`FILESPATH`
       The default set of directories the OpenEmbedded build system uses
       when searching for patches and files.
 
@@ -2562,7 +2562,7 @@ system and gives an overview of their function and contents.
       the Yocto Project Development Tasks Manual. See the
       :ref:`ref-tasks-patch` task as well.
 
-   FILESYSTEM_PERMS_TABLES
+   :term:`FILESYSTEM_PERMS_TABLES`
       Allows you to define your own file permissions settings table as part
       of your configuration for the packaging process. For example, suppose
       you need a consistent set of custom permissions for a set of groups
@@ -2585,42 +2585,42 @@ system and gives an overview of their function and contents.
       For guidance on how to create your own file permissions settings
       table file, examine the existing ``fs-perms.txt``.
 
-   FIT_GENERATE_KEYS
+   :term:`FIT_GENERATE_KEYS`
       Decides whether to generate the keys for signing fitImage if they
       don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
       The default value is 0.
 
-   FIT_HASH_ALG
+   :term:`FIT_HASH_ALG`
       Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
 
-   FIT_KEY_GENRSA_ARGS
+   :term:`FIT_KEY_GENRSA_ARGS`
       Arguments to openssl genrsa for generating RSA private key for signing
       fitImage. The default value is "-F4". i.e. the public exponent 65537 to
       use.
 
-   FIT_KEY_REQ_ARGS
+   :term:`FIT_KEY_REQ_ARGS`
       Arguments to openssl req for generating certificate for signing fitImage.
       The default value is "-batch -new". batch for non interactive mode
       and new for generating new keys.
 
-   FIT_KEY_SIGN_PKCS
+   :term:`FIT_KEY_SIGN_PKCS`
       Format for public key ceritifcate used in signing fitImage.
       The default value is "x509".
 
-   FIT_SIGN_ALG
+   :term:`FIT_SIGN_ALG`
       Specifies the signature algorithm used in creating the FIT Image.
       For e.g. rsa2048.
 
-   FIT_SIGN_NUMBITS
+   :term:`FIT_SIGN_NUMBITS`
       Size of private key in number of bits used in fitImage. The default
       value is "2048".
 
-   FONT_EXTRA_RDEPENDS
+   :term:`FONT_EXTRA_RDEPENDS`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable specifies the runtime dependencies for font packages.
       By default, the ``FONT_EXTRA_RDEPENDS`` is set to "fontconfig-utils".
 
-   FONT_PACKAGES
+   :term:`FONT_PACKAGES`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable identifies packages containing font files that need to
       be cached by Fontconfig. By default, the ``fontcache`` class assumes
@@ -2628,18 +2628,18 @@ system and gives an overview of their function and contents.
       ``${``\ :term:`PN`\ ``}``). Use this variable if fonts you
       need are in a package other than that main package.
 
-   FORCE_RO_REMOVE
+   :term:`FORCE_RO_REMOVE`
       Forces the removal of the packages listed in ``ROOTFS_RO_UNNEEDED``
       during the generation of the root filesystem.
 
       Set the variable to "1" to force the removal of these packages.
 
-   FULL_OPTIMIZATION
+   :term:`FULL_OPTIMIZATION`
       The options to pass in ``TARGET_CFLAGS`` and ``CFLAGS`` when
       compiling an optimized system. This variable defaults to "-O2 -pipe
       ${DEBUG_FLAGS}".
 
-   GCCPIE
+   :term:`GCCPIE`
       Enables Position Independent Executables (PIE) within the GNU C
       Compiler (GCC). Enabling PIE in the GCC makes Return Oriented
       Programming (ROP) attacks much more difficult to execute.
@@ -2650,7 +2650,7 @@ system and gives an overview of their function and contents.
 
          GCCPIE ?= "--enable-default-pie"
 
-   GCCVERSION
+   :term:`GCCVERSION`
       Specifies the default version of the GNU C Compiler (GCC) used for
       compilation. By default, ``GCCVERSION`` is set to "8.x" in the
       ``meta/conf/distro/include/tcmode-default.inc`` include file:
@@ -2661,14 +2661,14 @@ system and gives an overview of their function and contents.
       You can override this value by setting it in a
       configuration file such as the ``local.conf``.
 
-   GDB
+   :term:`GDB`
       The minimal command and arguments to run the GNU Debugger.
 
-   GITDIR
+   :term:`GITDIR`
       The directory in which a local copy of a Git repository is stored
       when it is cloned.
 
-   GLIBC_GENERATE_LOCALES
+   :term:`GLIBC_GENERATE_LOCALES`
       Specifies the list of GLIBC locales to generate should you not wish
       to generate all LIBC locals, which can be time consuming.
 
@@ -2686,7 +2686,7 @@ system and gives an overview of their function and contents.
 
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 
-   GROUPADD_PARAM
+   :term:`GROUPADD_PARAM`
       When inheriting the :ref:`useradd <ref-classes-useradd>` class,
       this variable specifies for a package what parameters should be
       passed to the ``groupadd`` command if you wish to add a group to the
@@ -2700,7 +2700,7 @@ system and gives an overview of their function and contents.
       For information on the standard Linux shell command
       ``groupadd``, see http://linux.die.net/man/8/groupadd.
 
-   GROUPMEMS_PARAM
+   :term:`GROUPMEMS_PARAM`
       When inheriting the :ref:`useradd <ref-classes-useradd>` class,
       this variable specifies for a package what parameters should be
       passed to the ``groupmems`` command if you wish to modify the members
@@ -2709,7 +2709,7 @@ system and gives an overview of their function and contents.
       For information on the standard Linux shell command ``groupmems``,
       see http://linux.die.net/man/8/groupmems.
 
-   GRUB_GFXSERIAL
+   :term:`GRUB_GFXSERIAL`
       Configures the GNU GRand Unified Bootloader (GRUB) to have graphics
       and serial in the boot menu. Set this variable to "1" in your
       ``local.conf`` or distribution configuration file to enable graphics
@@ -2718,7 +2718,7 @@ system and gives an overview of their function and contents.
       See the :ref:`grub-efi <ref-classes-grub-efi>` class for more
       information on how this variable is used.
 
-   GRUB_OPTS
+   :term:`GRUB_OPTS`
       Additional options to add to the GNU GRand Unified Bootloader (GRUB)
       configuration. Use a semi-colon character (``;``) to separate
       multiple options.
@@ -2727,7 +2727,7 @@ system and gives an overview of their function and contents.
       :ref:`grub-efi <ref-classes-grub-efi>` class for more information
       on how this variable is used.
 
-   GRUB_TIMEOUT
+   :term:`GRUB_TIMEOUT`
       Specifies the timeout before executing the default ``LABEL`` in the
       GNU GRand Unified Bootloader (GRUB).
 
@@ -2735,18 +2735,18 @@ system and gives an overview of their function and contents.
       :ref:`grub-efi <ref-classes-grub-efi>` class for more information
       on how this variable is used.
 
-   GTKIMMODULES_PACKAGES
+   :term:`GTKIMMODULES_PACKAGES`
       When inheriting the
       :ref:`gtk-immodules-cache <ref-classes-gtk-immodules-cache>` class,
       this variable specifies the packages that contain the GTK+ input
       method modules being installed when the modules are in packages other
       than the main package.
 
-   HOMEPAGE
+   :term:`HOMEPAGE`
       Website where more information about the software the recipe is
       building can be found.
 
-   HOST_ARCH
+   :term:`HOST_ARCH`
       The name of the target architecture, which is normally the same as
       :term:`TARGET_ARCH`. The OpenEmbedded build system
       supports many architectures. Here is an example list of architectures
@@ -2761,7 +2761,7 @@ system and gives an overview of their function and contents.
       - mips
       - mipsel
 
-   HOST_CC_ARCH
+   :term:`HOST_CC_ARCH`
       Specifies architecture-specific compiler flags that are passed to the
       C compiler.
 
@@ -2777,18 +2777,18 @@ system and gives an overview of their function and contents.
       -  ``BUILDSDK_CC_ARCH`` when building for an SDK (i.e.
          ``nativesdk-``)
 
-   HOST_OS
+   :term:`HOST_OS`
       Specifies the name of the target operating system, which is normally
       the same as the :term:`TARGET_OS`. The variable can
       be set to "linux" for ``glibc``-based systems and to "linux-musl" for
       ``musl``. For ARM/EABI targets, there are also "linux-gnueabi" and
       "linux-musleabi" values possible.
 
-   HOST_PREFIX
+   :term:`HOST_PREFIX`
       Specifies the prefix for the cross-compile toolchain. ``HOST_PREFIX``
       is normally the same as :term:`TARGET_PREFIX`.
 
-   HOST_SYS
+   :term:`HOST_SYS`
       Specifies the system, including the architecture and the operating
       system, for which the build is occurring in the context of the
       current recipe.
@@ -2810,7 +2810,7 @@ system and gives an overview of their function and contents.
       -  Given a recipe being built for a little-endian MIPS target running
          Linux, the value might be "mipsel-linux".
 
-   HOSTTOOLS
+   :term:`HOSTTOOLS`
       A space-separated list (filter) of tools on the build host that
       should be allowed to be called from within build tasks. Using this
       filter helps reduce the possibility of host contamination. If a tool
@@ -2821,7 +2821,7 @@ system and gives an overview of their function and contents.
       For additional information, see
       :term:`HOSTTOOLS_NONFATAL`.
 
-   HOSTTOOLS_NONFATAL
+   :term:`HOSTTOOLS_NONFATAL`
       A space-separated list (filter) of tools on the build host that
       should be allowed to be called from within build tasks. Using this
       filter helps reduce the possibility of host contamination. Unlike
@@ -2830,11 +2830,11 @@ system and gives an overview of their function and contents.
       ``HOSTTOOLS_NONFATAL`` is not found on the build host. Thus, you can
       use ``HOSTTOOLS_NONFATAL`` to filter optional host tools.
 
-   HOST_VENDOR
+   :term:`HOST_VENDOR`
       Specifies the name of the vendor. ``HOST_VENDOR`` is normally the
       same as :term:`TARGET_VENDOR`.
 
-   ICECC_DISABLED
+   :term:`ICECC_DISABLED`
       Disables or enables the ``icecc`` (Icecream) function. For more
       information on this function and best practices for using this
       variable, see the ":ref:`icecc.bbclass <ref-classes-icecc>`"
@@ -2851,7 +2851,7 @@ system and gives an overview of their function and contents.
 
          ICECC_DISABLED = ""
 
-   ICECC_ENV_EXEC
+   :term:`ICECC_ENV_EXEC`
       Points to the ``icecc-create-env`` script that you provide. This
       variable is used by the :ref:`icecc <ref-classes-icecc>` class. You
       set this variable in your ``local.conf`` file.
@@ -2861,7 +2861,7 @@ system and gives an overview of their function and contents.
       ``icecc-create-env.bb`` recipe, which is a modified version and not
       the one that comes with ``icecc``.
 
-   ICECC_PARALLEL_MAKE
+   :term:`ICECC_PARALLEL_MAKE`
       Extra options passed to the ``make`` command during the
       :ref:`ref-tasks-compile` task that specify parallel
       compilation. This variable usually takes the form of "-j x", where x
@@ -2887,13 +2887,13 @@ system and gives an overview of their function and contents.
       use it (i.e. the system does not detect and assign the number of
       cores as is done with ``PARALLEL_MAKE``).
 
-   ICECC_PATH
+   :term:`ICECC_PATH`
       The location of the ``icecc`` binary. You can set this variable in
       your ``local.conf`` file. If your ``local.conf`` file does not define
       this variable, the :ref:`icecc <ref-classes-icecc>` class attempts
       to define it by locating ``icecc`` using ``which``.
 
-   ICECC_USER_CLASS_BL
+   :term:`ICECC_USER_CLASS_BL`
       Identifies user classes that you do not want the Icecream distributed
       compile support to consider. This variable is used by the
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
@@ -2903,7 +2903,7 @@ system and gives an overview of their function and contents.
       them from distributed compilation across remote hosts. Any classes
       you list will be distributed and compiled locally.
 
-   ICECC_USER_PACKAGE_BL
+   :term:`ICECC_USER_PACKAGE_BL`
       Identifies user recipes that you do not want the Icecream distributed
       compile support to consider. This variable is used by the
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
@@ -2913,7 +2913,7 @@ system and gives an overview of their function and contents.
       them from distributed compilation across remote hosts. Any packages
       you list will be distributed and compiled locally.
 
-   ICECC_USER_PACKAGE_WL
+   :term:`ICECC_USER_PACKAGE_WL`
       Identifies user recipes that use an empty
       :term:`PARALLEL_MAKE` variable that you want to
       force remote distributed compilation on using the Icecream
@@ -2921,11 +2921,11 @@ system and gives an overview of their function and contents.
       :ref:`icecc <ref-classes-icecc>` class. You set this variable in
       your ``local.conf`` file.
 
-   IMAGE_BASENAME
+   :term:`IMAGE_BASENAME`
       The base name of image output files. This variable defaults to the
       recipe name (``${``\ :term:`PN`\ ``}``).
 
-   IMAGE_EFI_BOOT_FILES
+   :term:`IMAGE_EFI_BOOT_FILES`
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
       ``bootimg-efi`` source plugin. By default,
@@ -2961,7 +2961,7 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`../ref-manual/ref-kickstart`" chapter.
 
-   IMAGE_BOOT_FILES
+   :term:`IMAGE_BOOT_FILES`
       A space-separated list of files installed into the boot partition
       when preparing an image using the Wic tool with the
       ``bootimg-partition`` source plugin. By default,
@@ -2997,7 +2997,7 @@ system and gives an overview of their function and contents.
       material for Wic is located in the
       ":doc:`../ref-manual/ref-kickstart`" chapter.
 
-   IMAGE_CLASSES
+   :term:`IMAGE_CLASSES`
       A list of classes that all images should inherit. You typically use
       this variable to specify the list of classes that register the
       different types of images the OpenEmbedded build system creates.
@@ -3009,7 +3009,7 @@ system and gives an overview of their function and contents.
       For more information, see ``meta/classes/image_types.bbclass`` in the
       :term:`Source Directory`.
 
-   IMAGE_CMD
+   :term:`IMAGE_CMD`
       Specifies the command to create the image file for a specific image
       type, which corresponds to the value set set in
       :term:`IMAGE_FSTYPES`, (e.g. ``ext3``,
@@ -3026,7 +3026,7 @@ system and gives an overview of their function and contents.
       variable, see the :ref:`image_types <ref-classes-image_types>`
       class file, which is ``meta/classes/image_types.bbclass``.
 
-   IMAGE_DEVICE_TABLES
+   :term:`IMAGE_DEVICE_TABLES`
       Specifies one or more files that contain custom device tables that
       are passed to the ``makedevs`` command as part of creating an image.
       These files list basic device nodes that should be created under
@@ -3036,7 +3036,7 @@ system and gives an overview of their function and contents.
       device table files, see ``meta/files/device_table-minimal.txt`` as an
       example.
 
-   IMAGE_FEATURES
+   :term:`IMAGE_FEATURES`
       The primary list of features to include in an image. Typically, you
       configure this variable in an image recipe. Although you can use this
       variable from your ``local.conf`` file, which is found in the
@@ -3056,7 +3056,7 @@ system and gives an overview of their function and contents.
       variable, see the ":ref:`usingpoky-extend-customimage-imagefeatures`"
       section in the Yocto Project Development Tasks Manual.
 
-   IMAGE_FSTYPES
+   :term:`IMAGE_FSTYPES`
       Specifies the formats the OpenEmbedded build system uses during the
       build when creating the root filesystem. For example, setting
       ``IMAGE_FSTYPES`` as follows causes the build system to create root
@@ -3079,7 +3079,7 @@ system and gives an overview of their function and contents.
             or ``_prepend``. You must use the ``+=`` operator to add one or
             more options to the ``IMAGE_FSTYPES`` variable.
 
-   IMAGE_INSTALL
+   :term:`IMAGE_INSTALL`
       Used by recipes to specify the packages to install into an image
       through the :ref:`image <ref-classes-image>` class. Use the
       ``IMAGE_INSTALL`` variable with care to avoid ordering issues.
@@ -3129,7 +3129,7 @@ system and gives an overview of their function and contents.
             specific situation. In both these cases, the behavior is
             contrary to how most users expect the ``+=`` operator to work.
 
-   IMAGE_LINGUAS
+   :term:`IMAGE_LINGUAS`
       Specifies the list of locales to install into the image during the
       root filesystem construction process. The OpenEmbedded build system
       automatically splits locale files, which are used for localization,
@@ -3151,7 +3151,7 @@ system and gives an overview of their function and contents.
       See the :term:`GLIBC_GENERATE_LOCALES`
       variable for information on generating GLIBC locales.
 
-   IMAGE_MANIFEST
+   :term:`IMAGE_MANIFEST`
       The manifest file for the image. This file lists all the installed
       packages that make up the image. The file contains package
       information on a line-per-package basis as follows:
@@ -3171,7 +3171,7 @@ system and gives an overview of their function and contents.
       information on how the image is created in the ":ref:`image-generation-dev-environment`"
       section in the Yocto Project Overview and Concepts Manual.
 
-   IMAGE_NAME
+   :term:`IMAGE_NAME`
       The name of the output image files minus the extension. This variable
       is derived using the :term:`IMAGE_BASENAME`,
       :term:`MACHINE`, and :term:`DATETIME`
@@ -3180,7 +3180,7 @@ system and gives an overview of their function and contents.
 
          IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 
-   IMAGE_OVERHEAD_FACTOR
+   :term:`IMAGE_OVERHEAD_FACTOR`
       Defines a multiplier that the build system applies to the initial
       image size for cases when the multiplier times the returned disk
       usage value for the image is greater than the sum of
@@ -3209,7 +3209,7 @@ system and gives an overview of their function and contents.
       added to the image by using the ``IMAGE_ROOTFS_EXTRA_SPACE``
       variable.
 
-   IMAGE_PKGTYPE
+   :term:`IMAGE_PKGTYPE`
       Defines the package type (i.e. DEB, RPM, IPK, or TAR) used by the
       OpenEmbedded build system. The variable is defined appropriately by
       the :ref:`package_deb <ref-classes-package_deb>`,
@@ -3242,7 +3242,7 @@ system and gives an overview of their function and contents.
          format are never used as a substitute packaging format for DEB,
          RPM, and IPK formatted files for your image or SDK.
 
-   IMAGE_POSTPROCESS_COMMAND
+   :term:`IMAGE_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the final image output files. You can specify
       functions separated by semicolons:
@@ -3256,7 +3256,7 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
-   IMAGE_PREPROCESS_COMMAND
+   :term:`IMAGE_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded build
       system creates the final image output files. You can specify
       functions separated by semicolons:
@@ -3270,19 +3270,19 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
-   IMAGE_ROOTFS
+   :term:`IMAGE_ROOTFS`
       The location of the root filesystem while it is under construction
       (i.e. during the :ref:`ref-tasks-rootfs` task). This
       variable is not configurable. Do not change it.
 
-   IMAGE_ROOTFS_ALIGNMENT
+   :term:`IMAGE_ROOTFS_ALIGNMENT`
       Specifies the alignment for the output image file in Kbytes. If the
       size of the image is not a multiple of this value, then the size is
       rounded up to the nearest multiple of the value. The default value is
       "1". See :term:`IMAGE_ROOTFS_SIZE` for
       additional information.
 
-   IMAGE_ROOTFS_EXTRA_SPACE
+   :term:`IMAGE_ROOTFS_EXTRA_SPACE`
       Defines additional free disk space created in the image in Kbytes. By
       default, this variable is set to "0". This free disk space is added
       to the image after the build system determines the image size as
@@ -3302,7 +3302,7 @@ system and gives an overview of their function and contents.
 
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
-   IMAGE_ROOTFS_SIZE
+   :term:`IMAGE_ROOTFS_SIZE`
       Defines the size in Kbytes for the generated image. The OpenEmbedded
       build system determines the final size for the generated image using
       an algorithm that takes into account the initial disk space used for
@@ -3327,7 +3327,7 @@ system and gives an overview of their function and contents.
       and :term:`IMAGE_ROOTFS_EXTRA_SPACE`
       variables for related information.
 
-   IMAGE_TYPEDEP
+   :term:`IMAGE_TYPEDEP`
       Specifies a dependency from one image type on another. Here is an
       example from the :ref:`image-live <ref-classes-image-live>` class:
       ::
@@ -3340,7 +3340,7 @@ system and gives an overview of their function and contents.
       one of the components of the live image is an ``ext3`` formatted
       partition containing the root filesystem.
 
-   IMAGE_TYPES
+   :term:`IMAGE_TYPES`
       Specifies the complete list of supported image types by default:
 
       - btrfs
@@ -3385,7 +3385,7 @@ system and gives an overview of their function and contents.
       For more information about these types of images, see
       ``meta/classes/image_types*.bbclass`` in the :term:`Source Directory`.
 
-   INC_PR
+   :term:`INC_PR`
       Helps define the recipe revision for recipes that share a common
       ``include`` file. You can think of this variable as part of the
       recipe revision as set from within an include file.
@@ -3423,7 +3423,7 @@ system and gives an overview of their function and contents.
       lines in the example are from individual recipes and show how the
       ``PR`` value is set.
 
-   INCOMPATIBLE_LICENSE
+   :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
       appear in :term:`LICENSE`) that should be excluded
       from the build. Recipes that provide no alternatives to listed
@@ -3465,7 +3465,7 @@ system and gives an overview of their function and contents.
          COMPATIBLE_LICENSES
          , thus only allowing the latter licences to be used.
 
-   INHERIT
+   :term:`INHERIT`
       Causes the named class or classes to be inherited globally. Anonymous
       functions in the class or classes are not executed for the base
       configuration and in each individual recipe. The OpenEmbedded build
@@ -3475,7 +3475,7 @@ system and gives an overview of their function and contents.
       :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` configuration directive`"
       section in the Bitbake User Manual.
 
-   INHERIT_DISTRO
+   :term:`INHERIT_DISTRO`
       Lists classes that will be inherited at the distribution level. It is
       unlikely that you want to edit this variable.
 
@@ -3485,7 +3485,7 @@ system and gives an overview of their function and contents.
 
          INHERIT_DISTRO ?= "debian devshell sstate license"
 
-   INHIBIT_DEFAULT_DEPS
+   :term:`INHIBIT_DEFAULT_DEPS`
       Prevents the default dependencies, namely the C compiler and standard
       C library (libc), from being added to :term:`DEPENDS`.
       This variable is usually used within recipes that do not require any
@@ -3494,7 +3494,7 @@ system and gives an overview of their function and contents.
       Set the variable to "1" to prevent the default dependencies from
       being added.
 
-   INHIBIT_PACKAGE_DEBUG_SPLIT
+   :term:`INHIBIT_PACKAGE_DEBUG_SPLIT`
       Prevents the OpenEmbedded build system from splitting out debug
       information during packaging. By default, the build system splits out
       debugging information during the
@@ -3510,7 +3510,7 @@ system and gives an overview of their function and contents.
 
          INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-   INHIBIT_PACKAGE_STRIP
+   :term:`INHIBIT_PACKAGE_STRIP`
       If set to "1", causes the build to not strip binaries in resulting
       packages and prevents the ``-dbg`` package from containing the source
       files.
@@ -3520,7 +3520,7 @@ system and gives an overview of their function and contents.
       Consequently, you should not set ``INHIBIT_PACKAGE_STRIP`` when you
       plan to debug in general.
 
-   INHIBIT_SYSROOT_STRIP
+   :term:`INHIBIT_SYSROOT_STRIP`
       If set to "1", causes the build to not strip binaries in the
       resulting sysroot.
 
@@ -3544,7 +3544,7 @@ system and gives an overview of their function and contents.
          strippable, other files exist that are needed for the build that
          are not strippable.
 
-   INITRAMFS_FSTYPES
+   :term:`INITRAMFS_FSTYPES`
       Defines the format for the output image of an initial RAM filesystem
       (initramfs), which is used during boot. Supported formats are the
       same as those supported by the
@@ -3557,7 +3557,7 @@ system and gives an overview of their function and contents.
       `initrd <https://en.wikipedia.org/wiki/Initrd>`__ mechanism, expects
       an optionally compressed cpio archive.
 
-   INITRAMFS_IMAGE
+   :term:`INITRAMFS_IMAGE`
       Specifies the :term:`PROVIDES` name of an image
       recipe that is used to build an initial RAM filesystem (initramfs)
       image. In other words, the ``INITRAMFS_IMAGE`` variable causes an
@@ -3598,7 +3598,7 @@ system and gives an overview of their function and contents.
       image, see the ":ref:`building-an-initramfs-image`" section
       in the Yocto Project Development Tasks Manual.
 
-   INITRAMFS_IMAGE_BUNDLE
+   :term:`INITRAMFS_IMAGE_BUNDLE`
       Controls whether or not the image recipe specified by
       :term:`INITRAMFS_IMAGE` is run through an
       extra pass
@@ -3648,7 +3648,7 @@ system and gives an overview of their function and contents.
       initramfs, see the ":ref:`building-an-initramfs-image`" section
       in the Yocto Project Development Tasks Manual.
 
-   INITRAMFS_LINK_NAME
+   :term:`INITRAMFS_LINK_NAME`
       The link name of the initial RAM filesystem image. This variable is
       set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
       follows:
@@ -3666,7 +3666,7 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
-   INITRAMFS_NAME
+   :term:`INITRAMFS_NAME`
       The base name of the initial RAM filesystem image. This variable is
       set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
       follows:
@@ -3680,14 +3680,14 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-   INITRD
+   :term:`INITRD`
       Indicates list of filesystem images to concatenate and use as an
       initial RAM disk (``initrd``).
 
       The ``INITRD`` variable is an optional variable used with the
       :ref:`image-live <ref-classes-image-live>` class.
 
-   INITRD_IMAGE
+   :term:`INITRD_IMAGE`
       When building a "live" bootable image (i.e. when
       :term:`IMAGE_FSTYPES` contains "live"),
       ``INITRD_IMAGE`` specifies the image recipe that should be built to
@@ -3697,14 +3697,14 @@ system and gives an overview of their function and contents.
       See the :ref:`image-live <ref-classes-image-live>` class for more
       information.
 
-   INITSCRIPT_NAME
+   :term:`INITSCRIPT_NAME`
       The filename of the initialization script as installed to
       ``${sysconfdir}/init.d``.
 
       This variable is used in recipes when using ``update-rc.d.bbclass``.
       The variable is mandatory.
 
-   INITSCRIPT_PACKAGES
+   :term:`INITSCRIPT_PACKAGES`
       A list of the packages that contain initscripts. If multiple packages
       are specified, you need to append the package name to the other
       ``INITSCRIPT_*`` as an override.
@@ -3713,7 +3713,7 @@ system and gives an overview of their function and contents.
       The variable is optional and defaults to the :term:`PN`
       variable.
 
-   INITSCRIPT_PARAMS
+   :term:`INITSCRIPT_PARAMS`
       Specifies the options to pass to ``update-rc.d``. Here is an example:
       ::
 
@@ -3730,7 +3730,7 @@ system and gives an overview of their function and contents.
       please see the ``update-rc.d`` manual page at
       https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
 
-   INSANE_SKIP
+   :term:`INSANE_SKIP`
       Specifies the QA checks to skip for a specific package within a
       recipe. For example, to skip the check for symbolic link ``.so``
       files in the main package of a recipe, add the following to the
@@ -3743,19 +3743,19 @@ system and gives an overview of their function and contents.
       See the ":ref:`insane.bbclass <ref-classes-insane>`" section for a
       list of the valid QA checks you can specify using this variable.
 
-   INSTALL_TIMEZONE_FILE
+   :term:`INSTALL_TIMEZONE_FILE`
       By default, the ``tzdata`` recipe packages an ``/etc/timezone`` file.
       Set the ``INSTALL_TIMEZONE_FILE`` variable to "0" at the
       configuration level to disable this behavior.
 
-   IPK_FEED_URIS
+   :term:`IPK_FEED_URIS`
       When the IPK backend is in use and package management is enabled on
       the target, you can use this variable to set up ``opkg`` in the
       target image to point to package feeds on a nominated server. Once
       the feed is established, you can perform installations or upgrades
       using the package manager at runtime.
 
-   KARCH
+   :term:`KARCH`
       Defines the kernel architecture used when assembling the
       configuration. Architectures supported for this release are:
 
@@ -3768,7 +3768,7 @@ system and gives an overview of their function and contents.
 
       You define the ``KARCH`` variable in the :ref:`kernel-dev/kernel-dev-advanced:bsp descriptions`.
 
-   KBRANCH
+   :term:`KBRANCH`
       A regular expression used by the build process to explicitly identify
       the kernel branch that is validated, patched, and configured during a
       build. You must set this variable to ensure the exact kernel branch
@@ -3803,7 +3803,7 @@ system and gives an overview of their function and contents.
       identify the kernel branch to use when building for each supported
       BSP.
 
-   KBUILD_DEFCONFIG
+   :term:`KBUILD_DEFCONFIG`
       When used with the :ref:`kernel-yocto <ref-classes-kernel-yocto>`
       class, specifies an "in-tree" kernel configuration file for use
       during a kernel build.
@@ -3839,12 +3839,12 @@ system and gives an overview of their function and contents.
       ":ref:`kernel-dev/kernel-dev-common:using an "in-tree" \`\`defconfig\`\` file`"
       section in the Yocto Project Linux Kernel Development Manual.
 
-   KERNEL_ALT_IMAGETYPE
+   :term:`KERNEL_ALT_IMAGETYPE`
       Specifies an alternate kernel image type for creation in addition to
       the kernel image type specified using the
       :term:`KERNEL_IMAGETYPE` variable.
 
-   KERNEL_ARTIFACT_NAME
+   :term:`KERNEL_ARTIFACT_NAME`
       Specifies the name of all of the build artifacts. You can change the
       name of the artifacts by changing the ``KERNEL_ARTIFACT_NAME``
       variable.
@@ -3863,7 +3863,7 @@ system and gives an overview of their function and contents.
 
          The IMAGE_VERSION_SUFFIX variable is set to DATETIME.
 
-   KERNEL_CLASSES
+   :term:`KERNEL_CLASSES`
       A list of classes defining kernel image types that the
       :ref:`kernel <ref-classes-kernel>` class should inherit. You
       typically append this variable to enable extended image types. An
@@ -3872,7 +3872,7 @@ system and gives an overview of their function and contents.
       custom kernel image types with the ``kernel`` class using this
       variable.
 
-   KERNEL_DEVICETREE
+   :term:`KERNEL_DEVICETREE`
       Specifies the name of the generated Linux kernel device tree (i.e.
       the ``.dtb``) file.
 
@@ -3885,7 +3885,7 @@ system and gives an overview of their function and contents.
       :ref:`kernel-devicetree <ref-classes-kernel-devicetree>` class must
       be inherited.
 
-   KERNEL_DTB_LINK_NAME
+   :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
       follows:
@@ -3903,7 +3903,7 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
-   KERNEL_DTB_NAME
+   :term:`KERNEL_DTB_NAME`
       The base name of the kernel device tree binary (DTB). This variable
       is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
       follows:
@@ -3917,11 +3917,11 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-   KERNEL_EXTRA_ARGS
+   :term:`KERNEL_EXTRA_ARGS`
       Specifies additional ``make`` command-line arguments the OpenEmbedded
       build system passes on when compiling the kernel.
 
-   KERNEL_FEATURES
+   :term:`KERNEL_FEATURES`
       Includes additional kernel metadata. In the OpenEmbedded build
       system, the default Board Support Packages (BSPs)
       :term:`Metadata` is provided through the
@@ -3948,7 +3948,7 @@ system and gives an overview of their function and contents.
          KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
          KERNEL_FEATURES_append_qemux86-64 = "cfg/sound.scc"
 
-   KERNEL_FIT_LINK_NAME
+   :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
       variable is set in the ``meta/classes/kernel-artifact-names.bbclass``
       file as follows:
@@ -3966,7 +3966,7 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
-   KERNEL_FIT_NAME
+   :term:`KERNEL_FIT_NAME`
       The base name of the kernel flattened image tree (FIT) image. This
       variable is set in the ``meta/classes/kernel-artifact-names.bbclass``
       file as follows:
@@ -3980,7 +3980,7 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-   KERNEL_IMAGE_LINK_NAME
+   :term:`KERNEL_IMAGE_LINK_NAME`
       The link name for the kernel image. This variable is set in the
       ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
       ::
@@ -3997,7 +3997,7 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
-   KERNEL_IMAGE_MAXSIZE
+   :term:`KERNEL_IMAGE_MAXSIZE`
       Specifies the maximum size of the kernel image file in kilobytes. If
       ``KERNEL_IMAGE_MAXSIZE`` is set, the size of the kernel image file is
       checked against the set value during the
@@ -4010,7 +4010,7 @@ system and gives an overview of their function and contents.
       By default, this variable is not set, which means the size of the
       kernel image is not checked.
 
-   KERNEL_IMAGE_NAME
+   :term:`KERNEL_IMAGE_NAME`
       The base name of the kernel image. This variable is set in the
       ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
       ::
@@ -4024,7 +4024,7 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-   KERNEL_IMAGETYPE
+   :term:`KERNEL_IMAGETYPE`
       The type of kernel to build for a device, usually set by the machine
       configuration files and defaults to "zImage". This variable is used
       when building the kernel and is passed to ``make`` as the target to
@@ -4033,7 +4033,7 @@ system and gives an overview of their function and contents.
       If you want to build an alternate kernel image type, use the
       :term:`KERNEL_ALT_IMAGETYPE` variable.
 
-   KERNEL_MODULE_AUTOLOAD
+   :term:`KERNEL_MODULE_AUTOLOAD`
       Lists kernel modules that need to be auto-loaded during boot.
 
       .. note::
@@ -4065,14 +4065,14 @@ system and gives an overview of their function and contents.
       For information on how to populate the ``modname.conf`` file with
       ``modprobe.d`` syntax lines, see the :term:`KERNEL_MODULE_PROBECONF` variable.
 
-   KERNEL_MODULE_PROBECONF
+   :term:`KERNEL_MODULE_PROBECONF`
       Provides a list of modules for which the OpenEmbedded build system
       expects to find ``module_conf_``\ modname values that specify
       configuration for each of the modules. For information on how to
       provide those module configurations, see the
       :term:`module_conf_* <module_conf>` variable.
 
-   KERNEL_PATH
+   :term:`KERNEL_PATH`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within
       the :ref:`module <ref-classes-module>` class. For information on
@@ -4086,7 +4086,7 @@ system and gives an overview of their function and contents.
       the ``KERNEL_PATH`` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
-   KERNEL_SRC
+   :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within
       the :ref:`module <ref-classes-module>` class. For information on
@@ -4100,14 +4100,14 @@ system and gives an overview of their function and contents.
       to the ``KERNEL_SRC`` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
-   KERNEL_VERSION
+   :term:`KERNEL_VERSION`
       Specifies the version of the kernel as extracted from ``version.h``
       or ``utsrelease.h`` within the kernel sources. Effects of setting
       this variable do not take affect until the kernel has been
       configured. Consequently, attempting to refer to this variable in
       contexts prior to configuration will not work.
 
-   KERNELDEPMODDEPEND
+   :term:`KERNELDEPMODDEPEND`
       Specifies whether the data referenced through
       :term:`PKGDATA_DIR` is needed or not. The
       ``KERNELDEPMODDEPEND`` does not control whether or not that data
@@ -4116,7 +4116,7 @@ system and gives an overview of their function and contents.
       ``initramfs`` recipe. Setting the variable there when the data is not
       needed avoids a potential dependency loop.
 
-   KFEATURE_DESCRIPTION
+   :term:`KFEATURE_DESCRIPTION`
       Provides a short description of a configuration fragment. You use
       this variable in the ``.scc`` file that describes a configuration
       fragment file. Here is the variable used in a file named ``smp.scc``
@@ -4125,7 +4125,7 @@ system and gives an overview of their function and contents.
 
           define KFEATURE_DESCRIPTION "Enable SMP"
 
-   KMACHINE
+   :term:`KMACHINE`
       The machine as known by the kernel. Sometimes the machine name used
       by the kernel does not match the machine name used by the
       OpenEmbedded build system. For example, the machine name that the
@@ -4153,7 +4153,7 @@ system and gives an overview of their function and contents.
       However, the OpenEmbedded build system understands the machine as
       "core2-32-intel-common".
 
-   KTYPE
+   :term:`KTYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"
       kernel types. See the ":ref:`kernel-dev/kernel-dev-advanced:kernel types`"
@@ -4167,13 +4167,13 @@ system and gives an overview of their function and contents.
       :term:`LINUX_KERNEL_TYPE` value used by the
       kernel recipe.
 
-   LABELS
+   :term:`LABELS`
       Provides a list of targets for automatic configuration.
 
       See the :ref:`grub-efi <ref-classes-grub-efi>` class for more
       information on how this variable is used.
 
-   LAYERDEPENDS
+   :term:`LAYERDEPENDS`
       Lists the layers, separated by spaces, on which this recipe depends.
       Optionally, you can specify a specific layer version for a dependency
       by adding it to the end of the layer name. Here is an example:
@@ -4190,13 +4190,13 @@ system and gives an overview of their function and contents.
       the ``conf/layer.conf`` file and must be suffixed with the name of
       the specific layer (e.g. ``LAYERDEPENDS_mylayer``).
 
-   LAYERDIR
+   :term:`LAYERDIR`
       When used inside the ``layer.conf`` configuration file, this variable
       provides the path of the current layer. This variable is not
       available outside of ``layer.conf`` and references are expanded
       immediately when parsing of the file completes.
 
-   LAYERRECOMMENDS
+   :term:`LAYERRECOMMENDS`
       Lists the layers, separated by spaces, recommended for use with this
       layer.
 
@@ -4214,7 +4214,7 @@ system and gives an overview of their function and contents.
       suffixed with the name of the specific layer (e.g.
       ``LAYERRECOMMENDS_mylayer``).
 
-   LAYERSERIES_COMPAT
+   :term:`LAYERSERIES_COMPAT`
       Lists the versions of the :term:`OpenEmbedded-Core (OE-Core)` for which
       a layer is compatible. Using the ``LAYERSERIES_COMPAT`` variable
       allows the layer maintainer to indicate which combinations of the
@@ -4243,7 +4243,7 @@ system and gives an overview of their function and contents.
       See the ":ref:`dev-manual/dev-manual-common-tasks:creating your own layer`"
       section in the Yocto Project Development Tasks Manual.
 
-   LAYERVERSION
+   :term:`LAYERVERSION`
       Optionally specifies the version of a layer as a single number. You
       can use this within :term:`LAYERDEPENDS` for
       another layer in order to depend on a specific version of the layer.
@@ -4251,10 +4251,10 @@ system and gives an overview of their function and contents.
       suffixed with the name of the specific layer (e.g.
       ``LAYERVERSION_mylayer``).
 
-   LD
+   :term:`LD`
       The minimal command and arguments used to run the linker.
 
-   LDFLAGS
+   :term:`LDFLAGS`
       Specifies the flags to pass to the linker. This variable is exported
       to an environment variable and thus made visible to the software
       being built during the compilation step.
@@ -4271,14 +4271,14 @@ system and gives an overview of their function and contents.
       -  :term:`BUILDSDK_LDFLAGS` when building for
          an SDK (i.e. ``nativesdk-``)
 
-   LEAD_SONAME
+   :term:`LEAD_SONAME`
       Specifies the lead (or primary) compiled library file (i.e. ``.so``)
       that the :ref:`debian <ref-classes-debian>` class applies its
       naming policy to given a recipe that packages multiple libraries.
 
       This variable works in conjunction with the ``debian`` class.
 
-   LIC_FILES_CHKSUM
+   :term:`LIC_FILES_CHKSUM`
       Checksums of the license text in the recipe source code.
 
       This variable tracks changes in license text of the source code
@@ -4292,7 +4292,7 @@ system and gives an overview of their function and contents.
       For more information, see the ":ref:`usingpoky-configuring-lic_files_chksum`"
       section in the Yocto Project Development Tasks Manual.
 
-   LICENSE
+   :term:`LICENSE`
       The list of source licenses for the recipe. Follow these rules:
 
       -  Do not use spaces within individual license names.
@@ -4335,7 +4335,7 @@ system and gives an overview of their function and contents.
          LICENSE_${PN} = "GPLv2"
          LICENSE_${PN}-doc = "GFDL-1.2"
 
-   LICENSE_CREATE_PACKAGE
+   :term:`LICENSE_CREATE_PACKAGE`
       Setting ``LICENSE_CREATE_PACKAGE`` to "1" causes the OpenEmbedded
       build system to create an extra package (i.e.
       ``${``\ :term:`PN`\ ``}-lic``) for each recipe and to add
@@ -4358,7 +4358,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:providing license text`"
       section in the Yocto Project Development Tasks Manual.
 
-   LICENSE_FLAGS
+   :term:`LICENSE_FLAGS`
       Specifies additional flags for a recipe you must whitelist through
       :term:`LICENSE_FLAGS_WHITELIST` in
       order to allow the recipe to be built. When providing multiple flags,
@@ -4371,7 +4371,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
-   LICENSE_FLAGS_WHITELIST
+   :term:`LICENSE_FLAGS_WHITELIST`
       Lists license flags that when specified in
       :term:`LICENSE_FLAGS` within a recipe should not
       prevent that recipe from being built. This practice is otherwise
@@ -4379,7 +4379,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:enabling commercially licensed recipes`"
       section in the Yocto Project Development Tasks Manual.
 
-   LICENSE_PATH
+   :term:`LICENSE_PATH`
       Path to additional licenses used during the build. By default, the
       OpenEmbedded build system uses ``COMMON_LICENSE_DIR`` to define the
       directory that holds common license text used during the build. The
@@ -4389,7 +4389,7 @@ system and gives an overview of their function and contents.
 
          LICENSE_PATH += "path-to-additional-common-licenses"
 
-   LINUX_KERNEL_TYPE
+   :term:`LINUX_KERNEL_TYPE`
       Defines the kernel type to be used in assembling the configuration.
       The linux-yocto recipes define "standard", "tiny", and "preempt-rt"
       kernel types. See the ":ref:`kernel-dev/kernel-dev-advanced:kernel types`"
@@ -4404,7 +4404,7 @@ system and gives an overview of their function and contents.
       kernel :term:`Metadata` with which to build out the sources
       and configuration.
 
-   LINUX_VERSION
+   :term:`LINUX_VERSION`
       The Linux version from ``kernel.org`` on which the Linux kernel image
       being built using the OpenEmbedded build system is based. You define
       this variable in the kernel recipe. For example, the
@@ -4420,7 +4420,7 @@ system and gives an overview of their function and contents.
 
          PV = "${LINUX_VERSION}+git${SRCPV}"
 
-   LINUX_VERSION_EXTENSION
+   :term:`LINUX_VERSION_EXTENSION`
       A string extension compiled into the version string of the Linux
       kernel built with the OpenEmbedded build system. You define this
       variable in the kernel recipe. For example, the linux-yocto kernel
@@ -4438,14 +4438,14 @@ system and gives an overview of their function and contents.
          $ uname -r
          3.7.0-rc8-custom
 
-   LOG_DIR
+   :term:`LOG_DIR`
       Specifies the directory to which the OpenEmbedded build system writes
       overall log files. The default directory is ``${TMPDIR}/log``.
 
       For the directory containing logs specific to each task, see the
       :term:`T` variable.
 
-   MACHINE
+   :term:`MACHINE`
       Specifies the target device for which the image is built. You define
       ``MACHINE`` in the ``local.conf`` file found in the
       :term:`Build Directory`. By default, ``MACHINE`` is set to
@@ -4488,13 +4488,13 @@ system and gives an overview of their function and contents.
          MACHINE
          .
 
-   MACHINE_ARCH
+   :term:`MACHINE_ARCH`
       Specifies the name of the machine-specific architecture. This
       variable is set automatically from :term:`MACHINE` or
       :term:`TUNE_PKGARCH`. You should not hand-edit
       the ``MACHINE_ARCH`` variable.
 
-   MACHINE_ESSENTIAL_EXTRA_RDEPENDS
+   :term:`MACHINE_ESSENTIAL_EXTRA_RDEPENDS`
       A list of required machine-specific packages to install as part of
       the image being built. The build process depends on these packages
       being present. Furthermore, because this is a "machine-essential"
@@ -4517,7 +4517,7 @@ system and gives an overview of their function and contents.
 
          MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "example-init"
 
-   MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS
+   :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS`
       A list of recommended machine-specific packages to install as part of
       the image being built. The build process does not depend on these
       packages being present. However, because this is a
@@ -4562,7 +4562,7 @@ system and gives an overview of their function and contents.
       Some examples of these machine essentials are flash, screen,
       keyboard, mouse, or touchscreen drivers (depending on the machine).
 
-   MACHINE_EXTRA_RDEPENDS
+   :term:`MACHINE_EXTRA_RDEPENDS`
       A list of machine-specific packages to install as part of the image
       being built that are not essential for the machine to boot. However,
       the build process for more fully-featured images depends on the
@@ -4589,7 +4589,7 @@ system and gives an overview of their function and contents.
 
          MACHINE_EXTRA_RDEPENDS += "wifidriver-firmware"
 
-   MACHINE_EXTRA_RRECOMMENDS
+   :term:`MACHINE_EXTRA_RRECOMMENDS`
       A list of machine-specific packages to install as part of the image
       being built that are not essential for booting the machine. The image
       being built has no build dependency on this list of packages.
@@ -4616,7 +4616,7 @@ system and gives an overview of their function and contents.
 
          MACHINE_EXTRA_RRECOMMENDS += "kernel-module-examplewifi"
 
-   MACHINE_FEATURES
+   :term:`MACHINE_FEATURES`
       Specifies the list of hardware features the
       :term:`MACHINE` is capable of supporting. For related
       information on enabling features, see the
@@ -4628,7 +4628,7 @@ system and gives an overview of their function and contents.
       shipped, see the "`Machine Features <#ref-features-machine>`__"
       section.
 
-   MACHINE_FEATURES_BACKFILL
+   :term:`MACHINE_FEATURES_BACKFILL`
       Features to be added to ``MACHINE_FEATURES`` if not also present in
       ``MACHINE_FEATURES_BACKFILL_CONSIDERED``.
 
@@ -4639,13 +4639,13 @@ system and gives an overview of their function and contents.
       Backfilling <#ref-features-backfill>`__" section for more
       information.
 
-   MACHINE_FEATURES_BACKFILL_CONSIDERED
+   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
       Features from ``MACHINE_FEATURES_BACKFILL`` that should not be
       backfilled (i.e. added to ``MACHINE_FEATURES``) during the build. See
       the "`Feature Backfilling <#ref-features-backfill>`__" section for
       more information.
 
-   MACHINEOVERRIDES
+   :term:`MACHINEOVERRIDES`
       A colon-separated list of overrides that apply to the current
       machine. By default, this list includes the value of
       :term:`MACHINE`.
@@ -4673,10 +4673,10 @@ system and gives an overview of their function and contents.
       ``MACHINEOVERRIDES`` is simply that it is included in the default
       value of :term:`OVERRIDES`.
 
-   MAINTAINER
+   :term:`MAINTAINER`
       The email address of the distribution maintainer.
 
-   MIRRORS
+   :term:`MIRRORS`
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
       first tries the local download directory. If that location fails, the
@@ -4688,7 +4688,7 @@ system and gives an overview of their function and contents.
       the default value for ``MIRRORS`` is defined in the
       ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
 
-   MLPREFIX
+   :term:`MLPREFIX`
       Specifies a prefix has been added to :term:`PN` to create a
       special version of a recipe or package (i.e. a Multilib version). The
       variable is used in places where the prefix needs to be added to or
@@ -4775,12 +4775,12 @@ system and gives an overview of their function and contents.
       For information on how to specify kernel modules to auto-load on
       boot, see the :term:`KERNEL_MODULE_AUTOLOAD` variable.
 
-   MODULE_TARBALL_DEPLOY
+   :term:`MODULE_TARBALL_DEPLOY`
       Controls creation of the ``modules-*.tgz`` file. Set this variable to
       "0" to disable creation of this file, which contains all of the
       kernel modules resulting from a kernel build.
 
-   MODULE_TARBALL_LINK_NAME
+   :term:`MODULE_TARBALL_LINK_NAME`
       The link name of the kernel module tarball. This variable is set in
       the ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
       ::
@@ -4796,7 +4796,7 @@ system and gives an overview of their function and contents.
 
       See the :term:`MACHINE` variable for additional information.
 
-   MODULE_TARBALL_NAME
+   :term:`MODULE_TARBALL_NAME`
       The base name of the kernel module tarball. This variable is set in
       the ``meta/classes/kernel-artifact-names.bbclass`` file as follows:
       ::
@@ -4809,7 +4809,7 @@ system and gives an overview of their function and contents.
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 
-   MULTIMACH_TARGET_SYS
+   :term:`MULTIMACH_TARGET_SYS`
       Uniquely identifies the type of the target system for which packages
       are being built. This variable allows output for different types of
       target systems to be put into different subdirectories of the same
@@ -4827,7 +4827,7 @@ system and gives an overview of their function and contents.
       See the :term:`STAMP` variable for an example. See the
       :term:`STAGING_DIR_TARGET` variable for more information.
 
-   NATIVELSBSTRING
+   :term:`NATIVELSBSTRING`
       A string identifying the host distribution. Strings consist of the
       host distributor ID followed by the release, as reported by the
       ``lsb_release`` tool or as read from ``/etc/lsb-release``. For
@@ -4842,10 +4842,10 @@ system and gives an overview of their function and contents.
       :term:`SANITY_TESTED_DISTROS` if that
       variable is set.
 
-   NM
+   :term:`NM`
       The minimal command and arguments to run ``nm``.
 
-   NO_GENERIC_LICENSE
+   :term:`NO_GENERIC_LICENSE`
       Avoids QA errors when you use a non-common, non-CLOSED license in a
       recipe. Packages exist, such as the linux-firmware package, with many
       licenses that are not in any way common. Also, new licenses are added
@@ -4867,7 +4867,7 @@ system and gives an overview of their function and contents.
 
          NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENSE.Abilis.txt"
 
-   NO_RECOMMENDATIONS
+   :term:`NO_RECOMMENDATIONS`
       Prevents installation of all "recommended-only" packages.
       Recommended-only packages are packages installed only through the
       :term:`RRECOMMENDS` variable). Setting the
@@ -4900,7 +4900,7 @@ system and gives an overview of their function and contents.
       the :term:`PACKAGE_EXCLUDE` variables for
       related information.
 
-   NOAUTOPACKAGEDEBUG
+   :term:`NOAUTOPACKAGEDEBUG`
       Disables auto package from splitting ``.debug`` files. If a recipe
       requires ``FILES_${PN}-dbg`` to be set manually, the
       ``NOAUTOPACKAGEDEBUG`` can be defined allowing you to define the
@@ -4912,13 +4912,13 @@ system and gives an overview of their function and contents.
          FILES_${PN}-dbg = "/usr/src/debug/"
          FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
 
-   OBJCOPY
+   :term:`OBJCOPY`
       The minimal command and arguments to run ``objcopy``.
 
-   OBJDUMP
+   :term:`OBJDUMP`
       The minimal command and arguments to run ``objdump``.
 
-   OE_BINCONFIG_EXTRA_MANGLE
+   :term:`OE_BINCONFIG_EXTRA_MANGLE`
       When inheriting the :ref:`binconfig <ref-classes-binconfig>` class,
       this variable specifies additional arguments passed to the "sed"
       command. The sed command alters any paths in configuration scripts
@@ -4933,7 +4933,7 @@ system and gives an overview of their function and contents.
       information on the ``binconfig`` class, see the
       ":ref:`binconfig.bbclass <ref-classes-binconfig>`" section.
 
-   OE_IMPORTS
+   :term:`OE_IMPORTS`
       An internal variable used to tell the OpenEmbedded build system what
       Python modules to import for every Python function run by the system.
 
@@ -4941,7 +4941,7 @@ system and gives an overview of their function and contents.
 
          Do not set this variable. It is for internal use only.
 
-   OE_INIT_ENV_SCRIPT
+   :term:`OE_INIT_ENV_SCRIPT`
       The name of the build environment setup script for the purposes of
       setting up the environment within the extensible SDK. The default
       value is "oe-init-build-env".
@@ -4949,7 +4949,7 @@ system and gives an overview of their function and contents.
       If you use a custom script to set up your build environment, set the
       ``OE_INIT_ENV_SCRIPT`` variable to its name.
 
-   OE_TERMINAL
+   :term:`OE_TERMINAL`
       Controls how the OpenEmbedded build system spawns interactive
       terminals on the host development system (e.g. using the BitBake
       command with the ``-c devshell`` command-line option). For more
@@ -4966,7 +4966,7 @@ system and gives an overview of their function and contents.
       - konsole
       - none
 
-   OEROOT
+   :term:`OEROOT`
       The directory from which the top-level build environment setup script
       is sourced. The Yocto Project provides a top-level build environment
       setup script: ````` <#structure-core-script>`__. When you run this
@@ -4976,7 +4976,7 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
-   OLDEST_KERNEL
+   :term:`OLDEST_KERNEL`
       Declares the oldest version of the Linux kernel that the produced
       binaries must support. This variable is passed into the build of the
       Embedded GNU C Library (``glibc``).
@@ -4986,7 +4986,7 @@ system and gives an overview of their function and contents.
       default by setting the variable in a custom distribution
       configuration file.
 
-   OVERRIDES
+   :term:`OVERRIDES`
       A colon-separated list of overrides that currently apply. Overrides
       are a BitBake mechanism that allows variables to be selectively
       overridden at the end of parsing. The set of overrides in
@@ -5029,13 +5029,13 @@ system and gives an overview of their function and contents.
          " section in the Yocto Project Development Tasks Manual for more
          information.
 
-   P
+   :term:`P`
       The recipe name and version. ``P`` is comprised of the following:
       ::
 
          ${PN}-${PV}
 
-   PACKAGE_ADD_METADATA
+   :term:`PACKAGE_ADD_METADATA`
       This variable defines additional metdata to add to packages.
 
       You may find you need to inject additional metadata into packages.
@@ -5051,7 +5051,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:adding custom metadata to packages`"
       section in the Yocto Project Development Tasks Manual.
 
-   PACKAGE_ARCH
+   :term:`PACKAGE_ARCH`
       The architecture of the resulting package or packages.
 
       By default, the value of this variable is set to
@@ -5074,19 +5074,19 @@ system and gives an overview of their function and contents.
 
          PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-   PACKAGE_ARCHS
+   :term:`PACKAGE_ARCHS`
       Specifies a list of architectures compatible with the target machine.
       This variable is set automatically and should not normally be
       hand-edited. Entries are separated using spaces and listed in order
       of priority. The default value for ``PACKAGE_ARCHS`` is "all any
       noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}".
 
-   PACKAGE_BEFORE_PN
+   :term:`PACKAGE_BEFORE_PN`
       Enables easily adding packages to ``PACKAGES`` before ``${PN}`` so
       that those added packages can pick up files that would normally be
       included in the default package.
 
-   PACKAGE_CLASSES
+   :term:`PACKAGE_CLASSES`
       This variable, which is set in the ``local.conf`` configuration file
       found in the ``conf`` folder of the
       :term:`Build Directory`, specifies the package manager the
@@ -5119,7 +5119,7 @@ system and gives an overview of their function and contents.
       result of the package manager in use, see the
       ":ref:`package.bbclass <ref-classes-package>`" section.
 
-   PACKAGE_DEBUG_SPLIT_STYLE
+   :term:`PACKAGE_DEBUG_SPLIT_STYLE`
       Determines how to split up the binary and debug information when
       creating ``*-dbg`` packages to be used with the GNU Project Debugger
       (GDB).
@@ -5152,7 +5152,7 @@ system and gives an overview of their function and contents.
       ":ref:`platdev-gdb-remotedebug`" section
       in the Yocto Project Development Tasks Manual.
 
-   PACKAGE_EXCLUDE_COMPLEMENTARY
+   :term:`PACKAGE_EXCLUDE_COMPLEMENTARY`
       Prevents specific packages from being installed when you are
       installing complementary packages.
 
@@ -5164,7 +5164,7 @@ system and gives an overview of their function and contents.
       use the ``PACKAGE_EXCLUDE_COMPLEMENTARY`` variable to specify regular
       expressions to match the packages you want to exclude.
 
-   PACKAGE_EXCLUDE
+   :term:`PACKAGE_EXCLUDE`
       Lists packages that should not be installed into an image. For
       example:
       ::
@@ -5193,12 +5193,12 @@ system and gives an overview of their function and contents.
       :term:`BAD_RECOMMENDATIONS` variables for
       related information.
 
-   PACKAGE_EXTRA_ARCHS
+   :term:`PACKAGE_EXTRA_ARCHS`
       Specifies the list of architectures compatible with the device CPU.
       This variable is useful when you build for several different devices
       that use miscellaneous processors such as XScale and ARM926-EJS.
 
-   PACKAGE_FEED_ARCHS
+   :term:`PACKAGE_FEED_ARCHS`
       Optionally specifies the package architectures used as part of the
       package feed URIs during the build. When used, the
       ``PACKAGE_FEED_ARCHS`` variable is appended to the final package feed
@@ -5239,7 +5239,7 @@ system and gives an overview of their function and contents.
          https://example.com/packagerepos/updates/rpm-dev/all
          https://example.com/packagerepos/updates/rpm-dev/core2-64
 
-   PACKAGE_FEED_BASE_PATHS
+   :term:`PACKAGE_FEED_BASE_PATHS`
       Specifies the base path used when constructing package feed URIs. The
       ``PACKAGE_FEED_BASE_PATHS`` variable makes up the middle portion of a
       package feed URI used by the OpenEmbedded build system. The base path
@@ -5268,7 +5268,7 @@ system and gives an overview of their function and contents.
          https://example.com/packagerepos/updates/rpm-dev/all
          https://example.com/packagerepos/updates/rpm-dev/core2-64
 
-   PACKAGE_FEED_URIS
+   :term:`PACKAGE_FEED_URIS`
       Specifies the front portion of the package feed URI used by the
       OpenEmbedded build system. Each final package feed URI is comprised
       of ``PACKAGE_FEED_URIS``,
@@ -5297,7 +5297,7 @@ system and gives an overview of their function and contents.
          https://example.com/packagerepos/updates/rpm-dev/all
          https://example.com/packagerepos/updates/rpm-dev/core2-64
 
-   PACKAGE_INSTALL
+   :term:`PACKAGE_INSTALL`
       The final list of packages passed to the package manager for
       installation into the image.
 
@@ -5315,18 +5315,18 @@ system and gives an overview of their function and contents.
       initramfs, see the ":ref:`building-an-initramfs-image`" section
       in the Yocto Project Development Tasks Manual.
 
-   PACKAGE_INSTALL_ATTEMPTONLY
+   :term:`PACKAGE_INSTALL_ATTEMPTONLY`
       Specifies a list of packages the OpenEmbedded build system attempts
       to install when creating an image. If a listed package fails to
       install, the build system does not generate an error. This variable
       is generally not user-defined.
 
-   PACKAGE_PREPROCESS_FUNCS
+   :term:`PACKAGE_PREPROCESS_FUNCS`
       Specifies a list of functions run to pre-process the
       :term:`PKGD` directory prior to splitting the files out
       to individual packages.
 
-   PACKAGE_WRITE_DEPS
+   :term:`PACKAGE_WRITE_DEPS`
       Specifies a list of dependencies for post-installation and
       pre-installation scripts on native/cross tools. If your
       post-installation or pre-installation script can execute at rootfs
@@ -5338,7 +5338,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:post-installation scripts`"
       section in the Yocto Project Development Tasks Manual.
 
-   PACKAGECONFIG
+   :term:`PACKAGECONFIG`
       This variable provides a means of enabling or disabling features of a
       recipe on a per-recipe basis. ``PACKAGECONFIG`` blocks are defined in
       recipes when you specify features and then arguments that define
@@ -5430,7 +5430,7 @@ system and gives an overview of their function and contents.
 
             PACKAGECONFIG_append_pn-recipename = " f4"
 
-   PACKAGECONFIG_CONFARGS
+   :term:`PACKAGECONFIG_CONFARGS`
       A space-separated list of configuration options generated from the
       :term:`PACKAGECONFIG` setting.
 
@@ -5441,7 +5441,7 @@ system and gives an overview of their function and contents.
       handles the ``do_configure`` task, then you need to use
       ``PACKAGECONFIG_CONFARGS`` appropriately.
 
-   PACKAGEGROUP_DISABLE_COMPLEMENTARY
+   :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY`
       For recipes inheriting the
       :ref:`packagegroup <ref-classes-packagegroup>` class, setting
       ``PACKAGEGROUP_DISABLE_COMPLEMENTARY`` to "1" specifies that the
@@ -5449,7 +5449,7 @@ system and gives an overview of their function and contents.
       should not be automatically created by the ``packagegroup`` recipe,
       which is the default behavior.
 
-   PACKAGES
+   :term:`PACKAGES`
       The list of packages the recipe creates. The default value is the
       following:
       ::
@@ -5469,7 +5469,7 @@ system and gives an overview of their function and contents.
       unless generation is forced through the
       :term:`ALLOW_EMPTY` variable.
 
-   PACKAGES_DYNAMIC
+   :term:`PACKAGES_DYNAMIC`
       A promise that your recipe satisfies runtime dependencies for
       optional modules that are found in other recipes.
       ``PACKAGES_DYNAMIC`` does not actually satisfy the dependencies, it
@@ -5492,7 +5492,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:handling optional module packaging`"
       section in the Yocto Project Development Tasks Manual.
 
-   PACKAGESPLITFUNCS
+   :term:`PACKAGESPLITFUNCS`
       Specifies a list of functions run to perform additional splitting of
       files into individual packages. Recipes can either prepend to this
       variable or prepend to the ``populate_packages`` function in order to
@@ -5502,7 +5502,7 @@ system and gives an overview of their function and contents.
       other packaging variables appropriately in order to perform the
       desired splitting.
 
-   PARALLEL_MAKE
+   :term:`PARALLEL_MAKE`
       Extra options passed to the ``make`` command during the
       :ref:`ref-tasks-compile` task in order to specify
       parallel compilation on the local build host. This variable is
@@ -5548,7 +5548,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:speeding up a build`"
       section in the Yocto Project Development Tasks Manual.
 
-   PARALLEL_MAKEINST
+   :term:`PARALLEL_MAKEINST`
       Extra options passed to the ``make install`` command during the
       :ref:`ref-tasks-install` task in order to specify
       parallel installation. This variable defaults to the value of
@@ -5568,7 +5568,7 @@ system and gives an overview of their function and contents.
          ":ref:`dev-manual/dev-manual-common-tasks:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
 
-   PATCHRESOLVE
+   :term:`PATCHRESOLVE`
       Determines the action to take when a patch fails. You can set this
       variable to one of two values: "noop" and "user".
 
@@ -5580,7 +5580,7 @@ system and gives an overview of their function and contents.
 
       Set this variable in your ``local.conf`` file.
 
-   PATCHTOOL
+   :term:`PATCHTOOL`
       Specifies the utility used to apply patches for a recipe during the
       :ref:`ref-tasks-patch` task. You can specify one of
       three utilities: "patch", "quilt", or "git". The default utility used
@@ -5596,20 +5596,20 @@ system and gives an overview of their function and contents.
          PATCHTOOL = "quilt"
          PATCHTOOL = "git"
 
-   PE
+   :term:`PE`
       The epoch of the recipe. By default, this variable is unset. The
       variable is used to make upgrades possible when the versioning scheme
       changes in some backwards incompatible way.
 
       ``PE`` is the default value of the :term:`PKGE` variable.
 
-   PF
+   :term:`PF`
       Specifies the recipe or package name and includes all version and
       revision numbers (i.e. ``glibc-2.13-r20+svnr15508/`` and
       ``bash-4.2-r1/``). This variable is comprised of the following:
       ${:term:`PN`}-${:term:`EXTENDPE`}${:term:`PV`}-${:term:`PR`}
 
-   PIXBUF_PACKAGES
+   :term:`PIXBUF_PACKAGES`
       When inheriting the :ref:`pixbufcache <ref-classes-pixbufcache>`
       class, this variable identifies packages that contain the pixbuf
       loaders used with ``gdk-pixbuf``. By default, the ``pixbufcache``
@@ -5617,7 +5617,7 @@ system and gives an overview of their function and contents.
       ``${``\ :term:`PN`\ ``}``). Use this variable if the
       loaders you need are in a package other than that main package.
 
-   PKG
+   :term:`PKG`
       The name of the resulting package created by the OpenEmbedded build
       system.
 
@@ -5631,11 +5631,11 @@ system and gives an overview of their function and contents.
       renames the output package, it does so by setting
       ``PKG_packagename``.
 
-   PKG_CONFIG_PATH
+   :term:`PKG_CONFIG_PATH`
       The path to ``pkg-config`` files for the current build context.
       ``pkg-config`` reads this variable from the environment.
 
-   PKGD
+   :term:`PKGD`
       Points to the destination directory for files to be packaged before
       they are split into individual packages. This directory defaults to
       the following:
@@ -5645,7 +5645,7 @@ system and gives an overview of their function and contents.
 
       Do not change this default.
 
-   PKGDATA_DIR
+   :term:`PKGDATA_DIR`
       Points to a shared, global-state directory that holds data generated
       during the packaging process. During the packaging process, the
       :ref:`ref-tasks-packagedata` task packages data
@@ -5664,7 +5664,7 @@ system and gives an overview of their function and contents.
       information on the shared, global-state directory, see
       :term:`STAGING_DIR_HOST`.
 
-   PKGDEST
+   :term:`PKGDEST`
       Points to the parent directory for files to be packaged after they
       have been split into individual packages. This directory defaults to
       the following:
@@ -5676,7 +5676,7 @@ system and gives an overview of their function and contents.
       package specified in :term:`PACKAGES`. Do not change
       this default.
 
-   PKGDESTWORK
+   :term:`PKGDESTWORK`
       Points to a temporary work area where the
       :ref:`ref-tasks-package` task saves package metadata.
       The ``PKGDESTWORK`` location defaults to the following:
@@ -5690,19 +5690,19 @@ system and gives an overview of their function and contents.
       package metadata from ``PKGDESTWORK`` to
       :term:`PKGDATA_DIR` to make it available globally.
 
-   PKGE
+   :term:`PKGE`
       The epoch of the package(s) built by the recipe. By default, ``PKGE``
       is set to :term:`PE`.
 
-   PKGR
+   :term:`PKGR`
       The revision of the package(s) built by the recipe. By default,
       ``PKGR`` is set to :term:`PR`.
 
-   PKGV
+   :term:`PKGV`
       The version of the package(s) built by the recipe. By default,
       ``PKGV`` is set to :term:`PV`.
 
-   PN
+   :term:`PN`
       This variable can have two separate functions depending on the
       context: a recipe name or a resulting package name.
 
@@ -5721,7 +5721,7 @@ system and gives an overview of their function and contents.
       packages for the target and for Multilib, ``PN`` would be ``bash``
       and ``lib64-bash``, respectively.
 
-   PNBLACKLIST
+   :term:`PNBLACKLIST`
       Lists recipes you do not want the OpenEmbedded build system to build.
       This variable works in conjunction with the
       :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
@@ -5734,7 +5734,7 @@ system and gives an overview of their function and contents.
 
          PNBLACKLIST[myrecipe] = "Not supported by our organization."
 
-   POPULATE_SDK_POST_HOST_COMMAND
+   :term:`POPULATE_SDK_POST_HOST_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the host part of the SDK. You can specify
       functions separated by semicolons:
@@ -5747,7 +5747,7 @@ system and gives an overview of their function and contents.
       the OpenEmbedded build system when creating SDK output. See the
       :term:`SDK_DIR` variable for more information.
 
-   POPULATE_SDK_POST_TARGET_COMMAND
+   :term:`POPULATE_SDK_POST_TARGET_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the target part of the SDK. You can specify
       functions separated by semicolons:
@@ -5760,7 +5760,7 @@ system and gives an overview of their function and contents.
       the OpenEmbedded build system when creating SDK output. See the
       :term:`SDK_DIR` variable for more information.
 
-   PR
+   :term:`PR`
       The revision of the recipe. The default value for this variable is
       "r0". Subsequent revisions of the recipe conventionally have the
       values "r1", "r2", and so forth. When :term:`PV` increases,
@@ -5799,7 +5799,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:working with a pr service`" section
       in the Yocto Project Development Tasks Manual for more information.
 
-   PREFERRED_PROVIDER
+   :term:`PREFERRED_PROVIDER`
       If multiple recipes provide the same item, this variable determines
       which recipe is preferred and thus provides the item (i.e. the
       preferred provider). You should always suffix this variable with the
@@ -5838,7 +5838,7 @@ system and gives an overview of their function and contents.
          mechanism is designed to select between mutually exclusive
          alternative providers.
 
-   PREFERRED_VERSION
+   :term:`PREFERRED_VERSION`
       If multiple versions of recipes exist, this variable determines which
       version is given preference. You must always suffix the variable with
       the :term:`PN` you want to select, and you should set the
@@ -5900,7 +5900,7 @@ system and gives an overview of their function and contents.
          The \_forcevariable override is not handled specially. This override
          only works because the default value of OVERRIDES includes "forcevariable".
 
-   PREMIRRORS
+   :term:`PREMIRRORS`
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
       first tries the local download directory. If that location fails, the
@@ -5930,7 +5930,7 @@ system and gives an overview of their function and contents.
       ``file://`` URLs to point to local directories or network shares as
       well.
 
-   PRIORITY
+   :term:`PRIORITY`
       Indicates the importance of a package.
 
       ``PRIORITY`` is considered to be part of the distribution policy
@@ -5941,7 +5941,7 @@ system and gives an overview of their function and contents.
       You can set ``PRIORITY`` to "required", "standard", "extra", and
       "optional", which is the default.
 
-   PRIVATE_LIBS
+   :term:`PRIVATE_LIBS`
       Specifies libraries installed within a recipe that should be ignored
       by the OpenEmbedded build system's shared library resolver. This
       variable is typically used when software being built by a recipe has
@@ -5967,7 +5967,7 @@ system and gives an overview of their function and contents.
       ":ref:`overview-manual/overview-manual-concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual.
 
-   PROVIDES
+   :term:`PROVIDES`
       A list of aliases by which a particular recipe can be known. By
       default, a recipe's own ``PN`` is implicitly already in its
       ``PROVIDES`` list and therefore does not need to mention that it
@@ -6030,7 +6030,7 @@ system and gives an overview of their function and contents.
                  VIRTUAL-RUNTIME_dev_manager = "udev"
 
 
-   PRSERV_HOST
+   :term:`PRSERV_HOST`
       The network based :term:`PR` service host and port.
 
       The ``conf/local.conf.sample.extended`` configuration file in the
@@ -6045,7 +6045,7 @@ system and gives an overview of their function and contents.
       service <dev-manual/dev-manual-common-tasks:working with a pr service>`. You can
       set ``PRSERV_HOST`` to other values to use a remote PR service.
 
-   PTEST_ENABLED
+   :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package
       Test <dev-manual/dev-manual-common-tasks:testing packages with ptest>` (ptest)
       functionality is enabled when building a recipe. You should not set
@@ -6053,7 +6053,7 @@ system and gives an overview of their function and contents.
       at build time should be done by adding "ptest" to (or removing it
       from) :term:`DISTRO_FEATURES`.
 
-   PV
+   :term:`PV`
       The version of the recipe. The version is normally extracted from the
       recipe filename. For example, if the recipe is named
       ``expat_2.0.1.bb``, then the default value of ``PV`` will be "2.0.1".
@@ -6063,7 +6063,7 @@ system and gives an overview of their function and contents.
 
       ``PV`` is the default value of the :term:`PKGV` variable.
 
-   PYTHON_ABI
+   :term:`PYTHON_ABI`
       When used by recipes that inherit the
       :ref:`distutils3 <ref-classes-distutils3>`,
       :ref:`setuptools3 <ref-classes-setuptools3>`,
@@ -6081,7 +6081,7 @@ system and gives an overview of their function and contents.
       use this variable to locate the headers and libraries of the
       appropriate Python that the extension is targeting.
 
-   PYTHON_PN
+   :term:`PYTHON_PN`
       When used by recipes that inherit the
       `distutils3 <ref-classes-distutils3>`,
       :ref:`setuptools3 <ref-classes-setuptools3>`,
@@ -6100,10 +6100,10 @@ system and gives an overview of their function and contents.
       In the previous example,
       the version of the dependency is ``PYTHON_PN``.
 
-   RANLIB
+   :term:`RANLIB`
       The minimal command and arguments to run ``ranlib``.
 
-   RCONFLICTS
+   :term:`RCONFLICTS`
       The list of packages that conflict with packages. Note that packages
       will not be installed if conflicting packages are not first removed.
 
@@ -6129,7 +6129,7 @@ system and gives an overview of their function and contents.
 
          RCONFLICTS_${PN} = "foo (>= 1.2)"
 
-   RDEPENDS
+   :term:`RDEPENDS`
       Lists runtime dependencies of a package. These dependencies are other
       packages that must be installed in order for the package to function
       correctly. As an example, the following assignment declares that the
@@ -6241,7 +6241,7 @@ system and gives an overview of their function and contents.
       BitBake User Manual for additional information on tasks and
       dependencies.
 
-   REQUIRED_DISTRO_FEATURES
+   :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the
       :ref:`distro_features_check <ref-classes-distro_features_check>`
       class, this variable identifies distribution features that must exist
@@ -6251,13 +6251,13 @@ system and gives an overview of their function and contents.
       appear in ``DISTRO_FEATURES`` within the current configuration, an
       error occurs and the build stops.
 
-   RM_WORK_EXCLUDE
+   :term:`RM_WORK_EXCLUDE`
       With ``rm_work`` enabled, this variable specifies a list of recipes
       whose work directories should not be removed. See the
       ":ref:`rm_work.bbclass <ref-classes-rm-work>`" section for more
       details.
 
-   ROOT_HOME
+   :term:`ROOT_HOME`
       Defines the root home directory. By default, this directory is set as
       follows in the BitBake configuration file:
       ::
@@ -6283,13 +6283,13 @@ system and gives an overview of their function and contents.
       override examples use ``/root``, which is probably the most commonly
       used override.
 
-   ROOTFS
+   :term:`ROOTFS`
       Indicates a filesystem image to include as the root filesystem.
 
       The ``ROOTFS`` variable is an optional variable used with the
       :ref:`image-live <ref-classes-image-live>` class.
 
-   ROOTFS_POSTINSTALL_COMMAND
+   :term:`ROOTFS_POSTINSTALL_COMMAND`
       Specifies a list of functions to call after the OpenEmbedded build
       system has installed packages. You can specify functions separated by
       semicolons:
@@ -6303,7 +6303,7 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
-   ROOTFS_POSTPROCESS_COMMAND
+   :term:`ROOTFS_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the root filesystem. You can specify functions
       separated by semicolons:
@@ -6317,7 +6317,7 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
-   ROOTFS_POSTUNINSTALL_COMMAND
+   :term:`ROOTFS_POSTUNINSTALL_COMMAND`
       Specifies a list of functions to call after the OpenEmbedded build
       system has removed unnecessary packages. When runtime package
       management is disabled in the image, several packages are removed
@@ -6333,7 +6333,7 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
-   ROOTFS_PREPROCESS_COMMAND
+   :term:`ROOTFS_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded build
       system has created the root filesystem. You can specify functions
       separated by semicolons:
@@ -6347,7 +6347,7 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_ROOTFS` variable for more
       information.
 
-   RPROVIDES
+   :term:`RPROVIDES`
       A list of package name aliases that a package also provides. These
       aliases are useful for satisfying runtime dependencies of other
       packages both during the build and on the target (as specified by
@@ -6366,7 +6366,7 @@ system and gives an overview of their function and contents.
 
          RPROVIDES_${PN} = "widget-abi-2"
 
-   RRECOMMENDS
+   :term:`RRECOMMENDS`
       A list of packages that extends the usability of a package being
       built. The package being built does not depend on this list of
       packages in order to successfully build, but rather uses them for
@@ -6426,7 +6426,7 @@ system and gives an overview of their function and contents.
 
          RRECOMMENDS_${PN} = "foo (>= 1.2)"
 
-   RREPLACES
+   :term:`RREPLACES`
       A list of packages replaced by a package. The package manager uses
       this variable to determine which package should be installed to
       replace other package(s) during an upgrade. In order to also have the
@@ -6462,7 +6462,7 @@ system and gives an overview of their function and contents.
 
           RREPLACES_${PN} = "foo (>= 1.2)"
 
-   RSUGGESTS
+   :term:`RSUGGESTS`
       A list of additional packages that you can suggest for installation
       by the package manager at the time a package is installed. Not all
       package managers support this functionality.
@@ -6474,7 +6474,7 @@ system and gives an overview of their function and contents.
 
          RSUGGESTS_${PN} = "useful_package another_package"
 
-   S
+   :term:`S`
       The location in the :term:`Build Directory` where
       unpacked recipe source code resides. By default, this directory is
       ``${``\ :term:`WORKDIR`\ ``}/${``\ :term:`BPN`\ ``}-${``\ :term:`PV`\ ``}``,
@@ -6505,13 +6505,13 @@ system and gives an overview of their function and contents.
          SRC_URI = "git://path/to/repo.git"
          S = "${WORKDIR}/git"
 
-   SANITY_REQUIRED_UTILITIES
+   :term:`SANITY_REQUIRED_UTILITIES`
       Specifies a list of command-line utilities that should be checked for
       during the initial sanity checking process when running BitBake. If
       any of the utilities are not installed on the build host, then
       BitBake immediately exits with an error.
 
-   SANITY_TESTED_DISTROS
+   :term:`SANITY_TESTED_DISTROS`
       A list of the host distribution identifiers that the build system has
       been tested against. Identifiers consist of the host distributor ID
       followed by the release, as reported by the ``lsb_release`` tool or
@@ -6522,11 +6522,11 @@ system and gives an overview of their function and contents.
       list, then the build system reports a warning that indicates the
       current host distribution has not been tested as a build host.
 
-   SDK_ARCH
+   :term:`SDK_ARCH`
       The target architecture for the SDK. Typically, you do not directly
       set this variable. Instead, use :term:`SDKMACHINE`.
 
-   SDK_DEPLOY
+   :term:`SDK_DEPLOY`
       The directory set up and used by the
       :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which
       the SDK is deployed. The ``populate_sdk_base`` class defines
@@ -6535,7 +6535,7 @@ system and gives an overview of their function and contents.
 
          SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
-   SDK_DIR
+   :term:`SDK_DIR`
       The parent directory used by the OpenEmbedded build system when
       creating SDK output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class defines
@@ -6554,7 +6554,7 @@ system and gives an overview of their function and contents.
          SDK_DEPLOY
          .
 
-   SDK_EXT_TYPE
+   :term:`SDK_EXT_TYPE`
       Controls whether or not shared state artifacts are copied into the
       extensible SDK. The default value of "full" copies all of the
       required shared state artifacts into the extensible SDK. The value
@@ -6567,7 +6567,7 @@ system and gives an overview of their function and contents.
          is set in the SDK's configuration to enable the artifacts to be
          fetched as needed.
 
-   SDK_HOST_MANIFEST
+   :term:`SDK_HOST_MANIFEST`
       The manifest file for the host part of the SDK. This file lists all
       the installed packages that make up the host part of the SDK. The
       file contains package information on a line-per-package basis as
@@ -6585,7 +6585,7 @@ system and gives an overview of their function and contents.
       The location is derived using the :term:`SDK_DEPLOY` and
       :term:`TOOLCHAIN_OUTPUTNAME` variables.
 
-   SDK_INCLUDE_PKGDATA
+   :term:`SDK_INCLUDE_PKGDATA`
       When set to "1", specifies to include the packagedata for all recipes
       in the "world" target in the extensible SDK. Including this data
       allows the ``devtool search`` command to find these recipes in search
@@ -6600,7 +6600,7 @@ system and gives an overview of their function and contents.
          needs to be built. Enabling the variable also slightly increases
          the size of the extensible SDK.
 
-   SDK_INCLUDE_TOOLCHAIN
+   :term:`SDK_INCLUDE_TOOLCHAIN`
       When set to "1", specifies to include the toolchain in the extensible
       SDK. Including the toolchain is useful particularly when
       :term:`SDK_EXT_TYPE` is set to "minimal" to keep
@@ -6613,7 +6613,7 @@ system and gives an overview of their function and contents.
       ``SDK_EXT_TYPE`` is set to "minimal", and defaults to "1" if
       ``SDK_EXT_TYPE`` is set to "full".
 
-   SDK_INHERIT_BLACKLIST
+   :term:`SDK_INHERIT_BLACKLIST`
       A list of classes to remove from the :term:`INHERIT`
       value globally within the extensible SDK configuration. The
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class sets the
@@ -6631,7 +6631,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   SDK_LOCAL_CONF_BLACKLIST
+   :term:`SDK_LOCAL_CONF_BLACKLIST`
       A list of variables not allowed through from the OpenEmbedded build
       system configuration into the extensible SDK configuration. Usually,
       these are variables that are specific to the machine on which the
@@ -6657,7 +6657,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   SDK_LOCAL_CONF_WHITELIST
+   :term:`SDK_LOCAL_CONF_WHITELIST`
       A list of variables allowed through from the OpenEmbedded build
       system configuration into the extensible SDK configuration. By
       default, the list of variables is empty and is set in the
@@ -6676,7 +6676,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   SDK_NAME
+   :term:`SDK_NAME`
       The base name for SDK output files. The name is derived from the
       :term:`DISTRO`, :term:`TCLIBC`,
       :term:`SDK_ARCH`,
@@ -6686,11 +6686,11 @@ system and gives an overview of their function and contents.
 
          SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}"
 
-   SDK_OS
+   :term:`SDK_OS`
       Specifies the operating system for which the SDK will be built. The
       default value is the value of :term:`BUILD_OS`.
 
-   SDK_OUTPUT
+   :term:`SDK_OUTPUT`
       The location used by the OpenEmbedded build system when creating SDK
       output. The :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
       class defines the variable as follows:
@@ -6706,14 +6706,14 @@ system and gives an overview of their function and contents.
          WORKDIR by way of SDK_DIR. The final output directory is
          SDK_DEPLOY.
 
-   SDK_PACKAGE_ARCHS
+   :term:`SDK_PACKAGE_ARCHS`
       Specifies a list of architectures compatible with the SDK machine.
       This variable is set automatically and should not normally be
       hand-edited. Entries are separated using spaces and listed in order
       of priority. The default value for ``SDK_PACKAGE_ARCHS`` is "all any
       noarch ${SDK_ARCH}-${SDKPKGSUFFIX}".
 
-   SDK_POSTPROCESS_COMMAND
+   :term:`SDK_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the SDK. You can specify functions separated by
       semicolons: SDK_POSTPROCESS_COMMAND += "function; ... "
@@ -6723,13 +6723,13 @@ system and gives an overview of their function and contents.
       the OpenEmbedded build system when creating SDK output. See the
       :term:`SDK_DIR` variable for more information.
 
-   SDK_PREFIX
+   :term:`SDK_PREFIX`
       The toolchain binary prefix used for ``nativesdk`` recipes. The
       OpenEmbedded build system uses the ``SDK_PREFIX`` value to set the
       :term:`TARGET_PREFIX` when building
       ``nativesdk`` recipes. The default value is "${SDK_SYS}-".
 
-   SDK_RECRDEP_TASKS
+   :term:`SDK_RECRDEP_TASKS`
       A list of shared state tasks added to the extensible SDK. By default,
       the following tasks are added:
 
@@ -6745,7 +6745,7 @@ system and gives an overview of their function and contents.
       tasks that are needed in order to build
       :term:`SDK_TARGETS`).
 
-   SDK_SYS
+   :term:`SDK_SYS`
       Specifies the system, including the architecture and the operating
       system, for which the SDK will be built.
 
@@ -6755,7 +6755,7 @@ system and gives an overview of their function and contents.
       :term:`SDK_OS`. You do not need to set the ``SDK_SYS``
       variable yourself.
 
-   SDK_TARGET_MANIFEST
+   :term:`SDK_TARGET_MANIFEST`
       The manifest file for the target part of the SDK. This file lists all
       the installed packages that make up the target part of the SDK. The
       file contains package information on a line-per-package basis as
@@ -6773,7 +6773,7 @@ system and gives an overview of their function and contents.
       The location is derived using the :term:`SDK_DEPLOY` and
       :term:`TOOLCHAIN_OUTPUTNAME` variables.
 
-   SDK_TARGETS
+   :term:`SDK_TARGETS`
       A list of targets to install from shared state as part of the
       standard or extensible SDK installation. The default value is "${PN}"
       (i.e. the image from which the SDK is built).
@@ -6781,7 +6781,7 @@ system and gives an overview of their function and contents.
       The ``SDK_TARGETS`` variable is an internal variable and typically
       would not be changed.
 
-   SDK_TITLE
+   :term:`SDK_TITLE`
       The title to be printed when running the SDK installer. By default,
       this title is based on the :term:`DISTRO_NAME` or
       :term:`DISTRO` variable and is set in the
@@ -6799,15 +6799,15 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   SDK_UPDATE_URL
+   :term:`SDK_UPDATE_URL`
       An optional URL for an update server for the extensible SDK. If set,
       the value is used as the default update server when running
       ``devtool sdk-update`` within the extensible SDK.
 
-   SDK_VENDOR
+   :term:`SDK_VENDOR`
       Specifies the name of the SDK vendor.
 
-   SDK_VERSION
+   :term:`SDK_VERSION`
       Specifies the version of the SDK. The distribution configuration file
       (e.g. ``/meta-poky/conf/distro/poky.conf``) defines the
       ``SDK_VERSION`` as follows:
@@ -6819,7 +6819,7 @@ system and gives an overview of their function and contents.
       :term:`DISTRO_VERSION` and
       :term:`DATE` variables.
 
-   SDKEXTPATH
+   :term:`SDKEXTPATH`
       The default installation directory for the Extensible SDK. By
       default, this directory is based on the :term:`DISTRO`
       variable and is set in the
@@ -6837,14 +6837,14 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   SDKIMAGE_FEATURES
+   :term:`SDKIMAGE_FEATURES`
       Equivalent to ``IMAGE_FEATURES``. However, this variable applies to
       the SDK generated from an image using the following command:
       ::
 
          $ bitbake -c populate_sdk imagename
 
-   SDKMACHINE
+   :term:`SDKMACHINE`
       The machine for which the SDK is built. In other words, the SDK is
       built such that it runs on the target you specify with the
       ``SDKMACHINE`` value. The value points to a corresponding ``.conf``
@@ -6864,23 +6864,23 @@ system and gives an overview of their function and contents.
          variable in your distribution configuration file. If you do, the
          configuration will not take affect.
 
-   SDKPATH
+   :term:`SDKPATH`
       Defines the path offered to the user for installation of the SDK that
       is generated by the OpenEmbedded build system. The path appears as
       the default location for installing the SDK when you run the SDK's
       installation script. You can override the offered path when you run
       the script.
 
-   SDKTARGETSYSROOT
+   :term:`SDKTARGETSYSROOT`
       The full path to the sysroot used for cross-compilation within an SDK
       as it will be when installed into the default
       :term:`SDKPATH`.
 
-   SECTION
+   :term:`SECTION`
       The section in which packages should be categorized. Package
       management utilities can make use of this variable.
 
-   SELECTED_OPTIMIZATION
+   :term:`SELECTED_OPTIMIZATION`
       Specifies the optimization flags passed to the C compiler when
       building for the target. The flags are passed through the default
       value of the :term:`TARGET_CFLAGS` variable.
@@ -6889,7 +6889,7 @@ system and gives an overview of their function and contents.
       ``FULL_OPTIMIZATION`` unless ``DEBUG_BUILD`` = "1". If that is the
       case, the value of ``DEBUG_OPTIMIZATION`` is used.
 
-   SERIAL_CONSOLE
+   :term:`SERIAL_CONSOLE`
       Defines a serial console (TTY) to enable using
       `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
       value that specifies the baud rate followed by the TTY device name
@@ -6906,7 +6906,7 @@ system and gives an overview of their function and contents.
          SERIAL_CONSOLES
          variable.
 
-   SERIAL_CONSOLES
+   :term:`SERIAL_CONSOLES`
       Defines a serial console (TTY) to enable using
       `getty <https://en.wikipedia.org/wiki/Getty_(Unix)>`__. Provide a
       value that specifies the baud rate followed by the TTY device name
@@ -6915,7 +6915,7 @@ system and gives an overview of their function and contents.
 
          SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
-   SERIAL_CONSOLES_CHECK
+   :term:`SERIAL_CONSOLES_CHECK`
       Specifies serial consoles, which must be listed in
       :term:`SERIAL_CONSOLES`, to check against
       ``/proc/console`` before enabling them using getty. This variable
@@ -6928,7 +6928,7 @@ system and gives an overview of their function and contents.
       This variable is currently only supported with SysVinit (i.e. not
       with systemd).
 
-   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
+   :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
       signatures of tasks from one recipe when they depend on tasks from
       another recipe. For example: ::
@@ -6956,7 +6956,7 @@ system and gives an overview of their function and contents.
          the software might break during runtime if the interface of the
          second recipe was changed after the first recipe had been built.
 
-   SIGGEN_EXCLUDERECIPES_ABISAFE
+   :term:`SIGGEN_EXCLUDERECIPES_ABISAFE`
       A list of recipes that are completely stable and will never change.
       The ABI for the recipes in the list are presented by output from the
       tasks run to build the recipe. Use of this variable is one way to
@@ -6969,15 +6969,15 @@ system and gives an overview of their function and contents.
          might break at runtime if the interface of the recipe was changed
          after the other had been built.
 
-   SITEINFO_BITS
+   :term:`SITEINFO_BITS`
       Specifies the number of bits for the target system CPU. The value
       should be either "32" or "64".
 
-   SITEINFO_ENDIANNESS
+   :term:`SITEINFO_ENDIANNESS`
       Specifies the endian byte order of the target system. The value
       should be either "le" for little-endian or "be" for big-endian.
 
-   SKIP_FILEDEPS
+   :term:`SKIP_FILEDEPS`
       Enables removal of all files from the "Provides" section of an RPM
       package. Removal of these files is required for packages containing
       prebuilt binaries and libraries such as ``libstdc++`` and ``glibc``.
@@ -6989,7 +6989,7 @@ system and gives an overview of their function and contents.
 
          SKIP_FILEDEPS = "1"
 
-   SOC_FAMILY
+   :term:`SOC_FAMILY`
       Groups together machines based upon the same family of SOC (System On
       Chip). You typically set this variable in a common ``.inc`` file that
       you include in the configuration files of all the machines.
@@ -7002,7 +7002,7 @@ system and gives an overview of their function and contents.
          MACHINEOVERRIDES
          .
 
-   SOLIBS
+   :term:`SOLIBS`
       Defines the suffix for shared libraries used on the target platform.
       By default, this suffix is ".so.*" for all Linux-based systems and is
       defined in the ``meta/conf/bitbake.conf`` configuration file.
@@ -7010,7 +7010,7 @@ system and gives an overview of their function and contents.
       You will see this variable referenced in the default values of
       ``FILES_${PN}``.
 
-   SOLIBSDEV
+   :term:`SOLIBSDEV`
       Defines the suffix for the development symbolic link (symlink) for
       shared libraries on the target platform. By default, this suffix is
       ".so" for Linux-based systems and is defined in the
@@ -7019,7 +7019,7 @@ system and gives an overview of their function and contents.
       You will see this variable referenced in the default values of
       ``FILES_${PN}-dev``.
 
-   SOURCE_MIRROR_FETCH
+   :term:`SOURCE_MIRROR_FETCH`
       When you are fetching files to create a mirror of sources (i.e.
       creating a source mirror), setting ``SOURCE_MIRROR_FETCH`` to "1" in
       your ``local.conf`` configuration file ensures the source for all
@@ -7038,7 +7038,7 @@ system and gives an overview of their function and contents.
          variable unless you are creating a source mirror. In other words,
          do not set the variable during a normal build.
 
-   SOURCE_MIRROR_URL
+   :term:`SOURCE_MIRROR_URL`
       Defines your own :term:`PREMIRRORS` from which to
       first fetch source before attempting to fetch from the upstream
       specified in :term:`SRC_URI`.
@@ -7057,7 +7057,7 @@ system and gives an overview of their function and contents.
          SOURCE_MIRROR_URL
          .
 
-   SPDXLICENSEMAP
+   :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default ``SPDXLICENSEMAP``
       mappings, see the ``meta/conf/licenses.conf`` file.
@@ -7065,13 +7065,13 @@ system and gives an overview of their function and contents.
       For additional information, see the :term:`LICENSE`
       variable.
 
-   SPECIAL_PKGSUFFIX
+   :term:`SPECIAL_PKGSUFFIX`
       A list of prefixes for :term:`PN` used by the OpenEmbedded
       build system to create variants of recipes or packages. The list
       specifies the prefixes to strip off during certain circumstances such
       as the generation of the :term:`BPN` variable.
 
-   SPL_BINARY
+   :term:`SPL_BINARY`
       The file type for the Secondary Program Loader (SPL). Some devices
       use an SPL from which to boot (e.g. the BeagleBone development
       board). For such cases, you can declare the file type of the SPL
@@ -7099,7 +7099,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Board Support Package Developer's Guide
       for additional information.
 
-   SRC_URI
+   :term:`SRC_URI`
       The list of source files - local or remote. This variable tells the
       OpenEmbedded build system which bits to pull in for the build and how
       to pull them in. For example, if the recipe or append file only needs
@@ -7242,18 +7242,18 @@ system and gives an overview of their function and contents.
       -  ``downloadfilename`` - Specifies the filename used when storing
          the downloaded file.
 
-   SRC_URI_OVERRIDES_PACKAGE_ARCH
+   :term:`SRC_URI_OVERRIDES_PACKAGE_ARCH`
       By default, the OpenEmbedded build system automatically detects
       whether ``SRC_URI`` contains files that are machine-specific. If so,
       the build system automatically changes ``PACKAGE_ARCH``. Setting this
       variable to "0" disables this behavior.
 
-   SRCDATE
+   :term:`SRCDATE`
       The date of the source code used to build the package. This variable
       applies only if the source was fetched from a Source Code Manager
       (SCM).
 
-   SRCPV
+   :term:`SRCPV`
       Returns the version string of the current package. This string is
       used to help define the value of :term:`PV`.
 
@@ -7272,7 +7272,7 @@ system and gives an overview of their function and contents.
 
          PV = "0.12-git${SRCPV}"
 
-   SRCREV
+   :term:`SRCREV`
       The revision of the source code used to build the package. This
       variable applies to Subversion, Git, Mercurial, and Bazaar only. Note
       that if you want to build a fixed revision and you want to avoid
@@ -7291,10 +7291,10 @@ system and gives an overview of their function and contents.
          Automatically Incrementing a Binary Package Revision Number
          " section, which is in the Yocto Project Development Tasks Manual.
 
-   SSTATE_DIR
+   :term:`SSTATE_DIR`
       The directory for the shared state cache.
 
-   SSTATE_MIRROR_ALLOW_NETWORK
+   :term:`SSTATE_MIRROR_ALLOW_NETWORK`
       If set to "1", allows fetches from mirrors that are specified in
       :term:`SSTATE_MIRRORS` to work even when
       fetching from the network is disabled by setting ``BB_NO_NETWORK`` to
@@ -7303,7 +7303,7 @@ system and gives an overview of their function and contents.
       your shared state cache, but you want to disable any other fetching
       from the network.
 
-   SSTATE_MIRRORS
+   :term:`SSTATE_MIRRORS`
       Configures the OpenEmbedded build system to search other mirror
       locations for prebuilt cache data objects before building out the
       data. This variable works like fetcher :term:`MIRRORS`
@@ -7337,7 +7337,7 @@ system and gives an overview of their function and contents.
              file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
              file://.* file:///some-local-dir/sstate/PATH"
 
-   SSTATE_SCAN_FILES
+   :term:`SSTATE_SCAN_FILES`
       Controls the list of files the OpenEmbedded build system scans for
       hardcoded installation paths. The variable uses a space-separated
       list of filenames (not paths) with standard wildcard characters
@@ -7356,21 +7356,21 @@ system and gives an overview of their function and contents.
       For details on the process, see the
       :ref:`staging <ref-classes-staging>` class.
 
-   STAGING_BASE_LIBDIR_NATIVE
+   :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the build host.
 
-   STAGING_BASELIBDIR
+   :term:`STAGING_BASELIBDIR`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the target for which the current recipe is being built
       (:term:`STAGING_DIR_HOST`).
 
-   STAGING_BINDIR
+   :term:`STAGING_BINDIR`
       Specifies the path to the ``/usr/bin`` subdirectory of the sysroot
       directory for the target for which the current recipe is being built
       (:term:`STAGING_DIR_HOST`).
 
-   STAGING_BINDIR_CROSS
+   :term:`STAGING_BINDIR_CROSS`
       Specifies the path to the directory containing binary configuration
       scripts. These scripts provide configuration information for other
       software that wants to make use of libraries or include files
@@ -7387,20 +7387,20 @@ system and gives an overview of their function and contents.
          pkg-config
          instead of a provided configuration script.
 
-   STAGING_BINDIR_NATIVE
+   :term:`STAGING_BINDIR_NATIVE`
       Specifies the path to the ``/usr/bin`` subdirectory of the sysroot
       directory for the build host.
 
-   STAGING_DATADIR
+   :term:`STAGING_DATADIR`
       Specifies the path to the ``/usr/share`` subdirectory of the sysroot
       directory for the target for which the current recipe is being built
       (:term:`STAGING_DIR_HOST`).
 
-   STAGING_DATADIR_NATIVE
+   :term:`STAGING_DATADIR_NATIVE`
       Specifies the path to the ``/usr/share`` subdirectory of the sysroot
       directory for the build host.
 
-   STAGING_DIR
+   :term:`STAGING_DIR`
       Helps construct the ``recipe-sysroots`` directory, which is used
       during packaging.
 
@@ -7426,7 +7426,7 @@ system and gives an overview of their function and contents.
          task and then the OpenEmbedded build system will stage a subset of
          those files into the sysroot.
 
-   STAGING_DIR_HOST
+   :term:`STAGING_DIR_HOST`
       Specifies the path to the sysroot directory for the system on which
       the component is built to run (the system that hosts the component).
       For most recipes, this sysroot is the one in which that recipe's
@@ -7464,11 +7464,11 @@ system and gives an overview of their function and contents.
             for ``-native`` recipes, as they make use of host headers and
             libraries.
 
-   STAGING_DIR_NATIVE
+   :term:`STAGING_DIR_NATIVE`
       Specifies the path to the sysroot directory used when building
       components that run on the build host itself.
 
-   STAGING_DIR_TARGET
+   :term:`STAGING_DIR_TARGET`
       Specifies the path to the sysroot used for the system for which the
       component generates code. For components that do not generate code,
       which is the majority, ``STAGING_DIR_TARGET`` is set to match
@@ -7484,45 +7484,45 @@ system and gives an overview of their function and contents.
       for the "HOST" system, while ``STAGING_DIR_TARGET`` points to the
       sysroot used for the "TARGET" system.
 
-   STAGING_ETCDIR_NATIVE
+   :term:`STAGING_ETCDIR_NATIVE`
       Specifies the path to the ``/etc`` subdirectory of the sysroot
       directory for the build host.
 
-   STAGING_EXECPREFIXDIR
+   :term:`STAGING_EXECPREFIXDIR`
       Specifies the path to the ``/usr`` subdirectory of the sysroot
       directory for the target for which the current recipe is being built
       (:term:`STAGING_DIR_HOST`).
 
-   STAGING_INCDIR
+   :term:`STAGING_INCDIR`
       Specifies the path to the ``/usr/include`` subdirectory of the
       sysroot directory for the target for which the current recipe being
       built (:term:`STAGING_DIR_HOST`).
 
-   STAGING_INCDIR_NATIVE
+   :term:`STAGING_INCDIR_NATIVE`
       Specifies the path to the ``/usr/include`` subdirectory of the
       sysroot directory for the build host.
 
-   STAGING_KERNEL_BUILDDIR
+   :term:`STAGING_KERNEL_BUILDDIR`
       Points to the directory containing the kernel build artifacts.
       Recipes building software that needs to access kernel build artifacts
       (e.g. ``systemtap-uprobes``) can look in the directory specified with
       the ``STAGING_KERNEL_BUILDDIR`` variable to find these artifacts
       after the kernel has been built.
 
-   STAGING_KERNEL_DIR
+   :term:`STAGING_KERNEL_DIR`
       The directory with kernel headers that are required to build
       out-of-tree modules.
 
-   STAGING_LIBDIR
+   :term:`STAGING_LIBDIR`
       Specifies the path to the ``/usr/lib`` subdirectory of the sysroot
       directory for the target for which the current recipe is being built
       (:term:`STAGING_DIR_HOST`).
 
-   STAGING_LIBDIR_NATIVE
+   :term:`STAGING_LIBDIR_NATIVE`
       Specifies the path to the ``/usr/lib`` subdirectory of the sysroot
       directory for the build host.
 
-   STAMP
+   :term:`STAMP`
       Specifies the base path used to create recipe stamp files. The path
       to an actual stamp file is constructed by evaluating this string and
       then appending additional information. Currently, the default
@@ -7543,26 +7543,26 @@ system and gives an overview of their function and contents.
       :term:`PV`, and :term:`PR` for related variable
       information.
 
-   STAMPS_DIR
+   :term:`STAMPS_DIR`
       Specifies the base directory in which the OpenEmbedded build system
       places stamps. The default directory is ``${TMPDIR}/stamps``.
 
-   STRIP
+   :term:`STRIP`
       The minimal command and arguments to run ``strip``, which is used to
       strip symbols.
 
-   SUMMARY
+   :term:`SUMMARY`
       The short (72 characters or less) summary of the binary package for
       packaging systems such as ``opkg``, ``rpm``, or ``dpkg``. By default,
       ``SUMMARY`` is used to define the
       :term:`DESCRIPTION` variable if ``DESCRIPTION`` is
       not set in the recipe.
 
-   SVNDIR
+   :term:`SVNDIR`
       The directory in which files checked out of a Subversion system are
       stored.
 
-   SYSLINUX_DEFAULT_CONSOLE
+   :term:`SYSLINUX_DEFAULT_CONSOLE`
       Specifies the kernel boot default console. If you want to use a
       console other than the default, set this variable in your recipe as
       follows where "X" is the console number you want to use:
@@ -7573,7 +7573,7 @@ system and gives an overview of their function and contents.
       The :ref:`syslinux <ref-classes-syslinux>` class initially sets
       this variable to null but then checks for a value later.
 
-   SYSLINUX_OPTS
+   :term:`SYSLINUX_OPTS`
       Lists additional options to add to the syslinux file. You need to set
       this variable in your recipe. If you want to list multiple options,
       separate the options with a semicolon character (``;``).
@@ -7581,7 +7581,7 @@ system and gives an overview of their function and contents.
       The :ref:`syslinux <ref-classes-syslinux>` class uses this variable
       to create a set of options.
 
-   SYSLINUX_SERIAL
+   :term:`SYSLINUX_SERIAL`
       Specifies the alternate serial port or turns it off. To turn off
       serial, set this variable to an empty string in your recipe. The
       variable's default value is set in the
@@ -7592,7 +7592,7 @@ system and gives an overview of their function and contents.
 
       The class checks for and uses the variable as needed.
 
-   SYSLINUX_SERIAL_TTY
+   :term:`SYSLINUX_SERIAL_TTY`
       Specifies the alternate console=tty... kernel boot argument. The
       variable's default value is set in the
       :ref:`syslinux <ref-classes-syslinux>` class as follows:
@@ -7602,7 +7602,7 @@ system and gives an overview of their function and contents.
 
       The class checks for and uses the variable as needed.
 
-   SYSLINUX_SPLASH
+   :term:`SYSLINUX_SPLASH`
       An ``.LSS`` file used as the background for the VGA boot menu when
       you use the boot menu. You need to set this variable in your recipe.
 
@@ -7610,13 +7610,13 @@ system and gives an overview of their function and contents.
       variable and if found, the OpenEmbedded build system installs the
       splash screen.
 
-   SYSROOT_DESTDIR
+   :term:`SYSROOT_DESTDIR`
       Points to the temporary directory under the work directory (default
       "``${``\ :term:`WORKDIR`\ ``}/sysroot-destdir``")
       where the files populated into the sysroot are assembled during the
       :ref:`ref-tasks-populate_sysroot` task.
 
-   SYSROOT_DIRS
+   :term:`SYSROOT_DIRS`
       Directories that are staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. By
       default, the following directories are staged:
@@ -7630,7 +7630,7 @@ system and gives an overview of their function and contents.
              ${datadir} \
              "
 
-   SYSROOT_DIRS_BLACKLIST
+   :term:`SYSROOT_DIRS_BLACKLIST`
       Directories that are not staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task. You
       can use this variable to exclude certain subdirectories of
@@ -7648,7 +7648,7 @@ system and gives an overview of their function and contents.
              ${datadir}/pixmaps \
              "
 
-   SYSROOT_DIRS_NATIVE
+   :term:`SYSROOT_DIRS_NATIVE`
       Extra directories staged into the sysroot by the
       :ref:`ref-tasks-populate_sysroot` task for
       ``-native`` recipes, in addition to those specified in
@@ -7675,12 +7675,12 @@ system and gives an overview of their function and contents.
          ), which is why additional directories containing program
          executables and supporting files need to be staged.
 
-   SYSROOT_PREPROCESS_FUNCS
+   :term:`SYSROOT_PREPROCESS_FUNCS`
       A list of functions to execute after files are staged into the
       sysroot. These functions are usually used to apply additional
       processing on the staged files, or to stage additional files.
 
-   SYSTEMD_AUTO_ENABLE
+   :term:`SYSTEMD_AUTO_ENABLE`
       When inheriting the :ref:`systemd <ref-classes-systemd>` class,
       this variable specifies whether the specified service in
       :term:`SYSTEMD_SERVICE` should start
@@ -7693,7 +7693,7 @@ system and gives an overview of their function and contents.
 
       You can disable the service by setting the variable to "disable".
 
-   SYSTEMD_BOOT_CFG
+   :term:`SYSTEMD_BOOT_CFG`
       When :term:`EFI_PROVIDER` is set to
       "systemd-boot", the ``SYSTEMD_BOOT_CFG`` variable specifies the
       configuration file that should be used. By default, the
@@ -7706,7 +7706,7 @@ system and gives an overview of their function and contents.
       For information on Systemd-boot, see the `Systemd-boot
       documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
-   SYSTEMD_BOOT_ENTRIES
+   :term:`SYSTEMD_BOOT_ENTRIES`
       When :term:`EFI_PROVIDER` is set to
       "systemd-boot", the ``SYSTEMD_BOOT_ENTRIES`` variable specifies a
       list of entry files (``*.conf``) to install that contain one boot
@@ -7720,7 +7720,7 @@ system and gives an overview of their function and contents.
       For information on Systemd-boot, see the `Systemd-boot
       documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
-   SYSTEMD_BOOT_TIMEOUT
+   :term:`SYSTEMD_BOOT_TIMEOUT`
       When :term:`EFI_PROVIDER` is set to
       "systemd-boot", the ``SYSTEMD_BOOT_TIMEOUT`` variable specifies the
       boot menu timeout in seconds. By default, the
@@ -7733,7 +7733,7 @@ system and gives an overview of their function and contents.
       For information on Systemd-boot, see the `Systemd-boot
       documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
 
-   SYSTEMD_PACKAGES
+   :term:`SYSTEMD_PACKAGES`
       When inheriting the :ref:`systemd <ref-classes-systemd>` class,
       this variable locates the systemd unit files when they are not found
       in the main recipe's package. By default, the ``SYSTEMD_PACKAGES``
@@ -7747,7 +7747,7 @@ system and gives an overview of their function and contents.
       to use ``SYSTEMD_PACKAGES`` to list the package or packages in which
       the build system can find the systemd unit files.
 
-   SYSTEMD_SERVICE
+   :term:`SYSTEMD_SERVICE`
       When inheriting the :ref:`systemd <ref-classes-systemd>` class,
       this variable specifies the systemd service name for a package.
 
@@ -7758,7 +7758,7 @@ system and gives an overview of their function and contents.
 
          SYSTEMD_SERVICE_${PN} = "connman.service"
 
-   SYSVINIT_ENABLED_GETTYS
+   :term:`SYSVINIT_ENABLED_GETTYS`
       When using
       :ref:`SysVinit <dev-manual/dev-manual-common-tasks:enabling system services>`,
       specifies a space-separated list of the virtual terminals that should
@@ -7769,7 +7769,7 @@ system and gives an overview of their function and contents.
       The default value for ``SYSVINIT_ENABLED_GETTYS`` is "1" (i.e. only
       run a getty on the first virtual terminal).
 
-   T
+   :term:`T`
       This variable points to a directory were BitBake places temporary
       files, which consist mostly of task logs and scripts, when building a
       particular recipe. The variable is typically set as follows:
@@ -7786,7 +7786,7 @@ system and gives an overview of their function and contents.
       the directory tree where BitBake places the output of an entire
       build.
 
-   TARGET_ARCH
+   :term:`TARGET_ARCH`
       The target machine's architecture. The OpenEmbedded build system
       supports many architectures. Here is an example list of architectures
       supported. This list is by no means complete as the architecture is
@@ -7803,7 +7803,7 @@ system and gives an overview of their function and contents.
       For additional information on machine architectures, see the
       :term:`TUNE_ARCH` variable.
 
-   TARGET_AS_ARCH
+   :term:`TARGET_AS_ARCH`
       Specifies architecture-specific assembler flags for the target
       system. ``TARGET_AS_ARCH`` is initialized from
       :term:`TUNE_ASARGS` by default in the BitBake
@@ -7812,7 +7812,7 @@ system and gives an overview of their function and contents.
 
          TARGET_AS_ARCH = "${TUNE_ASARGS}"
 
-   TARGET_CC_ARCH
+   :term:`TARGET_CC_ARCH`
       Specifies architecture-specific C compiler flags for the target
       system. ``TARGET_CC_ARCH`` is initialized from
       :term:`TUNE_CCARGS` by default.
@@ -7828,7 +7828,7 @@ system and gives an overview of their function and contents.
          LDFLAGS
          variable.
 
-   TARGET_CC_KERNEL_ARCH
+   :term:`TARGET_CC_KERNEL_ARCH`
       This is a specific kernel compiler flag for a CPU or Application
       Binary Interface (ABI) tune. The flag is used rarely and only for
       cases where a userspace :term:`TUNE_CCARGS` is not
@@ -7838,7 +7838,7 @@ system and gives an overview of their function and contents.
       ``meta/conf/machine/include/arm/feature-arm-thumb.inc`` file in the
       :term:`Source Directory` for an example.
 
-   TARGET_CFLAGS
+   :term:`TARGET_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
       target. When building in the target context,
       :term:`CFLAGS` is set to the value of this variable by
@@ -7848,7 +7848,7 @@ system and gives an overview of their function and contents.
       variable in the environment to the ``TARGET_CFLAGS`` value so that
       executables built using the SDK also have the flags applied.
 
-   TARGET_CPPFLAGS
+   :term:`TARGET_CPPFLAGS`
       Specifies the flags to pass to the C pre-processor (i.e. to both the
       C and the C++ compilers) when building for the target. When building
       in the target context, :term:`CPPFLAGS` is set to the
@@ -7859,7 +7859,7 @@ system and gives an overview of their function and contents.
       value so that executables built using the SDK also have the flags
       applied.
 
-   TARGET_CXXFLAGS
+   :term:`TARGET_CXXFLAGS`
       Specifies the flags to pass to the C++ compiler when building for the
       target. When building in the target context,
       :term:`CXXFLAGS` is set to the value of this variable
@@ -7870,13 +7870,13 @@ system and gives an overview of their function and contents.
       value so that executables built using the SDK also have the flags
       applied.
 
-   TARGET_FPU
+   :term:`TARGET_FPU`
       Specifies the method for handling FPU code. For FPU-less targets,
       which include most ARM CPUs, the variable must be set to "soft". If
       not, the kernel emulation gets used, which results in a performance
       penalty.
 
-   TARGET_LD_ARCH
+   :term:`TARGET_LD_ARCH`
       Specifies architecture-specific linker flags for the target system.
       ``TARGET_LD_ARCH`` is initialized from
       :term:`TUNE_LDARGS` by default in the BitBake
@@ -7885,7 +7885,7 @@ system and gives an overview of their function and contents.
 
          TARGET_LD_ARCH = "${TUNE_LDARGS}"
 
-   TARGET_LDFLAGS
+   :term:`TARGET_LDFLAGS`
       Specifies the flags to pass to the linker when building for the
       target. When building in the target context,
       :term:`LDFLAGS` is set to the value of this variable
@@ -7896,13 +7896,13 @@ system and gives an overview of their function and contents.
       ``TARGET_LDFLAGS`` value so that executables built using the SDK also
       have the flags applied.
 
-   TARGET_OS
+   :term:`TARGET_OS`
       Specifies the target's operating system. The variable can be set to
       "linux" for glibc-based systems (GNU C Library) and to "linux-musl"
       for musl libc. For ARM/EABI targets, "linux-gnueabi" and
       "linux-musleabi" possible values exist.
 
-   TARGET_PREFIX
+   :term:`TARGET_PREFIX`
       Specifies the prefix used for the toolchain binary target tools.
 
       Depending on the type of recipe and the build target,
@@ -7917,7 +7917,7 @@ system and gives an overview of their function and contents.
       -  For native SDK recipes (``nativesdk``), the build system sets the
          variable to the value of ``SDK_PREFIX``.
 
-   TARGET_SYS
+   :term:`TARGET_SYS`
       Specifies the system, including the architecture and the operating
       system, for which the build is occurring in the context of the
       current recipe.
@@ -7939,17 +7939,17 @@ system and gives an overview of their function and contents.
       -  Given a recipe being built for a little-endian, MIPS target
          running Linux, the value might be "mipsel-linux".
 
-   TARGET_VENDOR
+   :term:`TARGET_VENDOR`
       Specifies the name of the target vendor.
 
-   TCLIBC
+   :term:`TCLIBC`
       Specifies the GNU standard C library (``libc``) variant to use during
       the build process. This variable replaces ``POKYLIBC``, which is no
       longer supported.
 
       You can select "glibc", "musl", "newlib", or "baremetal"
 
-   TCLIBCAPPEND
+   :term:`TCLIBCAPPEND`
       Specifies a suffix to be appended onto the
       :term:`TMPDIR` value. The suffix identifies the
       ``libc`` variant for building. When you are building for multiple
@@ -7963,7 +7963,7 @@ system and gives an overview of their function and contents.
       ``TCLIBCAPPEND`` to "" in their distro configuration file resulting
       in no suffix being applied.
 
-   TCMODE
+   :term:`TCMODE`
       Specifies the toolchain selector. ``TCMODE`` controls the
       characteristics of the generated packages and images by telling the
       OpenEmbedded build system which toolchain profile to use. By default,
@@ -8007,7 +8007,7 @@ system and gives an overview of their function and contents.
       toolchain. You can use ``meta-sourcery`` as a template for adding
       support for other external toolchains.
 
-   TEST_EXPORT_DIR
+   :term:`TEST_EXPORT_DIR`
       The location the OpenEmbedded build system uses to export tests when
       the :term:`TEST_EXPORT_ONLY` variable is set
       to "1".
@@ -8015,12 +8015,12 @@ system and gives an overview of their function and contents.
       The ``TEST_EXPORT_DIR`` variable defaults to
       ``"${TMPDIR}/testimage/${PN}"``.
 
-   TEST_EXPORT_ONLY
+   :term:`TEST_EXPORT_ONLY`
       Specifies to export the tests only. Set this variable to "1" if you
       do not want to run the tests but you want them to be exported in a
       manner that you to run them outside of the build system.
 
-   TEST_LOG_DIR
+   :term:`TEST_LOG_DIR`
       Holds the SSH log and the boot log for QEMU machines. The
       ``TEST_LOG_DIR`` variable defaults to ``"${WORKDIR}/testimage"``.
 
@@ -8032,7 +8032,7 @@ system and gives an overview of their function and contents.
          ${WORKDIR}/temp/
          directory.
 
-   TEST_POWERCONTROL_CMD
+   :term:`TEST_POWERCONTROL_CMD`
       For automated hardware testing, specifies the command to use to
       control the power of the target machine under test. Typically, this
       command would point to a script that performs the appropriate action
@@ -8041,7 +8041,7 @@ system and gives an overview of their function and contents.
       "cycle" specifying to power off, on, or cycle (power off and then
       power on) the device, respectively.
 
-   TEST_POWERCONTROL_EXTRA_ARGS
+   :term:`TEST_POWERCONTROL_EXTRA_ARGS`
       For automated hardware testing, specifies additional arguments to
       pass through to the command specified in
       :term:`TEST_POWERCONTROL_CMD`. Setting
@@ -8049,7 +8049,7 @@ system and gives an overview of their function and contents.
       wish, for example, to separate the machine-specific and
       non-machine-specific parts of the arguments.
 
-   TEST_QEMUBOOT_TIMEOUT
+   :term:`TEST_QEMUBOOT_TIMEOUT`
       The time in seconds allowed for an image to boot before automated
       runtime tests begin to run against an image. The default timeout
       period to allow the boot process to reach the login prompt is 500
@@ -8060,7 +8060,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual.
 
-   TEST_SERIALCONTROL_CMD
+   :term:`TEST_SERIALCONTROL_CMD`
       For automated hardware testing, specifies the command to use to
       connect to the serial console of the target machine under test. This
       command simply needs to connect to the serial console and forward
@@ -8073,7 +8073,7 @@ system and gives an overview of their function and contents.
 
          TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"
 
-   TEST_SERIALCONTROL_EXTRA_ARGS
+   :term:`TEST_SERIALCONTROL_EXTRA_ARGS`
       For automated hardware testing, specifies additional arguments to
       pass through to the command specified in
       :term:`TEST_SERIALCONTROL_CMD`. Setting
@@ -8081,7 +8081,7 @@ system and gives an overview of their function and contents.
       wish, for example, to separate the machine-specific and
       non-machine-specific parts of the command.
 
-   TEST_SERVER_IP
+   :term:`TEST_SERVER_IP`
       The IP address of the build machine (host machine). This IP address
       is usually automatically detected. However, if detection fails, this
       variable needs to be set to the IP address of the build machine (i.e.
@@ -8096,7 +8096,7 @@ system and gives an overview of their function and contents.
          WORKDIR/oe-rootfs-repo
          .
 
-   TEST_SUITES
+   :term:`TEST_SUITES`
       An ordered list of tests (modules) to run against an image when
       performing automated runtime testing.
 
@@ -8139,7 +8139,7 @@ system and gives an overview of their function and contents.
       ":ref:`dev-manual/dev-manual-common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual.
 
-   TEST_TARGET
+   :term:`TEST_TARGET`
       Specifies the target controller to use when running tests against a
       test image. The default controller to use is "qemu":
       ::
@@ -8176,7 +8176,7 @@ system and gives an overview of their function and contents.
       ":ref:`hardware-image-enabling-tests`"
       section in the Yocto Project Development Tasks Manual.
 
-   TEST_TARGET_IP
+   :term:`TEST_TARGET_IP`
       The IP address of your hardware under test. The ``TEST_TARGET_IP``
       variable has no effect when :term:`TEST_TARGET` is
       set to "qemu".
@@ -8193,7 +8193,7 @@ system and gives an overview of their function and contents.
       directly accessible from your host and you need to do port address
       translation.
 
-   TESTIMAGE_AUTO
+   :term:`TESTIMAGE_AUTO`
       Automatically runs the series of automated tests for images when an
       image is successfully built. Setting ``TESTIMAGE_AUTO`` to "1" causes
       any image that successfully builds to automatically boot under QEMU.
@@ -8215,16 +8215,16 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`testimage*.bbclass <ref-classes-testimage*>`" section.
 
-   THISDIR
+   :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
       located. Do not manually set this variable.
 
-   TIME
+   :term:`TIME`
       The time the build was started. Times appear using the hour, minute,
       and second (HMS) format (e.g. "140159" for one minute and fifty-nine
       seconds past 1400 hours).
 
-   TMPDIR
+   :term:`TMPDIR`
       This variable is the base directory the OpenEmbedded build system
       uses for all build output and intermediate files (other than the
       shared state cache). By default, the ``TMPDIR`` variable points to
@@ -8246,7 +8246,7 @@ system and gives an overview of their function and contents.
       implementations, NFS does not meet this minimum requirement.
       Consequently, ``TMPDIR`` cannot be on NFS.
 
-   TOOLCHAIN_HOST_TASK
+   :term:`TOOLCHAIN_HOST_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       building an SDK, which contains a cross-development environment. The
       packages specified by this variable are part of the toolchain set
@@ -8271,7 +8271,7 @@ system and gives an overview of their function and contents.
       information on setting up a cross-development environment, see the
       :doc:`../sdk-manual/sdk-manual` manual.
 
-   TOOLCHAIN_OUTPUTNAME
+   :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
       the ``TOOLCHAIN_OUTPUTNAME`` variable as follows:
@@ -8284,7 +8284,7 @@ system and gives an overview of their function and contents.
       :term:`SDK_VERSION` variables for additional
       information.
 
-   TOOLCHAIN_TARGET_TASK
+   :term:`TOOLCHAIN_TARGET_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       it creates the target part of an SDK (i.e. the part built for the
       target hardware), which includes libraries and headers. Use this
@@ -8301,12 +8301,12 @@ system and gives an overview of their function and contents.
       information on setting up a cross-development environment, see the
       :doc:`../sdk-manual/sdk-manual` manual.
 
-   TOPDIR
+   :term:`TOPDIR`
       The top-level :term:`Build Directory`. BitBake
       automatically sets this variable when you initialize your build
       environment using ````` <#structure-core-script>`__.
 
-   TRANSLATED_TARGET_ARCH
+   :term:`TRANSLATED_TARGET_ARCH`
       A sanitized version of :term:`TARGET_ARCH`. This
       variable is used where the architecture is needed in a value where
       underscores are not allowed, for example within package filenames. In
@@ -8315,7 +8315,7 @@ system and gives an overview of their function and contents.
 
       Do not edit this variable.
 
-   TUNE_ARCH
+   :term:`TUNE_ARCH`
       The GNU canonical architecture for a specific architecture (i.e.
       ``arm``, ``armeb``, ``mips``, ``mips64``, and so forth). BitBake uses
       this value to setup configuration.
@@ -8347,7 +8347,7 @@ system and gives an overview of their function and contents.
       - mips
       - mipsel
 
-   TUNE_ASARGS
+   :term:`TUNE_ASARGS`
       Specifies architecture-specific assembler flags for the target
       system. The set of flags is based on the selected tune features.
       ``TUNE_ASARGS`` is set using the tune include files, which are
@@ -8365,7 +8365,7 @@ system and gives an overview of their function and contents.
          in turn, affects the tune variables themselves (i.e. the tune can
          supply its own set of flags).
 
-   TUNE_CCARGS
+   :term:`TUNE_CCARGS`
       Specifies architecture-specific C compiler flags for the target
       system. The set of flags is based on the selected tune features.
       ``TUNE_CCARGS`` is set using the tune include files, which are
@@ -8378,7 +8378,7 @@ system and gives an overview of their function and contents.
          in turn, affects the tune variables themselves (i.e. the tune can
          supply its own set of flags).
 
-   TUNE_FEATURES
+   :term:`TUNE_FEATURES`
       Features used to "tune" a compiler for optimal use given a specific
       processor. The features are defined within the tune files and allow
       arguments (i.e. ``TUNE_*ARGS``) to be dynamically generated based on
@@ -8395,7 +8395,7 @@ system and gives an overview of their function and contents.
 
       See the :term:`DEFAULTTUNE` variable for more information.
 
-   TUNE_LDARGS
+   :term:`TUNE_LDARGS`
       Specifies architecture-specific linker flags for the target system.
       The set of flags is based on the selected tune features.
       ``TUNE_LDARGS`` is set using the tune include files, which are
@@ -8413,7 +8413,7 @@ system and gives an overview of their function and contents.
          in turn, affects the tune variables themselves (i.e. the tune can
          supply its own set of flags).
 
-   TUNE_PKGARCH
+   :term:`TUNE_PKGARCH`
       The package architecture understood by the packaging system to define
       the architecture, ABI, and tuning of output packages. The specific
       tune is defined using the "_tune" override as follows:
@@ -8428,7 +8428,7 @@ system and gives an overview of their function and contents.
 
          TUNE_PKGARCH_tune-core2-32 = "core2-32"
 
-   TUNEABI
+   :term:`TUNEABI`
       An underlying Application Binary Interface (ABI) used by a particular
       tuning in a given toolchain layer. Providers that use prebuilt
       libraries can use the ``TUNEABI``,
@@ -8440,7 +8440,7 @@ system and gives an overview of their function and contents.
       :ref:`sanity <ref-classes-sanity>` class to see how the variable is
       used.
 
-   TUNEABI_OVERRIDE
+   :term:`TUNEABI_OVERRIDE`
       If set, the OpenEmbedded system ignores the
       :term:`TUNEABI_WHITELIST` variable.
       Providers that use prebuilt libraries can use the
@@ -8451,7 +8451,7 @@ system and gives an overview of their function and contents.
       See the :ref:`sanity <ref-classes-sanity>` class to see how the
       variable is used.
 
-   TUNEABI_WHITELIST
+   :term:`TUNEABI_WHITELIST`
       A whitelist of permissible :term:`TUNEABI` values. If
       ``TUNEABI_WHITELIST`` is not set, all tunes are allowed. Providers
       that use prebuilt libraries can use the ``TUNEABI_WHITELIST``,
@@ -8462,7 +8462,7 @@ system and gives an overview of their function and contents.
       See the :ref:`sanity <ref-classes-sanity>` class to see how the
       variable is used.
 
-   TUNECONFLICTS[feature]
+   :term:`TUNECONFLICTS[feature]`
       Specifies CPU or Application Binary Interface (ABI) tuning features
       that conflict with feature.
 
@@ -8475,7 +8475,7 @@ system and gives an overview of their function and contents.
 
          TUNECONFLICTS[n32] = "o32 n64"
 
-   TUNEVALID[feature]
+   :term:`TUNEVALID[feature]`
       Specifies a valid CPU or Application Binary Interface (ABI) tuning
       feature. The specified feature is stored as a flag. Valid features
       are specified in the machine include files (e.g.
@@ -8488,7 +8488,7 @@ system and gives an overview of their function and contents.
       See the machine include files in the :term:`Source Directory`
       for these features.
 
-   UBOOT_CONFIG
+   :term:`UBOOT_CONFIG`
       Configures the :term:`UBOOT_MACHINE` and can
       also define :term:`IMAGE_FSTYPES` for individual
       cases.
@@ -8510,30 +8510,30 @@ system and gives an overview of their function and contents.
       :ref:`uboot-config <ref-classes-uboot-config>`
       class.
 
-   UBOOT_DTB_LOADADDRESS
+   :term:`UBOOT_DTB_LOADADDRESS`
       Specifies the load address for the dtb image used by U-boot. During FIT
       image creation, the ``UBOOT_DTB_LOADADDRESS`` variable is used in
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify
       the load address to be used in
       creating the dtb sections of Image Tree Source for the FIT image.
 
-   UBOOT_DTBO_LOADADDRESS
+   :term:`UBOOT_DTBO_LOADADDRESS`
       Specifies the load address for the dtbo image used by U-boot.  During FIT
       image creation, the ``UBOOT_DTBO_LOADADDRESS`` variable is used in
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the load address to be used in
       creating the dtbo sections of Image Tree Source for the FIT image.
 
-   UBOOT_ENTRYPOINT
+   :term:`UBOOT_ENTRYPOINT`
       Specifies the entry point for the U-Boot image. During U-Boot image
       creation, the ``UBOOT_ENTRYPOINT`` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
-   UBOOT_LOADADDRESS
+   :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the ``UBOOT_LOADADDRESS`` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
-   UBOOT_LOCALVERSION
+   :term:`UBOOT_LOCALVERSION`
       Appends a string to the name of the local version of the U-Boot
       image. For example, assuming the version of the U-Boot image built
       was "2013.10", the full version string reported by U-Boot would be
@@ -8542,7 +8542,7 @@ system and gives an overview of their function and contents.
 
          UBOOT_LOCALVERSION = "-yocto"
 
-   UBOOT_MACHINE
+   :term:`UBOOT_MACHINE`
       Specifies the value passed on the ``make`` command line when building
       a U-Boot image. The value indicates the target platform
       configuration. You typically set this variable from the machine
@@ -8551,15 +8551,15 @@ system and gives an overview of their function and contents.
       Please see the "Selection of Processor Architecture and Board Type"
       section in the U-Boot README for valid values for this variable.
 
-   UBOOT_MAKE_TARGET
+   :term:`UBOOT_MAKE_TARGET`
       Specifies the target called in the ``Makefile``. The default target
       is "all".
 
-   UBOOT_MKIMAGE_DTCOPTS
+   :term:`UBOOT_MKIMAGE_DTCOPTS`
       Options for the device tree compiler passed to mkimage '-D'
       feature while creating FIT image in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class.
 
-   UBOOT_RD_ENTRYPOINT
+   :term:`UBOOT_RD_ENTRYPOINT`
       Specifies the entrypoint for the RAM disk image.
       During FIT image creation, the
       ``UBOOT_RD_ENTRYPOINT`` variable is used
@@ -8567,7 +8567,7 @@ system and gives an overview of their function and contents.
       entrypoint to be used in creating the Image Tree Source for
       the FIT image.
 
-   UBOOT_RD_LOADADDRESS
+   :term:`UBOOT_RD_LOADADDRESS`
       Specifies the load address for the RAM disk image.
       During FIT image creation, the
       ``UBOOT_RD_LOADADDRESS`` variable is used
@@ -8575,33 +8575,33 @@ system and gives an overview of their function and contents.
       load address to be used in creating the Image Tree Source for
       the FIT image.
 
-   UBOOT_SIGN_ENABLE
+   :term:`UBOOT_SIGN_ENABLE`
       Enable signing of FIT image. The default value is "0".
 
-   UBOOT_SIGN_KEYDIR
+   :term:`UBOOT_SIGN_KEYDIR`
       Location of the directory containing the RSA key and
       certificate used for signing FIT image.
 
-   UBOOT_SIGN_KEYNAME
+   :term:`UBOOT_SIGN_KEYNAME`
       The name of keys used for signing U-boot FIT image stored in
       :term:`UBOOT_SIGN_KEYDIR` directory. For e.g. dev.key key and dev.crt
       certificate stored in :term:`UBOOT_SIGN_KEYDIR` directory will have
       :term:`UBOOT_SIGN_KEYNAME` set to "dev".
 
-   UBOOT_SUFFIX
+   :term:`UBOOT_SUFFIX`
       Points to the generated U-Boot extension. For example, ``u-boot.sb``
       has a ``.sb`` extension.
 
       The default U-Boot extension is ``.bin``
 
-   UBOOT_TARGET
+   :term:`UBOOT_TARGET`
       Specifies the target used for building U-Boot. The target is passed
       directly as part of the "make" command (e.g. SPL and AIS). If you do
       not specifically set this variable, the OpenEmbedded build process
       passes and uses "all" for the target during the U-Boot building
       process.
 
-   UNKNOWN_CONFIGURE_WHITELIST
+   :term:`UNKNOWN_CONFIGURE_WHITELIST`
       Specifies a list of options that, if reported by the configure script
       as being invalid, should not generate a warning during the
       :ref:`ref-tasks-configure` task. Normally, invalid
@@ -8619,7 +8619,7 @@ system and gives an overview of their function and contents.
       :ref:`insane <ref-classes-insane>` class and is only enabled if the
       recipe inherits the :ref:`autotools <ref-classes-autotools>` class.
 
-   UPDATERCPN
+   :term:`UPDATERCPN`
       For recipes inheriting the
       :ref:`update-rc.d <ref-classes-update-rc.d>` class, ``UPDATERCPN``
       specifies the package that contains the initscript that is enabled.
@@ -8628,7 +8628,7 @@ system and gives an overview of their function and contents.
       install initscripts package them in the main package for the recipe,
       you rarely need to set this variable in individual recipes.
 
-   UPSTREAM_CHECK_GITTAGREGEX
+   :term:`UPSTREAM_CHECK_GITTAGREGEX`
       You can perform a per-recipe check for what the latest upstream
       source code version is by calling ``bitbake -c checkpkg`` recipe. If
       the recipe source code is provided from Git repositories, the
@@ -8642,7 +8642,7 @@ system and gives an overview of their function and contents.
 
          UPSTREAM_CHECK_GITTAGREGEX = "git_tag_regex"
 
-   UPSTREAM_CHECK_REGEX
+   :term:`UPSTREAM_CHECK_REGEX`
       Use the ``UPSTREAM_CHECK_REGEX`` variable to specify a different
       regular expression instead of the default one when the package
       checking system is parsing the page found using
@@ -8651,7 +8651,7 @@ system and gives an overview of their function and contents.
 
          UPSTREAM_CHECK_REGEX = "package_regex"
 
-   UPSTREAM_CHECK_URI
+   :term:`UPSTREAM_CHECK_URI`
       You can perform a per-recipe check for what the latest upstream
       source code version is by calling ``bitbake -c checkpkg`` recipe. If
       the source code is provided from tarballs, the latest version is
@@ -8663,7 +8663,7 @@ system and gives an overview of their function and contents.
 
          UPSTREAM_CHECK_URI = "recipe_url"
 
-   USE_DEVFS
+   :term:`USE_DEVFS`
       Determines if ``devtmpfs`` is used for ``/dev`` population. The
       default value used for ``USE_DEVFS`` is "1" when no value is
       specifically set. Typically, you would set ``USE_DEVFS`` to "0" for a
@@ -8673,7 +8673,7 @@ system and gives an overview of their function and contents.
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
-   USE_VT
+   :term:`USE_VT`
       When using
       :ref:`SysVinit <new-recipe-enabling-system-services>`,
       determines whether or not to run a
@@ -8687,7 +8687,7 @@ system and gives an overview of their function and contents.
       display attached and therefore do not need virtual terminal
       functionality.
 
-   USER_CLASSES
+   :term:`USER_CLASSES`
       A list of classes to globally inherit. These classes are used by the
       OpenEmbedded build system to enable extra features (e.g.
       ``buildstats``, ``image-mklibs``, and so forth).
@@ -8700,7 +8700,7 @@ system and gives an overview of their function and contents.
       For more information, see
       ``meta-poky/conf/local.conf.sample`` in the :term:`Source Directory`.
 
-   USERADD_ERROR_DYNAMIC
+   :term:`USERADD_ERROR_DYNAMIC`
       If set to ``error``, forces the OpenEmbedded build system to produce
       an error if the user identification (``uid``) and group
       identification (``gid``) values are not defined in any of the files
@@ -8745,7 +8745,7 @@ system and gives an overview of their function and contents.
          This saves you from having to add static IDs for recipes that you
          know will never be built.
 
-   USERADD_GID_TABLES
+   :term:`USERADD_GID_TABLES`
       Specifies a password file to use for obtaining static group
       identification (``gid``) values when the OpenEmbedded build system
       adds a group to the system during package installation.
@@ -8768,7 +8768,7 @@ system and gives an overview of their function and contents.
          gid
          values.
 
-   USERADD_PACKAGES
+   :term:`USERADD_PACKAGES`
       When inheriting the :ref:`useradd <ref-classes-useradd>` class,
       this variable specifies the individual packages within the recipe
       that require users and/or groups to be added.
@@ -8792,7 +8792,7 @@ system and gives an overview of their function and contents.
          GROUPMEMS_PARAM
          variables.
 
-   USERADD_PARAM
+   :term:`USERADD_PARAM`
       When inheriting the :ref:`useradd <ref-classes-useradd>` class,
       this variable specifies for a package what parameters should pass to
       the ``useradd`` command if you add a user to the system when the
@@ -8809,7 +8809,7 @@ system and gives an overview of their function and contents.
       standard Linux shell command ``useradd``, see
       http://linux.die.net/man/8/useradd.
 
-   USERADD_UID_TABLES
+   :term:`USERADD_UID_TABLES`
       Specifies a password file to use for obtaining static user
       identification (``uid``) values when the OpenEmbedded build system
       adds a user to the system during package installation.
@@ -8831,7 +8831,7 @@ system and gives an overview of their function and contents.
          uid
          values.
 
-   USERADDEXTENSION
+   :term:`USERADDEXTENSION`
       When set to "useradd-staticids", causes the OpenEmbedded build system
       to base all user and group additions on a static ``passwd`` and
       ``group`` files found in :term:`BBPATH`.
@@ -8857,7 +8857,7 @@ system and gives an overview of their function and contents.
       Additionally, you should also set the
       :term:`USERADD_ERROR_DYNAMIC` variable.
 
-   VOLATILE_LOG_DIR
+   :term:`VOLATILE_LOG_DIR`
       Specifies the persistence of the target's ``/var/log`` directory,
       which is used to house postinstall target log files.
 
@@ -8865,14 +8865,14 @@ system and gives an overview of their function and contents.
       file is not persistent. You can override this setting by setting the
       variable to "no" to make the log directory persistent.
 
-   WARN_QA
+   :term:`WARN_QA`
       Specifies the quality assurance checks whose failures are reported as
       warnings by the OpenEmbedded build system. You set this variable in
       your distribution configuration file. For a list of the checks you
       can control with this variable, see the
       ":ref:`insane.bbclass <ref-classes-insane>`" section.
 
-   WKS_FILE
+   :term:`WKS_FILE`
       Specifies the location of the Wic kickstart file that is used by the
       OpenEmbedded build system to create a partitioned image
       (image\ ``.wic``). For information on how to create a partitioned
@@ -8881,7 +8881,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual. For details on
       the kickstart file format, see the ":doc:`../ref-manual/ref-kickstart`" Chapter.
 
-   WKS_FILE_DEPENDS
+   :term:`WKS_FILE_DEPENDS`
       When placed in the recipe that builds your image, this variable lists
       build-time dependencies. The ``WKS_FILE_DEPENDS`` variable is only
       applicable when Wic images are active (i.e. when
@@ -8906,7 +8906,7 @@ system and gives an overview of their function and contents.
       previous example, some-native-tool would be replaced with an actual
       native tool on which the build would depend.
 
-   WORKDIR
+   :term:`WORKDIR`
       The pathname of the work directory in which the OpenEmbedded build
       system builds a recipe. This directory is located within the
       :term:`TMPDIR` directory structure and is specific to
@@ -8946,7 +8946,7 @@ system and gives an overview of their function and contents.
 
          poky/build/tmp/work/qemux86-poky-linux/foo/1.3.0-r0
 
-   XSERVER
+   :term:`XSERVER`
       Specifies the packages that should be installed to provide an X
       server and drivers for the current machine, assuming your image
       directly includes ``packagegroup-core-x11-xserver`` or, perhaps
-- 
2.26.2

