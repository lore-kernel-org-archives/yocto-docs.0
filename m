Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B57CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:17:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.60258.1697822235729791216
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 10:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pXnKY74R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D9241BF207;
	Fri, 20 Oct 2023 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697822234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n02etlEZ+5nCf+CC395rpPf4upCEuPylcBw0CEkwtSE=;
	b=pXnKY74RkF2Xq3ROnV8b7+PAJP6T4Xy5Xqy7Ejzv97UHplPAvit5wd65tR60MWFtysElLd
	oWcKS7rVTJbcopTpZC3pRlsGC2jjzTOiT2RoGNpletenodj61mqKTPyk8fpVyWNEf/vhsc
	6lSuqh7HJIln1mYa/nxLrRfExXSrK/xrV3b2d+NYoYug51BLfXaaUhr+CTAtcZJVVpOa5J
	+0lVvNjKT8Rs8CrdZUBrgNVS0P9425+M0ObcJMiOp09M9V8fYX/jaYXr1SRe7HwyoQ+LyP
	ZYKZM0c0y4F/qv1G7HnA9HblU93kWcqL9Utavjn+B9I9v79PCMDuOOrBfZ59Dw==
Message-ID: <06805ad2-d89f-4844-98c1-94d43403a6c9@bootlin.com>
Date: Fri, 20 Oct 2023 19:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] ref-manual: variables: Add TOOLCHAIN_OPTIONS
 variable
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231020094102.414940-1-bhstalel@gmail.com>
 <20231020094102.414940-2-bhstalel@gmail.com>
 <85b5fb7a-568f-4418-ae01-b74ccaab9501@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <85b5fb7a-568f-4418-ae01-b74ccaab9501@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 17:17:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4451


On 20.10.23 at 18:04, Khem Raj wrote:
> On 10/20/23 2:41 AM, BELHADJ SALEM Talel wrote:
>> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
>> ---
>>   documentation/ref-manual/variables.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst 
>> b/documentation/ref-manual/variables.rst
>> index b00445946..1fca913e2 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -9135,6 +9135,16 @@ system and gives an overview of their function 
>> and contents.
>>         portion of an eSDK. This is similar to 
>> :term:`TOOLCHAIN_HOST_TASK`
>>         applying to SDKs.
>>   +   :term:`TOOLCHAIN_OPTIONS`
>> +      This variable holds extra options passed to the compiler and 
>> the linker
>
> This will be good to mention that its different from adding to CFLAGS 
> since this variable ends up in CC/CXX variables which is important to 
> know that in some packages CFLAGS/LDFLAGS may not be used especially 
> during configure tests etc.


Khem. Thanks for the suggestion!
Talel, your patches are already merged but follow-up patches to 
implement Khem's suggestions are welcome, of course.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


