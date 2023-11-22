Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1393AC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 20:14:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.34490.1700684062586707189
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 12:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c00nJJ81;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8F091BF203;
	Wed, 22 Nov 2023 20:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700684060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wXVyIK063MJV03MK2vXePfE8eggyvuQlKcFEoPdLjc=;
	b=c00nJJ81v3bK//3/5d0cyGK7b+7XhLyepnnlv80f7gespmfY/qfw0LV4wmRtKMm02P8tJA
	ztpiulYfm47DRgkPolX+PsE1IEHMN9H+MdV5fz3UUAxxmxoQXIy2iLMTPslfsQM+cE5zQZ
	AvHCv7Zv/HIW5otAs5/jT2F8ZtGZPfndQaGqDXdkjpBlWpyEZcKGE7fhcbIhVBtMSkrXxj
	awuL6iCyLh6FrN+RLGyc3lKkCAOyD44cwM3NSgxa9QRobun49xnXatNoHwR57JeMGQ3cSO
	U0Yg6VvQe1eeWQJnbu9S/uKriYGV6TqvowRkyE/A37hoMLTTRJ+FoOACi7Hrhw==
Message-ID: <5f70073d-df1a-4da9-95f6-60c54af9d590@bootlin.com>
Date: Wed, 22 Nov 2023 21:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [kirkstone][PATCH] sdk-manual: extensible.rst: remove
 instructions for using SDK functionality directly in a yocto build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20231122124248.3820970-1-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231122124248.3820970-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 20:14:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4644

Hi Alex,

On 22.11.23 at 13:42, Alexander Kanavin wrote:
> This was not actually backported to kirkstone (and isn't going to be)
> but the documentation for the feature erroneously did make its way
> from master into kirkstone.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>


My fault. Thanks for correcting this mistake.
Merged into "kirkstone".
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


