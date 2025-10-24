Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3D4CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:51:49 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.web10.5535.1761295901797851145
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=UaL6VGr1;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dK5/PzqL;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CD4577A0047;
	Fri, 24 Oct 2025 04:51:40 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 24 Oct 2025 04:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761295900; x=1761382300; bh=XdGG4ngRXj
	SYt4FqnZG8e53Dndjl05gyLw1Qsk+u3+I=; b=UaL6VGr1xj84+r5x286+FLPDH9
	wpQad6thSsE5msZjQFH0/WOxcKReiS7qj/SGv1TZAKdT+fTQELRb+8H6k37f2wzx
	r/8/t+CtzZp5jMgPRCNHdacsyzfj+Iw5WUBVdmgFiUPEj3luXfVs3SWQMDJq8Eft
	qPcA8760YJrThW1jyUUU1EArtRjArBTxiNk+x2hQ0f4z0xhfSygkGeEHRogQ0FxW
	UaLwrXX0+R1CMPvP8MeKoczEW6QiZK7Dptv/vDCqJPWKX4SXkpH9CEi8DDTzVAfA
	WcIBb9hApfNmSD1U6oZKT8aeQLbbYlbfAUE9wSGM66f/PgY1i/qJi+3ST25Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761295900; x=1761382300; bh=XdGG4ngRXjSYt4FqnZG8e53Dndjl05gyLw1
	Qsk+u3+I=; b=dK5/PzqLKz12Cvg9vHVbpI+dVGirIGUnuE1FItiJCWR5wDnyDim
	eBUqlOe3F7S899y8zOEVryqh4dYQj5PBxxXO1svoG7m/8E3KN68RRSw4KewvkLaR
	+KWzCWP9dyKndIWkdf2tYg1MZCqUpczkgU1dHvOMgLxW+QynXBPwNJBkHQJ10umN
	wrtfkXXFGNFM6M/oUUPTZkoKNRrM06hqyoS0T2K8lQClUC+I7JeiNr5QPdVqNWVN
	kLSkzjhQMipsszYK1fwmKjZVaDb/VVqd5MSv0HwaG/1zsIY1X49kqa62s21o+i4a
	WeQfKrwZz+zlLQWaQJv9dhKWy8AnaMnNo9g==
X-ME-Sender: <xms:HD77aBZPg_78yHPX6x1kzeWACJrUDcuEOxWmj7D5PrNLQf7bUTgX0g>
    <xme:HD77aOYP0ivxWLNeTXbRJUpHLVbluNctkuIDyw5GbubdM6WkhK3aWH_Rxmk-ueNvQ
    _jD33VKNudr_P_f7Zm-Xxo561h60Swx9HkMhDLzM_S7tAKAWWARoUKL>
X-ME-Received: <xmr:HD77aBlfCrPQ6oJuh560T4cTlPIQPfoW-Jb8NjtPTrXashtjCc4rB_fxbVwNnLr67hnXdo4KsxtMjTt1BpIDMJTtqPZCuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhtedukedufeeghfffvdfhudeuhfefhfejgeehfeeuueefgfejudefgeeufeefleenucff
    ohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhes
    phgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphht
    thhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:HD77aKw8wQ0l962hjXGV0UMymkQ_8FcyVQD6JWWjHXDLjhgneegOUQ>
    <xmx:HD77aPPaH3jMcWomaqCa2u7eTul4Gdm_UnfaMlEC9mS7R4UjHBA7Xw>
    <xmx:HD77aOR24vOqrclsLlHgRTQOuC-NHdvQeabiD2E0ZLYTzo8QKUxGvA>
    <xmx:HD77aNYpAnwYpY1z_ywShugfAIh0K-cc5akgnhJecmm-ovUi_svZZA>
    <xmx:HD77aD4V5dXQDgg4NjrW9Z3u1z6H2W1A8rAPvnBugRh8VIH3ZsRBRtDO>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 04:51:39 -0400 (EDT)
Message-ID: <7ac5874010cb90849578cf48ba73c4747f9f675b.camel@pbarker.dev>
Subject: Re: *very* pedantic observation about how sphinx spaces bullet lists
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 24 Oct 2025 09:51:34 +0100
In-Reply-To: <bba108a7-aba1-f4d7-776e-6ebb1431f84a@crashcourse.ca>
References: <bba108a7-aba1-f4d7-776e-6ebb1431f84a@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5C3ZiAg71GKzWSxjHZfK"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:51:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7809


--=-5C3ZiAg71GKzWSxjHZfK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-23 at 07:52 -0400, Robert P. J. Day wrote:
>   something i noticed a while back so i figured i'll just whine about
> it now -- sphinx has a curious inconsistency about how it spaces
> bullet lists, and you can see an example here:
>=20
>   https://docs.yoctoproject.org/overview-manual/yp-intro.html#features
>=20
> the pattern seems to be that if a bullet point consists of a single
> paragraph, then the next bullet point follows immediately after with
> no apparent spacing (as in the first two points in that list).
>=20
>   but the instant a bullet point consists of two or more paragraphs,
> then sphinx adds a bit of space before the next point -- see the extra
> space between points two and three in that same list. then it goes
> back to no spacing for the rest of the list.
>=20
>   that appears to be consistently inconsistent throughout (see the
> other lists on that page to confirm). not fatal, of course, just
> visually weird.
>=20
> rday

It looks like there is an open issue for this against sphinx_rtd_theme
[1]. We could try the CSS fragment included in a comment there to see if
it fixes things, or work with upstream to land a proper fix.

[1]: https://github.com/readthedocs/sphinx_rtd_theme/issues/1555

I'd prefer it if someone with more HTML/CSS knowledge than me looks at
this!

Thanks,

--=20
Paul Barker

--=-5C3ZiAg71GKzWSxjHZfK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPs+FhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bomoAQCB8xfab5ojJs5p+etmcbaBl88Rq6sI8CGH
pMi9ZfyjmAD/baK9RgWnZTwZt9Mev8c/qD/FMqHEoaqyeOqaMQx0lQ0=
=rVVe
-----END PGP SIGNATURE-----

--=-5C3ZiAg71GKzWSxjHZfK--

