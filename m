Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.6100.1620981346314178721
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 281A2100006;
	Fri, 14 May 2021 08:35:43 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/6] dev-manual: simplify style
Date: Fri, 14 May 2021 10:35:24 +0200
Message-Id: <20210514083527.281767-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
References: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 139 +++++++++++-----------
 documentation/dev-manual/qemu.rst         |   4 +-
 documentation/dev-manual/start.rst        |  26 ++--
 3 files changed, 79 insertions(+), 90 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 5c3fc41772..1307341730 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -346,7 +346,7 @@ The application consists of the following sections:
    of the Yocto Project for which your layer is compatible.
 
 -  *Acceptance Criteria:* Provide "Yes" or "No" answers for each of the
-   items in the checklist. Space exists at the bottom of the form for
+   items in the checklist. There is space at the bottom of the form for
    any explanations for items for which you answered "No".
 
 -  *Recommendations:* Provide answers for the questions regarding Linux
@@ -542,7 +542,7 @@ important as it ensures that items in the list remain colon-separated.
    paths in the final list.
 
    Also, not all append files add extra files. Many append files simply
-   exist to add build options (e.g. ``systemd``). For these cases, your
+   allow to add build options (e.g. ``systemd``). For these cases, your
    append file would not even use the ``FILESEXTRAPATHS`` statement.
 
 Prioritizing Your Layer
@@ -1060,8 +1060,8 @@ The remainder of the section provides details for the steps.
 Locate or Automatically Create a Base Recipe
 --------------------------------------------
 
-You can always write a recipe from scratch. However, three choices exist
-that can help you quickly get a start on a new recipe:
+You can always write a recipe from scratch. However, there are three choices
+that can help you quickly get started with a new recipe:
 
 -  ``devtool add``: A command that assists in creating a recipe and an
    environment conducive to development.
@@ -1521,8 +1521,8 @@ software is built; and runtime dependencies, which are required to be
 installed on the target in order for the software to run.
 
 Within a recipe, you specify build-time dependencies using the
-:term:`DEPENDS` variable. Although
-nuances exist, items specified in ``DEPENDS`` should be names of other
+:term:`DEPENDS` variable. Although there are nuances,
+items specified in ``DEPENDS`` should be names of other
 recipes. It is important that you specify all build-time dependencies
 explicitly.
 
@@ -2183,8 +2183,8 @@ script to first boot is undesirable and for read-only rootfs impossible.
 
 .. note::
 
-   Equivalent support for pre-install, pre-uninstall, and post-uninstall
-   scripts exist by way of ``pkg_preinst``, ``pkg_prerm``, and ``pkg_postrm``,
+   There is equivalent support for pre-install, pre-uninstall, and post-uninstall
+   scripts by way of ``pkg_preinst``, ``pkg_prerm``, and ``pkg_postrm``,
    respectively. These scrips work in exactly the same way as does
    ``pkg_postinst`` with the exception that they run at different times. Also,
    because of when they run, they are not applicable to being run at image
@@ -2376,7 +2376,7 @@ Packaging Externally Produced Binaries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Sometimes, you need to add pre-compiled binaries to an image. For
-example, suppose that binaries for proprietary code exist, which are
+example, suppose that there are binaries for proprietary code,
 created by a particular division of a company. Your part of the company
 needs to use those binaries as part of an image that you are building
 using the OpenEmbedded build system. Since you only have the binaries
@@ -2832,7 +2832,7 @@ Over time, upstream developers publish new versions for software built
 by layer recipes. It is recommended to keep recipes up-to-date with
 upstream version releases.
 
-While several methods exist that allow you upgrade a recipe, you might
+While there are several methods to upgrade a recipe, you might
 consider checking on the upgrade status of a recipe first. You can do so
 using the ``devtool check-upgrade-status`` command. See the
 ":ref:`devtool-checking-on-the-upgrade-status-of-a-recipe`"
@@ -2861,8 +2861,8 @@ commit messages in the layer's tree for the changes made to recipes.
 
 .. note::
 
-   Conditions do exist when you should not use AUH to upgrade recipes
-   and you should instead use either ``devtool upgrade`` or upgrade your
+   In some conditions, you should not use AUH to upgrade recipes
+   and should instead use either ``devtool upgrade`` or upgrade your
    recipes manually:
 
    -  When AUH cannot complete the upgrade sequence. This situation
