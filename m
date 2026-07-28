Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46673C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:47:57 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.874.1785257270321929859
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Q7AsnsFA;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=PL2sLQc8;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 58722EC0383;
	Tue, 28 Jul 2026 12:47:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 28 Jul 2026 12:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785257269; x=1785343669; bh=jD5MpBE4qG
	a4ZmBR3cdKaRHbOOCbL3o9GWi2z9RKTrc=; b=Q7AsnsFAsGxqA7JV6+Y0VmYeW8
	qzoD9bePVyDLG4BgjjTfpmeu1PnpYbsOh6NwHib0mw3f7cqVHvcKawR1a0x3U2iD
	+nJ57q7v8kcLJB7+J0/oZgcfa5G1hrfq2hDHVON67gwSBEGi5+xwL+BLgtNS3MSu
	PJDEYMHOWujgEmcyOm5h5zBBI/o4mRODcoTTQTYpqmqOpbwg81YlTg3q4b80mALK
	fhay2GSevZMLeRvepOWVI8LQ+CPEtElhzM11KaPpaT0qZFmuRvqUm1Uo/1yj9IdD
	o9cXDOKosCWO3VfTN4KW/MDLJGZSxsuhuILEDaj/QHJgIKRKkCw2XZGW4Nzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785257269; x=1785343669; bh=jD5MpBE4qGa4ZmBR3cdKaRHbOOCbL3o9GWi
	2z9RKTrc=; b=PL2sLQc81wMVRFwiPOoosqXkxEpfnY+BXvvty/4sgYXk0d5Puok
	qjlVrS56b7o9EOhPQXXgJREMWmPIwS43g28Z1PTXljbipXDvpXrV9ezp3vwv9Gk9
	zyFqHYNrAvDY6RdffyAjmqeruNlF6IudLY4HityNx7tOVfNXk3rLiQtHsPRSyhFf
	ufiZKTYeyVksV6OsAWYNtVSfjdnzPBYwW/1NUR9g+uNKgNwcZ2smgFUkQ6W0lx9C
	8+GpbPmZRI4f+zcOuMPcIfR/BBQoy1USuE2gjegbGHk6Y+mxae6aF94NW3qy6epb
	qcUJAtv56tt8hHOXY9kW6wLoGrKUFR2Vc3Q==
X-ME-Sender: <xms:Nd1oahLDyllX1PbSK9XlUEyp5b1AF94KMKLhcsP88qOL4YxscKh3gw>
    <xme:Nd1oakL7XTo_di1N--PvvLaDehXYGtCsQmU3vFT5s3Jh7XNgfU7CiYXm2ci1XqCI1
    G5EooAOgmcCIrvoS8fxmGeY4BOkT3G5pUQ7dosRpgZdd0undMCf>
X-ME-Received: <xmr:Nd1oautUg5TN3bF03YXFyS8jCl7zdXulUaoWhGUiSr5R4AT0RW11Oog7dWMDCgXN2iB3QNLLJb8R7Zpz8sUk1rThmq6J-4q_2QRuxvuph61U>
X-ME-Proxy-Cause: dmFkZTGoyxWHUe4OPJ1ghU4SQzSB7al8hG2Zk02OBp8p9z+oI4xRqC/8UTKeBn5YrzEKGq
    tBx+0dHMYrJtRrIO33P0norGf3eT61y8CSxaA8it7LWHdI82g3RW/sK+QvkR6PuNGUq3sk
    bXYrYqZA1ykHhCHcvmanWzt9IMjb04VZavr/UgeKmRfOhGkS6RgBQMekmiw9kVL/vez9gm
    Uvnz1EjRqdhLNIwsoG3++WS6NCPptczj119jSHpR/MCB+eb71ECBYF41nIQjX00kveogNc
    i8rwIyHhstHISDM0ul4D9j2UKhl89AqvbGnKWjPlE0CHpbwkufk1SjwdavxaWBq36sI+cg
    kpBmVlgSyOyuC0M/graTt4SIU6FQXp6hONKDOhaUK+4KmQdPJEVdWavLzU2jYtS7BE3Jn0
    DP4Bye12GBU5GCRtOiOas6DXNQ6P9EN6MZUDYwFvC0dt438E+bSHuOmMt9z9x6Lt37M6LE
    G9V3ehbQfUBkgxGE2Lcz5es90m7a4r5+vKDf0eT3uU3H0pnu1d2KAyppDJL3Woqus7R/rP
    X5dGi00BKPHVbd5Q7o82+8IM1RanhTMVSwj/6SKwbUv1ZqrVdAqwoYbEyXrdP4hGLTeN3o
    7C2LPA2Li303MKX9gKKrQTFjdLZZ6HCOdvG+CzXwvPhhEF1euKANrDgJe2kw
