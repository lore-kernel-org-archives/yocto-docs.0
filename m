Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211C7C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 13:33:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.31175.1698931991850129029
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 06:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aNFPOxiI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2A941C0004;
	Thu,  2 Nov 2023 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698931990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3qWp/yjmZteZwJoeOLdqfVzfTJWf07fJa+rr6NfFCI=;
	b=aNFPOxiItxssJFTlNAknsFovzAitsh2n7U0hZItVJwckJxqQ7RO82FZPpyhETagPeYsUZJ
	Hr0io7gq0dxCVmUa3FhqDW0MwfwzYOfSmOI1w583dPTGkPAaEQUpvECwstI7uDHqz3CtPu
	Ye1zT/dL8nHjJPX126b9HSytO/z9CoFM+ADEh52scc6mnAqp70p/01Sfc3x3zDjRu9Oyrh
	N6BIAoawj3w5QAw+GyMeb/M2SAPWPieWamWg13b34kEswlxpRucVwEW4o7awjJGDLpGl6V
	pfraHwmhm+yPuKcyrK6/5QOEtuecYYC5Z1h/Ll7P41iaIG9xNPwenIvvMD5EDA==
Message-ID: <93ce011b-3b29-463b-97fc-b905d2812f9b@bootlin.com>
Date: Thu, 2 Nov 2023 14:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 "Michael Opdenacker via lists.yoctoproject.org"
 <michael.opdenacker=bootlin.com@lists.yoctoproject.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document KERNEL_LOCALVERSION
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
References: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
 <1793C5EB6ECDE964.11290@lists.yoctoproject.org>
 <6rfs1otqt6.fsf@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6rfs1otqt6.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 13:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4571


On 02.11.23 at 11:01, Ulrich Ölmann wrote:
> On Thu, Nov 02 2023 at 10:55 +0100, Ulrich Ölmann <u.oelmann@pengutronix.de> wrote:
>> Hi Michael,
>>
>> just a small typo, otherwise a good description.
>>
>> On Fri, Oct 27 2023 at 11:29 +0200, "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Introduced by
>>> https://git.yoctoproject.org/poky/commit/?id=66ed174ccdf7a89cb998f503cc6b631e2d1adcc0
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> ---
>>>   documentation/ref-manual/variables.rst | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index 03234d3f78..771eb91af6 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -2485,6 +2485,16 @@ system and gives an overview of their function and contents.
>>>         external tools. See the :ref:`ref-classes-kernel-yocto` class in
>>>         ``meta/classes-recipe`` to see how the variable is used.
>>>   
>>> +   :term:`KERNEL_LOCALVERSION`
>>> +      This variable allows to appends a string to the version
>> s/appends/append/
> Urgs, it's better to read the whole thread before replying - this has
> already been addressed before. Sorry for the noise!

No problem, I sometimes do this too.
Thanks for the review anyway!
Cheers
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


