Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A790FC433FE
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:44:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.430.1651682694500404170
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P++Eq8wM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 86CAC1C0006;
	Wed,  4 May 2022 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651682692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPphYcJWRbhkCR+6LQzydjZWcPOyMzyzne6/rQ8RJlw=;
	b=P++Eq8wM3WBFxhcl1N//WdrKixqO1nEkXGzuSepDZwbRU2SPIx+pcjbdGXc679tk3/CYub
	NJJqVoxqkrrPz5kq2CWR+M0Mz9dixsSmfqMYxm+UvmeOchHq91bmZHC+/wt9sYOkfZKpWK
	r5SgkWIN8DO4HppYet5PrLA/86NwVx2L7fcdXsYDGe++B37KRQaftXAi2TocuR3f8p/mKw
	r5rEuEp4sQq/GwJ8tR+K+KosFmTWJaguHv2w2VgcoQgebNMhffU+I3k5eAXXXF0W0h57RX
	x7snMlicCwd8duVBE/YVE5dnXMtjPOIRdGCWZDgvMA+J4Znaq+XyI1rC1u2h9Q==
Message-ID: <c6180a62-2087-dc67-5cf5-4a64b7151cdf@bootlin.com>
Date: Wed, 4 May 2022 18:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [docs] [PATCH] overview-manual: fix a forgotten link
Content-Language: en-US
To: Arkadiusz Drabczyk <arkadiusz@drabczyk.org>, docs@lists.yoctoproject.org
References: <20220504162024.24114-1-arkadiusz@drabczyk.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220504162024.24114-1-arkadiusz@drabczyk.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 16:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2917

Hi Arkadiusz

On 5/4/22 18:20, Arkadiusz Drabczyk wrote:
> Signed-off-by: Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
> ---
>  documentation/overview-manual/yp-intro.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index e574dfa5b8..f240ce0f4b 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -688,8 +688,8 @@ Sato.
>  
>  One of the most powerful properties of Poky is that every aspect of a
>  build is controlled by the metadata. You can use metadata to augment
> -these base image types by adding metadata
> -`layers <overview-manual/yp-intro:the yocto project layer model>` that extend
> +these base image types by adding metadata :ref:`layers
> +<overview-manual/yp-intro:the yocto project layer model>` that extend
>  functionality.
>  These layers can provide, for example, an additional software stack for
>  an image type, add a board support package (BSP) for additional

Good catch!

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next". It should be in "master" in a few days.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


