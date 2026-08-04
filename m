Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DA5C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 09:27:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12749.1785835620308929537
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 02:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jO96BJsb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB6654E410D5
	for <docs@lists.yoctoproject.org>; Tue,  4 Aug 2026 09:26:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B14D56029E
	for <docs@lists.yoctoproject.org>; Tue,  4 Aug 2026 09:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B48F811C327F2;
	Tue,  4 Aug 2026 11:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785835617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K9AocEZ8QYn6AeM6CaDyFCWLLyQaNeYbmy5OQhVsmG8=;
	b=jO96BJsbHYR2zwqsE+J0jeSBIsTAW6FWTbL0KYBz8fKhcES6h8dcT2XKwHzlIAWuSq1eL2
	enHcvajpWZY2fx22gJ8b0cGA4yPVMU8DWDVo2vq0uXOSzzXom+LFpoRlwvsFJsbo7WZTSA
	+fPuw8DcdmE+3MSQ/+tmYGaGufWi+p4BWQzneklFXrqzXFWBY2ik4OCZtm7N2nXskz2WdQ
	Yhp5oGK7TpOtc1ZRvnNfcGPXQDVzKISY1KfL2YCDlTjD08ul4DTSLSWp+YBJWZADfJhbbj
	7NyKmmRQ/cb90grDTS3QcG1NifsS9O2hBMjB979ijkSX5gBVGMQXZTUqmopquQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 11:26:55 +0200
Message-Id: <DKG1W42LSRDL.2XHXNDKFSTICX@bootlin.com>
To: <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] ref-manual/variables.rst: document the QB_DEFAULT_BIOS
 variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com>
In-Reply-To: <20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Aug 2026 09:27:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10234

On Tue Aug 4, 2026 at 11:01 AM CEST, Antonin Godard wrote:
> The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
> can be used to emulate U-Boot, for example.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/variables.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index e75f42afe..cfc764961 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8084,6 +8084,18 @@ system and gives an overview of their function and=
 contents.
>        replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the I=
P and
>        the gateway address of the QEMU guest.
> =20
> +   :term:`QB_DEFAULT_BIOS`
> +      the `QB_DEFAULT_BIOS` variable can be used to add the ``-bios`` op=
tion to

Just realized I messed up the formatting here, should be "The
:term:`QB_DEFAULT_BIOS`".

Antonin

