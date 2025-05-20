Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A8EC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 09:30:31 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.16659.1747733430562537921
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 02:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uHJIq-0002w5-Ll; Tue, 20 May 2025 11:30:28 +0200
Message-ID: <7fd3f2780749cc5340a1c5d964c9a60148a59cab.camel@pengutronix.de>
Subject: Re: [docs] [PATCH] conf.py: tweak SearchLanguage to be
 hyphen-friendly
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Date: Tue, 20 May 2025 11:30:28 +0200
In-Reply-To: <5484b251-9bd5-4de3-abb0-b3567ffd5631@cherry.de>
References: <20250502203501.3364973-1-ejo@pengutronix.de>
	 <5484b251-9bd5-4de3-abb0-b3567ffd5631@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 09:30:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6846

Hi Quentin,

Am Montag, dem 05.05.2025 um 11:11 +0200 schrieb Quentin Schulz:
> > ---
> > =C2=A0 documentation/conf.py | 21 +++++++++++++++++++++
> > =C2=A0 1 file changed, 21 insertions(+)
> >=20
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index 2aceeb8e7..02397cd20 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -13,6 +13,7 @@
> > =C2=A0 # documentation root, use os.path.abspath to make it absolute, l=
ike shown here.
> > =C2=A0 #
> > =C2=A0 import os
> > +import re
> > =C2=A0 import sys
> > =C2=A0 import datetime
> > =C2=A0 try:
> > @@ -173,6 +174,26 @@ latex_elements =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'preamble': '\\usepackage[UTF8]{ctex}\n\=
\setcounter{tocdepth}{2}',
> > =C2=A0 }
> > =C2=A0=20
> > +
> > +from sphinx.search import SearchLanguage
> > +from sphinx.search import languages
> > +class DashFriendlySearchLanguage(SearchLanguage):
>=20
> Could you extend SearchEnglish instead, which is I believe what we=20
> should be using today?

yes, fine for me.


> > +=C2=A0=C2=A0=C2=A0 lang =3D 'en'
> > +
>=20
> This would then be redundant.

Ok.

> > +=C2=A0=C2=A0=C2=A0 # Accept words that can include hyphens
> > +=C2=A0=C2=A0=C2=A0 _word_re =3D re.compile(r'[\w-]+')
>=20
> I would recommend to have the dash as first character in case we ever=20
> want to expand this regex to avoid inadvertently making it a range, c.f.=
=20
> https://docs.python.org/3/library/re.html#module-re=C2=A0[] section. Or=
=20
> simply escape it so it's explicit what we're expecting from it :)

Yes, might save us from later surprises.

> > +
> > +=C2=A0=C2=A0=C2=A0 def split(self, input: str) -> list[str]:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return self._word_re.findal=
l(input)
> > +
>=20
> This is already what the split method from SearchLanguage does,=20
> therefore no need to override it.

Indeed. No idea why I thought this is required.

> > +=C2=A0=C2=A0=C2=A0 js_splitter_code =3D """
> > +function splitQuery(query) {
> > +=C2=A0=C2=A0=C2=A0 return query.split(/\\s+/g).filter(term =3D> term.l=
ength > 0);
>=20
> Why not simply add '-' to the default splitQuery as in=20
> sphinx/themes/basic/static/searchtools.js so we keep as close as=20
> possible to the original behavior, just with the added dash?

Wasn't sure if including or excluding is better, but maybe having it closer=
 to the original one
makes sense.

Will send a v2 soon.

Regards,
Enrico

> Cheers,
> Quentin
>=20

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

