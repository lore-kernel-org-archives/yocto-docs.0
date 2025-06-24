Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C92C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:43:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.3138.1750751030048631241
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GakTKfEu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C87C444464;
	Tue, 24 Jun 2025 07:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750751028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIhZM4oNXOxdELkJwWzNYX/OHevYbHU3Z6qq8DVr+30=;
	b=GakTKfEuxt8T2EA5Zki8vOdI15bdjnxN//CIl6FmJlufZrOfgmhDfpBKl6m8OaBx4jUpE7
	+RiWwIh0PWlav2UnMK7mOh/xan168SSmDYDRUr4XBr6RLOaMUCJRHuDdkT1+V7PBQoTRPg
	XXkBrqQbzTN+C9abc2eQ0b+VKKLzPUnaMvbqilzHlRzYYC5Y+OUPFzhZ7ytga6HwguVLsT
	v5YTFsjUzd0jNRp7QGVUopaiOBVdXOZYWIK/xNPpf3Xo4OwVBwLkfIPgTZcs25rGVB7BjN
	llDWJ2HBtB2c0fFTAn4oTYzD0C2YmD3COM64wYcMReU/Jnw50Tzj3EU/tLcHPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 09:43:47 +0200
Message-Id: <DAULFYRC7Q5D.40A7W0LFM2UV@bootlin.com>
Cc: "Alexander Kanavin" <alex@linutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 6/6] migration-guides/migration-5.1.rst: correct
 S/UNPACKDIR patterns for file-only recipes
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
 <20250623124257.1544615-6-alex.kanavin@gmail.com>
In-Reply-To: <20250623124257.1544615-6-alex.kanavin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveeuveeuuedvueevgeegueefgfehueeugedutdeuudfgjeehhfeijedujeejfeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtt
 hdrohhrghdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7184

Hi Alex,

On Mon Jun 23, 2025 at 2:42 PM CEST, Alexander Kanavin via lists.yoctoproje=
ct.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> It is not necessary to set both; just setting S to UNPACKDIR is enough.
>
> This has already been done across oe-core master, and correct advice
> should be given for those who need to adjust recipes during migration.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  documentation/migration-guides/migration-5.1.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documenta=
tion/migration-guides/migration-5.1.rst
> index c9bb38699b4..94b527bdcb3 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -20,8 +20,7 @@ S =3D ${WORKDIR} no longer supported
>  If a recipe has :term:`S` set to be :term:`WORKDIR`, this is no longer
>  supported, and an error will be issued. The recipe should be changed to:=
:
> =20
> -    S =3D "${WORKDIR}/sources"
> -    UNPACKDIR =3D "${S}"
> +    S =3D "${UNPACKDIR}"
> =20
>  Any :term:`WORKDIR` references where files from :term:`SRC_URI` are refe=
renced
>  should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-co=
mpile`,
> @@ -62,8 +61,7 @@ require to add an :term:`S` definition to a recipe that=
 only uses
>  ``file://`` :term:`SRC_URI` entries. To be consistent, the following pat=
tern is
>  recommended::
> =20
> -    S =3D "${WORKDIR}/sources"
> -    UNPACKDIR =3D "${S}"
> +    S =3D "${UNPACKDIR}"
> =20
>  Building C files from :term:`UNPACKDIR` without setting :term:`S` to poi=
nt at
>  it does not work as the debug prefix mapping doesn't handle that.

The series looks great, thanks.

I think we could also mention it in migration-5.3.rst, and also mention tha=
t S =3D
"${WORKDIR}/git" should now be removed?

Could you send a follow-up patch?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


