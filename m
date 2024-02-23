Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223CEC54E4C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7730.1708683491168423683
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 02:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GqltulQI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 291EFC0011;
	Fri, 23 Feb 2024 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708683489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3W6yy12g02DSVWahV1/Ktb3rxeBJonlFkKeh+PTVJ5M=;
	b=GqltulQIJBDgAKe61HVPXCU5C9VGiI957abL2EPcoWaeuiNl6FTPgHs0yyQdOTWOARs4dk
	lSfciK1YxBalFepDulaCYJycRaaiLaF6zyZiSQ0ad0Qp21Ly6mHdzI8rzgHEvFGV2PYhhe
	0QekBd6GbEittqnjaWYGp/x7s/KVjYs0nuszODwzA3DXD7KYctsXlQ5izjX7UNQv35fRqW
	JO3QqEb5A3Muv2UBT8b1bAuEVY5yRS3cOBicuEBr8YPlCrTmefmJ7fxJB+bDuVSZA0u2xA
	MXPMnWiNCW5OJjeolu6tHD2ro8RIyxKyLRF+2W/hIuHA/Hvw0/O0u+zIY30jkA==
Message-ID: <795e8e0a-34ea-4a94-bd50-6fc6a4b32054@bootlin.com>
Date: Fri, 23 Feb 2024 11:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] documentation: add documentation of the
 variable SPDX_NAMESPACE_PREFIX
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: belouargamohamed@gmail.com
References: <20240214215237.151434-1-m.belouarga@technologyandstrategy.com>
 <79156a5c-b233-4940-88f1-a5d04e4f9920@bootlin.com>
Organization: Bootlin
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
In-Reply-To: <79156a5c-b233-4940-88f1-a5d04e4f9920@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 10:18:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4860

Hi Mohamed,

On 2/15/24 at 10:55, Michael Opdenacker wrote:
> Hi Mohamed,
>
> On 2/14/24 at 22:52, belouargamohamed@gmail.com wrote:
>> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>>
>> The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
>> This variable is used to change the prefix of some links in SPDX docs.
>>
>> [ YOCTO #15398 ]
>>
>> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>> ---
>>   documentation/ref-manual/variables.rst | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst 
>> b/documentation/ref-manual/variables.rst
>> index 6f7d6ff01e..907575ba82 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7913,6 +7913,11 @@ system and gives an overview of their function 
>> and contents.
>>         image), compared to just using the 
>> :ref:`ref-classes-create-spdx` class
>>         with no option.
>>   +   :term:`SPDX_NAMESPACE_PREFIX`
>> +      This option could be used in order to change the prefix of 
>> ``spdxDocument``
>> +      and the prefix of ``documentNamespace``. It is set by default to:
>> +      ``https://spdx.org/spdxdocs`` .
>> +
>
>
> This looks good to me, thanks!
> However, I have to wait for your first patch to be merged to merge 
> this one, otherwise the default value is incorrect.
> Don't hesitate to ping me if necessary.
>
> As a separate patch, you may also mention this variable in the 
> description of the "create-spdx" class (ref-manual/classes.rst). 
> Otherwise, people may overlook this variable, if it's not referred to 
> from any other place.


Any news about the first patch? Don't hesitate to get back to me when it 
is merged.
Another possibility, if the first patch doesn't make it, is to add the 
change without mentioning the default value.
I'll be glad to do it in case you don't have time at the moment.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


