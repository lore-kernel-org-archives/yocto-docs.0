Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE45C021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 09:55:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.86078.1740390945141960453
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 01:55:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fBM1Nzic;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F25224328D;
	Mon, 24 Feb 2025 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740390943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yep5ArZ98L2igg6CeX1hbJu6WfIg/OVrZitdnzWD9Yo=;
	b=fBM1NzicrWV2mTfQTWcedsn5bw6nCn/t7eD1ibfNzq7TK7JhdL+NbyWReoxnw2h6jjnLpt
	jk/RbnrLzU6aeYYujMhJu2Vem8Mjwy7HYObrM+aKTBYCLZfxGc+VEKDb1AnumUyXUUyzSx
	gecayP3/t2RmCB9wQVEXHX0LvZlUWSm3/Xw6XoAvZVaEJAAPsDkDZTXezRinL2uGJQZAuX
	CTHt9EKwIECsfhe+HH4D42KxURtGCqzi5DyKo1LloxFgjhuyVYigiCdGN7WYjQ0mbanCwD
	0GPrIYSNEq6SyN1mkU0rSTB0yQjPS/7W0nuumstHaSysqHvozb2m5IbSVEks5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 10:55:40 +0100
Message-Id: <D80L3KJQ7N91.3O6ZS6JF1LXQ4@bootlin.com>
Subject: Re: [docs] [PATCH v2 2/2] migration-guides: cover FIT_UBOOT_ENV
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250224082729.3325776-1-adrian.freihofer@siemens.com>
 <20250224082729.3325776-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250224082729.3325776-2-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 09:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6435

On Mon Feb 24, 2025 at 9:27 AM CET, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> Add a hint for users using the UBOOT_ENV variable and the
> kernel-fitimage.bbclass.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/migration-guides/migration-5.2.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documenta=
tion/migration-guides/migration-5.2.rst
> index de2ea773e55..4513186b7de 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -182,3 +182,11 @@ Miscellaneous changes
> =20
>  -  :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead =
of a dash-prefixed
>     command-line option (e.g. it should be set to ``3`` rather than ``-3`=
`).
> +
> +-  Until now, the variable :term:`UBOOT_ENV` was processed both by the U=
-Boot
> +   recipe and by the ``kernel-fitimage.bbclass``. However, adding a U-Bo=
ot
> +   script to the kernel FIT image is a different and independent thing, =
which
> +   also requires an independent variable.
> +   Therefore, the :term:`UBOOT_ENV` is no longer handled by the
> +   ``kernel-fitimage.bbclass``. There is a new variable :term:`FIT_UBOOT=
_ENV`
> +   which should be used for adding a U-Boot script to a FIT image.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

