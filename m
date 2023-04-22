Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF42C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:06 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1283.1682133605498609040
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id BB09CE644B;
	Fri, 21 Apr 2023 23:20:04 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id E0B55E73C0;
	Fri, 21 Apr 2023 23:20:03 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 03/17] ref-manual: update for IMAGE_MACHINE_SUFFIX addition
Date: Sat, 22 Apr 2023 15:19:39 +1200
Message-Id: <a772618b30db05a33c286a060643e137819ef366.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3854

IMAGE_MACHINE_SUFFIX is a new variable in 4.2, and there were some
associated changes to how IMAGE_NAME, IMAGE_LINK_NAME,
INITRAMFS_IMAGE_NAME and KERNEL_ARTIFACT_NAME are set by default. As a
result, instead of repeating how KERNEL_ARTIFACT_NAME is set by default,
let's just direct people to the entry for that variable so we only have
to update one place.

At the same time I noticed INITRAMFS_IMAGE_NAME  was not documented at
all, so add that in.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 81 ++++++++++++++++----------
 1 file changed, 50 insertions(+), 31 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 12f067e1f4a..02703a39b17 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3583,11 +3583,34 @@ system and gives an overview of their function an=
d contents.
    :term:`IMAGE_LINK_NAME`
       The name of the output image symlink (which does not include
       the version part as :term:`IMAGE_NAME` does). The default value
-      is derived using the :term:`IMAGE_BASENAME` and :term:`MACHINE`
-      variables::
+      is derived using the :term:`IMAGE_BASENAME` and
+      :term:`IMAGE_MACHINE_SUFFIX` variables::
=20
-         IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}"
+         IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
=20
+      .. note::
+
+         It is possible to set this to "" to disable symlink creation,
+         however, you also need to set :term:`IMAGE_NAME` to still have
+         a reasonable value e.g.::
+
+            IMAGE_LINK_NAME =3D ""
+            IMAGE_NAME =3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IM=
AGE_VERSION_SUFFIX}"
+
+   :term:`IMAGE_MACHINE_SUFFIX`
+      Specifies the by default machine-specific suffix for image file na=
mes
+      (before the extension). The default value is set as follows::
+
+         IMAGE_MACHINE_SUFFIX ??=3D "-${MACHINE}"
+
+      The default :term:`DEPLOY_DIR_IMAGE` already has a :term:`MACHINE`
+      subdirectory, so you may find it unnecessary to also include this =
suffix
+      in the name of every image file. If you prefer to remove the suffi=
x you
+      can set this variable to an empty string::
+
+         IMAGE_MACHINE_SUFFIX =3D ""
+
+      (Not to be confused with :term:`IMAGE_NAME_SUFFIX`.)
=20
    :term:`IMAGE_MANIFEST`
       The manifest file for the image. This file lists all the installed
@@ -3608,12 +3631,11 @@ system and gives an overview of their function an=
d contents.
       section in the Yocto Project Overview and Concepts Manual.
=20
    :term:`IMAGE_NAME`
-      The name of the output image files minus the extension. This varia=
ble
-      is derived using the :term:`IMAGE_BASENAME`,
-      :term:`MACHINE`, and :term:`IMAGE_VERSION_SUFFIX`
-      variables::
+      The name of the output image files minus the extension. By default
+      this variable is set using the :term:`IMAGE_LINK_NAME`, and
+      :term:`IMAGE_VERSION_SUFFIX` variables::
=20
-         IMAGE_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SU=
FFIX}"
+         IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
=20
    :term:`IMAGE_NAME_SUFFIX`
       Suffix used for the image output filename --- defaults to ``".root=
fs"``
@@ -4140,6 +4162,19 @@ system and gives an overview of their function and=
 contents.
       :term:`Initramfs`, see the ":ref:`dev-manual/building:building an =
