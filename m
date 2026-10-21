Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11884.1792590210607836298
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 06:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YC7dRyyF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FE20C6344F
	for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 13:44:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1BBE606E3;
	Wed, 21 Oct 2026 13:43:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C80A103289F5;
	Wed, 21 Oct 2026 15:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792590207; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TU/n1NDSyNwdK7cjpINFamSs8DeRKMeuvXW8HGOPWCo=;
	b=YC7dRyyFspcgIk7N6ECWL3QVyd/3ni/7oLm6H/tL8g20H03PUWlRa+Xvp4sV2u+MHFxyll
	qq/EdEWIYw4WofKqqKDVzQW0Edilak7wVa513VJvc939QYF3R6y1yRNbanXrfNhLCFZLxm
	m19c6TMQaR3APKI/UipVv2BmcfNH78Hjx7h7Cl0BYWEsX53gxKCDN1d/c9zmBhn0lgvTQ8
	u3HFNFrIYf8nU3uf+A+70SCX/w/k5wPlJ3IsQC3FKp5T7MfxbEzdRqWopHIpFOH4Xju7Gp
	Zrn4tZq0njUiGxGPfIk0OPvg77LJSbGeevS275IH8hx+Iy2kG4OhLE/R244izA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 15:43:25 +0200
Message-Id: <DMAK6ZYRTSMW.2Y25CVMPDJ8NI@bootlin.com>
To: <andrej.kozemcak@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 QB_FSINFO variable
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20261021125235.2954-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20261021125235.2954-1-andrej.kozemcak@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 13:43:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10709

On Wed Oct 21, 2026 at 2:52 PM CEST, Andrej Kozemcak via lists.yoctoproject=
.org wrote:
> Added by commit b6c78bddf3 ("runqemu: support rootfs-dbg flag
> in QB_FSINFO") in OE-Core.
> Add documentation for the QB_FSINFO variable, which provides
> additional filesystem metadata to runqemu as a space-separated
> list of fstype:flag entries, covering WIC kernel-in-fs options
[...]

Applied to master-next, thanks!

I've just allowed myself to add a reference to "WIC" with :term: since we
recently added it in the docs, and also fix variable sorting in the glossar=
y:

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index c79d58954..bbf0e6d07 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8205,6 +8205,24 @@ system and gives an overview of their function and c=
ontents.
       filesystem image extension found in :term:`DEPLOY_DIR_IMAGE`. For ex=
ample:
       ``ext4.zst``.
=20
+   :term:`QB_DEFAULT_KERNEL`
+
+      When using ``runqemu``, the :term:`QB_DEFAULT_KERNEL` variable contr=
ols
+      the default Linux kernel image to boot, found in :term:`DEPLOY_DIR_I=
MAGE`. For
+      example: ``bzImage``.
+
+   :term:`QB_DRIVE_TYPE`
+
+      When using ``runqemu``, the :term:`QB_DRIVE_TYPE` variable specifies=
 the
+      type of drive to emulate when starting the emulated machine.
+      Valid values are:
+
+      -  ``/dev/hd``: emulates an IDE drive.
+      -  ``/dev/mmcblk``: emulates an SD Card.
+      -  ``/dev/sd``: emulates an SCSI drive.
+      -  ``/dev/vd``: emulates a VirtIO drive.
+      -  ``/dev/vdb``: emulates a block VirtIO drive.
+
    :term:`QB_FSINFO`
=20
       The :term:`QB_FSINFO` variable provides additional filesystem metada=
ta to
@@ -8218,10 +8236,10 @@ system and gives an overview of their function and =
contents.
       -  ``wic``:
=20
          -  ``no-kernel-in-fs``: Specifies that the kernel is not included=
 in
-            the WIC image. In this case, ``runqemu`` loads the kernel sepa=
rately.
+            the :term:`Wic` image. In this case, ``runqemu`` loads the ker=
nel separately.
=20
          -  ``kernel-in-fs``: Specifies that the kernel is included in the
-            WIC image. In this case, ``runqemu`` does not load a separate =
kernel.
+            :term:`Wic` image. In this case, ``runqemu`` does not load a s=
eparate kernel.
=20
       -  ``tar``:
=20
@@ -8229,24 +8247,6 @@ system and gives an overview of their function and c=
ontents.
             image when extracting a tarball for NFS by appending ``-dbg`` =
to
             :term:`IMAGE_LINK_NAME`.
=20
-   :term:`QB_DEFAULT_KERNEL`
-
-      When using ``runqemu``, the :term:`QB_DEFAULT_KERNEL` variable contr=
ols
-      the default Linux kernel image to boot, found in :term:`DEPLOY_DIR_I=
MAGE`. For
-      example: ``bzImage``.
-
-   :term:`QB_DRIVE_TYPE`
-
-      When using ``runqemu``, the :term:`QB_DRIVE_TYPE` variable specifies=
 the
-      type of drive to emulate when starting the emulated machine.
-      Valid values are:
-
-      -  ``/dev/hd``: emulates an IDE drive.
-      -  ``/dev/mmcblk``: emulates an SD Card.
-      -  ``/dev/sd``: emulates an SCSI drive.
-      -  ``/dev/vd``: emulates a VirtIO drive.
-      -  ``/dev/vdb``: emulates a block VirtIO drive.
-
    :term:`QB_GRAPHICS`
=20
       When using ``runqemu``, the :term:`QB_GRAPHICS` variable controls th=
e QEMU

Antonin
