Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.5242.1606302327613848318
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 03:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4CgyjJ3X3bz5tlN;
	Wed, 25 Nov 2020 12:05:24 +0100 (CET)
Date: Wed, 25 Nov 2020 12:05:23 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] {dev,kernel,sdk}-manual: replace hardcoded release version with &DISTRO;
Message-ID: <20201125110522.4dhp3xddwrbrckn3@qschulz>
References: <20201125091526.46021-1-nicolas.dechesne@linaro.org>
 <20201125101647.jzde6uprwod3cvpd@qschulz>
 <CAP71WjzvhNnYo5EP+QoN-NprZwyLOqA-cLQ1skkES2hsG53MhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjzvhNnYo5EP+QoN-NprZwyLOqA-cLQ1skkES2hsG53MhA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 11:55:20AM +0100, Nicolas Dechesne wrote:
> Le mer. 25 nov. 2020 =C3=A0 11:16, Quentin Schulz <
> quentin.schulz@streamunlimited.com> a =C3=A9crit :
>=20
> > Hi Nicolas,
> >
> > On Wed, Nov 25, 2020 at 10:15:26AM +0100, Nicolas Dechesne wrote:
> > > In the Docbook files we had DISTRO, but somehow it was lost during =
the
> > > migration to Sphinx.
> > >
> > > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > ---
> > >  documentation/dev-manual/dev-manual-qemu.rst   |  2 +-
> > >  documentation/kernel-dev/kernel-dev-common.rst |  4 ++--
> > >  .../sdk-manual/sdk-appendix-obtain.rst         |  8 ++++----
> > >  documentation/sdk-manual/sdk-extensible.rst    |  4 ++--
> > >  documentation/sdk-manual/sdk-intro.rst         |  4 ++--
> > >  documentation/sdk-manual/sdk-using.rst         | 18 +++++++++-----=
----
> > >  .../sdk-manual/sdk-working-projects.rst        | 10 +++++-----
> > >  7 files changed, 25 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/documentation/dev-manual/dev-manual-qemu.rst
> > b/documentation/dev-manual/dev-manual-qemu.rst
> > > index c91e8b538..63640411d 100644
> > > --- a/documentation/dev-manual/dev-manual-qemu.rst
> > > +++ b/documentation/dev-manual/dev-manual-qemu.rst
> > > @@ -81,7 +81,7 @@ available. Follow these general steps to run QEMU=
:
> > >        your :term:`Build Directory`.
> > >
> > >     -  If you have not built an image, you can go to the
> > > -      :yocto_dl:`machines/qemu
> > </releases/yocto/yocto-3.1.2/machines/qemu/>` area and download a
> > > +      :yocto_dl:`machines/qemu
> > </releases/yocto/yocto-&DISTRO;/machines/qemu/>` area and download a
> >
> > The only remark I have is that DISTRO is 3.2 now. My question is, can
> > all places where 3.1.2 is used have a non-dot version instead (i.e. 3=
.2
> > instead of 3.2.0)?
> >
> > If yes, we're good. If not, we probably need to add a DISTRO_DOT or
> > something, that is 3.2.0 when DISTRO is 3.2 but then have them equal
> > when 3.2.1 is released.
> >
> > I don't know how the version numbers are picked and how much they are
> > used as is, hence the question :)
>=20
>=20
> I think 3.2 is right. This is what we use when we publish on the websit=
e,
> not 3.2.0. If we use 3.2.0 in the docs many http links won=E2=80=99t wo=
rk.
>=20

It was more about the output of a yocto build, e.g. the SDK, does it
have 3.2 in its name or 3.2.0?

I know we tag them with 3.2 only, just wondering if it's 3.2 everywhere
in code or if we can have a 3.2.0 somewhere for some reason.

Anyway, no biggie, if it's not exact (filename is different), it'll be
so close to the actual thing you're doing (filename or whatever) that
one can manage to fix it on their own. Links are important though and
they use 3.2, so let's stick with 3.2.

Hope it's not too much non-sense :p

All good for me.

Quentin
