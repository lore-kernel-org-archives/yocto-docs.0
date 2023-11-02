Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1582C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:02:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.27419.1698919374215607479
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 03:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Py6Tfj4O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32167C0008;
	Thu,  2 Nov 2023 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698919372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7QdSvDFgMglRW97hsBgug6LpDGQTBRiJKAiVLRNL50=;
	b=Py6Tfj4OU/Avun1tNuzNOdokjXZb9HMfU99EBH+YUTU/KPrnz6tdKn5B0sYuXO5RiVaERR
	3lG+OjZv9ADJrkOLjaqGABrbSqAX40nqFFFrKiVeTinN1fdCFXqG8u/uI+f4KadFxxICgh
	pbDYyGj1SSJZD2S5QVdrFHtJ1I+gBwdE/d6TcuYscR6BcBON5fDIL2zxDYsXQ9M04V3OFN
	neV0uzjxneSIqPNxfJ/CplmXLssi6wnGojGvW+KMbPynctZiiplzm/Ncr8hS4OAg97GXJo
	mOP/vyn53loUGygQsUeLzCiUsUFvTdc44E8V6DXZptmccMd0BPD0f3cpaqDIGw==
Message-ID: <16cddfa0-f6c5-4f46-a2cf-aefb45a083d3@bootlin.com>
Date: Thu, 2 Nov 2023 11:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 08/14] obsolete SERIAL_CONSOLES_CHECK
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
References: <20231101172706.81576-1-ross.burton@arm.com>
 <20231101172706.81576-9-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231101172706.81576-9-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 10:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4565


On 01.11.23 at 18:27, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> ---
>   documentation/migration-guides/release-notes-4.3.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
> index 40a923f36..aab63f65f 100644
> --- a/documentation/migration-guides/release-notes-4.3.rst
> +++ b/documentation/migration-guides/release-notes-4.3.rst
> @@ -89,7 +89,7 @@ New Features / Enhancements in 4.3
>   
>      -  `ttyrun <https://github.com/ibm-s390-linux/s390-tools>`__, starts
>         ``getty`` programs only when a terminal exists, preventing respawns
> -      through the ``init`` program.
> +      through the ``init`` program. This obsoletes ``SERIAL_CONSOLES_CHECK``.


Good. I also mentioned this in the migration notes (see on master-next).
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


