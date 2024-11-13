Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A833D41C17
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 08:31:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7312.1731486701859546597
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 00:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A9/9OehZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBFC21C0007;
	Wed, 13 Nov 2024 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731486700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nY6sd/k2+Xt4E2J+j0sb3PdsVpc1+9R2K2CnMHojCAM=;
	b=A9/9OehZc0zoGArcmKDvQCrxJGHNr937Iv84gyf/tbQaJ0KNYs2i+swL0t/PwbHM6uF6CC
	sFfGOAnlE30sWNuKz5bGHCCX/9eDtVzTQhImTdpN5uUXZUcRR5Cws9TO+TvH6uVp0sEa4O
	8wjFrHvMBwdN2qoGqOmzw9Wcx2rfPjFrewPiWdV1nLRnq4p5kmAiulgVH0cztF0EpkBPcV
	L1c/rNYYENqkX0b5CusLaW2icCv7DrlTxiGDmyEYJnz0D/qQUkZ4bBuruMONnruxdvXeMY
	odCA7nsepp9Si2cgzaaeQTWnVvOJeXDmECdujoKnm7CvH3PDnGfiHsnMum2c/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 09:31:39 +0100
Message-Id: <D5KWT4QLUYI6.1YPGOC8KJJRDR@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs PATCH] migration-guides: add placeholder
 files next release
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com> <7dbc6473-1bca-4bc2-b998-f924fc580137@cherry.de>
In-Reply-To: <7dbc6473-1bca-4bc2-b998-f924fc580137@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 08:31:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5722

Hi Quentin,

On Tue Nov 12, 2024 at 6:15 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
[...]
>> +Migration notes for 5.2 (walnascar)
>> +-----------------------------------
>> +
>> +This section provides migration information for moving to the Yocto
>> +Project 5.2 Release (codename "walnascar") from the prior release.
>> +
>
> thought: By updating set_versions.py to include a DISTRO_NAME_MINUS_ONE=
=20
> in poky.yaml, we could replace "from the prior release" with the name of=
=20
> the release.
>
> Nothing for this patch though :)

But this would only be valid while Walnascar is the current, after that if
DISTRO_NAME_MINUS_ONE gets updated to Walnascar, this document would get th=
e
wrong values, right?

Unless you meant using DISTRO_NAME_MINUS_ONE in other places in the doc?

[...]
>> diff --git a/documentation/migration-guides/release-5.2.rst b/documentat=
ion/migration-guides/release-5.2.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5c39b99e037e0a84ad6603d2=
2ec4fb4dc2bf96ea
>> --- /dev/null
>> +++ b/documentation/migration-guides/release-5.2.rst
>> @@ -0,0 +1,9 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Release 5.2 (walnascar)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. toctree::
>> +
>> +   migration-5.2
>> +   release-notes-5.2
>
> If this file is always the same, we can make set_versions.py or=20
> something similar generate it.

It evolves when minor updates are published (5.0.1, 5.0.2, etc.), so we wou=
ld
need to count the number of releases based on existing tags for a branch. W=
e
would also need to exclude some of those for older releases (for instance t=
he
kirkstone branch does not contain release-5.1.rst).

I'm not sure that the complexity is worth it?

>> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docu=
mentation/migration-guides/release-notes-5.2.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a6ba1e01a310111cf9483c74=
718315286b669821
>> --- /dev/null
>> +++ b/documentation/migration-guides/release-notes-5.2.rst
>> @@ -0,0 +1,62 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Release notes for 5.2 (walnascar)
>> +---------------------------------
>> +
>> +New Features / Enhancements in 5.2
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +-  Linux kernel 6.XXX, gcc 14.XXX, glibc 2.XXX, LLVM 18.1.XXX, and over=
 300 other
>
> s/300/XXX/ ?

+1, thanks!

>> [...]
>> +Contributors to 5.2
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +Repositories / Downloads for Yocto-5.2
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>
> thought: use rST substitutions to abstract even more out of this file=20
> (easier to reuse for next next release :) ).
>
> Something like
>
> .. |yocto-ver| replace:: 5.2
>
> somewhere in the file and then
>
> Contributors to |yocto-ver|
>
> maybe?

Yes, this will avoid potential mistakes.

> This probably won't work for replacing text in the label though but we=20
> don't seem to be using those in that file so maybe that's fine.
>
> Not tested.
>
> Looks good aside from the "300" I highlighted above, we probably will
> forget about it if we let the number be 300 and not XXX :)
>
> Cheers,
> Quentin

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


