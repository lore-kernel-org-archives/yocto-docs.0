Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC835C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:21:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.39434.1669040471305976887
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 06:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nQTlk18D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 475FC6001B;
	Mon, 21 Nov 2022 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669040469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZE6nFpEt+PB+btTi7xHNmcUAvEiZvQQZ/0tpkP/Ppw=;
	b=nQTlk18D+01zkQbzXSgmmu541cRHmiWP0DwWHq9/B+apvm5j1zVefVfHg3qto0N/X+n14x
	k7l8w+wuFcgivZzxqyLALukIWYgAITvpj92ztFTGBe1ohVkZONBUfYsD5V5dyO+9vENUIH
	pDZJVSSxnRes7uMPIi9HAIs1NCrnP/8GHaU4ZGoW+fmnpEpTMN/e4+oCLWsHQFfe+bbagk
	bx9t41WswuqPajnc3IrWAbQrCpOwmd63XcO+jyqab6PjQpXAApOOmDQzkp1eM8MaA4K+Ma
	T4jct8Fw0okuoxephhZCggXyG2HXGLNEhDtmagrWYC4qMm5XNQaij+ya9buxUQ==
Message-ID: <e67e6253-2dc0-6c61-229d-0e06f66e1270@bootlin.com>
Date: Mon, 21 Nov 2022 15:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.21
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1668880480.git.steve@sakoman.com>
 <6496de481a9cb0a9ee9bb58ff44a9761a0b57fea.1668880480.git.steve@sakoman.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6496de481a9cb0a9ee9bb58ff44a9761a0b57fea.1668880480.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Nov 2022 14:21:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3494

Hi Steve

On 11/19/22 18:55, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index b6baac7d0..2cadb6989 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.20"
> +DISTRO : "3.1.21"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.20"
> +YOCTO_DOC_VERSION : "3.1.21"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.20"
> -DOCCONF_VERSION : "3.1.20"
> +DISTRO_REL_TAG : "yocto-3.1.21"
> +DOCCONF_VERSION : "3.1.21"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.20"
> +POKYVERSION : "23.0.21"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the update.
Merged in the "dunfell" branch.
Cheers
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


