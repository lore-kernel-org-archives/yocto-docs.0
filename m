Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AAFC48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 11:12:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.60216.1707131540764502162
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 03:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LC0fsl5S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 685C0E0003;
	Mon,  5 Feb 2024 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707131538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDnNVNqU6DCRWOgZjENGPUyi8ggrsiHNwN/cc+aEOaI=;
	b=LC0fsl5SX9/Q4Y590VE5OmRRD1059o3W9i+khI4oWuv3XRkf2Jhpa9hxslLtmrxNr6ty30
	l5t0DA/4U+8kwZ+c9m9q661Ks9JbP/P1/dN1za5KcNA0YQs+y21lSiQWXmvgBeROEYjT+J
	ZKvf+arTfbJSDzkF+bnU4pMmB14iQG4SUeLxIYIHFh8ROp8yPplhgynmfqf/cCdrkKrChv
	KMWXbpeNAfPG1s+I050XONEOSMx9Uo/rVvABIKEjDMFSX17B2ibxQI9WLXgZDPWKblU586
	9RmIhju+Quje4miRYEgThq9MBecArbxj2bmn03NVH9IKMRGfPovhmJ50rYoWNw==
Message-ID: <9c1772fe-0423-4128-8563-5fdc7dc1c647@bootlin.com>
Date: Mon, 5 Feb 2024 12:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: gen-tapdevs need iptables installed
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240201165046.28589-1-simone.p.weiss@posteo.com>
 <17B012973AA0B915.1968@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17B012973AA0B915.1968@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Feb 2024 11:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4809

Hi Simone

On 2/2/24 at 15:38, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Simone
>
> On 2/1/24 at 17:50, Simone Weiß wrote:
>> From: Simone Weiß <simone.p.weiss@posteo.com>
>>
>> Add the hint to the test setup that runqemu-gen-tapdevs will need the
>> iptables package installed.
>>
>> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
>> ---
>>   documentation/dev-manual/runtime-testing.rst | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/documentation/dev-manual/runtime-testing.rst 
>> b/documentation/dev-manual/runtime-testing.rst
>> index be1e8c02e..1a2e9ec4f 100644
>> --- a/documentation/dev-manual/runtime-testing.rst
>> +++ b/documentation/dev-manual/runtime-testing.rst
>> @@ -52,6 +52,8 @@ In order to run tests, you need to do the following:
>>            -  Be sure to use an absolute path when calling this script
>>               with sudo.
>>   +         -  Ensure that your host has the package ``iptables`` 
>> installed.
>> +
>>            -  The package recipe ``qemu-helper-native`` is required 
>> to run
>>               this script. Build the package using the following 
>> command::
>
>
> Thanks for the patch, but it doesn't apply with "git am" on 
> "master-next". Did you send it with "git send-email", or was the patch 
> messed-up by your mail server?
>
> Applying: dev-manual: gen-tapdevs need iptables installed
>
> error: patch failed: documentation/dev-manual/runtime-testing.rst:52
>
> error: documentation/dev-manual/runtime-testing.rst: patch does not apply
>
> Patch failed at 0001 dev-manual: gen-tapdevs need iptables installed
>
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>
> When you have resolved this problem, run "git am --continue".
>
> If you prefer to skip this patch, run "git am --skip" instead.
>
> To restore the original branch and stop patching, run "git am --abort".
>
> Of course, I could re-create the patch, but that's interesting to 
> solve this issue for next time.


Never mind, the problem is probably on my side. It seems I tried to 
apply it twice, so everything's OK now and the patch is in "master-next".
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


