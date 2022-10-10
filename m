Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DF2C352AA
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4275.1665393876799544918
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=qrZKdBTw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DFEED20ECCB4; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DFEED20ECCB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=FuYw/ee7k/b7a6mvx976kVpkL6yovKUKhSF+3FZRHTk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qrZKdBTwLB4S7S8N1ZxVGTbJ/aiVDJ8y81zOAgKptcpEwE6nzCpdLUEesaCVs+Obf
	 FJjKWlNyXVdtXrWIiFVONI4UL/0+kVCecuLe9qQXxbSni9Dj+2PbkarZJJqHBzzIeN
	 jzhv+00r13w9YzmeN2hld4Nsbjga6t49pqDyp3mc=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 23/34] Update documentation for classes split
Date: Mon, 10 Oct 2022 02:24:09 -0700
Message-Id: 
 <c0287d22d62da49e6c6101c70f3fa000d771c91b.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3326

From: Paul Eggleton <paul.eggleton@microsoft.com>

* Make reference to meta/classes* instead of just meta/classes
* Update each reference to the path where the class has moved
* Add a brief explanation to the classes reference explaining the split
* Add a note to INHERIT, INHERIT_DISTRO, IMAGE_CLASSES and USER_CLASSES
  variable glossary entries mentioning where the specified classes must
  be located. I contemplated adding the same note to PACKAGE_CLASSES
  but decided against it, as it has a very specific usage and such a
  note might distract from the narrative of that entry.
* Also trim the IMAGE_CLASSES entry which was quite outdated.
* INHERIT += no longer works with testimage so drop the note about that

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/dev-manual/common-tasks.rst  |  4 +-
 documentation/overview-manual/concepts.rst |  4 +-
 documentation/ref-manual/classes.rst       | 20 ++++++----
 documentation/ref-manual/faq.rst           |  2 +-
 documentation/ref-manual/structure.rst     |  6 +--
 documentation/ref-manual/tasks.rst         |  4 +-
 documentation/ref-manual/variables.rst     | 59 ++++++++++++++++--------------
 7 files changed, 53 insertions(+), 46 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 68ce2b8..0d4e814 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -973,7 +973,7 @@ a recipe and using :term:`EXTRA_IMAGE_FEATURES` from within your
 :term:`Build Directory`.
 
 To understand how these features work, the best reference is
-:ref:`meta/classes/image.bbclass <ref-classes-image>`.
+:ref:`meta/classes-recipe/image.bbclass <ref-classes-image>`.
 This class lists out the available
 :term:`IMAGE_FEATURES` of which most map to package groups while some, such
 as ``debug-tweaks`` and ``read-only-rootfs``, resolve as general
@@ -6889,7 +6889,7 @@ multiple times if you have more than one set of modules to package.
 For more examples that show how to use ``do_split_packages``, see the
 ``connman.inc`` file in the ``meta/recipes-connectivity/connman/``
 directory of the ``poky`` :ref:`source repository <overview-manual/development-environment:yocto project source repositories>`. You can
-also find examples in ``meta/classes/kernel.bbclass``.
+also find examples in ``meta/classes-recipe/kernel.bbclass``.
 
 Following is a reference that shows ``do_split_packages`` mandatory and
 optional arguments::
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 35d6feb..a978e2c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -853,7 +853,7 @@ This step in the build process consists of the following tasks:
    variables. For information on how this variable works within that
    class, see the
    :ref:`autotools <ref-classes-autotools>` class
-   :yocto_git:`here </poky/tree/meta/classes/autotools.bbclass>`.
+   :yocto_git:`here </poky/tree/meta/classes-recipe/autotools.bbclass>`.
 
 -  *do_compile*: Once a configuration task has been satisfied,
    BitBake compiles the source using the
@@ -931,7 +931,7 @@ The :term:`FILES` variable defines the
 files that go into each package in
 :term:`PACKAGES`. If you want
 details on how this is accomplished, you can look at