@@ -2922,7 +2922,7 @@ The following steps describe how to set up the AUH utility:
    undesirably.
 
 5. *Make Configurations in Your Local Configuration File:* Several
-   settings need to exist in the ``local.conf`` file in the build
+   settings are needed in the ``local.conf`` file in the build
    directory you just created for AUH. Make these following
    configurations:
 
@@ -3131,8 +3131,8 @@ newly upgraded recipe::
    NOTE: nano: compiling from external source tree /home/scottrif/poky/build/workspace/sources/nano
    NOTE: Tasks Summary: Attempted 520 tasks of which 304 didn't need to be rerun and all succeeded.
 
-Within the ``devtool upgrade`` workflow, opportunity
-exists to deploy and test your rebuilt software. For this example,
+Within the ``devtool upgrade`` workflow, you can
+deploy and test your rebuilt software. For this example,
 however, running ``devtool finish`` cleans up the workspace once the
 source in your workspace is clean. This usually means using Git to stage
 and submit commits for the changes generated by the upgrade process.
@@ -3214,7 +3214,7 @@ To manually upgrade recipe versions, follow these general steps:
    if the recipe is to be released publicly.
 
 5. *Check the Upstream Change Log or Release Notes:* Checking both these
-   reveals if new features exist that could break
+   reveals if there are new features that could break
    backwards-compatibility. If so, you need to take steps to mitigate or
    eliminate that situation.
 
@@ -3517,7 +3517,7 @@ Building a Simple Image
 
 In the development environment, you need to build an image whenever you
 change hardware support, add or change system libraries, or add or
-change services that have dependencies. Several methods exist that allow
+change services that have dependencies. There are several methods that allow
 you to build an image within the Yocto Project. This section presents
 the basic steps you need to build a simple image using BitBake from a
 build host running Linux.
@@ -4215,7 +4215,7 @@ your tunings to best consider build times and package feed maintenance.
    sysroot for each machine is generated, the software is not recompiled
    and only one package feed exists.
 
--  *Manage Granular Level Packaging:* Sometimes cases exist where
+-  *Manage Granular Level Packaging:* Sometimes there are cases where
    injecting another level of package architecture beyond the three
    higher levels noted earlier can be useful. For example, consider how
    NXP (formerly Freescale) allows for the easy reuse of binary packages
@@ -4281,7 +4281,7 @@ By default, the OpenEmbedded build system uses the
 code. The build process involves fetching the source files, unpacking
 them, and then patching them if necessary before the build takes place.
 
-Situations exist where you might want to build software from source
+There are situations where you might want to build software from source
 files that are external to and thus outside of the OpenEmbedded build
 system. For example, suppose you have a project that includes a new BSP
 with a heavily customized kernel. And, you want to minimize exposing the
@@ -4648,7 +4648,7 @@ libraries and other binaries to use a different set of libraries. The
 libraries could differ in architecture, compiler options, or other
 optimizations.
 
-Several examples exist in the ``meta-skeleton`` layer found in the
+There are several examples in the ``meta-skeleton`` layer found in the
 :term:`Source Directory`:
 
 -  ``conf/multilib-example.conf`` configuration file
@@ -4661,7 +4661,7 @@ Preparing to Use Multilib
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 User-specific requirements drive the Multilib feature. Consequently,
-there is no one "out-of-the-box" configuration that likely exists to
+there is no one "out-of-the-box" configuration that would
 meet your needs.
 
 In order to enable Multilib, you first need to ensure your recipe is
@@ -4724,8 +4724,8 @@ specifically with a command like this::
 Additional Implementation Details
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Generic implementation details as well as details that are specific to
-package management systems exist. Following are implementation details
+There are generic implementation details as well as details that are specific to
+package management systems. Following are implementation details
 that exist regardless of the package management system:
 
 -  The typical convention used for the class extension code as used by
@@ -4742,8 +4742,7 @@ that exist regardless of the package management system:
    vendor string presently break Autoconf's ``config.sub``, and other
    separators are problematic for different reasons.
 
-For the RPM Package Management System, the following implementation
-details exist:
+Here are the implementation details for the RPM Package Management System:
 
 -  A unique architecture is defined for the Multilib packages, along
    with creating a unique deploy folder under ``tmp/deploy/rpm`` in the
@@ -4764,8 +4763,7 @@ details exist:
 -  The build system relies on RPM to resolve the identical files in the
    two (or more) Multilib packages.
 
