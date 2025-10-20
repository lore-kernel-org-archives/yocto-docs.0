Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A80ACCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 06:48:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12058.1760942892634821442
 for <docs@lists.yoctoproject.org>;
 Sun, 19 Oct 2025 23:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uwhxmoN7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E75FC0AFCD;
	Mon, 20 Oct 2025 06:47:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 922A3606D5;
	Mon, 20 Oct 2025 06:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30AF0102F238E;
	Mon, 20 Oct 2025 08:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760942886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e18dR6YCLOu7U6Afrn/73SaPqBA3VCgHIvSHZ2YFEoQ=;
	b=uwhxmoN7TU7gB34qH1DIEPK8HaeLMDReEHdKD/TRGz720DcL+5zDMZ/igyUBBTZqcdP1Un
	LXIaWDSdFEpzbIpbKt3j3VZnQVdoSy4TDU/c4AweVHm7IMxfGV69JGy9KY8pfCRgDISnwJ
	9YS35OPI97ANJkz3GgVcYF88hrhhnEA+W8fsFNEArBf9DRLLl6Z/81YJMvgYiom5BziRKJ
	bblLciJ2AkPXwa/KqKNmnh01lATDDxDUxB3tHB6yS+kKZRflJ4J+c7ZSBmU9LoIyRtpuH/
	29u52o9J2xl1+yApFSS4kMi0Wgz+ST+aw/5WtdbFO/DApokDN3lyIhz3Vq6wOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 08:47:54 +0200
Message-Id: <DDMY5GUGNQIG.2PSN7OVYSED7K@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: cover FIT_LINUX_BIN
 variable
Cc: <kavinaya@qti.qualcomm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
References: <20251019164740.3795019-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251019164740.3795019-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 06:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7746

Hi,

On Sun Oct 19, 2025 at 6:47 PM CEST, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Document the FIT_LINUX_BIN variable used in the fit-image class to specif=
y
> the kernel binary name included in the FIT image.

Thanks for the patch. I also sent a patch for this last week:
https://lore.kernel.org/yocto-docs/20251016-release-note-5-3-second-hunk-v1=
-14-20f21db1f93c@bootlin.com/

Quentin had interesting comments on it, and I think your patch more or less
matches mine, so the comments still apply. Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


