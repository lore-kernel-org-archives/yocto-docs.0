Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A38C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 07:43:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.4209.1637135000191037492
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 23:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 980F2C0008;
	Wed, 17 Nov 2021 07:43:17 +0000 (UTC)
Subject: Re: [docs] Continue to support Ubuntu 16.04?
To: Khem Raj <raj.khem@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <e215954c-7898-a9c5-1df1-0d876ce30a86@bootlin.com>
 <bebd3578-f723-8574-93f7-061454b57c8f@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e1766a73-31fa-4251-408b-fd4f0b46c9b3@bootlin.com>
Date: Wed, 17 Nov 2021 08:43:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bebd3578-f723-8574-93f7-061454b57c8f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Nov 2021 07:43:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2157

Greetings,

On 11/12/21 6:33 PM, Khem Raj wrote:
>
>
> On 11/12/21 5:39 AM, Michael Opdenacker wrote:
>> Greetings
>>
>> Ubuntu 16.04 is no longer maintained for free by Canonical
>> (https://ubuntu.com/16-04)
>>
>> I guess our builders don't have a subscription to get updates until
>> 2026, so can we really keep Ubuntu 16.04 in our list of supported
>> distros?
>>
>
> Good question, I think we would not be able to keep testing the latest
> of 16.04 so perhaps it should be dropped.


Then, if everyone agrees, let's drop the 16.04 workers, and use freed
CPU time for other tests.
How to drop the 16.04 workers?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


