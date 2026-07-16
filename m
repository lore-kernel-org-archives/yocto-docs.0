Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF4CC4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 13:14:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12572.1784207651489398467
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 06:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=at2x2kpk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2D6174E40DFD
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 13:14:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5D94602B8;
	Thu, 16 Jul 2026 13:14:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A88A11BD13E8;
	Thu, 16 Jul 2026 15:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784207648; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LAdNMGQEcEBv2ivyl6uLDi1iKR6S27Ci/u1xnxM3s9E=;
	b=at2x2kpkHqxmxFSSytktJzreyArUb3tw6+giC9PG46YE0qbDDu2yp8d5nKiTSud+KCqZm3
	vwzKYCF0dU+ErKAB4rvf3Q3x6VkQEi4r0ZG+bdVXQ/OmJhrpmmG7Iejv4u/FVE7qYaQn1E
	f/rY0xCzN8XPLnMFTjX2a+uw2Q/HKN5z9ULcSrCscc5UeztubCjb37kwLzGGHeS6ZQtdRK
	N/FlYaN13JNLBgGWWTBmMYPbsMh9MYHLByz1kTeRI1jh9T4arCX27JAEaWHILEOVp63V81
	i8BsosSdaoq4kLwDl3YuMQ7V4NL753jF1M4IL9aB6M48c1fDd+8mOgf5UDzBmA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 15:14:06 +0200
Message-Id: <DK00TPI8ZJ4D.VYTSU3FFS31K@bootlin.com>
Subject: Re: [docs] [PATCH Resend] features: Add distro feature "audit"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <joerg.sommer@navimatix.de>, <docs@lists.yoctoproject.org>
References: <alchGk8fYN2cPmGa@navimatix.de>
In-Reply-To: <alchGk8fYN2cPmGa@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 13:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10092

Hi,

On Wed Jul 15, 2026 at 7:57 AM CEST, J=C3=B6rg Sommer via lists.yoctoprojec=
t.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  documentation/ref-manual/features.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index 77d034f0c..7194bf4ac 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -141,6 +141,8 @@ metadata, as extra layers can define their own:
>     section in the Yocto Project Application Development and the
>     Extensible Software Development Kit (eSDK) manual.
> =20
> +-  *audit:* Enables libaudit support.

We could add a link to the project, which I think is named "audit-userspace=
"?

libaudit -> `audit-userspace <https://github.com/linux-audit/audit-userspac=
e>`__

Antonin

