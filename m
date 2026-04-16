Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27127F8A177
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:35:04 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14206.1776346500935743630
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=YlaOsFSy;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ZDiF+w3K;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1E54D14000C2;
	Thu, 16 Apr 2026 09:35:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 16 Apr 2026 09:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776346500; x=1776432900; bh=dDnGEea37C
	vUMnOuCxVfiAKBCMkrncBcg0EXlPFVNrs=; b=YlaOsFSyF+M7FCBhAonLSSVOsz
	ewKBnSn6rN1jcPpF/meWYUtANo79BIy6de/D8vIzFCyuHxNhBWC48BXF6erTEABG
	UL7ZJODjn1jXZChb6yW21DzKIY7iVnum5Icm1KGPNOGRVpO3s38wRKgfJfm1cCM5
	yUaiyne6QzJlnPNEcWyHzzu8o6HeaTsrqIDPrBbHa3isPhyyT4jqvgbBRC1AllE2
	xFGHT/ktRiO7K1pnaefZ8ILZrv/7zUOg8troZHN6iyd0JBKXYdePYZCr4njCBmIq
	pN52qmno22Iq7C6/PXHvFIk4O80CUEwD7JUKvv5L9zH5UzrAKGtWuSe7975g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776346500; x=1776432900; bh=dDnGEea37CvUMnOuCxVfiAKBCMkrncBcg0E
	XlPFVNrs=; b=ZDiF+w3KxGKjZelCVKc7RjHczK83mm6/TG7wD7hI9W/BxgLaTy1
	JG9i3RA0ze8l9kjLyu5y8Bnn9a+hLqXzzL0nobl5P+JAbc+kkwP7qVZpliAJKv5K
	H4ZqLDqyStKt1V32h3zfDq+oGKCYnD6SAtBj20xZa5RbNWy032h9mP7V/GS7X64Q
	bwsxCNHBikbhd3k9bKCN+f3BR6zD2E5nasf6OnkxaI++0UPoGs7YUQLpqOlwZRy/
	8bCiNIcBDuEBZ0WlxqTYn2om0EyuwhHvGdr9rzCxl8c9y+85U1zQW57EGsGvkHbC
	EcZN5vq5rPmmLYHqp4jii9okCw1+EPCGubA==
X-ME-Sender: <xms:g-XgaUK5YRQ5ptXpm3kGnrLVniZpvTAgcaHOOxhqzidWTqbdW6FZUQ>
    <xme:g-XgaaLMeFdsuvNYT0G5qK2zutB7WJHXvPUnA4mkO41Vd6Hhvi0ymSrCASzZ__3-5
    hHkGZHq3C1UXTIk1dNrtqRriZzJ8FtovJl44bGtsYgmR3oYgglBWwZQ>
X-ME-Received: <xmr:g-XgaSWj6RsMpv0zx2g0UYD2ddVZLpssrv0zK0rBq_v9zHtzZ-CYK7NAfJPSh3GPUrdHxHcVLGIuu1IIBNZS8ZCpp7Qht2uzdpNMYBjtxrJO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegjedufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpd
    hrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:g-Xgacj9A2_VkkfsGAWhGe4pmd-n2iEU7eo1KxCG3PrZIn8XIqD1Yw>
    <xmx:g-Xgad872yhpND530DFRZ-HDh1-J8QIL93Hqcy2XG1NZGKh-L6w39w>
    <xmx:g-XgaWDDTo47TxlwQW-JRwQgsuxQLS3j5f32h6byzVwlKkCyEeTvRA>
    <xmx:g-XgaaIiJpPIOw2aXcCBHjwamxNlgWjX83qbmTLg9Rti8XhB85TpgA>
    <xmx:hOXgaavfrzsYKvRacscEW4688R6krU5NPBmfFQVipifzOKSE9rb2Lig0>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Apr 2026 09:34:59 -0400 (EDT)
Message-ID: <c520cc7110c0b076e27d25e48eab121e0cf3ae84.camel@pbarker.dev>
Subject: Re: [master] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Thu, 16 Apr 2026 14:34:54 +0100
In-Reply-To: <DHUL5CBNM5A6.2H7PK6ZZZ04BE@bootlin.com>
References: <DHUL5CBNM5A6.2H7PK6ZZZ04BE@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Vs/iKKf1j1cRq1vGR0EQ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:35:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9260


--=-Vs/iKKf1j1cRq1vGR0EQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-16 at 14:41 +0200, Antonin Godard wrote:
> The following changes since commit 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f=
90:
>=20
>   migration-guide: add release notes for 5.3.3 (2026-04-02 15:21:57 +0200=
)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs master-next
>=20
> for you to fetch changes up to 2c12ec7bf29aedeacf82970a9d2eb262fde4670e:
>=20
>   ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note (2026-=
04-16 14:31:11 +0200)

Merged, thanks!

--=20
Paul Barker


--=-Vs/iKKf1j1cRq1vGR0EQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeDlfhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0buEkAQC7pRXwPVbermcy7DI9RHI3x8X8jELnuud2
bFS81Vd/PgD9FYGXRim+HnRF9YNT3cU8HKILsleUaZGBLWlquEx4tA0=
=fyY/
-----END PGP SIGNATURE-----

--=-Vs/iKKf1j1cRq1vGR0EQ--

