Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36376C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:04:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.50967.1699265040151237773
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jBMBubjp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32EEA60004;
	Mon,  6 Nov 2023 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699265037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+n/sycCJW49M/YzTCtHwl81i2HsdVWrBCVdKNjHhOE4=;
	b=jBMBubjpg9V/QB8hS4GceAf86U+XXYmPAOJEc0vBqF0mMgGVvRVx/2YlBtSXfRgG5RznTo
	MZEYE8YfOZOXFj3ILP+wokIFsrfL5FGn9+ACfXOsV8l1QetxLVwr0hxz5YVRItboYcWz4K
	Eq97cAf4TMBVlE/CycMme6TOUuRZQJ59uk9x3WhopVNp5rzNegUtCpEEM09+qdhYVOZLqH
	jbnhO6diH6flvenH/13krZktBhpS2jMehnVjvUX4RWPGQGUMWJoOOaETPpOx2v91kiycDw
	rgwjSjoVFrD3NRODjChdGyTsas7RtIBF4LmTfFkVQvET6/WbWmUuqRRrDt6ShQ==
Message-ID: <e0d8e6bb-36d2-4569-bb75-482664ee3ae1@bootlin.com>
Date: Mon, 6 Nov 2023 11:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] overview-manual: Fix bitbake_tasks_map.svg
 numbered disks
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231106091510.1260882-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231106091510.1260882-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:04:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4585

Hi Talel,

On 06.11.23 at 10:15, BELHADJ SALEM Talel wrote:
> Circles are changed to rectangles attached to the BitBake task box.

Thanks for the update. It works for me.
But you forgot the bigger "Github" black box on the left. By the way, 
please call it "GitHub" as Wikipedia does.

Another question: the box on the bottom right just has "This task also 
depends on PACKAGE_CLASSES,...", that's much less than before. Is this 
intended, or a mistake?

We're almost there!
Many thanks for your time!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


