Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B05D6ACDC
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 14:11:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.72616.1732716652030094710
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 06:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F/MHndUJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 211FD1BF20C;
	Wed, 27 Nov 2024 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732716650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j623Xh3toMQZCklA6WmIUA9ynWCp2hMz5VaBwp/k/xo=;
	b=F/MHndUJSxn5cb8hKfbspZW2Y1fVvSe7vr9rfUmUZ8oqQhQjjNT01sau1FzIj/UvGIS6ft
	tBrvUyNoxCujjiI9BNNWOH4IQyv5zsIzdBB0VZy7hv+0rjGalloDMJwh0JUxkwzE3f7ami
	kBb6/+z9kr0rFY/grL8i244ezP49a2BPRy9TWD3UZ/Blhc7kxNqDeMkVN/xFySsNdaf2Kn
	XehKobstUQ3cxIZ9emg2zkw1K4C48REXvEklnBPUnHONOmpwTn+ZHM7wkd4RBiwKjGmdZ/
	uoCoj8czl0UVI0A6DfNVJP5sWJ9Y+cCwFziOQ/D+vu5X8kSqNWWFVP1UhyUtGw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 15:10:49 +0100
Message-Id: <D5X0SG1R4JOT.2L64OMN81OJDH@bootlin.com>
Subject: Re: [docs] [PATCH v5] classes.rst variables.rst: add documentation
 for uki.bbclass
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241127135921.3056-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241127135921.3056-1-mikko.rapeli@linaro.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 14:11:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5835

Hi Mikko,

On Wed Nov 27, 2024 at 2:59 PM CET, Mikko Rapeli via lists.yoctoproject.org=
 wrote:
> Documentation for the new class.
>
> [YOCTO #15650]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15650
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  documentation/ref-manual/classes.rst   | 50 ++++++++++++++++++++++++++
>  documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b92f4e4f20..33e1a4b435 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3345,6 +3345,56 @@ and the `signature process
>  See also the description of :ref:`ref-classes-kernel-fitimage` class, wh=
ich this class
>  imitates.
> =20
> +.. _ref-classes-uki:
> +
> +``uki``
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-uki` class provides support for `Unified Kernel Im=
age
> +(UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/=
>`__
> +format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc=
 to a
> +single UEFI firmware compatible binary. The class is intended to be inhe=
rited
> +by rootfs image recipes. The build configuration should also use an
> +:term:`Initramfs`, ``systemd-boot`` as boot menu provider and have UEFI =
support
> +on target hardware. Using ``systemd`` as init is recommended. Image buil=
ds
> +should create an ESP partition for UEFI firmware and copy ``systemd-boot=
`` and
> +UKI files there. Sample configuration for Wic images is provided in
> +:oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> +<openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.=
in>`.
> +UKIs are generated using ``systemd`` reference implementation `ukify
> +<https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
> +This class uses a number of variables but tries to find sensible default=
s for
> +them.
> +
> +The variables used by this class are:
> +
> +-  :term:`EFI_ARCH`: architecture name within EFI standard, set in
> +   :oe_git:`meta/conf/image-uefi.conf
> +   <openembedded-core/tree/meta/conf/image-uefi.conf>`
> +-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition
> +   created by the ``bootimg-efi`` Wic plugin
> +-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
> +-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UK=
I
> +-  :term:`UKIFY_CMD`: `ukify
> +   <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`=
__
> +   command to build the UKI image
> +-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
> +-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify
> +   <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`=
__
> +-  :term:`UKI_FILENAME`: output file name for the UKI image
> +-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
> +-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate matching th=
e
> +   private key
> +-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI =
with
> +
> +For examples on how to use this class see oeqa selftest
> +:oe_git:`meta/lib/oeqa/selftest/cases/uki.py
> +<openembedded-core/tree/meta/lib/oeqa/selftest/cases/uki.py>`.
> +Also an oeqa runtime test :oe_git:`meta/lib/oeqa/runtime/cases/uki.py
> +<openembedded-core/tree/meta/lib/oeqa/runtime/cases/uki.py>` is provided=
 which
> +verifies that the target system booted the same UKI binary as was set at
> +buildtime via :term:`UKI_FILENAME`.
> +
>  .. _ref-classes-uninative:
> =20
>  ``uninative``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index ec4d7ab73f..1eee617d59 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2355,6 +2355,11 @@ system and gives an overview of their function and=
 contents.
>        specifies the size of padding appended to the device tree blob, us=
ed as
>        extra space typically for additional properties during boot.
> =20
> +   :term:`EFI_ARCH`
> +      The CPU architecture name within EFI standard. Set in
> +      :oe_git:`meta/conf/image-uefi.conf
> +      <openembedded-core/tree/meta/conf/image-uefi.conf>`.
> +
>     :term:`EFI_PROVIDER`
>        When building bootable images (i.e. where ``hddimg``, ``iso``, or
>        ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the
> @@ -9846,6 +9851,43 @@ system and gives an overview of their function and=
 contents.
>        passes and uses "all" for the target during the U-Boot building
>        process.
> =20
> +   :term:`UKIFY_CMD`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      `ukify <https://www.freedesktop.org/software/systemd/man/latest/uk=
ify.html>`__ command to build
> +      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications=
/specs/unified_kernel_image/>`__.
> +      Defaults to ``ukify build``.
> +
> +   :term:`UKI_CMDLINE`
> +      When inheriting the :ref:`ref-classes-uki` class, the kernel comma=
nd line
> +      to use when booting the `Unified Kernel Image (UKI)
> +      <https://uapi-group.org/specifications/specs/unified_kernel_image/=
>`__.
> +      Defaults to ``rootwait root=3DLABEL=3Droot console=3D${KERNEL_CONS=
OLE}``.
> +
> +   :term:`UKI_CONFIG_FILE`
> +      When inheriting the :ref:`ref-classes-uki` class, an optional conf=
ig
> +      file for the `ukify
> +      <https://www.freedesktop.org/software/systemd/man/latest/ukify.htm=
l>`__
> +      command.
> +
> +   :term:`UKI_FILENAME`
> +      When inheriting the :ref:`ref-classes-uki` class, the output file =
name
> +      for the generated `Unified Kernel Image (UKI)
> +      <https://uapi-group.org/specifications/specs/unified_kernel_image/=
>`__.
> +      Defaults to ``uki.efi``.
> +
> +   :term:`UKI_KERNEL_FILENAME`
> +      When inheriting the :ref:`ref-classes-uki` class, the kernel image=
 file
> +      name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
> +
> +   :term:`UKI_SB_CERT`
> +      When inheriting the :ref:`ref-classes-uki` class, optional UEFI
> +      secureboot certificate matching the private key in :term:`UKI_SB_K=
EY`.
> +
> +   :term:`UKI_SB_KEY`
> +      When inheriting the :ref:`ref-classes-uki` class, optional UEFI
> +      secureboot private key to sign the `Unified Kernel Image (UKI)
> +      <https://uapi-group.org/specifications/specs/unified_kernel_image/=
>`__.
> +
>     :term:`UNKNOWN_CONFIGURE_OPT_IGNORE`
>        Specifies a list of options that, if reported by the configure scr=
ipt
>        as being invalid, should not generate a warning during the

Looking good to me, thank you!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