X-ME-Proxy: <xmx:Nd1oahRY-iV0QnyiHDQsEYr3V348VxFi7J5ut_UcdO18dp1O-kAZGw>
    <xmx:Nd1oakOuak60UQ1LrsJSpx20oA7DZMPG2HgcdTojDHiYOE54Qlccrw>
    <xmx:Nd1oamayVkrc3YzLwpSkY15hEnplGbSi_1UpWjdvMTY_w2Dh93yYyA>
    <xmx:Nd1oauysJP0IqMIrF1zfBi0c6c9CO4caxa6Bas-pqsJCCrmcfokeVQ>
    <xmx:Nd1oaolG8JYkXs2ey9l5x8YSBK_v6mh7CCJ88fyNPE1mCTL5N-4UluhH>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jul 2026 12:47:48 -0400 (EDT)
Message-ID: <d7184479bd0ea8364f7890eb4054bd2cb67200cc.camel@pbarker.dev>
Subject: Re: [docs] [PATCH v3 5/5] tools: Add check-confusables pre-commit
 hook
From: Paul Barker <paul@pbarker.dev>
To: Niko Mauno <niko.mauno@vaisala.com>, docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com, quentin.schulz@cherry.de
Date: Tue, 28 Jul 2026 17:47:44 +0100
In-Reply-To: <659e38bc-3cb9-453f-919a-40a134bdace4@vaisala.com>
References: <20260728090746.27793-1-niko.mauno@vaisala.com>
	 <20260728090746.27793-6-niko.mauno@vaisala.com>
	 <47257a97161dd37bb8e3204231893fe609cb1040.camel@pbarker.dev>
	 <659e38bc-3cb9-453f-919a-40a134bdace4@vaisala.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lsRMPmgQLcxbRvsnHmxg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10181


--=-lsRMPmgQLcxbRvsnHmxg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-07-28 at 19:40 +0300, Niko Mauno wrote:
>=20
> On 7/28/26 1:41 PM, Paul Barker wrote:
> > On Tue, 2026-07-28 at 12:07 +0300, Niko Mauno via lists.yoctoproject.or=
g
> > wrote:
> > > From: Niko Mauno <niko.mauno@vaisala.com>
> > >=20
> > > Add a check-confusables script, in the same fashion as
> > > check-glossaries, that scans the documentation .rst sources for
> > > non-ASCII "confusable" characters (curly quotes, en/em dashes,
> > > non-breaking and zero-width spaces, etc.) and reports each occurrence
> > > with its location and suggested ASCII replacement, exiting non-zero i=
f
> > > any are found. This guards against the class of breakage fixed in the
> > > preceding commit, e.g. curly quotes causing recipe ParseErrors.
> > >=20
> > > Legitimate non-ASCII such as box-drawing characters used in directory
> > > trees, accented letters in contributor names and CJK characters are
> > > intentionally left untouched. No-break spaces are likewise tolerated
> > > on lines containing box-drawing characters, since the tree command
> > > emits them as indentation in directory listings.
> > >=20
> > > Wire it up both as a local pre-commit hook, which checks the changed
> > > files, and in the Makefile "checks" target, which scans the whole
> > > tree, alongside check-glossaries.
> > >=20
> > > Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
> > > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> >=20
> > Hi Niko,
> >=20
> > Are there any existing tools we can use instead of implementing this
> > ourselves? Perhaps https://pypi.org/project/confusables/ ?
> >=20
> > Some comments below if we do want to merge our own implementation of
> > this...
> >=20
>=20
> Hi Paul,
>=20
> Thank you for these observations. It seems that confusables (and its=20
> alternatives) would not directly resolve the exact problems that=20
> check-confusables script addresses, therefore retained the=20
> dependency-free approach in v4 which I just submitted. It addresses the=
=20
> missing copyright/license header, and changes the literal glyphs to \u=
=20
> escape sequences.
>=20
> Also the topmost commit message now contains a segment explaining why=20
> the "own short table" is used instead of depending on a 3rd party package=
.

Hi Niko,

Thanks for following up. If existing Python packages don't meet our
needs then I agree it makes sense to carry our own curated list.

Best regards,

--=20
Paul Barker


--=-lsRMPmgQLcxbRvsnHmxg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamjdMBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjLoAQCTMsDtS9anOaFFNuc0+7RPoZaZWl+sWMop
9n812uYqiwD/Zea5IYbJljd+l3X1pzKUkpB+UkeyZAGO85n5rhBz7g4=
=D8Wl
-----END PGP SIGNATURE-----

--=-lsRMPmgQLcxbRvsnHmxg--

