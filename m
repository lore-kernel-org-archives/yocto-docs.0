Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFAEC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:55:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.81981.1749545745820643737
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PGVnwhhG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBD9343967;
	Tue, 10 Jun 2025 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DI2OCDLbU/GIWFoHYedDj54j9M8TZQu3y/cKy1qt0Ps=;
	b=PGVnwhhG706DwX0UKevl4uinDXazOghW1umf7A/jiRXfextNEZH4oaQMOVTzc4zpQiiwCv
	hZYPORTAwZXznXaKAWagqTHb3IIDorhtyDG2EChTK6YcsA6loEOM5FEGDeEHxRIgIB/kz6
	UUQ5C/t0ew7HH3x1yP3sPdnEFwhJf1zjmCMNmr9qAmh18pjYtrkcC1cx7ygoQhTTi9zJ8q
	2PVB3pQQRyhO9Ny/iJtiZgnzw2/ugP1dnHuwdsj69ySl56/UUL/U1R6paK9SrtaBcH+pwm
	MM18Ad9+DAcESmG0opsFYc+/QlRpp0yH9otlVUwGMv/41xICwHIkcSgz74hucQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 10:55:43 +0200
Message-Id: <DAIQ7EZLUNIR.1PRHTL84VV2XG@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES
 variable
References: <20250608104459.1888510-1-dixitparmar19@gmail.com>
In-Reply-To: <20250608104459.1888510-1-dixitparmar19@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdevgfevkeegteefieekfeeuiedvieeikeelueekffetieefgeevfeefleelheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepughigihithhprghrmhgrrhduleesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7044

On Sun Jun 8, 2025 at 12:44 PM CEST, Dixit Parmar via lists.yoctoproject.or=
g wrote:
> This variable controls the kernel module spliting.
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 9768d8f5b..b7dde2604 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5359,6 +5359,20 @@ system and gives an overview of their function and=
 contents.
>        the :term:`KERNEL_PATH` variable. Both variables are common variab=
les
>        used by external Makefiles to point to the kernel source directory=
.
> =20
> +   :term:`KERNEL_SPLIT_MODULES`
> +      When inheriting the :ref:`ref-classes-kernel-module-split` class, =
this
> +      variable controls whether kernel modules are split into separate p=
ackages
> +      or bundled into a single package.
> +
> +      For some use cases, a monolithic kernel module package
> +      :ref:`KERNEL_PACKAGE_NAME` (by default named ``kernel``) that cont=
ains

This should be :term:`KERNEL_PACKAGE_NAME` (not :ref:). Otherwise fails to
build.

> +      all modules built from the kernel sources may be preferred. Becaus=
e a
> +      monolithic package can reduce download time and speed up installat=
ion.

I think this can be simplified by "...may be preferred to speed up
installation". "Download time" is too context specific, probably related to
package management on the target.

> +
> +      By default, this variable is set to ``1``, resulting in one packag=
e per
> +      module. Setting it to any other value will generate a single monol=
ithic
> +      package containing all kernel modules.
> +
>     :term:`KERNEL_SRC`
>        The location of the kernel sources. This variable is set to the va=
lue
>        of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-mod=
ule`

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


