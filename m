Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6951BC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:40:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.25099.1642002050166856964
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3A56D1BF20A;
	Wed, 12 Jan 2022 15:40:47 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: simplify references to class sections
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20220111165923.2243490-1-michael.opdenacker@bootlin.com>
 <fc3b98e4-babc-b155-01e0-2596e1880881@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <44a0f8a9-76c0-6d02-4c70-27daa61c52f2@bootlin.com>
Date: Wed, 12 Jan 2022 16:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fc3b98e4-babc-b155-01e0-2596e1880881@theobroma-systems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 15:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2399

Hi Quentin,

Thanks for the review!

On 1/12/22 3:14 PM, Quentin Schulz wrote:
> Hi Michael,
>
> On 1/11/22 17:59, Michael Opdenacker wrote:
>> Replace
>> ":ref:`classname.bbclass <ref-classes-classname>`" section
>> by
>> ":ref:`ref-classes-classname`" section
>> because each section has "classname.bbclass" as title,
>> therefore the result is the same.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Looks good :)
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Merged in "master-next" then.
Thanks again.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


