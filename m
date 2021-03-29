Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.21430.1617024187023345312
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 06:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1BDDA60005;
	Mon, 29 Mar 2021 13:23:04 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] Fix typos and spacing
Date: Mon, 29 Mar 2021 15:23:02 +0200
Message-Id: <20210329132302.52046-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix double words, punctuation spacing issues, spacing issues,
"its" instead of "it's", and other trivial issues.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README                          |  2 +-
 documentation/bsp-guide/bsp.rst               |  4 +--
 documentation/dev-manual/common-tasks.rst     | 25 ++++++++-----------
 documentation/kernel-dev/common.rst           |  2 +-
 documentation/kernel-dev/maint-appx.rst       |  2 +-
 documentation/overview-manual/concepts.rst    |  5 ++--
 documentation/overview-manual/yp-intro.rst    |  8 +++---
 documentation/profile-manual/usage.rst        |  4 +--
 documentation/ref-manual/TODO                 |  6 ++---
 documentation/ref-manual/classes.rst          |  2 +-
 documentation/ref-manual/faq.rst              |  2 +-
 documentation/ref-manual/migration-1.7.rst    |  2 +-
 documentation/ref-manual/release-process.rst  |  2 +-
 .../ref-manual/system-requirements.rst        |  2 +-
 documentation/ref-manual/variables.rst        |  8 +++---
 .../sdk-manual/appendix-customizing.rst       |  2 +-
 documentation/sdk-manual/working-projects.rst |  9 ++-----
 .../test-manual/understand-autobuilder.rst    |  4 +--
 documentation/toaster-manual/reference.rst    |  2 +-
 19 files changed, 39 insertions(+), 54 deletions(-)

diff --git a/documentation/README b/documentation/README
index 159ec9460..b491e46a1 100644
--- a/documentation/README
+++ b/documentation/README
@@ -109,7 +109,7 @@ obvious reasons, we will only support building the Yocto Project
 documentation with Python3.
 
 Sphinx might be available in your Linux distro packages repositories,
-however it is not recommend to use distro packages, as they might be
+however it is not recommended to use distro packages, as they might be
 old versions, especially if you are using an LTS version of your
 distro. The recommended method to install Sphinx and all required
 dependencies is to use the Python Package Index (pip).
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index c24ab28ea..89f156442 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -250,7 +250,7 @@ standardization of software support for hardware.
 The proposed form described in this section does have elements that are
 specific to the OpenEmbedded build system. It is intended that
 developers can use this structure with other build systems besides the
-OpenEmbedded build system. It is also intended that it will be be simple
+OpenEmbedded build system. It is also intended that it will be simple
 to extract information and convert it to other formats if required. The
 OpenEmbedded build system, through its standard :ref:`layers mechanism
 <overview-manual/yp-intro:the yocto project layer model>`, can
@@ -1036,7 +1036,7 @@ the following:
    to reside in a machine-specific directory.
 
 Following is a specific example to help you better understand the
-process. This example customizes customizes a recipe by adding a
+process. This example customizes a recipe by adding a
 BSP-specific configuration file named ``interfaces`` to the
 ``init-ifupdown_1.0.bb`` recipe for machine "xyz" where the BSP layer
 also supports several other machines:
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index faa5efeb5..f3ee9bbbb 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2061,16 +2061,12 @@ sysroot are cataloged in manifests in order to ensure the files can be
 removed later when a recipe is either modified or removed. Thus, the
 sysroot is able to remain free from stale files.
 
-A subset of the files installed by the
-:ref:`ref-tasks-install` task are
-used by the
-:ref:`ref-tasks-populate_sysroot`
-task as defined by the the
-:term:`SYSROOT_DIRS` variable to
-automatically populate the sysroot. It is possible to modify the list of
-directories that populate the sysroot. The following example shows how
-you could add the ``/opt`` directory to the list of directories within a
-recipe:
+A subset of the files installed by the :ref:`ref-tasks-install` task are
+used by the :ref:`ref-tasks-populate_sysroot` task as defined by the
+:term:`SYSROOT_DIRS` variable to automatically populate the sysroot.
+It is possible to modify the list of directories that populate the
+sysroot. The following example shows how you could add the ``/opt``
+directory to the list of directories within a recipe:
 ::
 
    SYSROOT_DIRS += "/opt"
