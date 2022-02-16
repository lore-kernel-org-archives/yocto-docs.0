Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44BEC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 20:17:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.697.1645042659930775233
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 12:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=fRrQMkRQ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1F62F20BA5D3;
	Wed, 16 Feb 2022 12:17:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1F62F20BA5D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1645042659;
	bh=vGH8JEu1sS402a7rKIoWGLpbICMFZPU0npWh7mFZi2k=;
	h=From:To:Cc:Subject:Date:From;
	b=fRrQMkRQgvLRS0XKgcArRdEKPKYTVwn+/x5l6S8q8+G+sVpPzTfPJYwnT2FFYmx8g
	 FDt2/D08PLZiMe9+2MaF+QLo19+5S086AtUB4l8SztSwrx17lHyQl3FnelR2LhQhaW
	 YcKTXDS6+FthdFAMTj8oo5MVahvwsJ+NSnBGAG1U=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH v2] documentation: Add multiconfig initramfs configuration:
Date: Wed, 16 Feb 2022 13:17:31 -0700
Message-Id: <20220216201731.2699414-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Feb 2022 20:17:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2469

dev-manual/common-tasks.rst: Add section to create an initramfs
image from a separate multiconfig.

ref-manual/variables.rst: Add new variable definitions for
INITRAMFS_DEPLOY_DIR_IMAGE and INITRAMFS_MULTICONFIG

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 documentation/dev-manual/common-tasks.rst | 42 +++++++++++++++++++++++
 documentation/ref-manual/variables.rst    | 17 +++++++++
 2 files changed, 59 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/de=
v-manual/common-tasks.rst
index d35b590ee..dec44d378 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3919,6 +3919,48 @@ Follow these steps to create an initramfs image:
    :term:`INITRAMFS_IMAGE_BUNDLE`
    variable described earlier.
=20
+Bundling an Initramfs Image From a Separate Multiconfig
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+There may be a case where we want to build an initramfs image which does=
 not
+inherit the same distro policy as our main image, for example, we may wa=
nt
+our main image to use ``TCLIBC=3D"glibc"``, but to use ``TCLIBC=3D"musl"=
`` in our initramfs
+image to keep a smaller footprint. However, by performing the steps ment=
ioned
+above the initramfs image will inherit ``TCLIBC=3D"glibc"`` without allo=
wing us
+to override it.
+
+To achieve this, you need to perform some additional steps:
+
+1. *Create a multiconfig for your initramfs image:* You can perform the =
steps
+   on ":ref:`dev-manual/common-tasks:building images for multiple target=
s using multiple configurations`" to create a separate multiconfig.
+   For the sake of simplicity let's assume such multiconfig is called: `=
`initramfscfg.conf`` and
+   contains the variables::
+
+      TMPDIR=3D"${TOPDIR}/tmp-initramfscfg"
+      TCLIBC=3D"musl"
+
+2. *Set additional initramfs variables on your main configuration:*
+   Additionally, on your main configuration (``local.conf``) you need to=
 set the
+   variables::
+
+     INITRAMFS_MULTICONFIG =3D "initramfscfg"
+     INITRAMFS_DEPLOY_DIR_IMAGE =3D "${TOPDIR}/tmp-initramfscfg/deploy/i=
mages/${MACHINE}"
+
+   The variables :term:`INITRAMFS_MULTICONFIG` and :term:`INITRAMFS_DEPL=
OY_DIR_IMAGE`
+   are used to create a multiconfig dependency from the kernel to the :t=
erm:`INITRAMFS_IMAGE`
+   to be built coming from the ``initramfscfg`` multiconfig, and to let =
the
+   buildsystem know where the :term:`INITRAMFS_IMAGE` will be located.
+
+   Building a system with such configuration will build the kernel using=
 the
+   main configuration but the ``do_bundle_initramfs`` task will grab the
+   selected :term:`INITRAMFS_IMAGE` from :term:`INITRAMFS_DEPLOY_DIR_IMA=
GE`
+   instead, resulting in a musl based initramfs image bundled in the ker=
nel
+   but a glibc based main image.
+
+   The same is applicable to avoid inheriting :term:`DISTRO_FEATURES` on=
 :term:`INITRAMFS_IMAGE`
+   or to build a different :term:`DISTRO` for it such as ``poky-tiny``.
+
+
 Building a Tiny System
 ----------------------
=20
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index d4f40b692..caa971393 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3554,6 +3554,13 @@ system and gives an overview of their function and=
 contents.
          even if the toolchain's binaries are strippable, there are othe=
r files
          needed for the build that are not strippable.
=20
+   :term:`INITRAMFS_DEPLOY_DIR_IMAGE`
+      Indicates the deploy directory used by ``do_bundle_initramfs`` whe=
re the
+      :term:`INITRAMFS_IMAGE` will be fetched from.
+      This variable is set by default to ``${DEPLOY_DIR_IMAGE}`` in the
+      :ref:`kernel <ref-classes-kernel>` class and it's only meant to be=
 changed
+      when building an initramfs image from a separate multiconfig via :=
term:`INITRAMFS_MULTICONFIG`.
+
    :term:`INITRAMFS_FSTYPES`
       Defines the format for the output image of an initial RAM filesyst=
em
       (initramfs), which is used during boot. Supported formats are the
@@ -3673,6 +3680,16 @@ system and gives an overview of their function and=
 contents.
       See the :term:`MACHINE` variable for additional
       information.
=20
+   :term:`INITRAMFS_MULTICONFIG`
+      Defines the multiconfig to create a multiconfig dependency to be u=
sed by the :ref:`kernel <ref-classes-kernel>` class.
+
+      This allows the kernel to bundle an :term:`INITRAMFS_IMAGE` coming=
 from
+      a separate multiconfig, this is meant to be used in addition to :t=
erm:`INITRAMFS_DEPLOY_DIR_IMAGE`.
+
+      For more information on how to bundle an initramfs image from a se=
parate
+      multiconfig see the ":ref:`dev-manual/common-tasks:Bundling an Ini=
tramfs Image From a Separate Multiconfig`"
+      section in the Yocto Project Development Tasks Manual.
+
    :term:`INITRAMFS_NAME`
       The base name of the initial RAM filesystem image. This variable i=
s
       set in the ``meta/classes/kernel-artifact-names.bbclass`` file as
--=20
2.25.1


