Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E92C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 13:12:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.10250.1737119574659358922
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 05:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dIxeqr/b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 008A560004;
	Fri, 17 Jan 2025 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737119572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ooDakEjTR/4TlyqNZyhwPWzRZNOxkfOYs29gVdibzE=;
	b=dIxeqr/bTIPOAq5fYCL8l+8k9xtqQS7Y1GxMspSrv18GexhV3X3kSS3cRZwpzps8Fkalpz
	I4Dk7MZkXYJFvVScI7NPfmOBb2NgJPhWtn1A5h31bneSz9z/0cwzQ5umy79hyK2HmhfpQ6
	ERvj/w2iGm6P4ACXe7154LB/3l2xMDdnPOqnb6GlHKWlyHQPAaddQTFm6ntGsee0uKId9u
	5MSYuGhe/iVzGjpJ3CDGjFx6nSazOpSeOK38nr/hxsX/RSqJcCfNLVtpczBlFxVfovKerU
	aFJzw2f27sWkZf4nMmAUfY8+PcVDofvNUDvN1he2NxMJBbIzSnmv+N95f/v31A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 14:12:51 +0100
Message-Id: <D74DHUEMFRQU.3CMMHW4WB4JJ4@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: add documentation for the barebox
 class
Cc: <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250116111456.1167518-1-ejo@pengutronix.de>
In-Reply-To: <20250116111456.1167518-1-ejo@pengutronix.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 13:12:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6135

Hi Enrico,

On Thu Jan 16, 2025 at 12:14 PM CET, Enrico J=C3=B6rns wrote:
> From: Enrico Joerns <ejo@pengutronix.de>
>
> This adds the initial documentation for the newly added barebox.bbclass
> to the Reference Manual's class list.
> It also adds the two most notable variables to the variable list.
>
> Signed-off-by: Enrico Joerns <ejo@pengutronix.de>
> ---
>  documentation/ref-manual/classes.rst   | 36 ++++++++++++++++++++++++++
>  documentation/ref-manual/variables.rst | 13 ++++++++++
>  2 files changed, 49 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 22c4301a4..c11c0a529 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -128,6 +128,42 @@ It's useful to have some idea of how the tasks defin=
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

s/barebox/BareBox/? or Barebox
We try to capitalize project names.

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
> +includes the :ref:`ref-classes-cml1` class to provide kconfig support fo=
r

Maybe link to https://docs.kernel.org/kbuild/kconfig-language.html here? So=
me
people might not know what this is referring to. This would be done like so=
:

  ...provide `Kconfig <https://docs.kernel.org/kbuild/kconfig-language.html=
>`__
  support...

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
> +``conf/image-uefi.conf`` to define the default installation paths and na=
ming

:oe_git:`conf/image-uefi.conf </openembedded-core/tree/meta/conf/image-uefi=
.conf>`
instead of
``conf/image-uefi.conf``

> +conventions.
> +
> +The compiled-in barebox environment can be extended by adding environmen=
t files
> +to the ``BAREBOX_ENV_DIR``.

:term:`BAREBOX_ENV_DIR` and some documentation for it in variables.rst? Sin=
ce
it's defined with ??=3D. But not sure it would be frequently overriden.

Same remark for BAREBOX_FIRMWARE_DIR.

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
> index 702a6caf8..f29f38588 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -293,6 +293,19 @@ system and gives an overview of their function and c=
ontents.
>        :term:`PACKAGE_EXCLUDE` variables for related
>        information.
> =20
> +   :term:`BAREBOX_BINARY`
> +      The barebox build system can build multiple barebox binaries at on=
ce.
> +      By default, all built binaries will be deployed and installed unde=
r their
> +      original name.
> +      If only a specific binary should be deployed/installed, its name c=
an
> +      be specified in :term:`BAREBOX_BINARY`.

Maybe specify the default value, or give an example of what this variable c=
an
contain?

> +
> +   :term:`BAREBOX_CONFIG`
> +      Specifies the name of the barebox defconfig to build.
> +      The name must be a defconfig file known to the barebox build envir=
onment.
> +      For more information on how to provide a barebox configuration, se=
e the
> +      :ref:`ref-classes-barebox` class.

At least specify that it's empty by default?

> +
>     :term:`BASE_LIB`
>        The library directory name for the CPU or Application Binary
>        Interface (ABI) tune. The :term:`BASE_LIB` applies only in the Mul=
tilib


Thank you for taking time to document this,

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

