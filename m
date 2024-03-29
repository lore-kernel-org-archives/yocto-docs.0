Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C992FCD11DD
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:22:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.14592.1711711317116417036
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 04:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MxtHnDAh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 144AA240002;
	Fri, 29 Mar 2024 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711711315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9v4cH8NgoSaeb93dTXjInTPVcLbWmOBZ/Kues3GvErM=;
	b=MxtHnDAhe6B1iuW6tnzN/q/NQMMfZAa6ADbkEJ8jx/DdoXWoz0vwroldmLTnvXQMjgyQ1Q
	QNUk1ulnLAM42HZ39WScqouNPiCs9s+sf7v22gY2+jrfInrCkPI66Zas9hskhNqlq0biAU
	Swsv9mvwyUVmowbESk57grT9wpR7M7JAYYKt+nf2UTjppwAFXLkKZFgdCRKvgVmN/EFisX
	8Cun68rZGKjf6YYnj611pLWVqbRKDIjNy/IFTUrEcBK0G1sGJFNW980frJoEU/pESJ/ELO
	VWYeh4SpaTiQpIsV0WD2YoYxn9+oQp+NosyquCAcrGO3xVKvPpDWkINRTEF84Q==
Message-ID: <8b03f38d-4664-47da-b1b9-b0b6b87e3115@bootlin.com>
Date: Fri, 29 Mar 2024 12:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] contributor-guide: submit-changes: fix typo in
 URL
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
 <20240328-yocto-patches-v1-3-1124fa0bc532@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240328-yocto-patches-v1-3-1124fa0bc532@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Mar 2024 11:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5030


On 3/28/24 at 16:07, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> lore.kernelorg should be lore.kernel.org as the former doesn't exist.
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/contributor-guide/submit-changes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index b5a6e4240..baba1b659 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -438,7 +438,7 @@ their e-mail clients will default to including your email address in the
>   conversation anyway.
>   
>   Anyway, you'll also be able to access the new messages on mailing list archives,
> -either through a web browser, or for the lists archived on https://lore.kernelorg,
> +either through a web browser, or for the lists archived on https://lore.kernel.org,
>   through an individual newsgroup feed or a git repository.


Too late, already fixed in 
https://git.yoctoproject.org/yocto-docs/commit/?id=5962a09a120681c1328e05335c2f14fad06c63ce
Thanks anyway!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


