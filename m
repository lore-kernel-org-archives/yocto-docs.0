Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54DCC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 15:05:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.19687.1677251099771014261
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 07:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pjtKP4jr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 71C341BF203;
	Fri, 24 Feb 2023 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677251098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acFU9qmqxbhM2WgokL7Cj0RU/2GY3rMvsZTtOoZWqac=;
	b=pjtKP4jrLb+4R6tk4V2Y7BsIJMpUXxLcQn6WmKlfU7oN0vM5xRx49IEGMxMqTWE2/gmM9B
	83yvvbvgjkRTEe89mFORqXQoyqMUOtcef483XHMbfDUun9RSG9mpQM3zUSB1ICc2/+UAPX
	m6QSamLjtDmXxfX0prLZTmQagBwLvqBL80jAoW8+wp9UpNgyYdmHU+75WaqdliaJPDkRb+
	icBpw0UOwAOL7DABp8L31K5TgZZyFu6ew5yEXn6FJQInYUX1cB+9xnsjV2HQ8IPPwSIl58
	0RWENYAYYAltWTgR0jdQ2MmyNXyBfMX7wEuKFmQKWaOUVqwCMOCd+rQ8eI2SYg==
Message-ID: <cfb5878c-bff9-6679-4b29-91306d228862@bootlin.com>
Date: Fri, 24 Feb 2023 16:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: Yoann CONGAL <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: update DEV_PKG_DEPENDENCY in variables
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com, Fawzi KHABER <fawzi.khaber@smile.fr>
References: <20230223103636.10170-1-fawzi.khaber@smile.fr>
 <354e06b1-c01a-9db5-692f-0c0dda040e2b@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <354e06b1-c01a-9db5-692f-0c0dda040e2b@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 15:05:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3736

Fawzi, Quentin,

Thanks for the patch and review!

On 24.02.23 at 11:14, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Fawzi,
>
> On 2/23/23 11:36, Fawzi KHABER wrote:
>> Since release 4.1, the variable DEV_PKG_DEPENDENCY sets RRECOMMENDS 
>> unstead
>> of RDEPENDS for the -dev package on the main package, this change fix 
>> the
>> documentation the match the actual state
>>
>
> This is somewhat misleading.
>
> DEV_PKG_DEPENDENCY was introduced in 4.1 and started by being used as 
> RDEPENDS but then migrated to RRECOMMENDS during the normal 
> development phase of the 4.1 release (before the first release actually).
>
> Why it was important to me was to understand if we needed to backport 
> this to 4.1 release docs and maybe even earlier.
>
> FWIW, the commit introducing the mechanism is:
> 73cf55cdde1f ("bitbake.conf/recipes: Introduce add DEV_PKG_DEPENDENCY 
> to change RDEPENDS:${PN}-dev")
> and migrating to RRECOMMENDS:
> ddbd90a37c7e ("bitbake.conf: Change -dev RDEPENDS to RRECOMMENDS")
> (in poky).
>
> In any case, the suggested change is correct, so
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks.
Merged into "master-next"

>
> @Michael, this is a candidate for langdale backport.


Sure, good to know. I will send a patch shortly.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


