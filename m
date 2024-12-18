Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E54E77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 09:35:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.101784.1734514541539220087
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 01:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mvUEB+7b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A2EA60009;
	Wed, 18 Dec 2024 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734514539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yr+DdpWTJF8ItELRX+j+K8LU+fu1aWe1lcjAqEfsfzY=;
	b=mvUEB+7b72XRm5tzhKuFcaAUPQ5tcsaxlmllTve+ykEp5AFwoyyo4mBX0pGBJ1EK68s6AR
	/SELNFSnsQcbe4dnrFTZCxgQVE08BfQE7+KTu+2BTrvCnH2+Yd10j1sWbxR1WkglMLx0se
	rkI9/iqEZSqXKN1wgXd/HLRZZcni0gtq93/Ud1WZ3MvRAtndKwoVwELgA6SAvIVG3eGSqO
	fL8QPy57FzZpYCThYMs4eiL9nICqXJW1I9DDd6hZkZS74QkCRWZzzgzYfcf1uzsS58I5Qc
	z9rE9uDNapx+378DPEgNiZfBLjxLywRtiiiFYi4FGd/s4ssRQ95LUx8uNSzAKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2024 10:35:34 +0100
Message-Id: <D6EQ3517THNQ.30JL51D1JWVN8@bootlin.com>
Subject: Re: [docs] [PATCH v2 3/3] dev-manual/bmaptool.rst: simplify and fix
 instructions
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
 <20241204104432.2094236-4-michael.opdenacker@rootcommit.com>
 <D62WT5QAFUR4.22N91K2Y793BO@bootlin.com>
 <7e870aa5-9a3e-49bc-96ab-c850e31c93e5@rootcommit.com>
In-Reply-To: <7e870aa5-9a3e-49bc-96ab-c850e31c93e5@rootcommit.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 09:35:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5975

Hi Michael,

On Wed Dec 4, 2024 at 2:03 PM CET, Michael Opdenacker wrote:
> Hi Antonin
>
> On 12/4/24 13:19, Antonin Godard wrote:
>> On Wed Dec 4, 2024 at 11:44 AM CET, Michael Opdenacker via lists.yoctopr=
oject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>>
>>> - Remove duplicate instructions
>>>
>>> - Detail how to run bmaptool directly if you installed it on your host
>>>    instead of building it through the ``bmaptool-native`` recipe,
>>>    as running "oe-run-native bmaptool-native bmaptool ..." won't work
>>>    in this case.
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>> ---
>>>   documentation/dev-manual/bmaptool.rst | 12 +++++++-----
>>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-=
manual/bmaptool.rst
>>> index 37083c9c64..93c8d3a45e 100644
>>> --- a/documentation/dev-manual/bmaptool.rst
>>> +++ b/documentation/dev-manual/bmaptool.rst
>>> @@ -43,14 +43,16 @@ any type of image. Use these steps to flash an imag=
e using `bmaptool`:
>>>      depending on your particular setup. The following commands assume =
the
>>>      image resides in the :term:`Build Directory`'s ``deploy/images/`` =
area:
>>>  =20
>>> -   -  If you have write access to the media, use this command form::
>>> +   -  If needed, set permissions to get write access to the media::
>>>  =20
>>> -         $ oe-run-native bmaptool-native bmaptool copy build-directory=
/tmp/deploy/images/machine/image.wic /dev/sdX
>>> +         $ sudo chmod 666 /dev/sdX
>> I think you forgot to change to "a+w"
>> Also, it wasn't moved after the sudo command?
>>
>> Looks like the wrong patch may have slipped in? :)
>
>
> Right, I messed things up by modifying the second commit.
> A V3 is coming, thanks!

I did not receive it the v3, not sure you sent it? Just want to check wheth=
er
I missed it or not.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

