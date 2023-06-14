Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80E1EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 16:39:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.17584.1686760754938102456
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 09:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BuZKkCET;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686760752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsgFOzmEWyXpordkCj2KIV5Ffg2YaXkRArNL4qYOLKg=;
	b=BuZKkCETXgiztRIfbN94s8V1xnUOU49wSUBXo+7RvoQomWozWUWfPeAkKEEp8XA32J96Fe
	7ZOOOOKZVH/I+9Qt1eS8Hz4Mw7rI8RJ8coFeAsEhlxKS47zrm02U86ASTPGWjZYX1xtgqZ
	Ukae9s5Gbzl/FOQaMKE/HQJghQgL2FBk2SMSj7eOXeJwHp4UB9pkP0ol1iN3Gd1kb+vrN1
	8klWAhs2eqkgwLi9IhqoKCUdRXrnXvC4uCrQw0+vhlMWQ5z9+wvpcc3quL5ITuW4ObMEe9
	+XAoARrgyfvTLDt4MYiBRwKmUxZ2DGlvFxeDSsZh7ew9yCD8+iYwGeirSUPJ4Q==
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56ACE1BF209;
	Wed, 14 Jun 2023 16:39:12 +0000 (UTC)
Message-ID: <44ce12ce-ce7d-5ae2-378c-6a8c4ebc8e79@bootlin.com>
Date: Wed, 14 Jun 2023 18:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell] documentation: update for 3.1.26
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1686710324.git.steve@sakoman.com>
 <6f5d97a43a9dc7144afe4544c1841d3f378bd4a0.1686710324.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <6f5d97a43a9dc7144afe4544c1841d3f378bd4a0.1686710324.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jun 2023 16:39:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3995

Hi Steve,

On 14.06.23 at 04:39, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 62d69f9c8..ead58a970 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.25"
> +DISTRO : "3.1.26"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.25"
> +YOCTO_DOC_VERSION : "3.1.26"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.25"
> -DOCCONF_VERSION : "3.1.25"
> +DISTRO_REL_TAG : "yocto-3.1.26"
> +DOCCONF_VERSION : "3.1.26"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.25"
> +POKYVERSION : "23.0.26"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "dunfell".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


