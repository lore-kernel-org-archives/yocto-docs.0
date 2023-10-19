Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22626CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:12:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.35195.1697739144634486506
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 11:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e4saRk+u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 774A01C0006;
	Thu, 19 Oct 2023 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697739142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsmr3/Hw0YQsvMuYj2F5EnvDx3W8QZiX3qZMnJsuQG8=;
	b=e4saRk+ugBgogsOzzsq9Nkx4uzjSi55gald5yQYTwTbYPn2tDuxcqerN/D8H5hwdIcPOLL
	oAcwJ/qxKF+6ub7Kz30RsIIgSh9Et3brO0n9nIxk1WCDxETKLwREwAVwLxMFHGElgCFEdc
	db+LClKwHcYwZcFjsg0gxWBcfdUkq6t71tG6iH2YLsX5uasnV+tSSloEYvnsdOh4WKUbKh
	kiHtG5oh0UGoJkAAtRtn3AoqxUnUr9Q8f2DnmvYJJP1+o2NQ6SnxsMJ2gMOp/R3NrGtBZ5
	pQsvdRFxQgKArJbYz8qXKRJTT2Pzfpfx2OcTcMtjtRk7mPjYVu7XAhYgTD3edg==
Message-ID: <3c4ac20a-c4ab-4606-b5d6-412ea781b5ad@bootlin.com>
Date: Thu, 19 Oct 2023 20:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] ref-manual: Add RECIPE_SYSROOT and
 RECIPE_SYSROOT_NATIVE variables
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231016215450.3090118-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016215450.3090118-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 18:12:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4426

Hi Talel

On 16.10.23 at 23:54, BELHADJ SALEM Talel wrote:
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 40 +++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index a6e550aa5..246584fc5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6945,6 +6945,40 @@ system and gives an overview of their function and contents.
>         in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
>         section.
>   
> +   :term:`RECIPE_SYSROOT`
> +      This variable points to the directory that holds all files populated from
> +      recipes specified in :term:`DEPENDS`. As the name indicates,
> +      think of this variable as a custom root ``/`` for the recipe that will be
> +      used by the compiler in order to find headers and other needs to complete
s/other needs/other files needed/
> +      its job.
> +
> +      The value of this variable will be affected to :term:`TOOLCHAIN_OPTIONS`

s/affected/set/

Here too, you need the 3rd patch to compile the second one. It seems you 
sent the patches in reverse order ;-)

> +      as::
> +

Caution: you have a line with unnecessary spaces it. Git warns about 
them, and my editor flags them too.

> +         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
> +
> +      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
> +      according to the type of the recipe and the build target.
> +
> +      To understand more this variable, consider the following examples:

To understand this variable better

> +
> +      - For ``#include <header.h>``, ``header.h`` should be in ``"${RECIPE_SYSROOT}/usr/include"``
> +      - For ``-lexample``, ``libexample.so`` should be in ``"${RECIPE_SYSROOT}/lib"``
> +        or other library sysroot directories.

In our manuals, we usually add two spaces after "-" to introduce 
enumerations (see other files or standards.md)

> +
> +      The default value is ``"${WORKDIR}/recipe-sysroot"``.
> +      Do not change the default value.


Do not modify it.

> +
> +   :term:`RECIPE_SYSROOT_NATIVE`
> +      This is the same as :term:`RECIPE_SYSROOT` but the populated files are from


s/This is the same as/This is similar to/ (sounding better)

> +      ``-native`` recipes. This makes a recipe built for the target machine
> +      can use ``native`` tools.


This allows a recipe built for the target machine to use ``native`` tools?

> +
> +      This variable is related to :term:`STAGING_DIR_NATIVE`.
> +
> +      The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
> +      Do not change the default value.


Do not modify it.
Thanks,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


