Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCA6C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:53:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.11749.1651247604430455021
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 08:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QlvtfLS7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 13B02FF805;
	Fri, 29 Apr 2022 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651247602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muAqzmBeffDiT5rX+GJz6qqeeAjLaAgiSN4cRWDVdhs=;
	b=QlvtfLS72cCSrCI1PP7b7ECYuHVZWXTJgZtSoFkHS48y2+xSMmHCi0fglrGOujzFBTpP9C
	hw4NLdfhJakNk6pTI2iPUZm18HeP0sQaTsXAfW1614hd9L7ZNeZWHUaRFHpCBvXJk5uyzt
	Xi/JlU7NpiqThLxzERqIkofZlCjgJPyNfINfProHVG50e6J0bqm5XyoTkVCirczdP9cCw9
	JcmbzpqAgGZYbrAhdQDGKwVNcAD6W/HWpuMKnsoSOG5t1Zw12CgT27Vv6QSnM1Qfvuc2VJ
	0LRDAa6g5qF7EP3xwPfsVPwgnenZnTLBV8jKZZcRhApjUsa71rt6T239LyWnSw==
Message-ID: <914939c4-3a8b-bf46-c3be-37494fb5b553@bootlin.com>
Date: Fri, 29 Apr 2022 17:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] docs: set_versions.py: remove hardknott from
 active releases list
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220428081706.526839-1-foss+yocto@0leil.net>
 <5438037befca4f22b78f0f8e45843891b2cd8345.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <5438037befca4f22b78f0f8e45843891b2cd8345.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Apr 2022 15:53:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2904


On 4/28/22 10:44, Richard Purdie wrote:
> On Thu, 2022-04-28 at 10:17 +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> Hardknott 3.3.6 is the last release of the series and the release is now
>> obsolete.
>>
>> Let's remove hardknott from the list of active releases.
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>  documentation/set_versions.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
>> index cd02cc739..c4be1ae41 100755
>> --- a/documentation/set_versions.py
>> +++ b/documentation/set_versions.py
>> @@ -23,7 +23,7 @@ ourversion = None
>>  if len(sys.argv) == 2:
>>      ourversion = sys.argv[1]
>>  
>> -activereleases = ["kirkstone", "honister", "hardknott", "dunfell"]
>> +activereleases = ["kirkstone", "honister", "dunfell"]
>>  devbranch = "langdale"
>>  ltsseries = ["kirkstone", "dunfell"]
> This was on my todo list, looks good to me, thanks!
>
> Cheers,
>
> Richard


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next"

Thanks for the patch!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


