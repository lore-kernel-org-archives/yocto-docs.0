Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12DCCD5BC8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 14:20:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.9809.1695133248230532178
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 07:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gV3nPX//;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39E5B1C0016;
	Tue, 19 Sep 2023 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695133246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EViZriSDjjRxSKZhlpw5xCvjyhG873zAAvhDRwQZiXE=;
	b=gV3nPX//b3CPp0Lobvy3KEjXJ5RwpuZi2PSDCrdNRkaC7TePCAE42tOkWLHlItWay30Xhs
	/EJFQEG7kaEUKeKA5IR5LxIKFL9rb+tMgSxJIn223UJAqNgUUg2lk8T/3VDZu71FmDG4i7
	QDtdypAY+GNIDVxC1rXBRsjtiQPjBpz/XPolWUL6cg/FhW+efI9fePJPEv9sEMMXoybv52
	phLfM6JoukkrzLo1OmT9Ak6F4TKTfUqRqQLQB5QXl6CxR5foCHPYHwRm4vmwMXQjqo9Qw9
	u71mgswbriWvAtvvmVhBdLIamlTHiVT+/MkhuxJ+E5tGiESCgTC+XU52Y3PUMA==
Message-ID: <95da7d19-f086-2468-970d-477c8287878a@bootlin.com>
Date: Tue, 19 Sep 2023 16:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [RESEND] [PATCH] ref-manual: point outdated link to the
 new location
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>
References: <20230919125757.1571746-1-rhi@pengutronix.de>
 <20230919125757.1571746-3-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230919125757.1571746-3-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 14:20:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4234


On 19.09.23 at 14:57, Roland Hieber wrote:
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>   documentation/ref-manual/qa-checks.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
> index 6fdb0fbde9a8..fbab5a1d7bdf 100644
> --- a/documentation/ref-manual/qa-checks.rst
> +++ b/documentation/ref-manual/qa-checks.rst
> @@ -762,8 +762,8 @@ Errors and Warnings
>       recipes in OE-Core) and ``patch-status-noncore`` (for recipes in any other
>       layer).
>   
> -    For more information on setting Upstream-Status see:
> -    https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
> +    For more information on setting Upstream-Status see
> +    :ref:`upstream-status`.


Thanks for this one too.
I adapted the link so we can just refer to the section from its title.
Merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


