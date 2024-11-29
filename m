Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCBFD6EC16
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:06:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.115617.1732889188510876899
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 06:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZpJ2ijDl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B208A20014;
	Fri, 29 Nov 2024 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732889186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4WYNnpcthS4ipeU4PrXIlQ/7LPSA5eULGfyjQxphlDw=;
	b=ZpJ2ijDlFLMJIBUUDS8dOfXfBA6RYzZTiCFXVC8kdkFi4bWNL5WVWG4d4Pbg29Uj9qM88r
	WWdPylOgEsW0fdka/2EfDmzgAbD5TPXsKHKnGlY6gAKu1uSX0j4U6CRK0G7VY6d2Eml3p2
	0rw8FkR0kqYdrIYaDalWnUqbHvVlGocJyydUG3lEU4CDAMoaj8IfEfuEP5T5URyaXLqmMp
	WecZ4eFNFvRLPyKGtupybd1+U9OMSuoLBSR0r4or5JVCGdwDqqZIPanNNwRlOP3ExFK6SS
	sSzmwYy+ulnuJKllHHMFhK3DNaQfjGTFdqkts4maS/Jd0i26slcqM506mP4uPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 15:06:25 +0100
Message-Id: <D5YPY5ON8MWN.1D9KIQHLHLR2C@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 3/5] system-requirements: update list
 of supported distros
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-3-50e267ae4123@bootlin.com>
 <03c99b8e-d3f7-4293-b304-760856e035dd@cherry.de>
In-Reply-To: <03c99b8e-d3f7-4293-b304-760856e035dd@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 14:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5852

Hi Quentin,

On Mon Nov 25, 2024 at 7:04 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> To match the list in meta-poky/conf/distro/poky.conf.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/system-requirements.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/system-requirements.rst b/document=
ation/ref-manual/system-requirements.rst
>> index ca75f849d0ad10344900c7525f7163726ffe5400..50c153ad7cc68a3ad175d6aa=
d7f4527d9e4d219b 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -62,8 +62,14 @@ supported on the following distributions:
>>  =20
>>   -  Ubuntu 22.04 (LTS)
>>  =20
>> +-  Ubuntu 24.04 (LTS)
>> +
>
> 24.10 as well it seems.
>
>>   -  Fedora 38
>>  =20
>> +-  Fedora 39
>> +
>
> This one should already be in Scarthgap so split into a separate commit=
=20
> so it can be backported?

Probably, I forgot about that - I'll double check, thank you!


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

