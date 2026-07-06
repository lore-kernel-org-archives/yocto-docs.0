Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E63C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:02:36 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146814.1783332151926184941
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 03:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=oE7l+U8p;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=qZil9ETc;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 14DCF1D000F4;
	Mon,  6 Jul 2026 06:02:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 06 Jul 2026 06:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1783332149; x=1783418549; bh=i5DaAdepB2
	Y+D/LPJiIZpFb2XKo6AQdlpkULf4Tkx3U=; b=oE7l+U8pcVamTTTFxTZLNesR4I
	Ux03JB1+ycR6kCJu7PO+iDZCQ+1eZ4Ra2diso/17KVXle2EH1Hev0c9ZcyBX1366
	kI+t8FXJuhDEZyJiEynSdmTYXJSOBjE9ese9W3L9cxyc6+zj02x1A9iSKK1x/qsT
	oew/Eeeg8Iwd4fVIm646WVDNhvTXH6/eqFgbi8F544365wpcV0KUGTQ30CRpiDX/
	bWto4IbNhh7YmFb4gMsMIRbKDpe3kZG16FBEDtPKJ1Mml7dGyZN2Ms60uahIhPRX
	UicMHKsUKAylI/juTo+ygVDtwXPbAjKkLaIqkLpjZEwWzFVI2kT15GZdm2uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783332149; x=1783418549; bh=i5DaAdepB2Y+D/LPJiIZpFb2XKo6AQdlpkU
	Lf4Tkx3U=; b=qZil9ETccmjiXetDLCgxHs2gSCsouJOowimbRsKx4F+b5FfDsfo
	QVhS43vr++syHYQJrAjEQxkVeUrdGx0D9AkRV13q96e2LLQWR8sz2T5Gnhlo6HLx
	WSoCUJiq1Zcdv/kp6JE3pFHcNs6Sty+qsSvuBxSxD5VCO+N0IVOrUT+PfEJP/Q9u
	o80po28k+eNa9mCj9FIHueIVNnkk3VzuvWoWR8PL8sCpM5oiVr9KLntbw/esKq/v
	mOPUJ6zQ7vfYD5NnaToE9NYSWtjaL2AnXoaRk2dCrFJlEnsaoeIi8dCcR9FFawV6
	e5Tf3q2GG2jq1U6RxFE0koIlDJ0fVRJRSvg==
X-ME-Sender: <xms:NX1LauAle5ROg9f39QZET6vEVEk0fAMiNnTGqMPL6JVFPWaFC4OEdA>
    <xme:NX1Lav9XyLhUzGwrDdn_uX6yy1cqPJK0v_BYUZT2y52ZdV8RA7rv8s4QaS7OmnjSw
    ekELehJnqpxry7dbNkR7FM9VznySYvptglgWgCFz-5CqpSIs5_qxFdA>
X-ME-Received: <xmr:NX1Lau-Z7iGYW3vEghruNoKwgzbe37glCmzO6_krE6rHKMdVMn28fTl9pJV5DjR3fdaSHw19MHSHQwXAp1uAgVRc6gk7TT-qgD0GBO2_cre->
X-ME-Proxy-Cause: dmFkZTEktTnPRrYqauK1Bt8b5vKXjCrjuNX0Sv0cxuOVEGsD7FlEyo7CP0qeAYW5499mEt
    DQ/QQR3wApaJcWHy+gz0NssAM2bQAAYMb7gWPzcOJq323MI9emCvqxnTiy8vB47xmnQ9GX
    ar9o52185GCRwspkWCkKsXuIXOt0OJga0Ou9VGu037jVHCCRgfpgTZ41jOD65kaQwnu4kC
    H4DJY5Rt8xjwGGpw9+dsZi3UGr/jsz2AhMHbGBNMRQxKc5buVAgIEpUO7HbPlFGYp96bgi
    McvR6t4WADwpZ/VswFykzR6/gkvU/jIvbtQ+i6wPCcTH7j3y1awrLn9+Cu2CeIcahZVoGX
    qV0SZgbltc/NaMyEdhj/MN98elhXCBiCRNS+ZB9+lrhb/0NtQhMGeeOX4zrnft5pPSt6tY
    4HwLvaGp4BdkEWbVzQgZBDwEnNQG8Ze+pgAdPCJB1qHLWkwHlWIVLztJMIwqJAcGuILfJw
    2+DGYtFE7MZmv/Te0wsaKEXUpG6tIvE8FiFf369s9a+N8B2j26+/7PrBzsaCMkRAryOEL0
    BOLIy1gaXMecPOJAp/B6q+HvqkHaCpJynfuzEBbAiUU3JzhxBA1ONyLtiWJw+ZFNd4Yk2t
    jgLtX2IXJf9BUWLOuN0GCjVRCgHfoHhgNBN5jMkmzgjODAhTX6PyqSSZHLHw
