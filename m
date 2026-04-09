Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6495EEA3C5F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129837.1775733759159473186
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 04:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=j3MLe8Ca;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10D1D4E4299F
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 11:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D66795FDEB;
	Thu,  9 Apr 2026 11:22:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD86F104502B2;
	Thu,  9 Apr 2026 13:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775733756; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WX3wHZEby5HlWfJZM/hOC2YE+xuH2lnaPIRxDAEToN4=;
	b=j3MLe8CaarNotQ0q8ECA574NW5lCg17tBolwYHYffFvLnvfgqQcbGOeaXRZCoTimkN70OV
	mQH33+S8Opeu0DU5XF13IDgw0xdrVxRezQAzQoeneKdywFMbdcXIOCx9l/hCfsUnILXKJg
	oEa4RDOj8d83Hht4OwGNjpV3Ds6AJ+hrRi6RgHvJ+HZOTa7r+6QTgBa8MuTI0OS7ctBpvK
	ajsxI7PKFkJerPn4xqn0xyCgg88q6WTuMrCVrIzWTuUulYGw5BTBODXewqBX+Clm463xLu
	gcJdxb3NZxeHbSBacam5hgRbRw2Qz0gZS/LQGwnkChQahH05XToS55p9zJAmVQ==
Message-ID: <7d76e296-5ec5-4dd2-8813-782b497a58a8@bootlin.com>
Date: Thu, 9 Apr 2026 13:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: fix wording in
 COMPATIBLE_MACHINE note
To: quentin.schulz@cherry.de, docs@lists.yoctoproject.org
References: <20260409094035.346379-1-joaomarcos.costa@bootlin.com>
 <5ff51b37-613a-448d-949f-406a56f1a012@cherry.de>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <5ff51b37-613a-448d-949f-406a56f1a012@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9208

Hello, Quentin

On 4/9/26 12:29, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Jo=C3=A3o,
>=20
> On 4/9/26 11:40 AM, Joao Marcos Costa via lists.yoctoproject.org wrote:
>> Add missing "that" between "recipe" and "inherits".
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---
>> =C2=A0 documentation/ref-manual/variables.rst | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/ref-manual/variables.rst=20
>> b/documentation/ref-manual/variables.rst
>> index 60e608c0c..8466124e0 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -1679,7 +1679,7 @@ system and gives an overview of their function=20
>> and contents.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .. note::
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When :term:`COMPATIB=
LE_MACHINE` is set in a recipe inherits=20
>> from
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 When :term:`COMPATIB=
LE_MACHINE` is set in a recipe that=20
>> inherits from
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 native, t=
he recipe is always skipped. All native recipes=20
>> must be
>=20
> Doesn't read well to me still. I would say maybe go for
>=20
> "in a native recipe"
>=20
> What do you think?
>=20
> Cheers,
> Quentin

I like the current phrasing, to be honest. My only concern about it is=20
the grammar, so my goal here is to provide a plain fix rather than a=20
subjective improvement in semantics.

Thanks for the review!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

