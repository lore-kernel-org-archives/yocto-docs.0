Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA8FC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:30:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.108343.1712586594802823092
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 07:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hb3hqn2s;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D62C71BF206;
	Mon,  8 Apr 2024 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712586593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd8icNrt8dRHIch01+2/J9RucVq05HITNsfQW9Ghe7A=;
	b=Hb3hqn2sWeKXgImsN6CoGmq19dGV1E8K56USK59/oJU6vudwKo7kds0rE4AyVeIyC7kIs2
	5ntiR455PVBLO2E3DgbPGgCi25oVigTb06KNt+/XbU5XW+e47Gskd5HxoCNf6jShzUWhm9
	oZeg0NbTqSvdsp69rN+v17qbjqnIT+GMJqwm4732zzTMFSe+n4R8cmfOG7zLJbnFvtKeVb
	dYd+NwX4n9DdqLob4+Z6OU6ZHGwLlNVWETUTVLG0HuAd4unj1TFrurbWyLnaTHVBf6UXig
	mxeI1VeqSQFeQeo8yEjxr4tCix74oMachPh4F2vvxdC2JIltjM5cRMeIVRfzDw==
Message-ID: <4758cd91-3ce1-4533-9f98-61dc4b23ae2a@bootlin.com>
Date: Mon, 8 Apr 2024 16:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.33
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1712579371.git.steve@sakoman.com>
 <6c5d42d99ea71333a13baa0e6be1bd45267d8b12.1712579371.git.steve@sakoman.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6c5d42d99ea71333a13baa0e6be1bd45267d8b12.1712579371.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Apr 2024 14:30:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5091

Hi Steve

Thanks for the update and for the last Dunfell release :)

On 4/8/24 at 14:32, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index e41e355fa..0ab046428 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.32"
> +DISTRO : "3.1.33"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.32"
> +YOCTO_DOC_VERSION : "3.1.33"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.32"
> -DOCCONF_VERSION : "3.1.32"
> +DISTRO_REL_TAG : "yocto-3.1.33"
> +DOCCONF_VERSION : "3.1.33"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.32"
> +POKYVERSION : "23.0.33"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged in to the "dunfell" branch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


