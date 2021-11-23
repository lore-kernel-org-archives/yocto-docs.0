Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B555C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 18:12:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.14975.1637691177790467758
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 10:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 851301C0003;
	Tue, 23 Nov 2021 18:12:48 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] ref-manual: add more class references
Date: Tue, 23 Nov 2021 19:12:38 +0100
Message-Id: <20211123181239.2057168-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
References: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Nov 2021 18:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2184

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst   |  4 +--
 documentation/ref-manual/structure.rst |  2 +-
 documentation/ref-manual/tasks.rst     |  4 +--
 documentation/ref-manual/variables.rst | 48 ++++++++++++--------------
 4 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 5bc4472e34..95dc185e62 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -570,11 +570,11 @@ be performed using the
 .. note::
 
    The user and group operations added using the
-   extrausers
+   :ref:`extrausers <ref-classes-extrausers>`
    class are not tied to a specific recipe outside of the recipe for the
    image. Thus, the operations can be performed across the image as a
    whole. Use the
-   useradd
+   :ref:`useradd <ref-classes-useradd>`
    class to add user and group configuration to a specific recipe.
 
 Here is an example that uses this class in an image recipe::
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 5f00edb06c..5d2e3a86ef 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -231,7 +231,7 @@ is available via the :term:`TOPDIR` variable.
 -----------------------
 
 The OpenEmbedded build system creates this directory when you enable
-build history via the ``buildhistory`` class file. The directory
+build history via the :ref:`buildhistory <ref-classes-buildhistory>` class file. The directory
 organizes build information into image, packages, and SDK
 subdirectories. For information on the build history feature, see the
 ":ref:`dev-manual/common-tasks:maintaining build output quality`"
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 299969dea4..8d563714a1 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -80,7 +80,7 @@ task runs with the current working directory set to
 Recipes implementing this task should inherit the
 :ref:`deploy <ref-classes-deploy>` class and should write the output
 to ``${``\ :term:`DEPLOYDIR`\ ``}``, which is not to be
-confused with ``${DEPLOY_DIR}``. The ``deploy`` class sets up
+confused with ``${DEPLOY_DIR}``. The :ref:`deploy <ref-classes-deploy>` class sets up
 ``do_deploy`` as a shared state (sstate) task that can be accelerated
 through sstate use. The sstate mechanism takes care of copying the
 output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
@@ -102,7 +102,7 @@ Adding ``do_deploy`` after other tasks works the same way.
 .. note::
 
    You do not need to add ``before do_build`` to the ``addtask`` command
-   (though it is harmless), because the ``base`` class contains the following::
+   (though it is harmless), because the :ref:`base <ref-classes-base>` class contains the following::
 
            do_build[recrdeptask] += "do_deploy"
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 26b56e145c..c30110d916 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -773,7 +773,7 @@ system and gives an overview of their function and contents.
       :ref:`binconfig-disabled <ref-classes-binconfig-disabled>` class,
       this variable specifies binary configuration scripts to disable in
       favor of using ``pkg-config`` to query the information. The
-      ``binconfig-disabled`` class will modify the specified scripts to
+      :ref:`binconfig-disabled <ref-classes-binconfig-disabled>` class will modify the specified scripts to
       return an error so that calls to them can be easily found and
       replaced.
 
@@ -941,13 +941,13 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies whether or not to commit the build
       history output in a local Git repository. If set to "1", this local
-      repository will be maintained automatically by the ``buildhistory``
+      repository will be maintained automatically by the :ref:`buildhistory <ref-classes-buildhistory>`
       class and a commit will be created on every build for changes to each
       top-level subdirectory of the build history output (images, packages,
       and sdk). If you want to track changes to build history over time,
       you should set this value to "1".
 
-      By default, the ``buildhistory`` class does not commit the build
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class does not commit the build
       history output in a local Git repository::
 
          BUILDHISTORY_COMMIT ?= "0"
