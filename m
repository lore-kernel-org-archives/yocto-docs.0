Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FAECCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:18:22 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.web11.4671.1760609890335234664
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=TIhZeSuB;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Hd1eatpc;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 88390EC01E1;
	Thu, 16 Oct 2025 06:18:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 16 Oct 2025 06:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760609889; x=1760696289; bh=4sFmmoNNQV
	IIEvyZHdlOXezxUGBNiZWQw811c9avid0=; b=TIhZeSuBEwFyk1kcN2TPQ4yUK2
	eHuK3z/QYNGmGJSjhgUPEFnGhwuPjN2iL2YCaBTqhxm6U7uwIHsMNI6HsCMiIBpt
	+cHxoXsVWH9pXOiAQOACM+rl4C5/qls/SdfgjfUmdXGcNFya025HIN7BwPhsrhmY
	gY7g4w0cTxyLZggTG4jid8kRjfgLmaziwEJd0bxeF2wdDgtAlfa/bFTWdp/Ci9yy
	EC57v0Gfg34JrzNUoWqw+raCoMi6/pzSr9buWh8L5GOqwPgqzVj2VWAAUV2CaVzQ
	h7rMtln+GdX/7ZZhTLjhzANEEyn0d29qDgBUMjvR0tl6lF05zhxIvd382xAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760609889; x=1760696289; bh=4sFmmoNNQVIIEvyZHdlOXezxUGBNiZWQw81
	1c9avid0=; b=Hd1eatpcCw6Iuuw8pOuBygo74MVONBQFj3MODZqOmtqkiqfBMIb
	ewfcXitx+QQpcfI5WwHNVyZVpautJTcFwuJlKePbxBeoVwn4iY0sWoS6xpy/BVfL
	aiP/zKZsWZAUkHR4lfR3aJdCS2wMziiXhz7HdoQ6YI3dvX/dViShQdU9Qp1DEUp5
	+ChJ7kC19jJYfFUGztUAolyScA2/lIqctlVYRXMfIhDEJY8kv66OQ9bnnwkCgJoF
	B0CfMUUP43/b2Fbix/nAcDEvuK2gfs+l/Rbc9xwsjPgJ/TBJRRT45mK1Wlx3UfSv
	c7O8Ae3KDxzMbrr3vwg4rT1j6Jsujb8uAVA==
X-ME-Sender: <xms:YcbwaEy2aMIzYz219OSQgR9cOhzLU6gb5hTwY5pXih-3L1NVKmtE7g>
    <xme:YcbwaPvdP4Kzl8RhTTsgaJIFEoxzXQ0Lo8goHUxXELWbhFdFBBb4JJcxHz6IQNEI2
    tZJ_tJUnrQenXI3pIHWhTdpJJ4tZ6-KUZvuCwvuDfh5LDL-YmVPzUk>
X-ME-Received: <xmr:YcbwaDsOg1i1Q-1EpE6XrjgkA193RuVUPcAhKs2Gyg7WaRAspVvFXX8jLJFYoL63TFTcnCiaarkDvkz67XWmBQDbO8Bzpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeitdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
    dprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtoh
    hm
X-ME-Proxy: <xmx:YcbwaMOUxJ_33agxG71FP-7v5ALAKKPb8qcBIstB-QDEs-X3TVMFXQ>
    <xmx:YcbwaJ0EgEw68qBGfMXpAfIymo4XcpG4jQsYI620NPVe8EVMF_zV4w>
    <xmx:YcbwaAOG9Adr24gyfgk3sOf7wJgqgUTRSzgjGz_CV5K57AYRnN25TA>
    <xmx:YcbwaB3LGqax6qPZQFGbHDb8lpufg_3rpheCtK7mgnL5L1azT8zO0A>
    <xmx:YcbwaMHkBy0rIG3EJaC9ARx2uo3O2__zj8z0-mcaWoWzIWuQCtKCHWAl>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 06:18:08 -0400 (EDT)
Message-ID: <60819dcba0f54284adbd50543ec396dc37cd761b.camel@pbarker.dev>
Subject: Re: [PATCH 02/17] ref-manual/features.rst: add new opencl feature
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Oct 2025 11:17:55 +0100
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-2-20f21db1f93c@bootlin.com>
References: 
	<20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
	 <20251016-release-note-5-3-second-hunk-v1-2-20f21db1f93c@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-scg1bDF62lLGrH6yePDE"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7732


--=-scg1bDF62lLGrH6yePDE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-16 at 10:53 +0200, Antonin Godard wrote:
> Added by commit 3061d6061e74 ("mesa: add opencl DISTRO_FEATURE") in
> OE-Core.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/features.rst | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index 2c074ab9c..0d2f2ab0d 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -180,6 +180,9 @@ metadata, as extra layers can define their own:
> =20
>  -  *nls:* Include National Language Support (NLS).
> =20
> +-  *opencl:* Include support for the :wikipedia:`Open Machine Language (=
OpenCL)
> +   <OpenCL>` framework.
> +

I think "OpenCL (Open Computing Language)" would be better here.

Thanks,

--=20
Paul Barker

--=-scg1bDF62lLGrH6yePDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPDGUxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhQSAP9CcuK3fVZDV5agXTHpOeuJTuk633RVEQ9C
Jq2Tt+TtrQD9Fvu2Zx1uZPwlVQtULrjZe8upZraNzeApHs96GXlzbwY=
=c3l8
-----END PGP SIGNATURE-----

--=-scg1bDF62lLGrH6yePDE--

