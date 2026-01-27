Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897C3D2595F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:11:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5958.1769501509250250365
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ziE7yB/S;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21A9C1A2A69
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:11:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8F86606F5;
	Tue, 27 Jan 2026 08:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47767119A8684;
	Tue, 27 Jan 2026 09:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501506; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ytWpIJgYmIi8qCbHSg+uiXVWKag9+hEqvqjYQpI/6OQ=;
	b=ziE7yB/SDIES1oJYEVuA5jKEXI7cCM4L6q3NyKeDRT/GXl3eyE7cY7FCk+sJe55nw5Tk7X
	9qcUmkTCBxoBYwP8Z8C0Y1G+Ap4e3AgcBe4ZnV16qtC88ibD7K1hORUbkyNaVXySqc11Qo
	baGfOJ7JgV0q5bn/gmchLd00VQyAI9BLWFQ9mohSKg2qA1K0kN6RhIGMwqJUwIFl+MQ7tq
	gNaYzzlXiqyxTKP70hYJsogGOpkFvKiD5ulgRyCtbyQE96nGHZulkKOe6C1Cx+ETIZYhR6
	zyDJg/ahSlOLOMd+M9rU37x2Je8N7TKKvuYtLToI0e4g5RYi3sqCLXxNYTrNyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 09:11:43 +0100
Message-Id: <DFZ7XKO85CS6.3ERH3Z96W1AHF@bootlin.com>
To: <reatmon@ti.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: Document updated UBOOT_CONFIG flow
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260120192159.2226262-1-reatmon@ti.com>
In-Reply-To: <20260120192159.2226262-1-reatmon@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8660

Hi,

