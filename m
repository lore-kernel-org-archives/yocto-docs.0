Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F076C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 16:47:00 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.8930.1654706817334467469
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 09:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jzLu6jpf;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EE3F1240007;
	Wed,  8 Jun 2022 16:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654706815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhtNsRhaL6gc1nnoxcRZV9BbmT9Uq+Ib2CYDcSx2fEg=;
	b=jzLu6jpfXK6Ck1hc6Yfa7jo5gy3TzavrVxuFa7OEUuyNQD+gSwpeiiADGD2Quc/9JO/VOw
	TqcP3bbZUFlb562g024Afmyodv89Uwdhm0matUV/vEBGBeSUmpoEflh4Ae8YBYnVmdhnw9
	k/ob5UGDLFOV+BPUdIjGuQmaOLqkI3KVpG+bth3k7UEveCxs8aSUUOFmTZGcU2OqjvRbXP
	HjTLIsy058vYMjlJg8+eQfqVXg40jAuCxxXeUomJMdiipVtqu6zWw7C3bZmPb55HwcVyDO
	TiujVjbm6LCQjg2Sf+6qbPX6IiqWffwPT2EM2il8snA6hUdxtVB9Y08TvoFIRw==
Message-ID: <23a1213a-0753-6b13-e0af-360bf695eb57@bootlin.com>
Date: Wed, 8 Jun 2022 18:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] docs: releases: move hardknott and honister to
 outdated section
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org,
 Michael Halstead <mhalstead@linuxfoundation.org>
References: <20220603133353.506482-1-foss+yocto@0leil.net>
 <a67c00b5-20a9-fd64-66ed-fc0e040f2999@theobroma-systems.com>
 <a0058bb37f8f05cc7b9775c40c44dceee3bcb15a.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <a0058bb37f8f05cc7b9775c40c44dceee3bcb15a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jun 2022 16:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2971

Richard, Quentin,

On 6/7/22 12:22, Richard Purdie wrote:
> On Tue, 2022-06-07 at 11:02 +0200, Quentin Schulz wrote:
>> Richard, Michael(s),
>>
>> I have been working on automating this release page so we don't have to
>> maintain it (I stumbled upon it by chance).
>>
>> The issue I'm having right now is that we are missing a handful of tags
>> in yocto-docs which makes it non-straightforward to order the releases.
>>
>> +# list missing tags in yocto-docs
>> +missing_tags = [
>> +        'yocto-0.9',
>> +        'yocto-1.0', 'yocto-1.0.1',
>> +        'yocto-1.1', 'yocto-1.1.1',
>> +        'yocto-1.2',
>> +        'yocto-1.4.4', 'yocto-1.4.5',
>> +        'yocto-1.5', 'yocto-1.5.2', 'yocto-1.5.3', 'yocto-1.5.4',
>> +        'yocto-1.6', 'yocto-1.6.1', 'yocto-1.6.2',
>> +        'yocto-1.7', 'yocto-1.7.1',
>> +        'yocto-1.9',
>> +        'yocto-2.5.3',
>> +        'yocto-3.1', 'yocto-3.1.1', 'yocto-3.1.2', 'yocto-3.1.3',
>> +        ]
>>
>> Those seems to be the only missing tags (didn't check really carefully
>> though, so might be missing one or two).
> If someone can work out the commit for each of the tags we can
> definitely tag them. We should be able to work that information out, it
> is just a bit of a pain to do.

I could pickup a commit whose date matches the date for each release, as 
found on http://downloads.yoctoproject.org/releases/yocto/.
I wouldn't be 100% sure to pick up exactly the right commit, but would 
we care, since we are not going to use the tags to regenerate the old docs?

Then, I could create the tags and push them.

Any better way? As far as I've seen the old release notes didn't mention 
the documentation sources.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


