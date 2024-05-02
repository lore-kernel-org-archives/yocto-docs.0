Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D022DC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 19:18:50 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.3511.1714677522353007896
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 12:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=geqHEMWe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16D9D40004;
	Thu,  2 May 2024 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714677520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PwPBPosg6pVQXU9zZshEC3Wwt3MeV6a4vqaxNFgbCvo=;
	b=geqHEMWeUB4AK8mBJMU+a08i+O77gLYCNHboTqi6Hvd+fliXQty66onRH6r4lWYvNuPdTM
	1zs3nx0mJr652ydtW2CaNc0V5fvrj78Hjppy7GisniyfxdtwPRdgmj07txWGRUXh2HJk4B
	Z2dah2QYC+LcUBrDjKYsc+L1kWt9XpjMWEa3pzUV9/n3/oErW3kN97QrXb1xgjLBuQ/Xqu
	3+F0yOdkMM7igtayH9EP72/n7y40CGlqyZWGJLaGPHNORDPXTI2IkSs3T9EtBJrD985Yt5
	RAtgUWo2HSik8yuLHGGMaMwTvI1zx9qhGNZgOodyLkBAhdBx/c/MmmxMjdQKnA==
Date: Thu, 2 May 2024 21:18:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <tim.orling@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH] contributor-guide: recommend format.forceInBodyFrom
Message-ID: <20240502191839a351b43b@mail.local>
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502152701.1798568-2-tim.orling@konsulko.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 19:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5205

On 02/05/2024 08:27:02-0700, Tim Orling wrote:
> We are seeing a lot of patches failing when the From:
> line is not contained in the message body. It is probably
> better to just recommend to force the in-body From: to be
> present globally.
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  documentation/contributor-guide/submit-changes.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 47a416b24..c292a143a 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -65,6 +65,11 @@ use to identify your commits::
>     git config --global user.name "Ada Lovelace"
>     git config --global user.email "ada.lovelace@gmail.com"
>  
> +To ensure that your patches are formatted properly, it is also
> +recommended to set::
> +
> +   git config --global format.forceInBodyFrom true
> +

I do believe the current documentation already points to a working
solution:

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-your-from-identity

Doesn't that work for you?

>  Clone the Git repository for the component to modify
>  ----------------------------------------------------
>  
> -- 
> 2.43.2
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

