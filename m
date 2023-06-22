Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CD6EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 09:25:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.7358.1687425911751398790
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 02:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cmo7dQD3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687425909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSrWV4ep/f/VzhqNhJJ/UThfczb28KJ4LO3ySIfgpT8=;
	b=Cmo7dQD317U9/96GQ7StlS5a9JG5AuVPNLYS5Ft+8sKih97M4FIMo1yvREEf08u4ovEwUZ
	+pbuWhiZqm0rlJ6bHIw/AI85AhjY4o83WtpIMu6F2JpnbzisOB1WMTsV+29QqmmDEXCytd
	troEYYP8moPoYlY1OUVSd0SQcWkGMaJufR2Fwn3ta0E7MN9DrKEwugYEnOkDs1FPwOS4Mb
	rY0b8aP2fo3ca9SW0rn3bZix8KIrD2qlmEOtFzFAtLVk9cewELw63iQ9CCJm618GIBZl9X
	St/Pp2UQCnGzLCdUwMU/HoRClUqJTFjOuQ4v+Ez4uv6q0VRvf5ddpwo00LIU/g==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A431CE0014;
	Thu, 22 Jun 2023 09:25:08 +0000 (UTC)
Message-ID: <76c1c6e2-3951-3c84-b79d-8b7b04c94d36@bootlin.com>
Date: Thu, 22 Jun 2023 11:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: michael.opdenacker@bootlin.com, Quentin Schulz <foss+yocto@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [docs] [PATCH] docs: bsp-guide: bsp: fix typo
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20230621-bsp-typo-v1-1-08b8fb0ec502@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230621-bsp-typo-v1-1-08b8fb0ec502@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 09:25:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4021

Hi Quentin

On 21.06.23 at 18:42, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> It's meta-openembedded and not meta-openbedded, let's fix it.
>
> Fixes: de6e7c05fbcf ("manuals: stop referring to the meta-openembedded repo from GitHub")
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/bsp-guide/bsp.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index f2f5d4d95..4d64c65d9 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -109,7 +109,7 @@ them to the "Dependencies" section.
>   
>   Some layers function as a layer to hold other BSP layers. These layers
>   are known as ":term:`container layers <Container Layer>`". An example of
> -this type of layer is OpenEmbedded's :oe_git:`meta-openbedded </meta-openembedded>`
> +this type of layer is OpenEmbedded's :oe_git:`meta-openembedded </meta-openembedded>`
>   layer. The ``meta-openembedded`` layer contains many ``meta-*`` layers.
>   In cases like this, you need to include the names of the actual layers
>   you want to work with, such as::


Oops, my fault!
Good catch, thanks.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and fixed in master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


