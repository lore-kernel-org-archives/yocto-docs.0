Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4191BC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:20:38 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90156.1783074036763337522
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 03:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=jZTrilzY;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=D0Ek3E7k;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D5A4A1D00095;
	Fri,  3 Jul 2026 06:20:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 03 Jul 2026 06:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1783074035; x=1783160435; bh=vwV1DJPNkW
	MDNa0Gtwx8p6EytEsKdh5AGqDh5AB+lOo=; b=jZTrilzYgeQqsrTXmiZSdJsZdh
	ROVhYCpz/UnCBlPSQjC+lFLCemFYLkY/3XBCdjBlE1PngAS1QyTBwmFpaNQmsUhJ
	eMkCXuffdrnIqCxjMdsmu2dUQITDF2yIk8IKVOL1nKwVm54+haTIqbmcnocGn2CV
	O4Pc3r7eglSfaEPIn7jvS8Pq83ZtYOrfqJLfXk78wMDia7+p5E/5abl6VjXIAa2C
	CGpWybx57SwzSOFU315AbkM9XZ4hbYgNIAili33+6IZtgnmFTKx8ay5nr+tR+YLY
	lkqQPmKZIRNCRXaFkguSiqRt+kuiB3ZXkDS2Ny/Dl+0MXdF9ey718xkKx/zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783074035; x=1783160435; bh=vwV1DJPNkWMDNa0Gtwx8p6EytEsKdh5AGqD
	h5AB+lOo=; b=D0Ek3E7kDrfNPBNXZTX2QWz1hf1Rfb1IsJCX1MitR7k5sSunkGG
	HV5ZYFtHXMn05ktjMY1AKmmhmU/RUs/EmzvQsd+wFg+VcidxS/K68VWZ5rn8YUDd
	z16AJ2oes9Eqk5WGenyhq29OvQFIKSqSLQPmWXB4XPim6petGwNakztNGRJEj3Rz
	ey1iwLmmjMdM3Li7VnZxQrEkRoWEwZoQFDeH7npFzAMHmh6+ciqLZwcgL11opqS3
	+JjK2ljqs6N+k8PnLk1GrDvkwEAaPPCtUS30Mrmii31jwV5mJ0f4MinR3gxYxxKW
	p51wLCW8jQoeUEi/m64QeujGKFgiZQSlk0A==
X-ME-Sender: <xms:84xHalTMOgoWsfsZLh5ydYV-HoK-hIy29pt0AL04ZtOL0S5UQMU_pQ>
    <xme:84xHalw4O8fwNKjIg1f7Zec3wL2hYp1LrbN5vs_gmuJk4OZ-KJN6R_IjI74M807iP
    AZMHlEjAVwmFWtqUXhx_Fth70J72paVL6qbYE8_mMFtjk84qZQrLQ>
X-ME-Received: <xmr:84xHav20kzNjoNsc7LkqrD0mNOMUo8Isw9jBkLmtc1B-HO1ixaETdPsxROivd481l8ukeLkEa0UBKYzlm5DOR4fYW2hnQISIQreUq6HzJ9Pp>
X-ME-Proxy-Cause: dmFkZTE9w7hxoylMc2OapiCV82jOfwVBHfdkrzwRKreLXl54L6h2PpSIn8uNNx04wuClRT
    a6LXSoqMeHfLcZrLkkmXQUWFGss7vK2JMY4O+IIb5Y3TtHtrjnJvb7S5yzjEHZQLzvcudj
    cbdyO0oJzfSx7RXtws5FcJih0qSIEyYeKm6uT2N8cACqipiePz3FfX8iCzT7KGUdYlGLwp
    wqqz9RIUkopKKAxgmjE4QzSf+DdvwPjFGTyWYERw1xRQSczuCX2LzH+a0yHWfupB8GP4yV
    MNeJCYwGOWQiZ2FLZdeu9JA/VAYfEw6oIgDYCXMZ1d+YnsUpJaDXCFgVEks16PlWeWecnJ
    KTGQB4s1S3pbawLmWIeF7OS0ATNK6Q6lGUAR166V9Bo3mtPHHFAgJl0rs2sszX6MDuhy70
    h4Wg2/3p9Ef5WTU+4vEIRRgg1jcEURr7JtXu7xZRQDj/9AKxI+atN4v4k2qBAqk5w8ud8x
    H+U+6iVoTEwKROtl9aB87gWIwT9e6ePpvMINy75Xqq5mjXsIcgXqZvmK1y0i7C59HfdtFv
    IcEpkyygmLaC+0ztsVaqPHyVkduDb7IjHwG8GInFtedVHmcpWMDC0hFGwP6h13peSIwRmj
    Qy6mUB6/HJ3ftPH149zCjoyEX/PbcIHUV2EVMzdsoHTUoOaMoYVD301CQmRw
