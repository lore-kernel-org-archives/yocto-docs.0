Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1281AF9B5FE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:37:34 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78391.1776850646097460546
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 02:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=OUEr6wWE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ksYDP31+;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8F8667A0060;
	Wed, 22 Apr 2026 05:37:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Apr 2026 05:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776850645; x=1776937045; bh=6dJoQWrb1O
	Z3iV462QBicnGXpcMZfyaBGLmB64H3MwA=; b=OUEr6wWEIY7BajmXmVSu8PPnTR
	PuXMnYn5zU1j9Hl7MUsTBsJAipElsZPJp2dqy5zi5gc08rowSOG6ZNF5RzCEUbxA
	8U/iCJ+yuoN9V8QgIKDQGolMIwnO7fVTMdOpmF+bXAXha1vwRgnYRRqEdP2nrefR
	UMPyLOvIbRvOTUwlsnw11lMc2xVsm9EIIkq9QDBQRQnN5dYUCvJGggg4ndpNXMIf
	+5EYyBNn+gswQcbbffeOSvDQVRjgQWNPr6dNLnKxWbs1Hf0ykn4Ct1r2wKKqabZC
	fFSRTC4ReBwoIRcxxmcDEFy4s+i6Ul2bHop95knmaK/fMzwwCrLXv7ZiaWPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776850645; x=1776937045; bh=6dJoQWrb1OZ3iV462QBicnGXpcMZfyaBGLm
	B64H3MwA=; b=ksYDP31+Tyz8fJL4nf+SdbVqsPw41ff7VQh4fNSXdF66PwfFgsu
	hjWH3J2TRz8iFUDu6jqzK2eWDk4kooEgPJpbEzM1tu8VLj9Oyo5vIMUcp9+xf+WE
	qykE/IUYz03G3x9qj0VkQdo2yWaksu2ImWnjFHqhfADP2m5RWA3WUiQNFcUg2dv6
	Kqt9DBZXmfUjSAheH3Bs3k2uYhhQ9b1ZvECx3Gf02LJAGCM3VailelZJQ6OBuf8B
	7wMj0UaGiVUYYxakF6gfhVimR5CVsmtbtg4nxYnqEHAhQt5vcfi/9ydTxYW/UQ0C
	9F0W5ZPTocUwcbwXiiBvnUUSe2REDIHRL4A==
X-ME-Sender: <xms:1Zboab2SPsf0_9_57yQog-cFWF5VhBqz_bYERgGtyacfqMf3p0hVOw>
    <xme:1ZboaRhAiOtyPwZlO7ACObLJi1wGVda9sCjsjZaV3PYsxPURH1-YlYqw5Oz0Qjkjy
    941Mwo5eXwrwgQcDTQmj32XaDGSSA1BCWkq1cMWR8wNRCeSr-xZtgM>
X-ME-Received: <xmr:1ZboaZTiNs3FPYsJtjpyRuOebdmTxWF3Xn7xqRYtpKmOzHhmf-LqxHzInQ8G15I7ZJf_nPtmH4dJXqrTd6jDisBeDDh2ZB0UMTF6IsbY6Nty>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpd
    hrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdp
    rhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:1Zboaaj0KdH-R53NJUkQWZ2aBs2VrS2puMwb0GurkQG5sYOMO3oX6w>
    <xmx:1ZboaR6X7WXQvgmi7Ok-0x1s6jQnM1HF6Un9TQc6SY0NDKw3go-XGA>
    <xmx:1ZboafDMJzoU7LUfDH-WV7VUP7a9H49eZMkjpQW9uf8ch-71CJoXTA>
    <xmx:1ZboaQbsJADsaTRjKyb2IRYfwIiFG8AR0hIgdsqCnh9W8EjBxb-0oA>
    <xmx:1ZboaUpalX-8rIZi7NQSGLpXObgfc1b1w3wv960tacKPwjQtf5XgR63H>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 05:37:24 -0400 (EDT)
Message-ID: <0abef749652c1c4814eebac1d77a189296312caa.camel@pbarker.dev>
Subject: Re: [kirkstone] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 22 Apr 2026 10:37:22 +0100
In-Reply-To: <DHYVMDM4WS52.FC176SXHUK7L@bootlin.com>
References: <DHYVMDM4WS52.FC176SXHUK7L@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-aIm0mLGMGaiRURHdQtWG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 09:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9308


--=-aIm0mLGMGaiRURHdQtWG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 15:44 +0200, Antonin Godard wrote:
> The following changes since commit ce6734c68649739c635675a133fa77edb98650=
28:
>=20
>   migration-guide: add release notes for 4.0.33 4.0.34 (2026-04-02 15:22:=
08 +0200)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs kirkstone-next
>=20
> for you to fetch changes up to 192be45726500cf875db6fad377116b48f7aabaf:
>=20
>   sphinx-static/theme_overrides.css: switch to a fixed width documentatio=
n (2026-04-21 15:18:31 +0200)

Merged, thanks!

--=20
Paul Barker


--=-aIm0mLGMGaiRURHdQtWG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeiW0hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brXvAP9hLVKPEB75DIWmsvAniwy+KPQ2WWKZ526s
tbPdcem+XwD/SZ+/GW5oA1hX4g72W3PSYUBas+jVoyILlkanVkX3dQ0=
=gd2/
-----END PGP SIGNATURE-----

--=-aIm0mLGMGaiRURHdQtWG--

