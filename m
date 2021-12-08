Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96236C43217
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 16:34:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.15533.1638981240545211660
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 08:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4CCDCC000C;
	Wed,  8 Dec 2021 16:33:58 +0000 (UTC)
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH] documentation: conf.py: add knob for loading
 appropriate objects.inv
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20211203103315.57685-1-foss@0leil.net>
 <16BED23EAE3BFB75.12270@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <1009e412-3bcb-9baa-f07d-5b2d53e2f66e@bootlin.com>
Date: Wed, 8 Dec 2021 17:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16BED23EAE3BFB75.12270@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 16:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2234


On 12/8/21 4:47 PM, Michael Opdenacker wrote:
>
> I'll take care of adapting and applying it on the currently supported
> release branches (dunfell, hardknott, honister). I'll do that directly
> in the branches, but let me know if I should submit patches first.
> Thanks again
> Michael.

Done. Dunfell was actually correct, hardcoding the right Bitbake
version. Hardknott and Honister were indeed using the master version of
Bitbake objects.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


