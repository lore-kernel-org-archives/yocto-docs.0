Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F67C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:03:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93880.1783087385594085722
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 07:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pbPtHy0i;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 882A01A0E12
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 14:03:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C54260300;
	Fri,  3 Jul 2026 14:03:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CE33104C957D;
	Fri,  3 Jul 2026 16:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783087382; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WwCSqK1rpvPoe0K+v71rxZDC0NGd+zrfGMEWevGHoEs=;
	b=pbPtHy0i+8KAOGB8bVckCQSYEOKK50u4EcMdAfJI0aH8wZyvEbRVxN+/M4njHCP5R6+vGC
	sJKOTOMtAIHNqwrn38OlumBI+oK72Yl+P5U6D9dtC8YTONUg385DvlFT3qrWUgT9TeI6xe
	jnUmQGTPbAFP6todU4egZcWR/bB4nDVHmCuXWpyU2l8+nD9mxtTiAga9SjVNRPkdx/Vjcs
	oylSHMdUts6o5SI9fwcdbyOaG6B13owJHJDiHcodV4NjTMtjkhGtsi5U5RwSoF30+Ab1vc
	dlH3BcRPZyKOan3JANCTKibYKef5tsG2tBpFMbiiHx8vTt2ddX1Zkdz7DFqb0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 16:03:00 +0200
Message-Id: <DJOZQ24ZS3L3.BNPZLMDSAVOC@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document variable and task for
 kernel version check
References: <57f7256c-e8b5-c425-0fb8-7699b0cbdb5d@crashcourse.ca>
In-Reply-To: <57f7256c-e8b5-c425-0fb8-7699b0cbdb5d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 14:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10032

Hi,

On Fri Jul 3, 2026 at 3:25 PM CEST, Robert P. J. Day wrote:
>
> Add the associated variable and task for kernel version checking:
>
>   - do_kernel_version_sanity_check()
>   - KERNEL_VERSION_SANITY_SKIP
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manua=
l/tasks.rst
> index e1db2d5ed..5744d47dc 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -787,6 +787,14 @@ which can then be applied by subsequent tasks such a=
s
>  :ref:`ref-tasks-patch` and
>  :ref:`ref-tasks-kernel_configme`.
>
> +.. _ref-tasks-kernel_version_sanity_check:
> +
> +``do_kernel_version_sanity_check``
> +----------------------------------
> +
> +Validate the version of the kernel

This doesn't explain what this task does.

Antonin

