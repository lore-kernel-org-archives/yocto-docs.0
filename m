Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AC3C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 05:56:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.8131.1642658175408530911
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 21:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1nAQQe-0005yR-G4; Thu, 20 Jan 2022 06:56:12 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1nAQQc-007mdW-IQ; Thu, 20 Jan 2022 06:56:10 +0100
References: <20220119162611.400382-1-michael.opdenacker@bootlin.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: new "working with pre-compiled
 libraries" section
Date: Thu, 20 Jan 2022 06:27:13 +0100
In-reply-to: <20220119162611.400382-1-michael.opdenacker@bootlin.com>
Message-ID: <6r35ljgdc5.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jan 2022 05:56:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2431

Hi Michael,

thanks for this well understandable new section!
Please find two typo fixes below:

On Wed, Jan 19 2022 at 17:26 +0100, "Michael Opdenacker" <michael.opdenacke=
r@bootlin.com> wrote:
> This explains how to deal with versioned and unversioned
> pre-built libraries from vendors.
>
> Content and examples adapted from
> https://wiki.yoctoproject.org/wiki/TipsAndTricks/Packaging_Prebuilt_Libra=
ries,
> originally written by Henry Bruce in 2016.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 207 ++++++++++++++++++++++
>  1 file changed, 207 insertions(+)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/de=
v-manual/common-tasks.rst
> index d465c2f440..9eeefc592d 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -4894,6 +4894,213 @@ the following in your recipe::
>=20=20
>     DEPENDS =3D "clutter-1.8"
>=20=20
> +Working with Pre-Built Libraries
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +-------------
> +
> +Some library vendors do not release source code for their software but do
> +release pre-built binaries. When shared libraries are built, they should
> +be versioned (see `this article
> +<https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html>`__
> +for some background), but sometimes this is not done.
> +
> +To summarize, a versioned library must meet two conditions:
> +
> +#.    The filename must have the version appended, for example: ``libfoo=
.so.1.2.3``.
> +#.    The library must have the ELF tag ``SONAME`` set to the major vers=
ion
> +      of the library, for example: ``libfoo.so.1``. You can check this by
> +      running ``readelf -d filename | grep SONAME``.
> +
> +This section shows how to deal with both versioned and unversioned
> +pre-built libraries.
> +
> +Versioned Libraries
> +-------------------
> +
> +In this example we work with pre-built libraries for the FT4222H USB I/O=
 chip.
> +Libraries are built for several target architecture variants and package=
d in
> +an archive as follows::
> +
> +   =E2=94=9C=E2=94=80=E2=94=80 build-arm-hisiv300
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-arm-v5-sf
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-arm-v6-hf
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-arm-v7-hf
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-arm-v8
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-i386
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-i486
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-mips-eglibc-hf
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-pentium
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 build-x86_64
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.=
44
> +   =E2=94=9C=E2=94=80=E2=94=80 examples
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 get-version.c
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 i2cm.c
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 spim.c
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 spis.c
> +   =E2=94=9C=E2=94=80=E2=94=80 ftd2xx.h
> +   =E2=94=9C=E2=94=80=E2=94=80 install4222.sh
> +   =E2=94=9C=E2=94=80=E2=94=80 libft4222.h
> +   =E2=94=9C=E2=94=80=E2=94=80 ReadMe.txt
> +   =E2=94=94=E2=94=80=E2=94=80 WinTypes.h
> +
> +To write a recipe to use such a library in your system:
> +
> +-  The vendor will probably have a proprietary licence, so set
> +   :term:`LICENSE_FLAGS` in your recipe.
> +-  The vendor provides a tarball containing libraries so set :term:`SRC_=
URI`
> +   appropriately.
> +-  Set :term:`COMPATIBLE_HOST` so that the recipe cannot be be used with=
 an

s/be be/be/

