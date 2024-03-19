Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90B9C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:27:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10770.1710840429383542405
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 02:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AWx+fPZZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA4C5FF803;
	Tue, 19 Mar 2024 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710840428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUzmCvOSNaWVtHpheFl3eT12qsaenMaokcUjYDczysk=;
	b=AWx+fPZZw/vW3Ap8Z4W6V9KQz/2IhvyelvAKjxUnn9TkEuR6nxzYDTLCbhyOOetS2zV1Cr
	fUrrx2gMLc73EkdsqGJfZaI5UW58TPXUtTlRRv4mOdVGOpJ5FBnEW7Rc1C33GDJTKqIfYG
	B1rBnUmhQivaHLEzbTnk3jgqssfy+nYMCf95CbSrFzf7kqXMMw59iv7aEcm/56QgWFlQ10
	+z/0yH/IYIactCh6CnEB4BQ782m5rHuHHEiwfxgPvxqtzM1oA5giicV3LSVTkW9hzj4zQW
	qbmSsHek/TPcxqzMQ/W6v3zi+K3cQfB1iWbeJawq2NvgMWx3DF1lKeuQWGMJBQ==
Message-ID: <97f79f51-0fff-4c81-85bc-faf3468259cb@bootlin.com>
Date: Tue, 19 Mar 2024 10:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] dev-manual: improve descriptions of 'bitbake
 -S printdiff'
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240318150211.1192651-1-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240318150211.1192651-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 09:27:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4991

Hi Alex

Many thanks for the patch!

On 3/18/24 at 16:02, Alexander Kanavin wrote:
> Try to particularly emphasize that it can be used to find
> out why something rebuilds when it shouldn't.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/dev-manual/building.rst  |  7 +++----
>   documentation/dev-manual/debugging.rst | 13 ++++++++++---
>   2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-manual/building.rst
> index 7fcac33b754..e0d0aae85d0 100644
> --- a/documentation/dev-manual/building.rst
> +++ b/documentation/dev-manual/building.rst
> @@ -775,10 +775,9 @@ your tunings to best consider build times and package feed maintenance.
>         in the script for information on how to use the tool.
>   
>      -  *BitBake's "-S printdiff" Option:* Using this option causes
> -      BitBake to try to establish the closest signature match it can
> -      (e.g. in the shared state cache) and then run ``bitbake-diffsigs``
> -      over the matches to determine the stamps and delta where these two
> -      stamp trees diverge.
> +      BitBake to try to establish the most recent signature match it can


s/it can/it can find/ ?
IMHO it would clarify the sentence.
If you agree, I can make the change directly, no need for a new submission.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


