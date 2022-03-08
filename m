Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C247DC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 17:45:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.10919.1646761522305557519
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 09:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JPdIopg8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F24C2240005;
	Tue,  8 Mar 2022 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646761520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20lNjiXGSXRYUx/r0rYey+3XM2liOOf5WXKU8Bkykds=;
	b=JPdIopg8V5s3PbKcYknU3avw/0q6Nx2qyaX78jxn0DTQeU+38CjAjdsa/+4f0XUL9MCkiv
	rWQT1HPxChIvmx+0JfNhFloV9aba6Sh8YLdgr2pwxHjaVEIijHd0ytGxjRUhZ8YqgBmOQL
	PFGblueWZKJrhs78L4teoiJWcdvaVOpZ8tUQpOzQjukwAQ/rUrQuyuoeqsKSUbKyUBuNg4
	T45rkGxgeYEMYfqWm/GbAZyrENrJCOG7YiQESHTgRm6cQ+x530gZa/P4xXKiRfnEiducrd
	pMj7iyNJjHqfHUuwNEwyhKJzRznpYS4xslkfwVHp+mQ+lEfdzytChL+MWfA0FQ==
Message-ID: <c1899c24-a6cd-1714-1400-d4c22ce64ef6@bootlin.com>
Date: Tue, 8 Mar 2022 18:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [yocto-docs][dunfell 2/2] documentation: update for 3.1.15
 release
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1646749913.git.steve@sakoman.com>
 <df94586b9d514e35f05d3a33f6b31ee9b249ea93.1646749913.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <df94586b9d514e35f05d3a33f6b31ee9b249ea93.1646749913.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 17:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2549

Hi again Steve,

On 3/8/22 15:33, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  documentation/conf.py   | 2 +-
>  documentation/poky.yaml | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 01d5e00c1..4df8f55d1 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,7 +16,7 @@ import os
>  import sys
>  import datetime
>  
> -current_version = "3.1.14"
> +current_version = "3.1.15"
>  bitbake_version = "1.46"
>  
>  # String used in sidebar
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index e37ea420a..e0f8166f7 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,11 +1,11 @@
> -DISTRO : "3.1.14"
> +DISTRO : "3.1.15"
>  DISTRO_NAME_NO_CAP : "dunfell"
>  DISTRO_NAME : "Dunfell"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.14"
> +YOCTO_DOC_VERSION : "3.1.15"
>  YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.14"
> -POKYVERSION : "23.0.14"
> +DISTRO_REL_TAG : "yocto-3.1.15"
> +POKYVERSION : "23.0.15"
>  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"

Thanks for this patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

However, I'll merge it when 3.1.15 is out, at least for the bits that
Michael Halstead won't have modified yet.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


