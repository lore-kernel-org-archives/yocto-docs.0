Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4170C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:29:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10394.1647613744905758813
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GecMt4Ay;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 69A3E240016;
	Fri, 18 Mar 2022 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647613742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8yPbcUnrlPefRlTp6uvwkpvM8z4nJenJaQopZNEJuc=;
	b=GecMt4Ay5n2w5ZOil4fAxM0HPhO4+vY+kD2Z0uhEyU64tMazToUlGbrgoUDeymPyeR/Y5G
	vap+MjHiIex+DU0pZ4eynqCPzYUYZ/XlvzZdx7sK78aSsPjv175Hsn3Z4P55/3K7AJcfos
	qUBqMgj1TL1sQLxU5fFsC64bznwtvCmJMZS+kkAc1jONZkhPLWjjUqjr+WhYyJPXSVGAq7
	twhisLI0SlHDLNb3jXKbD93DSY1f+m6lo9f+lrYCs1Roazw99i/W634xYHLd6vjLpx4fMD
	KUWCCDrSfkLybUMXMI1tXa5JRs5EgLO7W2hfCwWYq9ZV5YzFzwptIRv3BiBdqQ==
Message-ID: <3f162097-8936-89b9-742a-b8182c4fa995@bootlin.com>
Date: Fri, 18 Mar 2022 15:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] poky.yaml: Drop unused YOCTO_DOC_VERSION_MINUS_ONE
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220318124306.1062149-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220318124306.1062149-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:29:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2633

Richard,

On 3/18/22 13:43, Richard Purdie wrote:
> This doesn't seem to be used anymore and doesn't make much sense,
> remove it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/poky.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index c8a890c40..89a059ef1 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -4,7 +4,6 @@ DISTRO_NAME : "Honister"
>  DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>  YOCTO_DOC_VERSION : "3.4.2"
> -YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
>  DISTRO_REL_TAG : "yocto-3.4.2"
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Good catch, this will make release management simpler!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".
Many thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


