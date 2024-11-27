Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD1DD609D0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 10:26:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.68933.1732703218329676655
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 02:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ffN/LutG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 687B34000C;
	Wed, 27 Nov 2024 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732703216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tTc4UGprval4dBylivAw7NZwyYdd1udNq2j3l1N+puU=;
	b=ffN/LutGF8XVroZZw0l7Zt3xU86ySwDhfksHM+jEL8gmzqXdi0s4SxqnEnhG3EbkTZYD0f
	YgZxvh0ENkz19s3WPLBrROlSitHIz/RopbqqMjMXCaKV0pEkki9RHDMPGGwIHI0mcvmDAl
	3ijxSQ3nZEgHYWI8lw1gJ/natmQAnvNazR+uievterLZPxyGUy8pamQ9pX8/uc62rdx3cY
	5/dQRzN46jZZ+b79qWa92Rf7Py4Tb1qBz85qSH2c03dE+F8sa7qYbbTdAbT5GlO3DD4MZz
	6c35mJAbMSDgPQ374j0yHFWMletxyP5FtJZ+f2U2gl8t37AzB8dujYeFOQP3hg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 11:26:56 +0100
Message-Id: <D5WW10P1OC2V.DDSW38USN1F@bootlin.com>
Subject: Re: [docs] [PATCH v3] classes.rst variables.rst: add documentation
 for uki.bbclass
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241126110247.307766-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241126110247.307766-1-mikko.rapeli@linaro.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 10:26:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5823

Hi Mikko,

Thanks for taking the time to document your class. In general it looks very=
 good
to me.

A nitpick from the documentation/standards.md of the doc is that we prefer
wrapping the lines to 80 chars, as is done in the rest of the document. Cou=
ld
you do this?

Otherwise my comments are below.

On Tue Nov 26, 2024 at 12:02 PM CET, Mikko Rapeli via lists.yoctoproject.or=
g wrote:
> Documentation for the new class.
>
> [YOCTO #15650]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15650
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  documentation/ref-manual/classes.rst   | 34 ++++++++++++++++++++++++++
>  documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b92f4e4f20..d2b2469552 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3345,6 +3345,40 @@ and the `signature process
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
age (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image=
/>`__
> +format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc=
 to a single UEFI firmware
> +compatible binary. The class is intended to be inherited by rootfs image=
 recipes. The build configuration
> +should also use an initramfs, ``systemd-boot`` as boot menu provider and=
 have UEFI support on target
> +HW. Using ``systemd`` as init is recommended. Image builds should create=
 an ESP partition

s/HW/hardware/

> +for UEFI firmware and copy ``systemd-boot`` and UKI files there. Sample =
configuration for Wic
> +images is provided in :oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdi=
sk.wks.in <openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdi=
sk.wks.in>`.
> +UKIs are generated using ``systemd`` reference implementation `ukify <ht=
tps://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
> +This class uses a number of variables but tries to find sensible default=
s for them.
> +
> +The variables used by this class are:
> +
> +-  :term:`EFI_ARCH`: architecture name within EFI standard, set in :oe_g=
it:`meta/conf/image-uefi.conf <openembedded-core/tree/meta/conf/image-uefi.=
conf>`

We are missing `EFI_ARCH` from variables.rst, so this :term: won't work. Is=
 that
something you could add to variables.rst? Since you briefly document it her=
e it
should be a small addition.

> +-  :term:`IMAGE_EFI_BOOT_FILES`: files to install to EFI boot partition =
created by ``bootimg-efi`` Wic tool

s/by ``bootimg-efi``/by the ``bootimg-efi``/

It is a plugin rather than a tool, I think? s/Wic tool/Wic plugin/

> +-  :term:`INITRAMFS_IMAGE`: initramfs recipe name
> +-  :term:`INITRD_ARCHIVE`: initramfs image file name

Same for this variable, :term: doesn't work here. Since this variable is lo=
cal
to this file, I'm not sure it should be part of variables.rst, unless overr=
iding
it makes sense (I see ?=3D is used for it).

> +-  :term:`KERNEL_DEVICETREE`: optional devicetree files to embed into UK=
I
> +-  :term:`UKIFY_CMD`: `ukify <https://www.freedesktop.org/software/syste=
md/man/latest/ukify.html>`__ command to build UKI image

s/build/build the/

> +-  :term:`UKI_CMDLINE`: kernel command line to use with UKI
> +-  :term:`UKI_CONFIG_FILE`: optional config file for `ukify <https://www=
.freedesktop.org/software/systemd/man/latest/ukify.html>`__
> +-  :term:`UKI_FILENAME`: output file name for UKI image

s/for/for the/

> +-  :term:`UKI_KERNEL_FILENAME`: kernel image file name
> +-  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate mathing the=
 private key

s/mathing/matching/

> +-  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI =
with
> +
> +For examples on how to use this class see oeqa selftest :oe_git:`meta/li=
b/oeqa/selftest/cases/uki.py <openembedded-core/tree/meta/lib/oeqa/selftest=
/cases/uki.py>`.
> +Also an oeqa runtime test ``uki`` is provided which verifies that the ta=
rget system

Add a link to meta/lib/oeqa/runtime/cases/uki.py, I guess that's the one?

> +booted the same UKI binary as was set at buildtime via :term:`UKI_FILENA=
ME`.
> +
>  .. _ref-classes-uninative:
> =20
>  ``uninative``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index ec4d7ab73f..65fea43a1e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9846,6 +9846,38 @@ system and gives an overview of their function and=
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
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      the kernel command line to use when booting the `Unified Kernel Im=
age (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image=
/>`__.
> +      Defaults to ``rootwait root=3DLABEL=3Droot console=3D${KERNEL_CONS=
OLE}``.
> +
> +   :term:`UKI_CONFIG_FILE`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      an optional config file for `ukify <https://www.freedesktop.org/so=
ftware/systemd/man/latest/ukify.html>`__ command.

s/for/for the/

> +   :term:`UKI_FILENAME`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      the output file name for generated `Unified Kernel Image (UKI) <ht=
tps://uapi-group.org/specifications/specs/unified_kernel_image/>`__.

s/for/for the/

> +      Defaults to ``uki.efi``.
> +
> +   :term:`UKI_KERNEL_FILENAME`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      the kernel image file name to use as input. Defaults to :term:`KER=
NEL_IMAGETYPE`.
> +
> +   :term:`UKI_SB_CERT`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      optional UEFI secureboot certificate matching the private key in :=
term:`UKI_SB_KEY`.
> +
> +   :term:`UKI_SB_KEY`
> +      When inheriting the :ref:`ref-classes-uki` class,
> +      optional UEFI secureboot private key to sign `Unified Kernel Image=
 (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`=
__.

s/sign/sign the/


Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

