Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C7AEE14D0
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:30:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.8969.1694079034045011283
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 02:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pc9Q8yqC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 217C6E000F;
	Thu,  7 Sep 2023 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694079031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cK5bP7Vnz4qklNgnyEUL/cmJBgAUS8SKPVARBQ4rxpM=;
	b=pc9Q8yqCG2B9OfI/Sb2+24n4J6mjFXiwYk4JwdP8QdJbyV2RMBZKtbd6hBMnZaErkEg7ns
	ymL4bA88R3gcH5uj+L6U9Uy58aVEVDxrFhzOMASKov1NnOfnnzPA+hjgyfcRvAUq2aJkJK
	fpVj/UBkkugj49pyu21dPyPeNXO4KA+QG6wwuVo6PYvBRlIz8A7v9Huh4t+AMA3q11Zg3B
	cNcXJMJ5C5iGbgRw/AzEc5fHVLNv4yP90b6fRqnifoIBCm+Y5sZ5nMhqEiHOCoIIdEwDGQ
	SnjrmnMKmo+Jq9BWYPW42HSO+jzUZup1KQo8Cdn710y308B+v15UJ1uRZA1HNw==
Message-ID: <fa7af236-0ee5-5168-7f1e-081ea599a633@bootlin.com>
Date: Thu, 7 Sep 2023 11:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] README: Update to point to new contributor guide
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230830154445.2017109-1-richard.purdie@linuxfoundation.org>
 <178240FF833870F4.2662@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <178240FF833870F4.2662@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Sep 2023 09:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4200


On 06.09.23 at 10:11, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Richard,
>
> On 30.08.23 at 17:44, Richard Purdie wrote:
>> Now we have a contributor guide combining various wiki pages, point at
>> that and tweak to match our other READMEs.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   README | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/README b/README
>> index 85d8d837b..dfbf7bf0e 100644
>> --- a/README
>> +++ b/README
>> @@ -10,23 +10,22 @@ An online version of the documentation can be 
>> found at:
>>   Contributing
>>   ============
>>   -See 
>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>> -for generic guidelines for configuring Git and preparing patches.
>> +Please refer to our contributor guide here: 
>> https://docs.yoctoproject.org/dev/contributor-guide/
>> +for full details on how to submit changes.
>
>
> Thanks for the update and fixes.
> However, let me first add the current version of the contributor guide 
> to the mickledore branch, so that we can refer to this guide through 
> its final URL:
> https://docs.yoctoproject.org/contributor-guide/
>
> Then, I'll update and merge your change.


Done
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Thanks again
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


