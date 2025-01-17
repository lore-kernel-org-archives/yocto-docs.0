Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202D0C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 13:44:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10793.1737121482653897208
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 05:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MWokxGwU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A7B71BF207;
	Fri, 17 Jan 2025 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737121480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sA1i2WTV1iRFYCnObDCNsmjyNBnGbh5In0ECsBBS6+s=;
	b=MWokxGwUsMnbAWxwG0yWdJFZXAxBaUhACYFwOs4AB+8jpLMUa/FbqsYFBByUYYbqqfhrbc
	V48y86Z/Roe9z95n1UQ0TUUnia7zZZAHPXOxibM17GEhSAcvH1oYVenzz0rBQXJYT5VCMg
	iNSvkrzcaKaKTa4/ajCX7a8jYUsx8+4vRwZNQkYQbV96be3xpW0C3wE+SIOBAzwz8vxLam
	aQPLN+qY1WBqhHd8U1oJn9OHrHnq88ntAHrNBCbUdhtzT3C72iBtkiPyXvY/a5iMe4/0yG
	n+6vpMANSGLm9HTxhIMzKvESRQvXDmnnMvDxuRQ35TUT8BypXpyOjP713l5KYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 14:44:40 +0100
Message-Id: <D74E6776O03K.J8PH1F0O8PPK@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: add documentation for the barebox
 class
Cc: <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250116111456.1167518-1-ejo@pengutronix.de>
 <D74DHUEMFRQU.3CMMHW4WB4JJ4@bootlin.com>
 <3b8b69c524011abfe6c4d9b97b06e6ebf054f74b.camel@pengutronix.de>
In-Reply-To: <3b8b69c524011abfe6c4d9b97b06e6ebf054f74b.camel@pengutronix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 13:44:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6137

Hi Enrico,

On Fri Jan 17, 2025 at 2:36 PM CET, Enrico J=C3=B6rns wrote:
> Am Freitag, dem 17.01.2025 um 14:12 +0100 schrieb Antonin Godard:
>> Hi Enrico,
>>=20
>> On Thu Jan 16, 2025 at 12:14 PM CET, Enrico J=C3=B6rns wrote:
>> > From: Enrico Joerns <ejo@pengutronix.de>
>> >=20
>> > This adds the initial documentation for the newly added barebox.bbclas=
s
>> > to the Reference Manual's class list.
>> > It also adds the two most notable variables to the variable list.
>> >=20
>> > Signed-off-by: Enrico Joerns <ejo@pengutronix.de>
>> > ---
>> > =C2=A0documentation/ref-manual/classes.rst=C2=A0=C2=A0 | 36 ++++++++++=
++++++++++++++++
>> > =C2=A0documentation/ref-manual/variables.rst | 13 ++++++++++
>> > =C2=A02 files changed, 49 insertions(+)
>> >=20
>> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst
>> > index 22c4301a4..c11c0a529 100644
>> > --- a/documentation/ref-manual/classes.rst
>> > +++ b/documentation/ref-manual/classes.rst
>> > @@ -128,6 +128,42 @@ It's useful to have some idea of how the tasks de=
fined by the
>> > =C2=A0-=C2=A0 :ref:`ref-tasks-install` --- runs ``make install`` and
>> > =C2=A0=C2=A0=C2=A0 passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
>> > =C2=A0
>> > +.. _ref-classes-barebox:
>> > +
>> > +``barebox``
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +
>> > +The :ref:`ref-classes-barebox` class manages building the barebox boo=
tloader.
>>=20
>> s/barebox/BareBox/? or Barebox
>> We try to capitalize project names.
>
> I can change it, but the project understands itself as "barebox" [1].
> Like 'systemd', which I don't find as "Systemd" in the docs either.

You're right, my bad I wasn't aware of that - you can leave it as "barebox"
then.

>> > +
>> > +If a file named ``defconfig`` is included in the :term:`SRC_URI`, it =
will be
>> > +copied to ``.config`` in the build directory and used as the barebox
>> > +configuration.
>> > +Instead of providing a ``defconfig`` file, you can set :term:`BAREBOX=
_CONFIG`
>> > +to a defconfig provided by the barebox source tree.
>> > +If neither ``defconfig`` nor :term:`BAREBOX_CONFIG` is specified, the=
 class
>> > +will raise an error.
>> > +
>> > +The :ref:`ref-classes-barebox` class supports config fragments and in=
ternally
>> > +includes the :ref:`ref-classes-cml1` class to provide kconfig support=
 for
