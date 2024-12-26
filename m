Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9328BE7718E
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 08:35:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18855.1735202135189028770
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 00:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mXCSatSz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03847C0003;
	Thu, 26 Dec 2024 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735202133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ka4JoI3lXiylotoWjqTkx8MqpGmiXYiTHrWW+laCLuU=;
	b=mXCSatSzpPMRmF66Fl3L2YZdZYCIypQYz2bL+GDVhVmFa/ufsWwgj+gmuSfcmE9knCD4sr
	IJVHwcKxbIu52HpwZrfCd6+Xs6whvCtkbKXFjuEr9pTncPP6NHl2scpD+YdgZgnL55SbJt
	TYPTv2F3JboYB9Z+lsRr8RO/fC8OuidQCwDspicUGGpVsOcoegTG9x5wMaoNoi9p5mobx7
	0wtzdqW0OMs+gS9KGroZXpqFLMFlt8pjXzZETwwNTiWQgn2bIyTucyohK/4wUtqYmb2tm3
	+fUWWq76e6R0hgSpF141n1WDiVUYyVk4aWUUBPtuq7bB5A8Mthj1YybkccGMvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 09:35:32 +0100
Message-Id: <D6LHTJ2DELRS.3TYUAM1NYKMNK@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/3] sdk-manual: extensible.rst: update devtool
 ide-sdk
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
 <20241224140251.24389-3-adrian.freihofer@siemens.com>
In-Reply-To: <20241224140251.24389-3-adrian.freihofer@siemens.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 08:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6035

On Tue Dec 24, 2024 at 3:02 PM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
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
> ---
>  documentation/sdk-manual/extensible.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-=
manual/extensible.rst
> index 9a50d7fc5..3733997fa 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -669,7 +669,8 @@ The extensible SDK supports two different development=
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
> @@ -786,8 +787,8 @@ The extensible SDK supports two different development=
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

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