X-ME-Proxy: <xmx:84xHar5r28Kodof0oL0TrMfcFlfQzDDC2vuz31LIF9hxwljurGvcCw>
    <xmx:84xHaqXJot7AkpT-NpH4Zz4J4e66evzmnd69KQjfuAGvr6h17FQ0ZQ>
    <xmx:84xHaiBnLFVa8yeT3JcnI3XyyHpoxhLjEC-ETj7OY7dBiYXrAibrrw>
    <xmx:84xHah68-YGplPEhOKPZaEBJxhULLy2VkAQ44Dv-FVd-FKvqPpuxSw>
    <xmx:84xHagzFV9ltpdPkAuOVybxJVWpThH_2jzfhCNRLpQtNnFH5kfV_QmNX>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jul 2026 06:20:34 -0400 (EDT)
Message-ID: <eec9e49d9ad896834435d4d1a11d91edb637f94f.camel@pbarker.dev>
Subject: Re: [docs] [PATCH 5/7] ref-manual/variables.rst: document the
 LOCALE_UTF8_IS_DEFAULT variable
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>, Daniel Ammann
	 <daniel.ammann@bytesatwork.ch>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Jul 2026 11:20:29 +0100
In-Reply-To: <DJOUHUD8GFGU.2QBFH3Q1U030A@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
	 <20260630-sync-documentation-conf-v1-5-da14b40cb515@bootlin.com>
	 <69cf4a3f-6013-460b-924b-a54cef6bc593@bytesatwork.ch>
	 <DJOUHUD8GFGU.2QBFH3Q1U030A@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+8u//6dY+am4ZhVAXP9j"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 10:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10010


--=-+8u//6dY+am4ZhVAXP9j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-03 at 11:57 +0200, Antonin Godard wrote:
> Hi Daniel,
>=20
> On Fri Jul 3, 2026 at 9:59 AM CEST, Daniel Ammann wrote:
> [...]
> > > +   :term:`LOCALE_UTF8_IS_DEFAULT`
> > > +      If set, locale names are renamed such that those lacking an ex=
plicit
> > > +      encoding (e.g. ``en_US``) will always be UTF-8, and non-UTF-8 =
encodings
> > > +      are renamed to, e.g., ``en_US.ISO-8859-1``. Otherwise, the enc=
oding is
> > > +      specified by `Glibc`'s ``SUPPORTED`` file. This not supported =
for
> >                                                          ^ is
>=20
> Nice catch, thank you!
>=20
> @Paul in CC, can you drop this patch when merging the PRs (on master, wry=
nose
> and scarthgap)? It is independent from the others. That way I'll be able =
to
> re-send it without this typo (or else I'll send another patch, that's ok =
too).

Hi Antonin,

I've merged all three PRs with this patch rebased out.

Best regards,

--=20
Paul Barker


--=-+8u//6dY+am4ZhVAXP9j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCakeM7REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bj+/AQC4bic144rJvywekEed4SsTbojz6ekAYejh
NoRoCO+XRgD+IlLyG0TnwtnccpnnJ+MUeACSm3WXXbjt9rDnSuLGwwg=
=b0Zc
-----END PGP SIGNATURE-----

--=-+8u//6dY+am4ZhVAXP9j--

