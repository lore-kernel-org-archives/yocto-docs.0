Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FBFC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 09:10:41 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.16661.1747732235378104826
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 02:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1uHIzY-0006eM-Qg; Tue, 20 May 2025 11:10:32 +0200
Message-ID: <1d094e46bfd8c86b2c560013642e07094807dca5.camel@pengutronix.de>
Subject: Re: [docs] [PATCH] conf.py: tweak SearchLanguage to be
 hyphen-friendly
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Antonin Godard <antonin.godard@bootlin.com>, quentin.schulz@cherry.de, 
	docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Date: Tue, 20 May 2025 11:10:30 +0200
In-Reply-To: <D9UA7FZ1WXZ7.392FZOO10PXVZ@bootlin.com>
References: <20250502203501.3364973-1-ejo@pengutronix.de>
	 <5484b251-9bd5-4de3-abb0-b3567ffd5631@cherry.de>
	 <D9UA7FZ1WXZ7.392FZOO10PXVZ@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 09:10:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6845

Hi folks,

Am Montag, dem 12.05.2025 um 17:19 +0200 schrieb Antonin Godard:
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
> > > =C2=A0 documentation/conf.py | 21 +++++++++++++++++++++
> > > =C2=A0 1 file changed, 21 insertions(+)
> > >=20
> > > diff --git a/documentation/conf.py b/documentation/conf.py
> > > index 2aceeb8e7..02397cd20 100644
> > > --- a/documentation/conf.py
> > > +++ b/documentation/conf.py
> > > @@ -13,6 +13,7 @@
> > > =C2=A0 # documentation root, use os.path.abspath to make it absolute,=
 like shown here.
> > > =C2=A0 #
> > > =C2=A0 import os
> > > +import re
> > > =C2=A0 import sys
> > > =C2=A0 import datetime
> > > =C2=A0 try:
> > > @@ -173,6 +174,26 @@ latex_elements =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'preamble': '\\usepackage[UTF8]{ctex}\=
n\\setcounter{tocdepth}{2}',
> > > =C2=A0 }
> > > =C2=A0=20
> > > +
> > > +from sphinx.search import SearchLanguage
> > > +from sphinx.search import languages
> > > +class DashFriendlySearchLanguage(SearchLanguage):
> >=20
> > Could you extend SearchEnglish instead, which is I believe what we=20
> > should be using today?
>=20
> A question on top of this: using SearchLanguage instead of SearchEnglish =
results
> in _not_ using the stopwords and stemmer code defined in SearchEnglish. I=
s that
> intentional? Maybe there is a good reason for not using SearchEnglish, bu=
t I'm
> curious.

I have no strong opinion on this or what's better for a technical documenta=
tion.

Searching for 'effectiveness' in the documentation with stemmer enabled giv=
es you results like
'effectively', etc. Surprisingly, the exact occurrence does not match for m=
e anymore and the other
results are not highlighted...

But maybe with the intention to be least invasive, using SearchEnglish is f=
ine anyway.


Regards, Enrico

> Antonin
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

