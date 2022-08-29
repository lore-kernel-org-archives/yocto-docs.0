Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA75ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 11:41:45 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.69593.1661773299918576470
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 04:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MQhL5RyC;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 539A6200009;
	Mon, 29 Aug 2022 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661773297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7LQF7IM0586+XCvM1RaOf1A31HOcRUyANO5bxao3ww=;
	b=MQhL5RyC43rCJei8BExJMTaAkTd7+3m8sUvdRlDor+YXthYmXLPAM1QMlwJcCqndfP2QCB
	zlyLrZM2pH0dltsEX3k//u7rTCc4avdNAB/CgcwFEMD+zVHyvd6HnTaifv9qlPZjUTmXEX
	0Nnx9bb5K0VFgQSaqVRPp0N1+k9iLBYk86Qth+9bv5szNqgGQr1qlY+AI3AGT7xzIqqP8u
	1MbEX9Bl1B2tZqM6Uz9orXystuw5mJnGaylo77y8PSZMpryLZqyfgN490Y1CPhL7Q2qefI
	D/9LWm5HJZIpbej5iLHLVzChhBq0FFtBBZbunMq/bTm0JlsGzasxZ97062JNKw==
Message-ID: <350b9d5a-48d6-4484-2eaa-4b176b5a7bfa@bootlin.com>
Date: Mon, 29 Aug 2022 13:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add numa to machine features
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jon Mason <jdmason@kudzu.us>
References: <20220822153807.3806687-1-jdmason@kudzu.us>
 <207d6c62-84c2-5c63-dd9d-aa866976826e@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <207d6c62-84c2-5c63-dd9d-aa866976826e@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Aug 2022 11:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3124

Jon, Quentin,

Thanks for the patch and review!

On 8/23/22 10:11, Quentin Schulz wrote:
> Hi Jon,
>
> On 8/22/22 17:38, Jon Mason wrote:
>> numa is an existing machine feature, add it to the list so that users
>> are aware of it.
>>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Merged into "master-next"

>
> Added back in 2018 with 830880a6888270e047271137f43a643b218050d4, so 
> it's a candidate for backport to dunfell and kirkstone I would assume.


Good idea. I'll send the corresponding patches.
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


