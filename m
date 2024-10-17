Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED40D2124E
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:44:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.44601.1729154665726462669
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 01:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=obltrmTt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94A3D4000A;
	Thu, 17 Oct 2024 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729154663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AVzptjfRD5olO/PzOsJGs89THP17F+XyfjUbTWXmS9U=;
	b=obltrmTt5YjwiCG9oETyCQMqlhfZ+ejTavPjpQKj0hpOthz+6pw9aUno8h3eIgCV52BUZR
	+OmQbWYnwRIYXUHvWwz1smNN1PW58/TV23MsKFqaFP0by5lFi3mARjLGNGyN0nBhevVQRl
	oFXO/jvQ8dFJukqYUts+meJPzfeg50Ia1QOGsCv9Mb33xl1tEiUzyWEVutFoBPLbiIyswu
	2GmcGkmLlKm1HSEsLcoco9GGwqOt/uHtvNTab/Lv8T3IOL2whaoN8URQyyAsD/XPwp1h/p
	6bEYpCP78TUutXM4ZTE7tcpPNU+aOBPIBO0Q8u1/+8vGgt0/PRL/ZB220IDm4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Oct 2024 10:44:23 +0200
Message-Id: <D4XY661A30GQ.3E4DMVXPCZRZ@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH] overview-manual: concepts: add details on
 package splitting
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com>
 <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
In-Reply-To: <3afd2cfa-cba6-4f6a-8075-698850c703ad@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Oct 2024 08:44:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5526

Hi Quentin,

Thanks for the great comments :)

