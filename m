Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9E5C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 14:12:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19508.1669126350335223325
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 06:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DS4JAfwF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4147A24000F;
	Tue, 22 Nov 2022 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669126348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kto3P8YjT0rxyV0jazj/WmE6Qnu0ykOy8kgwdWwyNcE=;
	b=DS4JAfwFqmsdNy/dvot4XvRNF8mJmnQQND/E2qWRsKSSZLCdXKKvxOj3wp637wBEXkos5u
	v4d+ppH/NPpfPJTr8W0Z1h68LUxksvnn9ZGX7J/Esmf9PrsGIP0pEGtw5MBXLSQUoYNQlH
	DXtnrX4jAgN/x6rcMiNe0lGJ+lbhFa5I1wR68EH00fzVzkxAn1uX+TtN6z0dOdb44jx+ty
	hEWkFVQJFbQcgDCK1IKsMyR/rUKqs42+/oFmJr1ykOEIGRGSJrulFJzpyAGOBwfvmL8tVM
	Bqbf7wfBXEfon4SIRllVNaKHq6MYfBbhW3WcWQjJ2VnOZ6y6fYttWrq+BwF/rw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/3] manuals: fix paragraphs with the "inherit" word
Date: Tue, 22 Nov 2022 15:12:16 +0100
Message-Id: <20221122141217.97681-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122141217.97681-1-michael.opdenacker@bootlin.com>
References: <20221122141217.97681-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Nov 2022 14:12:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3497

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Nothing wrong with this word, but instances of "inherit"
were looked for while looking for class names without references.
Fixing alignment and sometimes syntax.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst     | 60 +++++++------------
 .../migration-guides/migration-1.5.rst        |  4 +-
 .../migration-guides/migration-3.0.rst        |  4 +-
 .../migration-guides/migration-3.3.rst        |  6 +-
 documentation/ref-manual/classes.rst          | 14 ++---
 documentation/ref-manual/qa-checks.rst        | 20 ++++---
 documentation/ref-manual/variables.rst        | 23 ++++---
 .../sdk-manual/appendix-customizing.rst       | 15 +++--
 8 files changed, 64 insertions(+), 82 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 96a6a76180..3ba64e1477 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1703,26 +1703,21 @@ your software is built:
    need to modify the configuration.
 
    When using Autotools, your recipe needs to inherit the
-   :ref:`autotools <ref-classes-autotools>` class
-   and your recipe does not have to contain a
-   :ref:`ref-tasks-configure` task.
-   However, you might still want to make some adjustments. For example,
-   you can set
-   :term:`EXTRA_OECONF` or
-   :term:`PACKAGECONFIG_CONFARGS`
-   to pass any needed configure options that are specific to the recipe.
+   :ref:`autotools <ref-classes-autotools>` class and it does not have to
+   contain a :ref:`ref-tasks-configure` task. However, you might still want to
+   make some adjustments. For example, you can set :term:`EXTRA_OECONF` or
+   :term:`PACKAGECONFIG_CONFARGS` to pass any needed configure options that
+   are specific to the recipe.
 
 -  *CMake:* If your source files have a ``CMakeLists.txt`` file, then
    your software is built using CMake. If this is the case, you just
    need to modify the configuration.
 
    When you use CMake, your recipe needs to inherit the
-   :ref:`cmake <ref-classes-cmake>` class and your
-   recipe does not have to contain a
-   :ref:`ref-tasks-configure` task.
-   You can make some adjustments by setting
-   :term:`EXTRA_OECMAKE` to
-   pass any needed configure options that are specific to the recipe.
+   :ref:`cmake <ref-classes-cmake>` class and it does not have to contain a
+   :ref:`ref-tasks-configure` task. You can make some adjustments by setting
+   :term:`EXTRA_OECMAKE` to pass any needed configure options that are
+   specific to the recipe.
 
    .. note::
 
@@ -1997,9 +1992,8 @@ different ways:
    shutdown of all other programs.
 
    To enable a service using SysVinit, your recipe needs to inherit the
-   :ref:`update-rc.d <ref-classes-update-rc.d>`
-   class. The class helps facilitate safely installing the package on
-   the target.
+   :ref:`update-rc.d <ref-classes-update-rc.d>` class. The class helps
+   facilitate safely installing the package on the target.
 
    You will need to set the
    :term:`INITSCRIPT_PACKAGES`,
