Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8365CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:37:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.3434.1761734250726055451
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cEi3x4RA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EBC3E4E413BB
	for <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:37:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2049606E8;
	Wed, 29 Oct 2025 10:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 289D8117F27FC;
	Wed, 29 Oct 2025 11:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761734247; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zLYcHtYJcmeRJlXpqChm9AUU+ReucxxcUtRPUEFe0ek=;
	b=cEi3x4RAgNoz9dfeB6XSq5K0Tdcsqjw/BDZ5ZxvCjre9hKS4hsz3JQdPeoDyuSgGOOoLLy
	4Q0Cf2XGeBWEYUrNjnbrDnX9BSuuIAuLiWXKEMEV0HmW3eBLGeMi/C2mA6hUrSIOErvm5Q
	lumqhms+SCVbF0jI0jr9IX1G1kvtwTDL15KREJ0AHSmwmcdThRb6eH5/910gQlEsSFN7u6
	2sNJHCPPFFkJrR0fj50EdufmX5rqGS7v14X4PC55KG65GPQ76EA05mzVWDdaRjcZE2c6k/
	fodWJTDyCRNOxWOIEvtH+vWx3SREDfJPCMutJ2ZEw1l58vJbni01KLvdnsrhzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 11:37:26 +0100
Message-Id: <DDUQO3UL2JJ5.102DUMV7VKK77@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: cover new FIT_KERNEL
 variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
References: <20251027215125.2457508-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251027215125.2457508-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:37:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7898

Hi,

On Mon Oct 27, 2025 at 10:51 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Document the new variables:
> - FIT_KERNEL_SIGN_ENABLE
> - FIT_KERNEL_SIGN_KEYNAME
> - FIT_KERNEL_SIGN_KEYDIR
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 65 ++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 591c03028ce..9be3075c041 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3414,6 +3414,47 @@ system and gives an overview of their function and=
 contents.
>        set :term:`FIT_KERNEL_COMP_ALG` to "lzo", you may want to set this
>        variable to ".lzo".
> =20
> +   :term:`FIT_KERNEL_SIGN_ENABLE`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass
> +      to enable or disable signing of the FIT image.
> +      By default it gets the value from :term:`UBOOT_SIGN_ENABLE`, which=
 means

This phrasing could imply that FIT_KERNEL_SIGN_KEYDIR uses UBOOT_SIGN_ENABL=
E in
some way, while the reality is that they're the same. How about:

"""
The default value of :term:`FIT_KERNEL_SIGN_ENABLE` is the value of
:term:`UBOOT_SIGN_ENABLE`, ...
"""

Same comment for other variables below.

> +      that when U-Boot FIT image signing is enabled, the FIT image will =
also be
> +      signed at build-time and U-Boot will verify the FIT image signatur=
e at
> +      run-time.
> +
> +      If this variable is set to "1", the FIT image will be signed using=
 the
> +      key specified by :term:`FIT_KERNEL_SIGN_KEYNAME` from the director=
y
> +      :term:`FIT_KERNEL_SIGN_KEYDIR`.
> +
> +      If this variable is overridden independently from :term:`UBOOT_SIG=
N_ENABLE`,
> +      the :term:`FIT_KERNEL_SIGN_KEYDIR` and :term:`FIT_KERNEL_SIGN_KEYN=
AME`
> +      variables should also be set appropriately.

I would suggest the last sentence to be phrased the same way for each varia=
ble,
based on the example in FIT_KERNEL_SIGN_KEYDIR below:

"""
If this variable is overridden, the :term:`FIT_KERNEL_SIGN_XXX` and
:term:`FIT_KERNEL_SIGN_XXX` variables should also be set appropriately.
"""

It's already enough for giving a hint to the user playing with this variabl=
e to
take a look at the others, IMO.

> +
> +   :term:`FIT_KERNEL_SIGN_KEYDIR`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass.
> +      By default it gets the value from :term:`UBOOT_SIGN_KEYDIR` assign=
ed which
> +      means the kernel is signed at build-time with a private key found =
in
> +      :term:`UBOOT_SIGN_KEYDIR` and the U-Boot gets the public key from =
the

s/the U-Boot/U-Boot/

