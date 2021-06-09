Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.5576.1623231302226844070
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 02:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4G0MQV4kgBz5tlC;
	Wed,  9 Jun 2021 11:34:58 +0200 (CEST)
Date: Wed, 9 Jun 2021 11:34:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] test-manual: add initial reproducible builds documentation
Message-ID: <20210609093457.3jgih5vydfcv5nbe@qschulz>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
 <20210609091143.vvykg2irov6wcbdu@qschulz>
 <bd3a88e611ed0de758eafd6928e2ee077b4861d5.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <bd3a88e611ed0de758eafd6928e2ee077b4861d5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 10:23:35AM +0100, Richard Purdie wrote:
> On Wed, 2021-06-09 at 11:11 +0200, Quentin Schulz wrote:
> > Hi Michael, Richard,
> >=20
> > On Tue, Jun 08, 2021 at 11:58:53AM +0200, Michael Opdenacker wrote:
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >=20
> > > +The Yocto Project defines reproducibility as where a given input b=
uild configuration will give the same binary output regardless of when it=
 is built (now or in 5 years time), regardless of the path on the filesys=
tem the build is run in, and regardless of the distro and tools on the un=
derlying host system the build is running on.
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Why it matters
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The project aligns with the `Reproducible Builds project <https://=
reproducible-builds.org/>`_, which shares information about why reproduci=
bility matters. The primary focus of the project is the ability to detect=
 security issues being introduced. However, from a Yocto Project perspect=
ive, it is also hugely important that our builds are deterministic. When =
you build a given input set of metadata, we expect you to get consistent =
output. This has always been a key focus but is now true down to the bina=
ry level including timestamps.
> > > +
> >=20
> > "now" is too abstract? Can we say at least since when (e.g. which rel=
ease)?
>=20
> As of dunfell we enabled reprodubile builds in poky by default.
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta-poky/conf/distro/=
poky.conf?id=3D25a17f0346ab05b3212bb280e4a8b622bcf99bce
>=20
> >=20
> > > +For example, at some point in the future life of a product, you fi=
nd that you need to rebuild to add a security fix. If this happens, only =
the components that have been modified should change at the binary level.=
 This would lead to much easier and clearer bounds on where validation is=
 needed.
> > > +
> > > +This also gives an additional benefit to the project builds themse=
lves, our hash equivalence for :ref:`Shared State <overview-manual/concep=
ts:Shared State>` object reuse works much more effectively when the binar=
y output remains the same.
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +How we implement it
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +There are many different aspects to build reproducibility, but som=
e particular things we do within the build system to ensure reproducibili=
ty include:
> > > +
> > > +* Adding mappings to the compiler options to ensure debug filepath=
s are mapped to consistent target compatible paths. This is done through =
the ``DEBUG_PREFIX_MAP`` variable which sets the ``-fmacro-prefix-map`` a=
nd ``-fdebug-prefix-map`` compiler options correctly to map to target pat=
hs.
> >=20
> > Would documenting DEBUG_PREFIX_MAP make sense? Is it supposed to be
> > changed by users in some cases?
> > for reference, where it's being defined: https://git.yoctoproject.org=
/cgit.cgi/poky/tree/meta/conf/bitbake.conf#n612
>=20
> Users shouldn't need to mess with it but it should be documented.
>=20
> >=20
> > > +* Being explicit about recipe dependencies and their configuration=
 (no floating configure options or host dependencies creeping in). In par=