@@ -2014,10 +2008,8 @@ different ways:
    https://freedesktop.org/wiki/Software/systemd/.
 
    To enable a service using systemd, your recipe needs to inherit the
-   :ref:`systemd <ref-classes-systemd>` class. See
-   the ``systemd.bbclass`` file located in your :term:`Source Directory`
-   section for
-   more information.
+   :ref:`systemd <ref-classes-systemd>` class. See the ``systemd.bbclass`` file
+   located in your :term:`Source Directory` section for more information.
 
 Packaging
 ---------
@@ -2370,8 +2362,7 @@ Autotooled Package
 
 Applications that use Autotools such as ``autoconf`` and ``automake``
 require a recipe that has a source archive listed in :term:`SRC_URI` and
-also inherit the
-:ref:`autotools <ref-classes-autotools>` class,
+also inherit the :ref:`autotools <ref-classes-autotools>` class,
 which contains the definitions of all the steps needed to build an
 Autotool-based application. The result of the build is automatically
 packaged. And, if the application uses NLS for localization, packages
@@ -4404,13 +4395,10 @@ where the development occurs. You want the recipe's
 :term:`SRC_URI` variable to point to
 the external directory and use it as is, not copy it.
 
-To build from software that comes from an external source, all you need
-to do is inherit the
-:ref:`externalsrc <ref-classes-externalsrc>` class
-and then set the
-:term:`EXTERNALSRC` variable to
-point to your external source code. Here are the statements to put in
-your ``local.conf`` file::
+To build from software that comes from an external source, all you need to do
+is inherit the :ref:`externalsrc <ref-classes-externalsrc>` class and then set
+the :term:`EXTERNALSRC` variable to point to your external source code. Here
+are the statements to put in your ``local.conf`` file::
 
    INHERIT += "externalsrc"
    EXTERNALSRC:pn-myrecipe = "path-to-your-source-tree"
@@ -4494,8 +4482,7 @@ directory:
 1. *Using Local Files Only:* Inside your ``local.conf`` file, add the
    :term:`SOURCE_MIRROR_URL` variable, inherit the
    :ref:`own-mirrors <ref-classes-own-mirrors>` class, and use the
-   :term:`BB_NO_NETWORK` variable to your ``local.conf``.
-   ::
+   :term:`BB_NO_NETWORK` variable to your ``local.conf``::
 
       SOURCE_MIRROR_URL ?= "file:///home/your-download-dir/"
       INHERIT += "own-mirrors"
@@ -7441,8 +7428,7 @@ In order to enable a recipe to run installed ptests on target hardware,
 you need to prepare the recipes that build the packages you want to
 test. Here is what you have to do for each recipe:
 
--  *Be sure the recipe inherits
-   the* :ref:`ptest <ref-classes-ptest>` *class:*
+-  *Be sure the recipe inherits the* :ref:`ptest <ref-classes-ptest>` *class:*
    Include the following line in each recipe::
 
       inherit ptest
@@ -8868,8 +8854,7 @@ You can start the tests automatically or manually:
       bitbake core-image-sato
 
 -  *Manually running tests:* To manually run the tests, first globally
-   inherit the
-   :ref:`testimage <ref-classes-testimage>` class
+   inherit the :ref:`testimage <ref-classes-testimage>` class
    by editing your ``local.conf`` file::
 
       INHERIT += "testimage"
@@ -9287,8 +9272,7 @@ In addition to variable values, the output of the ``bitbake -e`` and
    classes included globally, recursively listing the files they include
    or inherit in turn. Much of the behavior of the OpenEmbedded build
    system (including the behavior of the :ref:`ref-manual/tasks:normal recipe build tasks`) is
-   implemented in the
-   :ref:`base <ref-classes-base>` class and the
+   implemented in the :ref:`base <ref-classes-base>` class and the
    classes it inherits, rather than being built into BitBake itself.
 
 -  After the variable values, all functions appear in the output. For
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index b47980dc67..ad7e239eaf 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -221,8 +221,8 @@ Task Recipes
 
 The previously deprecated ``task.bbclass`` has now been dropped. For
 recipes that previously inherited from this class, you should rename
-them from ``task-*`` to ``packagegroup-*`` and inherit packagegroup
-instead.
+them from ``task-*`` to ``packagegroup-*`` and inherit
+:ref:`packagegroup <ref-classes-packagegroup>` instead.
 
 For more information, see the ":ref:`ref-classes-packagegroup`" section.
 