X-ME-Proxy: <xmx:NX1LamfIAuS9Tfxa_wYe9NW8uU7usclHT1_jE9gu9tQYwhtjjz0RRQ>
    <xmx:NX1LanFZkRClxuLs6XWjiAI5UOvaU9qVZsu5WggMGnT219DrGHHlsg>
    <xmx:NX1Lakcc_CAaiAcHYeAuqj5DUnLljxwUIVaZNOVlsNyWFJDrGg-_8Q>
    <xmx:NX1LahHeBp4C6UlubFbHSEryBMYQ2CHULVgBovHfWLLYbYVBTucXcA>
    <xmx:NX1LagXtiyZX5JGStZkA_hC9omzT825AS7mbd_P9xKsdTfDtIPwWgta7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jul 2026 06:02:29 -0400 (EDT)
Message-ID: <b50ad5146a74a8a2278ebc5a7e89fc02d7d5f25b.camel@pbarker.dev>
Subject: Re: [docs] [PATCH RFC 0/6] Generate documentation links for OE-Core
 (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 06 Jul 2026 11:02:26 +0100
In-Reply-To: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
References: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zeu2/r19JQaBz3NIF0ym"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:02:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10037


--=-zeu2/r19JQaBz3NIF0ym
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-03 at 17:07 +0200, Antonin Godard via
lists.yoctoproject.org wrote:
> [I have pushed this here for now:
>  https://git.yoctoproject.org/yocto-docs/log/?h=3Dcontrib/agodard/b4/gen-=
doc-links
>=20
>  Not sent to mailing list as patches are quite big.]
>=20
> The purpose of this series is to make links to yocto-docs accessible
> from OE-Core through a doclink flag, making the overall documentation
> more accessible. This link can be shown with:
>=20
>   $ bitbake-getvar do_install --value -f doclink
>   https://docs.yoctoproject.org/blacksail/ref-manual/tasks.html#term-do_i=
nstall
>   $ bitbake-getvar S --value -f doclink
>   https://docs.yoctoproject.org/blacksail/ref-manual/variables.html#term-=
S
>=20
> This is made possible through a file generated automatically, which
> contains assignments such as:
>=20
> S[doclink] =3D 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/=
ref-manual/variables.html#term-S'
> do_install[doclink] =3D 'https://docs.yoctoproject.org/${LAYERSERIES_COMP=
AT_core}/ref-manual/tasks.html#term-do_install'
>=20
> This can be used in projects that want to point to documentation, like
> Toaster.
>=20
> This could also be included automatically from OE-Core's bitbake.conf wit=
h:
>=20
>   # Default path to yocto-docs, assuming it is next to the openembedded-c=
ore
>   # repository, as would be provided by bitbake-setup.
>   YOCTO_DOCS_DIR ??=3D "${COREBASE}/../yocto-docs"
>=20
>   include ${YOCTO_DOCS_DIR}/documentation/oecore/doclinks.conf
>=20
> The main point for this is to make documentation for variables easily
> accessible, with the hope that this would also encourage people to
> contribute to documentation more as it would create a bridge between
> OE-Core and yocto-docs.
>=20
> This is more of an idea than anything though, comments on whether you
> think this would be useful are welcome!
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Hi Antonin,

I think the idea is good! A couple of comments...

I don't think we can set YOCTO_DOCS_DIR by default as there are many
ways of setting up the source layers without cloning the docs repo. We
would need a way to set this in toolcfg.conf via bitbake-setup when the
chosen configuration includes yocto-docs. Then the include directive in
bitbake.conf should be conditional on YOCTO_DOCS_DIR being set.

Also looking at the gen-doc-links script, we should not use a Creative
Commons license for scripts. We should use MIT or GPL.

Best regards,

--=20
Paul Barker


--=-zeu2/r19JQaBz3NIF0ym
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCakt9MhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boFlAQDh+t5fWpomJpTphvdnZ7MRjIjAIdsW+sOO
f6Wl2mXG0gD7Bmf84q2paQ+wF7jTkYloHnbL2r9ZAw/nkKYgskxYyQM=
=mEoO
-----END PGP SIGNATURE-----

--=-zeu2/r19JQaBz3NIF0ym--

