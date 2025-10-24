Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7AECCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:09:08 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.web10.4601.1761293345855715905
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=iKBMALyf;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=IZmr40ax;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 1623B1D00158;
	Fri, 24 Oct 2025 04:09:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 24 Oct 2025 04:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761293344; x=1761379744; bh=oSFE1rJxzn
	ETX9zD54mZ/UVgb6YRkAew2o8ke2gltoI=; b=iKBMALyfWIN9V3lpbH9AhQRv2p
	873NBoWMquy+6qCFHcTKCfbHGKS3u3PnZVwIXRgLM+E682BT3cOP+O3kQH1/yYSX
	DhWOOb9sgPr4qOos8aU/IIADWqgD2XGcRpu11j+l1jgOzdQxE4bmf7yFOFJ4OiED
	NqVMumtZFu+hL7BvgCTbRc2fSODQxfUUgRzymyZVJhY94ikwZM1D77zWASuQGZBP
	t+q1G4Jx3tb4fa7m+HbGC4PcKreQCd2tRV0VzmEJ3AFcjRoesyTQqvwHM4yi9uK+
	GyM4kVqInd9JajXosFolpfWikGnXrY4Xekcm0AlnRsBkhcpzj3/T0myQefHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761293344; x=1761379744; bh=oSFE1rJxznETX9zD54mZ/UVgb6YRkAew2o8
	ke2gltoI=; b=IZmr40axHmC4BdXxWNZOKeK+4Z1vTXfrHznCkiyRrWLBcE98aD7
	pvHrWJSUgLC1q8pCmkbIgHv2EdE14YTbCW4iaQD5UH+yg8TbAFRuDXMCNwc3avJM
	t40/qbpWJHk3Yrfyts8NSGBDocEbQ2G7BRU4pFN1db9jDIyjXGyhF2ed1B9zBOEH
	b/Hfh2CTFLitL9wVIZUbOstwfW5LqSZRLQTfNvJrkQmDLbyMKkhrl4T7uB6IHB4M
	nwjI3qJqhfhhG8nXvvZ8ALXuuCr1F4QKumUC3+U3BxGv8qCSMiTlZgLxGK1l8hSv
	2sOAa+Z7lP9BkJ2Zf39SfY+71Muip0EAUow==
X-ME-Sender: <xms:IDT7aGiddsWqzlCadpR4Q5e8X_7MHjdLLHzO0YUOsqI74xL19wdHEA>
    <xme:IDT7aNAUYMkRBJYao83nLL5AsZ6zMW4h1d28GXAveeQWt5JymEG46tEOxNHjGRCfo
    A6r5A08OE154P7S6T40JTLbr6s_voihV_-E5vTHcYWgsQMB51Y80g>
X-ME-Received: <xmr:IDT7aLuypNQxX1oCpT0iY7qAxCW8eV1P1W6mlEKW70GqYi_6PDoV6_d0Wh7N93cksx-iHBslINm5_t3RYcqOL62yRAJWTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    ekgedtffekieegheeukeegfedtgfehfeejkeejffejgffgiedtlefgkeekgfegvdenucff
    ohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
    pdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrph
    hjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhs
    thhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:IDT7aKZk8piB4fVTDjHkF6EvpbB2wJ7exPFYufvi5QDQ0Wa8I5_sHA>
    <xmx:IDT7aGV8cIwNK4srCCZlmk52dAVgks4-kkRAU6ltEUqmhZd_Et015Q>
    <xmx:IDT7aG6gW7z4HHt6D1lNzMyqO4b77nWdwkq4Qh75BKTiwKfH0Z6tSg>
    <xmx:IDT7aJjVIqoLt392RnVBBkPiDd1kDYe4WSLV_cWXKj1U-HCU40EwUg>
    <xmx:IDT7aHCDFLMr7RpPJ5QU96jSh7LZ8xLcB-eF0B3O5sh52GHiV0oDAMo->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 04:09:04 -0400 (EDT)
Message-ID: <14682cecda7f4c87fb6272c95a79cf8388018940.camel@pbarker.dev>
Subject: Re: where is the "ECOSYSTEM" tab on the YP home page?
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 24 Oct 2025 09:08:59 +0100
In-Reply-To: <3f870a18-887d-bc8d-6243-8c84a6e9af09@crashcourse.ca>
References: <3f870a18-887d-bc8d-6243-8c84a6e9af09@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-v9OD/cG3eD721GapwA3h"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:09:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7787


--=-v9OD/cG3eD721GapwA3h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-10-22 at 17:45 -0400, Robert P. J. Day wrote:
>   from:
>=20
> https://docs.yoctoproject.org/overview-manual/yp-intro.html
>=20
> "For a look at the Yocto Project community and the companies involved
> with the Yocto Project, see the =E2=80=9CCOMMUNITY=E2=80=9D and =E2=80=9C=
ECOSYSTEM=E2=80=9D tabs on
> the Yocto Project home page."
>=20
>   i don't see an "ECOSYSTEM" tab ... am i just missing it?
>=20
> rday

This probably refers to an older version of the project website. We should
point to the pages on Members (https://www.yoctoproject.org/members/) and
Participants (https://www.yoctoproject.org/about/participants/).

Thanks,

--=20
Paul Barker

--=-v9OD/cG3eD721GapwA3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPs0GxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bocSAQDO5Yp/fKR4uxW1/XdoMFTklNU4EknjH1TO
3b5crW/gSQD+IhvRlMOPq15HrZ6eMUnBEDXh73uAQoRPy/z31Oeqqws=
=mimw
-----END PGP SIGNATURE-----

--=-v9OD/cG3eD721GapwA3h--

