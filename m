Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7220CC54798
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 12:57:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.11988.1708606630829790889
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 04:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o0Ehqr32;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3C891BF20A;
	Thu, 22 Feb 2024 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708606629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5dVcDOkIjU4cWkz1Dm55Yi1L1PsD6rukFCepzSaJmY=;
	b=o0Ehqr32UONYq2Rxu1f721IW94XGulh62l4RGYMnZjdSE5gjxZQ7xUqxBY0RRzsI0vven1
	MnvM+1YmcR+52wM2H6eNfH0SMhVUVuTVlmXJYdMt6ZWcZlnZ9Fx5dp3YlKCr+BAva6uHq7
	qPFFwwUJbHWTRDwK3ZQg6X1n5OSKRqYFYjbVUyHfJAske1b+O3ryEkv3mJ8aK/77JHgcqP
	RscTWPjAQ6hGh68/mTtgl1V6+QBEdS3fWViNcWaQLu0WvpAI26mYAdOf1sODV4TH3l4dtp
	RbIAoeghC7jnKPBY3vCli0KGyLCz3K9XHlPt32YyyoyLOpTkRtEF3N9m1NrKpQ==
Message-ID: <47ace772-d585-4585-b7f9-ff86b1f55cf6@bootlin.com>
Date: Thu, 22 Feb 2024 13:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: Remove PYTHON_PN from reference
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
References: <20240221230257.3551066-1-raj.khem@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240221230257.3551066-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Feb 2024 12:57:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4858

Hi Khem,

On 2/22/24 at 00:02, Khem Raj wrote:
> PYTHON_PN is on its way out, therefore its good to remove it from
> documentation so its used is not promoted anymore.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 14 --------------
>   1 file changed, 14 deletions(-)

Thanks for the patch. Indeed, it's been completely removed recently.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


