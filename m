Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AFBC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:37:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.529.1664818650022995161
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 10:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m79LqBzV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78A1F40003;
	Mon,  3 Oct 2022 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664818648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6yr7nUjNc630pX8kL4+F2DsjuYKmkygwweiHLuX+U8=;
	b=m79LqBzVJ5hio9JbeH8vc2ykB/SV9QiQU7kMAVQE0oi5RiM4vJugEJIsiDMYB5D3EKd6Wy
	Cl6NsBIms3V55Cxh2feYY9Plbz9ZUbmeM6VqiQFloFY4/I/a0NWHDb83R9nC0mMsG1FPiz
	e/sJI21IpF+SvQNHYBCd+audku2us5ZpCroi/FyOQJrVuFOABuBaw5k1d9uWAz+DqMTveg
	v7MQRvvFmcbcJ7ZW/+v00GKCdYEQQ427cMoTJsFyyekptfv2vmZWuj3nn7m8ReZajkOhj9
	Uc/KutActUiyoH8eRNk8nAmf5jjuVSsqO4fo+AYjLv4lX46EqTXmALmDY9RKRg==
Message-ID: <c455260f-e0f7-ce90-002b-5accfd85a98a@bootlin.com>
Date: Mon, 3 Oct 2022 19:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration guides: 3.4: remove spurious space in
 example
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 Johan Korsnes <johan.korsnes@remarkable.no>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
References: <20220929115305.254957-1-johan.korsnes@remarkable.no>
 <b583ce6c-995a-beb1-47d0-9b36f6ac828f@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <b583ce6c-995a-beb1-47d0-9b36f6ac828f@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Oct 2022 17:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3266

Johan, Quentin,

On 29.09.22 14:03, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Johan,
>
> On 9/29/22 1:53 PM, Johan Korsnes <johan.korsnes@remarkable.no> wrote:
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> Cc: Ross Burton <ross.burton@arm.com>
>> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Many thanks for the patch (good catch!) and review.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master next.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


