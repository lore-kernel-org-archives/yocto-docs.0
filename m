Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2B3C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 13:05:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.15275.1716555933210124466
 for <docs@lists.yoctoproject.org>;
 Fri, 24 May 2024 06:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jc6FwKd2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 438D940007;
	Fri, 24 May 2024 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716555931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+LIj7NDlYeAbPeAiyExt3l64iLmrUJTtxtej43ui89c=;
	b=Jc6FwKd2owEgEFtQlRjRdBPvT6zzIem9y1pByQZx8Qi087keqvlxIIM+vLIbw1+QJoOnOi
	vhtLRt51qsxUwELUW96aB9bVToaLimgKTpd41/TbtRNasbS5q6s7lQ4WiPdM7lzuF6mfrw
	yCue+anq16G1Id5y4CK2dIY3XmED4rae1UVjViCur6NVBZdKIKFsk7zj3CJNJHbLjWB6T2
	6yNOMLcI6NyEpMm4vtuOiokyTzjMDwqn/Av+V6SIC3A6fF02ytxB6ke/fGd9XAx63JX9P9
	q9XqllEFCdu1kCTanMKqcATZAQY37xWCjpua+j2F92H4HW6wcZt0JFXlo8ZnDA==
Message-ID: <54f4f562-1cbb-46ca-a85d-310c84a3991b@bootlin.com>
Date: Fri, 24 May 2024 15:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] ref-manual: introduce UNPACKDIR variable
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
References: <20240523135628.3076018-1-michael.opdenacker@bootlin.com>
 <20240523135628.3076018-2-michael.opdenacker@bootlin.com>
 <CALqELGzk_0CS4LU_TEwzg1=vrNZcdnNNGOTEZH2T7hhLYM-NWQ@mail.gmail.com>
 <cdf74200-11d6-465f-976a-f17b7b4d0ee9@bootlin.com>
 <CALqELGw=Pov6GHa7Nz-LD-LqdHOSkCAZU8V0a_py4o7s5n7ovg@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CALqELGw=Pov6GHa7Nz-LD-LqdHOSkCAZU8V0a_py4o7s5n7ovg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 May 2024 13:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5254


On 5/24/24 at 12:01, Andrew Murray wrote:
> That looks good. Feel free to add my:
>
> Reviewed-by: Andrew Murray <amurray@thegoodpenguin.co.uk>


Done. Many thanks for the review!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


