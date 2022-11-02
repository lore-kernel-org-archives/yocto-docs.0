Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171AC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 15:40:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7865.1667403625441294778
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 08:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F3v+DRZK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 078D9E000D;
	Wed,  2 Nov 2022 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667403623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BvZGcPcIIgJ0J+twA62YJjQaZJh2A/rMx9BsDaUscE=;
	b=F3v+DRZKJyzo2Qe3OmxeOJOh4mAyFw7R8LbNERkjwz4gS/MNwaHwjyOMJumuzU+3XMjXG9
	S79mLKsiXEMQy8I2UA2tDUzh65XTIMi0YrCkuPZfZO2jyk8KDFhrJITuxofV4zAtS5O0Jb
	H/g4NTbeuxQIlu0dxcgx9+89iIW/Ucosy/u+hmQAm7ErE603CeS2rwd0cX1UgEPGsIYhaW
	dqFhC81sAyteGCJoCQlO/28Xwa1Aa+rGUJrKvPMh76MPMed+tEyhO82KTIDxPBfr8UwRc9
	SCur3MHckSBWDrQPJj9Vr1qsJe97YhVs/zpdkOUy9EcBgE/IN8roZWlakVuReQ==
Message-ID: <1a32dc28-6c61-b375-321b-8e781ae939d5@bootlin.com>
Date: Wed, 2 Nov 2022 16:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] manuals: remove xterm requirements
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>
References: <20221101163135.1602755-1-ptsneves@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221101163135.1602755-1-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Nov 2022 15:40:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3454

Hi Paulo,

On 11/1/22 17:31, Paulo Neves wrote:
> According to [1] xterm is no longer required. Update the manual
> accordingly. Related to Bug #14873.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=ddb825c87dd3e59d50841a993080a00d1459b1e7


Thanks for the patch.
Could you just send it again with your Signed-off-by, please?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


