Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.7419.1623315262435607678
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 01:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4G0yT21vlgz5tlH;
	Thu, 10 Jun 2021 10:54:14 +0200 (CEST)
Date: Thu, 10 Jun 2021 10:54:12 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] test-manual: add initial reproducible builds documentation
Message-ID: <20210610085412.nepf2mxa2mco5z6a@qschulz>
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
 <20210609144728.103458-1-michael.opdenacker@bootlin.com>
 <20210609155552.nwjdirom4lkqi4n7@qschulz>
 <6400f2c43fd9d292616cbc5d2f6cd99f98ebc2a3.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <6400f2c43fd9d292616cbc5d2f6cd99f98ebc2a3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Wed, Jun 09, 2021 at 05:30:56PM +0100, Richard Purdie wrote:
> On Wed, 2021-06-09 at 17:55 +0200, Quentin Schulz wrote:
> > On Wed, Jun 09, 2021 at 04:47:28PM +0200, Michael Opdenacker wrote:
> >=20
> > > +
> > > +You could subclass the test and change ``targets`` to a different =
target.
> > > +
> > > +You may also change ``sstate_targets`` which would allow you to "p=
re-cache" some
> > > +set of recipes before the test, meaning they are excluded from rep=
roducibility
> > > +testing. As a practical example, you could set ``sstate_targets`` =
to
> > > +``core-image-sato``, then setting ``targets`` to ``core-image-sato=
-sdk`` would
> > > +run reproducibility tests only on the targets belonging only to ``=
core-image-sato-sdk``.
> > > --=20
> >=20
> > I'm not sure this section has its place in our documentation since it
> > seems bound to the current implementation and explains modifications =
of
> > the code.
> >=20
> > I'd vote it out.
>=20
> Doesn't most of the manual document the current implementation?
>=20
> When this wasn't here, you wanted an example! I do agree we should give=
 people=A0
> some kind of a hint about how to write their own tests. We're likely go=
ing to end=A0
> up adding more example, not less?
>=20

Because I understood the original section as "it's very simple to do
this, look into this file", so I assumed some arguments could be passed
to make it easy to re-use. I wasn't expecting changes in a Python
script.

As opposed to classes, variables and/or tasks, which to me seems to be
kind of an ABI, so it is maintained and watched for changes and if
there's any, usually listed in the migration manual, I would assume the
content of Python scripts aren't expected to stay "stable" or their
change be documented otherwise?

Here the suggested example is about modifying variables that are used onl=
y
in a given Python class, which could change over time, including the name
of the variables to be changed.

This also kind of encourages people to modify code in layers they don't
have push access to, which is something that we usually don't want
people to do IIRC?

I'm not sure I managed to convey my thoughts better. I just expected a
simple command to be able to test my recipes, or via a configuration
script.

Anyway, no big deal, I'm happy to see the reproducible test procedure is
being documented :)

Cheers,
Quentin
