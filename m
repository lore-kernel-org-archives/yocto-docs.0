Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9B2CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:14:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.27155.1697721242583029766
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 06:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nRLadzEO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 680A61C0004;
	Thu, 19 Oct 2023 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697721240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEJKxP/wif4edAefywWx4BUN3st1vb8JxHFuPls2+fo=;
	b=nRLadzEOVfEoJPaLU4Yh1ioHZgbSzsyGU1SrDpLIP77D2KA9Y+P49v/z+j9oCEdmNLqFPZ
	1pNMpztea+s66BaVie1feUbpgEH5rDxDnFx0WUbKQtaC+fRycpWovlalO6iO0fYB7bTcuS
	/qzMvQXSVA9wT9kdpFFZVdo17plOZcgAc813ou2D8SMzUDICBSYBaasB7//4zv6W6lta3i
	8B0K497d6iameO9YLRyY8fX5WOh7lshOgAP0N+5TSQekKf/lNl+b3nZXTuZj5CMIrTxsCD
	MCMSLp3iOVjtFTX1f5NnaGj2s6y49JLhsOcgh1QDcKACpJGKV94a5oI+iGksbw==
Message-ID: <88cc907e-186c-44a4-8c57-cf7295c46742@bootlin.com>
Date: Thu, 19 Oct 2023 15:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs][PATCH] contributor-guide: clarify patchtest usage
Content-Language: en-US
To: Trevor Gamblin <tgamblin@baylibre.com>, docs@lists.yoctoproject.org
References: <20231017163203.2268267-1-tgamblin@baylibre.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231017163203.2268267-1-tgamblin@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 13:14:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4422

Hi Trevor

On 17.10.23 at 18:32, Trevor Gamblin wrote:
> - Make it clear that patchtest only supports openembedded-core for now
> - Add a short list of instructions for installing Python module
>    dependencies on the host
> - Add a step to add meta-selftest with bitbake layers so that all tests
>    can run
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   .../contributor-guide/submit-changes.rst         | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 8a300c366..f93c87ca3 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -282,12 +282,18 @@ Here is the general procedure on how to create patches to be sent through email:
>   Validating Patches with Patchtest
>   =================================
>   
> -``patchtest`` is available in ``openembedded-core`` as a tool for making sure
> -that your patches are well-formatted and contain important info for
> +``patchtest`` is available in ``openembedded-core`` as a tool for making
> +sure that your patches are well-formatted and contain important info for
>   maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
> -tags. Once you have generated the patch files and run ``source
> -oe-init-build-env`` to initialize your workspace, you can run ``patchtest``
> -like so::
> +tags. Currently, it only supports testing patches for
> +``openembedded-core`` branches. To setup, perform the following::
> +
> +#. ``pip install -r meta/lib/patchtest/requirements.txt``
> +#. ``source oe-init-build-env``
> +#. ``bitbake-layers add-layer ../meta-selftest``


Thanks for the update. I just removed the "#." characters which made the 
output look weird.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