diff --git a/documentation/migration-guides/migration-3.0.rst b/documentation/migration-guides/migration-3.0.rst
index 95a33d4dd4..107d2b8797 100644
--- a/documentation/migration-guides/migration-3.0.rst
+++ b/documentation/migration-guides/migration-3.0.rst
@@ -259,7 +259,9 @@ The following miscellaneous changes have occurred.
 
 -  The ``gnome`` class has been removed because it now does very little.
    You should update recipes that previously inherited this class to do
-   the following: inherit gnomebase gtk-icon-cache gconf mime
+   the following::
+
+      inherit gnomebase gtk-icon-cache gconf mime
 
 -  The ``meta/recipes-kernel/linux/linux-dtb.inc`` file has been
    removed. This file was previously deprecated in favor of setting
diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index d110aacd81..e8e5935e19 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -99,9 +99,9 @@ variable so that recipes can specify it explicitly, for example::
 
 Recipes that inherit from ``distutils3`` (or
 :ref:`setuptools3 <ref-classes-setuptools3>` which itself inherits
-``distutils3``) that also set :term:`S` to
-point to a Python module within a subdirectory in the aforementioned
-manner should be changed to set ``DISTUTILS_SETUP_PATH`` instead.
+``distutils3``) that also set :term:`S` to point to a Python module within a
+subdirectory in the aforementioned manner should be changed to set
+``DISTUTILS_SETUP_PATH`` instead.
 
 
 .. _migration-3.3-bitbake:
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3a13cf56ef..3aab8290a0 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -210,9 +210,8 @@ information.
 An alternative version of the :ref:`binconfig <ref-classes-binconfig>`
 class, which disables binary configuration scripts by making them return
 an error in favor of using ``pkg-config`` to query the information. The
-scripts to be disabled should be specified using the
-:term:`BINCONFIG` variable within the recipe inheriting
-the class.
+scripts to be disabled should be specified using the :term:`BINCONFIG`
+variable within the recipe inheriting the class.
 
 .. _ref-classes-buildhistory:
 
@@ -580,8 +579,7 @@ By default, the OpenEmbedded build system uses the :term:`S`
 and :term:`B` variables to locate unpacked recipe source code
 and to build it, respectively. When your recipe inherits the
 :ref:`externalsrc <ref-classes-externalsrc>` class, you use the
-:term:`EXTERNALSRC` and
-:term:`EXTERNALSRC_BUILD` variables to
+:term:`EXTERNALSRC` and :term:`EXTERNALSRC_BUILD` variables to
 ultimately define :term:`S` and :term:`B`.
 
 By default, this class expects the source code to support recipe builds
@@ -734,9 +732,9 @@ register and unregister the schemas in the target image.
 ``gettext.bbclass``
 ===================
 
-The :ref:`gettext <ref-classes-gettext>` class provides support for building software that uses
-the GNU ``gettext`` internationalization and localization system. All
-recipes building software that use ``gettext`` should inherit this
+The :ref:`gettext <ref-classes-gettext>` class provides support for building
+software that uses the GNU ``gettext`` internationalization and localization
+system. All recipes building software that use ``gettext`` should inherit this
 class.
 
 .. _ref-classes-github-releases:
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 3947dcfc17..1a768aac93 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -579,10 +579,10 @@ Errors and Warnings
 - ``package contains mime types but does not inherit mime: <packagename> path '<file>' [mime]``
 
    The specified package contains mime type files (``.xml`` files in
-   ``${datadir}/mime/packages``) and yet does not inherit the mime
-   class which will ensure that these get properly installed. Either
-   add ``inherit mime`` to the recipe or remove the files at the
-   :ref:`ref-tasks-install` step if they are not needed.
+   ``${datadir}/mime/packages``) and yet does not inherit the
+   :ref:`mime <ref-classes-mime>` class which will ensure that these get
+   properly installed. Either add ``inherit mime`` to the recipe or remove the
+   files at the :ref:`ref-tasks-install` step if they are not needed.
 
 
 .. _qa-check-mime-xdg:
@@ -620,11 +620,13 @@ Errors and Warnings
 
 - ``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
 
