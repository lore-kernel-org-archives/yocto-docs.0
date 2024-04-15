Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD0BC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:40:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20048.1713184808965789958
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 05:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NDvQuzTc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 284C0FF812;
	Mon, 15 Apr 2024 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713184806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2XXRPJYKJLtftUWvd4/Xjk37sKFoZhteXBSGv93fig=;
	b=NDvQuzTczgWHOn355dXUO2RDpxwwZG0Oy0fGbh7Fvr3r0OZ6VD9AL/jsu0qgv0cSlSFkWU
	BqNov52QTULcm2P01cpWC8WSs/lJsK3xtMepSyoeDN1A3w94uJK5F7VQTyuN7oEOXUdz35
	lm4dvCcn6G9xAQ3GZllDHkxpNbBJyTiFGNBHu8wTl2i+woYtP0SsfuQpXYRfSBjpNCDtGh
	d6EtPmwGJW3HW8BDfiRtGnK0PjXXI2dEQtSZuLEDPi0r5heg18Ju7WxMdnZEcQX1mD7ov+
	O4q2vSwW2Y4NJPTjn1IcCuQoWzmU+vBe6F/LwrMPYfbgmuFWZtH+BsNiOJkIng==
Message-ID: <bd7ed6b8-043d-43d0-8e65-43f585dc0725@bootlin.com>
Date: Mon, 15 Apr 2024 14:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [RFC][PATCH] manuals: standards.md5: add standard for project
 names
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240415100555.1054695-1-michael.opdenacker@bootlin.com>
 <44ff31d4-4100-4f81-9421-6b8743ebbbdf@theobroma-systems.com>
 <efc44689-a0ad-4f16-b0e8-441ef17a6cd6@bootlin.com>
 <2f540686-d854-4ff0-88eb-36bd80c1cce8@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <2f540686-d854-4ff0-88eb-36bd80c1cce8@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 12:40:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5150

Hello Quentin

On 4/15/24 at 12:35, Quentin Schulz wrote:
> The issue would be the same if a capital letter for the word is 
> expected in a sentence. e.g. if a sentence starts with `perf` all 
> lowercase, I'm assuming it is the name of some piece of SW. But if the 
> sentence starts with Docker, is it the name of a piece of SW or an 
> actual word?
>
>> These are the ones that can be harder to distinguish from English 
>> words. On the other hand, having all project names  (like Docker or 
>> Toaster, with the accepted exceptions) styled this way, would make 
>> the distinction clearer to readers.
>>
>
> Mmmmm Toaster is a good example of something related to YP that is 
> also an English word... I guess all project names highlighted would 
> make sense then. We can always try to have some elaborate sed/grep 
> command to find Bitbake/bitbake/bitBake instead of BitBake for example 
> instead of relying on Vale for it.

Right, good catch. Then let's keep highlighting all project names, 
unless somebody else can convince us otherwise.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


