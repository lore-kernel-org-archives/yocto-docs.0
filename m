Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7A4C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 15:49:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.100.1704728985204220045
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 07:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D3FHtlRw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EACA4000A;
	Mon,  8 Jan 2024 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704728983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pKN4/GdAjGesVhLG6/epXP2aXNBSlTsWAVYdE5rtg0=;
	b=D3FHtlRwpY5+5glsb1x98lLXSt2YAIKP88IXRiK8eFPyJXTekPKaxcb2cFnjc8h7fcQ/h6
	iLzy2uWtQ1KdwE7pW6DUoUSyyaHCPBsqX9pzkIlMoZP+i8kc7Jf3SdwXr9OmeANrbf2v+5
	hq0OCXeqpC37PAZ5lsnHt5ah1kJAd/ZCbv+UxBcsHTitXU2bH0YXQiyqTVpH7gJs9t8afr
	S45rGVZK3RvdfE6KCvSxKGbQzaBtHHPcL2UhN6QKnFSmimrxjhWEnPeC9Y7cW1TZDTmfMg
	1dBUZnbJaR3jIJvgTuDrKx/iGdjCQkROHdQ5fZ8qZVzyVIp7l4642a6eTqD5uA==
Message-ID: <9264a711-4b1b-4316-9fa3-872948071f19@bootlin.com>
Date: Mon, 8 Jan 2024 16:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: update license manifest path
Content-Language: en-US
To: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
References: <20240103192535.1129768-1-iillyyaa@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240103192535.1129768-1-iillyyaa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Jan 2024 15:49:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4747

Hi Ilya

Many thanks for the update!

On 03.01.24 at 20:25, Ilya A. Kriveshko wrote:
> After changes in openembedded-core@1a4ab9f, image licenses moved one
> directory down into ${SSTATE_PKGARCH} subdir.
>
> Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
> ---
>   documentation/dev-manual/licenses.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 3b9190d47..57713effa 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -330,11 +330,11 @@ completeness.
>   
>   .. note::
>   
>      The Yocto Project generates a license manifest during image creation
>      that is located in
> -   ``${DEPLOY_DIR}/licenses/<image-name>-<machine>.rootfs-<datestamp>/``
> +   ``${DEPLOY_DIR}/licenses/${SSTATE_PKGARCH}/<image-name>-<machine>.rootfs-<datestamp>/``
>      to assist with any audits.


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next. I'll also update the "nanbield" branch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


