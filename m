Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A30AC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 10:21:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.5842.1646216465021907768
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 02:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XnTvvJhg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D9A8E000F;
	Wed,  2 Mar 2022 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646216463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GNBHzWxh9XVpWpoSDvJbOGNA+vRBYqVbhSZ4kCZ9MO0=;
	b=XnTvvJhgzEGfkn5pbZnpnwdtQXSq/1RHmXuHTEwzdvSeHlmKnPPivagiSOONjIOdVffi15
	9LU1+6wa8WaiVPSQef3X7suOr4Q0n4CS2QF3fK11ZgK3gZvJypsFugN9bk5IOwUTTyTKt2
	LHhngKMjSdy54WX2UPFHxy3QOgcyfi+OOz4/X5QEO+nE32ZPW2Y5x9eN2ydi0xPIesL0ru
	+DWbZWX9cqo/N4s4uj7DdmwrKMCB5AlBLZLlJnihw2rGOI4LaNcEPH4QFBdEsfS09QmaMV
	AysooVsidzlJ3vPXmjPtIHV29d92BSshK5ceTe8Goo4EwKwGOAmiaGO1/SQp9Q==
Message-ID: <d7dde4f4-daa1-ee42-32f1-e63f922864b6@bootlin.com>
Date: Wed, 2 Mar 2022 11:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: Re: [docs] [PATCH v2 5/5] docs: migration-3.3 drop distutils labels,
 terms
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
References: <20220301163617.1543257-1-tim.orling@konsulko.com>
 <20220301163617.1543257-5-tim.orling@konsulko.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220301163617.1543257-5-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Mar 2022 10:21:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2523

Hi Tim,

On 3/1/22 17:36, Tim Orling wrote:
> The distutils* classes and DISUTILS* terms are no longer defined so
> replace their usage with ``text``.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>


Thanks for the updates. For all 5 patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


