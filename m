Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.5502.1620280002118341224
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 22:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 69BE25FEC9;
	Thu,  6 May 2021 07:46:40 +0200 (CEST)
Message-ID: <e651d05fba0a2f9ffb800820d4a762b66eb0f4ca.camel@emlix.com>
Subject: Re: [docs] [PATCH v2] kernel-dev: document KCONFIG_MODE
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Cc: quentin.schulz@streamunlimited.com
Date: Thu, 06 May 2021 07:46:35 +0200
In-Reply-To: <8bc762e4-cd03-f305-2635-ce390c4ea40d@bootlin.com>
References: <20210505085749.753783-1-dwagenknecht@emlix.com>
	 <8bc762e4-cd03-f305-2635-ce390c4ea40d@bootlin.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Groupsio-MsgNum: 1237
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wPjgQjRwn/mkh4m3bYAf"

--=-wPjgQjRwn/mkh4m3bYAf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael, hello Quentin,

> From an English perspective, I believe that "unset" means "not set", but
> from a UNIX perspective, it makes me think about corresponding shell
> command, that unsets an variable that was set previously.
>=20
> Could we just say "not set" instead of "unset"?

It reduces ambiguity and I can see no reasons against "not set". Will you =
do
this little fixup when merging?
Thanks!

Cheers
--=20
Daniel Wagenknecht

emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 316=
0
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke
Ust-IdNr.: DE 205 198 055

emlix - smart embedded open source

On Wed, 2021-05-05 at 11:30 +0200, Michael Opdenacker wrote:
> Hi Daniel,
>=20
> Many thanks for the new version.
>=20
> On 5/5/21 10:57 AM, Daniel Wagenknecht wrote:
> > +
> > +      In case ``KCONFIG_MODE`` is unset the behaviour will depend on =
where
>=20
> From an English perspective, I believe that "unset" means "not set", but
> from a UNIX perspective, it makes me think about corresponding shell
> command, that unsets an variable that was set previously.
>=20
> Could we just say "not set" instead of "unset"?
>=20
> Any thoughts?
>=20
> Other than that, happy to merge your patch. I can take care of fixing
> "explicitely".
>=20
> Cheers,
>=20
> Michael.
>=20
>=20
>=20

--=-wPjgQjRwn/mkh4m3bYAf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkDMJRIopzNTng/jmZ2f8gllWJGkFAmCTgrsACgkQZ2f8gllW
JGnETg//YPjdUW7Ap88iUhWtrnpTwDOyneyBkVKs0fXIgXj7KuVMFcpqkvyvPj2o
EPX8GsCB+cP17CcjmorwS4yteQtbuKTSXsqEnJkp8NrUBjnHvy6O0KfJ1U7413I3
WPPDn8Yi0Bc6FMnJhQitUcVA5XQjXTP13VuBbshjV54l9T3sE10iRCO3Or0O11fK
uzNUcnN4v0KvS/PDxjM2zcRyK6LOv3qBiOPHZO6ikUO29U3gbI9sgKAiQ6WNMK/s
JHzcqpBAzHUxTbiqyfEKKQC3sgjBF2AVHsd1TwJevYafjQOHgFgvxUeEaiTm/EBX
QCqmg6ytp/fLFklbBww06wQpIuPl7p06c+LqJKnmQSmBf9/MjYs5Ut1XB0hcJO/Y
53b8A9V/kKJKzfzZRpJlkEIQukYPdUaxB9lhKza1bCcSfmcbVdIpkp3Um8TjcyZj
aQIDbhBNT3a3QvVrRj5W4zfVWf7vA2lGHF3Ex3aNPSTcARF+W9GEG7Zr0Ukwc/0Q
k6jctl7VgcAU7/nTu7jeFn7nmQ0XjrWUJnbaB7CqoVn66LXgA9B8ttudfMX6rWKD
n43b48LHTzmtqhZPZTXHDXBFwrKq5l3TIG8dfhQfqgNSK2kZbgaue/uynCKVtlNJ
+rqeLzDtaWLWvfseMFPqZBJpbLtKnKUdsZ6YpQbseX7RiwgNsFw=
=Exot
-----END PGP SIGNATURE-----

--=-wPjgQjRwn/mkh4m3bYAf--
