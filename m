Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B282CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 10:29:44 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126647.1781519378237713797
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 03:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=HzVaReUV;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=jF3Ejfgu;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 34D357A00E1;
	Mon, 15 Jun 2026 06:29:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 15 Jun 2026 06:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781519377; x=1781605777; bh=r3UUc8vkWS
	CnYBMagJBaOSlW1EldyASZ+EMEK+xOrWw=; b=HzVaReUV9MlQ7nI/6/MQlynCvH
	G7W1tqzFUwkbcvc+JHii7/t6ItHIIamUVJ/liw9TOwL3s+VUJu0CymW4q+PqUsJv
	tT7Lexx8/NvnV/8ekvV/03gXH3OmiPWtp7uxF/w9beA4ULfMegJAVpeLDyCAqbCS
	4OJ3pDRg7R9xChFUkvEcIixvN5ewBIBwE1JLVl0xDFm2zkwI4ZEC+ZIb7YufvruQ
	QwXaismZQMiG0v5yuSUw9niWkdxkv+SON23Yhv6EiLsTkUbGNR4lUppUP+JkSO2d
	6rClaDWnVPNPqXWRsjwPtQhbAUmhe39PMs/yFb4TK6XOXrZ58K7Ynl6gwQSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781519377; x=1781605777; bh=r3UUc8vkWSCnYBMagJBaOSlW1EldyASZ+EM
	EK+xOrWw=; b=jF3EjfguxRooN9KBDgnV1FwxPZTKHIPBYVmKnTr9XolcCdeU7tQ
	/Gcrc7dCbSkzfHjT2zuy5sUJ/dB0P4X9z/ZtYHuIRSzx4Jz43ZDeZe3lRliRyJsH
	kzIQX7J2bVQWO0LSNGU1swYY07zSYNID2Zr6G9BiyJJiL/l7qssqtwF2DEcpyhHj
	V1UehoRD1WhgHXpe/7a4TnGzMdzLiRyQBsiHapgrk+9E/JVpRTyvwPfkGXtlXXX1
	w5Tu20rj87K6hA5oaE/obCzqTZV/8RrCNgC9RCT4tAKoBOsZ88iDr7j4qOB89YDg
	B/nhVMsFVCtk6YPaYqQrFtrJmzfKPQMIIpQ==
X-ME-Sender: <xms:ENQvahfi634yBYJuYy1FS9NEiR89owqPMj6w5C5WsZoGyVhqqLGE2g>
    <xme:ENQvalONVy9ftZH_l59oZNceI9rAEnCgvt_UuVeKRFDys2EcEDjTCBvAXWsGIvv4j
    pBHAUedqOZtvy5C0ocKTz4wv6mUzXMpHrOfTjF4dg9CF3hpdbsh8g>
X-ME-Received: <xmr:ENQvaoK0DEjfiKDrRz-_0NpJMkzQtr8fUztUYs2avROQ5PUHTLYhWYPQiaboowi_FyBKpxFg510URI-mIncwMoj4pDVdxD8NZ-oiXduslG6t>
X-ME-Proxy-Cause: dmFkZTFaiTFLzq08BpeQT40GApVKSNALreauhjxEyywc4DDZ61+8C+Gk1tXi7vTShAzLhx
    edQmsEGXmc+6SeC6l9YkCBds4DuMFgOS7uPG5QoWQqyLOtwfVPfzoe1FkXr7UCkdpUECh9
    HJHL6Qlj4qr0iXgUD6IUBq+J54RpF87efJCnx5jlUf3ngPWigrvz7bIMa5PQ02mwLsxdRT
    TEpCo8aZuyRLiVCIa+6X8NgXzm8pfHJY302S1f4PuUoHk6RlVuKdRir+ZioCh3r7gs/so2
    24XpWir0LcnCGaplkKRte4myxwDIlKk7KPJEjmrlGE/SLGG4GgQ+5hJYlUct0g7EEbOGne
    6hErWBp1Q6OHWiMDXZmOTqXwq2H5AaKCI1LxomXBrKKOUxsIvVdkjCbdgJB5PxJnJ6XF3m
    iTZDtIB4fmp5KGPbec7KA8oPC885OPxxjBlmyshvWJIo4/YcGA2CTgMlINmpIzVlpeVUOT
    SJcLa0wrdABXtTV73nY57g82FCl0pGtKw4ynC0mMrSWhKPzUE51qQ+G1d+GuEOgPZRjb//
    kDM9/IhA3A7bI5E+VqNjIzjTH4vkt+boKsXQi8S/dPspdYCNI08ztdlM5T5c7OjvDO+Lfk
    fw1vBFk/onP9EC9fOWRzVYFyI5flr6jFt3JVjmOU2XnfUoibG6qCELc6LINQ
X-ME-Proxy: <xmx:ENQvamHwR2NXHBv-sXWPIqdOnCzAUNZEWqtnkAuQoqaO_bQoRmGRQQ>
    <xmx:ENQvagT9yog8U1tVgwMkBa0-U5afh33qBUormFkbnCMQF303aFww2A>
    <xmx:ENQvaiE-B_PdrBeIaq6PkcViCx11EpgfNp56hJ7pJYAK4p7nez_EFA>
    <xmx:ENQvas_M57sqIt4G71NIhx06eTGbJOQ-Lf2T0LQluIoXJM-nM8xc6w>
    <xmx:EdQvaq826Zh81j9TZDqYRYIon3uOl-DRhG9PvTlmk8PfPE9VOTSK1a7y>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jun 2026 06:29:36 -0400 (EDT)
Message-ID: <f3aa7c6bb63cd9916381b368b4673d0d1785a381.camel@pbarker.dev>
Subject: Re: [docs] [PATCH] kernel-dev: add anonymous hyperlinks for "LTSI"
 acronym
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 15 Jun 2026 11:29:32 +0100
In-Reply-To: <ac0c40fa-bfdf-40f6-9825-d9723a337524@crashcourse.ca>
References: <16a55764-9ceb-5638-53e0-59eff365a7fd@crashcourse.ca>
	 <69aa94d76c521ccab58336b5ca5b953253cbb6d2.camel@pbarker.dev>
	 <ac0c40fa-bfdf-40f6-9825-d9723a337524@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YLioJ84TswaldTfBAD+B"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 10:29:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9721


--=-YLioJ84TswaldTfBAD+B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-15 at 06:13 -0400, Robert P. J. Day wrote:
> On Mon, 15 Jun 2026, Paul Barker wrote:
>=20
> > On Mon, 2026-06-15 at 05:18 -0400, Robert P. J. Day wrote:
> > > Link to Linux Foundation LTSI page from "LTSI" references.
> >=20
> > The last LTSI release was in 2018, it's ancient history at this point.
> > Better to remove references to it from the docs.
> >=20
> > The closest current equivalent is the CIP Project [1].
> >=20
> > [1]: https://cip-project.org
>=20
>   OK, i don't know enough about that to intelligently adjust the docs,
> so i'll let someone else decide on any updating there.

Hi Robert,

Simply finding and removing references to LTSI would be great.

Best regards,

--=20
Paul Barker


--=-YLioJ84TswaldTfBAD+B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCai/UDBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnPsAP4hJnOJFDzt3SyuSkcQP/W96RMFVXvpIYAe
HofDP0e7WQEA7qOTpGsiSaQ5bRaxyXz1nni4LHOoUEOB6Jm9V3rbhgA=
=7136
-----END PGP SIGNATURE-----

--=-YLioJ84TswaldTfBAD+B--

