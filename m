Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50445C7EE22
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1287.1682133609829659111
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 3522AE7473;
	Fri, 21 Apr 2023 23:20:09 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 6668FE744B;
	Fri, 21 Apr 2023 23:20:08 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 07/17] Remove references to package_tar class
Date: Sat, 22 Apr 2023 15:19:43 +1200
Message-Id: <37b5c0fa218092090e6db237ba996ca1739be450.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3858

This has been removed in 4.2.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/overview-manual/concepts.rst |  8 ++---
 documentation/ref-manual/classes.rst       | 27 +----------------
 documentation/ref-manual/tasks.rst         | 11 -------
 documentation/ref-manual/variables.rst     | 35 ++--------------------
 4 files changed, 6 insertions(+), 75 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
index e7551149a1f..6db515e5006 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -638,9 +638,8 @@ package files are kept:
    type sub-folder. Given RPM, IPK, or DEB packaging and tarball
    creation, the
    :term:`DEPLOY_DIR_RPM`,
-   :term:`DEPLOY_DIR_IPK`,
-   :term:`DEPLOY_DIR_DEB`, or
-   :term:`DEPLOY_DIR_TAR`,
+   :term:`DEPLOY_DIR_IPK`, or
+   :term:`DEPLOY_DIR_DEB`
    variables are used, respectively.
=20
 -  :term:`PACKAGE_ARCH`: Defines
@@ -653,9 +652,8 @@ tasks to generate packages and place them into the pa=
ckage holding area
 (e.g. ``do_package_write_ipk`` for IPK packages). See the
 ":ref:`ref-tasks-package_write_deb`",
 ":ref:`ref-tasks-package_write_ipk`",
-":ref:`ref-tasks-package_write_rpm`",
 and
-":ref:`ref-tasks-package_write_tar`"
+":ref:`ref-tasks-package_write_rpm`"
 sections in the Yocto Project Reference Manual for additional
 information. As an example, consider a scenario where an IPK packaging
 manager is being used and there is package architecture support for both
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index f8172e6b290..32494ee09f6 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2025,13 +2025,7 @@ The :ref:`ref-classes-package` class supports gene=
rating packages from a build's
 output. The core generic functionality is in ``package.bbclass``. The
 code specific to particular package types resides in these
 package-specific classes: :ref:`ref-classes-package_deb`,
-:ref:`ref-classes-package_rpm`, :ref:`ref-classes-package_ipk`, and
-:ref:`ref-classes-package_tar`.
-
-.. note::
-
-   The :ref:`ref-classes-package_tar` class is broken and
-   not supported. It is recommended that you do not use this class.
+:ref:`ref-classes-package_rpm`, :ref:`ref-classes-package_ipk`.
=20
 You can control the list of resulting package formats by using the
 :term:`PACKAGE_CLASSES` variable defined in your ``conf/local.conf``
@@ -2121,25 +2115,6 @@ This class inherits the :ref:`ref-classes-package`=
 class and
 is enabled through the :term:`PACKAGE_CLASSES`
 variable in the ``local.conf`` file.
=20
-.. _ref-classes-package_tar:
-
-``package_tar``
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-The :ref:`ref-classes-package_tar` class provides support for creating t=
arballs. The
-class ensures the packages are written out in a tarball format to the
-``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory.
-
-This class inherits the :ref:`ref-classes-package` class and
-is enabled through the :term:`PACKAGE_CLASSES`
-variable in the ``local.conf`` file.
-
-.. note::
-
-   You cannot specify the :ref:`ref-classes-package_tar` class first usi=
ng the
-   :term:`PACKAGE_CLASSES` variable. You must use ``.deb``, ``.ipk``, or=
 ``.rpm``
-   file formats for your image or SDK.
-
 .. _ref-classes-packagedata:
=20
 ``packagedata``
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manua=
l/tasks.rst
index f2b93185afe..0db960b22f8 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -260,17 +260,6 @@ the package feeds area. For more information, see th=
e
 ":ref:`overview-manual/concepts:package feeds`" section in
 the Yocto Project Overview and Concepts Manual.
=20
-.. _ref-tasks-package_write_tar:
-
-``do_package_write_tar``
-------------------------
-
-Creates tarballs and places them in the
-``${``\ :term:`DEPLOY_DIR_TAR`\ ``}`` directory in
-the package feeds area. For more information, see the
-":ref:`overview-manual/concepts:package feeds`" section in
-the Yocto Project Overview and Concepts Manual.
-
 .. _ref-tasks-packagedata:
=20
 ``do_packagedata``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 2efb3f8db7b..bd11b362e5d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1989,25 +1989,6 @@ system and gives an overview of their function and=
 contents.
       ":ref:`overview-manual/concepts:package feeds`" section
       in the Yocto Project Overview and Concepts Manual.
=20
-   :term:`DEPLOY_DIR_TAR`
-      Points to the area that the OpenEmbedded build system uses to plac=
e
-      tarballs that are ready to be used outside of the build system. Th=
is
-      variable applies only when :term:`PACKAGE_CLASSES` contains
-      ":ref:`ref-classes-package_tar`".
-
-      The BitBake configuration file initially defines this variable as =
a
-      sub-folder of :term:`DEPLOY_DIR`::
-
-         DEPLOY_DIR_TAR =3D "${DEPLOY_DIR}/tar"
-
-      The :ref:`ref-classes-package_tar` class uses the
-      :term:`DEPLOY_DIR_TAR` variable to make sure the
-      :ref:`ref-tasks-package_write_tar` task
-      writes TAR packages into the appropriate folder. For more informat=
ion
-      on how packaging works, see the
-      ":ref:`overview-manual/concepts:package feeds`" section
-      in the Yocto Project Overview and Concepts Manual.
-
    :term:`DEPLOYDIR`
       When inheriting the :ref:`ref-classes-deploy` class, the
       :term:`DEPLOYDIR` points to a temporary work area for deployed fil=
es that
@@ -3679,12 +3660,7 @@ system and gives an overview of their function and=
 contents.
       Defines the package type (i.e. DEB, RPM, IPK, or TAR) used by the
       OpenEmbedded build system. The variable is defined appropriately b=
y
       the :ref:`ref-classes-package_deb`, :ref:`ref-classes-package_rpm`=
,
-      :ref:`ref-classes-package_ipk`, or :ref:`ref-classes-package_tar` =
class.
-
-      .. note::
-
-         The ``package_tar`` class is broken and is not supported. It is
-         recommended that you do not use it.
+      or :ref:`ref-classes-package_ipk` class.
=20
       The :ref:`ref-classes-populate-sdk-*` and :ref:`ref-classes-image`
       classes use the :term:`IMAGE_PKGTYPE` for packaging up images and =
SDKs.
@@ -5663,14 +5639,7 @@ system and gives an overview of their function and=
 contents.
       You can provide one or more of the following arguments for the
       variable::
=20
-         PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk packa=
ge_tar"
-
-      .. note::
-
-         While it is a legal option, the :ref:`ref-classes-package_tar`
-         class has limited functionality due to no support for package
-         dependencies by that backend. Therefore, it is recommended that
-         you do not use it.
+         PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
=20
       The build system uses only the first argument in the list as the
       package manager when creating your image or SDK. However, packages
--=20
2.34.1


