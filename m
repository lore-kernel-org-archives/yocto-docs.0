Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD31C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:50:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.10375.1698421828811790316
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 08:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=llMxRNqO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDD031C0011;
	Fri, 27 Oct 2023 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698421827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6GwWRa9rPYavEfP0NZbiuJRl7VzS1W/L3PbENNi/VE=;
	b=llMxRNqO+jTDBO1kaGD5+CZuKobR5IeLhAuEAcjrCZIYAhBg2Qq56s2INv/+knnQPSdv6Q
	hM2NV/hwBuQ1JnvMI5CVU4xzMRzpwWeXrZqKM5ooQNd+dU6+QQjRMLXTf+QCRylg/EHL4+
	5PSuMKbaOKp64OCTwW7lyOxpGRNZtP4BmkDT5j04cW3kvwMpwfONG1lk2TvyM4JsDqMi+s
	/ld/wjJSkGVZlQJr4bus4IrFfhz8eCwvv6wJMePPEk0+R190GJPzENRih3QMLcdLqHbi4h
	Hk+3J4sU1kkFAoecxeJ1FERE7j+E6AbkYO3MPAdwck8XZBXvPf5JNIDjZFyT0g==
Message-ID: <3e5aa494-8541-40b3-b2b9-bc6dc8074b24@bootlin.com>
Date: Fri, 27 Oct 2023 17:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: updates for 4.3
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <1791F57D905EEBD5.3183@lists.yoctoproject.org>
 <e3ad6981-b0cb-4d91-9ee6-c9b4df114bff@bootlin.com>
Organization: Bootlin
In-Reply-To: <e3ad6981-b0cb-4d91-9ee6-c9b4df114bff@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 15:50:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4518

Hi Paul,

On 27.10.23 at 14:10, Michael Opdenacker wrote:
>
> On 27.10.23 at 14:07, Michael Opdenacker via lists.yoctoproject.org 
> wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> CC: Paul Eggleton <bluelightning@bluelightning.org>
>> ---
>>   .../migration-guides/migration-4.3.rst        |  6 ++++
>>   .../migration-guides/release-notes-4.3.rst    | 30 +++++++++++++++++--
>
>
> By the way, I'm checking commits one by one. Currently at:
> 2023-06-17 selftest/reproducible: Allow chose the package manager
> <https://git.yoctoproject.org/poky/commit/?h=nanbield&id=88abdec715ed0c1f613c9b5132cd45db741d5c65>(https://git.yoctoproject.org/poky/log/?h=nanbield&ofs=1350) 
>
>
> 1350 to go ;-)


By the way, if you have time to contribute to the release notes (which 
would be great, as I am likely to miss significant changes), please 
submit them against "master-next", which is where I keep my recent changes.
Thanks :)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


