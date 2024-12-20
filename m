Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32DFE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 10:31:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.149370.1734690700205026592
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 02:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IQFORphs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40E1C40003;
	Fri, 20 Dec 2024 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734690698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5s2xyk/bO1rYXW5Sa4xaxr7kz8tMwfuLvcWLLyU+pU=;
	b=IQFORphsO7jVvXPF06FqgnTIYXL+mwDFzgRaw++4KfPyNG9NlnH35yI2Aqsq92uzYp3U7i
	7yGxdyc+xohlwlWnJFnT3y1q8vTgY55XE+AoqOh3LRWueNRov/GYLtHzHEBigvPVTSfyMB
	/b+WBlgVl1+wMdGdUMV01BNo5Ih+/PUCo0kYQwbqzgaiWDFWhmeTeagtqE9uQxXD6VLcKQ
	KEyVGmq9z/MPbCgkDHyuqfl1xnc0QipKO/i95ba9lmTzqYk/u8HSx/fYcEIL2UTWDaT6te
	bPm+TX/rdwSYXbnwlEMjqco1T/hzjna+XPQmZK7VtBhlNB2ijNZ0nNQ7RDmtQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 11:31:37 +0100
Message-Id: <D6GGJ57V5752.3VNH1SHDKM4G9@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 13/14] ref-manual/variables: document
 the PREFERRED_RPROVIDER variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com> <20241217-release-note-5-2-updates-v1-13-b189493b1b09@bootlin.com> <7be52ac3-ae7b-40ae-9bc2-69aa0b7f5d5e@cherry.de>
In-Reply-To: <7be52ac3-ae7b-40ae-9bc2-69aa0b7f5d5e@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 10:31:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5995

Hi Quentin,

On Tue Dec 17, 2024 at 3:43 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> This variable is similar to the PREFERRED_PROVIDER variable but it
>> denotes a runtime provider specifically.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 50cd8948b35f381414837acc9b9e925dc5110779..e0b87c0e5ff8cf7bd2598cbb=
b184f9aada19d326 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -6711,6 +6711,25 @@ system and gives an overview of their function an=
d contents.
>>      :term:`PREFERRED_PROVIDERS`
>>         See :term:`bitbake:PREFERRED_PROVIDERS` in the BitBake manual.
>>  =20
>> +   :term:`PREFERRED_RPROVIDER`
>> +      The :term:`PREFERRED_RPROVIDER` variable works like the
>> +      :term:`PREFERRED_PROVIDER` variable, but it denotes recipes that =
provide a
>> +      *runtime* component. Runtime providers are declared by recipes th=
at set
>> +      the :term:`RPROVIDES` variable. For example::
>> +
>> +        PREFERRED_RPROVIDER_virtual-x-terminal-emulator =3D "rxvt-unico=
de"
>
> Missing a whitespace for the alignment I believe (I believe we're=20
> three-whitespace aligned usually?). Ditto for the other code blocks below=
.
>
>> +
>> +      This statement sets the runtime provider for the X terminal emula=
tor to
>> +      ``rxvt-unicode``. The ``rxvt-unicode`` recipe is a runtime provid=
er of
>> +      this component because it contains the following :term:`RPROVIDES=
`
>> +      definition::
>> +
>> +        RPROVIDES:${PN} =3D "virtual-x-terminal-emulator"
>> +
>
> We have to be very careful with the word recipe here. Above, it's the=20
> ``rxvt-unicode`` package that is a runtime provider of=20
> virtual-x-terminal-emulator, because of the :${PN} override.
>
> I assume PREFERRED_RPROVIDER_virtual-x-terminal-emulator should also=20
> contain the name of the package and not the recipe? That I am not=20
> entirely sure of though, haven't looked into the implementation of it.

Well... the doc for PREFERRED_PROVIDER _and_ the code refers to these as ne=
ither
"packages" or "recipes", but "items". See the doc for PREFERRED_PROVIDER an=
d
https://git.openembedded.org/bitbake/tree/lib/bb/providers.py#n323.

But as you said, the :${PN} override implies that a _package_ RPROVIDES
something, so we understand it the same way.

I will be more precise about this in the v2.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

