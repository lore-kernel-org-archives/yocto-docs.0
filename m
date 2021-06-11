Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.6430.1623406457306571637
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 03:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id A86E65F855;
	Fri, 11 Jun 2021 12:14:15 +0200 (CEST)
Message-ID: <93f00ed0eb5e91a8b74a350f7ae43948474002f6.camel@emlix.com>
Subject: Re: [docs] [PATCH 2/2] ref-manual: variables: document IMGDEPLOYDIR
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 11 Jun 2021 12:14:08 +0200
In-Reply-To: <de72c018-6ba1-b210-8599-2bd1a142c054@bootlin.com>
References: <20210611062613.188300-1-dwagenknecht@emlix.com>
	 <20210611062613.188300-3-dwagenknecht@emlix.com>
	 <CAP71WjxGyxR=2tTK8LyVrmPsOX4rd9_NsOTMbEYfr+kTH4UoLw@mail.gmail.com>
	 <de72c018-6ba1-b210-8599-2bd1a142c054@bootlin.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Groupsio-MsgNum: 1442
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-K0xRNDa6cUAZQ7YhsVyM"

--=-K0xRNDa6cUAZQ7YhsVyM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

On Fri, 2021-06-11 at 11:13 +0200, Michael Opdenacker wrote:
> I can try to take care of this to save you time, Daniel... Here's what
> I've included in my local branch meant to merge your changes into
> "master-next" of yocto-docs.
>=20
>       It must not be used directly in recipes when deploying files. Inste=
ad,
>       it's only useful when a recipe needs to "read" a file already deplo=
yed
>       by a dependency. So, it should be filled with the contents of
>       :term:`DEPLOYDIR` by the :ref:`deploy <ref-classes-deploy>` class o=
r
>       with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
>       <ref-classes-image>` class.

Yes, that looks good, thank you!

Cheers
Daniel

--=-K0xRNDa6cUAZQ7YhsVyM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkDMJRIopzNTng/jmZ2f8gllWJGkFAmDDN3AACgkQZ2f8gllW
JGlphA/6AisQkmonwWmOZUOg+Sgt5SDA6hMIOtiTkKWPoli/BTN0x0eNDC0rOHx/
Q0bwLdbrl7Zy83CLBw4aKJeflDpplJUpAyWvnek/em75zg7sb8vF0UMJiN9S+efZ
J8W86y4MtQZQT7o2ZxrVjkMIiY2CjyJPXmztrxsSNMdr5ddqaNskjd+dWd4QDlaJ
A8/Wttap387rHzWQl7RzllSveQsn5kM8DdjBsB+jL5Z8gsqIfX73eF/EApF3E89X
2ds8dbDFhitJ21OdNDo2HxZ8TJjdco5tkVd9WI014HX+Wmn6i6rBicLq05cI5IHk
yW6eAjslxvlrR4T+gKzCMmk5SCwPtrkORnK7ajlq5YFCCB7nzfjpE5xSEpPlSoVR
I2qp9g8UWyaOJiO3ZH6BODATr0n2f63K7841ql0rm4e6DKkmsqn1Z55MfkFQwBz8
pyUbvz6pe72BMl4N8/z6DXwK2YXLs07l4nWlGPoUJlYwZ41bomD6HlyJWD9tcB2u
a/a660gmDOGns0IbsLiV3kOnGiCuiXaFMGTlN+kBhAd1vWpEzpSTNS26h6tstW2o
ZQ5uIbtlllHKEmtZ+0W9QLXeI1rGmjAnZt/fhK6+Nmyi6DSbgUPl00A+OGJQbOLX
HcBuwzYru14QhxDp/0XudnMQOrdEI6jihecMEvarwA8zZHpxI80=
=MOuu
-----END PGP SIGNATURE-----

--=-K0xRNDa6cUAZQ7YhsVyM--
