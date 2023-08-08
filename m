Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B07AC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 13:38:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.61742.1691501904743265591
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 06:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZqEdBf89;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6AD91C0006;
	Tue,  8 Aug 2023 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691501902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jA+j2hOgkmEvfaJDa0X7xssMJofjDZ05VZ4N47ivFk=;
	b=ZqEdBf89KAMXgSCfkpyfOlf72zqMUgK6qUydk0sBfWY4wbmgvvcSZ7DlH4Ylft93Zvi7Hx
	fUzImw5sX4mRZqKSAjhSqGfD0eSYGPt1s5IejBCbHGVlVuG0jKy8tl1Ykbj92l1E9bpzQA
	hhReWElqEVbdOZ59pBH39ciy1XbEaKPTemyOaOnNwnNB9KG+umQ7Fdm8IsmLMJTNK0ktLn
	Hais9OIQgA7CPWdKi41vZuKfkioMQYSeLhZCmvbMsUVMSX6H3ixo0ao+fOQbYsWU3FkP+e
	CXb8VdWqJ2+QQkb63yuZ4BJ/wzF2Zk2wzD2PHVvCHL8NIcvKnXgjZgIS8qjtuQ==
Message-ID: <c154116a-2f15-4916-43a2-21b29d3299d7@bootlin.com>
Date: Tue, 8 Aug 2023 15:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] [dunfell] ref-manual: ref-system-requirements:
 update supported distros
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <17795DC4E16ECCFB.9264@lists.yoctoproject.org>
 <149547d8-bb0b-2569-31d4-1c0eab6c8941@bootlin.com>
 <8eafcde8e0abd24543149f0feafeb117c920531c.camel@linuxfoundation.org>
 <5dc9ec45-9f35-5fd7-1e18-dffc407471e9@bootlin.com>
 <136841883b4313132d707b8477dccb26e37e9404.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <136841883b4313132d707b8477dccb26e37e9404.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Aug 2023 13:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4117


On 08.08.23 at 15:24, Richard Purdie wrote:
> On Tue, 2023-08-08 at 15:22 +0200, Michael Opdenacker wrote:
>> Hi Richard,
>>
>> Thanks for your reply and patience :)
>>
>> On 08.08.23 at 11:56, Richard Purdie wrote:
>>> See my previous answer. You can see here:
>>>
>>> https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py#n166
>>>
>>> that dunfell is being tested on anything up to fedora37.
>> Sure, but what about Mickledore and master? In this file, "fedora37" is
>> only associated to Kirkstone and Dunfell.
> If it isn't listed, there isn't a restriction yet, i.e. all workers.


All right, I get it at last, thanks!

>
>>> The autobuilder list of workers:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/workers
>>>
>>> shows we have f37 and f38 workers so we only test dunfell on fedora37
>>> at this time.
>>
>> Right! So, should I send updates to fix the SANITY_TESTED_DISTROS
>> settings for Kirkstone and Dunfell? Otherwise, such information is
>> outdated and the documentation derived from it is incorrect.
> Yes please.


Sure, will do!
Thanks again
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


