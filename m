Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF05D10F55
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 14:00:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13277.1764165610725278823
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 06:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V/HjX5wT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4090F1A1D6A
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 14:00:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0649F60721;
	Wed, 26 Nov 2025 14:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB7EB102F08EB;
	Wed, 26 Nov 2025 15:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764165608; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ASgBEYRGzmUns1J4w3XIimto7LiCqMGpvAKYxekCgv8=;
	b=V/HjX5wTWnoW6I1Bv8opR4JwQrGRj0p7DZsPqw4OJJWx4BT6TsNeqgnECjdJ2q3hfFYD6+
	VgrMcWoL7KSd9MQd7YDBdpfIEaxuGYgkMCtA+mCMaV9zrA72RrFHgQKZ/I62sKTK6l5pOU
	Eu3mCxHdla6eI7cOP06DBo5RKAQbgGGrLfoZ9d/xcyCEG1W/h9FbLAc4gbgbrrhOfnabm2
	DaCz1jXOydrw1nTIHC1VE2r6wpGVTPAruv12PyRqx7kF8pHmxVfC7gwp4s2p68ZVzAJHfF
	0kfa0Zvn+KHSyTWOwZvnK5n6Os7FJz2cVYxYPMr1c2JtSnR84P3T8BDfuHCJeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Nov 2025 15:00:07 +0100
Message-Id: <DEIOIJOFDU0S.1M6ZWN7SOJPPM@bootlin.com>
Subject: Re: [docs] should variables glossary document
 REQUIRED_MACHINE_FEATURES and a bunch more?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <abd05cc5-4e3f-6edb-9da6-70dc18b1c9d4@crashcourse.ca>
In-Reply-To: <abd05cc5-4e3f-6edb-9da6-70dc18b1c9d4@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 14:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8145

Hi,

On Tue Nov 18, 2025 at 4:43 PM CET, Robert P. J. Day wrote:
>
>   here:
>
> https://docs.yoctoproject.org/ref-manual/classes.html#features-check
>
> the majority of that bullet list of variables does not contain links
> to the variables glossary, simply because those variables are not *in*
> the variables glossary. should they be?

I documented the missing REQUIRED_* variables recently, so these could be
updated to add the cross-ref to the glossary.

Patches for the remaining undocumented variables welcome!

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