initial ram filesystem (Initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
=20
+   :term:`INITRAMFS_IMAGE_NAME`
+
+      This value needs to stay in sync with :term:`IMAGE_LINK_NAME`, but=
 with
+      :term:`INITRAMFS_IMAGE` instead of :term:`IMAGE_BASENAME`. The def=
ault value
+      is set as follows:
+
+         INITRAMFS_IMAGE_NAME ?=3D "${@['${INITRAMFS_IMAGE}${IMAGE_MACHI=
NE_SUFFIX}', ''][d.getVar('INITRAMFS_IMAGE') =3D=3D '']}"
+
+      That is, if :term:`INITRAMFS_IMAGE` is set, the value of
+      :term:`INITRAMFS_IMAGE_NAME` will be set based upon
+      :term:`INITRAMFS_IMAGE` and :term:`IMAGE_MACHINE_SUFFIX`.
+
+
    :term:`INITRAMFS_LINK_NAME`
       The link name of the initial RAM filesystem image. This variable i=
s
       set in the ``meta/classes-recipe/kernel-artifact-names.bbclass`` f=
ile as
@@ -4174,10 +4209,7 @@ system and gives an overview of their function and=
 contents.
=20
          INITRAMFS_NAME ?=3D "initramfs-${KERNEL_ARTIFACT_NAME}"
=20
-      The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value::
-
-         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${=
IMAGE_VERSION_SUFFIX}"
+      See :term:`KERNEL_ARTIFACT_NAME` for additional information.
=20
    :term:`INITRD`
       Indicates list of filesystem images to concatenate and use as an
@@ -4381,9 +4413,9 @@ system and gives an overview of their function and =
contents.
       ``meta/classes-recipe/kernel-artifact-names.bbclass`` file, has th=
e
       following default value::
=20
-         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${=
IMAGE_VERSION_SUFFIX}"
+         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}${IMAGE_MACHI=
NE_SUFFIX}${IMAGE_VERSION_SUFFIX}"
=20
-      See the :term:`PKGE`, :term:`PKGV`, :term:`PKGR`, :term:`MACHINE`
+      See the :term:`PKGE`, :term:`PKGV`, :term:`PKGR`, :term:`IMAGE_MAC=
HINE_SUFFIX`
       and :term:`IMAGE_VERSION_SUFFIX` variables for additional informat=
ion.
=20
    :term:`KERNEL_CLASSES`
@@ -4441,10 +4473,7 @@ system and gives an overview of their function and=
 contents.
=20
          KERNEL_DTB_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
=20
-      The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value::
-
-         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${=
IMAGE_VERSION_SUFFIX}"
+      See :term:`KERNEL_ARTIFACT_NAME` for additional information.
=20
    :term:`KERNEL_DTC_FLAGS`
       Specifies the ``dtc`` flags that are passed to the Linux kernel bu=
ild
@@ -4507,10 +4536,7 @@ system and gives an overview of their function and=
 contents.
=20
          KERNEL_FIT_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
=20
-      The value of the :term:`KERNEL_ARTIFACT_NAME`
-      variable, which is set in the same file, has the following value::
-
-         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${=
IMAGE_VERSION_SUFFIX}"
+      See :term:`KERNEL_ARTIFACT_NAME` for additional information.
=20
    :term:`KERNEL_IMAGE_LINK_NAME`
       The link name for the kernel image. This variable is set in the
@@ -4546,11 +4572,7 @@ system and gives an overview of their function and=
 contents.
=20
          KERNEL_IMAGE_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
=20
-      The value of the
-      :term:`KERNEL_ARTIFACT_NAME` variable,
-      which is set in the same file, has the following value::
-
-         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${=
IMAGE_VERSION_SUFFIX}"
+      See :term:`KERNEL_ARTIFACT_NAME` for additional information.
=20
    :term:`KERNEL_IMAGETYPE`
       The type of kernel to build for a device, usually set by the machi=
ne
@@ -5299,10 +5321,7 @@ system and gives an overview of their function and=
 contents.
=20
          MODULE_TARBALL_NAME ?=3D "${KERNEL_ARTIFACT_NAME}"
=20
-      The value of the :term:`KERNEL_ARTIFACT_NAME` variable,
-      which is set in the same file, has the following value::
-
-         KERNEL_ARTIFACT_NAME ?=3D "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${=
IMAGE_VERSION_SUFFIX}"
+      See :term:`KERNEL_ARTIFACT_NAME` for additional information.
=20
    :term:`MOUNT_BASE`
       On non-systemd systems (where ``udev-extraconf`` is being used),
--=20
2.34.1


