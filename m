Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A924EC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 17:01:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.10382.1641920464677507489
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 09:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C19EC1BF206;
	Tue, 11 Jan 2022 17:01:02 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: simplify references to class sections
Date: Tue, 11 Jan 2022 17:59:23 +0100
Message-Id: <20220111165923.2243490-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 17:01:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2379

Replace
":ref:`classname.bbclass <ref-classes-classname>`" section
by
":ref:`ref-classes-classname`" section
because each section has "classname.bbclass" as title,
therefore the result is the same.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-1.3.rst        |  2 +-
 .../migration-guides/migration-1.5.rst        |  9 ++----
 .../migration-guides/migration-1.6.rst        |  3 +-
 documentation/ref-manual/qa-checks.rst        |  4 +--
 documentation/ref-manual/tasks.rst            |  2 +-
 documentation/ref-manual/variables.rst        | 29 +++++++++----------
 6 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/documentation/migration-guides/migration-1.3.rst b/documentation/migration-guides/migration-1.3.rst
index afb868e7cb..9a1539172e 100644
--- a/documentation/migration-guides/migration-1.3.rst
+++ b/documentation/migration-guides/migration-1.3.rst
@@ -113,7 +113,7 @@ recipes to ``packagegroup-*``, and change them to inherit
 to remove anything now handled by ``packagegroup.bbclass``, such as
 providing ``-dev`` and ``-dbg`` packages, setting
 :term:`LIC_FILES_CHKSUM`, and so forth. See the
-":ref:`packagegroup.bbclass <ref-classes-packagegroup>`" section for
+:ref:`ref-classes-packagegroup` section for
 further details.
 
 .. _migration-1.3-image-features:
diff --git a/documentation/migration-guides/migration-1.5.rst b/documentation/migration-guides/migration-1.5.rst
index 15b0b43092..0306b99c65 100644
--- a/documentation/migration-guides/migration-1.5.rst
+++ b/documentation/migration-guides/migration-1.5.rst
@@ -87,8 +87,7 @@ The following changes have been made to the package QA checks:
    item not mentioned in :term:`ERROR_QA` or :term:`WARN_QA` would be treated as
    a warning. Consequently, several important items were not already in
    the default value of :term:`WARN_QA`. All of the possible QA checks are
-   now documented in the ":ref:`insane.bbclass <ref-classes-insane>`"
-   section.
+   now documented in the ":ref:`ref-classes-insane`" section.
 
 -  An additional QA check has been added to check if
    ``/usr/share/info/dir`` is being installed. Your recipe should delete
@@ -102,8 +101,7 @@ The following changes have been made to the package QA checks:
    and still wish to have this check performed, you should add
    "version-going-backwards" to your value for one or the other
    variables depending on how you wish it to be handled. See the
-   documented QA checks in the
-   ":ref:`insane.bbclass <ref-classes-insane>`" section.
+   documented QA checks in the ":ref:`ref-classes-insane`" section.
 
 .. _migration-1.5-directory-layout-changes:
 
@@ -222,8 +220,7 @@ recipes that previously inherited from this class, you should rename
 them from ``task-*`` to ``packagegroup-*`` and inherit packagegroup
 instead.
 
-For more information, see the
-":ref:`packagegroup.bbclass <ref-classes-packagegroup>`" section.
+For more information, see the ":ref:`ref-classes-packagegroup`" section.
 
 .. _migration-1.5-busybox:
 
diff --git a/documentation/migration-guides/migration-1.6.rst b/documentation/migration-guides/migration-1.6.rst
index e240038a7b..358086560b 100644
--- a/documentation/migration-guides/migration-1.6.rst
+++ b/documentation/migration-guides/migration-1.6.rst
@@ -222,8 +222,7 @@ Package Tests (ptest) are built but not installed by default. For
 information on using Package Tests, see the
 ":ref:`dev-manual/common-tasks:testing packages with ptest`"
 section in the Yocto Project Development Tasks Manual. For information on the
-``ptest`` class, see the ":ref:`ptest.bbclass <ref-classes-ptest>`"
-section.
+``ptest`` class, see the ":ref:`ref-classes-ptest`" section.
 
 .. _migration-1.6-build-changes:
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 792c099d0c..3364311219 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -28,7 +28,7 @@ error form along with an explanation.
 .. note::
 
    -  At the end of each message, the name of the associated QA test (as
-      listed in the ":ref:`insane.bbclass <ref-classes-insane>`"
+      listed in the ":ref:`ref-classes-insane`"
       section) appears within square brackets.
 
    -  As mentioned, this list of error and warning messages is for QA
@@ -749,7 +749,7 @@ either raise a warning or an error message, using the
 variables, respectively. You can also disable checks within a particular
 recipe using :term:`INSANE_SKIP`. For information on
 how to work with the QA checks, see the
-":ref:`insane.bbclass <ref-classes-insane>`" section.
+":ref:`ref-classes-insane`" section.
 
 .. note::
 
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index d484d08f82..b51462b79a 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -415,7 +415,7 @@ dependencies specified by :term:`DEPENDS`). See the
 
 Removes work files after the OpenEmbedded build system has finished with
 them. You can learn more by looking at the
-":ref:`rm_work.bbclass <ref-classes-rm-work>`" section.
+":ref:`ref-classes-rm-work`" section.
 
 .. _ref-tasks-unpack:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index be496161bd..76831003d1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -56,7 +56,7 @@ system and gives an overview of their function and contents.
          ALTERNATIVE:busybox = "sh sed test bracket"
 
       For more information on the alternatives system, see the