-For the IPK Package Management System, the following implementation
-details exist:
+Here are the implementation details for the IPK Package Management System:
 
 -  The ``${MLPREFIX}`` is not stripped from ``${PN}`` during IPK
    packaging. The naming for a normal RPM package and a Multilib IPK
@@ -4783,9 +4781,9 @@ details exist:
 Installing Multiple Versions of the Same Library
 ------------------------------------------------
 
-Situations can exist where you need to install and use multiple versions
-of the same library on the same system at the same time. These
-situations almost always exist when a library API changes and you have
+There are be situations where you need to install and use multiple versions
+of the same library on the same system at the same time. This
+almost always happens when a library API changes and you have
 multiple pieces of software that depend on the separate versions of the
 library. To accommodate these situations, you can install multiple
 versions of the same library in parallel on the same system.
@@ -4850,9 +4848,9 @@ follows:
 -  You can create and boot ``core-image-minimal`` and
    ``core-image-sato`` images.
 
--  RPM Package Manager (RPM) support exists for x32 binaries.
+-  There is RPM Package Manager (RPM) support for x32 binaries.
 
--  Support for large images exists.
+-  There is support for large images.
 
 To use the x32 psABI, you need to edit your ``conf/local.conf``
 configuration file as follows::
@@ -4918,7 +4916,7 @@ library package involves the following:
    :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
    and that "qemu-usermode" is not in
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
-   If either of these conditions exist, nothing will happen.
+   In either of these conditions, nothing will happen.
 
 3. Try to build the recipe. If you encounter build errors that look like
    something is unable to find ``.so`` libraries, check where these
@@ -5005,7 +5003,7 @@ working in an image:
 Known Issues
 ------------
 
-The following know issues exist for GObject Introspection Support:
+Here are know issues in GObject Introspection Support:
 
 -  ``qemu-ppc64`` immediately crashes. Consequently, you cannot build
    introspection data on that architecture.
@@ -5184,7 +5182,7 @@ For example, the following returns overview help for Wic::
 
    $ wic help overview
 
-One additional level of help exists for Wic. You can get help on
+There is one additional level of help for Wic. You can get help on
 individual images through the ``list`` command. You can use the ``list``
 command to return the available Wic images as follows::
 
@@ -5872,8 +5870,8 @@ your image more secure.
 General Considerations
 ----------------------
 
