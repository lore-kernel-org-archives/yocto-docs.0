Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B84CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 12:30:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.213481.1697545826337208568
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 05:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MeqqDa4e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2022C0008;
	Tue, 17 Oct 2023 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697545823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAtgkJHrqFtS4DfwVbnL8D75d27gOMI2J9raWzvA2zM=;
	b=MeqqDa4eQ+E/U/dCnrivb/4PInXPYh74VpDrkhMglgmcnxqrxDHmPanmgkkeh2Svn9E8PG
	VCMquig6NUSM4BoOpl1LMGFd3lndHj3fE4cBqpeqM+0zPY83DbJ7xxE5gLoDXM8CC/SAcK
	azY4VeH9CW6nATE1nURTTVRrfHM7IKXAIsfdevl3RByiwc+2gC93ZrivsnixM/Bl45uX2s
	oR9Bz9zM/Q28D1CuwTnLlKYDt32xx4a42DPWYoX3T406lkuTvoKT1jL6fPbEGHAt553SUA
	41/XpQdfTXJeBYZry4ykIEe86SO864ACWheyOgVE2c5TiPnRiL8ihiOFpRNBTA==
Message-ID: <8d0bf46f-1cad-413f-87ea-38205de68b80@bootlin.com>
Date: Tue, 17 Oct 2023 14:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] ref-manual: variables: provide no-match example
 for COMPATIBLE_MACHINE
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>,
 Quentin Schulz <foss@0leil.net>
References: <20231017-dev-compatible_machine-v2-1-ea04bf0eff16@theobroma-systems.com>
 <648ca8a6-28d6-4456-90ad-ab3f16e876f1@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <648ca8a6-28d6-4456-90ad-ab3f16e876f1@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 12:30:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4398

Quentin, thanks for the update,
Daniel, thanks for the review!

On 17.10.23 at 14:23, Daniel Ammann wrote:
> Hi Quentin
>
> Comments inline.
>
> Kind regards
>
> Daniel
>
>
> On 10/17/23 13:45, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> COMPATIBLE_MACHINE is used to forbid the use of a recipe or its packages
>> for a specific set of machines.
>>
>> In some cases, it may make more sense to have the logic inverted and
>> have the recipe always forbidden except for hand-picked machines. Such
>> could be the case for pieces of software that only support some
>> architectures. In that scenario, it is sometimes a bit easier on the eye
>> and for maintenance to use the OVERRIDES mechanism but for that, a
>> default should be set.
>>
>> COMPATIBLE_MACHINE:aarch64 = "$(aarch64)$"
>                                 ^ shouldn't this also be "^"?
>> COMPATIBLE_MACHINE:mips64 = "$(mips64)$"
>                                ^ shouldn't this also be "^"?


Oops, just the commit message was wrong. Fixed.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


