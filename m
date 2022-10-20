Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E88C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 08:35:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7336.1666254905145594850
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 01:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QvXW+7kl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0847F1C0019;
	Thu, 20 Oct 2022 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666254903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DMCXgru/Pb3OGwVFclkahxusIeWinTEORYfCX1tGHAI=;
	b=QvXW+7kl/WOyr2JgnnMwfdB3qL7BRVkIk2au0aNgfLkD1AO6yCu+7mNxjdP/8NPSXAj4Cb
	yTo/Wd7P6A/rjebMUIuMHULXQea2M6BPQ6PuldU5CMzWCxhvmH7/RdyiHuew2EBQ5G8hYd
	vQ4d6Nhtq+pUZrzrCbizTnWE7kHTrfN0QQ9KWMLCiEZ6fxAZjJXDKDVOdBKY56T77uGcVp
	77e8w5Ut9xl8LR5szod3jUMiUWstM/ccoLwlw4H9XcwSZr0og1ETjMOnFS41Z5SZP3k5Zz
	d2HvooNt7gX9rqSnXdt5DEAUiq/+pzprVPAdHizcqzLA24bG7sVVNWW3Mx60Aw==
Message-ID: <9574657b-9f63-2014-36f0-1a37dc3be90d@bootlin.com>
Date: Thu, 20 Oct 2022 10:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: updates for building on Windows (WSL 2)
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221019132402.48293-1-michael.opdenacker@bootlin.com>
 <d9f68cd9-8e66-dc20-b86b-3248c03bfed1@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d9f68cd9-8e66-dc20-b86b-3248c03bfed1@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Oct 2022 08:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3393

Hi Quentin,

On 10/20/22 10:14, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 10/19/22 15:24, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> - Use the Wikipedia naming scheme: WSL 2 instead of WSLv2
>> - Take into account Windows Server 2019 and 2022 which are
>>    supported too.
>> - Improve some explanations
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/brief-yoctoprojectqs/index.rst  | 17 ++---
>>   documentation/dev-manual/start.rst            | 70 +++++++++----------
>>   documentation/overview-manual/yp-intro.rst    | 17 ++---
>>   .../ref-manual/system-requirements.rst        | 10 +--
>>   4 files changed, 50 insertions(+), 64 deletions(-)
>>
>> diff --git a/documentation/brief-yoctoprojectqs/index.rst 
>> b/documentation/brief-yoctoprojectqs/index.rst
>> index 7ae0ddc349..0dfb4cc7ff 100644
>> --- a/documentation/brief-yoctoprojectqs/index.rst
>> +++ b/documentation/brief-yoctoprojectqs/index.rst
>> @@ -25,18 +25,11 @@ build a reference embedded OS called Poky.
>>         in the Yocto Project Development Tasks Manual for more
>>         information.
>>   -   -  You may use Windows Subsystem For Linux v2 to set up a build 
>> host
>> -      using Windows 10.
>> -
>> -      .. note::
>> -
>> -         The Yocto Project is not compatible with WSLv1, it is
>> -         compatible but not officially supported nor validated with
>> -         WSLv2, if you still decide to use WSL please upgrade to WSLv2.
>> -
>> -      See the :ref:`dev-manual/start:setting up to use windows
>> -      subsystem for linux (wslv2)` section in the Yocto Project 
>> Development
>> -      Tasks Manual for more information.
>> +   -  You may use version 2 of Windows Subsystem For Linux (WSL 2) 
>> to set
>> +      up a build host using Windows 10 or 11 or Windows Server 2019 
>> or 2022.
>
> Matter of personal taste but I would have written:
> Windows 10, Windows 11, Windows Server 2019 or Windows Server 2022
>
> We could probably even say
> Windows 10 or later, or Windows Server 2019 or later
> since that's currently true and may lower the documentation 
> maintenance burden (provided Microsoft keeps on shipping WSL 2 in 
> later versions, but time will tell :) ).


I go for this last one, thanks!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


