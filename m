Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A92C25B7C
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 19:14:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.24604.1717010062813108497
 for <docs@lists.yoctoproject.org>;
 Wed, 29 May 2024 12:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lA3AWP2H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFAC76000B;
	Wed, 29 May 2024 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717010061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyCrHmPjJQfmCau9hdVRlGKD+f38zNR2mFCzZLJJuwI=;
	b=lA3AWP2HY4IHeo3h2l2iFLuDNZQpqevHyKIXXezpj6hhnPRPYTLqHRXfYYGltvqGCicOmM
	xn++Ta4l70w2/9TvqhzglHcsuQtbXLLp+QOJoaflILLjbdKMUw7i3/Es4dm7YJXyBDyIVg
	nRvqx1nPm5Sg/kO/3VXISgmxQM4XKBAL4AVUaxF2RnRcDRzeYbSa86Wzt6z5xKpp7OepYL
	FIxGLsQ8qik7Pz8nn7t5fI9tST5vUdo9w1fmGRCszpJrvPBn3lLHS/j9cuvsM8dRQDxjkj
	YJkoeEpxATncLIQnCCEA+W81YymQCvm5jsbYt54j0PDNHq9Z/DyMQbBXGM3ZcQ==
Message-ID: <1a5bc332-3c3d-48e0-8a97-58bb70813f25@bootlin.com>
Date: Wed, 29 May 2024 21:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [master-next][PATCH] migration-5.1: add the recommended
 pattern for S/UNPACKDIR definition
To: yoann.congal@smile.fr
References: <20240528175207.369758-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240528175207.369758-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 May 2024 19:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5265

Hi Yoann

On 5/28/24 at 19:52, Yoann Congal via lists.yoctoproject.org wrote:
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   documentation/migration-guides/migration-5.1.rst | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index c1cc711a4..b43fecc2d 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -59,9 +59,14 @@ Previously, :term:`S` was always created but after the recent changes it is no
>   longer the case. This means the check in ``do_unpack_qa`` triggers where
>   :term:`S` is not created by a recipe while it didn't happen before. This can
>   require to add an :term:`S` definition to a recipe that only uses
> -``file://`` :term:`SRC_URI` entries. Building C files from :term:`UNPACKDIR`
> -without setting :term:`S` to point at it does not work as the debug prefix
> -mapping doesn't handle that.
> +``file://`` :term:`SRC_URI` entries. To be consistent, the following pattern is
> +recommended::
> +
> +    S = "${WORKDIR}/sources"
> +    UNPACKDIR = "${S}"
> +
> +Building C files from :term:`UNPACKDIR` without setting :term:`S` to point at
> +it does not work as the debug prefix mapping doesn't handle that.
>   
>   ``devtool``  and ``recipetool`` have been updated to handle this and their
>   support for ``S = WORKDIR`` and ``oe-local-files`` has been removed.


Many thanks for this update!
Merged into master-next.
Cheers
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


