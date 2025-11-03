Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5274CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:07:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1040.1762186059002519139
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 08:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mK3X/hbQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39DCA4E414CF;
	Mon,  3 Nov 2025 16:07:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F2B460628;
	Mon,  3 Nov 2025 16:07:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A88910B50169;
	Mon,  3 Nov 2025 17:07:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762186056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fRx34QEC7JVAOnpcvk+AG8gwnTjl6AJZVJiIuqlcsLI=;
	b=mK3X/hbQds2FHxygP8fHcwfj8uQtNcwLoDLNfZZ8Xi4opv6LSHlCGquY3V9iWvDbcYqYoE
	1PQCYiMhkMhZcvARZaiaBQ9zmOQ3p82wd80ubk0P3Q9YO85V1b2ja1dCkuH06x4ign7k8K
	Z+kM+2OiWa4tqSuSj8MnohhREfYsew/V+wr81Zi7MqWz7TM1BdRNViARaSNZA3+qQgRwMU
	SIEqjHP36mZED0NMAI7Mmv/Eawi/N1xOYMJdaXVZhwP2TVlHnmO3b0EnSTN3VlqMZHObLJ
	wC036npifWp7UCpv3xn6VGoohjhdA0nE8I2X6kfp+g9cwL/SMV/RfVZJk5ng5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 17:07:34 +0100
Message-Id: <DDZ6TLNMLGVM.3FH9I5FYI9QHT@bootlin.com>
Subject: Re: [docs] [PATCH 4/6] brief-yoctoprojectqs: switch to
 bitbake-setup
Cc: <docs@lists.yoctoproject.org>, "Tim Orling" <tim.orling@konsulko.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
 <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com>
 <CANNYZj8=Fvwcqf+Mei7DoH1egppRtdmTb7S6EcnpESMh3+z+EQ@mail.gmail.com>
In-Reply-To: <CANNYZj8=Fvwcqf+Mei7DoH1egppRtdmTb7S6EcnpESMh3+z+EQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 16:07:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7971

Hi,

On Fri Oct 31, 2025 at 5:08 PM CET, Alexander Kanavin wrote:
[...]
>> +#.  **Find a Layer:** Many hardware layers, or :ref:`BSP layers
>> +    <overview-manual/concepts:bsp layer>` are available. The
>> +    :oe_layerindex:`layer index <>` can be used to find such layers. Th=
is example
>> +    adds the :yocto_git:`meta-yocto-bsp </meta-yocto/tree/meta-yocto-bs=
p>` BSP
>> +    layer.
>
> That is assuming the user has selected 'nodistro' which does not
> include meta-yocto. If they selected poky, then we need another layer
> as an example, probably meta-raspberrypi?

The issue with this is that there is a lag between when a Yocto release com=
es
out, and when the BSP layer is ready for it. So there is a timespan where t=
he
docs will not work. With meta-yocto-bsp, we're sure that this example will
always work.

On the other hand, having an external layer here would be an opportunity to=
 shed
some light on `bitbake-layers layerindex-fetch --branch scarthgap --fetchdi=
r
../layers/ meta-raspberrypi`. So I'm a bit torn on this but I think I prefe=
r
going with meta-yocto-bsp.

What do you think?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


