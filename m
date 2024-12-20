Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E3DE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:06:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.148565.1734685602900594520
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 01:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pS33D0ye;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5DFF1BF203;
	Fri, 20 Dec 2024 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734685601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wfpq23+29/LxjelI5eaQE/JcwSsMUhj4Z5+DClFpNM=;
	b=pS33D0yeJ3m7NwE93aa2VIE3X+JRPr/cpyHTp0Mx7u7fjjl3Xyij+LF9EUUkK9FDsagLja
	PfrPG09MwtJHEaCp/AG+amgZe8E2o2zC50VHbubrAkP/C4Y/LPs70JU8qd/R5cETlhFxLE
	X/uCQWE3Y76KV9GZS19RrkwPFcgu4PEQfU7d9+WYQ8BCU6PGsaZqWzJusMSBH1ZvGyfT1j
	2zZ7nucJk0OP32QnXGsj2EEmsOKKO5gN/EBpjSh3t1BX/f+p5OwdSb8xJ9GJh8l9GLvoJn
	ss+520zPyqzEeMri+4x6dkHHHkxDZ4IY1iaNEtqMXLOTmrRwvLEMnQLFs8cBPA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 10:06:40 +0100
Message-Id: <D6GEQ3K5UI34.3K7Z40GYRTXDN@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 07/14] ref-manual/classes: document
 the cython class
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com> <20241217-release-note-5-2-updates-v1-7-b189493b1b09@bootlin.com> <d7746edb-c7b9-47ee-a793-43c15fbc00c4@cherry.de>
In-Reply-To: <d7746edb-c7b9-47ee-a793-43c15fbc00c4@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 09:06:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5992

Hi Quentin,

On Tue Dec 17, 2024 at 11:48 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Small class added in oecore by commit
>> 64b6e8580842949be58f97f4dff91d1f097c4020 ("classes-recipe: add cython
>> class").
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-ma=
nual/classes.rst
>> index 3d61d8d7a00b21fcff82a771f9718013fae36694..47f049c7435a989f30c033b7=
b12d86482686ac77 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -614,6 +614,17 @@ You will find some more details in the
>>   ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`"
>>   section in the Development Tasks Manual.
>>  =20
>> +.. _ref-classes-cython:
>> +
>> +``cython``
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The :ref:`ref-classes-cython` class can be used by Python recipes that =
require
>> +:oe_git:`Cython </openembedded-core/tree/meta/recipes-devtools/python/p=
ython3-cython_3.0.11.bb>`
>
> I'm not entirely sure this is a good idea. This will eventually change=20
> during a version upgrade and the recipe at that version disappear and=20
> this link be useless. Two options: no link or a link from a specific=20
> commit so it is always there.
>
> I am not entirely sure pointing to the Cython recipe provides anything=20
> meaningful here so I would vote for removing the link (could be a link=20
> to the Cython project instead?).

Of course, I forgot about this.
I will link the Cython project instead.

>> +as part of their build dependencies (:term:`DEPENDS`). It also improves
>> +reproducibility for these recipes by stripping potential leftovers buil=
d paths
>> +in compilation outputs.
>> +
>
> I'm not sure the reproducibility improvement need to be mentioned here.=
=20
> It seems to me like this could be interpreted as "if you want improved=20
> reproducibility you can include this class even if the recipe doesn't=20
> need Cython". If it needs Cython, I assume the leftover issues for=20
> reproducibility are coming from Cython so it's expected we fix those?=20
> Not sure it's very clear what I'm trying to convey here?

Yes, and there must other places where reproducibility is improved and the =
docs
doesn't mention it. I'll remove this.


Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

