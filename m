Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693F5CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:40:01 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24893.1780504799366038737
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 09:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=nml8MsXn;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=RNKpRpWi;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 7B67E1D00153;
	Wed,  3 Jun 2026 12:39:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 12:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780504798; x=1780591198; bh=nEwwoNI+zL
	sZuYyp9zFge/fTeERtxnJDJVzqkFBjTcY=; b=nml8MsXnDa8DRnE5B/Cgx8McHi
	uEVMjsVCd/svm9WYAvlxFLn+nIMDhGsB3OoCqHWB7SQCEn5BbDYsFTs6CZ4PwnGR
	WdgLrLRBCi8h87DUx/FrR6xSdrH8eKzClrWkqmszyAU91lak1MSwzXVOGaQf94Ym
	LnFcXoc6Xd9bmNZBT7wsEGZTT4HM+M2AiTnWrUUf107DLPnkqO1gtoa4pLl6a6FQ
	XLDO3K/Dk5/u4b+s0onnGQmdbbNF3/vZo5gMq0QKHkiIgjqQaIuEbZeEfF3onvn+
	ltRwBWeGdjclOfN752EJpWky0ZgFwYLTVGhx4p9AljqmJfuN4yUjV7HTCafQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780504798; x=1780591198; bh=nEwwoNI+zLsZuYyp9zFge/fTeERtxnJDJVz
	qkFBjTcY=; b=RNKpRpWiCRnMJDx2q0tzday1JEOM3Yd1p4fNxfh6EKsKJkDNpqZ
	2tVo2+NCvXAAflHX1VHc+UYKXDIxqEM5vXmpFkyobr8Q5XKLhkCWcmEXN1pycb5t
	WvdQdhEXm1FgKXaMkFer2qOUQynw1cwrMlpbphE+NEokhLg7hSOAXgL2Rho0YoSo
	oV0ihccrEg9N5UPyhNlQcuq0Xa6UH6lcIAzAC8AjYIAjgWrQxHL3pvZa3BDJPYeT
	v958NY/Dm1D9u+RRAD6NGPGDqmRAWbBQxTuAZqkunGjkxnazvkV0VWETxDy4CZk3
	9mpXTydUHliDfjm37hq4dbPGQKMtNu+vj4A==
X-ME-Sender: <xms:3lggalZYu5ZakpILfIFpMrmPJEQXM73_YagLj-dmjvubDjv9gV4OEA>
    <xme:3lggaj3YOzTf_5mRMUrcpoQ12AkbwdsqyqMNcXDk-8sAneFlsKrxqmmddKIdwzJlF
    O02J1tn0VoFBnZ3jPWTXq5kB5dmgSekq-ivJEFpw3BDC4lH6xPua98>
X-ME-Received: <xmr:3lggalXoe3SbkuDGOL9pcskQBMs_PiTG9SRzmGF2w6hixZ2-XjaIhxTKJ7GBlXdIalyroc2fncjPh6G4iOmEOWQ0Xz4UW0VGsOWMWerGEpFdovCnqcNzJkYvPjwIAI0Y>
X-ME-Proxy-Cause: dmFkZTELkZ3fePGm0qDZEdLb2UG4n2LJ2gZdSs3OSuoSfYUza9ZyQJFbNca5ZDfeltk5U8
    Ge6fDMj9NxpACgiBa+CZpf22HaZWElDxS+JKmsnBAkmtf8yQk/MQK7XeyfeWEgSMDPVcRF
    saUs+cAxmLziCPVHPeKVB+ADn/STM7sljcyz7gkBsBtcXoQSeLNa+sxXJNZFHhpk/dQ0tA
    6qshtalH6/uMPWl9BUX25/WmoxRW0mNvOokj1h7IpsjVAJzXdjv/v3sEOdWEV7vmc3e3u7
    iwKCPfRLD0ByQPTVajJjesT+0iW0dXpMaISR/zTa/WD9cylPLi07BBv7I/Gc9FZECEtYBd
    rKs0IgHZ/OlkrloxHRsfA76xMJeSmJu+Vrt+61uI05QbIPekr85DW8uMNVvDJe8+X2gniG
    BQEz5sJtUU24CA04TKdXvyzpaVwRwcfTpzaIpbvmfG2NDwz+YJ+dgcGGuMNhGd5U/lAAiR
    iOla7MftMcRWL4gT49oP5rGiCjktc1QkSVP6PMfOw7KPrVSEeWq4U6Q15/zjX2TqiXcAfF
    iALLbcv4OgYU4qmjp4ZPDi3NYJpAtEiD+MMClvXrxUBRsbZuhOa2pEyQNModB2SiYd1rAL
    i6xQ9JGmtQb5Vx9j9Uny7NMsR8t/XuZoxch2e0AC2+sqJ6Nbomn4tbxnF5uQ
