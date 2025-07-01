Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B5EC8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:54:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.8545.1751370878642549338
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 04:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g38hDQ8s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FD274427F;
	Tue,  1 Jul 2025 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751370876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf2i8Pr/OBkau9WfpJr+Qzq4ZzGPo0edZt4xZTRTRJs=;
	b=g38hDQ8sY/ndkp0iguw3+4pMXR0aXUfKn/OjDp2O0EX9Gie3jnVC7IgsBCB+a0doTsnftX
	yHJmKj32LlytfNwZTTzgZPBMpb6IbMKzhYd+/QkCSaz8/wDo4XVr//DRDnCwA3TA1ZBafV
	UC4Bq3MRXGyrny1EgsAdx4+//0WyN4EycMmCcOCy17G8LmglVCJGCC6alfSr1TpkYGoMkq
	8N+0g8lmdzFwgsUnkJ/WD64hBTQGB0DkyjWvFb/EFH395Zx3nRP2T1j7Du54oSZujr+jLH
	Rz39IMJaL89NmQ+sDAf59sB7YQrNcEJ6W6QSXGkfXXoV2Fvs/mD+G24j4tEz4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 13:54:35 +0200
Message-Id: <DB0P5T4VZD4K.3O06IN3FJKE70@bootlin.com>
Subject: Re: [docs] [PATCH] dev manual, CH 3: update code snippets to be
 more current
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <b07d165d-2163-3893-43cb-0700a7fac3a1@crashcourse.ca>
In-Reply-To: <b07d165d-2163-3893-43cb-0700a7fac3a1@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefgteekueeihfffueegjeeuuddttdevuefgjefhtdeivdeuvdehgeffkeevteefnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 11:54:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7256

On Fri Jun 20, 2025 at 3:07 PM CEST, Robert P. J. Day wrote:
>
> Nothing major, just copy-and-paste from master branch to replace aging
> code examples, and a little grammmar cleanup.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manu=
al/layers.rst
> index c649e2bd6..5f53e4bc6 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -80,7 +80,7 @@ Follow these general steps to create your layer without=
 using tools:
>        BBFILE_PATTERN_yoctobsp =3D "^${LAYERDIR}/"
>        BBFILE_PRIORITY_yoctobsp =3D "5"
>        LAYERVERSION_yoctobsp =3D "4"
> -      LAYERSERIES_COMPAT_yoctobsp =3D "dunfell"
> +      LAYERSERIES_COMPAT_yoctobsp =3D "walnascar"
>
>     Here is an explanation of the layer configuration file:
>
> @@ -306,7 +306,7 @@ The Yocto Project Compatibility Program consists of a=
 layer application
>  process that requests permission to use the Yocto Project Compatibility
>  Logo for your layer and application. The process consists of two parts:
>
> -#. Successfully passing a script (``yocto-check-layer``) that when run
> +#. Successfully passing a script (``yocto-check-layer``) that, when run
>     against your layer, tests it against constraints based on experiences
>     of how layers have worked in the real world and where pitfalls have
>     been found. Getting a "PASS" result from the script is required for
> @@ -478,7 +478,7 @@ name. To handle these errors, the best practice is to=
 rename the ``.bbappend``
>  to match the original recipe version. This also gives you the opportunit=
y to see
>  if the ``.bbappend`` is still relevant for the new version of the recipe=
.
>
> -Another method it to use the character ``%`` in the ``.bbappend`` filena=
me. For
> +Another method is to use the character ``%`` in the ``.bbappend`` filena=
me. For
>  example, to append information to every ``6.*`` minor versions of the re=
cipe
>  ``someapp``, the ``someapp_6.%.bbappend`` file can be created. This way,=
 an
>  error will only be triggered if the ``someapp`` recipe has a major versi=
on
> @@ -504,10 +504,11 @@ the "meta" layer at ``meta/recipes-bsp/formfactor``=
::
>     SECTION =3D "base"
>     LICENSE =3D "MIT"
>     LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420"
> -   PR =3D "r45"
>
>     SRC_URI =3D "file://config file://machconfig"
> -   S =3D "${WORKDIR}"
> +
> +   S =3D "${WORKDIR}/sources"
> +   UNPACKDIR =3D "${S}"

It's now only:

  S =3D "${UNPACKDIR}"

Was updated on June 16th. Can you refresh your patch?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


