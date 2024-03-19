Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C4AC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:18:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.10638.1710839904105716684
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 02:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=exwDkG6y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCEABFF803;
	Tue, 19 Mar 2024 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710839902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R80PHwGcLsSpdB86Ddg47cQv9LX145GQyZofDTeRqFI=;
	b=exwDkG6yD4tjoTrtnPGqzyX3kci0kPI/X5KErHCYnuUEwRAPt747Uk9y9/YMqrLyu4TF7+
	VpJvp5gSCon1M8zznhElzm36RRPDvSUKcvmCbiIC0zXdw2B4ZYzEjLiMSH0XiWE8zfbOFQ
	9GLtlwW0gSUlbWim5DrQ5aZ8F0EpGc27RjAWaaYrU3ddzFTIbEcglVpIShXfVx14BE8dOq
	gCqQ4v2ax66OaVFiNnD1X/peAXpdsQ+Zg0PbZSieiRABJK89IXo2kRJXQOJrnvYhbpNtMp
	gMCIRiByK6R+O9fOPJrin1BOu7UzbNH8KnmhiJF8yJ0NjoqPoGmRt0DARuwOWg==
Message-ID: <a09cd652-98de-4a6a-9844-7347fafb6826@bootlin.com>
Date: Tue, 19 Mar 2024 10:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: f.lahoudere@technologyandstrategy.com,
 BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: add documentation of the variable
 SPDX_NAMESPACE_PREFIX
Content-Language: en-US
To: belouargamohamed@gmail.com
References: <20240318191610.37757-1-m.belouarga@technologyandstrategy.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240318191610.37757-1-m.belouarga@technologyandstrategy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 09:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4990

Hi Mohamed

On 3/18/24 at 20:16, belouargamohamed@gmail.com wrote:
> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>
> The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
> This variable is used to change the prefix of some links in SPDX docs.
>
> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6e66dc735..3f7c8e2c7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7911,6 +7911,11 @@ system and gives an overview of their function and contents.
>         image), compared to just using the :ref:`ref-classes-create-spdx` class
>         with no option.
>   
> +   :term:`SPDX_NAMESPACE_PREFIX`
> +      This option could be used in order to change the prefix of ``spdxDocument``
> +      and the prefix of ``documentNamespace``. It is set by default to:
> +      ``http://spdx.org/spdxdoc`` .


Many thanks for adding this to the documentation!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


