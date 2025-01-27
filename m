Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D77C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:35:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.47213.1737966910307520952
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 00:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BcYbYD7P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 277DC40006;
	Mon, 27 Jan 2025 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737966908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFcFdqyrUWzqPDp0mQ8lefYuQMBauGmERRU0RTV7QcQ=;
	b=BcYbYD7P1WX7JYgxxdWIlnYmA5ThI9WKfYDX6q6ajfeXvxiX7opN7IaArpc+B17lfuW37+
	Ez6ekeZRREAmE+GcIJaXWA4g21dpojD0EFxhYVasyg1niA4rJtaDMhVN4MOIT2iWzeXolq
	RXdc4i6hNXSqWAXIAbUwGxbOQc4EZajRWNK+Kl1pw+ggnGCNLeMA+xfjSfAjjlRZ7R/YJ+
	VL3GewJCcMxEt+3436IDPdc/fUBZBJ2I3ZVS/jI82KyFg+g8cdylUWXnenEdvDPE59S3F3
	z6/sWZ8+Qqtmsg4k9tGqAgxoEJ0vjGtxD2MKz6aev1Mhxr6/nXpUXFHQHeOS8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 09:35:07 +0100
Message-Id: <D7CPUNB5VPU4.8GY2FQBHEPPQ@bootlin.com>
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>, "Quentin Schulz"
 <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [scarthgap,styhead][PATCH 1/1] sdk-manual: extensible.rst:
 update devtool ide-sdk
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250126125313.1454763-1-adrian.freihofer@siemens.com>
 <20250126125313.1454763-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250126125313.1454763-2-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 08:35:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6186

Hi Adrian,

On Sun Jan 26, 2025 at 1:53 PM CET, Adrian Freihofer wrote:
> From: Adrian Freihofer <adrian.freihofer@gmail.com>
>
> Replace
>   devtool ide-sdk --debug-build-config
> by
>   devtool modify --debug-build
>
> This change was introduced with commit
> https://git.yoctoproject.org/poky/commit/?id=3D1f7eb26c947dde14698ae6e2ab=
88f0637027f4cb
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/sdk-manual/extensible.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-=
manual/extensible.rst
> index 3f6a754d8..f16d5a027 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -666,7 +666,8 @@ The extensible SDK supports two different development=
 modes.
>        IMAGE_INSTALL:append =3D " my-recipe"
> =20
>     Assuming the BitBake environment is set up correctly and a workspace =
has
> -   been created for the recipe using ``devtool modify my-recipe``, the
> +   been created for the recipe using ``devtool modify my-recipe`` or pro=
bably
> +   even better by using ``devtool modify my-recipe --debug-build``, the
>     following command can create the SDK and the configuration for VSCode=
 in
>     the recipe workspace::
> =20
> @@ -783,8 +784,8 @@ The extensible SDK supports two different development=
 modes.
>     .. code-block:: sh
> =20
>        # Create the SDK
> -      devtool modify cmake-example
> -      devtool ide-sdk cmake-example core-image-minimal -c --debug-build-=
config --ide=3Dnone
> +      devtool modify cmake-example --debug-build
> +      devtool ide-sdk cmake-example core-image-minimal -c --ide=3Dnone
> =20
>        # Install the firmware on a target device or start QEMU
>        runqemu

I already backported "sdk-manual: extensible.rst: devtool ide-sdk improve" =
to
scarthgap-next and styhead-next.

But I don't think this one should be? The --debug-build opt is not backport=
ed on
styhead/scarthgap on oe-core (still using --debug-build-config).

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

