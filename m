Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3162BCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 15:16:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.148.1759936570509680709
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Oct 2025 08:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IOYZfC4P;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91FA91A1212;
	Wed,  8 Oct 2025 15:16:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6411C606E5;
	Wed,  8 Oct 2025 15:16:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6922D102F2182;
	Wed,  8 Oct 2025 17:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759936567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=l4LqN9w2OuQCm8MKOMUe1cu6U0FENIC48T+DYvRTJa4=;
	b=IOYZfC4P7u3fRCh/8QVP5qPdP1E5fICHQuCga4KA9xY1dUIYGQdpBTV0474hp+Mhn2ebE6
	+iFT98qApSjZyYl2j9QtGM98t6R9CYmVWbQr+IacaaC4THCiXoNp5Q3VKP3tiJaYUGqYQ0
	cs0W6psXoGHOj2cR/jBeDCvdubOYWp8Yt1PpLBEOIM6vDFVaSmNx1SCde8vTW7N/+Pt7Ib
	qrPPEnkMw47hvy2eC5KnpJfutcQ/gscMcTeV81K+PViuLB1kksYQwv6ctyd1t7b2/zVTv9
	wqMm+V57su8+XMoIdaaE8Sk8soCwWWN2qg/e4mhu6+tCWFD7DzICJ9BPuVhIUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 17:16:05 +0200
Message-Id: <DDD1G0G1IO8D.1HXEK2C1JOAAE@bootlin.com>
Subject: Re: [docs] [PATCH] tools/build-docs-container: add optional option
 for essential packages
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20251003-build-docs-container-essentials-v1-1-558fb531a9c7@bootlin.com> <b6c534fc-d9ff-442e-a8b2-5b8521cd164e@cherry.de>
In-Reply-To: <b6c534fc-d9ff-442e-a8b2-5b8521cd164e@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Oct 2025 15:16:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7664

On Mon Oct 6, 2025 at 6:04 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
> Not in this git diff but it's in the tree, we now enabled leap:15.6 but=
=20
> we kept the comment, so either we shouldn't have added support for=20
> leap:15.6 to the docs because it doesn't work, or it works and then we=20
> should remove the comment.

I was able to build the PDF with leap:15.6, with Docker. I am trying Podman=
 just
in case... But I will remove the comment, thanks.

> I'm not convinced this is the right way of testing the essential=20
> packages but I see the benefit for now and have nothing better to=20
> suggest except building a separate container which will do a world build=
=20
> of bitbake + oe-core for all supported machines but that is a LOT to ask=
=20
> for a test :)

Yes, that's not ideal, but as it stands it is a "nice-to-have solution" to
validate that what we list here successfully installs. For the build, there=
's
the Autobuilder. In an ideal world, this list of packages would be shared
between the AB and ydocs...

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


