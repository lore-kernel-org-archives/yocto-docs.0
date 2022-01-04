Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990C1C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:14:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4820.1641291293229348576
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B2AF540009;
	Tue,  4 Jan 2022 10:14:50 +0000 (UTC)
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [docs] [PATCH v2] ref-manual: fix patch documentation
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Max Krummenacher <max.oss.09@gmail.com>, docs@lists.yoctoproject.org
References: <20220103195050.466-1-max.krummenacher@toradex.com>
 <2930a616-a1d7-0dfc-01ee-e6bb50ec5beb@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2ab1b80b-b1af-9702-0fc1-569027872f68@bootlin.com>
Date: Tue, 4 Jan 2022 11:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2930a616-a1d7-0dfc-01ee-e6bb50ec5beb@theobroma-systems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Jan 2022 10:14:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2341


On 1/4/22 9:17 AM, Quentin Schulz wrote:
> Hi Max,
>
> On 1/3/22 20:50, Max Krummenacher wrote:
>> The do_patch implementation does not apply patches from an entry in
>> SRC_URI pointing to a directory.
>> Remove the claim that this is implemented.
>>
>> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next, thanks!

>
> As a side note, this patch is a candidate for backports to currently
> maintained releases.


Oh right. I will take care of this.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


