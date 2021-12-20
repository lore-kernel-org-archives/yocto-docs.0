Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2F7C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 08:06:44 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web12.2979.1639987602780474982
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 00:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 32CA05F90A;
	Mon, 20 Dec 2021 09:06:40 +0100 (CET)
Message-ID: <424e25b0ebe9283e60c5d8983368b346ead16963.camel@emlix.com>
Subject: Re: [docs] [bitbake-devel] [PATCH] doc: document override style
 operators not working for task dependencies
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Quentin Schulz <foss@0leil.net>, bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org
Date: Mon, 20 Dec 2021 09:06:37 +0100
In-Reply-To: <484FA2CC-02D8-4368-B332-DCBA4FBDE61F@0leil.net>
References: <20211216152555.815291-1-dwagenknecht@emlix.com>
	 <484FA2CC-02D8-4368-B332-DCBA4FBDE61F@0leil.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7wVjGfr1BjdTvk0Wj/NR"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Dec 2021 08:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2319


--=-7wVjGfr1BjdTvk0Wj/NR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

On Thu, 2021-12-16 at 18:14 +0100, Quentin Schulz wrote:
> I think we could make it even more explicit by adding a section in=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html
> to explicit incompatibility between any OVERRIDES and varflags (or add a =
note
> in both sections that it's not compatible with the other) because I think
> this applies to :append and :prepend too.

The section=20
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-metadata.html#variable-flag-syntax
 already contains this sentence:
   All the standard syntax operations previously mentioned work for variabl=
e
   flags except for override style syntax (i.e. =E2=80=9C:prepend=E2=80=9D,=
 =E2=80=9C:append=E2=80=9D, and
   =E2=80=9C:remove=E2=80=9D).
but a explicit block
   .. note::
   Override style operators and variable flags are not compatible.
in all 3 sections
-=20
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-metadata.html#appending-and-prepending-override-style-syntax
-=20
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-metadata.html#removal-override-style-syntax
-=20
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manu=
al-metadata.html#variable-flag-syntax
would help preventing misconceptions.

Cheers
Daniel


--=-7wVjGfr1BjdTvk0Wj/NR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkDMJRIopzNTng/jmZ2f8gllWJGkFAmHAOY0ACgkQZ2f8gllW
JGleQBAAjpxM8jQq/5THMFWC4egiDqLs1BViNYF738LZHsyTErkWim2wbbawNlpB
JfpGmvYkKyTQdiwC7y/ux1zkdffGwg1diT8XVeuoHSelMs/NQZiLl/gB+gXzX5vY
kv3HjOypJDwXQo6ChOd7SHI43w6WVWLgc8dHjcMuwOeSqAXnFUpz6RL2d1bmU/My
vPAdkQvgz+xbnSbIdPHX+/4zIxkDTw4dIpPXRWuBdu9azjj4aI6di1mE6BjXYpD/
EBNK9QIQwbLDR1DTEbjYAVIVkBZcQbUSLHojYh4ohWwXTUqHz++d8GSyjgM6tlv1
m3a1gdJs8P5w/UuEGQV+n02bsMiM6NooODRssuSN6Z+wrHB2J8f7W7ciMqV8gcxk
2PWOUVI7ZlXqEdjSHPweOx6MmnJLE1aIxW2su60xmOwaYy5q7afg/70M9YlC5rqJ
KcgTgMTlUueXUszzggg8xa/UOruZDtWwWImDFrzpyvi5ZwAKwQPhKViD7U4Dsf3m
aQgK3pkeM6Xvj9Lsi6K3dtUcOuk8DefAGpQPuUQHs3MjekNWKmLRfE6vSLNQ+9gK
fRn9+1SEoNClkzaAOlnJxFI7IcXJ3+JqTG526PGDppsaeLrx9ns2ghd+dm8X5mIt
5G4BA6YCNrJAmna9b26yzFoS/2sUdvwdFcNu/r2uymves9uR5qk=
=p5iw
-----END PGP SIGNATURE-----

--=-7wVjGfr1BjdTvk0Wj/NR--


