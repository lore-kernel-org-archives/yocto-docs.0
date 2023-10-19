Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0818CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 20:05:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.38179.1697745928267198105
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 13:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UdQk13SQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D89C1C0003;
	Thu, 19 Oct 2023 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697745925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExFe1MkdkkhC1XMT9ehqOsCmKvv0+5KsjcEhUjx8fK8=;
	b=UdQk13SQSPB0oMyXUF3/U2jg3zFS5yqcgVL8AxVK2zWpyO2uFUPB995gWwOsMyZE+kQEaK
	l9TSfKF+GsQedkHkzXk0irCJKMqGAwUiNpD1ZnCcVJIvHkGCu+uFDVTd0juuuB1dIPxwGY
	crvguEbQK3s5L8T3ZvIlQVxhPzk8Cgb+zwueMGwFoH5ownsuaQG5vImiueT5d/VFhLgLgW
	I1h7iGKevsiO8MIIVgSum9KSyWchqnjiJMJpBCRNMomc6hYPivkxDBS/tN90KH7O2jX2MF
	+9+9Xys7mMwdWwZ54M5hFksRCpst22+RoL3v2GKrr1tuOMsB5gY/Pddp2wG4KA==
Message-ID: <f4d41f30-408d-44aa-b097-42d31f647162@bootlin.com>
Date: Thu, 19 Oct 2023 22:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] ref-manual: Add TOOLCHAIN_OPTIONS variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231016215302.3089907-1-bhstalel@gmail.com>
 <932c3f11-1ce6-42f7-9c0f-35be78714a32@bootlin.com>
 <CAOgG7m3TD56++9pMvw3u76C8v8qZ3pehGM67tojBP8yJB_C_iA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAOgG7m3TD56++9pMvw3u76C8v8qZ3pehGM67tojBP8yJB_C_iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 20:05:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4429

Hi Talel

On 19.10.23 at 20:37, BELHADJ SALEM Talel wrote:
> Hello Michael,
>
> The reason for the commits are in reverse is that when I added support 
> for a variable I discovered that another one is missing
> and I need to create another commit, I am new to handling patches with 
> Git, next I think I need to analyze exactly what I need to do and do 
> it in the right way.
>
> I will fix all comments.
>
> Thanks for the review.

Very happy to help!
Everyone has to go through this and learning how to organize patches is 
a very nice though not trivial learning experience :)

Don't hesitate to ask for tips. A great one is using "git rebase -i" to 
reorganize your commits vs the branch you started from.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


