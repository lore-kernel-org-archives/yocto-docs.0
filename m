Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FC3D2ED1F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:33:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9052.1768923190951699772
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 07:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FpoVnjnz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D23E0C214F3;
	Tue, 20 Jan 2026 15:32:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1C6D606AB;
	Tue, 20 Jan 2026 15:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98CC6102F25B3;
	Tue, 20 Jan 2026 16:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768923188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PGmOpLKspWzf+tQdRdUBkI3fnn4yOuHVyuYnbN2fR7c=;
	b=FpoVnjnzeUuLgMFvyBUwU2tJ0N/fKPJ8H9iU6pySYCji/EbYRrM1LvS0F7EnaRD0Ya5Hn1
	eTng2fI7pOXGheNJ3py8YtqbhQhJmExnSir54MGXxWbVPSdmr+Rk/Gk3Wnh6wbyJHjG6zI
	R6kZttGJn92OCZjP+zPyrVvVNTmY/51Ae2kzz2pX5mV8Ss2hcqUmYRikbHljcKoDzbsfRN
	rKwYJo5WqVakURP1i0ymqRiueIKV0rh/3dzas0wANbirClsLyZ5FU59Luv7/nSyfbuG6hp
	4Lz+xcB/283XHT/fXQqiFjMp06UyBDrGeWHtdkIIifyGx8g6GnCjZzbjlpgFUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 16:33:07 +0100
Message-Id: <DFTIXPMPMPHD.1GCI7XBA3UQ3D@bootlin.com>
Subject: Re: [docs] [PATCH 3/9] sdk-manual: fix improper indent of general
 form of tarball installer script
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
References: <20260114-code-block-misc-20260114-v1-0-174a6e5dba69@cherry.de>
 <20260114-code-block-misc-20260114-v1-3-174a6e5dba69@cherry.de>
In-Reply-To: <20260114-code-block-misc-20260114-v1-3-174a6e5dba69@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 15:33:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8599

Hi,

On Wed Jan 14, 2026 at 1:56 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.sh
> is in a code-block and thus requires to be indented (it is). Sphinx
> knows a block has ended when the indentation of the next line is smaller
> than in the block, otherwise it's all in the same block.
>
> The explanation of the replaceable parts in the tarball installer script
> filename should be text and not part of the block, so let's do that.
>
> While at it, reformat by putting each replaceable part in a bullet list,
> highlight the replaceable part or what it can replaced with as well as
> putting the replacement on the same line instead of making it a quote by
> having them indented in the bullet list.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  documentation/sdk-manual/extensible.rst | 17 +++++------------
>  documentation/sdk-manual/using.rst      | 17 +++++------------
>  2 files changed, 10 insertions(+), 24 deletions(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-=
manual/extensible.rst
> index 808e076e6..c3b0c57d0 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -104,22 +104,15 @@ is the general form::
> =20
>     poky-glibc-host_system-image_type-arch-toolchain-ext-release_version.=
sh
> =20
> -   Where:
> -       host_system is a string representing your development system:
> +Where:
> =20
> -                  i686 or x86_64.
> +-  `host_system` is a string representing your development system: `i686=
` or `x86_64`.

Shouldn't those (and the following) be enclosed with double ticks? ``host_s=
ystem``,
etc.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


