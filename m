Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC857C636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:39:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.26747.1675265933830377551
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 07:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BMrdVt6Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A1C0E2000F;
	Wed,  1 Feb 2023 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675265932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LrhWzHdku7yoCsZ/zceomghyQ6Pce6rPNH5MIckn+tM=;
	b=BMrdVt6QrlJWR/R3orY6MQ4MGLPa4QZnUWK14Fg+HM9hn/qKFXHgtsDf97XGuXn6BFk0nS
	dVYRl0nSRSXh0KkJ7qjUsTow9bCW22DOkzD+oscrRBVPbEuNoux4wsy8QNC7oCkxkCMMBz
	m/wes2zk5/I0/nhslX4N4EWK9ReiTgJMwJpVBvJbzfrJO/W5cCRh0fjuoxTL6fwLAc5s4S
	1XNwWqxPTTyJ3bTXn6ehhb/H3kZ2ubnPV3PfloEuL0sw2mBmCJIkaGUMoYJC46VVu56314
	dGJwRRarkCGRD4zUegxbVaexy9mzk7usDwQTxkZyaXcI6k6k25Zd0uaQEct/4A==
Message-ID: <ba675171-cca7-ee9e-5988-8da84cfe077e@bootlin.com>
Date: Wed, 1 Feb 2023 16:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: variables: FIT_KERNEL_COMP_ALG: add
 lzo
Content-Language: en-US
To: dev@g0hl1n.net
References: <20230201113317.586974-1-dev@g0hl1n.net>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230201113317.586974-1-dev@g0hl1n.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Feb 2023 15:39:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3630

Hi Richard

Thanks for the patch!

On 01.02.23 at 12:33, Richard Leitner via lists.yoctoproject.org wrote:
> From: Richard Leitner <dev@g0hl1n.net>
>
> OE-Core rev f1257d61b76d027d4ece734439993b6bf4e48907 introduced support
> for using lzo as compression algorithm for fitImage contained kernel
> images.
> This patch adds the corresponding documentation to FIT_KERNEL_COMP_ALG
> and FIT_KERNEL_COMP_ALG_EXTENSION.
>
> Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> ---
>   documentation/ref-manual/variables.rst | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 725f5c54c..edc3aa652 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2892,13 +2892,14 @@ system and gives an overview of their function and contents.
>   
>      :term:`FIT_KERNEL_COMP_ALG`
>         Compression algorithm to use for the kernel image inside the FIT Image.
> -      At present, the only supported values are "gzip" (default) or "none"
> +      At present, the only supported values are "gzip" (default), "lzo" or "none".
>         If you set this variable to anything other than "none" you may also need
>         to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
>   
>      :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
>         File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
> -      value is ".gz".
> +      value is ".gz". If you set :term:`FIT_KERNEL_COMP_ALG` to "lzo",
> +      you may want to set this variable to ".lzo".
>   
>      :term:`FIT_KEY_GENRSA_ARGS`
>         Arguments to openssl genrsa for generating RSA private key for signing


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next"

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


