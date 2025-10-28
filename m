Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A4BCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:18:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.7940.1761646696593996133
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 03:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1vDgmN-0002TC-4D; Tue, 28 Oct 2025 11:18:15 +0100
Message-ID: <b9a67776c1a27a17420bd8985e64fcc6992ee0e1.camel@pengutronix.de>
Subject: Re: [docs] [PATCH] dev-manual/sbom.rst: reflect that create-spdx is
 enabled by default
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Date: Tue, 28 Oct 2025 11:18:14 +0100
In-Reply-To: <e84d4047-dc45-4d05-b30e-38c9c7b2b85b@cherry.de>
References: <20251028081249.1378992-1-ejo@pengutronix.de>
	 <e84d4047-dc45-4d05-b30e-38c9c7b2b85b@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 10:18:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7877

Am Dienstag, dem 28.10.2025 um 11:04 +0100 schrieb Quentin Schulz:
> Hi Enrico,
>=20
> On 10/28/25 9:12 AM, Enrico J=C3=B6rns via lists.yoctoproject.org wrote:
> > Since nanbield (b34032ec "defaultsetup: Inherit create-spdx by
> > default"), the create-spdx class is pulled in by default, not only by
> > poky.
> >=20
>=20
> Indeed!
>=20
> > Adapt the text to reflect this and also change INHERIT to INHERIT_DISTR=
O
> > since this is the more concrete variable to modify for disabling
> > create-spdx.
> >=20
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0 documentation/dev-manual/sbom.rst | 15 ++++-----------
> > =C2=A0 1 file changed, 4 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manu=
al/sbom.rst
> > index ca0fc8b9d..d54a33a47 100644
> > --- a/documentation/dev-manual/sbom.rst
> > +++ b/documentation/dev-manual/sbom.rst
> > @@ -24,19 +24,12 @@ users can read in standardized format.
> > =C2=A0 :term:`SBOM` information is also critical to performing vulnerab=
ility exposure
> > =C2=A0 assessments, as all the components used in the Software Supply C=
hain are listed.
> > =C2=A0=20
> > -The OpenEmbedded build system doesn't generate such information by def=
ault,
> > -though the :term:`Poky` reference distribution has it enabled out of t=
he box.
> > +The OpenEmbedded build system generates such information by default (b=
y
> > +inheriting the :ref:`ref-classes-create-spdx` class in :term:`INHERIT_=
DISTRO`).
> > =C2=A0=20
>=20
> s/in/via/ ?

I guess both should work, but yours might be slightly better, indeed.

> > -To enable it, inherit the :ref:`ref-classes-create-spdx` class from a
> > -configuration file::
> > +If needed, it can be disabled from a :term:`configuration file`::
> > =C2=A0=20
> > -=C2=A0=C2=A0 INHERIT +=3D "create-spdx"
> > -
> > -In the :term:`Poky` reference distribution, :term:`SPDX` generation do=
es
> > -consume some build time resources and thus if needed it can be disable=
d from a
> > -:term:`configuration file`::
> > -
> > -=C2=A0=C2=A0 INHERIT:remove =3D "create-spdx"
> > +=C2=A0=C2=A0 INHERIT_DISTRO:remove =3D "create-spdx"
> > =C2=A0=20
>=20
> INHERIT_DISTRO is set with a weak operator (?=3D) so one can simply set i=
t=20
> from any location with INHERIT_DISTRO =3D (or if parsed before=20
> defaultsetup.conf, with INHERIT_DISTRO ?=3D). There's no need to go the=
=20
> overkill way of using :remove here.

But that would override the other settings, too.
I guess it depends on what the actual goal is.
But admittedly, I was unsure if and how to change the suggestion here, too =
(also since this is
nothing really create-spdx-specific).

Let me know in case I should make a v2 for any of these changes =F0=9F=99=
=82.

> In any case,
>=20
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Regards, Enrico

> Thanks!
> Quentin

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

