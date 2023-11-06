Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A83C41535
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 20:46:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.66213.1699303557085525980
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 12:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bFssL+Ff;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2524B1C0004;
	Mon,  6 Nov 2023 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699303554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAeyu13MRxpi1Rn+tJcsb1/50Qto4b+1avzsz2NJ19E=;
	b=bFssL+Ff7oBHhQOaW/goCdOqoEFFplYDh3C5pBZhnBVwGWHvoYcrxqlaThWbD1AL3CR6Dh
	H62CXEgu+lGBWYmUfsRJNPkQE2axuRvvJS3u7vc7v2ec16x7MrbqjWOhuEB1bf+3l1JM8/
	pf1pa7eTcYSIudGBUsERLO7tJbajuKMlSsGYh9bPJtYB5mhHHSAsyF6RW0npC8p8g5rHyW
	8Gta3+lUQ0E1cp16DMU9rt7+JNsTUS6n+Ogp4aXn9m8TjP6kmFv5Q35IZRvvTJTXVIA1fQ
	XEMrpAb4eDCZRTDRQOT+kMEFzalsN8dsQlgrog23nHCvJK120RXjVinZ7zajtQ==
Message-ID: <dfe72e9e-9b85-4944-90ff-7542455edbee@bootlin.com>
Date: Mon, 6 Nov 2023 21:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 12/12] migration-4.3: additional migration items
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>,
 =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
 <76de363e7d3d18d38be8d63cbd683e22337f7af6.1699266393.git.bluelightning@bluelightning.org>
 <6rbkc7i1vs.fsf@pengutronix.de>
 <87b72e9424d830730d3fcacd12d3e225@bluelightning.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <87b72e9424d830730d3fcacd12d3e225@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 20:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4608

Paul, many thanks for this great contribution. I can't imagine the time 
it took!
Ulrich, thanks for the review too!

On 06.11.23 at 17:16, Paul Eggleton wrote:
> On 06.11.2023 23:58, Ulrich Ölmann wrote:
>>> ...
>>> +-  The :term:`SRCPV` variable is no longer be needed in :term:`PV`, 
>>> but since
>>
>> s/is no longer be needed/is no longer needed/
>
> Fix pushed to the branch.


All merged into master-next, now.
It looks ready for the release.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


