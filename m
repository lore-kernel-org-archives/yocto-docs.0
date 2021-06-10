Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.1009.1623343374393658012
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 09:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4G18sM07vnz5tlF;
	Thu, 10 Jun 2021 18:42:30 +0200 (CEST)
Date: Thu, 10 Jun 2021 18:42:29 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] test-manual: add initial reproducible builds documentation
Message-ID: <20210610164229.h2vyvyrbismqxkrj@qschulz>
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
 <20210609144728.103458-1-michael.opdenacker@bootlin.com>
 <20210609155552.nwjdirom4lkqi4n7@qschulz>
 <6400f2c43fd9d292616cbc5d2f6cd99f98ebc2a3.camel@linuxfoundation.org>
 <20210610085412.nepf2mxa2mco5z6a@qschulz>
 <25943cb95fd97a83144e00e7a30917d609b184b2.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <25943cb95fd97a83144e00e7a30917d609b184b2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Thu, Jun 10, 2021 at 10:14:11AM +0100, Richard Purdie wrote:
> On Thu, 2021-06-10 at 10:54 +0200, Quentin Schulz wrote:
> > Hi Richard,
> >=20
> > On Wed, Jun 09, 2021 at 05:30:56PM +0100, Richard Purdie wrote:
> > > On Wed, 2021-06-09 at 17:55 +0200, Quentin Schulz wrote:
> > > > On Wed, Jun 09, 2021 at 04:47:28PM +0200, Michael Opdenacker wrot=
e:
> > > >=20
> > > > > +
> > > > > +You could subclass the test and change ``targets`` to a differ=
ent target.
> > > > > +
> > > > > +You may also change ``sstate_targets`` which would allow you t=
o "pre-cache" some
> > > > > +set of recipes before the test, meaning they are excluded from=
 reproducibility
> > > > > +testing. As a practical example, you could set ``sstate_target=
s`` to
> > > > > +``core-image-sato``, then setting ``targets`` to ``core-image-=
sato-sdk`` would
> > > > > +run reproducibility tests only on the targets belonging only t=
o ``core-image-sato-sdk``.
> > > > > --=20
> > > >=20
> > > > I'm not sure this section has its place in our documentation sinc=
e it
> > > > seems bound to the current implementation and explains modificati=
ons of
> > > > the code.
> > > >=20
> > > > I'd vote it out.
> > >=20
> > > Doesn't most of the manual document the current implementation?
> > >=20
> > > When this wasn't here, you wanted an example! I do agree we should =
give people=A0
> > > some kind of a hint about how to write their own tests. We're likel=
y going to end=A0
> > > up adding more example, not less?
> > >=20
> >=20
> > Because I understood the original section as "it's very simple to do
> > this, look into this file", so I assumed some arguments could be pass=
ed
> > to make it easy to re-use. I wasn't expecting changes in a Python
> > script.
>=20
> I think the confusion here is the definition of simple :).
>=20
> At least in theory, you can create your own test case in your own layer
> and in that test, inherit and subclass the original test (standard pyth=
on).=A0
> In that subclassed test, you could change those two variables and you=A0
> should then have your own test case.
>=20
> Would that work? Should do, at least mostly but I will admit I've not t=
ried it.
> Adding a new test in your layer and also subclassing an existing test i=
s=A0
> something we should document somewhere in the test manual ultimately. T=
hat
> is partly why I continued to expand on what I meant here.

I re-read the previous mail and I think my brain just ignored the
following sentence:
You could subclass the test and change ``targets`` to a different target.

Which should have put me on the right track. I was missing this bit in
my understanding. And now, I happily concede that my comments didn't
make much sense considering what you suggested :)

>=20
> > As opposed to classes, variables and/or tasks, which to me seems to b=
e
> > kind of an ABI, so it is maintained and watched for changes and if
> > there's any, usually listed in the migration manual, I would assume t=
he
> > content of Python scripts aren't expected to stay "stable" or their
> > change be documented otherwise?
> >=20
> > Here the suggested example is about modifying variables that are used=
 only
> > in a given Python class, which could change over time, including the =
name
> > of the variables to be changed.
>=20
> I agree it is a bit risky to have these in the manual, equally, the man=
ual
> does have worked examples and I believe there is a good case for having=
 them
> here as this is something we want to teach people how to do.
>=20
> FWIW that test was designed to be sub-classed so there is at least some
> intent to allow people to do this. As such we'd probably try to maintai=
n=A0
> some kind of compatibility if we can.
>=20

Agreed. I would try to make sure subclassing works since you seem to
insinuate you're not 100% sure it works right now.

I would very much see a "code" example, with the correct path in the
layer (if that matters in some ways to bitbake) somewhere in the docs
then. If it does not make sense in this section, at least refer to where
it will lie.

> > This also kind of encourages people to modify code in layers they don=
't
> > have push access to, which is something that we usually don't want
> > people to do IIRC?
>=20
> The key missing detail is you can put test code in your own layer. I
> can even point at an example:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta-yocto-bsp/lib/oeqa/=
selftest/cases/systemd_boot.py
>=20
> (which is also how we test this stays working)
>=20

Indeed, thanks for clarifying this, it makes sense to me now.

Cheers,
Quentin
