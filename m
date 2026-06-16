Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760ABCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:14:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154147.1781615654999027734
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hNEVV7aS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 34D3A1A38F4;
	Tue, 16 Jun 2026 13:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 091BD601A9;
	Tue, 16 Jun 2026 13:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7A2E106C9B04;
	Tue, 16 Jun 2026 15:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781615652; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHqfknr5r4P1C+AmMrkwozUfzDVbHYFEhEEoUgRhbds=;
	b=hNEVV7aSMs2102tk4dxyqPElWyxeV862FymjlRGDc3PknTOssRDwTADUKxMKLTFhRs2tf7
	yzWUStPAHI/M6i7CRU2YHoO6PRiVI5rtvqnF8S7Mb+eb/epJQBczsZsQ+0lV5fN/MuXb6F
	IVQhNsINqFKBV6KZv9F6IK15q9of4Tzod+xm0+rujZYKVAw8ieUVkx6X/5sy3eXC7AMKl6
	IWV7eArfZ0sGPQNil9bxTsPR/nsesgxRLO7s9xJB4I3NU9VOSt4LUqO3JsyS/s7UocNrfZ
	YLDvPSnAqZmftGP7AtOghyM0dI+i/kvEBu7j+vy/iPYqOWRuPIo98rqRbJeIdg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:14:11 +0200
Message-Id: <DJAI1F4NGJ10.1W4R342OW6OSU@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATH] dev-manual: mention that "bmap-tools" is
 transitional package
References: <f1d0db75-5a8d-6811-51e3-6bbda146e55f@crashcourse.ca>
In-Reply-To: <f1d0db75-5a8d-6811-51e3-6bbda146e55f@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:14:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9736

On Thu Jun 11, 2026 at 5:00 PM CEST, Robert P. J. Day wrote:
>
> For modern Debian and Ubuntu releases, mention that the "bmap-tools"
> package is transitional to the newer "bmaptool" package.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   someone can decide if this is worth adding to the bmaptool section;
> i can go either way.
>
> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
> index 87162a49c..1e5ad2bba 100644
> --- a/documentation/dev-manual/bmaptool.rst
> +++ b/documentation/dev-manual/bmaptool.rst
> @@ -24,6 +24,12 @@ system image files much faster.
>
>           $ bitbake bmaptool-native -caddto_recipe_sysroot
>
> +   -  Finally, in modern Ubuntu and Debian releases, the ``bmap-tools``
> +      package is a transitional package; it exists solely to ensure
> +      backward compatibility and smooth upgrades from older installation=
s.
> +      You can safely remove it and install the active package, ``bmaptoo=
l``,
> +      which contains the actual utilities for flashing block images.
> +
>  Following, is an example that shows how to flash a Wic image. Realize
>  that while this example uses a Wic image, you can use `bmaptool` to flas=
h
>  any type of image. Use these steps to flash an image using `bmaptool`:

I'd say replace the main example with the new name (bmaptool) and mention t=
he
old name (bmap-tools) in a note instead.

Antonin

