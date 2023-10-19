Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE09CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:26:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.35515.1697739952445096604
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 11:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HPvP74Nb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7FF1C0005;
	Thu, 19 Oct 2023 18:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697739950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuJ1bLF9mVj15dQTekorQOGVvz0M7e/vX2ck12Dl+xQ=;
	b=HPvP74NbxgcdfzTnzRut0vkIjhiKE1qZSKmE4ONqpFSj3rE8woc54KnZM4EOjdG5i9JufH
	CbcAH4ANRYkxBIb1CZZGuMcMxcgh7HpjWrbfy95cnY4/kinGRySES/bfDcNb1xZxQ3UTvs
	Jvsr28/PXphgJqs1z0tT2YQW6UfEbdjiCo1kjBzQeTfevXePZwcMA1NykMyCSwxRGNhZmz
	MZ3s8mQXg6FuHmIdCT+YwZi54dLFXbNKVIIL9nksJ7R+paEcrG+FomcE5A5FR0YlzggTpk
	tfRigmJvVUUr2JwewQTLY+lKnXyVywe9FUCs+g8q4fFtbznSxhco6RFAluDoTQ==
Message-ID: <932c3f11-1ce6-42f7-9c0f-35be78714a32@bootlin.com>
Date: Thu, 19 Oct 2023 20:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] ref-manual: Add TOOLCHAIN_OPTIONS variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231016215302.3089907-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016215302.3089907-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 18:26:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4427

Hello Talel,

On 16.10.23 at 23:53, BELHADJ SALEM Talel wrote:
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 246584fc5..6cb4efff5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6952,13 +6952,9 @@ system and gives an overview of their function and contents.
>         used by the compiler in order to find headers and other needs to complete
>         its job.
>   
> -      The value of this variable will be affected to :term:`TOOLCHAIN_OPTIONS`
> -      as::
> -
> -         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
> -
>         This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
> -      according to the type of the recipe and the build target.
> +      according to the type of the recipe and the build target and also related to
> +      :term:`TOOLCHAIN_OPTIONS`.


This part of the commit is weird, as you're making changes to your 
previous commit. This change should go in your second patch, to minimize 
the effort for people reviewing your changes (or studying the commit 
history when the patch is merged it).

>   
>         To understand more this variable, consider the following examples:
>   
> @@ -9141,6 +9137,16 @@ system and gives an overview of their function and contents.
>         portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
>         applying to SDKs.
>   
> +   :term:`TOOLCHAIN_OPTIONS`
> +      This variable holds extra options passed to the compiler and the linker
> +      for non ``-native`` recipes as they have to point to their custom
> +      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
> +
> +         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
> +
> +      As ``-native`` recipes are built for the ``HOST`` itself this variable
> +      is not used, thus it is empty.

Don't you just mean that native recipes don't need this variable to be 
set, as they are built for the host machine with the native compiler?

Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


