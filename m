Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9167FC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 08:06:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.18972.1683878756654835176
 for <docs@lists.yoctoproject.org>;
 Fri, 12 May 2023 01:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eN8C1NZi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 529E1E0003;
	Fri, 12 May 2023 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683878754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJHAQkYM9CqZ9W0qMZn4gai4PRxECDjeoqNSPQ7h/FQ=;
	b=eN8C1NZiUEr7X+CsChfjJbQ8xZOuVPtAAkFmGbHatWs/joa1wsacNaHm3jog92FaW3yLxy
	bjV2GZiNChs0nLWhOGgP4XthiDURLs6kMX4dtk0q8JnjWt9voS19VnfrB696i6ZZiKlTjv
	RPwkGaT55b3FB1GaArS73bNEC1FzQYdPUjKrIwcQQd9An9C4yAF5fnipHtYmO+OlQ7HfY8
	QFVNnIrNYNs7xhpi6+GQ3CvIEQMh1D0t+FZt9gwDTDmz8bRXw7pDrbm4oYszOSYV8zwsdZ
	6ru7SkyEk+4Dcka8cSi+LgfX5Cyyhpt9lvbkukNu/ry1vWq8no114Bj8fz5ZEQ==
Message-ID: <89950193-e9bd-4470-9f97-55e2f60525d6@bootlin.com>
Date: Fri, 12 May 2023 10:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] ref-manual: improve description of kernel-fitimage
 variables
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>
References: <20230511161140.2387483-1-michael.opdenacker@bootlin.com>
 <d540bdcf-5035-c16f-1118-ef80ab4358e0@seco.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <d540bdcf-5035-c16f-1118-ef80ab4358e0@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 May 2023 08:06:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3934

Hi Sean,

Many thanks for the review!

On 11.05.23 at 20:43, Sean Anderson wrote:
> On 5/11/23 12:11, michael.opdenacker@bootlin.com wrote:
>> [You don't often get email from michael.opdenacker@bootlin.com. Learn why this is important at https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2faka.ms%2fLearnAboutSenderIdentification&umid=518cf34e-efd1-4968-94ed-83b8c8896b6c&auth=d807158c60b7d2502abde8a2fc01f40662980862-ebaf0a6579314efc58145c5fef613fa0b2d5e7d3 ]
>>
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> - Mentioning that they are related to this class
>>    (for further information about their usage)
>> - Replace "fitImage" by "FIT image"
>> - Minor formating and style fixes
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> CC: Jamin Lin <jamin_lin@aspeedtech.com>
>> CC: Sean Anderson <sean.anderson@seco.com>
>> ---
>>   documentation/ref-manual/classes.rst   |   4 +-
>>   documentation/ref-manual/variables.rst | 105 ++++++++++++++++---------
>>   2 files changed, 68 insertions(+), 41 deletions(-)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>> index 94b6a3ebd7..2f96ffb82f 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -1582,13 +1582,13 @@ The :ref:`ref-classes-kernel-devicetree` class, which is inherited by the
>>   ===================
>>
>>   The :ref:`ref-classes-kernel-fitimage` class provides support to pack a kernel image,
>> -device trees, a U-boot script, a :term:`Initramfs` bundle and a RAM disk
>> +device trees, a U-boot script, an :term:`Initramfs` bundle and a RAM disk
> If we're being pedantic, it's "U-Boot." All these variables should really be U_BOOT_... too, but that ship has sailed.
Yes, things can be complicated to change once they have been deployed :|
>
> Reviewed-by: Sean Anderson <sean.anderson@seco.com>


Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


