Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333B5CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:23:39 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.web10.4982.1761294212297356657
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=NHCiZR1m;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=sWStfjo1;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 85D807A011C;
	Fri, 24 Oct 2025 04:23:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 24 Oct 2025 04:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761294211; x=1761380611; bh=mqhDuytBku
	Z9yffSYZDKD0Uj3eRRDKRPXoeP4rzBoSI=; b=NHCiZR1mXgguO508nb2yoU/Hdq
	c7CvBjPceOow1HKqsJ+jaAnw2m2pGo/bOnIdqr24wzqWKaHMqS3yOrKTtdARe4Jv
	doNncP79/KBDIkluG1ybARMxnTIki29J+u2Z9kKGGPZ1EhmzX2BwgebJxLZFIf2G
	UMXDjK2H/zn7pxppC5L1LuKxGm4s1a128/e0bivgFx8410eX8Jg2x95mHCnZHNx1
	XDFuHiYOKEvYLNAIZ9GQEv1FdOKXMras4B5aoXU5/WTWIGw1ZE3DrCRcGDCEeeKe
	N2ep5e580ZzVdRaxrZTrnj4aI2AjGdRZ09wwAkvB/n6mPz7Ha/WM8zTQDb7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761294211; x=1761380611; bh=mqhDuytBkuZ9yffSYZDKD0Uj3eRRDKRPXoe
	P4rzBoSI=; b=sWStfjo1e/O9WzwIeSyRhEZR4wTpGEi6dfH7hAHG+lW7lgZBx84
	EOt8ej9NxT30atlMnx9ZzoNpdBGyTsDaZvAu1pkfY9qoNU/E1RjPpj+iOYEjH1dA
	crzHDazVTbwqdH8GAXt/etUov/kb0FKWxsBxBwe+twDBS5LWyQ+hgSIDgs75OA4t
	0isAcv6ifp71yBWaELayPPMIWrE1uWg2rd4d6qI184LWpwt4yJ7hlw2rG0JZs7un
	sS4R6lCNSUuJ4VOhj1FR+tCq1cbwpe4HmSlQV8DQpTbxC1ObBR2SlGb3JlvNYXzS
	nQeokEMECzl7GCCLnVTA5NBgvNzNyMv9Otw==
X-ME-Sender: <xms:gzf7aNxMGo0sBzgKpYuDVRDMV2wz4waT3uSTDnEUrS2XBNBgrApH1Q>
    <xme:gzf7aDQBpDCzD8XYXb5TEvJNlyQRfRNerQ7GNTGbDNNRiOCk1XeaRtkEUSyViu6Mx
    aa5AC1o7drtTjXFt1ER-ycZ0z7WzsqqRpVAj13tnhdZa581YCtI1uE>
X-ME-Received: <xmr:gzf7aE8xIncjE-U6-N7ykV9fYTf4H3rRAMJXID9_KNoQOpKQpEFrNEf1cVTqrdjbtc_vSDqbDdWAq9Zn5M1hKOTMk1L20w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    ehffdtteeiudeujeffgefhueekkeffgfelueffheehheduhefgjeettefhudetudenucff
    ohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhgnhhomhgvrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsehp
    sggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthht
    ohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:gzf7aKpBipDHFcGPhcJkXku61hTwlPXKX3fMDuMTeATtD-eP5kb-Uw>
    <xmx:gzf7aBkvW6A6Bq-5WA7B2FBC60-LfyFE6w9Y0hAyslyprOGmVadcbA>
    <xmx:gzf7aBJvx-nXNPRAXHfbNFZu8kN4a_ZjblUezONj1qppD0vtL986Yw>
    <xmx:gzf7aGwp4ZMJv8Rwwf7ESOSML6yy1np3D16Pzd81guWhns9U04m4cA>
    <xmx:gzf7aKQNR9uVRKrhFQhoWKvuJoiEi8P1QjyVj7KTVC0x4qFfZU7Jdpaw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 04:23:30 -0400 (EDT)
Message-ID: <5b81132d588a9220cb13cd5b683d32a8c332010b.camel@pbarker.dev>
Subject: Re: summary of observations for overview manual, chapter 2
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 24 Oct 2025 09:23:26 +0100
In-Reply-To: <1994ea5f-2ea1-094c-66ee-faf26f0d5791@crashcourse.ca>
References: <1994ea5f-2ea1-094c-66ee-faf26f0d5791@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zl4RUXg3DySQ87PkRDJX"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7806


--=-Zl4RUXg3DySQ87PkRDJX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-23 at 07:46 -0400, Robert P. J. Day wrote:
>   full list of observations for:
>=20
> https://docs.yoctoproject.org/overview-manual/yp-intro.html#
>=20
> (including ones i posted yesterday, just so it's all in one place).
>=20
> * typo in first graphic, "YP-Comptible"
>=20
> * reference to "ECOSYSTEM" tab on YP home page, but i don't see such a
> tab at that page
>=20
> * "commercial Linux vendors such as Wind River, Mentor Graphics,
> Timesys, and ENEA could take it and provide ongoing support." That
> list of vendors certainly looks like it could use updating, perhaps
> with a link to a more current page.
>=20
> * i believe "ENEA" is properly rendered as "Enea".
>=20
> * there is a reference to Clutter, but Clutter's own web site suggests
> it's being retired: https://blogs.gnome.org/clutter/. should that list
> of available system components, "X11, Wayland, GTK+, Qt, Clutter, and
> SDL" include XWayland as well? or be updated in any other way?
>=20
> * "produces packages in standard formats (i.e. RPM, DEB, IPK, and
> TAR)" ... i through tar format was obsoleted a while back. also, right
> after that, "by using utilities on the target such as rpm or ipk" ...
> i thought the ipk-related utility was opkg. is that not what that
> should say? and add "apt".

There is no package_tar bbclass nowadays, so we should drop TAR from that l=
ist
and update the list of utilities to rpm, apt and opkg.

Are you able to send patches for these changes?

Thanks,

--=20
Paul Barker

--=-Zl4RUXg3DySQ87PkRDJX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPs3fhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blWsAP42SqpDiGhY5Wevn11aGGqus2kjlt4h8D35
eYDei3BDWQEA0zu4x2YG+4J/H5HLrW8HiTVuC8BNHa+VF/ZCYECKyAk=
=qD/J
-----END PGP SIGNATURE-----

--=-Zl4RUXg3DySQ87PkRDJX--

