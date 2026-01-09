Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03FED167F5
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:53:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6945.1767952400089037437
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uyXLyxwj;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 778EDC1F6D3;
	Fri,  9 Jan 2026 09:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7362B60734;
	Fri,  9 Jan 2026 09:53:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 711B5103C88BD;
	Fri,  9 Jan 2026 10:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767952396; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hUxS9B3PPLWNqJmaZ+fzZhuokWOyjfE+YbSIcmlZsmo=;
	b=uyXLyxwjmHw9ZoksLkxlIVJuj2dEZh/TarrtnjlQyI/Uu+xg0OGPYWMQlGaUSaxtS5FQp9
	k3/qrGysADEQqJhQiCfjQI+SYS6TTm7iZ8dDk0exEsn8a55TCk/3TFHDwlG12E6C8/ROe5
	qP1PSLoasabYq3VMmM6NiYEvO62mnrMpIm6FI7MkZFl13kjXRekmdySNRpMQGLNX7BU1wL
	yoN+xZi5SMPb/Cf0ymkKo5azQJWwSvQ3XpzAXG2jYiJVViPQh4GXGL9Bqdssar3j2bx4l3
	fns6M/FnHhm3wEHBZw51ZNvP39HFuup5sIvf57DuUCTSFVf0KsIUVXLuqMt28g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 10:53:14 +0100
Message-Id: <DFJYTHRCWMHI.2IQ4MZFHLLS3Q@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual/variables.rst: document
 UBOOT_INITIAL_ENV_BINARY variables
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <docs@lists.yoctoproject.org>
References: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:53:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8445

On Fri Jan 9, 2026 at 10:33 AM CET, Pierre-loup GOSSE via lists.yoctoprojec=
t.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
> image") in OE-Core.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> Cc: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Rephrase UBOOT_INITIAL_ENV_BINARY
> - Add link to WIC doc
> - Rephrase UBOOT_INITIAL_ENV_BINARY_REDUND
> - Remove empty line
> ---
>  documentation/ref-manual/variables.rst | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index ee776c110..b5d072983 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10974,6 +10974,52 @@ system and gives an overview of their function a=
nd contents.
> =20
>        See the :ref:`ref-classes-uboot-sign` class for details.
> =20
> +   :term:`UBOOT_INITIAL_ENV_BINARY`
> +      This variable enables the generation of the U-Boot initial environ=
ment in
> +      binary format.
> +
> +      Its default value is "0", set it to "1" to enable this functionali=
ty::
> +
> +         UBOOT_INITIAL_ENV_BINARY =3D "1"
> +
> +      If set to "1", you must also set the size of the environment with
> +      :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`.
> +
> +      This variable is used in the :ref:`ref-classes-uboot-config` class=
.
> +
> +      The resulting binary can be flashed using :doc:`WIC </dev-manual/w=
ic>` or
> +      any other flashing method at the environment offset, overriding an=
y
> +      existing environment if one is present. Below is an example of a W=
KS file
> +      to flash the binary::
> +
> +         part --source rawcopy --sourceparams=3D"file=3Du-boot-initial-e=
nv-sd.bin" --ondisk sda --no-table --offset 4096k
> +
> +      In this example, the U-Boot initial environment binary
> +      `u-boot-initial-env-sd.bin` is flashed at offset 4096 kibibyte.
> +
> +   :term:`UBOOT_INITIAL_ENV_BINARY_REDUND`
> +      If redundant environment support is enabled in U-boot's configurat=
ion,
> +      this variable should to properly generate the redundant environmen=
t in the

Oops, missing "be set" after "should". I'll add it when merging, as the res=
t if
fine to me.

A nitpick on the second patch I'll mention here: since I've given you my
Reviewed-by in the first version, you can add it as part of the patch, belo=
w
your Signed-off-by. So its kept across series.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