On Wed Oct 16, 2024 at 4:10 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/16/24 3:19 PM, Antonin Godard via lists.yoctoproject.org wrote:
> > The package splitting section of the overview manual currently lacks an=
y
> > explanation of how package splitting is implemented and redirects to
> > the package class, which is not really understandable for newcomers to
> > the project.
> >
> > This patch adds a short explanation of what is done:
> >
> > * How the PACKAGES variable is defined.
> > * How the FILES variable is defined.
> > * How the two work together.
> > * How to add a custom package.
> >
> > This should give enough details to a new user on what package splitting
> > achieves and how to add a custom package.
> >
> > Adresses [YOCTO #13225]
> >
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> >   documentation/overview-manual/concepts.rst | 49 +++++++++++++++++++++=
++++++---
> >   1 file changed, 44 insertions(+), 5 deletions(-)
> >
> > diff --git a/documentation/overview-manual/concepts.rst b/documentation=
/overview-manual/concepts.rst
> > index 62f2327a7e27a777f738523e7fafe62422186abb..d3e90b80d4fe1954c7aacba=
8f0fe243cba04c1b5 100644
> > --- a/documentation/overview-manual/concepts.rst
> > +++ b/documentation/overview-manual/concepts.rst
> > @@ -912,11 +912,50 @@ the analysis and package splitting process use se=
veral areas:
> >      execute on a system and it generates code for yet another machine
> >      (e.g. :ref:`ref-classes-cross-canadian` recipes).
> >
> > -The :term:`FILES` variable defines the
> > -files that go into each package in
> > -:term:`PACKAGES`. If you want
> > -details on how this is accomplished, you can look at
> > -:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bb=
class>`.
> > +Packages for a recipe are listed in the :term:`PACKAGES` variable. The
> > +:yocto_git:`meta/conf/bitbake.conf </poky/tree/meta/conf/bitbake.conf>=
`
> > +configuration file defines the following default list of packages::
> > +
> > +  PACKAGES =3D "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-do=
c ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> > +
> > +Each of these packages contain a default list of files defined with th=
e
> > +:term:`FILES` variable. For example, the package ``${PN}-dev`` represe=
nts the
> > +development variant of the main package ``${PN}`` and its default list=
 of file
>
> I misread the first time I read that because I thought "and its default
> list of files contains development-oriented files" applied to "${PN}"
> and not "${PN}-dev". I could suggest simply adding a coma:
>
> """
> the package ``${PN}-dev`` represents the development variant of the main
> package ``${PN}``, and its default list
> """
>
> Just a suggestion though, could be that it's just me reading it this way =
:)

Right, I feel like the comma makes sense too.

> s/file/files/ in any case.

+1

> Additionally, I think PN-dev does not represent the development variant
> of the main package, it represents the files that are useful for
> developing an application depending on PN main package. Using "variant"
> seems to indicate that PN-dev could be self-sufficient and potentially
> have the same binaries/shlibs than in PN but compiled differently.

That's correct, 'variant' is misleading here. In the end, what about:

"""
For example, the package ``${PN}-dev`` represents files useful to the
development of applications depending on ``${PN}``. The default list of fil=
es
for ``${PN}-dev``, also defined in :oe_git:`meta/conf/bitbake.conf
</openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follows::
"""

> > +contains development-oriented files only::
> > +
> > +  FILES:${PN}-dev =3D "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la=
 \
> > +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconf=
ig \
> > +                  ${datadir}/aclocal ${base_libdir}/*.o \
> > +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
> > +                  ${libdir}/cmake ${datadir}/cmake"
> > +
> > +The paths in this list must be *absolute*, and must use the path prefi=
xes
>
> There is a very important piece of information that needs to be added
> here and a source of many newcomers' mistake: these are absolute paths
> from the PoV of the root of the filesystem on the target, NOT from bitbak=
e.
>
> Indeed, in do_install (and do_package, etc.) we need to prefix our paths
> with $D (and $PKGD/$PKGDEST) when installing/packaging files, however,
> FILES doesn't not need those, even more it should NOT have those.

You're right, will change to:

"""
The paths must use the path prefixes defined by the
:oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.=
conf>`
configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc.

The paths in this list must be *absolute* paths from the point of view of t=
he
root filesystem on the target. For example, assuming the following path is
added to the :term:`FILES` variable::

  ${sysconfdir}/foo.conf

In a later phase of the build system, the created package will be used to
install the file ``/etc/foo.conf`` on the target, since ``${sysconfdir}``
equals to ``/etc`` (unless explicitely overwritten).
"""

> > +defined by the :yocto_git:`bitbake.conf </poky/tree/meta/conf/bitbake.=
conf>`
>
> use oe_git here instead since bitbake is maintained by OE folks.

+1

> > +configuration file, such as ``${sysconfdir}``, ``${bindir}``, etc. The=
y can
> > +optionally use wildcards (``*`` ) to match multiple files installed in=
 a
> > +directory.
> > +
> > +.. note::
> > +
> > +   The list of files for a package is defined using the override synta=
x by
> > +   separating :term:`FILES` and the package name by a semi-colon (``:`=
`).
> > +
> > +The order of the packages in the :term:`PACKAGES` is important: during=
 package
> > +splitting, going from the first element in :term:`PACKAGES` to the las=
t, each
>
> I would say leftmost to rightmost as we have some other variables that
> go rightmost to leftmost (hello OVERRIDES :) ).

+1

> > +file matching a pattern specified in the corresponding :term:`FILES` d=
efinition
> > +will be included in the package and *excluded* for the remaining packa=
ges listed
> > +in :term:`PACKAGES`. As a consequence, custom packages should be added=
 using the
>
> I could suggest:
> """
> A given file can only ever be in one package. Therefore, the first (from
> leftmost to rightmost in :term:`PACKAGES`) package for which the given
> file matches a path from its :term:`FILES` will contain the given file.
> """
>
> Still a bit too complex of a sentence but couldn't come up with anything
> better for now.

How about:

"""
A given file can only ever be in one package. By iterating from the
leftmost to rightmost package in :term:`PACKAGES`, each file matching one o=
f the
pattern defined in the corresponding :term:`FILES` definition is included i=
n the
package. At the end of package splitting, all the remaining files are store=
d in
the base ``${PN}`` package.

The result of package splitting is stored in the :term:`PKGDEST` directory,=
 and
contains one directory per package.
"""

> > +prepend operator (``=3D+``) to be prioritized.
> > +
>
> I am not sure it is wise to say "prepend" operator as we have three ways
> of prepending:
> - =3D+
> - =3D.
> - :prepend
>
> But since you explicit which one you're talking about, I guess it's
> fine? The bitbake docs only says "=3D+" operator apparently:
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#appending-and-prepending-with-spaces

I think using the "prepend operator" + showing it in parenthesis makes sens=
e
here, as newcomers may not be aware that it is used for prepending (there i=
s no
explanation on operators in this document).

> Also nitpicking, but it's not necessary that a package be added with =3D+=
,
> e.g. if it should contain files that aren't matched by any other
> path/pattern in other FILES. But doesn't hurt to say to always do it.

Although you're correct, I would say let's keep it simple here since it's
already confusing enough for newcomers :)

> > +For example, to add a custom package variant of the ``${PN}`` recipe n=
amed
> > +``${PN}-extra`` (name is arbitrary), one should write::
> > +
> > +  PACKAGES =3D+ "${PN}-extra"
> > +
> > +Alternatively, a custom package can be added to the
> > +:term:`PACKAGE_BEFORE_PN` variable::
> > +
> > +  PACKAGE_BEFORE_PN +=3D "${PN}-extra"
> >
>
> I would more recommend people to use PACKAGE_BEFORE_PN than the PACKAGES
> =3D+ scheme. The reason is quite simple, most people are used to +=3D and
> using that instead of =3D+ could easily be missed by reviewers.
>
> The former is only required if you need to have files typically in any
> of ${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale,
> in another package.
>
> That's my opinion though and both are correct (and both should be
> mentioned!), so that would be fine to keep as is.

Absolutely, I will swap PACKAGE_BEFORE_PN and the =3D+ technique, so the mo=
st
important is introduced first.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