ticular this means making sure :term:`PACKAGECONFIG` coverage covers conf=
igure options which may otherwise try and auto-detect host dependencies.
> > > +* Using recipe specific sysroots to isolate recipes so they only s=
ee their dependencies. These are visible as ``recipe-sysroot`` and ``reci=
pe-sysroot-native`` directories within the :term:`WORKDIR` of a given rec=
ipe and are populated only with the dependencies a recipe has.
> >=20
> > Can't we just reference RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE here=
?
> > Aaaand I just discovered these aren't in the variable glossary but I
> > find them very important?
>=20
> I suspect unfortunately our recipe specific sysroots are basically not=A0
> documented at all :(. Again, probably needs fixing ultimately.
>=20
> >=20
> > Can be done later on since they do not exist yet.
> >=20
> > > +* Build images from a reduced package set: only packages from reci=
pes the image depends upon.
> > > +* Filtering the tools available from the host's PATH to only a spe=
cific set of tools, set using the :term:`HOSTTOOLS` variable.
> > > +
> >=20
> > ``PATH``?
> >=20
> > Also, I think we use dashes more than asterisks for lists?
> >=20
> > I think there's also an additional point: we check the sources we
> > download. Therefore, if a commit disappears (force-pushed/removed
> > branch/tag), the tarball disappears from upstream, or its checksum
> > differs from what we expect, we don't build.
> >=20
> > Might be worth mentioning that we only download sources from the
> > internet when we're missing them locally. So hosting a mirror for
> > sources or making sure they are available locally is a need if you wa=
nt
> > to guarantee full reproducible builds.
> >=20
> > And this is especially important to mention since some projects are
> > removing their master branches for example in favor of main, breaking
> > older builds. Or some projects change hosting services and do not
> > redirect, or just disappear from the Internet.
>=20
> Yes, we should put something in about input validation - all inputs
> to the build have some kind of validation, by checksum or source=A0
> control hash/revision.
>=20
> >=20
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Can we prove the project is reproducible?
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Yes, we can prove it and we now regularly test this on the Autobui=
lder. At the time of writing (Hardknott 3.3), OE-Core is 100% reproducibl=
e for all its recipes (i.e. world builds) apart from the Go language and =
Ruby documentation packages. Unfortunately, the current implementation of=
 the Go language has fundamental reproducibility problems as it always de=
pends upon the paths it is build in.
> > > +
> >=20
> > s/now//
> >=20
> > Please give a link to reproducibility test archives/categories on the
> > Autobuilder if there's any available?
>=20
>=20
> Isn't that below with the current status? The autobuilder would be some=
thing like:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible
>=20
> but also
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-ce=
ntos
> https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-de=
bian
> https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-fe=
dora
> https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-ub=
untu
>=20

Since we will have anchor links per section of this page, I feel like
it's important to have links/instructions where we mention things even
if it means we're repeating the same things in the same page.

> >=20
> > s/build/built/
> >=20
> > I would add a reference to OE-Core term :term:`OpenEmbedded-Core (OE-=
Core)`
> > which explains what exactly it is. It is an important reference since=
 we
> > really mean to say that openembedded-core layer recipes (which is
> > meta layer in poky) is 100% reproducible, nothing else. Basically,
> > OE-Core + Bitbake is guaranteed to be reproducible, but the moment yo=
u
> > add another layer, no guarantee (e.g. because of additional
> > configuration files, bbappends, overridden classes, etc...)
> >=20
> > > +To run our automated selftest, as we use in our CI on the Autobuil=
der, you can run::
> > > +
> > > +   oe-selftest -r reproducible.ReproducibleTests.test_reproducible=
_builds
> > > +
> > > +This defaults to including a world build so, if other layers are a=
dded, it would also run the tests for recipes in the additional layers. T=
he first build will be run using Shared State if available, the second bu=
ild explicitly disables Shared State and builds on the specific host the =
build is running on. This means we can test reproducibility builds betwee=
n different host distributions over time on the Autobuilder.
> > > +
> >=20
> > s/Shared State/:ref:`Shared State <overview-manual/concepts:Shared St=
ate>`/
> >=20
> > since we already reference it earlier in this page.
> >=20
> > > +If ``OEQA_DEBUGGING_SAVED_OUTPUT`` is set, any differing packages =
will be saved here. The test is also able to run the ``diffoscope`` comma=
nd on the output to generate HTML files showing the differences between t=
he packages, to aid debugging. On the Autobuilder, these appear under htt=
ps://autobuilder.yocto.io/pub/repro-fail/ in the form ``oe-reproducible +=
 <date> + <random ID>``, e.g. ``oe-reproducible-20200202-1lm8o1th``.
> > > +
> >=20
> > Would it make sense to document OEQA_DEBUGGING_SAVED_OUTPUT too?
> >=20
> > > +The project's current reproducibility status can be seen at https:=
//www.yoctoproject.org/reproducible-build-results/
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Can I test my layer or recipes?
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Yes, see the self test in :ref:`oe-selftest <ref-manual/release-pr=
ocess:Testing and Quality Assurance>` at `meta/lib/oeqa/selftest/cases/re=
producible.py <https://git.openembedded.org/openembedded-core/tree/meta/l=
ib/oeqa/selftest/cases/reproducible.py>`_ which can be subclassed for spe=
cific use cases.
> >=20
> > Please provide actual commands to run so the user does not have to gu=
ess :)
>=20
> It is stated in the section above!
>=20
> (oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds=
)
>=20

So this means you need to test the world build in order to test your
layer or recipes? Or is there a way to only test a specific recipe?

If not, it's anyway worth repeating ourselves :)

We should provide dirt-simple, easy-to-follow instructions so that it's
easy to get people behind the idea that reproducible is a must and
should be tested before it's too late :)

Cheers,
Quentin
