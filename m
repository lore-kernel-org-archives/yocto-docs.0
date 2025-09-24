Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F72CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 16:34:19 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.web11.18833.1758731658051704160
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 09:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=oA5Ovoyd;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=iUV3BgTC;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 44A047A01D7;
	Wed, 24 Sep 2025 12:34:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 24 Sep 2025 12:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758731657; x=1758818057; bh=e+9Gj7V9O/
	GBp7cU65O4OTrlEWkfCFHqACik2HPouGw=; b=oA5OvoydXS1+BbyjqY7Kf3aG8m
	ZsKc5CT3T5aAhgw4eL5zSZL7zC+azz5+h15uTBcLM2Gt5tDwmr7D72ccSlFqXYTr
	yMmlghyIt/HRiGT7w2o/muDtjQyFeBeUD9o3V25Tq+SwWpwa36ev14N7sYuhH0Xg
	PKzMcBF5xG3dVziyotVAd8F/N7g25pinoGATfq5pa8xF1/wi7DuanZRiEuhL1dTZ
	zKEZFlnpF7xSti8+sNInaOZiu3AxnwMf6jBIPXB26pNbW33COIPQ6ZtSO8+HGV9s
	WFlPw5aULOkK1PI6fmMlu2d8DfJwnAzeAJyvYO5HWRirUNXCzCXe2TaCVKfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758731657; x=1758818057; bh=e+9Gj7V9O/GBp7cU65O4OTrlEWkfCFHqACi
	k2HPouGw=; b=iUV3BgTCEeohbO5vIh4z7WCWT6jTBdaEKTZQCTA3q4sM6C90l21
	DINAXRjakqxXISnSbhvsDRSVb/9z7iA3rJP4ydH8zw4usI37YC4qYsXwmM0xsYaa
	lVfsnl1FswuHaS7MS6g6GhdlzBL4p9FLu4ljQSdkqscj/xqSN4ZjL1tWaShPqyvA
	eQXksEK/u7AbNzqbE8G6CWPOwlkhdjQEs/nkh/vmmVz4s0DjB8V0Uq03aGfObX+n
	QozVlJCpokcxw4Fm57RwO4MaCsP5Q5fj5L55aqhRHPRTD69QXElMvIdHZo6U1ZRt
	77zLpKR4Z1NJNq4Pu9f50acroMz0TggfKVA==
X-ME-Sender: <xms:iB3UaHcy4QH_zwC6koaEqzhYLyvmhBkfu1nCbRm_gkXHenItmmR7tQ>
    <xme:iB3UaEMnHDua5njNA1DYBAWGxnaAIsz7_XehSb3VIQKjJuIwSRHhMtFug8gqRpJ1h
    ic6vdbKB1I6H1TO3k4vYQf4TtzbUviqzofEaGhKeIwsMzWajbF1nPA>
X-ME-Received: <xmr:iB3UaFj38C9qBQ3E6yWCbi486XfDU2e5TswAfTEl8tOdb7UnDCffaLbIfD-SVKwtxi9HuD1htL5zaPnIrNnZgDYJ0yAarg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    ejudefvdfhheevtdduledvleejieehieevffelhefffedtgfduvdevjeekheffhfenucff
    ohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
    pdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlh
    gvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhtohhnihhn
    rdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtihhmrdhorhhlih
    hngheskhhonhhsuhhlkhhordgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdih
    ohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:iB3UaH1uEhYd7zQEGo3BL5DQuFpGQd2-x1nlBSXEnKOpN1upzQrxOw>
    <xmx:iB3UaPiOmuOUz2P8GEAXdEFqwB7o3I8qpA5XkHON-rlbvk2Jsgluag>
    <xmx:iB3UaHf9d_BHNA0KBRFS72tDMa2fYJD4GKBcARDhwK96Lx80D4NJqg>
    <xmx:iB3UaCnpbpQN7Qgis_QlZF8LLS9FWfPWh_eBC_urXAKJVD_bLzDOZw>
    <xmx:iR3UaPQWIowyjD4_5oqAmaTlodv4t-SwwUs2ldx8myYoHs2Go5QOwMF9>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 12:34:16 -0400 (EDT)
Message-ID: <54e542b206ab91899c967db38d001bb4b3a87e06.camel@pbarker.dev>
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup
 info
From: Paul Barker <paul@pbarker.dev>
To: Alexander Kanavin <alex.kanavin@gmail.com>, antonin.godard@bootlin.com
Cc: tim.orling@konsulko.com, docs@lists.yoctoproject.org
Date: Wed, 24 Sep 2025 17:34:11 +0100
In-Reply-To: <CANNYZj9n0Na=y9+-mY=AYc37-iYyLoQFX33q7D5ptsuxcsbiZA@mail.gmail.com>
References: <20250819213530.3616042-1-tim.orling@konsulko.com>
	 <DD0B43YZK3LO.1TVXDXSLGVPIU@bootlin.com>
	 <CANNYZj9n0Na=y9+-mY=AYc37-iYyLoQFX33q7D5ptsuxcsbiZA@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zl+BKOBQSASOJFQ9INQX"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Sep 2025 16:34:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7589


--=-Zl+BKOBQSASOJFQ9INQX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-09-23 at 18:38 +0200, Alexander Kanavin wrote:
> On Tue, 23 Sept 2025 at 18:06, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > Do we want to list this here? I feel like this could distract from the =
point of
> > this section, which is to showcase how to use bitbake-setup. I think we=
 need a
> > separate section on fragments that we could link from here. I know this=
 is
> > additional work: we can merge this as-is but probably a task for later.
>=20
> I too think properly documenting the oe-core fragment implementation
> and available fragments should be done first, and only then full
> bitbake-setup documentation should be based on it. Bitbake manual
> describes the addfragments keyword, but not what is actually done with
> that keyword in oe-core, or available tooling (in oe-core) to manage
> fragments, or available fragments.
>=20
> You can write a top level user guide for 'initial setup/status/update'
> with bitbake-setup without getting into fragments, but the moment you
> go into how bitbake-setup really works and what needs to be in a
> config file for it, they're are a key piece.

Is there also a plan to document how to create the conf.json files for use =
with
bitbake-setup?

I tried to use `bitbake-layers create-layers-setup ...` but that doesn't se=
em
to be the right way to create them - the bitbake repository was not include=
d in
the generated json file.

Apologies if I've missed something!

Thanks,

--=20
Paul Barker

--=-Zl+BKOBQSASOJFQ9INQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaNQdgxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgYXAQCxPoejqD3A5bfHAQBP70/kGgFioKeekPfx
d3BnigTfwAD/Y3XnZAe/1pz3cChOzrwE0FP1FquHGjgR0pmnAlLp3Ag=
=WFVU
-----END PGP SIGNATURE-----

--=-Zl+BKOBQSASOJFQ9INQX--

