Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82432D0BB7F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 09:29:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10555.1729762165417919358
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 02:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BEC3p+6g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C0DD240008;
	Thu, 24 Oct 2024 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729762163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WPlrAgxzKix49GQ8+ONz8awkAbJvDG5oPVEUM8a0W8=;
	b=BEC3p+6g216w4M2CXLXEQm41BW6FhmfUo9ATKgfN/XZhb1trB0YN6J+5d+IJ0iAoGPZ5zC
	U/Y4EhuwZM0DR6c0TWF+sp2Et7WAjGc4qvpV5QGlEtxkEk+RP91z9t21KNkec9j9gAopmh
	tvTGkjoowXL5XF03dwhV7PpHIoM7AY4J7pjnvkFGqTZTnetvSOOTJrW6EiB83+jeWMDZz7
	m36S1FQa06DnTpczRHS4YOyqyEb0raqkCu0w4Hcu+k+RMK3Amnw5arT2LOQzNqessMzIsE
	uMO0nd3qaYfE1R6mAV8fztpRMpe5rfbbCt9p+4MON1e5Cr7zXt9pPNxDhdGjDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Oct 2024 11:29:22 +0200
Message-Id: <D53XIFGXLTYO.1UJ2C08736DBF@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: faq: add q&a on class appends
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241024-faq-class-append-v1-1-673c675cc6aa@bootlin.com>
 <368af907-7c85-4e27-812b-f608f1d2b8dd@cherry.de>
In-Reply-To: <368af907-7c85-4e27-812b-f608f1d2b8dd@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 09:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5580

Hi Quentin,

On Thu Oct 24, 2024 at 11:27 AM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/24/24 11:14 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add the suggestion by Richard to the FAQ, with some minor rewordings and
>> additional punctuations.
>>
>> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual=
/faq.rst
>> index bab284bbfdefae02c284204d3c94891a8238239a..3dcb1f862e24716be703f9fd=
3e811d2fb9ed34a0 100644
>> --- a/documentation/ref-manual/faq.rst
>> +++ b/documentation/ref-manual/faq.rst
>> @@ -259,6 +259,25 @@ Within the :term:`Build Directory`, is the ``tmp`` =
directory. To remove all the
>>   build output yet preserve any source code or downloaded files from
>>   previous builds, simply remove the ``tmp`` directory.
>>
>> +Why isn't there a way to append bbclass files like bbappend for recipes=
?
>> +-----------------------------------------------------------------------=
-
>> +
>> +The Yocto Project has consciously chosen not to implement such function=
ality.
>> +Class code is designed to be shared and reused, and expose some level o=
f
>
> s/expose/exposes/
>
> except if we meant "class code is designed to expose" rather than "class
> code exposes"

Agreed it should probably by exposes here.

>> +configuration to its users. We want to encourage people to share these =
changes
>> +so we can build the best classes.
>> +
>> +If the ``append`` functionality was available for classes, our evidence=
 and
>> +experience suggests that people would create their custom changes in th=
eir
>
> s/suggests/suggest/ (evidence+experience)

Good catch. :)

> Otherwise looks good to me :)
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Cheers,
> Quentin

Thank you!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

