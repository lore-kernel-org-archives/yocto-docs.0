Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3826CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:10:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.50343.1697793048286648286
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kwi+wYHr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28CAC60008;
	Fri, 20 Oct 2023 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697793046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHZrTAOJkQQZC+ppuVby/Y22es+ZfWglBCvg3hKhs7A=;
	b=Kwi+wYHrCHy/x2sjsMQJUs2Mcmo63Ay/+VOCrdjZwvqlPOSqpYDo1r3BqQ75tIuOGzf74a
	zb6WMSyzd5AAHRBWPO4gnNludVd+YFrnISF4ClPt+qahUDlqoWd3udRzvytXKTNtrd+ad6
	3yDiBGcg7/xPWCp2elD1zYvpIVDeuIFykvJW4WvU6K4qbDswWgSSl+dMOBL5/HKAynraJn
	JugNHGV1sxCHalJOVLd/Sqt3reeEARr2iL1+qiPpG45mxioobaYu243Tg0eUDPsU6M6rZc
	E82O5n4w4L/ao8twxbMqmVLf1SfjBTj5pKGuj+osEm+YFm9/4cLtL6xZ+1RQXA==
Message-ID: <c063ed03-5054-4d89-aa30-3788e1219542@bootlin.com>
Date: Fri, 20 Oct 2023 11:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] ref-manual: variabls: Add RECIPE_SYSROOT and
 RECIPE_SYSROOT_NATIVE variables
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231019214827.405886-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4433

Hi Talel,

Thanks for this update!
I still have a few comments. See below...

On 19.10.23 at 23:48, BELHADJ SALEM Talel wrote:
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 36 +++++++++++++++++++++++++-
>   1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 26a5aed82..22787f3b4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6971,6 +6971,36 @@ system and gives an overview of their function and contents.
>         in the ":ref:`ref-manual/devtool-reference:checking on the upgrade status of a recipe`"
>         section.
>   
> +   :term:`RECIPE_SYSROOT`
> +      This variable points to the directory that holds all files populated from
> +      recipes specified in :term:`DEPENDS`. As the name indicates,
> +      think of this variable as a custom root ``/`` for the recipe that will be
> +      used by the compiler in order to find headers and other needs to complete
> +      its job.

Oops, you forgot my previous comment:
s/other needs/other files needed/

> +
> +      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
> +      according to the type of the recipe and the build target.
> +
> +      To understand more this variable, consider the following examples:


s/more this variable/this variable bette/

> +
> +      -  For ``#include <header.h>``, ``header.h`` should be in ``"${RECIPE_SYSROOT}/usr/include"``
> +
> +      -  For ``-lexample``, ``libexample.so`` should be in ``"${RECIPE_SYSROOT}/lib"``
> +         or other library sysroot directories.
> +
> +      The default value is ``"${WORKDIR}/recipe-sysroot"``.
> +      Do not modify it.
> +
> +   :term:`RECIPE_SYSROOT_NATIVE`
> +      This is similar to :term:`RECIPE_SYSROOT` but the populated files are from
> +      ``-native`` recipes. This allows a recipe built for the target machine to
> +      use ``native`` tools.
> +
> +      This variable is related to :term:`STAGING_DIR_NATIVE`.
> +
> +      The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
> +      Do not modify it.
> +
>      :term:`REPODIR`
>         See :term:`bitbake:REPODIR` in the BitBake manual.
>   
> @@ -8242,7 +8272,8 @@ system and gives an overview of their function and contents.
>         the component is built to run (the system that hosts the component).
>         For most recipes, this sysroot is the one in which that recipe's
>         :ref:`ref-tasks-populate_sysroot` task copies
> -      files. Exceptions include ``-native`` recipes, where the
> +      files, check :term:`RECIPE_SYSROOT`.

Aren't you missing a few words a few "where the files"?
If you meant to say "the files check :term:`RECIPE_SYSROOT`", I don't 
understand.

The rest looks good. Almost there :)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


