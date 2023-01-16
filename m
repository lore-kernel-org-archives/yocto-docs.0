Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FB3C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:05:18 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.170714.1673885107861284873
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 08:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TT00e8te;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B83D10000B;
	Mon, 16 Jan 2023 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673885106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7/RY/WJlmGSPtnDAJNwkHJbp5Zp+BEC3mKG4BUJ7A8=;
	b=TT00e8te0/8YaWSrYlq0ST7E53+H0wFJvrhnUgkdC3SyoiQwKliBbfgzTOp9aqfVNirbMU
	YuP43RV5+tBPg019HSy5NamPZd8fs+kfqJv+oTcskhkzbp1K3CV1Byf1BMYh1Wt/JJ0eTn
	6iWzHLEwMneqlKnId1GeG9Aqf1K8PKYtjUaxH9/zc6w5HZDIffarzVabxvVWKuU3/6+p1p
	UWl9vYEaTtBPO6eHHoQzzUhUQS8ECc/hRVnww8hswnBBvPCc4+oKRFov4UtJEcI1aj/bQH
	52v1Y8LqYG84ypqPYd0g8nfmETpEb/3luwra3E/HI46DZj/s+LT5PHadbjF8nw==
Message-ID: <2a53087f-ebe5-e571-9731-cfc680ace44e@bootlin.com>
Date: Mon, 16 Jan 2023 17:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
 <6rsfga2abu.fsf@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6rsfga2abu.fsf@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 16:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3609

Hi Ulrich,

On 16.01.23 at 08:35, Ulrich Ölmann wrote:
> Hi Michael,
>
> I am no inhabitant of the rust world, so I can not evaluate the
> technical content


That's not very different from my status. I'm just a tourist to the Rust 
world so far ;-)

> s/and an ``src``/and a ``src``/


I'd disagree on this one. If you read "src", what you pronounce ("S. R. 
C.") starts with a vowel, hence the use of "an".

https://editorsmanual.com/articles/indefinite-article-a-an-with-abbreviations/ 
seems to agree with me, but I'd be happy to be corrected!

Thanks for the proofreading!

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


