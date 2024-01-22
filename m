Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538ADC47422
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 02:17:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.63951.1705889823829805502
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Jan 2024 18:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nTvs1DAq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D609FFF802;
	Mon, 22 Jan 2024 02:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705889821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1//eI/PA8bd2MakpcIVpJWT8HlZuTg00gBzsBVey0M=;
	b=nTvs1DAqLYBgZYO3i6besPYnFJB85lJwI0LYJEhyh7fLvoZTNlDtAj0dGvkJuyWDKNEncc
	8aUG/fV5ujuzVzmin/RpWMLk4VxwkD0KeaEkPzQxmbJMLAlo/D5D4/tMAhvH0yAStuWFVP
	h4ZaHBXuTHMmQg+2XbAqjl+fTxhxGLkrAN48o/RwElNDWaWJNhWLDY3eUZrUxn2Zj/9CJh
	apbwOIwju5vngeH59/ibh0U8ydR0PqTzZk43aOi+DdXDyiq100suyp8lEEhQ5SUdq3Y0VU
	3N59FRrnoGnbfFz2JaHrHMvGwVLL3DbAgKcAfrTtKav8GXWSmiemwUSgCTIMcg==
Message-ID: <6ae2978f-b220-44d8-8d38-81eb8178bae0@bootlin.com>
Date: Sun, 21 Jan 2024 21:16:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.31
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1705590269.git.steve@sakoman.com>
 <b72faefe16e1ac1dfa95ad7ff9b9b63254e62196.1705590269.git.steve@sakoman.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <b72faefe16e1ac1dfa95ad7ff9b9b63254e62196.1705590269.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jan 2024 02:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4788

Hi Steve

On 1/18/24 at 10:05, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 54a1c3203..0e04203fa 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.30"
> +DISTRO : "3.1.31"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.30"
> +YOCTO_DOC_VERSION : "3.1.31"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.30"
> -DOCCONF_VERSION : "3.1.30"
> +DISTRO_REL_TAG : "yocto-3.1.31"
> +DOCCONF_VERSION : "3.1.31"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.30"
> +POKYVERSION : "23.0.31"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the update!
Merged into "dunfell".
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


