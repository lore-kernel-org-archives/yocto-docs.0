Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BECCCCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:56:59 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.web11.5729.1761296209880280547
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=pEJAnQD2;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WDCXfPTI;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0FA697A00AB;
	Fri, 24 Oct 2025 04:56:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 24 Oct 2025 04:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761296208; x=1761382608; bh=mWFOBOaKNi
	UyRrtmAliXUR7N5B/+xJDTqhjjqtEcY74=; b=pEJAnQD2WpS6DtLVEfA98s7Byq
	WuUbr92T1eZu6IEr3jANlZ7gtSzPiURoqbnT508Li6/6GCYaDAY8kG72p0MnSm1p
	L5llwMagTYIttMiWU/nU6tZSzFDQrCoSj2vimpYLzFJdagTHkVi7QqHZXGWFpHuB
	sFzzigph+KHOYc7pi7J/Q3KuAs+OIiEAJ6G1g9Zs5g4iPoF8rHjfB+DDVgXWJfHl
	slwDPlQ/c1yakpexGZ+l33spraRhA1HkzECfVxtt5udvVYC90cp7n3krupl0N4Fk
	Qoo6YCOXbyO1qoDf4Zw1O4WZ+nUaorkfYQJVPRP+P+O03uUTrZe0sATqSBgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761296208; x=1761382608; bh=mWFOBOaKNiUyRrtmAliXUR7N5B/+xJDTqhj
	jqtEcY74=; b=WDCXfPTIbKyB2UCFGUUFIdMkwkO4n1RjfWi1KH84nAGsaY3ImDf
	hx0wYqkVf1dSgGdSMKeqlkjYfY2PtXA477mxonGQWj49YRlHWmiGirzLA5aAXKfn
	NDKgn0w9sCiJvOzTkor6uzBWCoSwQKsp+d0cRvXzeMNPKttnO78mYRQ2thneHSxc
	q0CbLVqAVxmiSvYjlCxV4494YWdghcOgW4LGuJAx8O5Ap2auoT5ZGBmUbFONy6mY
	oYbRJ0v6QydqJWAlsqTD3007xoF+XhijUcZXVrjKw5kBUHOk2ECqIMXElcsRfcdT
	0znwmG9E1ZhwSRr7cMH427YEUnjit2dgJ6Q==
X-ME-Sender: <xms:UD_7aES7F63zeOUeZ9vVxUbYpeSiqLUjK5Zc8-RK1d-5A9UOU3ytvw>
    <xme:UD_7aHxznXjShc69JttuMR-vt2anS7ycWfg679Yj2eyJjSgOkNq8lSEpVSB0UTvC7
    clcS06Hz9jE9LdKK9Qd5d6h2VF86kMKe9oRFeF2eUQNdd-34JZ2Ww>
X-ME-Received: <xmr:UD_7aPeJZANxiNAQX_Zn1Z2ocE7fLJGVqmkyD9Lc5_J3-lc8PEDPWHPliLys54Bz7LltdydfK8Lh7VHPZqfiyItoxcDYWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekledvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:UD_7aDLxUE8VB-uzRhPMqgSO0Be6yIpViwqXQLQ36p_e2OyE5ntn9A>
    <xmx:UD_7aAEcCB4oUnbQ0WsytzpFQfrdMhuF6dJ-gED8As8W8DnifxiJDw>
    <xmx:UD_7aNq9IF_VI0jZZZqB9l-uAap2Nnr1lfc-ju4ELcZfwPkzJm3lBA>
    <xmx:UD_7aJRkD9gzIBauKjtdRVL4_oU-8mF7ZTjCiZ5mw3OyiV5k2VdcAQ>
    <xmx:UD_7aIz5SRPSgW7-zKPhuULtMDqqgDqDGy-a639tAkiPgzK6_Dz1LAQ3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 04:56:48 -0400 (EDT)
Message-ID: <89dc93e796c8a8ab920324f64168e4a5f04cd51b.camel@pbarker.dev>
Subject: Re: observations on YP overview manual, ch 3
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 24 Oct 2025 09:56:43 +0100
In-Reply-To: <e59c985c-1b0d-3702-fb17-363ad6ed161c@crashcourse.ca>
References: <e59c985c-1b0d-3702-fb17-363ad6ed161c@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jIP/t7hJtbIN7eOqCVYy"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7810


--=-jIP/t7hJtbIN7eOqCVYy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-23 at 08:40 -0400, Robert P. J. Day wrote:
>   from here:
>=20
> https://docs.yoctoproject.org/overview-manual/development-environment.htm=
l#
>=20
> * section 3.3, "For any supported release of Yocto Project, you can
> also go to the Yocto Project Website and select the =E2=80=9CDOWNLOADS=E2=
=80=9D item
> from the =E2=80=9CSOFTWARE=E2=80=9D menu ...".  i do not see any link or =
menu entry
> named "SOFTWARE". same claim is made a but further down.
>=20
>   ah, the graphic on that page shows where it used to be, so that
> graphic is clearly out of date.
>=20
>   i think that's it for that section.
>=20
> rday

I don't think the website screenshot is adding value to the docs here.
We can drop the screenshot and update the text to match the current
website.

Are you able to send a patch for this?

Thanks,

--=20
Paul Barker

--=-jIP/t7hJtbIN7eOqCVYy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPs/SxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgc6AP9CFQ7pv68y+/h8pB4n7e2j5Dt0L/ClBNeb
SJpzDxAq4gD/a+ZwRoGT/iWC37Wglx8FYa7eVssUHfNfoj5Il+jN6gc=
=AAwp
-----END PGP SIGNATURE-----

--=-jIP/t7hJtbIN7eOqCVYy--

