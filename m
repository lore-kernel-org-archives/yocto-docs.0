Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A896C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 09:05:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.26431.1698915933014185517
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 02:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CRFkNhl4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E59B40005;
	Thu,  2 Nov 2023 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698915930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5zTiC7zfKNOmeEIsh6UN+Kok2C5IviuOqRipRnBFPI=;
	b=CRFkNhl4Jm2F/OV60Cq08Dw/JZV0SG5HZ63ah91v18wEkFuTYZK3xree5DaoPaLp5P4nDm
	oucVCu95vkFKYBMwRsMcLmDBIuzmOK5hjqlwus8k1z7/c95ZhwUJSUbnVl0JdkHanE8or6
	jRSOa6+FEQvj3u1MhJaRX+D1AY5evxbDGcSlpqYqAxZdFHXfWqXm6Zu7tHJo4ictAdt6pc
	3IVKtCH1m/YdKZxnb5jZ9zwMnd0ENQ16ZnbLTwp7Hi8c10d2JodvB29kuUVmwKJwr7lV18
	Ws3aXTkCJ9b+42gQJCJV4HXb8Kh9bjBy4tHCa0/pMqUUF9WFYI2orfDU0SQnrA==
Message-ID: <16867f1a-98fd-4299-814d-15541c6fd262@bootlin.com>
Date: Thu, 2 Nov 2023 10:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/14] Release notes changes
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231101172706.81576-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 09:05:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4562

Hi Ross

On 01.11.23 at 18:26, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> Hi Michael,
>
> Here's a series of patches to add more to the release notes.  I'm 99% sure
> you'll want to reword or add more formatting to most of them, and you probably
> have more local changes, so I sent them as independent changes which will be
> easier to rebase.
>
> Feel free to rewrite/squash/edit as needed!


Sure, will do (starting right now).
In particular, I will add the missing "Signed-off-by" line. It's not the 
first time you forget ;-)

Many thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