> +   unsupported architecture. In the following example, we only support t=
he 32
> +   and 64 bit variants of the ``x86`` architecture.
> +-  As the vendor provides versioned libraries, we can use ``oe_soinstall=
``
> +   from :ref:`ref-classes-utils` to install the shared library and create
> +   symbolic links. If the vendor does not do this, we need to follow the
> +   non-versioned library guidelines in the next section.
> +-  As the vendor likely used :term:`LDFLAGS` different from those in you=
r Yocto
> +   Project build, disable the corresponding checks by adding ``ldflags``
> +   to :term:`INSANE_SKIP`.
> +-  The vendor will typically ship release builds without debugging symbo=
ls.
> +   Avoid errors by preventing the packaging task from stripping out the =
symbols
> +   and adding them to a separate debug package. This is done by setting =
the
> +   ``INHIBIT_`` flags shown below.
> +
> +The complete recipe would look like this::
> +
> +   SUMMARY =3D "FTDI FT4222H Library"
> +   SECTION =3D "libs"
> +   LICENSE_FLAGS =3D "ftdi"
> +   LICENSE =3D "CLOSED"
> +
> +   COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
> +
> +   # Sources available in a .tgz file in .zip archive
> +   # at https://ftdichip.com/wp-content/uploads/2021/01/libft4222-linux-=
1.4.4.44.zip
> +   # Found on https://ftdichip.com/software-examples/ft4222h-software-ex=
amples/
> +   # Since dealing with this particular type of archive is out of topic =
here,
> +   # we use a local link.
> +   SRC_URI =3D "file://libft4222-linux-${PV}.tgz"
> +
> +   S =3D "${WORKDIR}"
> +
> +   ARCH_DIR:x86-64 =3D "build-x86_64"
> +   ARCH_DIR:i586 =3D "build-i386"
> +   ARCH_DIR:i686 =3D "build-i386"
> +
> +   INSANE_SKIP:${PN} =3D "ldflags"
> +   INHIBIT_PACKAGE_STRIP =3D "1"
> +   INHIBIT_SYSROOT_STRIP =3D "1"
> +   INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +   do_install () {
> +           install -m 0755 -d ${D}${libdir}
> +           oe_soinstall ${S}/${ARCH_DIR}/libft4222.so.${PV} ${D}${libdir}
> +           install -d ${D}${includedir}
> +           install -m 0755 ${S}/*.h ${D}${includedir}
> +   }
> +
> +If the precompiled binaries are not statically linked and have dependenc=
ies on
> +other libraries, then by adding those libraries to :term:`DEPENDS`, the =
linking
> +can be examined and the appropriate :term:`RDEPENDS` automatically added.
> +
> +Non-Versioned Libraries
> +-----------------------
> +
> +Some Background
> +~~~~~~~~~~~~~~~
> +
> +Libraries in Linux systems are generally versioned so that it is possible
> +to have multiple versions of the same library installed, which eases upg=
rades
> +and support for older software. For example, suppose that in a versioned
> +library, an actual library is called ``libfoo.so.1.2``, a symbolic link =
named
> +``libfoo.so.1`` points to ``libfoo.so.1.2``, and a symbolic link named
> +``libfoo.so`` points to ``libfoo.so.1.2``. Given these conditions, when =
you
> +link a binary against a library, you typically provide the unversioned f=
ile
> +name (i.e. ``-lfoo`` to the linker). However, the linker follows the sym=
bolic
> +link and actually links against the versioned filename. The unversioned =
symbolic
> +link is only used at development time. Consequently, the library is pack=
aged
> +along with the headers in the development package ``${PN}-dev`` along wi=
th the
> +actual library and versioned symbolic links in ``${PN}``. Because versio=
ned
> +libraries are far more common than unversioned libraries, the default pa=
ckaging
> +rules assume versioned libraries.
> +
> +Yocto Library Packaging Overview
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +It follows that packaging an unversioned library requires a bit of work =
in the
> +recipe. By default, ``libfoo.so`` gets packaged into ``${PN}-dev``, which
> +triggers a QA warning that a non-symlink library is in a ``-dev`` packag=
e,
> +and binaries in the same recipe link to the library in ``${PN}-dev``,
> +which triggers more QA warnings. To solve this problem, you need to pack=
age the
> +unversioned library into ``${PN}`` where it belongs. The following are t=
he abridged
> +default :term:`FILES` variables in ``bitbake.conf``::
> +
> +   SOLIBS =3D ".so.*"
> +   SOLIBSDEV =3D ".so"
> +   FILES_${PN} =3D "... ${libdir}/lib*${SOLIBS} ..."
> +   FILES_SOLIBSDEV ?=3D "... ${libdir}/lib*${SOLIBSDEV} ..."
> +   FILES_${PN}-dev =3D "... ${FILES_SOLIBSDEV} ..."
> +
> +:term:`SOLIBS` defines a pattern that matches real shared object librari=
es.
> +:term:`SOLIBSDEV` matches the development form (unversioned symlink). Th=
ese two
> +variables are then used in ``FILES:${PN}`` and ``FILES:${PN}-dev``, whic=
h puts
> +the real libraries into ``${PN}`` and the unversioned symbolic link into=
 ``${PN}-dev``.
> +To package unversioned libraries, you need to modify the variables in th=
e recipe
> +as follows::
> +
> +   SOLIBS =3D ".so"
> +   FILES_SOLIBSDEV =3D ""
> +
> +The modifications cause the ``.so`` file to be the real library
> +and unsets :term:`FILES_SOLIBSDEV` so that no libraries get packaged into

s/unsets/unset/

Best regards
Ulrich


> +``${PN}-dev``. The changes are required because unless :term:`PACKAGES` =
is changed,
> +``${PN}-dev`` collects files before `${PN}`. ``${PN}-dev`` must not coll=
ect any of
> +the files you want in ``${PN}``.
> +
> +Finally, loadable modules, essentially unversioned libraries that are li=
nked
> +at runtime using ``dlopen()`` instead of at build time, should generally=
 be
> +installed in a private directory. However, if they are installed in ``${=
libdir}``,
> +then the modules can be treated as unversioned libraries.
> +
> +Example
> +~~~~~~~
> +
> +The example below installs an unversioned x86-64 pre-built library named
> +``libfoo.so``. The :term:`COMPATIBLE_HOST` variable limits recipes to the
> +x86-64 architecture while the :term:`INSANE_SKIP`, :term:`INHIBIT_PACKAG=
E_STRIP`
> +and :term:`INHIBIT_SYSROOT_STRIP` variables are all set as in the above
> +versioned library example. The "magic" is setting the :term:`SOLIBS` and
> +:term:`FILES_SOLIBSDEV` variables as explained above::
> +
> +   SUMMARY =3D "libfoo sample recipe"
> +   SECTION =3D "libs"
> +   LICENSE =3D "CLOSED"
> +
> +   SRC_URI =3D "file://libfoo.so"
> +
> +   COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +   INSANE_SKIP:${PN} =3D "ldflags"
> +   INHIBIT_PACKAGE_STRIP =3D "1"
> +   INHIBIT_SYSROOT_STRIP =3D "1"
> +   SOLIBS =3D ".so"
> +   FILES_SOLIBSDEV =3D ""
> +
> +   do_install () {
> +           install -d ${D}${libdir}
> +           install -m 0755 ${WORKDIR}/libfoo.so ${D}${libdir}
> +   }
> +
>  Using x32 psABI
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

