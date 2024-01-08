Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD3DC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:59:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8858.1704725945472877509
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 06:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DdhlweHY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF87A20005;
	Mon,  8 Jan 2024 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704725943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lLs2qNsBM9T/rK4MRp2BXUUXzloNKobljgqJQTwvpuE=;
	b=DdhlweHYrW/Yst3c1w4/CI5gedRnfiNC+WnS/tnFUls7TflN21anfcGgHdzQBNRPQLybfT
	d+QpkV5M2I/yTAcLiXlaMAdRi/5peod6o0aiU+bPkZzQCTEKCNAHY4aHPN2a6B5ED3dLfG
	ykoHnXRZIMG2eDhdsn6xQ5Q20K2gSf6HJbCxvnSgb2njAOe7rSfroaDAj7rk38jpLsaoaF
	TxmpSmAMxp+tcIfjO5AKBvDh4/FF3daGK2mjEDBykVnZJdIowgtg2rc3rM3KQs3UUO41Cn
	G1PeO+t1d5LDhl/xzlEHeVpOY7T59IoLj8roqIJ7833f7I9IH608KK2HblKklw==
Message-ID: <0604e406-49f9-46f5-9622-e17a7271e253@bootlin.com>
Date: Mon, 8 Jan 2024 15:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] documentation: Add UBOOT_BINARY, extend
 UBOOT_CONFIG
Content-Language: en-US
To: joerg.sommer@navimatix.de
References: <41ed326b9aa4b74ee618378d54a2494f7d035a3f.1703845757.git.joerg.sommer@navimatix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <41ed326b9aa4b74ee618378d54a2494f7d035a3f.1703845757.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 14:59:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4745

Hi Jörg

On 29.12.23 at 11:29, Jörg Sommer via lists.yoctoproject.org wrote:
> From: Jörg Sommer<joerg.sommer@navimatix.de>
>
> UBOOT_CONFIG accepts a third parameter for the UBOOT_BINARY that isn't
> documented. To show its usage another example from the meta-freescale layer
> was picked.

Thanks for the patch!
I'd like to merge it, but it doesn't apply when I save your e-mail to a 
".eml" file and run it through "git am".

Did you send it with "git send-email"? Looking at the message source, 
some lines are mangled.

As the patch looks correct in the e-mail received on the mailing list, 
you could this time send it to me as a regular attachment, and try to 
send your next patch with "git send-email".

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