> +      same directory injected into its DTB for the on-target verificatio=
n of the
> +      FIT image.
> +
> +      If this variable is overridden, also the :term:`FIT_KERNEL_SIGN_EN=
ABLE` and
> +      :term:`FIT_KERNEL_SIGN_KEYNAME` probably need to be overridden.

> +
> +   :term:`FIT_KERNEL_SIGN_KEYNAME`
> +
> +      This variable is used by the :ref:`ref-classes-kernel-fit-image` c=
lass.
> +      By default it gets the value from :term:`UBOOT_SIGN_KEYNAME`, whic=
h
> +      means the kernel is signed at build-time with a private key named =
according
> +      to :term:`FIT_KERNEL_SIGN_KEYDIR` and U-Boot gets the public key w=
ith
> +      the same name injected into its DTB for on-target verification
> +      of the FIT image.
> +
> +      If this variable is overridden, the :term:`FIT_KERNEL_SIGN_ENABLE`=
 and
> +      :term:`FIT_KERNEL_SIGN_KEYDIR` variables should also be set approp=
riately.
> +
>     :term:`FIT_KEY_GENRSA_ARGS`
>        Arguments to ``openssl genrsa`` for generating a RSA private key f=
or
>        signing the FIT image. The default value is set to "-F4" by the
> @@ -10842,17 +10883,31 @@ system and gives an overview of their function =
and contents.
>     :term:`UBOOT_SIGN_ENABLE`
>        Enable signing of FIT image. The default value is "0".
> =20
> -      This variable is used by the :ref:`ref-classes-kernel-fit-image`,
> -      :ref:`ref-classes-uboot-config` and :ref:`ref-classes-uboot-sign`
> -      classes.
> +      This variable is defined by :ref:`ref-classes-uboot-config` class.

"is defined and used"

> +
> +      It is used by the :ref:`ref-classes-uboot-sign` class.

And remove this sentence?

> +      Additionally, it serves as the default value for the
> +      :term:`FIT_KERNEL_SIGN_ENABLE` variable, which is
> +      used by the :ref:`ref-classes-kernel-fit-image` class.
> +
> +      That means, if :term:`UBOOT_SIGN_ENABLE` is set to "1", the
> +      :ref:`ref-classes-kernel-fit-image` class will sign the FIT image =
at
> +      build-time using the specified private key, and the
> +      :ref:`ref-classes-uboot-sign` class will inject the corresponding =
public
> +      key into U-Boot's device tree. This enables U-Boot to verify the

s/enables U-Boot to verify/makes U-Boot verify/=20

would sound a bit better I think

> +      authenticity and integrity of the FIT image at boot time, providin=
g a
> +      secure boot workflow that helps prevent unauthorized or tampered i=
mages
> +      from being loaded.

... also needs CONFIG_FIT_SIGNATURE and CONFIG_RSA/ECDSA set in your U-Boot
config, but that shouldn't be listed here. Instead we can maybe link to U-B=
oot's
documentation:

"""
See `https://docs.u-boot.org/en/v2025.10/usage/fit/signature.html`__ for mo=
re
information on FIT signature verification in U-Boot.
"""

> =20
>     :term:`UBOOT_SIGN_KEYDIR`
>        Location of the directory containing the RSA key and certificate u=
sed for
> -      signing FIT image, used by the :ref:`ref-classes-kernel-fit-image`=
 and
> -      :ref:`ref-classes-uboot-sign` classes.
> +      signing the FIT image, used by the :ref:`ref-classes-kernel-fit-im=
age`
> +      (via the :term:`FIT_KERNEL_SIGN_KEYDIR` variable)
> +      and :ref:`ref-classes-uboot-sign` classes.
> =20
>     :term:`UBOOT_SIGN_KEYNAME`
>        The name of keys used by the :ref:`ref-classes-kernel-fit-image` c=
lass
> +      (via the :term:`FIT_KERNEL_SIGN_KEYNAME` variable)
>        for signing U-Boot FIT image stored in the :term:`UBOOT_SIGN_KEYDI=
R`
>        directory. If we have for example a ``dev.key`` key and a ``dev.cr=
t``
>        certificate stored in the :term:`UBOOT_SIGN_KEYDIR` directory, you=
 will

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


