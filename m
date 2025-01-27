Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D54C0218C
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 08:23:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.47358.1737966196530476725
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 00:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oKyxR+zA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3AEC20004;
	Mon, 27 Jan 2025 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737966194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o5vfjF66txOIg+omTkqCqESi6ih4uUh/q6AkrUYr0iM=;
	b=oKyxR+zAip39p+HFCPGTrshYKDf+k1mEhL9+c+9n27xsnzGKOwqiDkNrDPFqANcgWEreOq
	uJKEhGGLzNlfdITY3mJ71nfACmy1mjJcWOxqyK+i8rUKVmkUuji3ph429HiLoiX8xrdWon
	6L4SDsGQbZkI/zqoUjoAVk4LlB0+7rWNH6SxB1H6dAernYTjglzwWIu/R4PayeVAYLaanu
	g2L1Zz17AIEjNbYkHwN0xYsCshis3gNcWg0E0h94a7HlAzVvUKfxY/h+TvtDEzc0D0fP/P
	AerpgddOPkKmzJwa8Udd8zUgpJght6on9UQOhGX36bCPmHwiDlov5oc9HzC5QA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 09:23:13 +0100
Message-Id: <D7CPLJ6UBY0O.131EO7C20FJ0M@bootlin.com>
Subject: Re: [docs] [PATCH] migration-5.2: Add entries for virtual provider
 and multiconfig changes
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250126111850.2609298-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250126111850.2609298-1-richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 08:23:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6185

Hi Richard,

Some formatting related changes.

On Sun Jan 26, 2025 at 12:18 PM CET, Richard Purdie via lists.yoctoproject.=
org wrote:
> Add some information to the migration guide about two important potential=
ly
> breaking changes in 5.2.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../migration-guides/migration-5.2.rst        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> [Note, I didn't test the formatting of this, I just wanted to get some te=
xt shared
> so we don't forget these. Hope that helps!]
>
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documenta=
tion/migration-guides/migration-5.2.rst
> index e9de6910e..fdf44757a 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -94,6 +94,28 @@ systemd changes
>     not for socket files).
>     Now all service files must be explicitly added to :term:`FILES`.
> =20
> +Multiconfig changes
> +~~~~~~~~~~~~~~~~~~~
> +
> +-  The value of BB_CURRENT_MC was changed from 'default' to an empty str=
ing for the
> +   default multiconfig configuration to avoid needing to map the values =
within bitbake.
> +   This was already not happening insome cases so fixes some obscure bug=
s.
> +
> +Virtual toolchain provider changes
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  Support was added for virtual providers on a per recipe basis for spe=
cific key toolchain
> +   providers listed in BB_VIRTUAL_RECIPE_PROVIDERS. As part of that supp=
ort, the 'cross'
> +   providers were simplified to remove the triplet prefix and generalise=
 the naming, so
> +   for example::
> +
> +     virtual/${TARGET_PREFIX}-binutils - > virtual/cross-bintuils
> +     virtual/${TARGET_PREFIX}-gcc - > virtual/cross-cc
> +     virtual/${TARGET_PREFIX}-g++ - > virtual/cross-c++
> +     virtual/${TARGET_PREFIX}-compilerlibs - > virtual/compilerlibs
> +     virtual/${SDK_PREFIX}-binutils - > virtual/nativesdk-cross-binutils
> +     virtual/${SDK_PREFIX}-gcc - > virtual/nativesdk-cross-cc

The code-block should be indented with three spaces.

Other than that I'm taking note that we are missing documentation for
BB_CURRENT_MC and BB_VIRTUAL_RECIPE_PROVIDERS, but that is already partly
mentioned in https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15709.

I'll try working on it soon.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

