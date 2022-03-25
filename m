Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46561C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 14:23:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.6017.1648218184095546623
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 07:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YdBMiBIk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1586520003;
	Fri, 25 Mar 2022 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648218182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0SAn7d3etP0IFZEjTcBPPyT4jGizDqEgDKqQexcHajs=;
	b=YdBMiBIk0TkdcgTiOzvp+CBZTYekaP1T0xvTjuiYstOtwWB/rz7JLIXFFtl9Lt4MtxX698
	dveG2+D7l8WvgTv16qiAgzSeTrqRAB6ozeLzyb8NUYLk3WaZGx8UQHbpZmQo1YrdkQUBqL
	EPHSHz2XWzvGTaE0fd1KduYqNskSYsZkUIpYT5qEi+bzRZ/MRIyvNdNNnDvUuSPEPBKMrL
	RNULj4EFj0deGkLEhyeC1lvqHuFKeHKRx6om1/a1T/68A9sHIq2/JimwAqqpCWtt1WAnZ5
	Suh5NvSaBpduewoFwsTUgGwmHCmcWe+QVG/xoQvvxZOFg6HeDLaqPttjDJo+WA==
Message-ID: <02e845a6-8ce0-f7aa-0c47-52acd4cbd3eb@bootlin.com>
Date: Fri, 25 Mar 2022 15:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: Remove references to
 AVAILABLE_LICENSES
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20220323160911.6259-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220323160911.6259-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Mar 2022 14:23:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2706

Hi Peter,

On 3/23/22 17:09, Peter Kjellerstedt wrote:
> The AVAILABLE_LICENSES variable has been removed from OE-Core.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  documentation/ref-manual/variables.rst | 26 --------------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 634f19a673..b5cfc335fb 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -231,17 +231,6 @@ system and gives an overview of their function and contents.
>        must set this variable in your recipe. The
>        :ref:`syslinux <ref-classes-syslinux>` class checks this variable.
>  
> -   :term:`AVAILABLE_LICENSES`
> -      List of licenses found in the directories specified by
> -      :term:`COMMON_LICENSE_DIR` and
> -      :term:`LICENSE_PATH`.
> -
> -      .. note::
> -
> -         It is assumed that all changes to :term:`COMMON_LICENSE_DIR` and
> -         :term:`LICENSE_PATH` have been done before :term:`AVAILABLE_LICENSES`
> -         is defined (in :ref:`ref-classes-license`).
> -
>     :term:`AVAILTUNES`
>        The list of defined CPU and Application Binary Interface (ABI)
>        tunings (i.e. "tunes") available for use by the OpenEmbedded build
> @@ -3508,21 +3497,6 @@ system and gives an overview of their function and contents.
>           remove dependencies on or provide alternatives to components that
>           are required to produce a functional system image.
>  
> -      .. note::
> -
> -         It is possible to define a list of licenses that are allowed to be
> -         used instead of the licenses that are excluded. To do this, define
> -         a variable ``COMPATIBLE_LICENSES`` with the names of the licenses
> -         that are allowed. Then define :term:`INCOMPATIBLE_LICENSE` as::
> -
> -                 INCOMPATIBLE_LICENSE = "${@' '.join(sorted(set(d.getVar('AVAILABLE_LICENSES').split()) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"
> -
> -
> -         This will result in :term:`INCOMPATIBLE_LICENSE` containing the names of
> -         all licenses from :term:`AVAILABLE_LICENSES` except the ones specified
> -         in ``COMPATIBLE_LICENSES``, thus only allowing the latter licenses to
> -         be used.
> -
>     :term:`INHERIT`
>        Causes the named class or classes to be inherited globally. Anonymous
>        functions in the class or classes are not executed for the base


Thanks for the patch!
You just forgot to remote a :term:AVAILABLE_LICENSES instance, but I
fixed it.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


