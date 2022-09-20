Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A67ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 07:58:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.9156.1663660680389552348
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 00:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E30Z0X1Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A405220002;
	Tue, 20 Sep 2022 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663660678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JeldN4+4D7SruAT0f4qieAA/H4blqPxUTzA+G7Goxv0=;
	b=E30Z0X1Z1bjEeT81BVjSLqqyAC2CPTXsoeC0Q8lUYsl9wF2+I/0zLUmcse6gioxYm3YnHX
	oPGlYvqjYx8hHV2+8DB+ARNIbQFcOMLCpBSFoW3vaSNNEnX1R4tWHsghJJUEvRvcvPTSzB
	HYsC62i9z47Z86F5T4QvU1wPRhOt4Y+dJayLo5WftrB7pvJrBNmTNxzqttFMuNe4gmJk6Q
	lM1hD/j2Siup0+UHCdUs1Iy7N0slkzSwhtzahAagchxCo2VxyObAUThAYKLupcMmwCSQ01
	xhhyhPEfTzrM2/ELOR3lFRtqPXfGg42BCwXU/jsOs3MUZgcn07nDKTFGQqUPlA==
Message-ID: <d3dcb709-792c-6ad0-54a7-9c6a2c9eb909@bootlin.com>
Date: Tue, 20 Sep 2022 08:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [docs] [doc][PATCH v3 1/2] common-tasks.rst: remove
 SRC_URI:append from examples
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>, docs@lists.yoctoproject.org
References: <20220920074548.17466-1-mikko.rapeli@linaro.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220920074548.17466-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 07:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3182

Hi Mikko,

Thanks for the update.

On 9/20/22 08:45, Mikko Rapeli wrote:
> Using SRC_URI:append without recipe, machine or architecture specific
> limitations makes the :append'ed text more difficult to override than if
> the "+=" operator was used. This makes it hard for example to override
> SRC_URI completely in a bbappend to update the full recipe to a newer
> version. Thus common, reusable layers which users are meant to re-use
> and customize should not use SRC_URI:append but SRC_URI += instead.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/dev-manual/common-tasks.rst | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index bdc528b723..17d1433150 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2577,7 +2577,7 @@ chapter of the BitBake User Manual.
>   
>         S = "${WORKDIR}/postfix-${PV}"
>         CFLAGS += "-DNO_ASM"
> -      SRC_URI:append = " file://fixup.patch"
> +      CFLAGS:append = " --enable-important-feature"
>   
>   -  *Functions:* Functions provide a series of actions to be performed.
>      You usually use functions to override the default implementation of a
> @@ -2708,19 +2708,21 @@ in the BitBake User Manual.
>      to existing variables. This operator does not add any additional
>      space. Also, the operator is applied after all the ``+=``, and ``=+``
>      operators have been applied and after all ``=`` assignments have
> -   occurred.
> +   occurred. This means that if ``:append`` is used in a recipe, it can
> +   only be overridden by another layer using the  special ``:remove``
> +   operator, which in turn will prevent further layers from adding it back.
>   
>      The following example shows the space being explicitly added to the
>      start to ensure the appended value is not merged with the existing
>      value::
>   
> -      SRC_URI:append = " file://fix-makefile.patch"
> +      CFLAGS:append = " --enable-important-feature"
>   
>      You can also use
>      the ``:append`` operator with overrides, which results in the actions
>      only being performed for the specified target or machine::
>   
> -      SRC_URI:append:sh4 = " file://fix-makefile.patch"
> +      CFLAGS:append:sh4 = " --enable-important-sh4-specific-feature"
>   
>   -  *Prepending (:prepend):* Use the ``:prepend`` operator to prepend
>      values to existing variables. This operator does not add any


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


