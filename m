Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5746CAC5B0
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 07:12:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.13224.1759821168381523848
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Oct 2025 00:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ijvNlHHD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6519E4E40F4A
	for <docs@lists.yoctoproject.org>; Tue,  7 Oct 2025 07:12:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE6D606EB;
	Tue,  7 Oct 2025 07:12:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C74B102F210E;
	Tue,  7 Oct 2025 09:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759821165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cyOINnSuGl7QW29hVx3FUegVTArCXmxS62NpXN1/HGI=;
	b=ijvNlHHDjnbPMZv3jysOiyF4d++5aMsw2GuHBbIfZcBeXgtGWZ7OwRmIldSZf7yyuNpMHD
	nl27Fn/5aGoV2b/+LIlXrEdchEZI7od/6/GqQRhBXnGjERl8bG3xYRmd6A5Ybca6UzznJd
	WHIdpZ4SlL1YeI4o1s9szdWb5rbHXIcNOfBxUrN42O0hWXTqx5L/2gaTpRnQAy2TLSDDdQ
	OxjMDZzQanSXi8ScLD3BF0dtQzu8axUbw4wukLQlpz1zt7yN0tJzTOevNF8UX3F5U2Z0e8
	pEIywO9wXVdsj8bdpTYDqAEP6VxFhbJEnmg8fqMHBPVZlArAW2jIM5QxTQwJ4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 09:12:43 +0200
Message-Id: <DDBWJDHUKZXO.14YDZQEBJ3YWJ@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: correctly document the difference
 between auto.conf and newly added toolcfg.conf
Cc: <docs@lists.yoctoproject.org>, "Alexander Kanavin" <alex@linutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>
References: <20251006134757.36206-1-alex@linutronix.de>
 <DDBDFWFF5Q1P.3I70CPJOP6EO1@bootlin.com>
 <CANNYZj8NSPGDX=Mp9Cn2+CjgpVTuRYWkApPr1zk1Wjb+mMq98A@mail.gmail.com>
In-Reply-To: <CANNYZj8NSPGDX=Mp9Cn2+CjgpVTuRYWkApPr1zk1Wjb+mMq98A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Oct 2025 07:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7661

On Mon Oct 6, 2025 at 6:27 PM CEST, Alexander Kanavin via lists.yoctoprojec=
t.org wrote:
> On Mon, 6 Oct 2025 at 18:14, Antonin Godard <antonin.godard@bootlin.com> =
wrote:
>
>> We also need to update the auto.conf reference in the fragments document=
ation.
>> Do you want to send a patch?
>
> I am unable to find any other auto.conf references, other than the
> ones the patch is fixing. Can you point me to them please?

Hi Alex,

Indeed, for some reason (tired probably), I missed this part of your patch.
Sorry about that.

The patch looks good to me.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


