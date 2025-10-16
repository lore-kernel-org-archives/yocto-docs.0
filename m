Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E98ECCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:41:42 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.web10.4887.1760611296971750574
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=vQJjNMT9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fxsYURnY;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1718514000F6;
	Thu, 16 Oct 2025 06:41:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 16 Oct 2025 06:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760611296; x=1760697696; bh=FCHG7GyvRd
	tuzr/PlSsHOJUKitmtqsDCGm+jmZf4zHk=; b=vQJjNMT9UKpk5Y7JfNgL9EfDq6
	Y+Zx7ZX29QuSm+laClbgpI1SJxTnFOPXtsGwEVLMG5N1OAGRex7xbL3uixBelmYd
	bD//B+awOS2W+8WSi95L4flrj6BgKyfaDCH7tdKhQ0igsRHHAnqavqHOAh5MRAwk
	f+cZWZhROJjCvEEJylhFyrilQ9zacPJ/PuCVlG2F3wd0fTq50iL30RD/fg5NwLRv
	WNZMe+0KNr3r3/fsddnsFkxs2ncT6J3YrmR6/LfT2UO7GBqVRCpAR8IV1Lvt1Jnp
	d1LtDkinf7JWUCHQ93yuH+z+fE/HaIE4KAmXm07gjs5npP2FPst4lKmGyrhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760611296; x=1760697696; bh=FCHG7GyvRdtuzr/PlSsHOJUKitmtqsDCGm+
	jmZf4zHk=; b=fxsYURnYqeIP719VR504/i9dpwBosj/huIeg6NhFbTHEWS8XkCH
	9HI2n/Qk1Nh2L+80DFqrSZ8fbKx2BPYTYXGJXC1gwpLpQGvj31irpuICu6pj62wx
	9GNXxoNQ/u4RZ8snZ7rR57uQz6Wb49+s2IOGOQHrRqQdg+SVJ48OZ2+RrkPmQIlg
	33YgMIZKcUSpvZEUBdq/TgmxekiCjsD7guBeBrWpV+5uBqezt9dG7nrfPJytnuOQ
	he+uNvbuN+BedwlCnwyM3KXR6ZsYLJ1PySp+kU455f2faEEn6U9svcZonMAGfU7H
	ioAgRA3slG7RvoyV5sMTErcS616+9I9jH/Q==
X-ME-Sender: <xms:38vwaG8mRr-uQ_gnN8nCFbBb_aYAwPhtwQQ_ItRS_QJgJLaLC7lMxg>
    <xme:38vwaOIOjNmgvascklc0THHa5dTlEvP9L-Y2CyD379_CBFbCb89TCtKPuRTCTiSe2
    buua91wIxsAMD6tis-kS6eGqi8JU1RkLJLRhkfAKQMr8je_2HEYzEU>
X-ME-Received: <xmr:38vwaJZq114tsXpBhvdoNN8Zx5TstFlOTdemkVk9GsatVfKXP-kYvLaj-MJQpYCyPt2Lb7D4dK_HwL8WCkKhYIHTj_gpZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeitdejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:38vwaIKpjSpzZSf7gOFNNJLMPnQLHyJ4C79xubMe_lpQoxeStzsieA>
    <xmx:38vwaPBz1c6ne5EBrThAqEqhVL6QTS8_nKD-LtNncaChW6h9PhZxNQ>
    <xmx:38vwaFp-3eLsJykckLTm8-l6FfGye8cdBXTZx-KzojGGV5y_3tXTng>
    <xmx:38vwaCiynowWqTmynpZZZ2O2zLQyTKqQeYE4SFcOm3_36NZfToqlwg>
    <xmx:4MvwaJjUXj6Q3e9UqHzm__EzYwp73bmYCGJpB-jilcgiot2OrsD0jYwz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 06:41:35 -0400 (EDT)
Message-ID: <7f4c1d050bc4f2774cc2576d56f2af4c08b490be.camel@pbarker.dev>
Subject: Re: [PATCH 15/17] ref-manual/classes.rst: document the
 relative_symlinks class
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Oct 2025 11:41:30 +0100
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-15-20f21db1f93c@bootlin.com>
References: 
	<20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
	 <20251016-release-note-5-3-second-hunk-v1-15-20f21db1f93c@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oQz8ph9xBnPNVNBlejZ5"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:41:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7738


--=-oQz8ph9xBnPNVNBlejZ5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-16 at 10:54 +0200, Antonin Godard wrote:
> Added by commit e478550c8cd8 ("openssl/fontconfig/bzip2: Use relative
> symlinks instead of absolute ones (using a new class)") in OE-Core.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 9fbdb22e1..4d74563e1 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -2494,6 +2494,25 @@ The :ref:`ref-classes-recipe_sanity` class checks =
for the presence of any host s
>  recipe prerequisites that might affect the build (e.g. variables that
>  are set or software that is present).
> =20
> +.. _ref-classes-relative_symlinks:
> +
> +``relative_symlinks``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-relative_symlinks` class walks the symbolic links =
in the
> +:term:`D` directory and replaces links pointing to absolute paths to rel=
ative
> +paths. This is occasionally used in some recipes that create wrong symbo=
lic
> +links when their :ref:`ref-classes-native` version is built, and/or woul=
d cause
> +breakage in in the :ref:`overview-manual/concepts:shared state cache`.

Typo: "in in" should just be "in".

Thanks,

--=20
Paul Barker

--=-oQz8ph9xBnPNVNBlejZ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPDL2hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsB7AQDGTVxiWtNGvcbFJkQ1IaCvQHGREI0KeeZ6
Da9qx9T7CAD8CXeD3uLBqelnt5l5Kt9F3RPvEYxMlhsItiQzQs/GdQE=
=9tA8
-----END PGP SIGNATURE-----

--=-oQz8ph9xBnPNVNBlejZ5--

