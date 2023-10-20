Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070FFCDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:16:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.50515.1697793373930072971
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lO5A1AeK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D86C20002;
	Fri, 20 Oct 2023 09:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697793371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRG/HFUreq7cGGzzh9T4L3j0ol4INyuVnk/P6fDt/Ho=;
	b=lO5A1AeKUzRsp94PRBi2eoNqWB3v5rUt5/rjdfPahJRDel4hrONMe/DrawcropZtdOpIqT
	iGBegHeU8dOri0KPy0dU1hRwJBpF/krQWmdXSZ8qPv95Oac5wQYjhzWXQLEaT4r4WJLEOl
	O0md7Jih9FlW1Hg6uFNu/eqDnsUWYMxjiz5NbyFcIDQF2J7meXjA2nEOaRa8VzXhr/VGT0
	XV26cIuzDf1H9CwCIM7mUJq0kezAE2RLpvcHIwx53ZbVn9IZn9f6RA0/kgXvntrR8Xgz70
	0SfW4bHjzDQ4aADcu8OfaYbSOh0Xflx2fVEsCaaYRrekOA7gDnMrYUWMX45Y9Q==
Message-ID: <e45d16bd-6e22-49ff-bcaf-22f690501d0d@bootlin.com>
Date: Fri, 20 Oct 2023 11:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] ref-manual: variables: Add TOOLCHAIN_OPTIONS
 variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
 <20231019214827.405886-2-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231019214827.405886-2-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4434

Hi Talel

On 19.10.23 at 23:48, BELHADJ SALEM Talel wrote:
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 22787f3b4..958b98fd6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -9134,6 +9134,16 @@ system and gives an overview of their function and contents.
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
> +      Native recipes don't need this variable to be set, as they are
> +      built for the host machine with the native compiler.
> +
>      :term:`TOOLCHAIN_OUTPUTNAME`
>         This variable defines the name used for the toolchain output. The
>         :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

This patch looks great, but I need the update to your RECIPE_SYSROOT 
patch before I can merge it.

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


