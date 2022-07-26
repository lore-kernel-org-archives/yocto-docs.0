Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643BAC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 19:22:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.11058.1658863345228416579
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 12:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mdMDOVXO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5AEEA20004;
	Tue, 26 Jul 2022 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658863342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L68DwLCJ7slvlNcgd4+JR0B5xgHZSB+3szXL3Lyegng=;
	b=mdMDOVXON7C8zBaBw0TdFZOpJSugW0ZWVbXQkP1M+SvJAEiLwAnZxE9T2QIDvIs+XZE2bL
	CH1IAAXLHF1MEZYgpedYHQkRGb6epVHgnf7CZi0YaTfx9DX62FjxQw/6JWr8WnuAHxhTkI
	lMRVvgZCaCaFkWTBW2+lWbrWIFvNo6vnpwlHLQCwEyB8y0nQxpXedr8Xh4o/aWzUfbzeP1
	Pp8XUKv/cFKrza5dERJnpn5yDE7KDPvb0lU3NZdHylBODExe1lqiybKRS5mzawKH8+90v4
	aIwn4aD+Bm9Lk6tFfRySG1f8Y4izaCTIOJBkuEmVOMHHTW5QiY2Uc8DVV4t76A==
Message-ID: <a7b674f8-3dea-a9b8-c257-8317136902b8@bootlin.com>
Date: Tue, 26 Jul 2022 21:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [PATCH] dev-manual: mention the new CVE patch metrics page
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20220606155943.52427-1-michael.opdenacker@bootlin.com>
 <bcfbb80f-83c9-f984-265d-3c6dd99c429a@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <bcfbb80f-83c9-f984-265d-3c6dd99c429a@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Jul 2022 19:22:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3089

Hi Quentin,

Thanks for the suggestion!

On 6/7/22 11:07, Quentin Schulz wrote:
> Hi Michael,
>
> On 6/6/22 17:59, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Looks good. Was puzzled by the lack of extlink use but it seems that 
> we only have one for autobuilder.yoctoproject.org which points to a 
> different thing than autobuilder.yocto.io?
>
> I think we should also advertise this page in more places than here? 
> This is a very important document I think, so the more places we show 
> it the better? Don't have any particular place to add this to though.

I looked at the pages on https://www.yoctoproject.org/, and didn't 
really find any suitable place. The most natural place is the wiki, to I 
added a link to https://wiki.yoctoproject.org/wiki/Security and made a 
few update to the links referred to by this page.

I also suggested to add this link to the weekly "CVE metrics" e-mails:
https://lists.openembedded.org/g/openembedded-core/message/168512

Any other ideas, anyone?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


