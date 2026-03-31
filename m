Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B811DFF60E7
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:15:44 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15394.1774944938468257161
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 01:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=pdawrGBl;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ewLNJbYi;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id ABED01D00286;
	Tue, 31 Mar 2026 04:15:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 04:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774944937; x=1775031337; bh=6Fk6LAG+nt
	KJoPKXKShp8dXLkMqxnWCyS90dbV8Mf7I=; b=pdawrGBldGe4UaDcjVSVfQ2Yq3
	3vL9mgIrCsfaYEv8p70K0EiGkVuk9pQG4yQk//wR0s4PwWFwnkCIaQ086ojZgfh1
	RVWCwLSlug0N5y94HKIkbRcOygeCOX1bf3pec1SkIVoYCgR4DqiQHaa3LEhHEawn
	vzndWMux1a2n0axUjelHrpk0oeTmceTZ8nwUZ2DFAmdMiTRYA0xbayCWVxJptmdk
	UIG+EgFuFoy5zSTldsPyOmc5pGJBEGRlrIjfcbXj/KXkO3gQq+StJcogvj1k72Zo
	o+g3p7cg1RHfWD+NcFMmKyaRbh+b2mEVZ2cHFPryT2LgIWydQ7W/vjs/+ZOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774944937; x=1775031337; bh=6Fk6LAG+ntKJoPKXKShp8dXLkMqxnWCyS90
	dbV8Mf7I=; b=ewLNJbYixFzrvpD1kpUmny0e7IRbDI4m2IAthT9niqul3bhPHhc
	lWatAsDIKs/udbdNEsFI1X0uvNFcocMb0QvfdRZ6H/kAznmYRGBJh7uN5Gind+Qi
	ct3meTsYK0HQiHxbTpneEqUGw+qBDzEm/eYE0H6knDumzimudbjeDc4u9fpzcG1W
	qBJggWy3vgXsgGyaXaad6XJN2l5eM2r7c6jN7TvT+5cuwhW6S4HbW1ctveakBXud
	a0GRTLFaF8Oth3fJEf8HrXP8V5eO604S4u+CbFb0IOoVPX4zL1o9M3Dtpsk7iiYV
	XJwp5TqSpOK9dnGBMmUCaA3nQf3nFfd7S5Q==
X-ME-Sender: <xms:qYLLaUDD6AbWYBIeCdIZZJqlww8o0jjhS7KaYmmZwC9KagPeHTusEQ>
    <xme:qYLLad-ZWEGDi16OLKstpq7D2phkio352SlLXFT-4OSnIrr2FtCQsAZlcS9H8Ak6l
    8kz51H0-l8ii4MX-Ypiz_jpg2a2Y7Ba4J7SVvxLgsCsOHfshuoFuZg>
X-ME-Received: <xmr:qYLLaU_mCd0n2-c67-QhRC4mZgIziJw76fQvPOZH-bMLfjaU8aP4hvfnuIDyMMGWYo9myCdh7W7Uvd-Uqbv8UQxI1bp_G-5fuAvbIFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgedufeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
    dprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrh
X-ME-Proxy: <xmx:qYLLaUeNwL2nNP5rIt39tA1mI7GrAJSemr_sIks7cOpvGqw78SOmHQ>
    <xmx:qYLLadFsvwOgV0wTgJ0Ig7bbA0ywTSjJqklnQYYBgJhN4Ddc8qtq8Q>
    <xmx:qYLLaSecgi03E0aw9sNWp0D-nd_j7_uyVRxO5mBKBz_R7YFIv6Rs7w>
    <xmx:qYLLaXGQruw2NaE_mA4c-wPlvp-_2ujSnW5DgFmMRPAkHSJ8cDOqoQ>
    <xmx:qYLLaQEgdma2k7FCyfvgbYkONXuFmLJ3tu6pakO_uDEsZlVKQwWZm9kC>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 04:15:36 -0400 (EDT)
Message-ID: <e261ad318aa3a6a3a39efba7c68b15cfd4f0de0e.camel@pbarker.dev>
Subject: Re: [scarthgap] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 31 Mar 2026 09:15:33 +0100
In-Reply-To: <DHFZELGU7TJJ.3GI4D06RNM2O9@bootlin.com>
References: <DHFZELGU7TJJ.3GI4D06RNM2O9@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4xJjAaCbY5h4DEzz7LFd"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 08:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9147


--=-4xJjAaCbY5h4DEzz7LFd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-30 at 10:42 +0200, Antonin Godard wrote:
> The following changes since commit 60b1c5e635065acc7a7cd2a22f252fc983da22=
3f:
>=20
>   migration-guides: add release notes for 5.0.16 (2026-03-18 11:22:05 +01=
00)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs scarthgap-next
>=20
> for you to fetch changes up to aa7226705451e6c1ef964d49963bbed29b267c27:
>=20
>   ref-manual/system-requirements.rst: add CentOS Stream 9 to supported di=
stros (2026-03-26 15:02:34 +0100)
>=20
> ----------------------------------------------------------------
> Antonin Godard (1):
>       ref-manual/system-requirements.rst: add CentOS Stream 9 to supporte=
d distros
>=20
>  documentation/ref-manual/system-requirements.rst | 1 +
>  1 file changed, 1 insertion(+)

Merged, thanks!

--=20
Paul Barker


--=-4xJjAaCbY5h4DEzz7LFd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCacuCpREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjLPAQDIy3BLGpO33HVPMFNNUIza4vFQbzSH8TYl
qb46+BOTowEA0T1XRe1kr5GKtJAMDuNjOrNI5Ks66AtsPmR6qPOMFg0=
=z1bM
-----END PGP SIGNATURE-----

--=-4xJjAaCbY5h4DEzz7LFd--

