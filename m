Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.37668.1610384881429581259
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 09:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jQwWfWK/;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1610384882;
  x=1641920882;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2VlZxdolIq2ryQp2ES94j6zinsHORaVRI83UcsYrO/g=;
  b=jQwWfWK/Mpxg2D5U2WG2P3WfOh6iE69SrX6lw1shQz6zCPJoGiwSmbk7
   KzH8rVcyMHC2LE+mM1tLUhBSeMgBOfBaSoQclngkswVY9cEElIO3s+kVA
   a4g7l837sv5jLB/yYJ+2AlVP3CObalLiEOfNV6R0Py11WUPKgIIWjpCkK
   C87Ts4GtniBffT5CSM0RxJvDiwLsLYld4zWMOkLxToiPWSD2FSOMnwuGr
   U19dAdpHDeAU/o5K2bk/iYvFKxDDkC0efdDfe4O5H+IDUPpAtiwqH7xAT
   /pOLmukVw3TP+EJxFKIhoWjYmaSB+bKyuP95/A2IDgk3EZP+TXxI9rG3a
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Quentin Schulz
	<foss@0leil.net>
CC: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] documentation: sphinx-static: switchers.js: add release name in dropdown menu
Thread-Topic: [docs] [PATCH] documentation: sphinx-static: switchers.js: add
 release name in dropdown menu
Thread-Index: AQHW6BKrUyeklY/CD0eYlN8JugRbSaoiRP6AgABhqvA=
Date: Mon, 11 Jan 2021 17:07:49 +0000
Message-ID: <6ce3ef28ccb44fcb9ade563d5aabd267@XBOX03.axis.com>
References: <20210111120938.20633-1-foss@0leil.net>
 <20210111121155.zgrmq3bh6roynjhv@qschulz>
In-Reply-To: <20210111121155.zgrmq3bh6roynjhv@qschulz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Quentin Schulz
> Sent: den 11 januari 2021 13:12
> To: Quentin Schulz <foss@0leil.net>
> Cc: docs@lists.yoctoproject.org
> Subject: Re: [docs] [PATCH] documentation: sphinx-static: switchers.js:
> add release name in dropdown menu
>=20
> Hi all,
>=20
> Couldn't test properly on a local server so might want to keep an eye on
> it.
>=20
> As usual, css or js files changes aren't picked up by sphinx so you need
> to rebuild from scratch.
>=20
> When/If it gets approved, let me know so I can send backport patches.
>=20
> Cheers,
> Quentin
>=20
> On Mon, Jan 11, 2021 at 01:09:38PM +0100, Quentin Schulz wrote:
> > Up until now, only the version of a Yocto release was printed, which
> > isn't very user-friendly.
> >
> > Add the release name too so that it's obvious to users which release of
> > Yocto the currently open docs are applying to.
> >
> > Signed-off-by: Quentin Schulz <foss@0leil.net>
> > ---
> >  documentation/sphinx-static/switchers.js | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/documentation/sphinx-static/switchers.js b/documentation/s=
phinx-static/switchers.js
> > index 754de2e6a..fd4dd607d 100644
> > --- a/documentation/sphinx-static/switchers.js
> > +++ b/documentation/sphinx-static/switchers.js
> > @@ -3,10 +3,10 @@
> >
> >    var all_versions =3D {
> >      'dev': 'dev (3.3)',
> > -    '3.2.1': '3.2.1',
> > -    '3.1.4': '3.1.4',
> > -    '3.0.4': '3.0.4',
> > -    '2.7.4': '2.7.4',
> > +    '3.2.1': 'gatesgarth (3.2.1)',
> > +    '3.1.4': 'dunfell (3.1.4)',
> > +    '3.0.4': 'zeus (3.0.4)',
> > +    '2.7.4': 'warrior (2.7.4)',

Since these are names, wouldn't it be more appropriate to capitalize them:

    '3.2.1': 'Gatesgarth (3.2.1)',
    '3.1.4': 'Dunfell (3.1.4)',
    '3.0.4': 'Zeus (3.0.4)',
    '2.7.4': 'Warrior (2.7.4)',

> >    };
> >
> >    var all_doctypes =3D {
> > --
> > 2.29.2

//Peter

