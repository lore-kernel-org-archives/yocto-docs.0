Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93293CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:02:18 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.web11.4625.1761292936554872574
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=QI0xpF4B;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=KvCqeG/3;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id A50281D00109;
	Fri, 24 Oct 2025 04:02:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 24 Oct 2025 04:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761292935; x=1761379335; bh=YNsndGVF3C
	R/N0i7w+cw+/SWXzWZwtK85KUE/QMvpGs=; b=QI0xpF4BZuFj9+3mCk6woFWw6s
	8WD9AxBp/LdOWi5OKC5XjmB7K85EY9ZpqFIxJGFkV55k7NY/iDQALNIG+3RAPI50
	efmrg4PTUmTdyj8zvTvrJrsbRgxMWR3AYSKJaNkUNHFOd+2YP2l1738BJLiKwKBG
	OsnXJGwODcindn2r2WhoOZpMbDBSmMAzcwUNG0gFTneXf/O05gTNP5gaF2F5zl0t
	+/lFH+pQht8Hb+NpY/hj0ycrP0ZJ/CM0KZGEHfeKpPEfzZsO6AgJI8/jbIBV+GMF
	DGGFiEm6FtLNcHwQuxRtITan1PQlO16ZMOpfVo3kPpODWV6lEvBzkBRiFLfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761292935; x=1761379335; bh=YNsndGVF3CR/N0i7w+cw+/SWXzWZwtK85KU
	E/QMvpGs=; b=KvCqeG/3E0TGJ8xfCZ322RHAhgxAbVLL3V7kjv8romeQzyrabWy
	q1re8PqAkDrLVhztHT7ZWfgm+amf/6Use/ByxMqxCFihv1Kv5754ubx9GkTcYADe
	l3IfS4mYMvADBFw+T8YUzd/w6vxkZ0wFHquM+SDzR3ZXTDbNgRr4hbXdGQXD3S0m
	6v1CpVZNHXajDICv8J+/MVcn8HVuxIM6lttq9yKwzZRVu0IlHcLnQnK++6lws9gX
	ArJacmtW2yhprZ6RcfmzDfxn0HdWA1uKppOCF5OdljOJ/7sVW8L+e3uyJ+WFbgek
	L+7xnhaQJebFKobHMcI52p9b5Z0TFjFKRlw==
X-ME-Sender: <xms:hjL7aNwLw8vuJunoIPySFe2p02GEFe246y9uDRCd0ju_HP_3-Sa4RA>
    <xme:hjL7aDRUF46rAowA1GSF1vpxovEIax34jWJFsU5xMobzCRvtol_9mzuKZtaBOejzG
    me0pBWOAdwgOKYyMKdQqAEHIwz3Dhjz6lehnxw51R28falDp3vRXw>
X-ME-Received: <xmr:hjL7aE-IzmFw0aYFZBOtO3Jy1rxmYwX-7ElPXFKAW6IcfjKQbT3S8pILgEqs0KUfVE3jPTtbHnJvHdnYUTe5Jq-ijXnWIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekkeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:hjL7aKpMFYaF81cyNPRudSd8wQ7eNYTYTZplnRwcCew16Y2Td20f5w>
    <xmx:hjL7aBnecDzuTaZKebhCPKPfRXYgNN2Bu4NwgtGaFOAHd0uEJfzWAA>
    <xmx:hjL7aBLyPC6mqIN9TEDB9aulazSxeQR3pEnL7BrANMQQqe2qYzJ1ig>
    <xmx:hjL7aGzwmxGdpRcdOOl83X8TfU14SN9EDRwv-nTZhdvZv5y3xMZ0IA>
    <xmx:hzL7aKRcBeG4iZjomvFTPsQ2708AS3SMTN2SoEA63eCgiJzQLMuyZCvt>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 04:02:14 -0400 (EDT)
Message-ID: <1c205189a61b52ec8cf56e8f283ec7ff72169cb1.camel@pbarker.dev>
Subject: Re: the bullet list indentation in overview manual looks weird
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 24 Oct 2025 09:02:09 +0100
In-Reply-To: <a4a0c9d4-bccb-00e2-4232-2a1f1066a839@crashcourse.ca>
References: <a4a0c9d4-bccb-00e2-4232-2a1f1066a839@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rNFiIj5e8IAUKKGL8jlt"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7786


--=-rNFiIj5e8IAUKKGL8jlt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-10-22 at 11:01 -0400, Robert P. J. Day wrote:
> here:
>=20
> https://docs.yoctoproject.org/overview-manual/concepts.html#source-fetchi=
ng
>=20
> the tail end of section 4.3.5.1 has a strange-looking rendering of the
> bullet list, with some unnecessary(?) indentation. can someone clarify
> that that rendering and indentation was what was intended?
>=20
> rday

I had a quick look at this. It matches the nested lists in the original doc=
book
sources, added in commit 5765987259ac ("overview-manual: Updated "Source
Fetching" section."). But, I do find it confusing. I'd support a patch to
remove the confusing indentation.

Thanks,

--=20
Paul Barker

--=-rNFiIj5e8IAUKKGL8jlt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPsygREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhPtAQDt13v2FJZbNz0+eXXClk4pOLR2ce8xDdb1
t6aMx+jEuwD+IXaba8gRkcx9sZaWkwP96hTv3BvuPcExEX3rygby7Q0=
=BOzS
-----END PGP SIGNATURE-----

--=-rNFiIj5e8IAUKKGL8jlt--

