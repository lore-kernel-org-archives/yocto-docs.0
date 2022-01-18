Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39508C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 18:28:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.962.1642530486248279866
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 10:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BDCF91C000E;
	Tue, 18 Jan 2022 18:28:03 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: improve references to classes
Date: Tue, 18 Jan 2022 19:28:01 +0100
Message-Id: <20220118182801.3475083-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jan 2022 18:28:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2427

- Simplify references to class sections, by replacing references such as
  :ref:`image.bbclass <ref-classes-image>`
  by
  :ref:`ref-classes-image`

  That's equivalent, because the class sections always called <class>.bbclass

- Adding references to class sections, by replacing strings such as
  ``image.bbclass``
  by
  :ref:`ref-classes-image`

- Simplifying a few class section links

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst     |  5 ++---
 .../migration-guides/migration-1.3.rst        |  2 +-
 .../migration-guides/migration-1.5.rst        |  4 ++--
 .../migration-guides/migration-2.2.rst        |  2 +-
 .../migration-guides/migration-2.3.rst        |  3 +--
 .../migration-guides/migration-3.5.rst        |  2 +-
 documentation/ref-manual/release-process.rst  |  6 +++---
 documentation/ref-manual/structure.rst        | 11 +++++-----
 documentation/ref-manual/variables.rst        | 20 +++++++++----------
 9 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index d465c2f440..2060acd7f2 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -4393,7 +4393,7 @@ This next example shows how to accomplish the same thing by setting
    locally inherit the :ref:`externalsrc <ref-classes-externalsrc>`
    class.
 
-By default, ``externalsrc.bbclass`` builds the source code in a
+By default, :ref:`ref-classes-externalsrc` builds the source code in a
 directory separate from the external source directory as specified by
 :term:`EXTERNALSRC`. If you need
 to have the source built in the same directory in which it resides, or
@@ -6039,8 +6039,7 @@ system to make your images more secure:
    :ref:`extrausers <ref-classes-extrausers>`
    class, which is the preferred method. For an example on how to set up
    both root and user passwords, see the
-   ":ref:`extrausers.bbclass <ref-classes-extrausers>`"
-   section.
+   ":ref:`ref-classes-extrausers`" section.
 
    .. note::
 
diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index 9a1539172e..6a1755d1dc 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -110,7 +110,7 @@ references in your own recipes and configurations as they could be
 removed in future releases. You should also rename any custom ``task-*``
 recipes to ``packagegroup-*``, and change them to inherit
 ``packagegroup`` instead of ``task``, as well as taking the opportunity
-to remove anything now handled by ``packagegroup.bbclass``, such as
+to remove anything now handled by :ref:`ref-classes-packagegroup`, such as
 providing ``-dev`` and ``-dbg`` packages, setting
 :term:`LIC_FILES_CHKSUM`, and so forth. See the
 :ref:`ref-classes-packagegroup` section for
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 0306b99c65..93db14c3ba 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -240,7 +240,7 @@ Automated Image Testing
 -----------------------
 
 A new automated image testing framework has been added through the
-:ref:`testimage.bbclass <ref-classes-testimage*>` class. This
+:ref:`ref-classes-testimage*` classes. This
 framework replaces the older ``imagetest-qemu`` framework.
 
 You can learn more about performing automated image tests in the
@@ -341,7 +341,7 @@ Following is a list of short entries describing other changes:
 
 -  ``libpam``: Deny all services for the ``OTHER`` entries.
 
--  ``image.bbclass``: Move ``runtime_mapping_rename`` to avoid conflict
+-  :ref:`ref-classes-image`: Move ``runtime_mapping_rename`` to avoid conflict
    with ``multilib``. See :yocto_bugs:`YOCTO #4993 </show_bug.cgi?id=4993>`
    in Bugzilla for more information.
 
diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index a6c1a4aa48..3e35b2b8aa 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -439,7 +439,7 @@ The following miscellaneous changes have occurred:
 
 -  ``packagegroup-core-tools-testapps``: Removed Piglit.
 
