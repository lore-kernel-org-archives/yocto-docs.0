Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFDEC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 07:38:09 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12838.1750145879493594858
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 00:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H9nmX098;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60CD84436A;
	Tue, 17 Jun 2025 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750145877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jH36pUxTSLNSWKJdU6EYsiN/jkgv5brO0khIT/iqIM=;
	b=H9nmX0987otMWDb/2AVjEXhyv7jnvpNuk3xqmO49Yg2EcNiT6wKKrVxvTSYiZGJHqSzLwz
	WB+xZMD9o8418T2NjYvdEflS273gtAxSpJ1tXEWMyPDYq4jAM3CiUYH1gczDHLtV5qAKSe
	xt0fLf+nbNhOJjTwNIDmwun1H9+pbeqQfLBacUwKaeafqNNTDf1BsjkYZqQcsWsDNelsC4
	Y8dpFFTxqoUjPn48qXFXo7M2SHRGSmPSdJXVh0hnGm7inBjsxtQ2qIbrBQYPZdaoe+KyjE
	H9XFra2tS/toXc4/gGYHvIo2OYRlZzWdDeJaC8dszDzOcIwhPqrkuhwTar8FsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 09:37:56 +0200
Message-Id: <DAOMXOFJB9GO.3O0QNWL3SW2R5@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 1/3] ref-manual: replace kernel-fitimage by
 kernel-fit-image
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250616204135.1388643-1-adrian.freihofer@siemens.com>
 <20250616204135.1388643-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250616204135.1388643-2-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvffuhfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeeuveefvdeutdefueeltedvkeeiheejkeejfeeftdffiedtffduudehhedtkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:38:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7077

Hi Adrian,

Patch series looks good. Only one thing I noticed below, but I'll amend tha=
t
before merging your series on master-next.

Thanks!

On Mon Jun 16, 2025 at 10:36 PM CEST, Adrian Freihofer via lists.yoctoproje=
ct.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/classes.rst   | 201 +++++++++++++++++--------
>  documentation/ref-manual/variables.rst |  60 ++++----
>  2 files changed, 170 insertions(+), 91 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 54a98bf24f3..a6e74819dd7 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1732,77 +1732,158 @@ Its behavior is mainly controlled by the followi=
ng variables:
>  -  :term:`KERNEL_DTC_FLAGS`: flags for ``dtc``, the Device Tree Compiler
>  -  :term:`KERNEL_PACKAGE_NAME`: base name of the kernel packages
> =20
> -.. _ref-classes-kernel-fitimage:
> +.. _ref-classes-kernel-fit-image:
> =20
> -``kernel-fitimage``
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +``kernel-fit-image``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -The :ref:`ref-classes-kernel-fitimage` class provides support to pack a =
kernel image,
> -device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM dis=
k
> -into a single FIT image. In theory, a FIT image can support any number
> -of kernels, U-boot scripts, :term:`Initramfs` bundles, RAM disks and dev=
ice-trees.
> -However, :ref:`ref-classes-kernel-fitimage` currently only supports
> +The :ref:`ref-classes-kernel-fit-image` class provides support to pack a=
 kernel image,
> +device trees, a U-boot script, and an :term:`Initramfs` into a single FI=
T image.
> +In theory, a FIT image can support any number of kernels, U-boot scripts=
,
> +:term:`Initramfs`, and device trees.
> +However, :ref:`ref-classes-kernel-fit-image` currently only supports
>  limited usecases: just one kernel image, an optional U-boot script,
> -an optional :term:`Initramfs` bundle, an optional RAM disk, and any numb=
er of
> -device trees.
> +an optional :term:`Initramfs`, and any number of device trees.
> =20
> -To create a FIT image, it is required that :term:`KERNEL_CLASSES`
> -is set to include ":ref:`ref-classes-kernel-fitimage`" and one of :term:=
`KERNEL_IMAGETYPE`,
> -:term:`KERNEL_ALT_IMAGETYPE` or :term:`KERNEL_IMAGETYPES` to include "fi=
tImage".
> +The FIT image is created by a recipe which inherits the
> +:ref:`ref-classes-kernel-fit-image` class.
> +One such example is the ``linux-yocto-fitimage`` recipe which creates a =
FIT
> +image for the Linux Yocto kernel.
> +Additionally, it is required that :term:`KERNEL_CLASSES` is set to inclu=
de
> +:ref:`ref-classes-kernel-fit-extra-artifacts`.
> +The :ref:`ref-classes-kernel-fit-extra-artifacts` class exposes the requ=
ired kernel
> +artifacts to the :term:`DEPLOY_DIR_IMAGE` which are used by the
> +:ref:`ref-classes-kernel-fit-image` class to create the FIT image.
> =20
> -The options for the device tree compiler passed to ``mkimage -D``
> -when creating the FIT image are specified using the
> -:term:`UBOOT_MKIMAGE_DTCOPTS` variable.
> +The simplest example for building a FIT image is to add::
> =20
> -Only a single kernel can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the kernel image in FIT is mandat=
ory. The
> -address where the kernel image is to be loaded by U-Boot is
> -specified by :term:`UBOOT_LOADADDRESS` and the entrypoint by
> -:term:`UBOOT_ENTRYPOINT`. Setting :term:`FIT_ADDRESS_CELLS` to "2"
> -is necessary if such addresses are 64 bit ones.
> +   KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"
> =20
> -Multiple device trees can be added to the FIT image created by
> -:ref:`ref-classes-kernel-fitimage` and the device tree is optional.
> -The address where the device tree is to be loaded by U-Boot is
> -specified by :term:`UBOOT_DTBO_LOADADDRESS` for device tree overlays
> -and by :term:`UBOOT_DTB_LOADADDRESS` for device tree binaries.
> +to the machine conf file and to execute::

s/conf file/:term:`configuration file`/


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


