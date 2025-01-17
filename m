Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7D8C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 13:48:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10854.1737121699206535239
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 05:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lG+z+MHZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2420540006;
	Fri, 17 Jan 2025 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737121697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2aLwn64RF+QdNzC4LGDo3jrkz0YfdUB6CXbghPpUHPM=;
	b=lG+z+MHZabQdwi25WlmcOerx3uyP+C7s+I2DE6aB9sXzOmpS3LlN2JV995B9ztMEjVhsit
	RNlbwlHIuJyZfFWHxIno7hpjE9FixfQmG+ckxbQeA1edl3f/dOS6yr5OkVKhQqC2fMe48N
	8ZCpo0C1PvS601eZPsCDnNFGh068wINKQ1Kw19BogFJ7/rfbxNtXFDQjVlcv0VGD7z/aCD
	YpDQyeO8A072znT2Ub/O+v5zbVahZfLzcZ9CzmYl9xtdfqzbUi0p7dXZj/Ng/c2xmHkNUN
	K9xET/thhdhrxadtQy3ruH/12E9OOZhUlwDDSFtDaHpOksTGVoakY27KE1qW4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 14:48:16 +0100
Message-Id: <D74E8YOQYMY7.1XVJ5VJNXQG1S@bootlin.com>
Subject: Re: [yocto-docs PATCH v2 07/14] ref-manual/classes: document the
 cython class
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com> <20241220-release-note-5-2-updates-v2-7-df29527f3fc5@bootlin.com> <52150661-771d-43d8-bf91-edb4f2a2d8bc@cherry.de>
In-Reply-To: <52150661-771d-43d8-bf91-edb4f2a2d8bc@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 13:48:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6138

Hi Quentin,

On Tue Jan 14, 2025 at 11:37 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/20/24 1:16 PM, Antonin Godard wrote:
>> Small class added in oecore by commit
>> 64b6e8580842949be58f97f4dff91d1f097c4020 ("classes-recipe: add cython
>> class").
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> For your information, I have an alias to only keep the 12 first digits=20
> of a commit (which is what's used in the Linux kernel for the Fixes: tag)=
.
>
> alias gitf=3D"git --no-pager log --abbrev=3D12 -1 --pretty=3D'%h (\"%s\")=
'"
>
> You then simply call gitf 64b6e8580842949be58f97f4dff91d1f097c4020 and=20
> you'd get
> 64b6e8580842 ("classes-recipe: add cython class")

Thanks, added to my shell rc :)

> This also highlights that this commit is not in OE-Core but in Poky :)=20
> (they do not have the same commit id).
>
> Cheers,
> Quentin


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