--  :ref:`image.bbclass <ref-classes-image>`: Renamed COMPRESS(ION) to CONVERSION. This change
+-  :ref:`ref-classes-image`: Renamed COMPRESS(ION) to CONVERSION. This change
    means that ``COMPRESSIONTYPES``, ``COMPRESS_DEPENDS`` and
    ``COMPRESS_CMD`` are deprecated in favor of ``CONVERSIONTYPES``,
    ``CONVERSION_DEPENDS`` and ``CONVERSION_CMD``. The ``COMPRESS*``
diff --git a/documentation/migration-guides/migration-2.3.rst b/documentation/migration-guides/migration-2.3.rst
index 0b6b33d2cb..59271abbc0 100644
--- a/documentation/migration-guides/migration-2.3.rst
+++ b/documentation/migration-guides/migration-2.3.rst
@@ -304,8 +304,7 @@ The following package management changes took place:
    This change was made because too many places in DNF/RPM4 stack
    already make that assumption. Only the filenames and the architecture
    tag has changed. Nothing else has changed in OE-core system,
-   particularly in the :ref:`allarch.bbclass <ref-classes-allarch>`
-   class.
+   particularly in the :ref:`ref-classes-allarch` class.
 
 -  Signing of remote package feeds using ``PACKAGE_FEED_SIGN`` is not
    currently supported. This issue will be fully addressed in a future
diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index df15487b10..8c2a7d2c65 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -52,5 +52,5 @@ Recipe changes
   and :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:removal (override style syntax)`.
 
 - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
-  which use :term:`PKG` renaming such as :ref:`debian.bbclass <ref-classes-debian>`.
+  which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
 
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index ab143f7df0..8acb4b8e09 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -117,17 +117,17 @@ consists of the following pieces:
 -  ``bitbake-selftest``: A standalone command that runs unit tests on
    key pieces of BitBake and its fetchers.
 
--  :ref:`sanity.bbclass <ref-classes-sanity>`: This automatically
+-  :ref:`ref-classes-sanity`: This automatically
    included class checks the build environment for missing tools (e.g.
    ``gcc``) or common misconfigurations such as
    :term:`MACHINE` set incorrectly.
 
--  :ref:`insane.bbclass <ref-classes-insane>`: This class checks the
+-  :ref:`ref-classes-insane`: This class checks the
    generated output from builds for sanity. For example, if building for
    an ARM target, did the build produce ARM binaries. If, for example,
    the build produced PPC binaries then there is a problem.
 
--  :ref:`testimage.bbclass <ref-classes-testimage*>`: This class
+-  :ref:`ref-classes-testimage*`: This class
    performs runtime testing of images after they are built. The tests
    are usually used with :doc:`QEMU </dev-manual/qemu>`
    to boot the images and check the combined runtime result boot
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 5d2e3a86ef..262b041ea6 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -667,16 +667,17 @@ Yocto Project. Metadata has several important subdivisions:
 
 This directory contains the ``*.bbclass`` files. Class files are used to
 abstract common code so it can be reused by multiple packages. Every
-package inherits the ``base.bbclass`` file. Examples of other important
-classes are ``autotools.bbclass``, which in theory allows any
+package inherits the :ref:`ref-classes-base` file. Examples of other important
+classes are :ref:`ref-classes-autotools`, which in theory allows any
 Autotool-enabled package to work with the Yocto Project with minimal
-effort. Another example is ``kernel.bbclass`` that contains common code
+effort. Another example is :ref:`ref-classes-kernel` that contains common code
 and functions for working with the Linux kernel. Functions like image
 generation or packaging also have their specific class files such as
-``image.bbclass``, ``rootfs_*.bbclass`` and ``package*.bbclass``.
+:ref:`ref-classes-image`, :ref:`ref-classes-rootfs*` and
+:ref:`package*.bbclass <ref-classes-package>`.
 
 For reference information on classes, see the
-":ref:`ref-manual/classes:Classes`" chapter.
+":doc:`/ref-manual/classes`" chapter.
 
 .. _structure-meta-conf:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b0621168ae..adb104e202 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -971,7 +971,7 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the directory in which build history
       information is kept. For more information on how the variable works,
-      see the ``buildhistory.bbclass`` file.
+      see the :ref:`ref-classes-buildhistory` class.
 
       By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the directory as follows::
 
@@ -2162,8 +2162,7 @@ system and gives an overview of their function and contents.
       :term:`S` variable, which is what the OpenEmbedded build
       system uses to locate unpacked recipe source code.
 
-      For more information on ``externalsrc.bbclass``, see the
-      ":ref:`ref-classes-externalsrc`" section. You
+      See the ":ref:`ref-classes-externalsrc`" section for details. You
       can also find information on how to use this variable in the
       ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
@@ -2176,8 +2175,7 @@ system and gives an overview of their function and contents.
       which is what the OpenEmbedded build system uses to locate the Build
       Directory.
 
-      For more information on ``externalsrc.bbclass``, see the
-      ":ref:`ref-classes-externalsrc`" section. You
+      See the ":ref:`ref-classes-externalsrc`" section for details. You
       can also find information on how to use this variable in the
       ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
@@ -2501,7 +2499,7 @@ system and gives an overview of their function and contents.
       :term:`SRC_URI` statements.
 
       The default value for the :term:`FILESPATH` variable is defined in the
-      ``base.bbclass`` class found in ``meta/classes`` in the
+      :ref:`ref-classes-base` class found in ``meta/classes`` in the
       :term:`Source Directory`::
 
          FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", \
@@ -3085,7 +3083,7 @@ system and gives an overview of their function and contents.
       :term:`IMAGE_INSTALL` variable with care to avoid ordering issues.
 
       Image recipes set :term:`IMAGE_INSTALL` to specify the packages to
-      install into an image through ``image.bbclass``. Additionally,
+      install into an image through :ref:`ref-classes-image`. Additionally,
       there are "helper" classes such as the
       :ref:`core-image <ref-classes-core-image>` class which can
       take lists used with :term:`IMAGE_FEATURES` and turn them into
@@ -3118,7 +3116,7 @@ system and gives an overview of their function and contents.
             BitBake operator within the ``/conf/local.conf`` file or from
             within an image recipe is not recommended. Use of this operator
             in these ways can cause ordering issues. Since
-            ``core-image.bbclass`` sets :term:`IMAGE_INSTALL` to a default
+            :ref:`ref-classes-core-image` sets :term:`IMAGE_INSTALL` to a default
             value using the
             :ref:`?= <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:setting a default value (?=)>`
             operator, using a ``+=`` operation against :term:`IMAGE_INSTALL`
@@ -3708,7 +3706,7 @@ system and gives an overview of their function and contents.
       The filename of the initialization script as installed to
       ``${sysconfdir}/init.d``.
 
-      This variable is used in recipes when using ``update-rc.d.bbclass``.
+      This variable is used in recipes when using :ref:`ref-classes-update-rc.d`.
       The variable is mandatory.
 
    :term:`INITSCRIPT_PACKAGES`
@@ -3716,7 +3714,7 @@ system and gives an overview of their function and contents.
       are specified, you need to append the package name to the other
       ``INITSCRIPT_*`` as an override.
 
-      This variable is used in recipes when using ``update-rc.d.bbclass``.
+      This variable is used in recipes when using :ref:`ref-classes-update-rc.d`.
       The variable is optional and defaults to the :term:`PN`
       variable.
 
@@ -6346,7 +6344,7 @@ system and gives an overview of their function and contents.
       In the
       example, the package name (``${PN}-dev``) must appear as it would in
       the :term:`PACKAGES` namespace before any renaming of the output package
-      by classes such as ``debian.bbclass``.
+      by classes such as :ref:`ref-classes-debian`.
 
       BitBake, which the OpenEmbedded build system uses, supports
       specifying versioned recommends. Although the syntax varies depending
-- 
2.25.1


