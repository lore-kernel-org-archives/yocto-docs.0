Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA746CD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 08:40:33 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14833.1781772026229633612
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 01:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=s8jSXDhf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61B1EC06CC6
	for <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 08:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1102B5FF03;
	Thu, 18 Jun 2026 08:40:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6396C106C88F0;
	Thu, 18 Jun 2026 10:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781772023; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/BHHcGdzssqqOP3S/70cfwUQXv5h9x6ClHA9d0gAbx4=;
	b=s8jSXDhfEEKZwE6/J8uNJx8vcjkIWXn2g+KQLa09QBVd92cDDAg7qO8iVGp4wkirpBccdx
	9wyJdZ3JWy6uzpnDfcaFDEmD9WkFx6REZI4616gTsZhFc4HU3Lw7Bes0XdH2Gyj+xajYqz
	R9lncxdVHD0eCMRy9m6y4Ss7m278UyMh3PgnpO3GQPUN2l3VCPPZxOwjl33FC53Y1nLAyY
	Ylj4QScshletd0MAtnP9QRNic1QY1Xy1OyqVOOGc9yPKyg3ZgvsL5dn1Xbjps19n6p2tx0
	EXFqYrtfEHdUS5ibvEQTTqGgbNxollV0x8g9DODxDCWFUBiim+8jZr48MBJkRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 10:40:13 +0200
Message-Id: <DJC1GR3GMZ3S.2GX7XVXG6129B@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: explain default value used for
 SUMMARY metadata
References: <c1cbec86-6b95-fb96-8676-f117082d17bb@crashcourse.ca>
In-Reply-To: <c1cbec86-6b95-fb96-8676-f117082d17bb@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 08:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9777

Hi,

On Wed Jun 17, 2026 at 1:34 PM CEST, Robert P. J. Day wrote:
>
> Explain that if you don't set a value for the SUMMARY variable in a
> recipe, it will get this default value from bitbake.conf:
>
>   SUMMARY ?=3D "${PN} version ${PV}-${PR}"
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index df3666f1c..bb142dc4b 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10350,6 +10350,11 @@ system and gives an overview of their function a=
nd contents.
>        :term:`DESCRIPTION` variable if :term:`DESCRIPTION` is
>        not set in the recipe.
>
> +      If you don't set this variable in your recipe file, it will contai=
n
> +      the default value as set in the ``bitbake.conf`` file::
> +
> +         SUMMARY ?=3D "${PN} version ${PV}-${PR}"

I would avoid providing the value here, as it costs maintenance. You can
simplify this sentence like so:

"""
If you don't set this variable in your recipe file, it will contain a defau=
lt
value as set in the :oecore_path:`meta/conf/bitbake.conf` file.
"""

Antonin

