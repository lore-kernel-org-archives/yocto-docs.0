Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA3FC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:47:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.21569.1683125222471162900
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 07:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CEks8md3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7C253E0003;
	Wed,  3 May 2023 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683125219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPj+er83VHKflg/0jAioS4S3sHSE5Lllju7zwHmUbes=;
	b=CEks8md32k0jqf2QmH5XISQjmU0QujxG6LHAGwMF6xnnEBzzSWfKdRbNQfcNEa90pFHtHy
	jRdOFKrM9oobk8eKjnMhGxqY53yowBwsTgIOzRoxmz7gRLEPRs7TuMVgKjZb+RZW1IoOEJ
	u1PxP/QxDnpOtWRUVYPA8OFAorfGIVqqqkVdYS3Hwp1pIqlY46sEPoyUDvt/Qbvhx3jR9T
	rZRUTAb7qhtr3Y1MUFyygdROC6r8coZCQqwpqiTqKZW9chcG49Mu/QBUSE9nGYJyZw9Z/C
	8T+u3hIU7YxFAFmRBDy5IHLH+4C/PUqw+/Eez7eIdsTPo7XWLnjVOVTAcsV/MQ==
Message-ID: <da28f6be-f936-4214-0ed0-629d3137b6da@bootlin.com>
Date: Wed, 3 May 2023 16:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] poky.yaml.in: simplify host package requirements
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
 <cdaf1f42bc82c7a9146070925079ea0ceba3e98e.camel@linuxfoundation.org>
 <65845df5-37a5-202f-f5ec-00d2199bc347@bootlin.com>
 <222f54244c8ac90667615737d7886bc21ea46577.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <222f54244c8ac90667615737d7886bc21ea46577.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 14:47:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3900


On 03.05.23 at 12:44, Richard Purdie wrote:
>
>>> Ideally there would be two levels of dependencies, those needed for the
>>> basics and those needed to cover all the needs.
>>>
>>> Looking at the original bug, I think we did remove some of the
>>> SDL/xterm/vnc requirements. Even then some vnc pieces are still needed
>>> for some autobuilder setups though.
>>>
>>> We likely should define which workflows we expect to work with this
>>> "essential" dependency list?
>>
>> Maybe we could document this elsewhere (in a section for developers /
>> testers ?), to keep the list short for regular users.
> I agree, I think we do likely need to have two different lists with
> pointers to move the user to the appropriate one. Would you be able to
> propose a change?


Sure, but I'd need to know what commands I should test to figure out 
which extra packages are needed.

I'm asking because I suspect that some of the host packages we're 
listing are no longer necessary anyway, either because of distro 
changes, or because of our own changes. It's also good to document what 
the host packages are necessary for.

So, would you (or others) have such commands to run? I'd install the 
"minimum" requirements first for each distro, and then run these 
commands until I've found all the extra host packages they actually need.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


