Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1F9CD6E75
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:17:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17662.1697033847274823302
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 07:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nsjmwmXE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56A7F40005;
	Wed, 11 Oct 2023 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697033844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UsKXVCUyGYb6kwKZ5T8BngQui0ywRO2zktxasVaLbw=;
	b=nsjmwmXE84oQ1YL//6/1Lj3fYPpJQN2kohY0l7dvRwuQ92kkQ3Y1n28TKU3LfQjal6wG2Y
	2oyAsyvXYqCe4AQ63EkUhEupjR9jN2C1J0Wb2XQJMksH8Ui0rXvC8rTOqnxHzmN6IRNKj0
	WXFbUWhGNd6UYAD/R8NkIIgLAF6Xcq9itPaG60JSISDuuKKyDjzM6FNaKSCGRzx8LuFr0L
	unbezWY50iJz6Kt80wmEPDYh2iFPHnWHLHND2g312YtuPKvxb2xBlSJbqP7C4rEShLB2Kr
	aHVmqCF6Pmvzwr3XXFQGfEzTrsMB9RS8NomzqF+EzBxWLMoskLDcrKG5sFQ2Yg==
Message-ID: <f33d2f73-f4eb-4a10-bffd-eb252a9da78a@bootlin.com>
Date: Wed, 11 Oct 2023 16:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] BSP guide still conflates "repo" with "layer"
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <67f75a6f-3f77-3ae5-56-25c011722bb9@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <67f75a6f-3f77-3ae5-56-25c011722bb9@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 14:17:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4351

Hi Robert

On 11.10.23 at 09:14, Robert P. J. Day wrote:
>    i've mentioned this before, but some of the YP docs still
> mislabel a checkout as a "layer". case in point -- the reference to
> "meta-ti" as a "layer" in the BSP guide. it's not, of course:
>
>    https://git.yoctoproject.org/meta-ti/tree/
>
> it's a git repo which consists of two layers, but the current BSP
> guide still describes meta-ti as a "layer" in places. i'll ponder how
> to fix this. are there any other checkouts with that structure? i
> recall meta-intel used to do that, but now it's a proper layer.

Oops, good catch.
What about just replacing "meta-ti" and other bad examples by better ones?
Patches welcome, but let me know if you wish me to take care of this.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


