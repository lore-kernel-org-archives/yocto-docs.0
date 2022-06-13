Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA575C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 16:01:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7579.1655136091280423942
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 09:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NEuc1YaQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 55BCE1BF203
	for <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655136089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIQhqledqgE/YnJySSY05n2GPm3xvuVbsU47Jj+Hfs0=;
	b=NEuc1YaQqkdOsJ3+7IRKMb6z+++9T9F0WS/XvSGGB4Cu8f7/DRFbHLg7jnU75ZVPCYwlVq
	zwmKtbxG6X8I0fGDDZXxA5qmnQpXwkHSTogk3cNSua4KxXrE011RKsHt7ya5pjXQZdEykn
	oe2W3auoFsh3VZWrbSKqToLC7JO5ytD5FEvFHE8n+IHTy+OjAr+Yc5p5LAkQ9OiA2JGDDF
	kDbx1lHXtx1b97wZFfhzD12LGXVTfSFgQG64GfU4LQYGSH6UiXT2fftsHVfJTUhia3iq+g
	0AhS6g9/Gx/sfv+50+O0aNvh4W7kLDa1Afs0KTgDyHfH6mxWuxFyGB/1LwQSFw==
Message-ID: <a91a332f-0086-63bd-59f8-e9d37aa81585@bootlin.com>
Date: Mon, 13 Jun 2022 18:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] ref-manual: add description for the "sysroot" term
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16F8396963358119.28765@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16F8396963358119.28765@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 16:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2991


On 6/13/22 17:59, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> This term is used throughout the manual but is not properly
> introduced anywhere.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/terms.rst | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
> index cba514c345..76f3fb0d08 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -383,6 +383,31 @@ universal, the list includes them just in case:
>        ":ref:`overview-manual/development-environment:repositories, tags, and branches`"
>        section in the Yocto Project Overview and Concepts Manual.
>   
> +   :term:`Sysroot`
> +
> +      A directory considered as the root directory for locating
> +      header and library files needed to generate binaries for a target
> +      processor architecture.
> +
> +      In the context of cross-compiling toolchains, a *sysroot*
> +      typically contains C library and kernel headers, plus the
> +      compiled binaries for the C library. A *multilib toolchain*
> +      can contain multiple variants of the C library binaries,
> +      each compiled for a target instruction set (such as ``armv5``,
> +      ``armv7`` and ``armv8``), and possibly optimized for a specific CPU core.
> +
> +      In the more specific context of the OpenEmbedded build System and
> +      of the Yocto Project, each recipe has two *sysroots*:
> +
> +      -  A *target sysroot* contains all the **target** libraries and headers
> +         needed to build the recipe.
> +
> +      -  A *native sysroot* contains all the **host** files and executables
> +         needed to build the recipe.
> +
> +      See the :term:`SYSROOT_* <SYSROOT_DESTDIR>` variables controlling
> +      how sysroots are created and stored.
> +
>      :term:`Task`
>         A per-recipe unit of execution for BitBake (e.g.
>         :ref:`ref-tasks-compile`,


Note that this is my own understanding of what a sysroot is. Your 
reviews and corrections are most welcome here.
Once the term is added to the manual, I will add references to it where 
needed.
Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


