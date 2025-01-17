Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F302C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 15:10:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12696.1737126613115499801
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 07:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g/uni++J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C20C1BF208;
	Fri, 17 Jan 2025 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737126611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFwAFGKpXHiY6WoimoR2McszZK7q1KyUq0CIgAc/XWg=;
	b=g/uni++J/amJvliwXRPFufWxUo5LXY6LmPxeykghDzyaLbgjHkPj4WpRkr1ncAHXbkhMWd
	RfzRAjITSdm3nOZg5Z4Zg6n1GIJwZdSj4yWR8lmwTydEGqKaO/u41aqmyQ8qBPzQoXdDX0
	miZeRfXlEInTzO6AczzTPO2ce3rthFe69tocpb5zKg45MSpSrqerc8TXBzXXqlmwKOjVhv
	2vdVmgPCnbF7tCKBGi7MfYVZG3xfa7urCtAax494R2PPYLV16eQ3WwMxaUZMr4qyPjMi9P
	pOgiLqTrnPCfLohA9Tewua4aVaEFVL+YnRqzACWY5gcYynPEv/Z3OEh9hzPn1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 16:10:10 +0100
Message-Id: <D74FZO32GH3Z.TNMRUPAHB76P@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual: add documentation for the barebox
 class
Cc: <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250117144111.1400592-1-ejo@pengutronix.de>
In-Reply-To: <20250117144111.1400592-1-ejo@pengutronix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 15:10:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6141

Hi Enrico,

On Fri Jan 17, 2025 at 3:41 PM CET, Enrico J=C3=B6rns wrote:
> From: Enrico Joerns <ejo@pengutronix.de>
>
> This adds the initial documentation for the newly added barebox.bbclass
> to the Reference Manual's class list.
> It also adds the two most notable variables to the variable list.
>
> Signed-off-by: Enrico Joerns <ejo@pengutronix.de>
> ---
> v1 -> v2:
>   - add link to Kconfig documentation
>   - add link to conf/image-uefi.conf in git
>   - add example for BAREBOX_BINARY
>   - be more specific about BAREBOX_CONFIG usage, its defaults, and
>     example values
>
>  documentation/ref-manual/classes.rst   | 37 ++++++++++++++++++++++++++
>  documentation/ref-manual/variables.rst | 25 +++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 22c4301a4..8ad77319e 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -128,6 +128,43 @@ It's useful to have some idea of how the tasks defin=
ed by the
>  -  :ref:`ref-tasks-install` --- runs ``make install`` and
>     passes in ``${``\ :term:`D`\ ``}`` as ``DESTDIR``.
> =20
> +.. _ref-classes-barebox:
> +
> +``barebox``
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-barebox` class manages building the barebox bootlo=
ader.
> +
> +If a file named ``defconfig`` is included in the :term:`SRC_URI`, it wil=
l be
> +copied to ``.config`` in the build directory and used as the barebox
> +configuration.
> +Instead of providing a ``defconfig`` file, you can set :term:`BAREBOX_CO=
NFIG`
> +to a defconfig provided by the barebox source tree.
> +If neither ``defconfig`` nor :term:`BAREBOX_CONFIG` is specified, the cl=
ass
> +will raise an error.
> +
> +The :ref:`ref-classes-barebox` class supports config fragments and inter=
nally
> +includes the :ref:`ref-classes-cml1` class to provide `Kconfig
> +<https://docs.kernel.org/kbuild/kconfig-language.html>`__ support for
> +barebox, enabling tasks such as :ref:`ref-tasks-menuconfig` and
> +:ref:`ref-tasks-diffconfig`.
> +
> +The generated barebox binaries are deployed to
> +:term:`DEPLOY_DIR_IMAGE` as well as installed to ``BAREBOX_INSTALL_PATH`=
`
> +(``/boot`` by default) making them part of the recipe=E2=80=99s base pac=
kage.
> +This setup supports both using the barebox binaries as independent artif=
acts
> +and installing them into a rootfs.
> +:term:`BAREBOX_BINARY` can be used to select a distinct binary to deploy=
 and
> +install.
> +If ``barebox`` is set as the :term:`EFI_PROVIDER`, the class will levera=
ge
> +:oe_git:`conf/image-uefi.conf </openembedded-core/tree/meta/conf/image-u=
efi.conf>`
> +to define the default installation paths and naming conventions.
> +
> +The compiled-in barebox environment can be extended by adding environmen=
t files
> +to the ``BAREBOX_ENV_DIR``.
> +The ``BAREBOX_FIRMWARE_DIR`` variable allows you to specify the firmware=
 blob
> +search directory, enabling loading of additional firmware like TF-A or O=
P-TEE.
> +
>  .. _ref-classes-base:
> =20
>  ``base``
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 702a6caf8..e9bffd811 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -293,6 +293,31 @@ system and gives an overview of their function and c=
ontents.
>        :term:`PACKAGE_EXCLUDE` variables for related
>        information.
> =20
> +   :term:`BAREBOX_BINARY`

Sorry, I should have said this in v1, but generally we start variable
descriptions that are tied to classes with:

  When using the :ref:`ref-classes-barebox` class, ...

This way, a user reading documentation for the variable knows where it is
originally defined and in which context.

Could you add this for both of these variables?

> +      The barebox build system can build multiple barebox binaries at on=
ce.
> +      By default, all built binaries will be deployed and installed unde=
r their
> +      original name.
> +      If only a specific binary should be deployed/installed, its name c=
an
> +      be specified in :term:`BAREBOX_BINARY`::
> +
> +        BAREBOX_BINARY =3D "barebox-boundarydevices-imx6dl-nitrogen6x-1g=
.img"

Nitpick: we indent code blocks with three spaces, not two.

> +
> +   :term:`BAREBOX_CONFIG`
> +      If set, it specifies the name of the barebox defconfig to build.
> +      The name must be a defconfig file known to the barebox build envir=
onment.
> +      This variable is mainly useful for generic use cases where a dedic=
ated
> +      configuration is not required.
> +      The :ref:`ref-classes-barebox` class itself already sets it for so=
me QEMU
> +      machines::
> +
> +        BAREBOX_CONFIG:qemuarm =3D "multi_v7_defconfig"
> +        BAREBOX_CONFIG:qemuarm64 =3D "multi_v8_defconfig"
> +        BAREBOX_CONFIG:qemux86-64 =3D "efi_defconfig"
> +
> +      Except for these, the default value of :term:`BAREBOX_CONFIG` is e=
mpty.
> +      For more information on how to provide a barebox configuration, se=
e the
> +      :ref:`ref-classes-barebox` class.
> +
>     :term:`BASE_LIB`
>        The library directory name for the CPU or Application Binary
>        Interface (ABI) tune. The :term:`BASE_LIB` applies only in the Mul=
tilib

Otherwise, thank you these look good to me :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

