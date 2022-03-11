Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC00C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 09:38:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3688.1646991489406828034
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 01:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=prEn1nST;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4F0DD1C000E;
	Fri, 11 Mar 2022 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646991487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDsNc4GfgZRQ3nR8QxQNvK08tCCTHyOauJqAvvRw8tU=;
	b=prEn1nSTpaCp/9ggKMsgX8C7i3HLBfzwNWqqZarlSBjk8TuUlloEdC4hk89wRGHibSxu7e
	gqIUNcCYUN3lsrHHi62P/114AgPnUp4wBTrnoFciy6ZlcrYWKTcVYdQjfylROapMZNbadk
	Wob/BKopg1BGEbgjp+2EGI38hyBMNZk8sUKif4y3jvBfsUdhSJZPLbAWUM/b3BdRXk5E+f
	NhNon3kRPLKWKG4ZxqGEiocz6CftvIwSvcxEC2gI8Qm/e5CVaDR18iTODK4Xu3cTHeQG8A
	hTB33GYGYy2/qBCz3iw3wmhtNyaOR585wnVT30v8nveaosEZh5buKrC7e17YqA==
Message-ID: <57f4c30d-e881-8426-1f56-0fea5a1e1467@bootlin.com>
Date: Fri, 11 Mar 2022 10:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] ref-manual: INCOMPATIBLE_LICENSE: use new license
 wildcards
Content-Language: en-US
To: Christian Eggers <ceggers@arri.de>, docs@lists.yoctoproject.org
References: <20220311084041.21992-1-ceggers@arri.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220311084041.21992-1-ceggers@arri.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 09:38:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2594

Hi Christian,

On 3/11/22 09:40, Christian Eggers wrote:
> This has recently been changed in expand_wildcard_licenses().
> (file: OECORE/meta/classes/license.bbclass).
>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
>  documentation/ref-manual/images.rst    | 2 +-
>  documentation/ref-manual/variables.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
> index 0e3351bb7b51..31fb567687d3 100644
> --- a/documentation/ref-manual/images.rst
> +++ b/documentation/ref-manual/images.rst
> @@ -21,7 +21,7 @@ image you want.
>     image::
>  
>             1. Comment out the EXTRA_IMAGE_FEATURES line
> -           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0 LGPL-3.0 AGPL-3.0"
> +           2. Set INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
>  
>  
>  From within the ``poky`` Git repository, you can use the following
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 005456f0c437..925f439dc439 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3438,7 +3438,7 @@ system and gives an overview of their function and contents.
>           This functionality is only regularly tested using the following
>           setting::
>  
> -                 INCOMPATIBLE_LICENSE = "GPL-3.0 LGPL-3.0 AGPL-3.0"
> +                 INCOMPATIBLE_LICENSE = "GPL-3.0* LGPL-3.0* AGPL-3.0*"
>  
>  
>           Although you can use other settings, you might be required to


Good catch, thanks for the patch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


