Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C590CC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:00:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.6724.1750251599820630694
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 06:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UXb1mC0e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2612439FA;
	Wed, 18 Jun 2025 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750251598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8R5sDE7uLFafJq/R8p9ynzMZhUkQ5BU73ytDusdLuQ=;
	b=UXb1mC0eUe+yA1O5aOShewFjYAyKfQshwCyySMhMs9b1w1f9PNzGBU3+yVivp1OiFLyEiE
	4WpE/IZJLb55IwVd3BX2rjYB6SMfIYQvgBzKH38tcv7bxtzIA/Yjz8+mzZatNoekEo8HiT
	U4P0QFy4xOVQk8YWTcz5EiAakfqE0RV1AmmD1IuuFRzonnDup8Dq1QwuuQwu66lMfp3zTg
	moiH9rqUDd6c/QrqRk4o3+Kkwg5Lq8smbwTYIG0YEjIexdSNuOCObhOGeCs7CwvJgflVbx
	cExB/yAoYOOVRNoQAg/1SXahoJyX5tZKRabMSDnE0hLtQubPvQIp8SRo+WI1TQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 14:59:57 +0200
Message-Id: <DAPOERTPGVZQ.1S2ZZBVVMS1N6@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dixitparmar19@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES
 variable
References: <DAIQQ2J2C0BT.2USP6INDRV4P6@bootlin.com>
 <9960.1750248888618731264@lists.yoctoproject.org>
In-Reply-To: <9960.1750248888618731264@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfefveduudefgeefkefftdeuhedthefhjeffkefffedvtdeiheffhfekueekkeelnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpkhhordhtohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 13:00:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7098

On Wed Jun 18, 2025 at 2:14 PM CEST, Dixit Parmar via lists.yoctoproject.or=
g wrote:
> Will fix the ref->term typo and the take your suggestion on rewording.
>
> There seem to be confusion related to the kernel package name, however I =
feel
> it was additional information. I shall remove the mention of the kernel
> package name (keep the variable reference only) for simplicity in next
> version.

Looking forward to it!

> Yes, you would be able to install "all" the kernel-modules without bother=
ing
> about KERNEL_SPLIT_MODULES. The issue is having autoload .conf file being
> installed or not when KERNEL_MODULE_AUTOLOAD is having your modules liste=
d to
> be autoloader. When KERNEL_SPLIT_MODULES =3D 0 the .conf files for driver
> autoload and probeconf is not getting generated.

This sounds like a bug to me, no? Why would someone expect setting
KERNEL_SPLIT_MODULES to 0 have the autoload files missing?

I ran a some tests. So when I set KERNEL_SPLIT_MODULES to 1, and
KERNEL_MODULE_AUTOLOAD to "xt_limit", a kernel-module-xt-limit.ipk package =
is
generated like so:

=E2=94=9C=E2=94=80=E2=94=80 etc
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 modules-load.d
=E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 xt_limit.conf
=E2=94=94=E2=94=80=E2=94=80 lib
    =E2=94=94=E2=94=80=E2=94=80 modules
        =E2=94=94=E2=94=80=E2=94=80 6.12.30-yocto-standard
            =E2=94=94=E2=94=80=E2=94=80 kernel
                =E2=94=94=E2=94=80=E2=94=80 net
                    =E2=94=94=E2=94=80=E2=94=80 netfilter
                        =E2=94=94=E2=94=80=E2=94=80 xt_limit.ko

When KERNEL_SPLIT_MODULES is set to 0, only one kernel-modules.ipk package =
is
generated, and does _not_ contain xt_limit.conf, but only xt_limit.ko. To m=
e
this sounds like a bug, what do you think?

I would _not_ describe that behavior in the documentation for the
KERNEL_SPLIT_MODULES variables.

The fact that "kernel-modules" is still available when KERNEL_SPLIT_MODULES=
 =3D 1
is simply because a "fake" kernel-modules.ipk package is generated, and dep=
ends
on the other kernel-module-* packages - so you can ignore my remark in my
previous message.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


