Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2C1D232F1
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 08:31:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6183.1767947488734746519
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 00:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bfeiyZ8B;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D33851A2739
	for <docs@lists.yoctoproject.org>; Fri,  9 Jan 2026 08:31:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A883460734;
	Fri,  9 Jan 2026 08:31:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C43F103C87CB;
	Fri,  9 Jan 2026 09:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767947486; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FV1Q6FAe3MWQ5ZRgz4FjZRJreSPbdvCp37A2rI8+jWI=;
	b=bfeiyZ8BFYPwGOEczQiS5WdJQQ7DKLpBATi3+/5T9St7hbPmLI6eQiO4LNSFU4YFZNz8mB
	IYKvMuSpzdbGhF2yfRLNNgLuQnb6FjxltQ46xLSymD8gJZ6txeixk2/5AWSgj/cki8eV9F
	ebIC98srFU30b1TGpqfw43u8e0J7LWzefMOG6IixxrM8bVnNVol3Q4p/y8ubc+ZqktNxTB
	2mqZE131cVrYwHrTvxLniEZ6LkyrjhCgsZCRo+R4C7XFifQ6tLMzmPahs7FfyCKuRZiqEL
	u3LFPPfjijhdAJY5s7zprLWRlPgNIkJR751OlA0PP85c7KmkDyBt6bKK2vSFkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 09:31:23 +0100
Message-Id: <DFJX2TSSDY5K.3J2WT11WWNF8K@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] migration-guides/release-notes-6.0.rst: add
 U-Boot initial env binary
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <docs@lists.yoctoproject.org>
References: <20260107170153.760421-1-pierre-loup.gosse@smile.fr>
 <20260107170153.760421-2-pierre-loup.gosse@smile.fr>
In-Reply-To: <20260107170153.760421-2-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 08:31:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8435

On Wed Jan 7, 2026 at 6:01 PM CET, Pierre-loup GOSSE via lists.yoctoproject=
.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
> image") in OE-Core.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
>  documentation/migration-guides/release-notes-6.0.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
> index cfc51fc3a..13ce28b3b 100644
> --- a/documentation/migration-guides/release-notes-6.0.rst
> +++ b/documentation/migration-guides/release-notes-6.0.rst
> @@ -71,6 +71,12 @@ New Features / Enhancements in |yocto-ver|
> =20
>  -  :ref:`ref-classes-sanity` class changes:
> =20
> +-  U-boot related changes:
> +
> +   -  :ref:`ref-classes-uboot-config`: Add support for generating the U-=
Boot
> +      initial environment in binary format using
> +      :term:`UBOOT_INITIAL_ENV_BINARY`.
> +
>  -  Miscellaneous changes:
> =20
>  Known Issues in |yocto-ver|

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


