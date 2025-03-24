Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C38DC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:11:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.34068.1742803886632193612
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Mar 2025 01:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jm48oxHX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 815CF44434;
	Mon, 24 Mar 2025 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742803884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNRrCZGHOmszyep8p7f9ez0xQ1fSIQNAR9Gf5JkrRK0=;
	b=jm48oxHXevQbTc+csOXRB+wu0eexUN4llTTpyxumDsqr1Fuh7J33VGr9ADtzcWfPtIl4hB
	kWl02AZCs2nG24n9cnaqvAksBSzIqxGWrVwFaSiXEvVksBTIGMk4/Hu4viZ30xzf9Ixrdi
	GMck8nbKSP23XLbv6KmdeqfbbsWeBaXHcloFX4l5x2Ta+VgZLcTAG2dqbK+IZP6/7UIQUn
	RVTRJp+2lQw7Ap5Xl7jfmuzoQT98D3kxTZgI7dJmgSzPS5Y6XzgGf0ByjYzqWwIMRRgW8H
	UlsRmj3I+KXbmBUk2jxBMaLDpGOgEoujON7ryNtvAAXNu/v6xQp2cNcN6xqseg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 09:11:23 +0100
Message-Id: <D8OCEZ6BIJBN.36VNEE4M3EGL5@bootlin.com>
Subject: Re: [docs] [PATCH] requirements: move Ubuntu-20.04 into unsupported
 category due to python
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <paulg@kernel.org>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-42-gf66bdccc6922-dirty
References: <20250321192711.3061486-1-paulg@kernel.org>
In-Reply-To: <20250321192711.3061486-1-paulg@kernel.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtkeekfffffeehtedttedtueegvddvleefffektefgtdeiudekheduhffhledtveenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgruhhlgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Mar 2025 08:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6608

Hi,

On Fri Mar 21, 2025 at 8:27 PM CET, Paul Gortmaker via lists.yoctoproject.o=
rg wrote:
> From: Paul Gortmaker <paul.gortmaker@kernel.org>
>
> Bitbake commit 0d2e682d00df ("bitbake: lib/bb: Bump minimum python
> version requirement to 3.9" -- poky commit 67566c7410e1) means that
> Ubuntu 20.04 is no longer supported out-of-the-box as detailed further
> in the respective commit log.
>
> While it is true that it can still be used with buildtools, that can
> also be said for nearly every other unsupported distro out there,
> including Ubuntu 18.04 that we listed as unsupported some years ago.
> Hence continuing to list it as supported with the new python requirement
> in place does not make sense.
>
> So we move it alongside of the 18.04 entry, into the "possibly tested,
> but you get what you get" category.  And add an explicit mention of the
> buildtools, so people have a thread to pull on.
>
> Signed-off-by: Paul Gortmaker <paulg@kernel.org>
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
> index 93b95a7fb251..3d0d26e2f08b 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -58,8 +58,6 @@ Supported Linux Distributions
>  Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project i=
s
>  supported on the following distributions:
> =20
> --  Ubuntu 20.04 (LTS)
> -
>  -  Ubuntu 22.04 (LTS)
> =20
>  -  Ubuntu 24.04 (LTS)
> @@ -93,11 +91,15 @@ organizations publishing them no longer make updates =
publicly available:
> =20
>  -  Ubuntu 18.04 (LTS)
> =20
> +-  Ubuntu 20.04 (LTS)
> +
>  -  Ubuntu 23.04
> =20
>  Note that the Yocto Project doesn't have access to private updates
>  that some of these versions may have. Therefore, our testing has
> -limited value if you have access to such updates.
> +limited value if you have access to such updates.  Also, buildtools

s/buildtools/:term:`buildtools`/, so users are hinted towards what this is.

I can make that change before merging if that's ok to you.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

