Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B16C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 14:29:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.28578.1641220134326969847
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 06:28:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 681C220002;
	Mon,  3 Jan 2022 14:28:52 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: Fix module_conf typo
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20211227185854.1125884-1-robert.joslyn@redrectangle.org>
 <0de8f52d-db3f-2e51-9633-0b957c1b675b@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2239f69e-2f5d-8b17-6e03-e1cdb345860c@bootlin.com>
Date: Mon, 3 Jan 2022 15:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0de8f52d-db3f-2e51-9633-0b957c1b675b@theobroma-systems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Jan 2022 14:29:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2332

Robert, Quentin,

On 1/3/22 12:33 PM, Quentin Schulz wrote:
> Hi Robert,
>
> On 12/27/21 19:58, Robert Joslyn wrote:
>> Modules specified as part of module_conf must be listed in
>> KERNEL_MODULE_PROBECONF, not KERNEL_MODULE_AUTOLOAD.
>>
>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Thanks for the patch and the review!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


