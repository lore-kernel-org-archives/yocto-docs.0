Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40590C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 11:48:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.10736.1753184918460555353
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 04:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QK6J5Q6a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30BA143A06;
	Tue, 22 Jul 2025 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753184916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJWDmmpl84FKiULy2JuTuvO7AEHwFwhUwv8Pbq7v9gc=;
	b=QK6J5Q6acA3fY4dzbRTnC8S6dAsAhhZD9BYANtJ8Us4POpg9yL33ifEsW6HAHNWABhxpwj
	Z4vYGS3Tr1ss8pAngqAk0CwGtL8q+8gwYu3Cw0ILBxnW9R+Q0+CnFd1PyJhTh1TVcgdZrg
	SILCsyeIvxrZaO38jvpB/S4iKNso3Q8Sptc8xCZbDNy7mH3X7pZwUvN66dOki8YbiDbwvd
	dpRZHiqJqXOYmMVN+g/Wsv5nOAd9oWugsedQg8hk7+KouaN2Ji5VFOr9lT7eeeMF69pS7Z
	HiZwxIMB15zh9iLo0R/MpuhQq8od9E1oWJa16wIQe+yD0uxeUIzkowGDJnMdSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 13:48:34 +0200
Message-Id: <DBIK6N21ELHA.3QLUESLN4BZQU@bootlin.com>
Subject: Re: [docs] 32.1.3 Selecting SystemdbootTarget Documentation
 incorrect.
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <pieter.scholtz@kdab.com>, <docs@lists.yoctoproject.org>
References: <G00F.1753181077132367053.BrKt@lists.yoctoproject.org>
In-Reply-To: <G00F.1753181077132367053.BrKt@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedttddugffgledvjeeihfegvedvuddtgeeggeejfffhtdektddvieeugfevtdeuudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphhivghtvghrrdhstghhohhlthiisehkuggrsgdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Jul 2025 11:48:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7360

Hi,

On Tue Jul 22, 2025 at 12:44 PM CEST, pieter.scholtz via lists.yoctoproject=
.org wrote:
> Hi ,
>
> I would like to point out a mistake here: https://docs.yoctoproject.org/4=
.2/dev-manual/runtime-testing.html#selecting-systemdboottarget
>
> All references to bitbake core-image-sato
> Should actually be
> core-image-testcontroller

Thanks for reporting this issue.

> But in the bigger scheme of things , this is just the tip of the iceberg.=
 ( The code around using systemdboot as a target seems to have "rotted" a b=
it )

Do you have more details on what has changed? This would help improving the
documentation.

Are you able to send a patch (for core-image-sato and other systemdboot rel=
ated
changes)?

A guide to do so is available at:
https://docs.yoctoproject.org/contributor-guide/submit-changes.html


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