X-ME-Proxy: <xmx:3lggatXNpLgR936leNBHS65mhfom8G5a0g-dVXZ1lvP17AUe3UdwlA>
    <xmx:3lggakd91o9alvD89Us-tJ6NovRLzDVSnQcxvozgm0ONMvzEjxB5KA>
    <xmx:3lggamWi5gxr37CE5jzWAV_u-qyt1Yl5Ut1ngW9Ph1gwQGvUDXbLZQ>
    <xmx:3lggatfsCG39a7lG9o-8W2KnY0IN9vKv223Rs6ZPLHLr7-J4iCQIRQ>
    <xmx:3lgganNSBXMsPRmoiXzYm1DeI8YaHDmQTLwMM_NrumtpnK5apw4xP460>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 12:39:57 -0400 (EDT)
Message-ID: <97144f9b8432b4c14d72a3ba03dd69f1c70f444f.camel@pbarker.dev>
Subject: Re: [docs] [PATCH] security-team.rst: update my email address
From: Paul Barker <paul@pbarker.dev>
To: rybczynska@gmail.com, docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Date: Wed, 03 Jun 2026 17:39:53 +0100
In-Reply-To: <20260603105914.26433-1-marta.rybczynska@ygreky.com>
References: <20260603105914.26433-1-marta.rybczynska@ygreky.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XG14zSnzLycmumwoQ/br"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 16:40:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9567


--=-XG14zSnzLycmumwoQ/br
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-06-03 at 12:59 +0200, Marta Rybczynska via
lists.yoctoproject.org wrote:
> Update my email address.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> ---
>  documentation/security-reference/security-team.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/documentation/security-reference/security-team.rst b/documen=
tation/security-reference/security-team.rst
> index b77365382..776dea568 100644
> --- a/documentation/security-reference/security-team.rst
> +++ b/documentation/security-reference/security-team.rst
> @@ -105,6 +105,6 @@ information in the subject line.
> =20
>  -  Richard Purdie: <richard.purdie [at] linuxfoundation [dot] org> `Publ=
ic key <https://keys.openpgp.org/search?q=3Drichard.purdie%40linuxfoundatio=
n.org>`__
> =20
> --  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com> `Pu=
blic key <https://keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit.co=
m>`__
> +-  Marta Rybczynska: <marta DOT rybczynska [at] ygreky [dot] com> `Publi=
c key <https://keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit.com>`=
__

Hi Marta,

Should you also update the public key link?

I tried searching for your new email address on keys.openpgp.org but it
is not there. The linked key for your old email address is expired.

Best regards,

--=20
Paul Barker


--=-XG14zSnzLycmumwoQ/br
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaiBY2REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bt0GAQDR8XlltovQCbRllP/8Pw9gklIN1chPv2ph
HJfClOVQVAEA5I21ciT2AkLRuZeaZh8fOH/aRSJ1UTVQ+ynNgRsKfgc=
=86+w
-----END PGP SIGNATURE-----

--=-XG14zSnzLycmumwoQ/br--

