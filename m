Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38F7C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 14:30:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.8685.1667917822160804549
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 06:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Du3xa4w7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 968B9FF817;
	Tue,  8 Nov 2022 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667917820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAXgVC9xGeaH5fs3M9XMNjbagY5rjY/KmmjtzmZDP6o=;
	b=Du3xa4w7X8Xlmi91spgYpp+Mp2/sTamo/d4tDyTZaKexJodn4so2Rcgujhr4Xis7sgcoRl
	wAcfB5OUOqWPJQd3l5LI0/z3CKRGQXEWQC2s9+y1SLpX1qKIFZ6LaeliVZf7WysOLH3o4+
	oWktCnBrrgqddCRsmUxqUkk1DcRbO8e9JHh6/4DGfRq2R0OwOdIzuVSFrDrkXppvNdb1eK
	64svUbYkm4zPDz+qCnJrENaU6hsEzDqoZOXrg6XD2gveWUh0lbOdjyI9DoSR3iy28qBT1s
	5AhKKIFoGrJPHh8Q4t3UA0gIfUeuPHmobEKQ345LzHHQXj8qEwRK5VNwmNuQPA==
Message-ID: <7cf86d7b-61cd-533a-efc6-bae3a4e29161@bootlin.com>
Date: Tue, 8 Nov 2022 15:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: Lee Chee Yang <chee.yang.lee@intel.com>
Subject: Re: [docs] [PATCH] release-notes: fix links to git.yoctoproject.org
 repositories
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com, docs@lists.yoctoproject.org
References: <20221108084137.440012-1-michael.opdenacker@bootlin.com>
 <f2b14e1d-5d7c-9955-e07b-4cae8889be39@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <f2b14e1d-5d7c-9955-e07b-4cae8889be39@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Nov 2022 14:30:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3473


On 11/8/22 10:42, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 11/8/22 09:41, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/migration-guides/release-notes-4.0.2.rst | 8 ++++----
>>   documentation/migration-guides/release-notes-4.0.3.rst | 8 ++++----
>>   documentation/migration-guides/release-notes-4.0.4.rst | 8 ++++----
>>   documentation/migration-guides/release-notes-4.0.rst   | 8 ++++----
>>   documentation/migration-guides/release-notes-4.1.rst   | 6 +++---
>>   5 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/documentation/migration-guides/release-notes-4.0.2.rst 
>> b/documentation/migration-guides/release-notes-4.0.2.rst
>> index 632af11297..66779515e6 100644
>> --- a/documentation/migration-guides/release-notes-4.0.2.rst
>> +++ b/documentation/migration-guides/release-notes-4.0.2.rst
>> @@ -230,7 +230,7 @@ Repositories / Downloads for Yocto-4.0.2
>>     poky
>>   --  Repository Location: 
>> https://urldefense.com/v3/__https://git.yoctoproject.org/git/poky__;!!OOPJP91ZZw!iFetgeK0FKPhWY9l9OmtaBEsOwkPc1L0HWKAFUnUsaea-gCLTubugm8qEQEVHGhnoIj54aP-HLOMJJ95046-dvgruDZ4umiPWW0jXwneArjrhbRYVq0e$
>> +-  Repository Location: 
>> https://urldefense.com/v3/__https://git.yoctoproject.org/poky__;!!OOPJP91ZZw!iFetgeK0FKPhWY9l9OmtaBEsOwkPc1L0HWKAFUnUsaea-gCLTubugm8qEQEVHGhnoIj54aP-HLOMJJ95046-dvgruDZ4umiPWW0jXwneArjrhed3wcSF$
>
> Sorry for the URL mangling, company-wide policy I can't change :/
>
> What about using :yocto_git:`/poky` ?

I agree, this would be more future proof.
I'll submit a new version.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