-General considerations exist that help you create more secure images.
-You should consider the following suggestions to help make your device
+There are general considerations that help you create more secure images.
+You should consider the following suggestions to make your device
 more secure:
 
 -  Scan additional code you are adding to the system (e.g. application
@@ -6210,8 +6208,8 @@ or to not install a package at all.
 
 The following list introduces variables you can use to prevent packages
 from being installed into your image. Each of these variables only works
-with IPK and RPM package types. Support for Debian packages does not
-exist. Also, you can use these variables from your ``local.conf`` file
+with IPK and RPM package types, not for Debian packages.
+Also, you can use these variables from your ``local.conf`` file
 or attach them to a specific image recipe by using a recipe name
 override. For more detail on the variables, see the descriptions in the
 Yocto Project Reference Manual's glossary chapter.
@@ -6285,7 +6283,7 @@ maintain a package feed that is compatible with existing package manager
 applications such as RPM, APT, and OPKG, using an automated system is
 much preferred over a manual system. In either system, the main
 requirement is that binary package version numbering increases in a
-linear fashion and that a number of version components exist that
+linear fashion and that there is a number of version components that
 support that linear progression. For information on how to ensure
 package revisioning remains linear, see the
 ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
@@ -6342,7 +6340,7 @@ generated are just "self consistent". The build system adds and removes
 packages and there are no guarantees about upgrade paths but images will
 be consistent and correct with the latest changes.
 
-The simplest form for a PR Service is for it to exist for a single host
+The simplest form for a PR Service is for a single host
 development system that builds the package feed (building system). For
 this scenario, you can enable a local PR Service by setting
 :term:`PRSERV_HOST` in your
@@ -6545,7 +6543,7 @@ The previous example specifies a number of things in the call to
    "Lighttpd module for alias".
 
 Often, packaging modules is as simple as the previous example. However,
-more advanced options exist that you can use within
+there are more advanced options that you can use within
 ``do_split_packages`` to modify its behavior. And, if you need to, you
 can add more logic by specifying a hook function that is called for each
 package. It is also perfectly acceptable to call ``do_split_packages``
@@ -7024,7 +7022,7 @@ file::
    `passphrase`.
 
 Aside from the ``RPM_GPG_NAME`` and ``RPM_GPG_PASSPHRASE`` variables in
-the previous example, two optional variables related to signing exist:
+the previous example, two optional variables related to signing are available:
 
 -  *GPG_BIN:* Specifies a ``gpg`` binary/wrapper that is executed
    when the package is signed.
@@ -7046,14 +7044,14 @@ your ``local.config`` or ``distro.config`` file::
    PACKAGE_FEED_GPG_NAME = "key_name"
    PACKAGE_FEED_GPG_PASSPHRASE_FILE = "path_to_file_containing_passphrase"
 
-For signed package feeds, the passphrase must exist in a separate file,
+For signed package feeds, the passphrase must be specified in a separate file,
 which is pointed to by the ``PACKAGE_FEED_GPG_PASSPHRASE_FILE``
 variable. Regarding security, keeping a plain text passphrase out of the
 configuration is more secure.
 
 Aside from the ``PACKAGE_FEED_GPG_NAME`` and
 ``PACKAGE_FEED_GPG_PASSPHRASE_FILE`` variables, three optional variables
-related to signed package feeds exist:
+related to signed package feeds are available:
 
 -  *GPG_BIN* Specifies a ``gpg`` binary/wrapper that is executed
    when the package is signed.
@@ -7192,7 +7190,7 @@ use this fetcher in combination with
 :doc:`devtool </ref-manual/devtool-reference>` to create
 recipes that produce NPM packages.
 
-Two workflows exist that allow you to create NPM packages using
+There are two workflows that allow you to create NPM packages using
 ``devtool``: the NPM registry modules method and the NPM project code
 method.
 
@@ -7296,7 +7294,7 @@ The ``devtool edit-recipe`` command lets you take a look at the recipe::
    ...
    LICENSE_${PN}-vary = "MIT"
 
-Three key points exist in the previous example:
+Here are three key points in the previous example:
 
 -  :term:`SRC_URI` uses the NPM
    scheme so that the NPM fetcher is used.
@@ -7488,7 +7486,7 @@ Selecting an Initialization Manager
 ===================================
 
 By default, the Yocto Project uses SysVinit as the initialization
-manager. However, support also exists for systemd, which is a full
+manager. However, there is also support for systemd, which is a full
 replacement for init with parallel starting of services, reduced shell
 overhead and other features that are used by many distributions.
 
@@ -7794,7 +7792,7 @@ link to the built library and that library will be pulled into your
 image along with the new software even if you did not want the library.
 
 The :ref:`buildhistory <ref-classes-buildhistory>`
-class exists to help you maintain the quality of your build output. You
+class helps you maintain the quality of your build output. You
 can use the class to highlight unexpected and possibly unwanted changes
 in the build output. When you enable build history, it records
 information about the contents of each package and image and then
@@ -7849,7 +7847,7 @@ variable. Here is an example abbreviated listing:
 .. image:: figures/buildhistory.png
    :align: center
 
-At the top level, a ``metadata-revs`` file exists that lists the
+At the top level, there is a ``metadata-revs`` file that lists the
 revisions of the repositories for the enabled layers when the build was
 produced. The rest of the data splits into separate ``packages``,
 ``images`` and ``sdk`` directories, the contents of which are described
@@ -7885,7 +7883,7 @@ The exceptions are ``FILELIST``, which is the actual list of files in
 the package, and ``PKGSIZE``, which is the total size of files in the
 package in bytes.
 
-A file also exists that corresponds to the recipe from which the package
+There is also a file that corresponds to the recipe from which the package
 came (e.g. ``buildhistory/packages/i586-poky-linux/busybox/latest``):
 
 .. code-block:: none
@@ -7900,8 +7898,8 @@ came (e.g. ``buildhistory/packages/i586-poky-linux/busybox/latest``):
       busybox-staticdev busybox-dev busybox-doc busybox-locale busybox
 
 Finally, for those recipes fetched from a version control system (e.g.,
-Git), a file exists that lists source revisions that are specified in
-the recipe and lists the actual revisions used during the build. Listed
+Git), there is a file that lists source revisions that are specified in
+the recipe and the actual revisions used during the build. Listed
 and actual revisions might differ when
 :term:`SRCREV` is set to
 ${:term:`AUTOREV`}. Here is an
