Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D63C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 13:36:39 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.10630.1737120995846398556
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 05:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tYmWX-0006Us-Lu; Fri, 17 Jan 2025 14:36:33 +0100
Message-ID: <3b8b69c524011abfe6c4d9b97b06e6ebf054f74b.camel@pengutronix.de>
Subject: Re: [docs] [PATCH] ref-manual: add documentation for the barebox
 class
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Date: Fri, 17 Jan 2025 14:36:32 +0100
In-Reply-To: <D74DHUEMFRQU.3CMMHW4WB4JJ4@bootlin.com>
References: <20250116111456.1167518-1-ejo@pengutronix.de>
	 <D74DHUEMFRQU.3CMMHW4WB4JJ4@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 13:36:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6136

Am Freitag, dem 17.01.2025 um 14:12 +0100 schrieb Antonin Godard:
> Hi Enrico,
>=20
> On Thu Jan 16, 2025 at 12:14 PM CET, Enrico J=C3=B6rns wrote:
> > From: Enrico Joerns <ejo@pengutronix.de>
> >=20
> > This adds the initial documentation for the newly added barebox.bbclass
> > to the Reference Manual's class list.
> > It also adds the two most notable variables to the variable list.
> >=20
> > Signed-off-by: Enrico Joerns <ejo@pengutronix.de>
> > ---
> > =C2=A0documentation/ref-manual/classes.rst=C2=A0=C2=A0 | 36 +++++++++++=
+++++++++++++++
> > =C2=A0documentation/ref-manual/variables.rst | 13 ++++++++++
> > =C2=A02 files changed, 49 insertions(+)
> >=20
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-m=
anual/classes.rst
> > index 22c4301a4..c11c0a529 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -128,6 +128,42 @@ It's useful to have some idea of how the tasks def=
ined by the
> > =C2=A0-=C2=A0 :ref:`ref-tasks-install` --- runs ``make install`` and
> > =C2=A0=C2=A0=C2=A0 passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
> > =C2=A0
> > +.. _ref-classes-barebox:
> > +
> > +``barebox``
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The :ref:`ref-classes-barebox` class manages building the barebox boot=
loader.
>=20
> s/barebox/BareBox/? or Barebox
> We try to capitalize project names.

I can change it, but the project understands itself as "barebox" [1].
Like 'systemd', which I don't find as "Systemd" in the docs either.

> > +
> > +If a file named ``defconfig`` is included in the :term:`SRC_URI`, it w=
ill be
> > +copied to ``.config`` in the build directory and used as the barebox
> > +configuration.
> > +Instead of providing a ``defconfig`` file, you can set :term:`BAREBOX_=
CONFIG`
> > +to a defconfig provided by the barebox source tree.
> > +If neither ``defconfig`` nor :term:`BAREBOX_CONFIG` is specified, the =
class
> > +will raise an error.
> > +
> > +The :ref:`ref-classes-barebox` class supports config fragments and int=
ernally
> > +includes the :ref:`ref-classes-cml1` class to provide kconfig support =
for
>=20
> Maybe link to https://docs.kernel.org/kbuild/kconfig-language.html=C2=A0h=
ere? Some
> people might not know what this is referring to. This would be done like =
so:
>=20
> =C2=A0 ...provide `Kconfig <https://docs.kernel.org/kbuild/kconfig-langua=
ge.html>`__
> =C2=A0 support...

Ok, I'll add that.

> > +barebox, enabling tasks such as :ref:`ref-tasks-menuconfig` and
> > +:ref:`ref-tasks-diffconfig`.
> > +
> > +The generated barebox binaries are deployed to
> > +:term:`DEPLOY_DIR_IMAGE` as well as installed to ``BAREBOX_INSTALL_PAT=
H``
> > +(``/boot`` by default) making them part of the recipe=E2=80=99s base p=
ackage.
> > +This setup supports both using the barebox binaries as independent art=
ifacts
> > +and installing them into a rootfs.
> > +:term:`BAREBOX_BINARY` can be used to select a distinct binary to depl=
oy and
> > +install.
> > +If ``barebox`` is set as the :term:`EFI_PROVIDER`, the class will leve=
rage
> > +``conf/image-uefi.conf`` to define the default installation paths and =
naming
>=20
> :oe_git:`conf/image-uefi.conf </openembedded-core/tree/meta/conf/image-ue=
fi.conf>`
> instead of
> ``conf/image-uefi.conf``

Yes.

> > +conventions.
> > +
> > +The compiled-in barebox environment can be extended by adding environm=
ent files
> > +to the ``BAREBOX_ENV_DIR``.
>=20
> :term:`BAREBOX_ENV_DIR` and some documentation for it in variables.rst? S=
ince
> it's defined with ??=3D. But not sure it would be frequently overriden.
>=20
> Same remark for BAREBOX_FIRMWARE_DIR.

Yes, I have actually thought about documenting but noted some potential inc=
onsistencies where I
wasn't sure yet if this should be documented as external API. I'd clarify t=
his and maybe add the
documentation for these in a later release if that's ok.

> > +The ``BAREBOX_FIRMWARE_DIR`` variable allows you to specify the firmwa=
re blob
> > +search directory, enabling loading of additional firmware like TF-A or=
 OP-TEE.
> > +
> > =C2=A0.. _ref-classes-base:
> > =C2=A0
> > =C2=A0``base``
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref=
-manual/variables.rst
> > index 702a6caf8..f29f38588 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -293,6 +293,19 @@ system and gives an overview of their function and=
 contents.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`PACKAGE_EXCLUDE` variables =
for related
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 information.
> > =C2=A0
> > +=C2=A0=C2=A0 :term:`BAREBOX_BINARY`
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The barebox build system can build mult=
iple barebox binaries at once.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 By default, all built binaries will be =
deployed and installed under their
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 original name.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If only a specific binary should be dep=
loyed/installed, its name can
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be specified in :term:`BAREBOX_BINARY`.
>=20
> Maybe specify the default value, or give an example of what this variable=
 can
> contain?

The default value depends on inline python, but will check if I can better =
reflect this in the
documentation.

> > +
> > +=C2=A0=C2=A0 :term:`BAREBOX_CONFIG`
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the name of the barebox defco=
nfig to build.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The name must be a defconfig file known=
 to the barebox build environment.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For more information on how to provide =
a barebox configuration, see the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :ref:`ref-classes-barebox` class.
>=20
> At least specify that it's empty by default?

Might be useful, yes.

> > +
> > =C2=A0=C2=A0=C2=A0 :term:`BASE_LIB`
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The library directory name for the=
 CPU or Application Binary
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interface (ABI) tune. The :term:`B=
ASE_LIB` applies only in the Multilib
>=20
>=20
> Thank you for taking time to document this,

Thank you for the review! Will come up with a v2 as soon as I've addressed =
the open points.


Regards, Enrico

> Antonin
>=20

[1] https://barebox.org/

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