-:yocto_git:`package.bbclass </poky/tree/meta/classes/package.bbclass>`.
+:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bbclass>`.
 
 Depending on the type of packages being created (RPM, DEB, or IPK), the
 :ref:`do_package_write_* <ref-tasks-package_write_deb>`
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0a83d04..652c2f3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -13,8 +13,14 @@ some default behavior.
 
 Any :term:`Metadata` usually found in a recipe can also be
 placed in a class file. Class files are identified by the extension
-``.bbclass`` and are usually placed in a ``classes/`` directory beneath
-the ``meta*/`` directory found in the :term:`Source Directory`.
+``.bbclass`` and are usually placed in one of a set of subdirectories
+beneath the ``meta*/`` directory found in the :term:`Source Directory`:
+
+  - ``classes-recipe/`` - classes intended to be inherited by recipes
+    individually
+  - ``classes-global/`` - classes intended to be inherited globally
+  - ``classes/`` - classes whose usage context is not clearly defined
+
 Class files can also be pointed to by
 :term:`BUILDDIR` (e.g. ``build/``) in the same way as
 ``.conf`` files in the ``conf`` directory. Class files are searched for
@@ -22,7 +28,7 @@ in :term:`BBPATH` using the same method by which ``.conf``
 files are searched.
 
 This chapter discusses only the most useful and important classes. Other
-classes do exist within the ``meta/classes`` directory in the Source
+classes do exist within the ``meta/classes*`` directories in the Source
 Directory. You can reference the ``.bbclass`` files directly for more
 information.
 
@@ -2777,11 +2783,9 @@ images using QEMU and on actual hardware. The classes handle loading the
 tests and starting the image. To use the classes, you need to perform
 steps to set up the environment.
 
-.. note::
+To enable this class, add the following to your configuration::
 
-   Best practices include using :term:`IMAGE_CLASSES` rather than
-   :term:`INHERIT` to inherit the ``testimage`` class for automated image
-   testing.
+   IMAGE_CLASSES += "testimage"
 
 The tests are commands that run on the target system over ``ssh``. Each
 test is written in Python and makes use of the ``unittest`` module.
@@ -2936,7 +2940,7 @@ To use this class, you need to define a number of variables:
 These variables list alternative commands needed by a package, provide
 pathnames for links, default links for targets, and so forth. For
 details on how to use this class, see the comments in the
-:yocto_git:`update-alternatives.bbclass </poky/tree/meta/classes/update-alternatives.bbclass>`
+:yocto_git:`update-alternatives.bbclass </poky/tree/meta/classes-recipe/update-alternatives.bbclass>`
 file.
 
 .. note::
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index af49d57..84affdd 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -109,7 +109,7 @@ I prevent this?
 but make sure the package is manually marked as machine-specific for the
 case that needs it. The code that handles
 :term:`SRC_URI_OVERRIDES_PACKAGE_ARCH` is in the
-``meta/classes/base.bbclass`` file.
+``meta/classes-global/base.bbclass`` file.
 
 **Q:** I'm behind a firewall and need to use a proxy server. How do I do
 that?
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 533745b..fe27d17 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -669,10 +669,10 @@ Yocto Project. Metadata has several important subdivisions:
 
 .. _structure-meta-classes:
 
-``meta/classes/``
------------------
+``meta/classes*/``
+------------------
 
-This directory contains the ``*.bbclass`` files. Class files are used to
+These directories contain the ``*.bbclass`` files. Class files are used to
 abstract common code so it can be reused by multiple packages. Every
 package inherits the :ref:`ref-classes-base` file. Examples of other important
 classes are :ref:`ref-classes-autotools`, which in theory allows any
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index d4408d1..b17c09c 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -190,8 +190,8 @@ that either directly or indirectly depend on the installed files (e.g.
    -  The ``cp`` command with the ``--no-preserve=ownership`` option.
 
    -  The ``tar`` command with the ``--no-same-owner`` option. See the
-      ``bin_package.bbclass`` file in the ``meta/classes`` directory of
-      the :term:`Source Directory` for an example.
+      ``bin_package.bbclass`` file in the ``meta/classes-recipe``
+      subdirectory of the :term:`Source Directory` for an example.
 
 .. _ref-tasks-install_ptest_base:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ec2e326..c2e75d0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -815,7 +815,7 @@ system and gives an overview of their function and contents.
          and `glob <https://docs.python.org/3/library/glob.html>`__.
 
       For more information on how this variable works, see
