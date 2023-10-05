Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228C1E7C4F9
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:52:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10907.1696495938560358387
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 01:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JQqCdXqg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15AC34000A;
	Thu,  5 Oct 2023 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696495936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0gIH7nJMFqZtJOJcp4M7GVQQTLRdW+3ShAU6XuIS7Y=;
	b=JQqCdXqgkKFOhGTd21b/nXVxSA8v6KUh1M3zwqYDTy8Xt7wDyuD/Pa/crNl5S9qnaOrwOx
	JrctxdneexES68MyZOGTyMlr0/ysnCwRpiJHgCDQBeeGRHUZn+jJvaSkYQ+l6WP1fFv1Pg
	ReMI3FQBozldEBX6GuFG4C+NttSRDzuXEGeUn1qqeP3nrMHqc0lF4Y0lmVZvgTwYTvMw5Q
	vP8VRkb2NEm4HuRC3/iCKMBl5gt/w2tBzmRSJN9EstkYt9hNfjXjdpyOIqC7n8LFSbY/1Q
	WAZN+0l4tx3tNy5vaGerNZavm31LcY1PO7225mJGPz/WVo2GXuP7f6g++kHCHQ==
Message-ID: <a7b5802d-54da-93e4-9bcc-8b0c8ba685e4@bootlin.com>
Date: Thu, 5 Oct 2023 10:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: docs@lists.yoctoproject.org, Roland Hieber <rhi@pengutronix.de>,
 =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>
Subject: Re: [docs][PATCH v2] overview: Add note about non-reproducibility
 side effects
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
References: <20230926160049.1537656-1-JPEWhacker@gmail.com>
 <20230928182616.17453-1-JPEWhacker@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230928182616.17453-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Oct 2023 08:52:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4309

Hi Joshua

Many thanks for the update.
Roland, Ulrich, thanks for the reviews too!

On 28.09.23 at 20:26, Joshua Watt wrote:
> Adds an additional note about some of the side effects that can occur if
> recipes are not reproducible and hash equivalence is enabled.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   documentation/overview-manual/concepts.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index af825a98c..4e3f6425a 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -1963,6 +1963,15 @@ task output from the Shared State cache.
>      the stability of the task's output hash. Therefore, the effectiveness
>      of Hash Equivalence strongly depends on it.
>   
> +   Recipes that are not reproducible may have undesired behavior if hash
> +   equivalence is enabled, since the non-reproducible diverging output maybe be
> +   remapped to an older sstate object in the cache by the server.

Wouldn't it be very unlikely to have the same output hash anyway?

>   If a recipe
> +   is non-reproducible in trivial ways, such as different timestamps, this is
> +   likely not a problem. However recipes that have more dramatic changes (such
> +   as completely different file names) will likely outright fail since the
> +   downstream sstate objects are not actually equivalent to what was just
> +   built.
> +

Anyway
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into master-next.

Thanks again
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


