Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F94DCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:57:42 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.web10.5300.1760612260173479927
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Wp5RaSwM;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ZCQTBKDI;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5F3CB1400183;
	Thu, 16 Oct 2025 06:57:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 16 Oct 2025 06:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760612259; x=1760698659; bh=vQ3d7LxQco
	9u/DA4SdRQ4389PwpO6iEowIIt1KY7Jnc=; b=Wp5RaSwM4pPUleWWpJEcmJGNg0
	w5XWlxPuHHUGsuex9plXUbv6im6BGWxGdTjrTUJ2JHrGs4FF+P6uOswLy9nwKg8i
	TdZPIa4Hg83caa8mlBqQQXgyEFOvV7wPpZcUSSkdf20lTNbjzZXoGPee44Aam53s
	Mea/+2DLmuKWlkg1rPg4IlrJ+7dPlVZRavKc8QmN8T8bVI8uV4np0bDKrCZFzphj
	wdA11zPfdZE5Vdoe4LZzcjHJ0mtUT+WY3i7ySjgORCDJEjhJ8wzbn0uYHCMOsS8d
	fLwah+5+qC+rlYdU0dTAcRb3xYrEGp9wNhWJAKPlItugnFFWo+5Gbc6L93Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760612259; x=1760698659; bh=vQ3d7LxQco9u/DA4SdRQ4389PwpO6iEowII
	t1KY7Jnc=; b=ZCQTBKDI1tEoPx3sP2IQ1EvQbXSbmbW1KjLqNByGStQBYWEaPRL
	v1qxSi3cAo46XfKNut98qpL611KveJSIyuPb6p0JIRh2FOIO4n+dkJPdjNLToHek
	uI7yES194CBWv6/IcSCr0fek3tm/BO4EVv/5iOCEVkBRAnzUPAm5cMwMkOdSRh14
	PL8xEaJwTci73WZffhDAL86gmJrC05xIIgzZRZEYahYZAKZoeOXq+Br3FGPAuR4Z
	ulKDOnGfqViHaIYDDqf4UfSYhHNRZyx5SYGijPp22QN8m9UvQWE+yoyk0+SGYoJy
	Yo3LVzNJYCGlr3ASzriC8cUrOee60xgwZDg==
X-ME-Sender: <xms:o8_waMX6YHy_jzlKKAuH5fRY3aPg3M4gHfYU7KO_0zj1_U-p-zT16A>
    <xme:o8_waIC7BcyFjxOc4myy8pwGOjyP5v42sZIjhB86DCDlOlEkRGUfiivBYTIZTGS77
    F-4SlvwuzNIU9OwrWfA2IEbHo4o5vkxGvl-CwXYf3tccM_xY81Bwg>
X-ME-Received: <xmr:o8_waNzdYxObXu75YlrSUvMXMjActGJvEKwzMTtYlkgOdRFld1GC7QATaYoQsbmztU2p-8EOX1O-4hsQgT2a3L8vtWmoLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeiudduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:o8_waFCiczKhzzQ3MyRLfeiur2qileELh9cTRwzuEZhndP8c91UNYg>
    <xmx:o8_waKZ3MctWcTD1YoBSwvUjnDKmMr-nrz7iIzMb_Xm2LLP47lcB-Q>
    <xmx:o8_waNiWKEEU-DOgsBuDiqSvNe2YMB2lhilay7Pz66JHk3EXZeDsFw>
    <xmx:o8_waM5TwQKKJU6Dwv-aUChuSQ3cwz3S7GvSJLt5AXh7qU3gzJJk-g>
    <xmx:o8_waBYExrikDFdb06FSty_Am_ViF3obDbiZDIhXwyBUSdz6h5j6ZRoV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 06:57:38 -0400 (EDT)
Message-ID: <ae9751dcf85b11592bde525aa84b51c83e96b3aa.camel@pbarker.dev>
Subject: Re: [PATCH 17/17] migration-guides/release-notes-5.3: updates
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Oct 2025 11:57:34 +0100
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com>
References: 
	<20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
	 <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-W5bBXwXk0fm8DHnb0wke"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:57:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7741


--=-W5bBXwXk0fm8DHnb0wke
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-16 at 10:54 +0200, Antonin Godard wrote:
> Update the release notes and migration manual for 5.3.
>=20
> This covers commits from bd4625cd4db0 ("build-appliance-image: Update to
> master head revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper:
> Remove running_pids and lastpids") in Poky.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/migration-guides/migration-5.3.rst   |  46 ++-
>  .../migration-guides/release-notes-5.3.rst         | 341 +++++++++++++++=
++++--
>  2 files changed, 364 insertions(+), 23 deletions(-)
>=20
> diff --git a/documentation/migration-guides/migration-5.3.rst b/documenta=
tion/migration-guides/migration-5.3.rst
> index 985712cb2..485002e0e 100644
> --- a/documentation/migration-guides/migration-5.3.rst
> +++ b/documentation/migration-guides/migration-5.3.rst
> @@ -134,10 +134,19 @@ To set back the "mac" policy in systemd (version 25=
7.8 at the time of writing
>  this note), you should set the ``NamePolicy`` and ``AlternativeNamesPoli=
cy`` as
>  detailed in :manpage:`systemd.link(5)`.
> =20
> +Removal of unlicensed Linux kernel firmwares
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The ``linux-firmware`` recipe now has a way of excluding firmwares that =
do not
> +provide any license information. The recipe holds an internal list of fi=
rmwares
> +to exclude via a variable named ``REMOVE_UNLICENSED``. See :oe_git:`the =
recipe
> +</openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a comp=
lete
> +overview of the removed firmwares.

I think we should be more explicit about the default behaviour, perhaps:

    By default, the ``linux-firmware`` recipe now excludes firmwares that d=
o not
    provide any license information. The recipe holds an internal list of f=
irmwares
    to exclude via a variable named ``REMOVE_UNLICENSED``, this variable ma=
y be
    overridden if unlicensed firmware is needed. See :oe_git:`the recipe
    </openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a com=
plete
    overview of the removed firmwares.

The rest of the release note changes look good!

Thanks,

--=20
Paul Barker

--=-W5bBXwXk0fm8DHnb0wke
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPDPnhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bncZAQDm6wtbzYJ4zVAudGTxE03dZCdKs6xTLuJR
gVvfpRY/HAD/Qj94SJjda1HDI1grzXZ7usJE2hqVFfF/f8FXGzdg3gg=
=o94u
-----END PGP SIGNATURE-----

--=-W5bBXwXk0fm8DHnb0wke--

