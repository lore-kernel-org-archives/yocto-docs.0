Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED19C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:46:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.46665.1747644372969917243
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 01:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q0K/ADsS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BDA5432FC;
	Mon, 19 May 2025 08:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747644370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K54/ACrWepvZHxpDRpEnjMxEHLYRONgysv3p3I8AM80=;
	b=Q0K/ADsSTv159DGd25Knly71BG7itwawnc8e0CWXFFVj3M/DcsQhkIgbpzArf61w32k4YN
	wty3xc75Ojz5UZasUPldTEEjJw+dqn0wVk6AO1qwQDuJaDkLNzLl9FEqXVRItGX85Rf+LA
	0AzqHl4VjHKTKNqt89Qkhl3QjpqsCu8oyl/vO+6+Vzt4C6OcbCKxnNxPnt4GToZd9FOTgb
	NU+/gczfS39sx9OF4R4h1obz++EXZbn0kxV7Q4zhBURjTO7/Fg4o4tGpdoovBmFxhy2ScK
	9Ds4UlgDDUFDAiIjTcAfclq4rYdvIz/C8OBnZOs0730uMbKkj/eoGkdu1TLXTg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 10:46:09 +0200
Message-Id: <DA0083X402VH.1NSE0F7U2L9B8@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alperyasinak1@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 INHIBIT_AUTOTOOLS_DEPS
References: <20250518145057.85245-1-alperyasinak1@gmail.com>
In-Reply-To: <20250518145057.85245-1-alperyasinak1@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddtleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtvefgveekgeetfeeikeefueeivdeiieekleeukeffteeifeegveeffeelleehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegrlhhpvghrhigrshhinhgrkhdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 08:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6836

Hi,

On Sun May 18, 2025 at 4:50 PM CEST, Alper Ak via lists.yoctoproject.org wr=
ote:
> Fix [YOCTO #15756]
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 643a3e7ae..d73b0d30e 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4487,6 +4487,20 @@ system and gives an overview of their function and=
 contents.
> =20
>           INHERIT_DISTRO ?=3D "debian devshell sstate license remove-libt=
ool create-spdx"
> =20
> +   :term:`INHIBIT_AUTOTOOLS_DEPS`
> +      Prevents the :ref:`ref-classes-autotools` class from automatically=
 adding its default build-time dependencies.
> +
> +      When a recipe inherits the ``autotools``, several native, cross to=
ols such as

s/the ``autotools``/the :ref:`ref-classes-autotools` class/

You can remove the comma after "several native".

> +      ``autoconf-native``, ``automake-native``, ``libtool-native``, ``li=
btool-cross``
> +      are added to :term:`DEPENDS` to support the autotools build proces=
s.
> +
> +      To prevent the build system from adding these dependencies automat=
ically, set the
> +      :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows::
> +
> +         INHIBIT_AUTOTOOLS_DEPS =3D "1"
> +
> +      By default, the value of :term:`INHIBIT_AUTOTOOLS_DEPS` is empty.
> +
>     :term:`INHIBIT_DEFAULT_DEPS`
>        Prevents the default dependencies, namely the C compiler and stand=
ard
>        C library (libc), from being added to :term:`DEPENDS`.

Looks good otherwise, thank you.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


