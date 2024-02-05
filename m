Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880D5C48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 11:17:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.60764.1707131830769679095
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 03:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gx8gYYN7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8958C240009;
	Mon,  5 Feb 2024 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707131828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXteyNLteUoeh//XwgQMJwXNensVU8T4+q91O9kCqOQ=;
	b=Gx8gYYN7GW/jVw2frvEaxf1O0JUQaMEcIvp06T2NdWNdrhSSG0JGQmuwktzvvIPvDc5AWW
	bZbXozvecJ50DGZ6jCz/nTBpAQoisiaN2iQDB8Ak4ZEjCQ+Mt3VHmX/C7NcS2nTbnfoX0n
	GEnefBbMM7trVayrKCaTe5fRfFMLm6aas8eNtmSZzfum+apTDcLnREQ2t2YP2u4N8bSMJy
	YpO+2LqtA+vlJTfwSAbwMaXt8DHzILTds1iEatIFfYW4HV3fz9JrLMTXfQIrUCW2PnWOfr
	dZgjMxFD4F1Pte5k9r+lrRaG7hXU6YA2cnZT1yHYVCaMcrq/GzUrb6hSS9tLrw==
Message-ID: <8ece52f8-904b-414e-ac2c-a0f05f827e41@bootlin.com>
Date: Mon, 5 Feb 2024 12:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] contributor-guide: fix lore URL
Content-Language: en-US
To: baruch@tkos.co.il, docs@lists.yoctoproject.org
References: <7542f40a18bc1485daaf503d1ab05019be088142.1707119145.git.baruch@tkos.co.il>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <7542f40a18bc1485daaf503d1ab05019be088142.1707119145.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Feb 2024 11:17:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4810

Hi Baruch

On 2/5/24 at 08:45, baruch@tkos.co.il via lists.yoctoproject.org wrote:
> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   documentation/contributor-guide/submit-changes.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 95728c25c615..61f3157d602e 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -438,7 +438,7 @@ their e-mail clients will default to including your email address in the
>   conversation anyway.
>   
>   Anyway, you'll also be able to access the new messages on mailing list archives,
> -either through a web browser, or for the lists archived on https://lore.kernelorg,
> +either through a web browser, or for the lists archived on https://lore.kernel.org,
>   through an individual newsgroup feed or a git repository.


Oops, good catch, thanks a lot!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next"
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


