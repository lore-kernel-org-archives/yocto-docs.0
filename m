Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C338C54E41
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 15:59:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.28566.1709222392096240629
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Feb 2024 07:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hdAW0R6s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03043240002;
	Thu, 29 Feb 2024 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709222390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mhbopu4w9uSF5gmTHR8dXV344xIGGzBm8MQb12i9x8w=;
	b=hdAW0R6so7+UB23MXOK8hYBsDIfCj0nJdERZFpnKT/96vKp+/D6DXaEdzT29KNuNCb1w7b
	XKM0vxMu68ks9rh06lxbIB0qmwl/ZZzLn1XJx/Z8/OEAGr90PRu1YpnuInceY6I8r9GElg
	TKuC1ru25Y6X1mFhXqV14Jg2bT9z+Jm/CpnHHi+K6tuM47RtqXirR8J+lpYDjLAu3vl8WV
	xiXt+Q9YidMk5g0z76HHg+f7fyQuE7+EZ7yETLQFSWPc3wvgtQtgJEB3MiJvow3uOeT+Wu
	vgrqNmDOLl8BVqU5oRbCCu7+IJt5Rx3+woIMfHzNHai/QLxK1QRFmp5WYU7/yw==
Message-ID: <39304c7f-7327-487c-a7af-8689eca95958@bootlin.com>
Date: Thu, 29 Feb 2024 16:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.32
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1709221377.git.steve@sakoman.com>
 <4a14c4e826dfb7019c41b359919569c8640cfc5e.1709221377.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <4a14c4e826dfb7019c41b359919569c8640cfc5e.1709221377.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Feb 2024 15:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4921

Hi Steve,

On 2/29/24 at 16:43, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 0e04203fa..e41e355fa 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.31"
> +DISTRO : "3.1.32"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.31"
> +YOCTO_DOC_VERSION : "3.1.32"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.31"
> -DOCCONF_VERSION : "3.1.31"
> +DISTRO_REL_TAG : "yocto-3.1.32"
> +DOCCONF_VERSION : "3.1.32"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.31"
> +POKYVERSION : "23.0.32"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "dunfell".
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


