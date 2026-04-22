Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CF7F9B5FD
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:37:14 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78556.1776850624842703314
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 02:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Ks3AO/CG;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=lpXgVtSp;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4789B7A01E1;
	Wed, 22 Apr 2026 05:37:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Apr 2026 05:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776850624; x=1776937024; bh=iprcxCf+2J
	M8sWT5LUJkmis/T5fNwI8xfFKAbDZqnX4=; b=Ks3AO/CG9rYJY8n1rUvlxY2bEs
	WGdk0d+C7ngCYiRA2Czsz+rY+w8XD6R2Oa11pRclDNKRVpcoXkZcFQrh7XPI2nlA
	Q5wu4NEsAYnfPMuuxWxVCQGk+unnDAOqBVO+joCdMULfRK+ZbMxP8dnYwTVPs6cj
	6/oOhGbyXSB3dXgNyHpeV/S0lwX6NElJX/O1WAdA8EdBJ757Dv6efqZYFqDUaFfG
	DLTSk+rvy1247J8KfPPrqvQBk20nNM7kfvF9csdyM6asKKjhrq3TNuQM2pNH3J3F
	SKRSdpUkrSm4COSZsgihhQ0b0pExkDnJaeYd+/tsA6Ru8vMnL1OMftchu4ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776850624; x=1776937024; bh=iprcxCf+2JM8sWT5LUJkmis/T5fNwI8xfFK
	AbDZqnX4=; b=lpXgVtSpq+iY7FmusQzkOzmZFuWiyWbjTrK1pZAaSHpCz4xFvE7
	nX+Mu9lnCgTwpkqPkGsrtOU3fDaZ5TiSLYBhCGAkIcXsROWt7kmKmIUd+g1m7OZN
	ykCKDq3Cqs39f+zMbHbsdW/oG3zOSc4aoqMSKOiV3V4/GLNlljNg99jabV9vu29+
	QR7DoWVFnBQdzlQ3rD1Zh6aSAwYOmoM1jn/aX8uPljxx3ysrk0m8T1ODefkGWNVG
	P2oIU74Mtg1kGXAJBQerL97ZhwIiUAq/JZi+SwQtj5ggkxU5R6b/m6Au0Q4wKMCw
	Czjj923E7OxnqGZyTC0pHnY8Dx/zC6Oy0fw==
X-ME-Sender: <xms:wJboaf6fHitgUzE4gBlFAO9bNO5da_igt5Q2zZP--WP9ENrgNdvWaQ>
    <xme:wJboacVKwlNEMBFSY4L49hyPsIeGxFPw-6P1uF2IxbmpEJtSMGMw3hZlgNMliIb2t
    KqdOgIoQbMPI1uaL4uvYsouVfFuwTUwpTWxp42h-25pP1GDRNWvz6M>
X-ME-Received: <xmr:wJboaT3cADEyPnD3xvf65ntZKX8-Lx-RPkuWdt67ytz8zxo-IzIzvYSwZ5YpeRAHjAMhWabXsyS1fTFTk6qW9s89q9_SDUmzxVVoB0FmNepf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpd
    hrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdp
    rhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:wJboaZ0XQ3qacjAsU304p7g9Gtl0jCyqLKVIQPO0mDKWMg2VoA2D5g>
    <xmx:wJboaW-X5ar6KrD3z6cFjlcEGRcH0WNPnc4Id982d8dRVyNP6P-eGQ>
    <xmx:wJboaW21tPBhkHtavKg84TfziiIyLIiccAK7Ua-7UidjvvxdBBAmEA>
    <xmx:wJboaT83QAxiRYWXpGplPqHMBUkRyClZkEOgL20JKaKGmdCrV_dJkA>
    <xmx:wJboaUcKYdzpbxHGQ0SreF2A_uopsoGRT4NcM6KMgD72efVvk8_WZEUz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 05:37:03 -0400 (EDT)
Message-ID: <fb0ad706f03b02eb2b9f5a75be3cdbbf0aa5b4be.camel@pbarker.dev>
Subject: Re: [scarthgap] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 22 Apr 2026 10:37:01 +0100
In-Reply-To: <DHYVMDVLY9WW.AV2EUZCNM0IE@bootlin.com>
References: <DHYVMDVLY9WW.AV2EUZCNM0IE@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9xW6cXQJxFAPDffY6d0g"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 09:37:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9307


--=-9xW6cXQJxFAPDffY6d0g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 15:44 +0200, Antonin Godard wrote:
> The following changes since commit 48d15a62ed7c004fd6e1dced03923bac529c43=
5e:
>=20
>   ref-manual/variables.rst: correct a reference to STAGING_DIR* (2026-04-=
16 14:34:21 +0200)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs scarthgap-next
>=20
> for you to fetch changes up to 2c80b891d85e0a7d9b70fc7b4a9c032325b56eca:
>=20
>   variables.rst: expand explanation of RSUGGESTS (2026-04-21 15:17:53 +02=
00)

Merged, thanks!

--=20
Paul Barker


--=-9xW6cXQJxFAPDffY6d0g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeiWvREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgBCAQCAyePZgWPVmu/CGAf6iIJAdcFR/l8bqdra
vOB68Z4mhgD+L55CZislIE9TwH0978ibo4x5uPVmZZ7JNpFVJBCqcg8=
=PI0X
-----END PGP SIGNATURE-----

--=-9xW6cXQJxFAPDffY6d0g--

