Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F275CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:38:22 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.web10.4793.1760611099983749146
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Yl72Xsj/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=iUUy7mtY;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 4A16FEC01C2;
	Thu, 16 Oct 2025 06:38:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 16 Oct 2025 06:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760611099; x=1760697499; bh=/LgkGzDvWQ
	NY3bUHGxuy+IncVm2czp8VmjAsrCHrNz4=; b=Yl72Xsj/y8c0nmhOqAqFc38epG
	t/rvOjM3YGo7QV/uFSg/jNItuEb0wV4WU4F7ZIh73UyTq2H0FoYA4TiUAvF2y5Fs
	uJnzFwjz+DdtT0h8WQ6UlGwh7dP8ZRJOpdMkRI8SV5Ml9baOZ0L4Q/SktVipMvLG
	5pCG/kEoaTMJAZFGS8uRLwuMtRVuV+g2M9CtfA+HFSJj8pR0zFr53vtf72ZHhjX8
	vtrhnqcS9/+hlPW5mzA2oo9Jzr7nmZi72d5sEq0FZwOYYQKm02NbDJEFoSxVu/Gn
	tIyKyE4vGHQpkK+7E1StrBlJ+mScMOptSZAE5c2VE8DtAwRwTpcUj/KytQVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760611099; x=1760697499; bh=/LgkGzDvWQNY3bUHGxuy+IncVm2czp8VmjA
	srCHrNz4=; b=iUUy7mtYKR2YsKS4tYnJoemwGFyo5GkTrQBhvn0K0GWODKwGR1+
	OvK166/cSpcFgEQ/N7aPDqVDwzJiEgcCx8LlBmSu216eLjJAkEDNt0G4gLm4SBi+
	ciLA2qGJMUgJpzJpsecpjVIfFkRtHTjQpYWQP4jufLuJ/Ab6AQ2OQsWNk6MdP4ZU
	Upw9D07v81Vm7t8JOA3C8BYBfYvfH3u9eWrnq0H0UUkPAwQyzB7OA7914ziKBiCJ
	0MfLfJZd0Pbn+/p4MtZHMMuexFeL3g9DOUrXiVwdyhHKQYvWZJ1NpUdKjdB8h/nd
	gUC/K3BtyFvndauB59mNUyHs+c0t30U1IrQ==
X-ME-Sender: <xms:G8vwaLRVYigdLjVCyuMnjJcrtu1dCBLqHwmdsoS_pDeW5K1Sic_Z2g>
    <xme:G8vwaEMtoFaLF00UktSYszIRS-OOfyKCbdI7bMUh9mPYj2fnos224bmJE4ykzGY9B
    0unkIqXAWWFBrvkllnbTlOtwVE-KhkRsWJ9AjS9Wkg40GKiqSW5KvQ>
X-ME-Received: <xmr:G8vwaON_H9Oop2dUmmJMQ5P9FMREGuzGyyLqgk3rmr8zvZL9vh-UkcXjwXmQapsmRY3gpaI1lQZObxM4iIdcmfuL85vdfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeitdejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:G8vwaEvpXdmuPBjHEro96oNmPJyVGYZpbw3drU_J2miggRrrngoQwg>
    <xmx:G8vwaIUyG3IRk-gyNzNV4dWfPl2UZBISomJK8iIzBTdKC_xVR61XCg>
    <xmx:G8vwaMuBJfj_gHuRXm7yGwMLNh0AUt88FzZ-LFdFNRdrVtCogpYiHw>
    <xmx:G8vwaEWvi3kFr2QKupd4R8KZhKsVc8JBpAupELXOyt6811WNmqjgWw>
    <xmx:G8vwaIlkivFxxIAx9JgWoK0gcte8Z3MeKpwV1MFlgWhD8QpEPTXxX08j>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 06:38:18 -0400 (EDT)
Message-ID: <6a2311de937c3894f640c5981131db71c7812274.camel@pbarker.dev>
Subject: Re: [PATCH 11/17] ref-manual/classes.rst: gettext: extend the
 documentation of the class
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Oct 2025 11:38:13 +0100
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-11-20f21db1f93c@bootlin.com>
References: 
	<20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
	 <20251016-release-note-5-3-second-hunk-v1-11-20f21db1f93c@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Fbljz1jiUr6yls1nChOM"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7737


--=-Fbljz1jiUr6yls1nChOM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-16 at 10:54 +0200, Antonin Godard wrote:
> Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
> class.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 68edbc9dd..d898034f4 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -968,6 +968,11 @@ software that uses the GNU ``gettext`` international=
ization and localization
>  system. All recipes building software that use ``gettext`` should inheri=
t this
>  class.
> =20
> +This class will configure recipes to *not* build translations if the
> +:term:`USE_NLS` variable is set to ``no``. It will also do the same if t=
he
> +:term:`INHIBIT_DEFAULT_DEPS` variable is set (unless the recipe inheriti=
ng the
> +class also inherits the :ref:`ref-classes-cross-canadian` class).
> +

I think the first sentence here is clearer if we say it the other way
around:

This class will configure recipes to build translations *unless* the
:term:`USE_NLS` variable is set to "no".

Thanks,

--=20
Paul Barker

--=-Fbljz1jiUr6yls1nChOM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPDLFREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btEHAQCc9FkDTNGVuKaYEr3BXErbmYDL1tWG4lHL
caPiYTHdQQEAiXAI58icmXXXRKYNftj+owTPYV9H7IrM+ANOEpYNewY=
=hkvq
-----END PGP SIGNATURE-----

--=-Fbljz1jiUr6yls1nChOM--