@@ -964,7 +964,7 @@ system and gives an overview of their function and contents.
       email@host". Providing an email address or host that is not valid
       does not produce an error.
 
-      By default, the ``buildhistory`` class sets the variable as follows::
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the variable as follows::
 
          BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 
@@ -972,9 +972,9 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the directory in which build history
       information is kept. For more information on how the variable works,
-      see the ``buildhistory.class``.
+      see the ``buildhistory.bbclass`` file.
 
-      By default, the ``buildhistory`` class sets the directory as follows::
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the directory as follows::
 
          BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 
@@ -1001,7 +1001,7 @@ system and gives an overview of their function and contents.
          This saves one file per task and lists the SHA-256 checksums for
          each file staged (i.e. the output of the task).
 
-      By default, the ``buildhistory`` class enables the following
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class enables the following
       features::
 
          BUILDHISTORY_FEATURES ?= "image package sdk"
@@ -1017,7 +1017,7 @@ system and gives an overview of their function and contents.
       any file. Specifying an invalid path does not produce an error.
       Consequently, you can include files that might not always be present.
 
-      By default, the ``buildhistory`` class provides paths to the
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class provides paths to the
       following files::
 
          BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
@@ -1030,7 +1030,7 @@ system and gives an overview of their function and contents.
       useful when build history is populated from multiple sources that may not
       all use the same top level directory.
 
-      By default, the ``buildhistory`` class sets the variable as follows::
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the variable as follows::
 
          BUILDHISTORY_PATH_PREFIX_STRIP ?= ""
 
@@ -1049,7 +1049,7 @@ system and gives an overview of their function and contents.
       that you have set up manually using ``git remote`` within the local
       repository.
 
-      By default, the ``buildhistory`` class sets the variable as follows::
+      By default, the :ref:`buildhistory <ref-classes-buildhistory>` class sets the variable as follows::
 
          BUILDHISTORY_PUSH_REPO ?= ""
 
@@ -1323,7 +1323,7 @@ system and gives an overview of their function and contents.
       The default value, which is "CLOSED Proprietary", for
       :term:`COPYLEFT_LICENSE_EXCLUDE` is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the ``archiver`` class.
+      is inherited by the :ref:`archiver <ref-classes-archiver>` class.
 
    :term:`COPYLEFT_LICENSE_INCLUDE`
       A space-separated list of licenses to include in the source archived
@@ -1334,7 +1334,7 @@ system and gives an overview of their function and contents.
 
       The default value is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the ``archiver`` class. The default value includes
+      is inherited by the :ref:`archiver <ref-classes-archiver>` class. The default value includes
       "GPL*", "LGPL*", and "AGPL*".
 
    :term:`COPYLEFT_PN_EXCLUDE`
@@ -1349,7 +1349,7 @@ system and gives an overview of their function and contents.
       The default value, which is "" indicating to not explicitly exclude
       any recipes by name, for :term:`COPYLEFT_PN_EXCLUDE` is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the ``archiver`` class.
+      is inherited by the :ref:`archiver <ref-classes-archiver>` class.
 
    :term:`COPYLEFT_PN_INCLUDE`
       A list of recipes to include in the source archived by the
@@ -1363,7 +1363,7 @@ system and gives an overview of their function and contents.
       The default value, which is "" indicating to not explicitly include
       any recipes by name, for :term:`COPYLEFT_PN_INCLUDE` is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
-      is inherited by the ``archiver`` class.
+      is inherited by the :ref:`archiver <ref-classes-archiver>` class.
 
    :term:`COPYLEFT_RECIPE_TYPES`
       A space-separated list of recipe types to include in the source
@@ -1373,7 +1373,7 @@ system and gives an overview of their function and contents.
 
       The default value, which is "target*", for :term:`COPYLEFT_RECIPE_TYPES`
       is set by the :ref:`copyleft_filter <ref-classes-copyleft_filter>`
