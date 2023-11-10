Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353F7C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 15:18:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.29783.1699629508985130356
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 07:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k0pKIKIx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9667C20012;
	Fri, 10 Nov 2023 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699629507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8bD6kMOXEh+2FiWQjneLPSBaITv7HF5roE/orQvQDY=;
	b=k0pKIKIxVj04iHQb7pITO0dzRsMKKXjw30eg3U6tVcYRA3EaafndQPRDv7xM2FiyNHcfI3
	Le10S3klSWGvLIqSefOrnQxTKb1JAzhhyBNf53wZZzRcyMcYdCXbVDH0T06dyORnny+bQ2
	Yb7M+Ary1w7qrNNBqJvK4zzWB+VjHGho0gdngtTJbSnWgnLjAZmsHPWKfA7SOeI2A38KgJ
	1jSunMxSeKxoDrLEJhMaAbIEmV9UKYAX2oABT7gFeKCxWSLvgjNE7fLreVZxA9PrOaaisX
	ruRN9yD3dlJbrikoDjVS5RlJ2v7NWl0dCXXSPs6We+Kn0r5QW4qzOYH8s1vH/Q==
Message-ID: <3c6e5bc0-a9bc-49c2-9c61-20b80b3a2501@bootlin.com>
Date: Fri, 10 Nov 2023 16:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-4.3: add Repositories / Downloads
 section
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20231110020705.426928-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231110020705.426928-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Nov 2023 15:18:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4613

Hi Lee

On 10.11.23 at 03:07, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Add Repositories/Downloads Section for 4.3 release notes.

Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


