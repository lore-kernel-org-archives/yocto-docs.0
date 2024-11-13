Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA6DE6781F
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 13:39:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.11907.1731505187449078394
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 05:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QQFcA8qX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D1BB40009;
	Wed, 13 Nov 2024 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731505185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeAKUkFFhw1lq2GN+tZblDMn/yRmMHx9nrKwnhlntZg=;
	b=QQFcA8qXJhhl96MHG9dLAEzBEkYrM+Nxcz7B9cieRhF20bli+oAlWblo80kQVZ2kOnGidM
	wRM0gH7ckVQvWxsFFIbau9GJTjGNpke/zHAwSJMJEWBMcbR4RFYvXI21N3b1kFicLBqIqe
	tDkxEqR7qisu5w4UVBzSEhiAl4COfQswkmh3fzhAdbzmJZGPUUlo5dInz2WS5S7/kWiNW6
	SJ2P/iv1Y7CcOAhgxSJaWmDi1zFTlScJfjUbfq3guaf+watJiTGA7P+3Ltt/zSaGUBpSZJ
	1Q1pXeAVSPz8LvTHBR8VtpJG1596BX7AifsYna25cCuM5oTrqCkRr3+7NngtEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 14:39:45 +0100
Message-Id: <D5L3D0SLI4GQ.2ZYAVIPIJ1V4Q@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH] migration-guides: add placeholder
 files next release
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com> <7dbc6473-1bca-4bc2-b998-f924fc580137@cherry.de> <D5KWT4QLUYI6.1YPGOC8KJJRDR@bootlin.com> <261f85b3-e045-4d2f-8771-dc400b893843@cherry.de>
In-Reply-To: <261f85b3-e045-4d2f-8771-dc400b893843@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 13:39:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5725

On Wed Nov 13, 2024 at 10:22 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/13/24 9:31 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Tue Nov 12, 2024 at 6:15 PM CET, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
>>> Hi Antonin,
>>>
[...]
>>>> +Release 5.2 (walnascar)
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +
>>>> +.. toctree::
>>>> +
>>>> +   migration-5.2
>>>> +   release-notes-5.2
>>>
>>> If this file is always the same, we can make set_versions.py or
>>> something similar generate it.
>>=20
>> It evolves when minor updates are published (5.0.1, 5.0.2, etc.), so we =
would
>> need to count the number of releases based on existing tags for a branch=
. We
>> would also need to exclude some of those for older releases (for instanc=
e the
>> kirkstone branch does not contain release-5.1.rst).
>>=20
>> I'm not sure that the complexity is worth it?
>>=20
>
> We already autogenerate releases.rst which does list all major and minor=
=20
> releases based on existing tags.
>
> We know from which tag(s) we started to have release-notes and migration=
=20
> files.
>
> We could stop the generation of those files depending on the current tag=
=20
> we're building for, to prevent trying to include files that don't exist=
=20
> in older releases.
>
> We could also do the same trick we do for Supported Release Manuals and=
=20
> Outdated Release Manuals and just link to the newer=20
> docs.yoctoproject.org/X.Y.Z/migration-guides/release-X.Y.html
>
> Just ideas though :)
>
> Cheers,
> Quentin

I see, I'm taking a note, and I'll try to look into this at some point to s=
ee
what's worth automating or not. I know I also need to look into the release=
s.svg
autobuilder deployment, so maybe there's something to refactor here also.

In the meantime I'll send a v2 shortly with some improvements.

Thanks for your input and ideas!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


