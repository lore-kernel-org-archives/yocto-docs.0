Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCDBC02193
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 09:55:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.15749.1738317330943412087
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 01:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dQnwJIKh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B49E43297;
	Fri, 31 Jan 2025 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738317328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NjnQZnedZWOIkSWulvvmIok6D/U98JeXggtnoJ2FX0=;
	b=dQnwJIKhKZndY5qcSTkggxoRI/TQ4O4W/iBPfSVmRGaE28ipwshtitPPobOX6QFpyH8DTY
	ic2NrnYG+bF8HZTU9vzNzgru67JRp2zHPqMn/2V9ZyhMKrDCycrZBpGBaawNEmgyqW8mft
	oR4AVO/grBxJ2LjuPTcQthWBK1PUD9YQciEm8Iob+nVvmLLGoIhWRbpfH1UQ8+ukvL1FvG
	zEOoFTaUhs7Qxk0cHOcUR2zFh1HY9qFipHV/uYriXbi7mH2wRejaL9k79Zl9FkikrTyjcO
	2UorpUQViYfwWqGfoeB0pQE9r1jrTXiK7NyxXbO7l5jA0/J8KelFCqOSnBcInw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jan 2025 10:55:28 +0100
Message-Id: <D7G62C391H80.19WG2MGAL7SAK@bootlin.com>
To: =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v2] dev-manual/packages: add information about signing
 changes
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <D7EOLBIP4NGZ.2873VJSZNHBXI@bootlin.com>
 <20250130090403.2471098-1-zboszor@gmail.com>
In-Reply-To: <20250130090403.2471098-1-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejtdetjeevteejtdfgkedtvddvudeuveffteeijeetgeefiedtkeejueefudehjeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeiisghoshiiohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrv
 hhinhesghhmrghilhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 09:55:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6222

Hi Zolt=C3=A1n,

On Thu Jan 30, 2025 at 10:04 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi=
 wrote:
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  documentation/dev-manual/packages.rst | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-ma=
nual/packages.rst
> index 4ba2dcae3..8845bf2fa 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -819,9 +819,19 @@ to use signed package feeds (repositories) when doin=
g a build.
>  Signing RPM Packages
>  --------------------
> =20
> -To enable signing RPM packages, you must set up the following
> -configurations in either your ``local.config`` or ``distro.config``
> -file::
> +To enable signing RPM packages, you must modify the ``rpm``
> +recipe configuration to include support for OpenPGP signing.
> +That may be done either in a ``.bbappend`` for the ``rpm`` recipe::
> +
> +   PACKAGECONFIG:append =3D " sequoia"
> +
> +or in a :term:`Configuration File`::
> +
> +   PACKAGECONFIG:append:pn-rpm-native =3D " sequoia"
> +   PACKAGECONFIG:append:pn-rpm =3D " sequoia"
> +
> +You must also set up the following settings in a
> +:term:`Configuration File`::
> =20
>     # Inherit sign_rpm.bbclass to enable signing functionality
>     INHERIT +=3D " sign_rpm"

Looking good, thanks!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

