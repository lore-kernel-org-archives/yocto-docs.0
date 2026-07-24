Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0E0C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:57:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16062.1784887058341757202
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 02:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AjJE+UKe;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 212574E40F25
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 09:57:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D08E06039A;
	Fri, 24 Jul 2026 09:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 703A811C11E65;
	Fri, 24 Jul 2026 11:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784887055; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dkxbK5VkKYWWUtb87j20LeIuOyrY3bPA3zptPkPNLVE=;
	b=AjJE+UKeArUw/3DTryrfGhZKOTROkICGtjjH3qWEaBcbEvvDWZ7pPECgcG9p+mnrZdEhLY
	MtJZEezq/8JgGaq3RXZx5WUl3OtF9+G8uZFqfBp/T+R+k9i8JQTIBuldiEJ7rOp6saho4g
	mIQSud5MQHd/If72ihZaNaOYy9b0ecnU5nfn/IQXDuJmpi5/edzYgNJRQ/4+aoPxvuuT+J
	OvgonwbueD4BifGAAorefwKFlVdynZrQrqh/74mY/QR3A+E9I8YShL4evhMPZS0K6DFO2b
	wRxAPQ2bbfKTJHUP8ZvisZ3BeyltCJDPJvaSefFNwQVq9lFjmQtKxAaucGrdbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 11:57:33 +0200
Message-Id: <DK6PNKT0HVC5.UM96MFULMW73@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/release-process.rst: update LTS
 supported versions
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <daniel.turull@ericsson.com>, <docs@lists.yoctoproject.org>
References: <20260724073803.1260044-1-daniel.turull@ericsson.com>
In-Reply-To: <20260724073803.1260044-1-daniel.turull@ericsson.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 09:57:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10126

Hi,

On Fri Jul 24, 2026 at 9:38 AM CEST, Daniel Turull via lists.yoctoproject.o=
rg wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Add Wrynose and remove Kirkstone as supported versions.
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  documentation/ref-manual/release-process.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/release-process.rst b/documentation=
/ref-manual/release-process.rst
> index a7abb2fd6..0959e5fc7 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -271,8 +271,8 @@ upgrade to the following :term:`LTS` release.
> =20
>  The currently supported :term:`LTS` releases are:
> =20
> +-  Version 6.0 ("Wyrnose"), released in May 2026 and supported until Apr=
il 2030.

s/Wyrnose/Wrynose/

Fixed that locally after merging to master-next.

Thanks!
Antonin

