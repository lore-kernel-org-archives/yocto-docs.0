Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F49E6FE27
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:13:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.21263.1695388373359548301
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 06:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XgUWEHLU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8375E0006;
	Fri, 22 Sep 2023 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695388371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHs2ZjUWHrucG8iMc/47M1ZADWynlGudhWDLeBNXpUk=;
	b=XgUWEHLUKi08iEw00Je0stcQHIGiRViGFCFYyZiZddE2r24OxWm7WJtLIsDFDRwQDe7vO6
	buQTogHllOyWQ7UUz0e0WeVBJEowH0POdZ3XDx7ZAFRmU1tBQOloVM7Cu/Ns8Wq+YaMluR
	VG1BwgXFXJrVBNvLnoWYbZ+41JYxsoFxuyAvswoF4ocPcwHmef54B4xcGFs2oNrdiCWw+w
	e4pdZ8AiXWb2BxhwIN8WdLkGjroOiKs8fd3yuFUKM3G4tdXM97Jp0dt9CTV5M2nsDiBwVU
	74wgtVwUcUUy/vyywHn6JJN2DorKVWyXIvHJ/CWg82i/eFDqHAQxC7exeVC+XA==
Message-ID: <c4001c29-54cc-d725-b276-298759bcbfba@bootlin.com>
Date: Fri, 22 Sep 2023 15:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH v2 3/5] contributor-guide: discourage marking
 patches as Inappropriate
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
References: <20230922100006.756477-1-rhi@pengutronix.de>
 <20230922100006.756477-3-rhi@pengutronix.de>
 <17873AA66CC55BF8.23138@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17873AA66CC55BF8.23138@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Sep 2023 13:13:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4295


On 22.09.23 at 15:11, Michael Opdenacker via lists.yoctoproject.org wrote:
>
> On 22.09.23 at 12:00, Roland Hieber wrote:
>> It was never really clear what all those reasons really meant, and every
>> patch submitted upstream liftens the maintenance on the Yocto side.
>> So remove the current list, and replace it with two reasons in which an
>> upstream submission likely won't benefit the upstream project.
>>
>> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
>> ---
>> PATCH v2:
>>   * fix list syntax
>>
>> PATCH v1: 
>> https://lore.kernel.org/yocto-docs/20230920100647.1038583-3-rhi@pengutronix.de/
>> ---
>>   .../contributor-guide/recipe-style-guide.rst  | 30 +++++++++----------
>>   1 file changed, 14 insertions(+), 16 deletions(-)
>>
>> diff --git a/documentation/contributor-guide/recipe-style-guide.rst 
>> b/documentation/contributor-guide/recipe-style-guide.rst
>> index b574e6cb53a1..77e8910dabbb 100644
>> --- a/documentation/contributor-guide/recipe-style-guide.rst
>> +++ b/documentation/contributor-guide/recipe-style-guide.rst
>> @@ -299,22 +299,20 @@ following status strings:
>>     ``Inappropriate [reason]``
>>      The patch is not appropriate for upstream, include a brief 
>> reason on the
>> -   same line enclosed with ``[]``. The reason can be:
>> -
>> -   -  ``not author`` (you are not the author and do not intend to 
>> upstream this,
>> -      the source must be listed in the comments)
>> -   -  ``native``
>> -   -  ``licensing``
>> -   -  ``configuration``
>> -   -  ``enable feature``
>> -   -  ``disable feature``
>> -   -  ``bugfix`` (add bug URL here)
>> -   -  ``embedded specific``
>> -   -  ``other`` (give details in comments)
>> -
>> -The various ``Inappropriate [reason]`` status items are meant to 
>> indicate that
>> -the person responsible for adding this patch to the system does not 
>> intend to
>> -upstream the patch for a specific reason.
>> +   same line enclosed with ``[]``. In the past, there were several 
>> different
>> +   reasons not to submit patches upstream, but we have to consider 
>> that every
>> +   non-upstreamed patch means a maintainance burden for recipe 
>> maintainers.
>> +   Currently, the only reasons to mark patches as inappropriate for 
>> upstream
>> +   submission are:
>> +
>> +   -  ``oe specific``: the issue is specific to how Yocto performs 
>> builds
>> +      or sets things up at runtime, and can be resolved only with a 
>> patch that
>> +      is not however relevant or appropriate for general upstream 
>> submission.
>> +   -  ``upstream ticket <link>``: the issue is not Yocto-specific 
>> and should be
>> +      fixed upstream, but the patch in its current form is not 
>> suitable for
>> +      merging upstream, and the author lacks sufficient expertise to 
>> develope a


s/develope/develop/
FIx too (forgot to report it).

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


