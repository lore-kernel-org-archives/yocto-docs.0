Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942EBCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 17:51:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.45273.1712253064067229622
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 10:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TsLnpuQC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E41DCFF804;
	Thu,  4 Apr 2024 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712253062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbysJu9ZHLwXXzRoekK6vpbVieGJVNQ+Zs1vQGs/2hY=;
	b=TsLnpuQCpxO2IJX/aVb4l8MNcgHGPqO4yS21/mJvDbf1AxaHd573BMx6E4PscSDdcdZuXX
	n2DIZD/OHChuEsm1WirXPHG8UKjfFHB8x3GYbCv+WbVikayt3e20aGiSOBVk5qUlNXfNyg
	XhsWXV4PzR3KgQATxde0xih5/AVTzwpvigWfnB1jC9VJHA7F+T6uzveTcCwTw63N2LHNco
	/mQ6Qwtx5rtaiZIhdM3j/KiJi4n2zkoeGdKGfpNyerkLb+202g4TTydRYZUWUjSu7ZQi03
	vp7ulUqwCMrucEDpElyxcnG2nioSv53ywYiY3zWToq1uGK3dALlnWkVP7nhNAw==
Message-ID: <6feed89a-4a66-4fce-9749-6d0da7a04d86@bootlin.com>
Date: Thu, 4 Apr 2024 19:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: thomas.petazzoni@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [PATCH v1 1/5] release-notes: add changes to wic
To: joaomarcos.costa@bootlin.com
References: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
 <20240404165620.2248838-2-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240404165620.2248838-2-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 17:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5063

Hi João,

Thanks for the new notes!

On 4/4/24 at 18:56, joaomarcos.costa@bootlin.com wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Summarize changes in 'wic Image Creator enhancements' item.
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   .../migration-guides/release-notes-5.0.rst         | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index adc1597bb..a56995cc9 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -26,6 +26,20 @@ New Features / Enhancements in 5.0
>   
>   -  wic Image Creator enhancements:
>   
> +   -  Allow the imager's output file extension to match the imager's name,
> +      instead of hardcoding it to 'direct' (i.e., the default imager)


I replaced 'direct' by ``direct``.
Let me know if I was wrong. Not too late to change.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


