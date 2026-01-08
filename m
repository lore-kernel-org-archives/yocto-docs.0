Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18379D1D47C
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:27:23 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8916.1767886031398830458
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 07:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=aZsYUS/L;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=g2h7TH1X;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 90DC31D00128;
	Thu,  8 Jan 2026 10:27:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 08 Jan 2026 10:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767886030; x=1767972430; bh=YpkO9567eY
	M1tMqBk+3aeKVkcXmALCH769ja2SZtTac=; b=aZsYUS/LnJ5vqSOoxaNTiG6MPV
	qtZLDvLqJW9nJiYkmTtIVtiOXngnS1ByYT6XBf8BrxAuWHnMxjA6MPr6l0KMQjcF
	J55qooUegMKfyQ0OIqbrmicphe4zb4XStxIKIN/vHXI6Mv9jDrAf1orCR0J4k9Jk
	5ImFuyE6tpmyDiUwJGXQEFsmStGBB3WY9xSQyrFLf1pvByakpiGFn118RPqt+H9V
	KMZhbb6qUVcJGcG8WUl2ShHv/og6yGbYiNbbbTbtv3dkFKNDmTiR/vRl17WIYrcj
	XI/eqOwtF5xJQk5GidU0e6MGZ4ApGNsypNJgLFuxi//9QqPgxWUYGi+XqyGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767886030; x=1767972430; bh=YpkO9567eYM1tMqBk+3aeKVkcXmALCH769j
	a2SZtTac=; b=g2h7TH1XSzSiMfdN3zHtdV61cdfmefdTXN+GwK5o3aKYQ75+KDW
	eJ5UFzWM2prZ5jAZ8+mglMaedcZto/wcJ9/vv2VBH64XqxYQi28gIY0KC8Tpy7Pr
	ykMnqij9PQixEd4Rdm/c8JaOiU5dlRu/XKZ41dGlQ8ljF2LMo7L4Uh+JITFP87mc
	fKSqMksuQ9WpttLhCaUDyllFbk4F1+7e1dxEOe+kqNXZd7gUJp/dLfmjDKGKL+Ue
	AQPiEpQ0fi8DEGhRBY+CfH3cSwE4c7FRUFvGbbZdPObdk69F/FOHzIkYnzUuGHuJ
	O2ACz2Y8cLLuAA23eC/Qerl+5yXWK2r21lQ==
X-ME-Sender: <xms:zsxfaWHhNLWkZ1eb4ixzSxhUB6rBpR8UmNAgCfNMa__yOG7LLFnq9w>
    <xme:zsxfadW7AGb3NAIxD-I8i6YSwuRk5KEd87KL7YLuxpESPEp-3YmnzHNxCpaP5gf99
    ZJmYTQmd2ix8PRspINazOL2Afpdo8rwyiPlRNxeq8YBZtEQmyQL_A>
X-ME-Received: <xmr:zsxfadxNtikBwhrGmk2iI1algPgOZxPbCABYgUaNabbzuCQVv3m0flkteOLjtN_dEg1puIYPCVwZN4b2LJ7vK8ZOU5ie7GfDf7_nsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeifeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zsxfabMXPUM52MKoLmESgWBCaxcKzamHCPOrf4mewpfOoIHOJyJ0YQ>
    <xmx:zsxfae5mGIGCIwYSdfd6nqMetm8q289gysbCkVw6ylth-EIUeZzL1w>
    <xmx:zsxfacOS3cicB5mTFZDhRl0cb7rcC9VSSqIKOQ5-egLQhbHtdVmRkA>
    <xmx:zsxfaclhi9lRQmUDgNAG5P-RilRyBGL_XcLHwAh6Mug7aaf9FQ2mgw>
    <xmx:zsxfaVnSv9q5PiaRD2I7Sh7y1NoTHjvMzLitNqt_kdyKbnS8mvV4jw9j>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 10:27:09 -0500 (EST)
Message-ID: <d6abdea85e90b852c59b2f79960c6399f2f60f51.camel@pbarker.dev>
Subject: Re: [docs] how to properly render option double dashes without
 monospaced font?
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Thu, 08 Jan 2026 15:27:03 +0000
In-Reply-To: <3a81c9ef-61a4-7ceb-5eed-55d3b1637c2d@crashcourse.ca>
References: <3a81c9ef-61a4-7ceb-5eed-55d3b1637c2d@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3jotqiNS6cZ+iXX7Oraw"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 15:27:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8426


--=-3jotqiNS6cZ+iXX7Oraw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-08 at 07:23 -0800, Robert P. J. Day wrote:
>   more nitpickitude ... here:
>=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-intro.html#executing-tasks-against-a-set-of-recipe-files
>=20
> it's hard to tell that there are double dashes in "--buildfile" since
> it's in the regular font. however, it seems that they will be rendered
> more clearly if one uses "\-\-buildfile". i'm going to submit a patch
> to clean up a couple minor things in chapter 1, is it appropriate to
> add that change as well?  (and anywhere else similar?)

I think it'd be better to use a monospace font for command line
arguments.

Best regards,

--=20
Paul Barker


--=-3jotqiNS6cZ+iXX7Oraw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV/MxxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bmPQAQCnMn//+adsaJlPtr5eWOaJYuCBPiAvuUQc
H1Bz70PSDwEApanm7gBy+fkxAffjVK8IPN6UUxbq9scLOcsEaPvUPwo=
=DEuK
-----END PGP SIGNATURE-----

--=-3jotqiNS6cZ+iXX7Oraw--

