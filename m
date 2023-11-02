Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AF7C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:19:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.29533.1698927592689816353
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 05:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZC58zBjY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89D0424000B;
	Thu,  2 Nov 2023 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698927591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=omrBf9l6SKnhuCidnJC5PqgfrqNJ1f332R4XxZWa0Wc=;
	b=ZC58zBjY6NRTPuwcSoaZpTkLt+Np8atvs/vsRSyO0Apyt51e1ODlIajoSMePrWcUOJyYXs
	qW80IskuyiHs5UXzUoPn529wWxV4DlcxF5++TxxA25ViXuUtfq/FnNVXqzFDSmit9O7pIm
	nKYtrFiTBVqnX28oB6pqUum38lh/xb0cudt5QpFcNmQRPgS51hCRC3nJAXQWm172vzZq9r
	DgRDd5Y+nU8KxWqlG6YuHErWfxEZJEj6FmG7frhINLJn6yxjJImFHXBd8HP2F+4kndQ7kY
	DIMFPE3DmWlxaYCYA7UhxWUtlkmc6u0ieRupMx2eoDhImsNFcqoTvsp4HSnAbg==
Message-ID: <2be73001-0e97-4a05-b73a-c579528ee93b@bootlin.com>
Date: Thu, 2 Nov 2023 13:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, ross.burton@arm.com
Subject: Re: [docs] [PATCH] migration-guides: updates for 4.3
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <1791F57D905EEBD5.3183@lists.yoctoproject.org>
 <e3ad6981-b0cb-4d91-9ee6-c9b4df114bff@bootlin.com>
 <3e5aa494-8541-40b3-b2b9-bc6dc8074b24@bootlin.com>
 <b2673a860aeb1e6e3d8bbc5a7fb3457b@bluelightning.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <b2673a860aeb1e6e3d8bbc5a7fb3457b@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 12:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4570

Hi Paul,

Thanks for your help!

On 01.11.23 at 19:25, Paul Eggleton wrote:
> Hi Michael
>
> I see Ross just sent release notes changes, sorry I guess I kept you 
> waiting too long :( I had done a bunch of work already, but I'll use 
> what I have to check Ross's content and send any delta on top of that.

I took Ross submissions into account and they are now in master-next.
You can continue from there.
Thanks again :)
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


