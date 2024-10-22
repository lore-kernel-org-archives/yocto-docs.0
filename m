Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E457D1CDB1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:20:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.13493.1729585194973276109
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=biWjGKAc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D947620007;
	Tue, 22 Oct 2024 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729585193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8j3t6VL2i2ps62giuvDtfiQHm9oO2y+4c8J0dXGSpA=;
	b=biWjGKAcVJbXUq1cTo7PP2L9ZaG5inU/vGIaYTw3DNm9o1/kmOTXKRCBzFjwCQyMR0UMNJ
	OEowR0iY4K+VZkxLt04/FmP9pt7+QbbBp3YxprVmTfiUfejS6doTIwE1D0NkP8qL9S6EvL
	n0e6ASmRg/A6VL1BMCSvVLG3jWAq0SOD7RHA2+jnYHr7+8cKnb7BZuGW5hwYUuIQxkVoAq
	uwMYnu0LwfJ8ui2RzSZl85ovwFBc/Thq3zPiCjxU/gk2rgFEkAfVtVFM9Dv8FRwCEKG66R
	XlGuPv3uereqc/dL7ZzTOT5Fqbq/FUEX88FMoF5lRFW8SwNucCW2wI+RrqaaDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 10:19:52 +0200
Message-Id: <D526S4GGJQWD.1QJ91MOMYVQTY@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs
 docs
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Adrian Freihofer" <adrian.freihofer@gmail.com>, "Chris Laplante"
 <chris.laplante@agilent.com>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
 <CAB3asfjKDgX7+N9JTemHhGHUv+VoB6aU1_p0FhkpU5gNTVOGLQ@mail.gmail.com>
In-Reply-To: <CAB3asfjKDgX7+N9JTemHhGHUv+VoB6aU1_p0FhkpU5gNTVOGLQ@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5545

Hi Adrian,

On Mon Oct 21, 2024 at 9:54 PM CEST, Adrian Freihofer wrote:
> Chris Laplante via lists.yoctoproject.org <chris.laplante=3D
> agilent.com@lists.yoctoproject.org> schrieb am Mo., 21. Okt. 2024, 17:23:
>
>> From: Chris Laplante <chris.laplante@agilent.com>
>>
>> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
>> 2. Fix the 'cp -a packages-split/bash-dbg/* path/debugfs' step to not
>>    literally try to copy a file called '*'
>>
>> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
>> ---
>>  documentation/dev-manual/debugging.rst | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/dev-manual/debugging.rst
>> b/documentation/dev-manual/debugging.rst
>> index 92458a0c37..6b5d2dd820 100644
>> --- a/documentation/dev-manual/debugging.rst
>> +++ b/documentation/dev-manual/debugging.rst
>> @@ -1006,8 +1006,9 @@ debugger.
>>
>>        IMAGE_GEN_DEBUGFS =3D "1"
>>        IMAGE_FSTYPES_DEBUGFS =3D "tar.bz2"
>> +      IMAGE_FSTYPES:append =3D " tar.bz2"
>>
>> -   These options cause the
>> +   The first two lines cause the
>>     OpenEmbedded build system to generate a special companion filesystem
>>     fragment, which contains the matching source and debug symbols to
>>     your deployable filesystem. The build system does this by looking at
>> @@ -1016,8 +1017,9 @@ debugger.
>>
>>     The companion debug filesystem is not a complete filesystem, but onl=
y
>>     contains the debug fragments. This filesystem must be combined with
>> -   the full filesystem for debugging. Subsequent steps in this procedur=
e
>> -   show how to combine the partial filesystem with the full filesystem.
>> +   the full filesystem for debugging. The third line ensures that the
>> +   build system generates a tar.bz2-formatted copy of the full filesyst=
em,
>> +   which will be used in subsequent steps in this procedure.
>>
>
> Would a link to
> https://docs.yoctoproject.org/sdk-manual/extensible.html#devtool-ide-sdk-=
configures-ides-for-the-extensible-sdk
> be helpful here?
> This tool creates this setup automatically, even without creating a big t=
ar
> and extracting it again.

Indeed, this would make sense I agree. I would perhaps add it after the sen=
tence
a bit further up after "The following steps show you how to debug using the=
 GNU
project debugger." as a `.. note::`. What do you think? Would you be able t=
o add
that note?

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

