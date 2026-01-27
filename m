Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B451D25958
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 07:23:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5244.1769498589447605188
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 23:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wj/YFNq6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB0FE4E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 07:23:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8AE0C606F5;
	Tue, 27 Jan 2026 07:23:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91FE3119A8650;
	Tue, 27 Jan 2026 08:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769498587; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cCUU34QKw5zaU6ODmxoda1QzI0AskPYKZ9siqksPiqs=;
	b=Wj/YFNq6pEvUbQr8FCqloLBPkq6vC39upLTg+oFn29PQkEgFneruPd+V3QWzNGHCPMJk17
	XPxEoDKC5RmUhfqaUFtFouC5HSWeIXXrBnxcNQPXppkxmQItMoK6dH9yXXCjde+F9MleGB
	xpftqDksGEWgIkpfkA1fxukcBTbEjCB1j7IyfL6wuYS1EgnIA/L+rdLYCbRJ43iWJkDmv3
	EASy9dz29VXzgPpex7Rs/uLgch7HOMnam9lvWA3k8p1bSvCHqIkXckruoqE3U3Lkdqj1yd
	ySZP8HHgl+mWjS2I6ofEDgPDaugS1SCjsZ6FdghDLehlMm73561Iio7iGO40FA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 08:23:06 +0100
Message-Id: <DFZ6WCBZH1S4.1VAX0UWEL3FEI@bootlin.com>
Subject: Re: [docs] [PATCH] vulnerabilities: add support for new bbclass
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <valentin.boudevin@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260113192458.3478804-1-valentin.boudevin@gmail.com>
In-Reply-To: <20260113192458.3478804-1-valentin.boudevin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 07:23:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8659

Hi,

On Tue Jan 13, 2026 at 8:24 PM CET, vboudevin via lists.yoctoproject.org wr=
ote:
> Update the documentation to add the description for:
>
> *generate-cve-exclusions.bbclass
> *improve_kernel_cve_report.bbclass
>
> This .bbclass haven't been merged yet in openembedded-core. This doesn't
> need to be merged until the two following PR are validated:
>
> *PR for generate-cve-exclusions.bbclass: https://lists.openembedded.org/g=
/openembedded-core/message/228924
> *PR for improve_kernel_cve_report.bbclass: https://lists.openembedded.org=
/g/openembedded-core/message/228932
>
> Request to set the documentation up-to-date:
>
> https://lists.openembedded.org/g/openembedded-core/message/229041

Thanks a lot for sending documentation patches for these two classes. I wil=
l
review them if your classes are merged.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