On Tue Jan 20, 2026 at 8:21 PM CET, Ryan Eatmon via lists.yoctoproject.org =
wrote:
> The UBOOT_CONFIG flow was updated in oe-core [1].  Document all of the
> new variables and preferred method of specifying the various controls
> for each config.
>
> [1] xxx
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  documentation/ref-manual/classes.rst   |  96 +++++++++++++++++++----
>  documentation/ref-manual/variables.rst | 101 +++++++++++++++++++++++--
>  2 files changed, 176 insertions(+), 21 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 2e219a59c..4eb811387 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3269,13 +3269,89 @@ variable using the "type" varflag. Here is an exa=
mple::
>  The :ref:`ref-classes-uboot-config` class provides support for configuri=
ng one
>  or more U-Boot build configurations.
> =20
> -There are two ways to configure the recipe for your machine:
> +There are three ways to configure the recipe for your machine:
> =20
> --  Using :term:`UBOOT_CONFIG` variable. For example::
> +-  Using the :term:`UBOOT_MACHINE` variable (and its companion variable
> +   :term:`UBOOT_BINARY`). For example::
> +
> +      UBOOT_MACHINE =3D "config"
> +      UBOOT_BINARY =3D "u-boot.bin"
> +
> +-  Using :term:`UBOOT_CONFIG` variables. For example::
> +
> +      UBOOT_CONFIG ??=3D "foo bar"
> +      UBOOT_CONFIG[foo] =3D "config"
> +      UBOOT_CONFIG[bar] =3D "config2"
> +
> +      UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "fstype"
> +
> +      UBOOT_CONFIG_BINARY[foo] =3D "binary"
> +
> +      UBOOT_CONFIG_MAKE_OPTS[foo] =3D "FOO=3D1"
> +      UBOOT_CONFIG_MAKE_OPTS[bar] =3D "BAR=3D1"
> +
> +      UBOOT_CONFIG_FRAGMENTS[foo] =3D "foo.fragment"
> +
> +   In this example, all possible configurations are selected (``foo`` an=
d
> +   ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
> +   changing the value of :term:`UBOOT_CONFIG` to include either one or t=
he
> +   other.

For clarity, add:

"""
For example::

   UBOOT_CONFIG =3D "foo"
"""

> +
> +   Each build configuration is associated to a variable flag definition =
of
> +   :term:`UBOOT_CONFIG`, and associated changes for each config as defin=
ed
> +   in the various UBOOT_CONFIG_* variables.
> +
> +   -  UBOOT_CONFIG[config]: defconfig file selected for this build confi=
guration.

I'm afraid this will render oddly, enclose with `` ``:

"""
-  ``UBOOT_CONFIG[config]``: ...
"""

To keep an hyperlink to the variable definition, I would end each bullet po=
int
in the list here with:

"""
   See the documentation of :term:`UBOOT_CONFIG*` for more information.
"""

> +      These files are found in the source tree's ``configs`` folder of U=
-Boot.
> +
> +      *This option is mandatory.*
> +
> +   -  :term:`UBOOT_CONFIG_IMAGE_FSTYPES` [config]: image types to append=
 to the
> +      :term:`IMAGE_FSTYPES` variable for image generation for this build
> +      configuration.
> +
> +      This can allow building an extra image format that uses the binary
> +      generated by this build configuration.
> +
> +      This option is not mandatory and can be left unspecified if not ne=
eded.
> +
> +   -  :term:`UBOOT_CONFIG_BINARY` [config]: binary to select as the one =
to deploy in
> +      :term:`DEPLOY_DIR_IMAGE`. The output of a U-Boot build may be more=
 than
> +      one binary, for example::
> +
> +         u-boot.bin
> +         u-boot-with-spl.bin
> +
> +      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make =
this
> +      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed=
 to
> +      include the build configuration name in the process (``foo`` or ``=
bar`` in
> +      the above example).
> +
> +      This option defaults to :term:`UBOOT_BINARY` if not specified.
> +
> +   -  :term:`UBOOT_CONFIG_MAKE_OPTS` [config]: additional options passed=
 to
> +      ``make`` when configuring and compiling U-Boot for this configurat=
ion
> +      entry. The options in this entry are added before the options in
> +      :term:`UBOOT_MAKE_OPTS`.
> +
> +      This option is not mandatory and adds nothing if not specified.  I=
f
> +      you do not have a make option for a given config, you can simply n=
ot
> +      set the flag for that config.
> +
> +   -  :term:`UBOOT_CONFIG_FRAGMENTS` [config]: additional config fragmen=
t(s)
> +      from the source tree that is used during ``do_configure()`` to set=
up the
> +      build.  The options in this entry are added before the fragments i=
n
> +      :term:`UBOOT_FRAGMENTS`.
> +
> +      This option is not mandatory and adds nothing if not specified.  I=
f
> +      you do not have a fragment a given config, you can simply not set =
the
> +      flag for that config.
> +
> +-  Or, a legacy method using the :term:`UBOOT_CONFIG` variable by itself=
. For example::
> =20
>        UBOOT_CONFIG ??=3D "foo bar"
> -      UBOOT_CONFIG[foo] =3D "config,images,binary,makeopts"
> -      UBOOT_CONFIG[bar] =3D "config2,images2,binary2,makeopts2"
> +      UBOOT_CONFIG[foo] =3D "config,images,binary"
> +      UBOOT_CONFIG[bar] =3D "config2,images2,binary2"
> =20
>     In this example, all possible configurations are selected (``foo`` an=
d
>     ``bar``), but it is also possible to build only ``foo`` or ``bar`` by
> @@ -3313,15 +3389,9 @@ There are two ways to configure the recipe for you=
r machine:
> =20
>        This option defaults to :term:`UBOOT_BINARY` if unset.
> =20
> -   -  ``makeopts``: the additional options passed to ``make`` when confi=
guring
> -      and compiling U-Boot for this configuration entry. The options in =
this
> -      entry are added before the options in :term:`UBOOT_MAKE_OPTS`.
> -
> --  Or, using the :term:`UBOOT_MACHINE` variable (and its companion varia=
ble
> -   :term:`UBOOT_BINARY`). For example::
> -
> -      UBOOT_MACHINE =3D "config"
> -      UBOOT_BINARY =3D "u-boot.bin"
> +.. note::

Missing a newline between .. note:: and the text here

> +   It is recommended to not use this legacy flow as any future extension=
s
> +   to the control knobs will be not added to this methodology.
> =20
>  Using :term:`UBOOT_MACHINE` and :term:`UBOOT_CONFIG` at the same time is=
 not
>  possible.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 4d8a35473..dec260a3f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10669,29 +10669,108 @@ system and gives an overview of their function=
 and contents.
> =20
>     :term:`UBOOT_CONFIG`
>        Configures one or more U-Boot configurations to build. Each
> -      configuration can define the :term:`UBOOT_MACHINE` and optionally =
the
> -      :term:`IMAGE_FSTYPES` and the :term:`UBOOT_BINARY`.
> +      configuration must define the :term:`UBOOT_MACHINE`.  Additional c=
ontrol

"the term:`UBOOT_MACHINE` variable."

> +      variables can found at: :term:`UBOOT_CONFIG_BINARY`,

s/can found at:/are:/

> +      :term:`UBOOT_CONFIG_FRAGMENTS`, :term:`UBOOT_CONFIG_IMAGE_FSTYPES`=
, and
> +      :term:`UBOOT_CONFIG_MAKE_OPTS`.=20
> =20
> -      Here is an example from the ``meta-freescale`` layer. ::
> +      Here is an updated example from the ``meta-freescale`` layer. ::
> =20
>           UBOOT_CONFIG ??=3D "sdcard-ifc-secure-boot sdcard-ifc sdcard-qs=
pi lpuart qspi secure-boot nor"
> +
>           UBOOT_CONFIG[nor] =3D "ls1021atwr_nor_defconfig"
> -         UBOOT_CONFIG[sdcard-ifc] =3D "ls1021atwr_sdcard_ifc_defconfig,,=
u-boot-with-spl-pbl.bin"
> -         UBOOT_CONFIG[sdcard-qspi] =3D "ls1021atwr_sdcard_qspi_defconfig=
,,u-boot-with-spl-pbl.bin"
> +         UBOOT_CONFIG[sdcard-ifc] =3D "ls1021atwr_sdcard_ifc_defconfig"
> +         UBOOT_CONFIG[sdcard-qspi] =3D "ls1021atwr_sdcard_qspi_defconfig=
"
>           UBOOT_CONFIG[lpuart] =3D "ls1021atwr_nor_lpuart_defconfig"
>           UBOOT_CONFIG[qspi] =3D "ls1021atwr_qspi_defconfig"
>           UBOOT_CONFIG[secure-boot] =3D "ls1021atwr_nor_SECURE_BOOT_defco=
nfig"
> -         UBOOT_CONFIG[sdcard-ifc-secure-boot] =3D "ls1021atwr_sdcard_ifc=
_SECURE_BOOT_defconfig,,u-boot-with-spl-pbl.bin"
> +         UBOOT_CONFIG[sdcard-ifc-secure-boot] =3D "ls1021atwr_sdcard_ifc=
_SECURE_BOOT_defconfig"
> +
> +         UBOOT_CONFIG_BINARY[sdcard-ifc] =3D "u-boot-with-spl-pbl.bin"
> +         UBOOT_CONFIG_BINARY[sdcard-qspi] =3D "u-boot-with-spl-pbl.bin"
> +         UBOOT_CONFIG_BINARY[sdcard-ifc-secure-boot] =3D "u-boot-with-sp=
l-pbl.bin"
> =20
>        In this example, all possible seven configurations are selected. E=
ach
>        configuration specifies "..._defconfig" as :term:`UBOOT_MACHINE`, =
and
>        the "sd..." configurations define an individual name for
> -      :term:`UBOOT_BINARY`. No configuration defines a second parameter =
for
> -      :term:`IMAGE_FSTYPES` to use for the U-Boot image.
> +      :term:`UBOOT_CONFIG_BINARY`.
> =20
>        For more information on how the :term:`UBOOT_CONFIG` is handled, s=
ee the
>        :ref:`ref-classes-uboot-config` class.
> =20
> +   :term:`UBOOT_CONFIG_BINARY`
> +      This variable cannot be set to a value in a config, it is a placeh=
older
> +      for configuring the :term:`UBOOT_CONFIG` flow via flags::
> +
> +         UBOOT_CONFIG_BINARY[foo] =3D "binary1"
> +         UBOOT_CONFIG_BINARY[bar] =3D "binary2"
> +
> +      Specify the binary to select as the one to deploy in :term:`DEPLOY=
_DIR_IMAGE`.
s/Specify/It specifies/


> +      The output of a U-Boot build may be more than one binary, for exam=
ple::
> +
> +         u-boot.bin
> +         u-boot-with-spl.bin
> +
> +      Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make =
this
> +      binary the one deployed in :term:`DEPLOY_DIR_IMAGE`. It is renamed=
 to
> +      include the build configuration name in the process (``foo`` or ``=
bar`` in
> +      the above example).
> +
> +      This option defaults to :term:`UBOOT_BINARY` if not specified.
> +
> +      For more information on how the :term:`UBOOT_CONFIG_BINARY` is han=
dled, see the

"the :term:`UBOOT_CONFIG_BINARY` variable"

> +      :ref:`ref-classes-uboot-config` class.
> +
> +   :term:`UBOOT_CONFIG_FRAGMENTS`
> +      This variable cannot be set to a value in a config, it is a placeh=
older
> +      for configuring the :term:`UBOOT_CONFIG` flow via flags::
> +
> +         UBOOT_CONFIG_FRAGMENTS[foo] =3D "frag1 frag2"
> +         UBOOT_CONFIG_FRAGMENTS[bar] =3D "frag3"

> +
> +      Specify a list of fragments from the source tree that should be co=
mbined

s/Specify/It specifies/

> +      with the defconfig from :term:`UBOOT_CONFIG` that are used during =
``do_configure()``
> +      to configure the build.

Can we specify from what these fragments paths are relative to? ${S}?

> +
> +      This option is not required and you only need to specify flag sett=
ings for

s/to specify flag settings/to specify it/ ?

> +      configs that need them.
> +
> +      For more information on how the :term:`UBOOT_CONFIG_FRAGMENTS` is =
handled, see the
> +      :ref:`ref-classes-uboot-config` class.
> +
> +   :term:`UBOOT_CONFIG_IMAGE_FSTYPES`
> +      This variable cannot be set to a value in a config, it is a placeh=
older
> +      for configuring the :term:`UBOOT_CONFIG` flow via flags::
> +
> +         UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D "fstype1"
> +         UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "fstype2"
> +
> +      Append additional image types to the :term:`IMAGE_FSTYPES` variabl=
e for
> +      image generation for this build configuration.  This can allow bui=
lding an
> +      extra image format that uses the binary generated by this build co=
nfiguration.
> +
> +      This option is not required and you only need to specify flag sett=
ings for
> +      configs that need them.
> +
> +      For more information on how the :term:`UBOOT_CONFIG_IMAGE_FSTYPES`=
 is handled, see the
> +      :ref:`ref-classes-uboot-config` class.
> +
> +   :term:`UBOOT_CONFIG_MAKE_OPTS`
> +      This variable cannot be set to a value in a config, it is a placeh=
older
> +      for configuring the :term:`UBOOT_CONFIG` flow via flags::
> +
> +         UBOOT_CONFIG_MAKE_OPTS[foo] =3D "OPT1=3Dfoo OPT2=3D2"
> +         UBOOT_CONFIG_MAKE_OPTS[bar] =3D "OPT1=3Dbar"
> +
> +      Specify a list of make command line options that are passed to the=
 ``make`` command

s/Specify/It specifies/

> +      during ``do_compile()``.
> +
> +      This option is not required and you only need to specify flag sett=
ings for
> +      configs that need them.
> +
> +      For more information on how the :term:`UBOOT_CONFIG_MAKE_OPTS` is =
handled, see the
> +      :ref:`ref-classes-uboot-config` class.
> +
>     :term:`UBOOT_DTB_LOADADDRESS`
>        Specifies the load address for the dtb image used by U-Boot. Durin=
g FIT
>        image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used=
 in
> @@ -10980,6 +11059,12 @@ system and gives an overview of their function a=
nd contents.
> =20
>        See the :ref:`ref-classes-uboot-sign` class for details.
> =20
> +   :term:`UBOOT_FRAGMENTS`
> +      The :term:`UBOOT_FRAGMENTS` variable can be used to pass extra con=
fig
> +      fragments from the source tree to ``make`` when U-Boot is configur=
ed.

Once again we should specify from what the paths here are relative to, and =
maybe
provide an example. Maybe somewhat of a realistic example, maybe with a pat=
h
leading to some configuration name. Any existing fragment in mainline U-boo=
t
maybe?

> +
> +      See the :ref:`ref-classes-uboot-config` class for more information=
.
> +
>     :term:`UBOOT_INITIAL_ENV_BINARY`
>        This variable enables the generation of the U-Boot initial environ=
ment in
>        binary format.

Thanks a lot for the patch!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


