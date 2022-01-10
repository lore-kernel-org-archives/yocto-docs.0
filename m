Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70043C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:22:40 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.31591.1641820959248407353
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 05:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id EDB24200011;
	Mon, 10 Jan 2022 13:22:35 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH V3] overview-manual: document hash equivalence
To: Richard Purdie <rpurdie@rpsys.net>,
 =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <16C812800894D4AC.11018@lists.yoctoproject.org>
 <20220107190840.784216-1-michael.opdenacker@bootlin.com>
 <6rbl0kjd8a.fsf@pengutronix.de>
 <d0c7cd99-2d79-b109-eb72-f119283832f8@bootlin.com>
 <23e5e7d4d7436c22e271d52892803187b6988184.camel@rpsys.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8cced70e-6ccf-82aa-25b8-c1a0bd486b1a@bootlin.com>
Date: Mon, 10 Jan 2022 14:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <23e5e7d4d7436c22e271d52892803187b6988184.camel@rpsys.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Jan 2022 13:22:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2364

Richard, Ulrich,

On 1/10/22 12:30 PM, Richard Purdie wrote:
>>>> +Hash Equivalence
>>>> +----------------
>>>> +
>>>> +The above section explained how BitBake skips the execution of tasks
>>>> +which output can already be found in the Shared State cache.
>>> s/which/whose/
>>
>> I thought that "whose" was only meant to refer to living things. Would
>> you have a rule supporting what you're proposing?
> Whilst it isn't technically correct, it has been used since medieval times :)
>
> https://www.merriam-webster.com/words-at-play/whose-used-for-inanimate-objects


Thanks for the clarifications. I now understand that my usage of "which"
in this context (instead of "whose") was just wrong. That's a bit
embarrassing, but I'm happy to be corrected.
Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


