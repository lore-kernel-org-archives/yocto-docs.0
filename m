Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F75EC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 13:11:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.46021.1712927461520222744
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 06:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IucV7TrV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F98C240008;
	Fri, 12 Apr 2024 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712927459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3feszqe+m36t9dBV9WkxxLIJtCT+5PMHBwPP/BFia4=;
	b=IucV7TrVmohORMc8Dfj5d02at8Ns9k6I/mo/WjxAAQQJy3zH0x4bXs98bYFCeNGmbG8LyW
	FZK4s0428JVvAcVIBoU+/UiGv4NO1AJ+xsXIgAKzQD0vg80FaC7OUdJsIKV5qFOoA8ESeq
	492IvjoCwcp3aZcGUZmRBzV13FuH2eCXJEIahDhsMYioxDnkuW8siFOZUQ42VSH/Oz1BVq
	X3xYabXzGjeI2tD27EZ6vSu7TL9bHR8GKI5JJ2QMR0BeSVBFbFDu7qT4AWFg61RcLJD8Hv
	lgf8vZA+5NM3YI2WvobLi8+2e/GhGEg/eKROmOpOp5Xk5zbVLNl05zwtr4rBLw==
Message-ID: <f799b63a-2487-4e18-947a-e8ad9ada34d0@bootlin.com>
Date: Fri, 12 Apr 2024 15:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] release-notes-5.0: add devtool improvement
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20240412101957.2071854-1-chee.yang.lee@intel.com>
 <20240412101957.2071854-4-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240412101957.2071854-4-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 13:11:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5121

Hi Lee

On 4/12/24 at 12:19, Lee Chee Yang wrote:
>   Devtool improvement:
> +
> +   -  Introduced new ide-sdk plugin provides the eSDK and configures an
> +      IDE to work with the eSDK.

Tried to make this clearer:

   -  Introduce a new ``ide-sdk`` plugin to generate a configuration to use
       the eSDK through an IDE.

I actually squashed all your contributions into one commit, and merged 
them into master-next.
Not too late to make corrections though!

Many thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


