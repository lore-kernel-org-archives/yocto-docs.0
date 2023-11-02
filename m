Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0856C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 09:41:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.27135.1698918110103533492
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 02:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ik7bz4m2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7400BC0005;
	Thu,  2 Nov 2023 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698918107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zCnrVag9zEyohmjJaf/y7ga7FAOkMQKL5D9uec6Dsc=;
	b=Ik7bz4m2LXNZC5lDqW7r2w0K38uYs3K/JcDOZOwOOM3QAxDgvv5R9360J/TwjCc53qfae3
	vVr5EsJ2Pbp1aeJnLlosyzpUrtHgCBMIFU2di3SbCwfQLTQuBqKAhG8azY3IOgvhaiMV13
	B0IpE8jwTdW2xlJNRbvIq2VruQzSDcXDcB1KKBEeN/e8rvYwvTGL1cHDO1YPDeMWbnrz3w
	MJHv9o9HJ2p2GVS4yvMoF+AAs+8eRdClfCaue7FrFuzvLwbPw+EFA7ZS6p2buNpVuqQaCa
	EeJMGGe7BwS+fi4z4jfiCHYYCwrY04rscSxwLEay8yde6EUx8c1QMpjIHufrgQ==
Message-ID: <4e756817-a697-4fe8-9990-51fd30eb8025@bootlin.com>
Date: Thu, 2 Nov 2023 10:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org, nd@arm.com
Subject: Re: [docs] [PATCH 06/14] mention cdn
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
 <20231101172706.81576-7-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231101172706.81576-7-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 09:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4563


On 01.11.23 at 18:26, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> ---
>   documentation/migration-guides/release-notes-4.3.rst | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
> index 6249154d7..f2bc42f53 100644
> --- a/documentation/migration-guides/release-notes-4.3.rst
> +++ b/documentation/migration-guides/release-notes-4.3.rst
> @@ -8,6 +8,8 @@ New Features / Enhancements in 4.3
>   
>   -  Linux kernel 6.5 and 6.1, gcc 13, glibc 2.38, LLVM 17, and other recipe upgrades
>   
> +-  The autobuilder's shared-state artefacts are now available over a CDN.


I actually added a link to jsDelivr, which deserves recognition for 
their free service to Open Source projects.
See for yourself in "master-next".

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


