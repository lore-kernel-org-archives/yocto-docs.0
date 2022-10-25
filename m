Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D818BFA3740
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 20:12:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2915.1666728714164043630
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 13:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oc/ekLkv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 071C9E0005;
	Tue, 25 Oct 2022 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666728712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ol4F1Km8lX5229KLuCe1m7+A19qI5UTbt1HcevAcT/I=;
	b=oc/ekLkvngBdPMRUEkDVanUSnaseEDNTYt6AZOq/UhEfWjOc/7Eatl5BVXFHebnLaPzMeH
	4N+4qoA4KZWV26jAbodv3eeBhN8kZDutVjwebwg3FH6wU+z4OME/feprFBhlNbgXjKUIQz
	TLSqu3iTkZmhCKpXHyyGUENs4vehAwCVouMuiamySLzGHRbGGfPXwPhHhI0qzowscyUn1O
	NhYaY7byF/53VPLLYazDyKU8Bjk2SfwA+7S7lgYHm0C9VTWEC5IOdVl0y8lcLqRjfyF8YW
	R5DrwqNAUDzJBuskK0gPMFeP3vEkyFk9fELSkJmlWnxFLin/AxRaU8XElBx7RQ==
Message-ID: <afc1929a-432a-2688-7a9e-445fad7165b2@bootlin.com>
Date: Tue, 25 Oct 2022 22:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC PATCH] ref-manual: document create-spdx class and
 variables
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
References: <20221025160014.2858893-1-michael.opdenacker@bootlin.com>
 <CAJdd5GbVCX5hbBns_n_2N066zB07MWukcws+SJtqbt4kLKW36g@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAJdd5GbVCX5hbBns_n_2N066zB07MWukcws+SJtqbt4kLKW36g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 20:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3405

Hello Joshua,

On 10/25/22 21:04, Joshua Watt wrote:
> On Tue, Oct 25, 2022 at 11:00 AM <michael.opdenacker@bootlin.com> wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst   | 11 ++++
>>   documentation/ref-manual/variables.rst | 71 ++++++++++++++++++++++++++
>>   2 files changed, 82 insertions(+)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>> index 1880e44486..5274dd20bd 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -376,6 +376,17 @@ support.
>>   The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
>>   SPDX SBoM documents based upon image and SDK contents.
>>
>> +This class is meant to be inherited globally from a configuration file::
>> +
>> +   INHERIT += "create-spdx"
>> +
>> +The output files are generated in ``tmp/deploy/spdx`` under the
>> +:term:`Build Directory`.
> The "important" SPDX document that gets generated is actually the
> image document that lives along side the image you built, e.g.
>
>   tmp/deploy/images/MACHINE/core-image-minimal-MACHINE.spdx.tar.zst
> (not sure the correct way to explain this path in the documentation)
>
> This archive is the compendium of SPDX that went into that image;
> notably it culls anything that didn't actually contribute to the
> images (e.g. packages built, but not installed are omitted).
>
> It would be good to point users there as the first stop instead of the
> individual SPDX documents since it's a "complete" SBoM for the image.
> The individual files are useful for some things, but probably not as
> interesting for people who "just want an SBoM" :)


Many thanks for these details! Everything makes more sense now. I was 
indeed distracted by tmp/deploy/spdx/.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