-      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
+      ":ref:`ref-classes-update-alternatives`"
       section.
 
    :term:`ALTERNATIVE_LINK_NAME`
@@ -76,7 +76,7 @@ system and gives an overview of their function and contents.
          If :term:`ALTERNATIVE_LINK_NAME` is not defined, it defaults to ``${bindir}/name``.
 
       For more information on the alternatives system, see the
-      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
+      ":ref:`ref-classes-update-alternatives`"
       section.
 
    :term:`ALTERNATIVE_PRIORITY`
@@ -92,7 +92,7 @@ system and gives an overview of their function and contents.
          ALTERNATIVE_PRIORITY_pkg[name] = "priority"
 
       For more information on the alternatives system, see the
-      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
+      ":ref:`ref-classes-update-alternatives`"
       section.
 
    :term:`ALTERNATIVE_TARGET`
@@ -122,8 +122,7 @@ system and gives an overview of their function and contents.
          task while retaining support for the command if necessary.
 
       For more information on the alternatives system, see the
-      ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
-      section.
+      ":ref:`ref-classes-update-alternatives`" section.
 
    :term:`ANY_OF_DISTRO_FEATURES`
       When inheriting the
@@ -803,7 +802,7 @@ system and gives an overview of their function and contents.
       ``meta/classes/binconfig.bbclass`` in the :term:`Source Directory`.
       You can also find general
       information on the class in the
-      ":ref:`binconfig.bbclass <ref-classes-binconfig>`" section.
+      ":ref:`ref-classes-binconfig`" section.
 
    :term:`BP`
       The base recipe name and version but without any special recipe name
@@ -2079,7 +2078,7 @@ system and gives an overview of their function and contents.
       errors by the OpenEmbedded build system. You set this variable in
       your distribution configuration file. For a list of the checks you
       can control with this variable, see the
-      ":ref:`insane.bbclass <ref-classes-insane>`" section.
+      ":ref:`ref-classes-insane`" section.
 
    :term:`EXCLUDE_FROM_SHLIBS`
       Triggers the OpenEmbedded build system's shared libraries resolver to
@@ -2158,7 +2157,7 @@ system and gives an overview of their function and contents.
       system uses to locate unpacked recipe source code.
 
       For more information on ``externalsrc.bbclass``, see the
-      ":ref:`externalsrc.bbclass <ref-classes-externalsrc>`" section. You
+      ":ref:`ref-classes-externalsrc`" section. You
       can also find information on how to use this variable in the
       ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
@@ -2172,7 +2171,7 @@ system and gives an overview of their function and contents.
       Directory.
 
       For more information on ``externalsrc.bbclass``, see the
-      ":ref:`externalsrc.bbclass <ref-classes-externalsrc>`" section. You
+      ":ref:`ref-classes-externalsrc`" section. You
       can also find information on how to use this variable in the
       ":ref:`dev-manual/common-tasks:building software from an external source`"
       section in the Yocto Project Development Tasks Manual.
@@ -2843,7 +2842,7 @@ system and gives an overview of their function and contents.
    :term:`ICECC_DISABLED`
       Disables or enables the ``icecc`` (Icecream) function. For more
       information on this function and best practices for using this
-      variable, see the ":ref:`icecc.bbclass <ref-classes-icecc>`"
+      variable, see the ":ref:`ref-classes-icecc`"
       section.
 
       Setting this variable to "1" in your ``local.conf`` disables the
@@ -3740,7 +3739,7 @@ system and gives an overview of their function and contents.
 
          INSANE_SKIP:${PN} += "dev-so"
 
-      See the ":ref:`insane.bbclass <ref-classes-insane>`" section for a
+      See the ":ref:`ref-classes-insane`" section for a
       list of the valid QA checks you can specify using this variable.
 
    :term:`INSTALL_TIMEZONE_FILE`
@@ -5090,7 +5089,7 @@ system and gives an overview of their function and contents.
 
       For information on packaging and build performance effects as a
       result of the package manager in use, see the
-      ":ref:`package.bbclass <ref-classes-package>`" section.
+      ":ref:`ref-classes-package`" section.
 
    :term:`PACKAGE_DEBUG_SPLIT_STYLE`
       Determines how to split up and package debug and source information
@@ -6204,7 +6203,7 @@ system and gives an overview of their function and contents.
    :term:`RM_WORK_EXCLUDE`
       With ``rm_work`` enabled, this variable specifies a list of recipes
       whose work directories should not be removed. See the
-      ":ref:`rm_work.bbclass <ref-classes-rm-work>`" section for more
+      ":ref:`ref-classes-rm-work`" section for more
       details.
 
    :term:`ROOT_HOME`
@@ -8016,7 +8015,7 @@ system and gives an overview of their function and contents.
       on enabling, running, and writing these tests, see the
       ":ref:`dev-manual/common-tasks:performing automated runtime testing`"
       section in the Yocto Project Development Tasks Manual and the
-      ":ref:`testimage*.bbclass <ref-classes-testimage*>`" section.
+      ":ref:`ref-classes-testimage*`" section.
 
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
@@ -8675,7 +8674,7 @@ system and gives an overview of their function and contents.
       warnings by the OpenEmbedded build system. You set this variable in
       your distribution configuration file. For a list of the checks you
       can control with this variable, see the
-      ":ref:`insane.bbclass <ref-classes-insane>`" section.
+      ":ref:`ref-classes-insane`" section.
 
    :term:`WKS_FILE`
       Specifies the location of the Wic kickstart file that is used by the
-- 
2.25.1