-      ``meta/classes/binconfig.bbclass`` in the :term:`Source Directory`.
+      ``meta/classes-recipe/binconfig.bbclass`` in the :term:`Source Directory`.
       You can also find general
       information on the class in the
       ":ref:`ref-classes-binconfig`" section.
@@ -2104,7 +2104,7 @@ system and gives an overview of their function and contents.
       available are xz and bz2.
 
       For information on policies and on how to use this variable, see the
-      comments in the ``meta/classes/compress_doc.bbclass`` file.
+      comments in the ``meta/classes-recipe/compress_doc.bbclass`` file.
 
    :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
@@ -2272,7 +2272,7 @@ system and gives an overview of their function and contents.
       variable tells the OpenEmbedded build system to prefer the installed
       external tools. See the
       :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
-      ``meta/classes`` to see how the variable is used.
+      ``meta/classes-recipe`` to see how the variable is used.
 
    :term:`EXTERNALSRC`
       When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
@@ -2649,7 +2649,7 @@ system and gives an overview of their function and contents.
       :term:`SRC_URI` statements.
 
       The default value for the :term:`FILESPATH` variable is defined in the
-      :ref:`ref-classes-base` class found in ``meta/classes`` in the
+      :ref:`ref-classes-base` class found in ``meta/classes-global`` in the
       :term:`Source Directory`::
 
          FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
@@ -3139,16 +3139,11 @@ system and gives an overview of their function and contents.
       ":term:`DISTRO` :term:`DISTRO_VERSION`".
 
    :term:`IMAGE_CLASSES`
-      A list of classes that all images should inherit. You typically use
-      this variable to specify the list of classes that register the
-      different types of images the OpenEmbedded build system creates.
+      A list of classes that all images should inherit. This is typically used
+      to enable functionality across all image recipes.
 
-      The default value for :term:`IMAGE_CLASSES` is ``image_types``. You can
-      set this variable in your ``local.conf`` or in a distribution
-      configuration file.
-
-      For more information, see ``meta/classes/image_types.bbclass`` in the
-      :term:`Source Directory`.
+      Classes specified in :term:`IMAGE_CLASSES` must be located in the
+      ``classes-recipe/`` or ``classes/`` subdirectories.
 
    :term:`IMAGE_CMD`
       Specifies the command to create the image file for a specific image
@@ -3164,7 +3159,7 @@ system and gives an overview of their function and contents.
       You typically do not need to set this variable unless you are adding
       support for a new image type. For more examples on how to set this
       variable, see the :ref:`image_types <ref-classes-image_types>`
-      class file, which is ``meta/classes/image_types.bbclass``.
+      class file, which is ``meta/classes-recipe/image_types.bbclass``.
 
    :term:`IMAGE_DEVICE_TABLES`
       Specifies one or more files that contain custom device tables that
@@ -3560,7 +3555,7 @@ system and gives an overview of their function and contents.
       - wic.lzma
 
       For more information about these types of images, see
-      ``meta/classes/image_types*.bbclass`` in the :term:`Source Directory`.
+      ``meta/classes-recipe/image_types*.bbclass`` in the :term:`Source Directory`.
 
    :term:`IMAGE_VERSION_SUFFIX`
       Version suffix that is part of the default :term:`IMAGE_NAME` and
@@ -3659,6 +3654,8 @@ system and gives an overview of their function and contents.
       functions in the class or classes are not executed for the base
       configuration and in each individual recipe. The OpenEmbedded build
       system ignores changes to :term:`INHERIT` in individual recipes.
+      Classes inherited using :term:`INHERIT` must be located in the
+      ``classes-global/`` or ``classes/`` subdirectories.
 
       For more information on :term:`INHERIT`, see the
       :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` configuration directive`"
@@ -3668,6 +3665,9 @@ system and gives an overview of their function and contents.
       Lists classes that will be inherited at the distribution level. It is
       unlikely that you want to edit this variable.
 
+      Classes specified in :term:`INHERIT_DISTRO` must be located in the
+      ``classes-global/`` or ``classes/`` subdirectories.
+
       The default value of the variable is set as follows in the
       ``meta/conf/distro/defaultsetup.conf`` file::
 
