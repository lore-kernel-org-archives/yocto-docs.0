Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900AFC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:18:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.29203.1698927501412527659
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 05:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NiuY7D9p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FE6DFF812;
	Thu,  2 Nov 2023 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698927499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfu1B3+JdTHUKIscLYXxMs4HMLQQ5ZJjTnu7QvBI7vQ=;
	b=NiuY7D9pi0XSgsCRiMG6grELEoEKDKavPZjzFTckoYNkAtH8T/w+f8sYJ5q98KcOePCmqg
	RWShAUth1EGnNIQc1MOdWAdIO2UFvxdxzKgjCJpsjhErRldMlf/0ay/kLyFE21/M0xWASc
	mXch3/bCVVzEt86W1S511tJmzuZDMOX3K2I01oRJUoGx/f3iQwVbmrxlK3AEPdp/1CJT9C
	HC3Kk3kj5cYgwxFsVTF2a2zR5a1cQ15RbDUwvI8n/ybPDUPkb714YSOruhCCQNWvZi/TxS
	tV1JK+ByNmOWpq2Dol331oR5Ti3HgmN7/LVeSQuEg+jyrrEfOXLSWcNy35zTpA==
Message-ID: <ba3b0d97-2554-4779-bd02-132f61405ad4@bootlin.com>
Date: Thu, 2 Nov 2023 13:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/14] Release notes changes
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
 <1793C30A652E0958.11290@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1793C30A652E0958.11290@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 12:18:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4569


On 02.11.23 at 10:05, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi Ross
>
> On 01.11.23 at 18:26, Ross Burton wrote:
>> From: Ross Burton <ross.burton@arm.com>
>>
>> Hi Michael,
>>
>> Here's a series of patches to add more to the release notes. I'm 99% 
>> sure
>> you'll want to reword or add more formatting to most of them, and you 
>> probably
>> have more local changes, so I sent them as independent changes which 
>> will be
>> easier to rebase.
>>
>> Feel free to rewrite/squash/edit as needed!
>
>
> Sure, will do (starting right now).
> In particular, I will add the missing "Signed-off-by" line. It's not 
> the first time you forget ;-)


Done. I added all the SoB lines to each commit.
The commits are now available in master-next.
Many thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


