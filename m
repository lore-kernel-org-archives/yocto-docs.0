Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDE7C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 15:36:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.30289.1699630557885666725
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 07:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dcZkn2L5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E15701C0018;
	Fri, 10 Nov 2023 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699630555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8MSQXupnP+3Vw/KU3t5k9W1hrHKhxfQ0aavf9rv4ic=;
	b=dcZkn2L5ikcEvV/z+xciVpbZm/xVxNbtYK8EPhxXbfDVX5RyeJTVFQZVSh94Mv7zEp3AcP
	RmxT3yYKjxDsyC8IIKeuvHdllBxEJSBzKMJbip5wlvBUJVr89qT9/4qatfajs3L9O2axR2
	m+L1nxRJJSwToj0liI32UwuY0p7ZR+wyrheKZNKSI2yu63u0WTvGQiX/JxygtyXpH3xwEg
	qsxBx3lL2LkkSXQk3WeMLp1xu5mZUiWD6/3AN49Zr6z86wh7oexFQ5voKxRVveE5lPVpRL
	okec4O75eMYOyzoy2zFlrqhO0zzWt6+dF/927IqjmD2RKvK/XxTF9ry1nkZzzQ==
Message-ID: <c4875252-c9c2-4b7d-95e0-19b88aaf8d20@bootlin.com>
Date: Fri, 10 Nov 2023 16:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: Fix reference to MIRRORS/PREMIRRORS
 defaults
Content-Language: en-US
To: Paul Barker <pbarker.renesas@gmail.com>
References: <20231108162835.4405-1-paul.barker.ct@bp.renesas.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231108162835.4405-1-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Nov 2023 15:36:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4614

Hi Paul.

On 08.11.23 at 17:28, Paul Barker wrote:
> After the following meta-yocto commits, MIRRORS & PREMIRRORS are no
> longer set in the poky distro config file:
>
>    67b79df4fbff ("poky.conf: remove redundant MIRRORS")
>    1b71a3b9418f ("poky: Drop PREMIRRORS entries for scms")
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Many thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


