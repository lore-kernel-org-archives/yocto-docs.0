Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28FBCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:15:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.1773.1758644144725446953
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 09:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Xxm7EM6y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 47B021A0E94
	for <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 16:15:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 101AB60690;
	Tue, 23 Sep 2025 16:15:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EC38102F1970;
	Tue, 23 Sep 2025 18:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758644142; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vQ5kZI6Gs720Ab1b4Ha3871WQpR0iGgR8eM1mud3mv8=;
	b=Xxm7EM6yky0+6G6rP2bNtT8bshhCLhmzr1ag2f5J9kMGVsfDharyFqotibnotSj0o69h2m
	/cDcDze4iIKRk16Bfp7UZhtLhpvIDsMFhQYv2amoK9BLBcXhZ4yaHi6CTGUM/8nQBv6wsL
	wuc3PqESdh7R+9rZxlbXCTQ1SlQsX+hJ+RoEo65pUqbWbQ6aYjKQ90mlp0ARh84zsWsQ86
	MxyzjmGGHxhEyh+/tH9IVxoj/tlxTCGZjuTUEL8gkbjhQqm3x/VXnigGLWzJJhxdZHhCKP
	PLER/YuHhaljla2AGpUqtPQ74r9ABbS0ysZYk3RVdJdJpdTNAvtLma58TJGghA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 18:15:40 +0200
Message-Id: <DD0BBH0D637J.242PE62ZN7FPV@bootlin.com>
To: "Talel BELHADJ SALEM" <bhstalel@gmail.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/classes.rst: add details about
 actions done by base.bbclass
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250921164306.53501-1-bhstalel@gmail.com>
 <20250921164306.53501-2-bhstalel@gmail.com>
 <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com>
 <1867ACF8FB1FE7F2.23261@lists.yoctoproject.org>
 <CAOgG7m0qPUsyWcDmvfTggN7_=cKfmOKQtQ_A7OMCFDtjSd6wXw@mail.gmail.com>
In-Reply-To: <CAOgG7m0qPUsyWcDmvfTggN7_=cKfmOKQtQ_A7OMCFDtjSd6wXw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 16:15:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7585

On Mon Sep 22, 2025 at 8:12 PM CEST, Talel BELHADJ SALEM wrote:
> I will wait for your review on the 2/2 patch before submitting v2.
>
> Kind Regards
> Talel

Feel free to send the first one separately. It's not strictly related to th=
e
second one if I understood correctly.

Reviewing the diagram will take a bit more time.

One remark I just had is that we would need to stick with the Yocto Project
color scheme, fonts, etc. See:
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n17=
3

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