@@ -2081,8 +2077,7 @@ recipe:
    that are not included in the target filesystem, allowing them to share
    these artifacts without needing to use the ``DEPLOY_DIR``.
 
-For a more complete description of the
-:ref:`ref-tasks-populate_sysroot`
+For a more complete description of the :ref:`ref-tasks-populate_sysroot`
 task and its associated functions, see the
 :ref:`staging <ref-classes-staging>` class.
 
@@ -4591,7 +4586,7 @@ directory:
          section.
 
       3. Once you have the correct source revisions, you can modify
-         those recipes to to set ``SRCREV`` to specific versions of the
+         those recipes to set ``SRCREV`` to specific versions of the
          software.
 
 Speeding Up a Build
@@ -6599,7 +6594,7 @@ Quality <#maintaining-build-output-quality>`__" section.
 
    The OpenEmbedded build system does not maintain ``PR`` information as
    part of the shared state (sstate) packages. If you maintain an sstate
-   feed, its expected that either all your building systems that
+   feed, it's expected that either all your building systems that
    contribute to the sstate feed use a shared PR Service, or you do not
    run a PR Service on any of your building systems. Having some systems
    use a PR Service while others do not leads to obvious problems.
@@ -7070,7 +7065,7 @@ runtime package management of RPM packages. In order to use DNF for
 runtime package management, you must perform an initial setup on the
 target machine for cases where the ``PACKAGE_FEED_*`` variables were not
 set as part of the image that is running on the target. This means if
-you built your image and did not not use these variables as part of the
+you built your image and did not use these variables as part of the
 build and your image is now running on the target, you need to perform
 the steps in this section if you want to use runtime package management.
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 0e545d1b8..3878f831b 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1914,7 +1914,7 @@ differences:
    $ git show origin/standard/base..origin/standard/emenlow
 
 Use this command to create individual patches for each change. Here is
-an example that that creates patch files for each commit and places them
+an example that creates patch files for each commit and places them
 in your ``Documents`` directory:
 ::
 
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index 89f4b4334..44c43893e 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -64,7 +64,7 @@ the "yocto-4.12" branch of the ``yocto-kernel-cache`` repository:
    kernel versions (e.g. "yocto-4.12", "yocto-4.10", "yocto-4.9", and so forth).
 
 Once you have checked out and switched to appropriate branches, you can
-see a snapshot of all the kernel source files used to used to build that
+see a snapshot of all the kernel source files used to build that
 particular Yocto Linux kernel for a particular board.
 
 To see the features and configurations for a particular Yocto Linux
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 257de44ec..1534e8897 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1456,7 +1456,7 @@ toolchain construction and use.
    :align: center
 
 Most of the work occurs on the Build Host. This is the machine used to
-build images and generally work within the the Yocto Project
+build images and generally work within the Yocto Project
 environment. When you run
 :term:`BitBake` to create an image, the
 OpenEmbedded build system uses the host ``gcc`` compiler to bootstrap a
@@ -2111,8 +2111,7 @@ accomplished using fakeroot.
    under fakeroot. Otherwise, the task cannot run root-only operations,
    and cannot see the fake file ownership and permissions set by the
    other task. You need to also add a dependency on
-   virtual/fakeroot-native:do_populate_sysroot
-   , giving the following:
+   virtual/fakeroot-native:do_populate_sysroot, giving the following:
    ::
 
       fakeroot do_mytask () {
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 0ec7e2b96..6a33a5ab7 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -262,8 +262,7 @@ with the string ``meta-``.
 .. note::
 
    It is not a requirement that a layer name begin with the prefix
-   meta-
-   , but it is a commonly accepted standard in the Yocto Project
+   meta-, but it is a commonly accepted standard in the Yocto Project
    community.
 
 For example, if you were to examine the :yocto_git:`tree view </poky/tree/>`
@@ -272,7 +271,7 @@ of the ``poky`` repository, you will see several layers: ``meta``,
 ``meta-yocto-bsp``. Each of these repositories represents a distinct
 layer.
 
-For procedures on how to create layers, see the 
+For procedures on how to create layers, see the
 ":ref:`dev-manual/common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
@@ -283,8 +282,7 @@ The Yocto Project employs a collection of components and tools used by
 the project itself, by project developers, and by those using the Yocto
 Project. These components and tools are open source projects and
 metadata that are separate from the reference distribution
-(:term:`Poky`) and the 
-:term:`OpenEmbedded Build System`. Most of the
+(:term:`Poky`) and the :term:`OpenEmbedded Build System`. Most of the
 components and tools are downloaded separately.
 
 This section provides brief overviews of the components and tools
diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index fd6da6fc4..c42f5b64b 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -256,7 +256,7 @@ important for now), which takes the buffers the kernel passes to it and
 writes it to a disk file to save it.
 
 The part of this process that we're looking at in the above call stacks
