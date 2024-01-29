Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18555C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 14:39:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.16411.1706539173212973047
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 06:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TMKyn9Ty;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF9BC0004;
	Mon, 29 Jan 2024 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706539170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYLajHj794ju3yjn5lHxZj6Qh81W8nAY073QZpAOS4I=;
	b=TMKyn9Tyc7EOU/kiedvia4zobGzMfZdSm998LFJxgyZE2OlcScsvDshkxmZa35Ceh/WnMu
	/alWy+EOSJgmZ7d1qI/9CceLGhrdW3ipXpPMFu0sEaBY4BmFTLxUW9B47+vFWYZfOSsirQ
	uBtHPrUH+4dosOh41G7qRXOQAj3Lda1ap5sIuLiQneC2ZPSa62P6XAzihZ6pUEWolyxVp2
	aFMRCX4B/4Oe2p9EZm510FuOfO51ZMe2G1mFw/qJQJjjhSu8djPr7FNzSx0vaEPpEgDUEh
	fY/XXxUBHpOasRjfGHFIQ3WolIBMfBzI3aSNCblfb4at4PqedF4AFav4rpGgLQ==
Message-ID: <5858ee0c-28f0-45ed-ba2d-4aa2bbe34e0a@bootlin.com>
Date: Mon, 29 Jan 2024 15:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] bsp-guide: correct formfactor recipe name
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240125164118.6943-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240125164118.6943-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jan 2024 14:39:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4796

Hi Simone

On 1/25/24 at 17:41, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> This recipe was renamed some time ago. Update the name here as well for
> consistency.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   documentation/bsp-guide/bsp.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index f92b1177b..29c69a930 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -336,7 +336,7 @@ the :yocto_git:`Source Repositories <>`:
>      meta-raspberrypi/recipes-bsp/formfactor/formfactor
>      meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi
>      meta-raspberrypi/recipes-bsp/formfactor/formfactor/raspberrypi/machconfig
> -   meta-raspberrypi/recipes-bsp/formfactor/formfactor_0.0.bbappend
> +   meta-raspberrypi/recipes-bsp/formfactor/formfactor_%.bbappend
>      meta-raspberrypi/recipes-bsp/rpi-u-boot-src
>      meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files
>      meta-raspberrypi/recipes-bsp/rpi-u-boot-src/files/boot.cmd.in
> @@ -620,7 +620,7 @@ You can find these files in the BSP Layer at::
>   
>   This optional directory contains miscellaneous recipe files for the BSP.
>   Most notably would be the formfactor files. For example, in the
> -Raspberry Pi BSP, there is the ``formfactor_0.0.bbappend`` file, which
> +Raspberry Pi BSP, there is the ``formfactor_%.bbappend`` file, which
>   is an append file used to augment the recipe that starts the build.
>   Furthermore, there are machine-specific settings used during the build
>   that are defined by the ``machconfig`` file further down in the

Good catch. Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


