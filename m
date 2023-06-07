Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA197C7EE25
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 15:55:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1897.1686153307971845871
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 08:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hbpwlddz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686153305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhvhROKkGkTFLoFuZCDV9W3qB2s6jtJUNWk9oHIgXx8=;
	b=HbpwlddzOIHdo6Px9g01i93KMoQpPtqhAIiipgD9cPVEPaTzvEMulBC3OgV/+hUaL/UANY
	PYLB0v348vKuMeWGTuppvQIbFfZ2wlKb2YrGsykpZ8/J8AkZgdTLIF8iJp4DKZ5ODEDcuD
	61HBpv8MEjztRE5nznaM76k2Ri79K/YwpQoAHY2pD/uwR2Mu2sJt4F0+cXE4eWxOA1Hvf8
	TB/lKfksSUGqRoLtIhRXLlGFLWtSOccQKiIw6UD1bsq23WVGsKvpfSybsG+kQe0HM8Sgq4
	t/sy/vFkAfi5GNf50F44zyH4kp6qsJhH9ES63cu6y/ZGWOcVMD9QGIh2GQ9oyw==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698BF1C0003;
	Wed,  7 Jun 2023 15:55:05 +0000 (UTC)
Message-ID: <be6ae4da-6f42-ae40-3b3c-2afb7f40a739@bootlin.com>
Date: Wed, 7 Jun 2023 17:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Add clarification for SRCREV
Content-Language: en-US
To: beroset@ieee.org
References: <20230607135831.519561-1-beroset@ieee.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230607135831.519561-1-beroset@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jun 2023 15:55:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3990

Hi Ed,

On 07.06.23 at 15:58, Ed Beroset via lists.yoctoproject.org wrote:
> From: Ed Beroset <beroset@ieee.org>
>
> It was not clear to me what a "full revision identifier" was in the
> context of the note documenting SRCREV.  After clarification via IRC,
> this submission attempts to clarify what is meant to help future
> readers.
>
> Signed-off-by: Ed Beroset <beroset@ieee.org>
> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6a7888ab4..5b96e4efe 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7942,7 +7942,7 @@ system and gives an overview of their function and contents.
>         that if you want to build a fixed revision and you want to avoid
>         performing a query on the remote repository every time BitBake parses
>         your recipe, you should specify a :term:`SRCREV` that is a full revision
> -      identifier and not just a tag.
> +      identifier (e.g. the full SHA hash in git) and not just a tag.
>   
>         .. note::


Thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


