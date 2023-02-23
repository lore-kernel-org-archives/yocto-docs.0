Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2AEC61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 08:10:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.6137.1677139840235551214
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 00:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ti/xJtyH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A4EB21C0007;
	Thu, 23 Feb 2023 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677139837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNbwA7imlfqWos8ECFnT08B6BWYPY1Qml9cuoQ4LjCU=;
	b=Ti/xJtyHp6ei5E3dWsBXM0EabQkx/StSQP5y+KyzULMDrdsk+UTK6LRavUzaj5mcdVO1bp
	8RuzmD3suT6A/Rfr2eDB4cAOvNnqyw2DmvEyiUCZm0X4rnrb/UNxRZ/QTfiBQCKQqVXEaz
	2qhOrWBUvv9mWVPjNtFThQlii4mt8i4qw6e5eokEU+S4QAvNWgB82SsjBM9h9OssLcBJIL
	uAeTrdjZorgE/RLYtYbGpcB77IKHz42t91KvnqVuBl41iKE69mjsxOmsaP3raxmFqORxPU
	Cx2cp1zO2s20pJnCBVfAAZv6zjf5aEgl6beuLdsWgg+12Knz8RSVvzI0XuqCaQ==
Message-ID: <32c23ec8-58ea-74dd-5fcc-2e357fc5506f@bootlin.com>
Date: Thu, 23 Feb 2023 09:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][langdale] system-requirements.rst: Add Fedora
 36, AlmaLinux 8.7 & 9.1, and OpenSUSE 15.4 to list of supported distros
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1677077787.git.steve@sakoman.com>
 <814d35c757f61dc4c5a64c2315940c9b7f28d0f5.1677077787.git.steve@sakoman.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <814d35c757f61dc4c5a64c2315940c9b7f28d0f5.1677077787.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Feb 2023 08:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3717

Hi Steve

On 22.02.23 at 15:57, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 2a6d44404..775628486 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -47,14 +47,22 @@ distributions:
>   
>   -  Fedora 35
>   
> +-  Fedora 36
> +
>   -  AlmaLinux 8.5
>   
> +-  AlmaLinux 8.7
> +
> +-  AlmaLinux 9.1
> +
>   -  Debian GNU/Linux 10.x (Buster)
>   
>   -  Debian GNU/Linux 11.x (Bullseye)
>   
>   -  OpenSUSE Leap 15.3
>   
> +-  OpenSUSE Leap 15.4
> +
>   .. note::
>   
>      -  While the Yocto Project Team attempts to ensure all Yocto Project


Great, thanks!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "langdale".
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


