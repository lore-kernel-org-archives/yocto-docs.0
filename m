Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A2DCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 09:07:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.72645.1756804045060092497
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 02:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S7f2pQG2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DFE64E40C6E
	for <docs@lists.yoctoproject.org>; Tue,  2 Sep 2025 09:07:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 363F160695;
	Tue,  2 Sep 2025 09:07:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2DAD1C22D9C9;
	Tue,  2 Sep 2025 11:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756804042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ztQHNAi6QHs0Otl9h+s5O/ben/WzgR7MyY+D6Gbj++w=;
	b=S7f2pQG2EXceQUt3onjHvXP9POQHcoHDGXKy38qYHwkBI1/0XnpQJH202jyjPho9cmn0RB
	liSFqvoasjdhnrqqmiWm0O08CUvgDhdAH6TNlyxwIMeGvVxh1WvCE1/ALz6JBw84BNyzw8
	9TMPK2zgw/haJRIB2ggXWNUKU7z6MhRJ/t3puS1Tz5hcoczISDEySOaXHbsnnG9gYGNgUo
	L7BTVe1FTc/cvya+n+KiUQ7AcVDePB8E6Y5AevuQTYphREzeNq2ivThTlIZFgL97Iv9Ot7
	MOML9Fbp6cy/o2N6kI87e0+eYRaBR0EcixJjJCqGPhm8dScvmNQhdUXL5C42Vg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 11:07:20 +0200
Message-Id: <DCI722IAEZ9W.2EKZ99BUOWJEO@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual/security-subjects.rst: update mailing
 lists
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
 <d790220a-b0bd-425c-92b4-9e6b9a1c3293@cherry.de>
 <DCI4HPNGMKTB.1NCT4AGVSGSF0@bootlin.com>
 <3b9c6d71-8628-41eb-8c80-e5e7f3b5a537@cherry.de>
In-Reply-To: <3b9c6d71-8628-41eb-8c80-e5e7f3b5a537@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Sep 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7482

On Tue Sep 2, 2025 at 10:53 AM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
[...]
>>> Please also backport wherever appropriate (maybe we should think about
>>> having this under the same mechanism we use for migration manuals so
>>> it's never outdated even in old release manuals?).
>>=20
>> I think the idea is good.
>>=20
>> One tricky point is that this is part of the development manual which ha=
s been
>> split in multiple documents not so long ago, so it wouldn't apply to old
>> releases =E2=86=92 maybe we should move this out of the development manu=
al and make it a
>
> We can still try to figure out a way to have this similarly implemented=
=20
> for older but still supported releases?

Sure, if you mean walnascar/scarthgap/kirkstone I was planning on backporti=
ng
this manually to these branches anyway.

>> distinct (and more visible) section? What do you think? This is about se=
curity,
>> not really a development task.
>>=20
>
> Yes to making it more visible since I assume we want people to not have=
=20
> to look too hard on how to report security issues otherwise we may=20
> either not receive reports or having them reported on the wrong channels.
>
> I guess we can have it amongst the Introduction and Overview section in=
=20
> the navigation panel on the left?
>
> I think we should probably add a new section where we say that these=20
> instructions may be outdated and you should really be double-checking=20
> against the latest version of this security document (and maybe link to=
=20
> e.g. docs.yoctoproject.org/dev/security-whatever)? If we ever change the=
=20
> process, we wouldn't want people to misreport because they read the old=
=20
> version of the instructions?

Yes, those are all valid points. I think it should show up on the navigatio=
n
panel. I'll try to come up with something. :)

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