>>=20
>> Maybe link to https://docs.kernel.org/kbuild/kconfig-language.html=C2=A0=
here? Some
>> people might not know what this is referring to. This would be done like=
 so:
>>=20
>> =C2=A0 ...provide `Kconfig <https://docs.kernel.org/kbuild/kconfig-langu=
age.html>`__
>> =C2=A0 support...
>
> Ok, I'll add that.
>
>> > +barebox, enabling tasks such as :ref:`ref-tasks-menuconfig` and
>> > +:ref:`ref-tasks-diffconfig`.
>> > +
>> > +The generated barebox binaries are deployed to
>> > +:term:`DEPLOY_DIR_IMAGE` as well as installed to ``BAREBOX_INSTALL_PA=
TH``
>> > +(``/boot`` by default) making them part of the recipe=E2=80=99s base =
package.
>> > +This setup supports both using the barebox binaries as independent ar=
tifacts
>> > +and installing them into a rootfs.
>> > +:term:`BAREBOX_BINARY` can be used to select a distinct binary to dep=
loy and
>> > +install.
>> > +If ``barebox`` is set as the :term:`EFI_PROVIDER`, the class will lev=
erage
>> > +``conf/image-uefi.conf`` to define the default installation paths and=
 naming
>>=20
>> :oe_git:`conf/image-uefi.conf </openembedded-core/tree/meta/conf/image-u=
efi.conf>`
>> instead of
>> ``conf/image-uefi.conf``
>
> Yes.
>
>> > +conventions.
>> > +
>> > +The compiled-in barebox environment can be extended by adding environ=
ment files
>> > +to the ``BAREBOX_ENV_DIR``.
>>=20
>> :term:`BAREBOX_ENV_DIR` and some documentation for it in variables.rst? =
Since
>> it's defined with ??=3D. But not sure it would be frequently overriden.
>>=20
>> Same remark for BAREBOX_FIRMWARE_DIR.
>
> Yes, I have actually thought about documenting but noted some potential i=
nconsistencies where I
> wasn't sure yet if this should be documented as external API. I'd clarify=
 this and maybe add the
> documentation for these in a later release if that's ok.

Ok, thanks for the details - I also agree on documenting it later then.

>> > +The ``BAREBOX_FIRMWARE_DIR`` variable allows you to specify the firmw=
are blob
>> > +search directory, enabling loading of additional firmware like TF-A o=
r OP-TEE.
>> > +
>> > =C2=A0.. _ref-classes-base:
>> > =C2=A0
>> > =C2=A0``base``
>> > diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst
>> > index 702a6caf8..f29f38588 100644
>> > --- a/documentation/ref-manual/variables.rst
>> > +++ b/documentation/ref-manual/variables.rst
>> > @@ -293,6 +293,19 @@ system and gives an overview of their function an=
d contents.
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :term:`PACKAGE_EXCLUDE` variables=
 for related
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 information.
>> > =C2=A0
>> > +=C2=A0=C2=A0 :term:`BAREBOX_BINARY`
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The barebox build system can build mul=
tiple barebox binaries at once.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 By default, all built binaries will be=
 deployed and installed under their
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 original name.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If only a specific binary should be de=
ployed/installed, its name can
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be specified in :term:`BAREBOX_BINARY`=
.
>>=20
>> Maybe specify the default value, or give an example of what this variabl=
e can
>> contain?
>
> The default value depends on inline python, but will check if I can bette=
r reflect this in the
> documentation.

I'd say if the default value is not easily predictable, maybe just give an
example for users to know what the content is supposed to look like.

>> > +
>> > +=C2=A0=C2=A0 :term:`BAREBOX_CONFIG`
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the name of the barebox defc=
onfig to build.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The name must be a defconfig file know=
n to the barebox build environment.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For more information on how to provide=
 a barebox configuration, see the
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :ref:`ref-classes-barebox` class.
>>=20
>> At least specify that it's empty by default?
>
> Might be useful, yes.
>
>> > +
>> > =C2=A0=C2=A0=C2=A0 :term:`BASE_LIB`
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The library directory name for th=
e CPU or Application Binary
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interface (ABI) tune. The :term:`=
BASE_LIB` applies only in the Multilib
>>=20
>>=20
>> Thank you for taking time to document this,
>
> Thank you for the review! Will come up with a v2 as soon as I've addresse=
d the open points.
>
>
> Regards, Enrico
>
>> Antonin
>>=20
>
> [1] https://barebox.org/

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

