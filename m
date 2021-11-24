Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CCFC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:41:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.232.1637768467187432222
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 07:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1A29A40013;
	Wed, 24 Nov 2021 15:41:04 +0000 (UTC)
Subject: Re: [docs] [PATCH] releases.rst: move gatesgarth to outdated releases
 section
To: Anuj Mittal <anuj.mittal@intel.com>, docs@lists.yoctoproject.org
References: <20211124144934.8908-1-anuj.mittal@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f64d94ae-7171-7e8d-2e10-e81a04cc160e@bootlin.com>
Date: Wed, 24 Nov 2021 16:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124144934.8908-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 15:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2189

Hi Anuj,

On 11/24/21 3:49 PM, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  documentation/releases.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/documentation/releases.rst b/documentation/releases.rst
> index 95f1bd41d..4223d56d2 100644
> --- a/documentation/releases.rst
> +++ b/documentation/releases.rst
> @@ -20,16 +20,6 @@ Release Series 3.3 (hardknott)
>  - :yocto_docs:`3.3.3 Documentation </3.3.3>`
>  - :yocto_docs:`3.3.4 Documentation </3.3.4>`
>  
> -*******************************
> -Release Series 3.2 (gatesgarth)
> -*******************************
> -
> -- :yocto_docs:`3.2 Documentation </3.2>`
> -- :yocto_docs:`3.2.1 Documentation </3.2.1>`
> -- :yocto_docs:`3.2.2 Documentation </3.2.2>`
> -- :yocto_docs:`3.2.3 Documentation </3.2.3>`
> -- :yocto_docs:`3.2.4 Documentation </3.2.4>`
> -
>  ****************************
>  Release Series 3.1 (dunfell)
>  ****************************
> @@ -52,6 +42,16 @@ Release Series 3.1 (dunfell)
>   Outdated Release Manuals
>  ==========================
>  
> +*******************************
> +Release Series 3.2 (gatesgarth)
> +*******************************
> +
> +- :yocto_docs:`3.2 Documentation </3.2>`
> +- :yocto_docs:`3.2.1 Documentation </3.2.1>`
> +- :yocto_docs:`3.2.2 Documentation </3.2.2>`
> +- :yocto_docs:`3.2.3 Documentation </3.2.3>`
> +- :yocto_docs:`3.2.4 Documentation </3.2.4>`
> +
>  *************************
>  Release Series 3.0 (zeus)
>  *************************

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Applied to "master-next", "honister" and "hardknott" (I hope these last
two were not unnecessary).

Thanks for this update!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


