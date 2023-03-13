Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6934CC61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 19:57:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.4342.1678737441765546382
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Mar 2023 12:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D8TKJLlE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5B7501BF205;
	Mon, 13 Mar 2023 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678737439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gwee5QqigG1BlAyAsjCOdUIMPtNKa7H4EHvODgH8Iz8=;
	b=D8TKJLlETG6NhifaGkwCCkoJSk/CJJvcHHk7NAAEV4yYGms0PWaKfaFomuUsBpF1KE6azV
	2LBH6p2UbCeAPDeQpjU4HCzeFn8O1RldRBQ54gg2wO9trQu37k0eelyv4WSTut6wPjno97
	qfr1Nd69r+pG6+6e6DEa3NOfiroDpagueD7owcfxNt4+MYn1jnZOlwbEXKmZc/dmkfffec
	vsqnyV7n3kkm9/g8C7mv7o48MmGstCMS3RMZ+Ov55HWQNvruJ8pcDIsVKbRgJlv+ORBUg4
	XjwNZLJ68j9d0ZCLZNybRQalN5eGB3BGvGweWNU9DBLyWTvMHJ7NX9ZrGskYEg==
Message-ID: <2b75e0f1-e55f-d966-d407-08582c3a5537@bootlin.com>
Date: Mon, 13 Mar 2023 20:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.24
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1678728258.git.steve@sakoman.com>
 <ce11be44babdf2ab5f4a662634673e2da3299f13.1678728258.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <ce11be44babdf2ab5f4a662634673e2da3299f13.1678728258.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Mar 2023 19:57:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3788

Hi Steve,

On 13.03.23 at 18:25, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index d33ea2712..71749cc0a 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.23"
> +DISTRO : "3.1.24"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.23"
> +YOCTO_DOC_VERSION : "3.1.24"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.23"
> -DOCCONF_VERSION : "3.1.23"
> +DISTRO_REL_TAG : "yocto-3.1.24"
> +DOCCONF_VERSION : "3.1.24"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.23"
> +POKYVERSION : "23.0.24"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thank you for the update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into the "dunfell" branch.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


