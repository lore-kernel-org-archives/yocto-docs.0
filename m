Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66DEC43217
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:46:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.40237.1669041969625975600
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 06:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RHjBbo2v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 618A41BF209;
	Mon, 21 Nov 2022 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669041967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABc3c1jY8IcR5z6e1N7xluzs4zq15FhnTd3KWYGHLUU=;
	b=RHjBbo2vT2C0BzJfICYlJMmhK0qmonGBTi+oxTYG5oSuan+KrX9KFBvb4/TTxEgM47oUix
	IfKjpIhFsyxmVpwRKFk0zkkqVGeoIvuqtJqCXrsM7U4Nv4evOwNgBc3m6yP2OS4q2vti2B
	s4FrxRGHYcP47y5AIQi8iXD02gk4llxs7J/Hri61KMjSgFvy7WC1+NUALskjqhdWNekCqj
	BhmVvHiFASl8oGwnag8c/Legj6FI2taaCdkwks1P61KNg/ae3AS0QTvYay8XQNkE0lbIYD
	cFD5NCfmZ+hDaXkhHYw6mzFbWu5sikUKTp52gkMtOTBBjXAUX222O1aJfe8IIw==
Message-ID: <66420f3e-fe95-cac8-7a64-947617084c7c@bootlin.com>
Date: Mon, 21 Nov 2022 15:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v4] qemu.rst: slirp port forwarding details
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 Atanas Bunchev <atanas.bunchev@konsulko.com>
References: <20221111102151.7159-1-atanas.bunchev@konsulko.com>
 <fedb4cc0-44d6-d7d8-bc26-c8de5bee06ca@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <fedb4cc0-44d6-d7d8-bc26-c8de5bee06ca@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Nov 2022 14:46:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3495

Atanas, Quentin

Thanks for the patch and reviews!

On 11/11/22 11:29, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Atanas,
>
> On 11/11/22 11:21, Atanas Bunchev wrote:
>> Explains the default behavior of `runqemu slirp`.
>> Explains how to forward ports from the guest to the host machine.
>>
>> Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
>
> Thank your for the patch and prompt updates,
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


