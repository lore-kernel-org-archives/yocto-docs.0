Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC84D232ED
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:31:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6184.1767947488735185934
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 00:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ivsgTqgd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE9081A273A;
	Fri,  9 Jan 2026 08:31:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C177960751;
	Fri,  9 Jan 2026 08:31:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 836F6103C87FF;
	Fri,  9 Jan 2026 09:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767947486; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1UpjRYvgiSCoHUR1yCT0Rh0PQEesVkAZtQDpZL1jWEg=;
	b=ivsgTqgdbADWCLH0A484Iw1q94hftrUOBBaPAnU+7gvHdhgQ2k9D34ftxiz+tturHKQTF3
	fdPwcgZr5kXpuLwo9ecrnsvE0XreZKArZxfuMQOMpnoRp0VfvxZRLu3bat5P2PFOP1UFFA
	LTguAs5TuTPqAiVWh3VbB4w9rgdhIiJHUoDUdSPEUkt7TTXjUAPu08kSrVRplo7Ocet5mC
	ov6xoz+sp8RxWPUjSaQQjGzMap+KRGvp6LVUuUADABKryv28oRv/SEtTnWa8+gv5h90O3h
	7HKkCqCw3CYJFDnCkSe6dnFqpu9ygdYhCFBfhV0YIeRLvi5fb4/0fS9rhAs7Mg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 09:31:25 +0100
Message-Id: <DFJX2UDR0L90.1U0TLMTBQR4X2@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] ref-manual/variables.rst: document
 UBOOT_INITIAL_ENV_BINARY variables
References: <20260107170153.760421-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20260107170153.760421-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 08:31:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8434

Hi,

On Wed Jan 7, 2026 at 6:01 PM CET, Pierre-loup GOSSE via lists.yoctoproject=
.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
> image") in OE-Core.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
>  documentation/ref-manual/variables.rst | 38 ++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index ee776c110..01bf346fc 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10974,6 +10974,44 @@ system and gives an overview of their function a=
nd contents.
> =20
>        See the :ref:`ref-classes-uboot-sign` class for details.
> =20
> +   :term:`UBOOT_INITIAL_ENV_BINARY`
> +      This variable enables the generation of the U-Boot initial environ=
ment in
> +      binary format. The binary size must be specified using
> +      :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`.
> +
> +      Its default value is "0", set it to "1" to enable this functionali=
ty::
> +
> +         UBOOT_INITIAL_ENV_BINARY =3D "1"
> +

Suggestion, add:

"""
If set to "1", you must also set the size of the environment with
:term:`UBOOT_INITIAL_ENV_BINARY_SIZE`.
"""

> +      This variable is used in the :ref:`ref-classes-uboot-config` class=
.
> +
> +      The resulting binary can be flashed using WIC or any other flashin=
g

I would add a link here:

s/WIC/:doc:`WIC </dev-manual/wic>`/

> +      method at the environment offset, overriding any existing environm=
ent if
> +      one is present. Below is an example of a WKS file to flash the bin=
ary::
> +
> +         part --source rawcopy --sourceparams=3D"file=3Du-boot-initial-e=
nv-sd.bin" --ondisk sda --no-table --offset 4096k
> +
> +      In this example, the U-Boot initial environment binary
> +      `u-boot-initial-env-sd.bin` is flashed at offset 4096 kibibyte.
> +
> +   :term:`UBOOT_INITIAL_ENV_BINARY_REDUND`
> +      When using redundant U-Boot environment, this variable must be ena=
bled to
> +      support the multiple copies layout. Enable it as follows::

Maybe I would rephrase it to:

"""
If redundant environment support is enabled in U-boot's configuration, this
variable should to properly generate the redundant environment in the outpu=
t
U-boot environment binary file.
"""


> +
> +         UBOOT_INITIAL_ENV_BINARY_REDUND =3D "1"
> +

I would add:

"""
The :term:`UBOOT_INITIAL_ENV_BINARY` must also be set to "1" if
:term:`UBOOT_INITIAL_ENV_BINARY_REDUND` is enabled.
"""

> +      This variable is used in the :ref:`ref-classes-uboot-config` class=
.
> +
> +

Extra empty line here

> +   :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`
> +      This variable sets the binary size (in bytes) of the U-Boot initia=
l
> +      environment. Both hexadecimal and decimal values are supported and=
 can be
> +      set as follows::
> +
> +         UBOOT_INITIAL_ENV_BINARY_SIZE =3D "0x4000"
> +
> +      This variable is used in the :ref:`ref-classes-uboot-config` class=
.
> +
>     :term:`UBOOT_LOADADDRESS`
>        Specifies the load address for the U-Boot image. During U-Boot ima=
ge
>        creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a


Thanks for following up with the docs patch, appreciated!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


