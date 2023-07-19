Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B062EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 08:14:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.9198.1689754449958246773
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 01:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Is2QWRvn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F68FF80C;
	Wed, 19 Jul 2023 08:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689754448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/x/J53ruX2cYYSSu19dw5XaQy2hdMf9SNO2GEpOmYE=;
	b=Is2QWRvnTPxHidXM5DXD0/bOc3qVJwlBxG7qSPOXV69lVTMe8jMumgjMoQjzOukvjMmk34
	notuo248aFHlcnXNHZ1g1hUAA5PiRi0QJDgIoXSCPR4M9qgOr3zeT0977VJU6ocAMz3n9d
	38FVtpEH9vAJ2xBPVSwG9lDxSGs6XLmSLOObFzCQBJpt6euQwPjHka51voEs3b4LxUWEXr
	/Pht/WAhQOL5XHps+9NjPlsazP+6QiC1uinLrv3IQgNsgsryT+hAS02lWEf8QnYrFDVcKu
	DLUKrtYu3BogMXyNtoNfMbE901qMJzB2ZD4xdKaD1ZzcNwp8TQBB41PRoE72uA==
Message-ID: <69b804db-6718-75a2-9f63-8554a0faff58@bootlin.com>
Date: Wed, 19 Jul 2023 10:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.27
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1689707871.git.steve@sakoman.com>
 <cbb8e7fbc366a55c0eaf9dbf19dfdf0825383e93.1689707871.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <cbb8e7fbc366a55c0eaf9dbf19dfdf0825383e93.1689707871.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Jul 2023 08:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4063

Hi Steve

On 18.07.23 at 21:19, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index ead58a970..15b08723d 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.26"
> +DISTRO : "3.1.27"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.26"
> +YOCTO_DOC_VERSION : "3.1.27"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.26"
> -DOCCONF_VERSION : "3.1.26"
> +DISTRO_REL_TAG : "yocto-3.1.27"
> +DOCCONF_VERSION : "3.1.27"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.26"
> +POKYVERSION : "23.0.27"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into the "dunfell" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


