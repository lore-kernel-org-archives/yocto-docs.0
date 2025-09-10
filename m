Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29531CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 08:47:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.12730.1757494045697506088
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 01:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VnBHqDFY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF6594E40B99
	for <docs@lists.yoctoproject.org>; Wed, 10 Sep 2025 08:47:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82479606D4;
	Wed, 10 Sep 2025 08:47:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFC30102F2889;
	Wed, 10 Sep 2025 10:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757494043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+mBksvncGNxF+qZLbfPFKRV+igp3joe6Wx3XC7HZgj0=;
	b=VnBHqDFY+n2i7mk+bEG4vpujQ5mQtG2kbzKbPWZGDYoS9FrcYmSj8J4WMf22JEfbXeKMwf
	uF622ukjqVy9lc1C5jAYx110JJvNq0D/rqGYZNW6JBo358Hh1GCrW5bf8rXMq1MoC3hdCc
	a1ugAswmMtjEJ6rpVZF8F2i4sMHZWjBcb71PWYbGj2/s3xVbJJK72jgXWWKQqQMtuvmCQd
	neh2tkbyMcVbx/Fo8G9apSPYscuyTITVJqsjq3eWijskauNGieDJ9BljxccsG8+04od88o
	pzSwqfEnlSUzsuGTX/dCWeSoEEr0K3i8YZe/rJ5b0eZv+z75fbkaCaPM2++zCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 10:47:17 +0200
Message-Id: <DCOZN2V0SX2P.1G79N6WMVHGPC@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/3] ref-manual/kickstart.rst: add
 extra-partition-space
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-111-g16c8e869a259
References: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Sep 2025 08:47:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7492

On Mon Sep 8, 2025 at 4:00 PM CEST, pierre-loup.gosse via lists.yoctoprojec=
t.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> After commits 47533f20a7ec ("wic: rename wks flag --extra-space to
> --extra-filesystem-space") and c7f51c23fd268 ("wic: add
> --extra-partition-space option to set unused space") in openembedded-core=
,
> document the new Wic-specific option extra-partition-space and rename
> the extra-space option to extra-filesystem-space.
>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> ---
>  documentation/ref-manual/kickstart.rst | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-m=
anual/kickstart.rst
> index 297887805..80e2f9d84 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -158,7 +158,7 @@ the ``part`` and ``partition`` commands:
>     excludes the given relative path from the resulting image. This
>     option is only effective with the rootfs source plugin.
> =20
> --  ``--extra-space``: This option is a Wic-specific option that adds
> +-  ``--extra-filesystem-space``: This option is a Wic-specific option th=
at adds
>     extra space after the space filled by the content of the partition.
>     The final size can exceed the size specified by the ``--size``
>     option. The default value is 10M. Specify as an integer value
> @@ -166,6 +166,16 @@ the ``part`` and ``partition`` commands:
>     for mebibyte and "G" for gibibyte. The default unit if none is given
>     is "M".
> =20
> +-  ``--extra-partition-space``: This option is a Wic-specific option tha=
t adds
> +   extra empty space after the space filled by the filesystem.
> +   With ``--fixed-size`` option, the extra partition space is removed fr=
om the
> +   filesystem size. Otherwise (with or without ``--size`` flag), the ext=
ra
> +   partition space is added to the final partition size.
> +   The default value is 0M. Specify as an integer value
> +   optionally followed by one of the units "k" / "K" for kibibyte, "M"
> +   for mebibyte and "G" for gibibyte. The default unit if none is given
> +   is "M".
> +
>  -  ``--overhead-factor``: This option is a Wic-specific option that
>     multiplies the size of the partition by the option's value. You must
>     supply a value greater than or equal to "1". The default value is

For the entire series:

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


