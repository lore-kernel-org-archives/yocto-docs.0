Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE80C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 15:28:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.54548.1695050914630992151
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 08:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PQ+X0Xjz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D4D0E0006;
	Mon, 18 Sep 2023 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695050912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LLRPu3ezLy4DINRzvCZYRMrdBYq3wWZWCRmfTvhJ/hU=;
	b=PQ+X0XjzEo/N61TWpmqe35sPXBRGlhBCgQnEIp6XDcqJCIs9yxiXwc5DBKrIRl7c2W/5pi
	LmqoYQe7vHqiwNqQBdVYY8BuoN8BoD4UdTI2kICC9fvtsHvUCnOr03z9BQx+la6C6cNGDK
	vZrScBmJ2QSvUhBDcRikwcbay4vNlheC67fnv0cDrU+RFdG/Fe0RanMGtUloWeI1m/zgPO
	CHSCpVjVzIkiCCpY/HTwd5+NoBvW2LzYS6hqRc75BblnIe0B/QkT01EIERAqL84nd6zrMK
	rJvhoF6Ram+eNgBRtBk2jQ6mNNWe8W3PXqMYR++aTWidocdpbhjc+iP7FeLniQ==
Message-ID: <a7366b33-b6f2-a79b-9bc4-7b6ce8eaa310@bootlin.com>
Date: Mon, 18 Sep 2023 17:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: michael.opdenacker@bootlin.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] [PATCH] dev-manual: disk-space: improve wording for
 obsolete sstate cache files
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20230918150916.486857-1-michael.opdenacker@bootlin.com>
 <c98cbf98-0335-d559-6673-7348b4e4295c@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <c98cbf98-0335-d559-6673-7348b4e4295c@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Sep 2023 15:28:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4226

Hi Quentin,

Thanks for the review!

On 18.09.23 at 17:14, Quentin Schulz wrote:
> Hi Michael,
>
> On 9/18/23 17:09, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Replace "duplicate" by "obsolete", more appropriate.
>> "duplicate" probably comes from the "--remove-duplicated"
>> option of the sstate-cache-management.sh script.
>>
>> Improve other sentences too.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   documentation/dev-manual/disk-space.rst | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/documentation/dev-manual/disk-space.rst 
>> b/documentation/dev-manual/disk-space.rst
>> index a84bef4511..5b6702f594 100644
>> --- a/documentation/dev-manual/disk-space.rst
>> +++ b/documentation/dev-manual/disk-space.rst
>> @@ -23,12 +23,12 @@ final disk usage of 22 Gbytes instead of 
>> &MIN_DISK_SPACE; Gbytes. However,
>>   &MIN_DISK_SPACE_RM_WORK; Gbytes of initial free disk space are 
>> still needed to
>>   create temporary files before they can be deleted.
>>   -Purging Duplicate Shared State Cache Files
>> -==========================================
>> +Purging Obsolete Shared State Cache Files
>> +=========================================
>>     After multiple build iterations, the Shared State (sstate) cache 
>> can contain
>> -duplicate cache files for a given package, consuming a substantial 
>> amount of
>> -disk space. However, only the most recent cache files are likeky to 
>> be reusable.
>> +multiple cache files for a given package, consuming a substantial 
>> amount of
>> +disk space. However, only the most recent ones are likeky to be 
>> reusable.
>
> s/likeky/likely/


Oops, fixed!

>
> s/reusable/reused/

I was going to say that I prefer "reusable", but I guess you meant that 
the combination of "likely" and "reusable" is applying the possibility 
twice.

OK for "reused" too.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


