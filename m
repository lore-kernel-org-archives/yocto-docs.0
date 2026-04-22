Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30612F9B5FA
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:35:54 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78538.1776850549084779413
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 02:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=E2yon/5M;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Qy8yf+m2;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5F2FE7A01C2;
	Wed, 22 Apr 2026 05:35:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 22 Apr 2026 05:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776850548; x=1776936948; bh=0QvwrRut0e
	6vMkWnl0UlthwAY/wLLeXvgVzdesAuS98=; b=E2yon/5MLGeITxOp80W32dcah8
	trlUizmH+Snpd+3DNpT3zRNXTlI5UCuIhFypY+afpYtOeuwFvpjW9V5EzBdcw1cy
	MmQ7kK3HXqn9n24VcMJCLYoK84cXZNu3UjZcbNOT0evq0bFOeLgRUUUQrk/JciCf
	KArkLb3XSNSjZQ2MKmRBO4MIGEJGl4VV4rEy7/0eeCZ0k+1XwH2afK8Gmp3F5MDc
	c/axhDKCdEUtJCHoJsbA+y4MGN4eYK6VPNKEr2Q8GA7nJySWDI10NAClD1wiPOhk
	sKUQIPlzfcyttRpDIvRs7GneUwKPQz8P2VmC+GoSHEobv46eO28yh3o4PMfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776850548; x=1776936948; bh=0QvwrRut0e6vMkWnl0UlthwAY/wLLeXvgVz
	desAuS98=; b=Qy8yf+m2wUAqN6EX03Dit4JceqqKLhvVNs9GFLRUprrvzpyNjpB
	NM42hD9owZB5/277b5cAib/JzmEXc0XkwusDhY27/wP5/r9snmyTt3vrDDQ1pMw/
	kX8fsxHOZAQDbbEwXz1tMOiH/jHoDvSJhg08qFWe7Lm0toZcXIOKTT88nLhmF3IX
	burhWTwIkNQ8cDHmMuuksjpO5dj+za6elvzMoN8NTeUGtF2MR/4bZx6JDpmeBTkI
	+EHqKnJqw53IJXdgY51ER7tzx1wj9eOiOTy+/+IAyYLMii82xAiON7zPfI904JOy
	zafDi4MVu58u8LJtD4nFcVwe21Amv+ynUGw==
X-ME-Sender: <xms:c5boabbo8PVaFKUtXCueG6KLJiER7JAscNF6plUcrHDM30rvlzEIow>
    <xme:c5boaR2RQDZ4S1gX7I5YO7nUFlKP8PBoOgxY-1MtOeD_wmKYnnT3guza-HY_MaHqz
    H4y8B5EoyIKe4Tg4fhrLjXWuigBii-EMBqySC6tIcBuiwPJOQGYl1g>
X-ME-Received: <xmr:c5boabXfFz16-GTl7ElIUe5H7glTgL8ZXBu5Ag3YPxCVERYd3ahM5VQSWVzq6qMDEJ8i-TejXnSVWwy0v2xlxCkOcXk7X8xgnhYmt1Ku8nhK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpd
    hrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdp
    rhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:c5boabVhzY_TWT3ZD5Dfn5cAIIrvy06ZCNBREI5zWY4ZlnbydMgSGw>
    <xmx:c5boaaezeDPcOevht3ERirDlffbVg67q4xeMhKOnfeowNeWc6r_gvg>
    <xmx:c5boaUUJUtb_CQHDOvwk_lQ6FoxqEcnXpuInkfu77UeuoHcJF0_Gkw>
    <xmx:c5boaTf6sMRgA9sLKBMcsrRU6_oYOIQIQ36U48zIpiSbpwfebxzgVQ>
    <xmx:dJboaR_CjG_il16ErTtQt4U2DsB4fBl6Wf6MKj_zfR9xxAFj4g6_KXOl>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 05:35:47 -0400 (EDT)
Message-ID: <202238e07c48a383fd6e17460436f00fb76384d4.camel@pbarker.dev>
Subject: Re: [master] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 22 Apr 2026 10:35:44 +0100
In-Reply-To: <DHYVMAQR7ULJ.35X1W6KVSNQOU@bootlin.com>
References: <DHYVMAQR7ULJ.35X1W6KVSNQOU@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-r1BMRKma7SkfFdfTlsRv"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 09:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9305


--=-r1BMRKma7SkfFdfTlsRv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 15:44 +0200, Antonin Godard wrote:
> Hi Paul,
>=20
> Here is a pull request that includes a first batch of docs updates for th=
e
> coming Wrynose release.
>=20
> Alongside, we've got a patch that switches the documentation website to b=
e
> fixed-width. This patch was also backported to whinlatter, scarthgap, and
> kirkstone to be consistent across all releases that we currently display =
on the
> website. This is why I'm also sending PRs for whinlatter and kirkstone (C=
C'ed
> Yoann to this email too for context).
>=20
> Please do not block the Whinlatter build because of these changes, as any=
way the
> docs website displays the branch tip, not the latest tag.
>=20
> Thanks,
> Antonin
>=20
> The following changes since commit 2c12ec7bf29aedeacf82970a9d2eb262fde467=
0e:
>=20
>   ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note (2026-=
04-16 14:31:11 +0200)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs master-next
>=20
> for you to fetch changes up to eb74fdfd9e5e579a65e8872d1a73b51e77b14f63:
>=20
>   ref-manual/system-requirements.rst: instruct to install a buildtools ta=
rball for leap 15.6 (2026-04-21 15:25:47 +0200)

Merged, thanks!

--=20
Paul Barker


--=-r1BMRKma7SkfFdfTlsRv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeiWcBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btcwAQDBMzsPeNnAJP7A0xt6gJBTC8kQFq8WQ7Gx
J5l7Breh3gEA+68eXVTnDAydDG2FUlLCiNgSEZNiuNUKfUqESWr6IAQ=
=MSH9
-----END PGP SIGNATURE-----

--=-r1BMRKma7SkfFdfTlsRv--