@@ -3883,7 +3883,7 @@ system and gives an overview of their function and contents.
 
    :term:`INITRAMFS_LINK_NAME`
       The link name of the initial RAM filesystem image. This variable is
-      set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
+      set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
       follows::
 
          INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"
@@ -3909,7 +3909,7 @@ system and gives an overview of their function and contents.
 
    :term:`INITRAMFS_NAME`
       The base name of the initial RAM filesystem image. This variable is
-      set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
+      set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
       follows::
 
          INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
@@ -4119,7 +4119,7 @@ system and gives an overview of their function and contents.
       variable.
 
       The value of :term:`KERNEL_ARTIFACT_NAME`, which is set in the
-      ``meta/classes/kernel-artifact-names.bbclass`` file, has the
+      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file, has the
       following default value::
 
          KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
@@ -4132,7 +4132,7 @@ system and gives an overview of their function and contents.
       :ref:`kernel <ref-classes-kernel>` class should inherit. You
       typically append this variable to enable extended image types. An
       example is the "kernel-fitimage", which enables fitImage support and
-      resides in ``meta/classes/kernel-fitimage.bbclass``. You can register
+      resides in ``meta/classes-recipe/kernel-fitimage.bbclass``. You can register
       custom kernel image types with the :ref:`kernel <ref-classes-kernel>` class using this
       variable.
 
@@ -4162,7 +4162,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_DTB_LINK_NAME`
       The link name of the kernel device tree binary (DTB). This variable
-      is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
+      is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
       follows::
 
          KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
@@ -4178,7 +4178,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_DTB_NAME`
       The base name of the kernel device tree binary (DTB). This variable
-      is set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
+      is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as
       follows::
 
          KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
@@ -4229,7 +4229,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_FIT_LINK_NAME`
       The link name of the kernel flattened image tree (FIT) image. This
-      variable is set in the ``meta/classes/kernel-artifact-names.bbclass``
+      variable is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass``
       file as follows::
 
          KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
@@ -4245,7 +4245,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_FIT_NAME`
       The base name of the kernel flattened image tree (FIT) image. This
-      variable is set in the ``meta/classes/kernel-artifact-names.bbclass``
+      variable is set in the ``meta/classes-recipe/kernel-artifact-names.bbclass``
       file as follows::
 
          KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
@@ -4257,7 +4257,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_IMAGE_LINK_NAME`
       The link name for the kernel image. This variable is set in the
-      ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
+      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
 
          KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
@@ -4285,7 +4285,7 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_IMAGE_NAME`
       The base name of the kernel image. This variable is set in the
-      ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
+      ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
 
          KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
@@ -5020,7 +5020,7 @@ system and gives an overview of their function and contents.
 
    :term:`MODULE_TARBALL_LINK_NAME`
       The link name of the kernel module tarball. This variable is set in
-      the ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
+      the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
 
          MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
 
@@ -5034,7 +5034,7 @@ system and gives an overview of their function and contents.
 
    :term:`MODULE_TARBALL_NAME`
       The base name of the kernel module tarball. This variable is set in
-      the ``meta/classes/kernel-artifact-names.bbclass`` file as follows::
+      the ``meta/classes-recipe/kernel-artifact-names.bbclass`` file as follows::
 
          MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
 
@@ -5169,7 +5169,7 @@ system and gives an overview of their function and contents.
       ``sysroots/`` directory so that all builds that use the script will
       use the correct directories for the cross compiling layout.
 
-      See the ``meta/classes/binconfig.bbclass`` in the
+      See the ``meta/classes-recipe/binconfig.bbclass`` in the
       :term:`Source Directory` for details on how this class
       applies these additional sed command arguments.
 
@@ -8825,6 +8825,9 @@ system and gives an overview of their function and contents.
       A list of classes to globally inherit. These classes are used by the
       OpenEmbedded build system to enable extra features.
 
+      Classes inherited using :term:`USER_CLASSES` must be located in the
+      ``classes-global/`` or ``classes/`` subdirectories.
+
       The default list is set in your ``local.conf`` file::
 
          USER_CLASSES ?= "buildstats"
-- 
1.8.3.1