-is the part where the kernel passes the data it's read from the socket
+is the part where the kernel passes the data it has read from the socket
 down to wget i.e. a copy-to-user.
 
 Notice also that here there's also a case where the hex value is
@@ -1580,7 +1580,7 @@ events in the output buffer: ::
    root@sugarbay:/sys/kernel/debug/tracing# echo nop > current_tracer
    root@sugarbay:/sys/kernel/debug/tracing# echo 1 > tracing_on
 
-Now, if we look at the the 'trace' file, we see nothing
+Now, if we look at the 'trace' file, we see nothing
 but the kmalloc events we just turned on: ::
 
    root@sugarbay:/sys/kernel/debug/tracing# cat trace | less
diff --git a/documentation/ref-manual/TODO b/documentation/ref-manual/TODO
index ee0db977c..0510f5471 100644
--- a/documentation/ref-manual/TODO
+++ b/documentation/ref-manual/TODO
@@ -1,10 +1,10 @@
 Handbook Todo List:
 
-  * Document adding a new IMAGE_FEATURE to the customising images section 
+  * Document adding a new IMAGE_FEATURE to the customising images section
   * Add instructions about using zaurus/openmoko emulation
   * Add component overview/block diagrams
-  * Software Deevelopment intro should mention its software development for 
-    intended target and could be a different arch etc and thus special case. 
+  * Software Development intro should mention its software development for
+    intended target and could be a different arch etc and thus special case.
   * Expand insane.bbclass documentation to cover tests
   * Document remaining classes (see list in ref-classes)
   * Document formfactor
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index be112e0fa..6d9779f6e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1426,7 +1426,7 @@ Only a single U-boot boot script can be added to the FIT image created by
 The boot script is specified in the ITS file as a text file containing
 U-boot commands. When using a boot script the user should configure the
 U-boot ``do_install`` task to copy the script to sysroot.
-So the script can be included in the the FIT image by the ``kernel-fitimage``
+So the script can be included in the FIT image by the ``kernel-fitimage``
 class. At run-time, U-boot CONFIG_BOOTCOMMAND define can be configured to
 load the boot script from the FIT image and executes it.
 
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 34b26ee3e..3b65588ca 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -449,7 +449,7 @@ variable ``bindir``. The makefile's hardcoded default value of
 "/usr/bin" worked most of the time, but not for the recipe's ``-native``
 variant. For another example, permissions errors might be caused by a
 Makefile that ignores ``DESTDIR`` or uses a different name for that
-environment variable. Check the the build system to see if these kinds
+environment variable. Check the build system to see if these kinds
 of issues exist.
 
 **Q:** I'm adding a binary in a recipe but it's different in the image, what is
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 54544e479..c00768ca7 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -12,7 +12,7 @@ Changes to Setting QEMU ``PACKAGECONFIG`` Options in ``local.conf``
 The QEMU recipe now uses a number of
 :term:`PACKAGECONFIG` options to enable various
 optional features. The method used to set defaults for these options
-means that existing ``local.conf`` files will need to be be modified to
+means that existing ``local.conf`` files will need to be modified to
 append to ``PACKAGECONFIG`` for ``qemu-native`` and ``nativesdk-qemu``
 instead of setting it. In other words, to enable graphical output for
 QEMU, you should now have these lines in ``local.conf``:
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index ed5a09a55..107d06c76 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -135,7 +135,7 @@ consists of the following pieces:
 
 -  :ref:`ptest <dev-manual/common-tasks:testing packages with ptest>`:
    Runs tests against packages produced during the build for a given