-      class, which is inherited by the ``archiver`` class.
+      class, which is inherited by the :ref:`archiver <ref-classes-archiver>` class.
 
    :term:`COPY_LIC_DIRS`
       If set to "1" along with the
@@ -1805,11 +1805,11 @@ system and gives an overview of their function and contents.
    :term:`DEPLOYDIR`
       When inheriting the :ref:`deploy <ref-classes-deploy>` class, the
       :term:`DEPLOYDIR` points to a temporary work area for deployed files that
-      is set in the ``deploy`` class as follows::
+      is set in the :ref:`deploy <ref-classes-deploy>` class as follows::
 
          DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 
-      Recipes inheriting the ``deploy`` class should copy files to be
+      Recipes inheriting the :ref:`deploy <ref-classes-deploy>` class should copy files to be
       deployed into :term:`DEPLOYDIR`, and the class will take care of copying
       them into :term:`DEPLOY_DIR_IMAGE`
       afterwards.
@@ -2293,7 +2293,7 @@ system and gives an overview of their function and contents.
       group configurations to a specific recipe.
 
       The set list of commands you can configure using the
-      :term:`EXTRA_USERS_PARAMS` is shown in the ``extrausers`` class. These
+      :term:`EXTRA_USERS_PARAMS` is shown in the :ref:`extrausers <ref-classes-extrausers>` class. These
       commands map to the normal Unix commands of the same names::
 
          # EXTRA_USERS_PARAMS = "\
@@ -2628,7 +2628,7 @@ system and gives an overview of their function and contents.
    :term:`FONT_PACKAGES`
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable identifies packages containing font files that need to
-      be cached by Fontconfig. By default, the ``fontcache`` class assumes
+      be cached by Fontconfig. By default, the :ref:`fontcache <ref-classes-fontcache>` class assumes
       that fonts are in the recipe's main package (i.e.
       ``${``\ :term:`PN`\ ``}``). Use this variable if fonts you
       need are in a package other than that main package.
@@ -3890,7 +3890,7 @@ system and gives an overview of their function and contents.
       typically append this variable to enable extended image types. An
       example is the "kernel-fitimage", which enables fitImage support and
       resides in ``meta/classes/kernel-fitimage.bbclass``. You can register
-      custom kernel image types with the ``kernel`` class using this
+      custom kernel image types with the :ref:`kernel <ref-classes-kernel>` class using this
       variable.
 
    :term:`KERNEL_DEVICETREE`
@@ -4285,7 +4285,7 @@ system and gives an overview of their function and contents.
       that the :ref:`debian <ref-classes-debian>` class applies its
       naming policy to given a recipe that packages multiple libraries.
 
-      This variable works in conjunction with the ``debian`` class.
+      This variable works in conjunction with the :ref:`debian <ref-classes-debian>` class.
 
    :term:`LIC_FILES_CHKSUM`
       Checksums of the license text in the recipe source code.
@@ -4910,9 +4910,7 @@ system and gives an overview of their function and contents.
 
       See the ``meta/classes/binconfig.bbclass`` in the
       :term:`Source Directory` for details on how this class
-      applies these additional sed command arguments. For general
-      information on the ``binconfig`` class, see the
-      ":ref:`binconfig.bbclass <ref-classes-binconfig>`" section.
+      applies these additional sed command arguments.
 
    :term:`OE_IMPORTS`
       An internal variable used to tell the OpenEmbedded build system what
@@ -6009,7 +6007,7 @@ system and gives an overview of their function and contents.
       names used when installing the Python headers and libraries in
       sysroot (e.g. ``.../python3.3m/...``).
 
-      Recipes that inherit the ``distutils3`` class during cross-builds also
+      Recipes that inherit the :ref:`distutils3 <ref-classes-distutils3>` class during cross-builds also
       use this variable to locate the headers and libraries of the
       appropriate Python that the extension is targeting.
 
-- 
2.25.1


