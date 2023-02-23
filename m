Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4541C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 09:57:18 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.7188.1677146236708009920
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 01:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mR0YVETO;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F30FE100013;
	Thu, 23 Feb 2023 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677146234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mwm0HY2EOS/422MOJmqiQ7Q8Nsb8+wCOvaZLnGhJUrU=;
	b=mR0YVETO9Wi4/9wUQNyl7n0Cn+qkYf4XBZOhiwD6nB6mgjNfwm7cwB/C6UkZ6sdUk05rlJ
	Fce3LCPNWGADbokUR5w2122iQKlwJrHJvv5KlTQO7lPDz/T2OlKhRkAzyZIgtZq09gi0Lx
	upv88rPbfuz6LwheaulvPshWZT6GriTqifbkXhY+nTm3MdOxmp54nu0RAIbmQcxn0d7e2G
	FCcyKU2lOIF8yf++B5eT7StTbuq3Pze3ZXV9vHuaZHcxhH9ZsZYW/UCrvk5YLHIrvWuJ/p
	zKn4xi7fEwNo3dQockZR2TGRKRk90hmknjbjBinIOCl9++qr0jUcJKvK5BS4bw==
Message-ID: <54b9159e-3549-8593-9bc7-11f327baf09b@bootlin.com>
Date: Thu, 23 Feb 2023 10:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] manuals: document
 COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <3891ece8-e2e3-1e37-a372-dd88a7bbabf7@theobroma-systems.com>
 <20230221184156.65816-1-michael.opdenacker@bootlin.com>
 <9a2b7892-fdd6-362b-3950-5c216dd3ed66@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <9a2b7892-fdd6-362b-3950-5c216dd3ed66@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 09:57:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3721

Hi Quentin,

On 22.02.23 at 14:49, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 2/21/23 19:41, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> - Add COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables to the
>>    variable index.
>> - Clarify that these plugins are still open-source
>> - Improve line width
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> ---
>>
>> Changes in V2:
>> - Style fixes
>> - Highlight that the "bad" status is according to GStreamer contributors
>> - Add a new "gstreamer-commercial-licenses" target so that we can refer
>>    to the modified section without hardcoding the title and the manual
>>    name in the reference. That's more resistant to changes.
>> According to the review from Quentin Schulz (thanks!)
>> ---
>>   documentation/dev-manual/licenses.rst  | 32 +++++++++++++++-----------
>>   documentation/ref-manual/variables.rst | 18 +++++++++++++++
>>   2 files changed, 37 insertions(+), 13 deletions(-)
>>
>> diff --git a/documentation/dev-manual/licenses.rst 
>> b/documentation/dev-manual/licenses.rst
>> index 65914e5efe..91a2ebce81 100644
>> --- a/documentation/dev-manual/licenses.rst
>> +++ b/documentation/dev-manual/licenses.rst
>> @@ -232,6 +232,8 @@ Here are some other scenarios:
>>      in the :term:`LICENSE_FLAGS_ACCEPTED` list (e.g.
>>      "commercial_foo_1.2") to specifically match a versioned recipe.
>>   +.. _gstreamer-commercial-licenses:
>> +
>
> My bad, I thought there were more examples, unrelated to GStreamer, in 
> the "Other Variables Related to Commercial Licenses" section. But here 
> I don't think it makes much sense to add this target actually since we 
> already have some automatically added by sphinx for sections/subsections.
>
> Otherwise,
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


I'm not sure I understand, because the idea to use references to targets 
without referring to the document name made sense to me.

Here's a V3 anyway, that may help clarify any misunderstanding.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


