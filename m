Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABF9CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:32:22 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.web10.4718.1760610736607272545
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=UyOs6h6r;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=wEvgGuAj;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id D8E78EC00FB;
	Thu, 16 Oct 2025 06:32:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 16 Oct 2025 06:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760610735; x=1760697135; bh=uCu1jb/3Cb
	XqyEEwGnKmuT6GtvBd8iNEhvsmtwFrhxc=; b=UyOs6h6rDWOncjPSIP/s9t28iy
	40DH01wBKEPtq/czQg/ej55Hb7SUc9jAOAFP0U1GG0AsaKZlZefyZNlprkKGGZFl
	BfjIBM4B6q7/wZqDwRxNg3p7siO5DzN7QqwdqZG2YsSIipwvtUlX2WqHooXZ2adh
	nxA3z0VE2dj8imgJ2lvqYO8wPvlJqme7zltZ6hWp/Jb+UYYSCMieWgm2vC37mflN
	SxpDlzRdnaYXn7sygn+3R6tpynqnSn01Th3myLReP8tvsDIAT0xgpRQSmqU6p+rC
	JEAXaYm8YgeG+nZKD9xNOpdFHI4oWPL9NezHHbCk0+c7nDAaYUbyLjblmAvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760610735; x=1760697135; bh=uCu1jb/3CbXqyEEwGnKmuT6GtvBd8iNEhvs
	mtwFrhxc=; b=wEvgGuAjiPlrCEz0P4ak45pa2moPrJmd09pSut7JzvMAJjI/x/L
	ykDOEdQ+rveOKpo+dcRwUf9OHw/Ri/3LGBVZ8T5nb1Qee04UGAjI+J4r5al3mC6w
	nyQ1iwwe+TQ5pKoQGjwOMlsFhRy62pZimJLfmRnnYyZMSZHYokmqqBusKZYbW7aD
	XxZcAy1vO3sZynUTTcJIfyITzQxyQ3v99Rz347OAGcqtnPozYtd0nXV63R8K8BzK
	Tz9TXrW1U8d+QH6x2HfLQN9sOuA07bQIAliXTG55/7/gducjOIht5DPfB/SztoW8
	VqDAlZPitDbNlQTRWWsAChiY7EFX00XLz3g==
X-ME-Sender: <xms:r8nwaBe1awUsz_BDEZS_GNTxbsTiKBu9JdW7ME9ucFIRGjPAUYpVPw>
    <xme:r8nwaGq8lKjjP_0sAc8vNNJB1-fuyi0MDzp9v-GAHKeUAKXFyNgMTyqZ9qZuNpAZT
    nOFobBrGI_2pvgU0UJIvfov4KWsye6E4NaP0IXsqoc9YGW2rlt9Wv8>
X-ME-Received: <xmr:r8nwaH590TosKeGzu7Fec7blOirdDXa2nN1FaRQznXgGd-RnbvGn5BvX1WWU2tJEA1NlBHyZtNsAvkM8ucuRgoqwYitDfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeitdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:r8nwaEom5B7rNPHEyjv3brzno14zsjlXLVUGsU3WfRzEHzeheoNHyw>
    <xmx:r8nwaBhFJARBHRCHO4KeJDoAk7ikkTH3iWZCh_bnaIKWb59zHz-Ogw>
    <xmx:r8nwaGJ8NuaoWnQAXs6ZR6M1xFlDHidYdZJEWFAOq_AcmdiGxenD0g>
    <xmx:r8nwaJALHg1xCE5_LIg3foQc_xWAL2_ioUE_riCkKLBaAScFoHeJLg>
    <xmx:r8nwaKB2d1_x-rOv4AKrZRGHoGGaFf5o4PcbdQm-g1S_wPdcDDRat87C>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 06:32:14 -0400 (EDT)
Message-ID: <b1e422d10be2eaef34b643f914b043a757a94005.camel@pbarker.dev>
Subject: Re: [PATCH 04/17] ref-manual/classes.rst: ccache: mention that the
 host's ccache can be used
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Oct 2025 11:32:06 +0100
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-4-20f21db1f93c@bootlin.com>
References: 
	<20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
	 <20251016-release-note-5-3-second-hunk-v1-4-20f21db1f93c@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Tk5e8XXEs8WxmEr3VovD"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7735


--=-Tk5e8XXEs8WxmEr3VovD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-16 at 10:53 +0200, Antonin Godard wrote:
> This feature was added by commit cc91a0f6500e ("ccache: enable ccache
> for all recipes if it is in HOSTTOOLS") in OE-Core.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index e89b27eec..f10903e74 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -392,8 +392,17 @@ file for details about how to enable this mechanism =
in your configuration
>  file, how to disable it for specific recipes, and how to share ``ccache`=
`
>  files between builds.
> =20
> -However, using the class can lead to unexpected side-effects. Thus, usin=
g
> -this class is not recommended.
> +By default, :ref:`ref-classes-native` recipes are not supported by the
> +:ref:`ref-classes-ccache` class. It is possible to add Ccache support fo=
r these
> +recipes if the following configuration statements are provided from a
> +:term:`configuration file`, which makes the class use the host's Ccache
> +instead::

I think we can be a bit more explicit here, perhaps:

... which uses the host's ``ccache`` binary via :term:`HOSTTOOLS` instead o=
f building ``ccache-native``.

Thanks,

--=20
Paul Barker

--=-Tk5e8XXEs8WxmEr3VovD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPDJphEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0br7DAQCauyIecj/4pIev9b2dfB61x3OPYThR57G/
CfC9YLZiuwD7BuclC7M46gBaH/sTRxYIRI4YsdxV6bN/LE0iM0ycEgA=
=ue74
-----END PGP SIGNATURE-----

--=-Tk5e8XXEs8WxmEr3VovD--

