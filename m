Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C614C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 14:42:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.18365.1704811318612095601
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 06:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N69euqfD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6090DFF818;
	Tue,  9 Jan 2024 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704811316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vH/CJfxYRo938vd83q7BVWGZCI5bPQW4325aal8w+NU=;
	b=N69euqfD5vld1ojMsxGnhgjnBVhb0jlGyV3dQZy2PbT8vrh8vqn1YfL4lfpjFcTMAoOLPe
	Z34Lge9akUrTac7zpwbS1cHnxzTgt0zMU/cPxQM7kIvJLbGpDLqfsu63fSDsjJHrqAY9/i
	fMsYuAl/2zwzt3f1MGrwk9B7nTS3AsAfBDOIDDxIy9YNFrMOb2LvB/1DVCaIHPeBbVmgTG
	GsfyNezAS+enqx9LBdDlqMMRpONAWozf47CJett1J1jjMI6rb59k+pE3Q0QXfU7dhBqWQz
	T870cNYQ+VoVHCKsGmza0myLMhlaU/9m34YeBTWouYB3XEnr+u1pxpjligOApA==
Message-ID: <e17bc040-30a3-4e70-9b05-b3bb7be98105@bootlin.com>
Date: Tue, 9 Jan 2024 15:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] documentation: Add UBOOT_BINARY, extend
 UBOOT_CONFIG
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
References: <41ed326b9aa4b74ee618378d54a2494f7d035a3f.1703845757.git.joerg.sommer@navimatix.de>
 <0604e406-49f9-46f5-9622-e17a7271e253@bootlin.com>
 <3369b704-5713-43e7-b277-d2b5ef16dce5@navimatix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <3369b704-5713-43e7-b277-d2b5ef16dce5@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jan 2024 14:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4756

Hi Jörg,

On 09.01.24 at 12:38, Jörg Sommer wrote:
> On 08.01.24 15:59, Michael Opdenacker wrote:
>> Hi Jörg
>>
>> On 29.12.23 at 11:29, Jörg Sommer via lists.yoctoproject.org wrote:
>>> From: Jörg Sommer<joerg.sommer@navimatix.de>
>>>
>>> UBOOT_CONFIG accepts a third parameter for the UBOOT_BINARY that isn't
>>> documented. To show its usage another example from the meta-freescale
>>> layer
>>> was picked.
>> Thanks for the patch!
>> I'd like to merge it, but it doesn't apply when I save your e-mail to a
>> ".eml" file and run it through "git am".
>>
>> Did you send it with "git send-email"? Looking at the message source,
>> some lines are mangled.
> Yes, I've used `git send-email --to docs@lists.yoctoproject.org -1`. I
> resend it and set you as a direct recipient.

Weird that it didn't work in the first place.
Thanks for the new submission. I managed to apply it.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


