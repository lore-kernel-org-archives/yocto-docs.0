Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B865CC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 20:37:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.5007.1686256622121937277
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 13:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ho4AGGfX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686256620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsmdUPQWsOJM1MDsdfDr+3hWqKJtO7mJTFRCo8lZOUk=;
	b=Ho4AGGfXxkjLKeUDqsWbYRLW6GfJnoN/P2I84rRITxCfNEvoGBEh5SNbPk7GVEwC4lhVkM
	VWbJYcVLVo3NQ3zSU9AOwS0iLT+C9LWRsNDD+LGUpB4rkkC1zhH0OC0CHReifVh139hZnY
	Aga0Z5yEQszHklIcv20Wt6eqA6x0UuY9Z5y78BCnSHU3WMfomgtc+51G01uz155Ud+KmSq
	LIp/NjbDUDNwMEINY5oVi7MJMjD/ACYrlpewia/JM/uuNH3yeCVLA94mxzNa8xe6ZrzRZJ
	QcIxOCKGHOW8RCyZPF+8Fs+EwDOTN2dI+a+xEbMqIlDlJuxZKHjj/7QbeuHLyw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCC9EE0007;
	Thu,  8 Jun 2023 20:36:59 +0000 (UTC)
Message-ID: <e1a49252-48b2-5159-ffb9-a23d7057263d@bootlin.com>
Date: Thu, 8 Jun 2023 22:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] poky.yaml.in: simplify host package requirements
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
 <cdaf1f42bc82c7a9146070925079ea0ceba3e98e.camel@linuxfoundation.org>
 <65845df5-37a5-202f-f5ec-00d2199bc347@bootlin.com>
 <222f54244c8ac90667615737d7886bc21ea46577.camel@linuxfoundation.org>
 <175BA9792333BDA0.14539@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <175BA9792333BDA0.14539@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jun 2023 20:37:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3993

Hello,

On 03.05.23 at 16:46, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> On 03.05.23 at 12:44, Richard Purdie wrote:
>>
>>>> Ideally there would be two levels of dependencies, those needed for 
>>>> the
>>>> basics and those needed to cover all the needs.
>>>>
>>>> Looking at the original bug, I think we did remove some of the
>>>> SDL/xterm/vnc requirements. Even then some vnc pieces are still needed
>>>> for some autobuilder setups though.
>>>>
>>>> We likely should define which workflows we expect to work with this
>>>> "essential" dependency list?
>>>
>>> Maybe we could document this elsewhere (in a section for developers /
>>> testers ?), to keep the list short for regular users.
>> I agree, I think we do likely need to have two different lists with
>> pointers to move the user to the appropriate one. Would you be able to
>> propose a change?
>
>
> Sure, but I'd need to know what commands I should test to figure out 
> which extra packages are needed.
>
> I'm asking because I suspect that some of the host packages we're 
> listing are no longer necessary anyway, either because of distro 
> changes, or because of our own changes. It's also good to document 
> what the host packages are necessary for.
>
> So, would you (or others) have such commands to run? I'd install the 
> "minimum" requirements first for each distro, and then run these 
> commands until I've found all the extra host packages they actually need.


So, any clue about the commands I should run to find the extra host 
packages that are needed to generate more than images, such as running 
Autobuilder and some testing jobs?

Anyway, if we document such extra host packages, we'll need to explain 
what they are needed for.
Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


