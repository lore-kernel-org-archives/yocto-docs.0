Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEBEEE57E0
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 08:12:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.34600.1694160741004145846
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 01:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pwmKuz0z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 192052000B;
	Fri,  8 Sep 2023 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694160738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxS/98pmcyAfmpa32lwLFqoobSxbhAUOBPyCE+6mDBg=;
	b=pwmKuz0zVJFzNHGpwryu5D9Z7Z0gvHLHO3mwD9XbCtnImxMH436EOGcsowxwCTY9s+gPmZ
	GqAcalg42Pv6FaGDK77TrxR1EiLOeVL5qK6gO4gN8NAk4YrGAz0twHHLLp+QdoX8NXMrKj
	DfmsEyJJtpH7IU3edeC3yNxfJQd3Vxvt9Yv2PsqTTkkggVjqmM9jx7AzUpSmE+xMiHHwKS
	lokBIC1zEgSVfo8b2wDzrioU/4e4giUSneF8uOz/d2lqNLufiH0okRAi73oSy4D4KOMwWh
	Nwap0pHMZSWSUF00LxyYZTWWZH4N3pDR2BwRzTAnSNhp4lyzWS8YWQCxU27FXA==
Message-ID: <da8d064f-22f5-05ba-cd48-5137a35cdb9f@bootlin.com>
Date: Fri, 8 Sep 2023 10:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/5] Add packagefeed class documentation.
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Charlie Johnston <charlie.johnston@ni.com>
References: <20230817155143.2578874-1-charlie.johnston@ni.com>
 <f8f30927-8b62-a73c-4476-025da04925a5@bootlin.com>
Organization: Bootlin
In-Reply-To: <f8f30927-8b62-a73c-4476-025da04925a5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Sep 2023 08:12:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4206

Hi Charlie

On 18.08.23 at 11:43, Michael Opdenacker wrote:
> Hi Charlie
>
> On 17.08.23 at 17:50, Charlie Johnston wrote:
>> Alongside adding the new packagefeed recipe class to oe-core, the 
>> documentation needs updated as well.
>> This patchset adds documentation for the new class, task, and 
>> variables and then updates existing
>> references to the package-index task and package feeds as applicable.
>>
>> Patch set was tested via a local build to confirm no warnings or 
>> errors and hand-tested in a browsers
>> to ensure proper formatting.
>>
>> As mentioned above, this patch set is dependent on the oe-core 
>> patchset being accepted.
>
>
> Many thanks for these great updates!
> There were just 3 trailing whitespaces in Patch 1, but everything 
> looks good.
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> No need to update. I fixed the whitespaces in my branch. Unless a new 
> iteration is necessary.
> Don't hesitate to ping me when your changes make it to openembedded-core.


I haven't seen your patches getting merged. Did they eventually get 
rejected, or did you just lack the time to submit them one more time as 
a reminder?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