-    This check ensures that if one of the variables that the :ref:`features_check <ref-classes-features_check>`
-    class supports (e.g. :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
-    inherits ``features_check`` in order for the requirement to actually work. If
-    you are seeing this message, either add ``inherit features_check`` to your recipe
-    or remove the reference to the variable if it is not needed.
+    This check ensures that if one of the variables that the
+    :ref:`features_check <ref-classes-features_check>` class supports (e.g.
+    :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
+    inherits :ref:`features_check <ref-classes-features_check>` in order for
+    the requirement to actually work. If you are seeing this message, either
+    add ``inherit features_check`` to your recipe or remove the reference to
+    the variable if it is not needed.
 
 
 .. _qa-check-missing-update-alternatives:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ca62365cc3..8b54420d95 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -126,8 +126,7 @@ system and gives an overview of their function and contents.
       ":ref:`ref-classes-update-alternatives`" section.
 
    :term:`ANY_OF_DISTRO_FEATURES`
-      When inheriting the
-      :ref:`features_check <ref-classes-features_check>`
+      When inheriting the :ref:`features_check <ref-classes-features_check>`
       class, this variable identifies a list of distribution features where
       at least one must be enabled in the current configuration in order
       for the OpenEmbedded build system to build the recipe. In other words,
@@ -215,12 +214,11 @@ system and gives an overview of their function and contents.
 
       If you use the previous statement to retrieve the latest version of
       software, you need to be sure :term:`PV` contains
-      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you
-      have a kernel recipe that inherits the
-      :ref:`kernel <ref-classes-kernel>` class and you use the previous
-      statement. In this example, ``${SRCPV}`` does not automatically get
-      into :term:`PV`. Consequently, you need to change :term:`PV` in your recipe
-      so that it does contain ``${SRCPV}``.
+      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
+      recipe that inherits the :ref:`kernel <ref-classes-kernel>` class and you
+      use the previous statement. In this example, ``${SRCPV}`` does not
+      automatically get into :term:`PV`. Consequently, you need to change
+      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
 
       For more information see the
       ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
@@ -3566,9 +3564,9 @@ system and gives an overview of their function and contents.
 
          IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
-      Recipes inheriting the ``image`` class should copy files to be
-      deployed into :term:`IMGDEPLOYDIR`, and the class will take care of
-      copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
+      Recipes inheriting the :ref:`image <ref-classes-image>` class should copy
+      files to be deployed into :term:`IMGDEPLOYDIR`, and the class will take
+      care of copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
 
    :term:`INC_PR`
       Helps define the recipe revision for recipes that share a common
@@ -6542,8 +6540,7 @@ system and gives an overview of their function and contents.
       section.
 
    :term:`REQUIRED_DISTRO_FEATURES`
-      When inheriting the
-      :ref:`features_check <ref-classes-features_check>`
+      When inheriting the :ref:`features_check <ref-classes-features_check>`
       class, this variable identifies distribution features that must exist
       in the current configuration in order for the OpenEmbedded build
       system to build the recipe. In other words, if the
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 66218fccd6..dfd51bda1c 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -44,14 +44,13 @@ build system applies them against ``local.conf`` and ``auto.conf``:
    :term:`ESDK_LOCALCONF_ALLOW` overrides either of the previous two
    filters. The default value is blank.
 
--  Classes inherited globally with
-   :term:`INHERIT` that are listed in
-   :term:`ESDK_CLASS_INHERIT_DISABLE`
-   are disabled. Using :term:`ESDK_CLASS_INHERIT_DISABLE` to disable these
-   classes is the typical method to disable classes that are problematic
-   or unnecessary in the SDK context. The default value disables the
-   :ref:`buildhistory <ref-classes-buildhistory>`
-   and :ref:`icecc <ref-classes-icecc>` classes.
+-  Classes inherited globally with :term:`INHERIT` that are listed in
+   :term:`ESDK_CLASS_INHERIT_DISABLE` are disabled. Using
+   :term:`ESDK_CLASS_INHERIT_DISABLE` to disable these classes is the typical
+   method to disable classes that are problematic or unnecessary in the SDK
+   context. The default value disables the
+   :ref:`buildhistory <ref-classes-buildhistory>` and
+   :ref:`icecc <ref-classes-icecc>` classes.
 
 Additionally, the contents of ``conf/sdk-extra.conf``, when present, are
 appended to the end of ``conf/local.conf`` within the produced SDK,
-- 
2.34.1


