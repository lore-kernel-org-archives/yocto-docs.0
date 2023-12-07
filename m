Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE0C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 18:41:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.92597.1701974499054188171
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Dec 2023 10:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jsH4KBK1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 020AB40005;
	Thu,  7 Dec 2023 18:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701974497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkvZ4xRCUGOgItBHzh8REI2Nuq0c9OIbqAMYDCPl8hA=;
	b=jsH4KBK1cgu5mQKeRBYPweH4YGVsCZ+hVFtzSHdLmvGLVefL9dopaOh+D3bxpYumfQu/vG
	ycZNJs0+cF1rIIb9ARvAF6Di+EicHVlKcKQncwy8A6+a2j/jARCJdRk+si9MVGMHq8BDDN
	PECpFXWWrjgCbxmjRaodawa/tYqE0IbmsDMqSOHO0Lx0MP3+ykeM8RY6H9OiNXLm+DbjLy
	KYSPSubHUOuWm4XfwIeOqwQAXZNRO0c/nUCyeM6oFfqQELFpDotVGwMvqHFNgvNtbZ+9pQ
	4J4gOg/cKpHdLMG6paw5owcpMVo3fQFq5Hh+kCsXvlOf+zegiadlZf9Uc0L3dQ==
Message-ID: <7d157aa0-0db0-44cc-9a44-8d941aa66f6c@bootlin.com>
Date: Thu, 7 Dec 2023 19:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.30
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1701872735.git.steve@sakoman.com>
 <097511f227abbef31409fe36734795b879471868.1701872735.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <097511f227abbef31409fe36734795b879471868.1701872735.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 18:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4668

Hi Steve,

On 06.12.23 at 15:26, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 132b772c1..54a1c3203 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.29"
> +DISTRO : "3.1.30"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.29"
> +YOCTO_DOC_VERSION : "3.1.30"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.29"
> -DOCCONF_VERSION : "3.1.29"
> +DISTRO_REL_TAG : "yocto-3.1.30"
> +DOCCONF_VERSION : "3.1.30"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.29"
> +POKYVERSION : "23.0.30"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the update.
Merged into the "dunfell" branch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


