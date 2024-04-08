Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB58C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 07:07:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.100749.1712560058774074541
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 00:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mpK6dWmf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3920D4000F;
	Mon,  8 Apr 2024 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712560056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYIROVtTPDHkDoHEyZ7NNFWUIk5lZRFndS54tvibfo8=;
	b=mpK6dWmffDO/ptYfi9jY+hOwdo7v8RzpsrMZjCdtJAJypZXWcgB9ltg47n132K6nuQuYgD
	Dh17czYoe0mQnCk3dvDCy96pYzB9DeBu0Szi4SjW5zXDV42hge4S7ij7UelpBe9lgUcF9e
	rN1UddDCqDfEfktVkrfLybjtOzUMQ5lEGDBqk9XYRC3SrhMcH/mOkSuirFt14jx19Xq+h3
	WZxtp922Wx0puVEiT1w5+nzFrVSQu+hORIbIsxBqqvE/ioY/iQW0+j3O8gtczAQeLgaWcS
	MzFTBXvxUiil9AHCfIcfRAWvSqLfIYJ5FY7AA3TOH9faHy5DKCmDzHBYewzfSw==
Message-ID: <0d11df44-5226-4daa-a0ab-9dc32a15eafc@bootlin.com>
Date: Mon, 8 Apr 2024 09:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] kernel-dev: join mkdir commands with -p
To: joerg.sommer@navimatix.de
References: <31036f61cb79b07a4e774d799ec7bb8cf0bdbf07.1712312060.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <31036f61cb79b07a4e774d799ec7bb8cf0bdbf07.1712312060.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Apr 2024 07:07:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5089

Hi Jörg

Thanks for the patch!

On 4/5/24 at 12:14, Jörg Sommer via lists.yoctoproject.org wrote:
> From: Jörg Sommer <joerg.sommer@navimatix.de>
>
> To make it more obvious which directories are needed, pass only these to
> *mkdir* and use the option `-p` to create the missing parents.
>
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>   documentation/kernel-dev/common.rst | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index 0cee503346..9a7a1907f6 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -315,11 +315,7 @@ home directory:
>   
>   #. *Create Structure*: Create the layer's structure::
>   
> -      $ mkdir meta-mylayer
> -      $ mkdir meta-mylayer/conf
> -      $ mkdir meta-mylayer/recipes-kernel
> -      $ mkdir meta-mylayer/recipes-kernel/linux
> -      $ mkdir meta-mylayer/recipes-kernel/linux/linux-yocto
> +      $ mkdir -p meta-mylayer/conf meta-mylayer/recipes-kernel/linux/linux-yocto
>   
>      The ``conf`` directory holds your configuration files, while the
>      ``recipes-kernel`` directory holds your append file and eventual
> @@ -964,9 +960,7 @@ Section.
>      additional structure to your layer using the following commands::
>   
>         $ cd ~/meta-mylayer
> -      $ mkdir recipes-kernel
> -      $ mkdir recipes-kernel/linux
> -      $ mkdir recipes-kernel/linux/linux-yocto
> +      $ mkdir -p recipes-kernel recipes-kernel/linux/linux-yocto


I definitely agree with your change! That's giving bad advice otherwise.
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


