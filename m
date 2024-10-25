Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF24D0C60D
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 13:33:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.12106.1729863203867689595
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 06:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b/UDVvMT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA7DA40008;
	Fri, 25 Oct 2024 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729863202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3gJLMzlYaxcWCfi+sUJ267ookxqu7zVFioCF8nx9CA=;
	b=b/UDVvMTKTLCHXAB2PlyGEpdN0WOQ1fddQYEgSSA8RXt3tgRXtUS2q2P9A2uuP2XGvLSg/
	5XaQb5M/MRlirA0EsC0yS0GFKlEee/F0vnD/GvNmyTABWbowytNPA7BBuse0E+EETrFsUk
	Kj0F79X8DHuAd890OQKrJkEL8tyXMGnnF93f/uDwR9n7Z1Glw8p+lAx56vs+ZIXo0gDHUO
	30h+/w8VO2zvtxVlWj8ERedU7N9bON7wg+lKh/xxV7E1/IUuoYVUqH//Kd8T5CF4R3lu9z
	PYp6axikUFlVT7TJTIXP57gisc3EBrATqHZFaefYNPdMkhltpYNkGdiRV6qSMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Oct 2024 15:33:21 +0200
Message-Id: <D54XBRXWCP25.MGL78FQ14RCF@bootlin.com>
Subject: Re: [PATCH] docs: set_versions.py: update current releases
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241025-update-switchers-v1-1-5e540ead879b@bootlin.com>
 <ec1ae067-a4bc-41f4-ad3f-69e770eb6d75@cherry.de>
In-Reply-To: <ec1ae067-a4bc-41f4-ad3f-69e770eb6d75@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 13:33:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5591

Hi Quentin,

On Fri Oct 25, 2024 at 3:01 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/25/24 2:00 PM, Antonin Godard wrote:
>> Remove dunfell, nanbield, add styhead as active release.
>> Remove dunfell from ltsseries.
>>
>> The switcher menu now contains:
>>
>
> The suspense is killing me!

Oops!

>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> @Quentin, I'd appreciate your review as I see you modified this file in
>> the past. From what I've seen locally, the Styhead release does not show
>> up in the switchers. Is that something that is done automagically by
>> the autobuilder?
>
> I've barely touched the autobuilder so no clue what it's supposed to do.
>
> But we anyway need to do some manual updates as there's no way we can
> know the release number mapped to a release name. Similarly for the
> mapping between the release number of OE/YP and bitbake.
>
> And finally, how do we know which release is still supported or not and
> which ones are LTSes?

Yep, that's also what I figured=E2=80=A6

>> ---
>>   documentation/set_versions.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/set_versions.py b/documentation/set_versions.=
py
>> index dec078083441263cb1350532b2749f5ee222d555..77fcedef7c28165704b79ab8=
d506a466110b8249 100755
>> --- a/documentation/set_versions.py
>> +++ b/documentation/set_versions.py
>> @@ -26,9 +26,9 @@ ourversion =3D None
>>   if len(sys.argv) =3D=3D 2:
>>       ourversion =3D sys.argv[1]
>>
>> -activereleases =3D ["scarthgap", "nanbield", "kirkstone", "dunfell"]
>> +activereleases =3D ["styhead", "scarthgap", "kirkstone"]
>>   devbranch =3D "styhead"
>> -ltsseries =3D ["scarthgap", "kirkstone", "dunfell"]
>> +ltsseries =3D ["scarthgap", "kirkstone"]
>>
>
> This looks fine, albeit incomplete maybe?
>
> We should probably also get ready for Walnascar.

Probably, yes, although I'm not sure what the implications are since there =
are
not tags/branch created for this release, which is why I wanted to do styhe=
ad
first since it's out.

> https://wiki.yoctoproject.org/wiki/Releases says Walnascar will be 5.2
> with bitbake 2.12.
>
> So I assume we can do the following:
>
> -devbranch =3D "styhead"
> +devbranch =3D "walnascar"
>
> +release_series["walnascar"] =3D "5.2"
>
> +    "walnascar" : "2.12",
>
> Similarly to what was done in cfbb2cda2c3d221f944ae610c05039c9d12093bc

I'll try again and modify the poky.yaml.in and others, see how all of that
works.

> I remember not having a lot of fun in this python script. We should
> probably document the code much better and see if there's something we
> could do to improve readability.

Yeah, seems a bit all over the place. I'll try to understand it, see how it=
 can
be improved.

> I remember we have some bugs open for the docs that shows some version
> number for dev it shouldn't be or something.

I'll have a look. Thanks for your insights!

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

