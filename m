Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4867ECAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 15:12:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.14421.1758813117866635922
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 08:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wuhb9Yy3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CC108C011F8
	for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 15:11:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17CFC6062C;
	Thu, 25 Sep 2025 15:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68AE7102F189F;
	Thu, 25 Sep 2025 17:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758813114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ng985Mcv9Ln5BU79W2x4BKsaUNfblvp36jf7V2b2FU0=;
	b=Wuhb9Yy3y+PmKjBy3TFrzRBHMPM1xtqMsiC16Bo7GtzsUIIikXEaDJr5R/wHVJpl4KV0HE
	Zmq4rbZfTS2EzrRwsKNzGTd/DXe1bST6k/eUYb88VF0JuFA3WeGhESu3vsg0DJeWhggxxv
	SWob1I04TLnYr/dC++rXhiLJaEPmw7snsz0b3sZPIa1SnKjAeRZpzodhUo2tDi9xqdTBXy
	XTo80ZY2QjE6KGltjOnuVL4fWKz6OMU1GhH13JmLVfzg3f4o/FRK0wxENGUTfhjVmepS/c
	Gijo83fEUDzxHgqAeMRgAHRzLjl4Q85nEaIkCSytw7K/Ae19vMwZvcrmfofoMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 17:11:52 +0200
Message-Id: <DD1Z7PHCA2NQ.HG95T9U2DQIU@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Talel BELHADJ SALEM" <bhstalel@gmail.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/classes.rst: add details about
 actions done by base.bbclass
References: <20250921164306.53501-1-bhstalel@gmail.com>
 <20250921164306.53501-2-bhstalel@gmail.com>
 <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com>
 <1867ACF8FB1FE7F2.23261@lists.yoctoproject.org>
 <CAOgG7m0qPUsyWcDmvfTggN7_=cKfmOKQtQ_A7OMCFDtjSd6wXw@mail.gmail.com>
 <DD0BBH0D637J.242PE62ZN7FPV@bootlin.com>
 <CAOgG7m3mi37XpX9QCn11TxfvP9hLsswuoLLy-X3_uzDGJn73RQ@mail.gmail.com>
In-Reply-To: <CAOgG7m3mi37XpX9QCn11TxfvP9hLsswuoLLy-X3_uzDGJn73RQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 15:12:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7603

On Thu Sep 25, 2025 at 4:55 PM CEST, Talel BELHADJ SALEM wrote:
> Hello Antonin
>
> I fixed fonts and size of the diagram, regarding the colors palette, I am
> not sure how to do that in draw.io
> but I kept things simple and used only black, grey and white.
> I am sending a v2

Hi,

Thanks. Please see my comments on the diagram in the v1 thread, that I sent
~40minutes ago.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