@@ -8141,7 +8139,7 @@ You need to realize,
 however, that this method does show changes that are not significant
 (e.g. a package's size changing by a few bytes).
 
-A command-line tool called ``buildhistory-diff`` does exist, though,
+There is a command-line tool called ``buildhistory-diff``, though,
 that queries the Git repository and prints just the differences that
 might be significant in human-readable form. Here is an example::
 
@@ -8315,7 +8313,7 @@ the MAC address of the device.
 In order to run tests on hardware, you need to set ``TEST_TARGET`` to an
 appropriate value. For QEMU, you do not have to change anything, the
 default value is "qemu". For running tests on hardware, the following
-options exist:
+options are available:
 
 -  *"simpleremote":* Choose "simpleremote" if you are going to run tests
    on a target system that is already running the image to be tested and
@@ -8639,7 +8637,7 @@ layer's ``layer.conf`` file as normal). Just remember the following:
 
 -  Do not use module names that collide with existing core tests.
 
--  Minimally, an empty ``__init__.py`` file must exist in the runtime
+-  Minimally, an empty ``__init__.py`` file must be present in the runtime
    directory.
 
 To create a new test, start by copying an existing module (e.g.
@@ -8719,7 +8717,7 @@ Class attributes are as follows:
 Instance Attributes
 ~~~~~~~~~~~~~~~~~~~
 
-A single instance attribute exists, which is ``target``. The ``target``
+There is a single instance attribute, which is ``target``. The ``target``
 instance attribute is identical to the class attribute of the same name,
 which is described in the previous section. This attribute exists as
 both an instance and class attribute so tests can use
@@ -9348,7 +9346,7 @@ Recipe Logging Mechanisms
 
 The Yocto Project provides several logging functions for producing
 debugging output and reporting errors and warnings. For Python
-functions, the following logging functions exist. All of these functions
+functions, the following logging functions are available. All of these functions
 log to ``${T}/log.do_``\ `task`, and can also log to standard output
 (stdout) with the right settings:
 
@@ -9454,8 +9452,8 @@ A parallel ``make`` race occurs when the build consists of several parts
 that are run simultaneously and a situation occurs when the output or
 result of one part is not ready for use with a different part of the
 build that depends on that output. Parallel make races are annoying and
-can sometimes be difficult to reproduce and fix. However, some simple
-tips and tricks exist that can help you debug and fix them. This section
+can sometimes be difficult to reproduce and fix. However, there are some simple
+tips and tricks that can help you debug and fix them. This section
 presents a real-world example of an error encountered on the Yocto
 Project autobuilder and the process used to fix it.
 
@@ -9578,7 +9576,7 @@ In the ``devshell``, do the following::
    $ make tools/snep-send.o
 
 The ``devshell`` commands cause the failure to clearly
-be visible. In this case, a missing dependency exists for the "neard"
+be visible. In this case, there is a missing dependency for the ``neard``
 Makefile target. Here is some abbreviated, sample output with the
 missing dependency clearly visible at the end::
 
@@ -9623,9 +9621,8 @@ patch::
    $ quilt refresh
    Refreshed patch patches/parallelmake.patch
 
-Once
-the patch file exists, you need to add it back to the originating recipe
-folder. Here is an example assuming a top-level
+Once the patch file is created, you need to add it back to the originating
+recipe folder. Here is an example assuming a top-level
 :term:`Source Directory` named ``poky``::
 
    $ cp patches/parallelmake.patch poky/meta/recipes-connectivity/neard/neard
@@ -10119,7 +10116,7 @@ specific uses.
 
 The Yocto Project uses a mailing list and a patch-based workflow that is
 similar to the Linux kernel but contains important differences. In
-general, a mailing list exists through which you can submit patches. You
+general, there is a mailing list through which you can submit patches. You
 should send patches to the appropriate mailing list so that they can be
 reviewed and merged by the appropriate maintainer. The specific mailing
 list you need to use depends on the location of the code you are
@@ -10796,8 +10793,8 @@ Here are some other scenarios:
 Other Variables Related to Commercial Licenses
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Other helpful variables related to commercial license handling exist and
-are defined in the
+There are other helpful variables related to commercial license handling,
+defined in the
 ``poky/meta/conf/distro/include/default-distrovars.inc`` file::
 
    COMMERCIAL_AUDIO_PLUGINS ?= ""
@@ -10841,7 +10838,7 @@ requirements during a software release.
 With hundreds of different open source licenses that the Yocto Project
 tracks, it is difficult to know the requirements of each and every
 license. However, the requirements of the major FLOSS licenses can begin
-to be covered by assuming that three main areas of concern exist:
+to be covered by assuming that there are three main areas of concern:
 
 -  Source code must be provided.
 
@@ -11105,9 +11102,9 @@ portion is integrated with the installed Yocto Project
 The server receives the information collected and saves it in a
 database.
 
-A live instance of the error reporting server exists at
-https://errors.yoctoproject.org. This server exists so that when
-you want to get help with build failures, you can submit all of the
+There is a live instance of the error reporting server at
+https://errors.yoctoproject.org.
+When you want to get help with build failures, you can submit all of the
 information on the failure easily and then point to the URL in your bug
 report or send an email to the mailing list.
 
diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index f7366938dd..88a63c1808 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -275,7 +275,7 @@ present, the toolchain is also automatically used.
 
 .. note::
 
-   Several mechanisms exist that let you connect to the system running
+   There are several mechanisms to connect to the system running
    on the QEMU emulator:
 
    -  QEMU provides a framebuffer interface that makes standard consoles
@@ -286,7 +286,7 @@ present, the toolchain is also automatically used.
       that port to run a console. The connection uses standard IP
       networking.
 
-   -  SSH servers exist in some QEMU images. The ``core-image-sato``
+   -  SSH servers are available in some QEMU images. The ``core-image-sato``
       QEMU image has a Dropbear secure shell (SSH) server that runs with
       the root password disabled. The ``core-image-full-cmdline`` and
       ``core-image-lsb`` QEMU images have OpenSSH instead of Dropbear.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 18fd8ccf60..c3276c9502 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -36,7 +36,7 @@ particular working environment and set of practices.
     equipment together and set up your development environment's
     hardware topology.
 
-    The following roles exist:
+    Here are possible roles:
 
     -  *Application Developer:* This type of developer does application
        level work on top of an existing software stack.
@@ -99,8 +99,7 @@ particular working environment and set of practices.
     .. note::
 
        The setup of these services is beyond the scope of this manual.
-       However, sites such as the following exist that describe how to
-       perform setup:
+       However, here are sites describing how to perform setup:
 
        -  `Gitolite <https://gitolite.com>`__: Information for
           ``gitolite``.
@@ -190,7 +189,7 @@ particular working environment and set of practices.
     develop locally using their primary development system.
 
 9.  *Document Policies and Change Flow:* The Yocto Project uses a
-    hierarchical structure and a pull model. Scripts exist to create and
+    hierarchical structure and a pull model. There are scripts to create and
     send pull requests (i.e. ``create-pull-request`` and
     ``send-pull-request``). This model is in line with other open source
     projects where maintainers are responsible for specific areas of the
@@ -215,8 +214,8 @@ particular working environment and set of practices.
     someone else in the community needs them also.
 
 10. *Development Environment Summary:* Aside from the previous steps,
-    some best practices exist within the Yocto Project development
-    environment. Consider the following:
+    here are best practices within the Yocto Project development
+    environment:
 
     -  Use :ref:`overview-manual/development-environment:git` as the source control
        system.
@@ -607,8 +606,8 @@ of a given component.
 
    The recommended method for accessing Yocto Project components is to
    use Git to clone the upstream repository and work from within that
-   locally cloned repository. The procedure in this section exists
-   should you desire a tarball snapshot of any given component.
+   locally cloned repository. However, this section documents how to
+   use a tarball snapshot of any given component.
 
 Follow these steps to locate and download a particular tarball:
 
@@ -645,13 +644,6 @@ release. Rather than Git repositories, these files represent snapshot
 tarballs similar to the tarballs located in the Index of Releases
 described in the ":ref:`dev-manual/start:accessing index of releases`" section.
 
-.. note::
-
-   The recommended method for accessing Yocto Project components is to
-   use Git to clone a repository and work from within that local
-   repository. The procedure in this section exists should you desire a
-   tarball snapshot of any given component.
-
 1. *Go to the Yocto Project Website:* Open The
    :yocto_home:`Yocto Project Website <>` in your browser.
 
@@ -750,8 +742,8 @@ Follow these steps to create a local version of the upstream
    ":ref:`dev-manual/start:checking out by tag in poky`" sections, respectively.
 
    Once the local repository is created, you can change to that
-   directory and check its status. Here, the single "master" branch
-   exists on your system and by default, it is checked out::
+   directory and check its status. The ``master`` branch is checked out
+   by default::
 
       $ cd poky
       $ git status
-- 
2.25.1