-   piece of software. The test allows the packages to be be run within a
+   piece of software. The test allows the packages to be run within a
    target image.
 
 -  ``oe-selftest``: Tests combination BitBake invocations. These tests
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 9f423e7bb..6edfa1a86 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -294,7 +294,7 @@ installer and automatically installs the tools for you:
 
    During execution, the buildtools tarball will be downloaded, the
    checksum of the download will be verified, the installer will be run
-   for you, and some basic checks will be run to to make sure the
+   for you, and some basic checks will be run to make sure the
    installation is functional.
 
    To avoid the need of ``sudo`` privileges, the ``install-buildtools``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f551c4d37..3298887cd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -768,9 +768,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          If you run BitBake from a directory outside of the
-         Build Directory
-         , you must be sure to set
-         BBPATH
+         Build Directory, you must be sure to set BBPATH
          to point to the Build Directory. Set the variable as you would any
          environment variable and then run BitBake:
          ::
@@ -2991,7 +2989,7 @@ system and gives an overview of their function and contents.
 
    :term:`IMAGE_CMD`
       Specifies the command to create the image file for a specific image
-      type, which corresponds to the value set set in
+      type, which corresponds to the value set in
       :term:`IMAGE_FSTYPES`, (e.g. ``ext3``,
       ``btrfs``, and so forth). When setting this variable, you should use
       an override for the associated type. Here is an example:
@@ -3458,7 +3456,7 @@ system and gives an overview of their function and contents.
 
          This will result in ``INCOMPATIBLE_LICENSE`` containing the names of
          all licenses from :term:`AVAILABLE_LICENSES` except the ones specified
-         in ``COMPATIBLE_LICENSES`` , thus only allowing the latter licenses to
+         in ``COMPATIBLE_LICENSES``, thus only allowing the latter licenses to
          be used.
 
    :term:`INHERIT`
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 97ade0801..cdfde8b4b 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -139,7 +139,7 @@ Changing the Extensible SDK Installer Title
 
 You can change the displayed title for the SDK installer by setting the
 :term:`SDK_TITLE` variable and then
-rebuilding the the SDK installer. For information on how to build an SDK
+rebuilding the SDK installer. For information on how to build an SDK
 installer, see the "`Building an SDK
 Installer <#sdk-building-an-sdk-installer>`__" section.
 
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index bddf00a7d..c9bb506c2 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -104,10 +104,7 @@ project:
 
    .. note::
 
-      If you get errors from
-      configure.ac
-      , which
-      autoreconf
+      If you get errors from configure.ac, which autoreconf
       runs, that indicate missing files, you can use the "-i" option,
       which ensures missing auxiliary files are copied to the build
       host.
@@ -206,9 +203,7 @@ regarding variable behavior:
 .. note::
 
    Regardless of how you set your variables, if you use the "-e" option
-   with
-   make
-   , the variables from the SDK setup script take precedence:
+   with make, the variables from the SDK setup script take precedence:
    ::
 
       $ make -e target
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 2d9d6735a..c158d9ce4 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -111,7 +111,7 @@ roughly consist of:
    :ref:`test-manual/understand-autobuilder:Autobuilder Clone Cache`.
 
    This step has two possible modes of operation. If the build is part
-   of a parent build, its possible that all the repositories needed may
+   of a parent build, it's possible that all the repositories needed may
    already be available, ready in a pre-prepared directory. An "a-quick"
    or "a-full" build would prepare this before starting the other
    sub-target builds. This is done for two reasons:
@@ -130,7 +130,7 @@ roughly consist of:
 
 #. *Call scripts/run-config*
 
-   This is another call into the Helper scripts where its expected that
+   This is another call into the Helper scripts where it's expected that
    the main functionality of this target will be executed.
 
 Autobuilder Technology
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 8ef58182e..3d4efe92d 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -208,7 +208,7 @@ Customizing Pre-Set Data
 ------------------------
 
 The pre-set data for Toaster is easily customizable. You can create the
-``orm/fixtures/custom.xml`` file to customize the values that go into to
+``orm/fixtures/custom.xml`` file to customize the values that go into
 the database. Customization is additive, and can either extend or
 completely replace the existing values.
 
-- 
2.25.1

