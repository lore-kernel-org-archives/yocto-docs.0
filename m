Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01B8C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 10:51:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.170465.1698231069825585528
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lv8JD5ra;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A55E21BF205;
	Wed, 25 Oct 2023 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698231068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msNGI9Qh+jhIOW3McsNoJW68uiQPFEC02iIJuBITTZI=;
	b=lv8JD5rasveldMmV+VCsylA0qoLuyLtmDm5NFkRI0uflz5Re9SKT8Dgq2jhOzOVSXWoMIV
	zAATKLxyW6lQXsUbTyQZvwTDm4Q2db43d/sdVGpo7qzr5KWyoXdp4Ospu4wHjtw0+hk0r3
	n9LT0CJ6XmsjbEhuKpXrdWcnPVGAMcAvxZBXWhy5duZyBJtlBL5TRti8klY8zn2rVifHJC
	vIuHrMe/NWNMPbUK7yDNqxgzAcgZ/1OvEwkTkSDj8UOFNRukuwmMhC2B2AJXqK5+n+u7wq
	3PxkQYFq5sjrUOYz8zwks4U90o/uNOmN3P/2oMIHp8KrftFqQTNuTQSMB1sVIA==
Message-ID: <68d1fef1-4108-4d55-91d5-2ce788182c93@bootlin.com>
Date: Wed, 25 Oct 2023 12:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex.kanavin@gmail.com>,
 Tim Orling <ticotimo@gmail.com>
Subject: Re: [docs] [Proposition] Workshop-like documentation
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <CAOgG7m3Z8E9PvROHDV5qL8-WGJmY0f6NQgPrfxG8YXnVw6AfPA@mail.gmail.com>
 <CANNYZj8xYZWLnbxoHuBaGR0SDx98vbO26ob8qmsZ7eTRZgQA3g@mail.gmail.com>
 <CAOgG7m0w5z0TpntHnzEHwKngkwc3c9nvsnpmR0_zGR+K_Ng9-Q@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOgG7m0w5z0TpntHnzEHwKngkwc3c9nvsnpmR0_zGR+K_Ng9-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Oct 2023 10:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4497

Hi Talel

On 23.10.23 at 17:53, BELHADJ SALEM Talel wrote:
> Hello Alexander,
>
> Thanks for the suggestion.
>
> I have the article "Things you should know about Recipe's working 
> directory"
>
> I think it can be added to "dev-manual" as "40. Understanding WORKDIR" 
> or "40. Recipe WORKDIR workshop"
>
> What do you think?


This sounds like a great idea indeed!
Or maybe as an improvement to 
https://docs.yoctoproject.org/overview-manual/concepts.html.

I let you check what could be the best place.

If we are talking about tutorials, we could add a new "Tutorials" manual 
with various documents underneath. I already have a kernel lab from Tim 
Orling to include too as soon as I have time.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


