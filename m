Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295D2CE79D3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:16:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.40841.1695219375781931093
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 07:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d/9f7oK8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E44192000C;
	Wed, 20 Sep 2023 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695219373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtP7+SbsBHANw0IEMToGKiBxwKP8JDUg9Lf5rbt4Cu8=;
	b=d/9f7oK89zLrENUZBOh1GjfFMjBX89HkXw+PWV6STFyD2cIrnCj3Qhqlb2vX53bsCwl3Jm
	ooRmYzwMCfWqBZcOJk7uvC7afbXL26aXUQfCia+CHT+VtHXaMMeuONVFQ9iVVnFQld0DaZ
	aRVsvMgLznNG+mUCacndBAboG8VTZTvNFEfT033a7KNu3JttuSe8E7jAMOuC1Ct5p+YhtH
	DsAKuwxythzGNXsyuIg/Pg9Yuf0HbMyXmCzL5n0zpHmg/gLnXDioYDHLiosUgjxW4gwQzd
	rttZxbUGHDyx6F0ysSikMq0yLI5U3t+lAFk67LFbPtCpZqKI2p81A6CEwAZgPw==
Message-ID: <6e8be021-45ef-0b0e-5956-31fb1a252575@bootlin.com>
Date: Wed, 20 Sep 2023 16:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: yocto@pengutronix.de
Subject: Re: [docs] [PATCH 2/4] contributor-guide: recipe-style-guide: add
 some more patch tagging examples
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
References: <20230920100647.1038583-1-rhi@pengutronix.de>
 <20230920100647.1038583-2-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230920100647.1038583-2-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 14:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4271


On 20.09.23 at 12:06, Roland Hieber wrote:
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>   .../contributor-guide/recipe-style-guide.rst     | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 52ab4523c49f..4faadcd122d8 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -347,6 +347,22 @@ Here's an example of a patch that has been submitted upstream::
>   A future update can change the value to ``Accepted`` or ``Denied`` as
>   appropriate.
>   
> +Another example of a patch that is specific to OpenEmbedded::
> +
> +   Do not treat warnings as errors
> +
> +   There are additional warnings found with musl which are
> +   treated as errors and fails the build, we have more combinations
> +   than upstream supports to handle.
> +
> +   Upstream-Status: Inappropriate [oe specific]
> +
> +Here's a patch that has been backported from a pull request::
> +
> +   include missing sys/file.h for LOCK_EX
> +
> +   Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]

Could we instead use an example giving a commit instead of a pull 
request? With a pull request (like this one), it's hard to see what the 
final commit was, and we have to follow the link to double check whether 
the request was merged or not.

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


