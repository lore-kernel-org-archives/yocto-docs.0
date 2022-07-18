Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF72C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 08:37:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.24891.1658133449293038620
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 01:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p1+6e7Eb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CDFD71BF208;
	Mon, 18 Jul 2022 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658133447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37QDFq7IvPUDiYx477RRiI2JsrEQkYvG5wDAqUYhBuA=;
	b=p1+6e7Eb1e35me0DzQAYS5ufJsNfWdvjGmiIlDd8oIRdBnMrZDhWxPn21pkHmM9ui4Ad1i
	L8q0z5w3QSlZRZBl277OW7cdMIB3aDHjDpV8MfRgWqjNEO/KIrkPhK5YlIRKGSoI9Wn+fs
	64+Q1MZzHiKmWSU/NdSXd9syiK7zc8yeiLiLahOPPh4uO5g3yYFZld/mby5IcURMrhpSYn
	e+RGCHx+ZjAZ9CggtPhJl9WpC+sjWs+FousbpOzstfKDkMU7+bO7ZhGs+jax5w0WCBg4aF
	3jITlsvZz1BDArCFc/0iT4bYyn5WD8hAv/Xt/zxU+kPtqbY9enk7X7pKQD1JMw==
Message-ID: <75bf09d6-6a2d-781d-f396-cf10693e83d9@bootlin.com>
Date: Mon, 18 Jul 2022 10:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.18
 release
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1657636746.git.steve@sakoman.com>
 <4901296525b7b3d3c6d2560c4b6b3630b6d58835.1657636746.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <4901296525b7b3d3c6d2560c4b6b3630b6d58835.1657636746.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Jul 2022 08:37:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3056

Hi Steve,

On 7/12/22 16:40, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index abbd4332f..e523b003f 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.17"
> +DISTRO : "3.1.18"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.17"
> +YOCTO_DOC_VERSION : "3.1.18"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.17"
> -DOCCONF_VERSION : "3.1.17"
> +DISTRO_REL_TAG : "yocto-3.1.18"
> +DOCCONF_VERSION : "3.1.18"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.17"
> +POKYVERSION : "23.0.18"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>

Thanks for the patch.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "dunfell".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


