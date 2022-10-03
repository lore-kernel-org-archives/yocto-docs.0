Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC21C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:15:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.256.1664817341553558962
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 10:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=m0xFBdUI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6CD681C0005;
	Mon,  3 Oct 2022 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664817339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6dfyoyQn2tUcde5CwwPOwYTFyoQj5bnmxMSPf2bYNk=;
	b=m0xFBdUI6ugKYqql9s6uToOMw2WdloMsgKgoLC0L698bu5MToGiXDxFCgyR8ZQIv9YTKIp
	LPIzNRS1zjSQ0PowomePI11TrDY8R7nMhXfss51j2PeHIvMwMIoIZ727nb8ZnnioPB23zb
	ujAjwVfmSdat+jMQXvXAD0TR/pUMFQ8OxYr39+4Raq9etvcGoLsUmJr95xs3LM9Bt+WBTm
	+ILaaw0PRuNZ07KpkJwfjf1Oqe/Hv5VRqaXo8SBbiqPFUQ8RMR2WxtBBY1ldrWjLcHaKZr
	n5GFpIz2/Ul1uyVdyxODDQ6r4eKoBn2D0J0vQ8CiHh4tYoDlxba7D+3RTin3ow==
Message-ID: <696fb495-f791-10b1-43dc-81a20b0366c9@bootlin.com>
Date: Mon, 3 Oct 2022 19:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: update for 3.1.20
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1664810900.git.steve@sakoman.com>
 <41444bbb1816a20f2518faf9c6a9e4c02505a53b.1664810900.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <41444bbb1816a20f2518faf9c6a9e4c02505a53b.1664810900.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Oct 2022 17:15:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3264

Hi Steve,

On 03.10.22 17:29, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/poky.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index dae9abb63..b6baac7d0 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -1,13 +1,13 @@
> -DISTRO : "3.1.19"
> +DISTRO : "3.1.20"
>   DISTRO_NAME_NO_CAP : "dunfell"
>   DISTRO_NAME : "Dunfell"
>   DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
> -YOCTO_DOC_VERSION : "3.1.19"
> +YOCTO_DOC_VERSION : "3.1.20"
>   YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
> -DISTRO_REL_TAG : "yocto-3.1.19"
> -DOCCONF_VERSION : "3.1.19"
> +DISTRO_REL_TAG : "yocto-3.1.20"
> +DOCCONF_VERSION : "3.1.20"
>   BITBAKE_SERIES : "1.46"
> -POKYVERSION : "23.0.19"
> +POKYVERSION : "23.0.20"
>   YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>   YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"


Merged in Dunfell. Malaho Steve!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


