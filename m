Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDAEC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 09:05:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.9844.1691053551599676463
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 02:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wn+ZuRga;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB13AE0003;
	Thu,  3 Aug 2023 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691053549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYva/sIELWOLdgwcq5fjG4gfedr432z0/KFVxTfqq9s=;
	b=Wn+ZuRgaLeCSu3rBQ2dDNTF45LDX7QRPFD4lew25rbp5Iz4oT2JJfvWqOHkYqpx6841xDk
	Hv5gHmCaYnYIdTNgMKNoeLZ0RdW7ylgCkziFc2kQF6Z5gilycb+W3FABaSxTTHw8a8v6RI
	3a5hxWCnh343+JZMtxFqyyW+7qu/HT7dsPSbT7KKLkQLqiweLmsoESIrgOm2KzWkcf1TpK
	icKLYRwS8xReMLP6ekFh8zbiMPhnMEoB9UrObGufubJACx6TTPcnV8BSfKSsCZ7Zd8Esrt
	NEg32LEsoLu8HWtKCmRd3KKX31t78S2U1Db2Yb+uPGfGnzjER0C/SBPfCdM7xQ==
Message-ID: <922ac1a0-2292-8a7f-e1b3-04df50651f54@bootlin.com>
Date: Thu, 3 Aug 2023 11:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: nd@arm.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC PATCH] WIP LICENSE_FLAGS_DETAILS documentation
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com, Ross Burton <ross.burton@arm.com>
References: <20230524163201.3630288-1-ross.burton@arm.com>
 <02d5ac9b-c4eb-0d60-d812-4128501d5473@bootlin.com>
 <5f1d69bc-496b-1a43-3b02-f73fa9ee3b38@theobroma-systems.com>
 <5bf9f81c-f72d-7af9-1446-a29fe887ac7b@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <5bf9f81c-f72d-7af9-1446-a29fe887ac7b@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Aug 2023 09:05:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4104

Hi Quentin,

On 31.07.23 at 11:08, Quentin Schulz via lists.yoctoproject.org wrote:
> Michael, Ross,
>
> On 6/22/23 18:15, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Michael,
>>
>> On 5/26/23 11:18, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> Hi Ross,
>>>
>>> On 24.05.23 at 18:32, Ross Burton wrote:
>>>> From: Ross Burton <ross.burton@arm.com>
>>>>
>>>> ---
>>>>   documentation/dev-manual/licenses.rst | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/documentation/dev-manual/licenses.rst 
>>>> b/documentation/dev-manual/licenses.rst
>>>> index 9629dc53293..805b40fd482 100644
>>>> --- a/documentation/dev-manual/licenses.rst
>>>> +++ b/documentation/dev-manual/licenses.rst
>>>> @@ -123,6 +123,13 @@ name and version (after variable expansion)::
>>>>      LICENSE_FLAGS = "license_${PN}_${PV}"
>>>> +It is possible to specify where to find more details for a 
>>>> specific license
>>>> +using flags on the :term:`LICENSE_FLAGS_DETAILS` variable:
>>>> +
>>>> +  LICENSE_FLAGS_DETAILS[my-eula-license] = "https://example.com/eula"
>>>> +
>>>> +If set, this will be displayed to the user if the license hasn't 
>>>> been accepted.
>>>> +
>>>>   In order for a component restricted by a
>>>>   :term:`LICENSE_FLAGS` definition to be enabled and included in an 
>>>> image, it
>>>>   needs to have a matching entry in the global
>>>
>>>
>>> Thank you for starting this.
>>> I'll get back to it when support for LICENSE_FLAGS_DETAILS is merged.
>>>
>>
>> I believe it's merged now? c.f. 
>> https://git.openembedded.org/openembedded-core/commit/?id=cb5cdcaf3310e889e80861ccfaf46c1bce624ac1
>>
>> Maybe we would also benefit from an entry in the variable glossary 
>> for this one?
>>
>
> Any feedback to give on this RFC patch now that it's merged?


Thanks for the reminder. I'll take care of it in the next days.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


