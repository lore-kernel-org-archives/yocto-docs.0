Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B586C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 09:55:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10785.1707990950884813154
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 01:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LvfKdQI/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBDDA4000F;
	Thu, 15 Feb 2024 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707990948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFGrbDFl1c+KZDaUTG+E5CnVohXIGpfsRQUI4oOKujA=;
	b=LvfKdQI/N14NVnVPN2S9oRFCLfMPP0rmeO9onvJxUah+UEXjkG/6jZMjfo/wfuYJo42+n9
	7X48ytmF7k68tpI6he2xsM8dQKF9XXdxHecs+vrPT5ZAORUU0qsmbgYTpK0sMK+EcC8Yro
	bnwk+hwiDDbj92pHypKu+ZpvCe9Uj3t8TGRdWs5kIeluQ5v1+mHMySEjk6eyYEAHGvMD+W
	iQEMIV8PiSYRnNmCGuKCt5PEwYyYIg81sugFoNKOXAAY9GcLiXg7weRPbxEzh2pMPn2Ztq
	SsPK5nZrc5TSqA5syGbgCmtl97vjJLFDgv/zQcA6xwKMPgNl0yYCeYOMc4t6ag==
Message-ID: <79156a5c-b233-4940-88f1-a5d04e4f9920@bootlin.com>
Date: Thu, 15 Feb 2024 10:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: f.lahoudere@technologyandstrategy.com,
 BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: Re: [docs] [PATCH 2/2] documentation: add documentation of the
 variable SPDX_NAMESPACE_PREFIX
Content-Language: en-US
To: belouargamohamed@gmail.com, docs@lists.yoctoproject.org
References: <20240214215237.151434-1-m.belouarga@technologyandstrategy.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240214215237.151434-1-m.belouarga@technologyandstrategy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Feb 2024 09:55:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4839

Hi Mohamed,

On 2/14/24 at 22:52, belouargamohamed@gmail.com wrote:
> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>
> The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
> This variable is used to change the prefix of some links in SPDX docs.
>
> [ YOCTO #15398 ]
>
> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 6f7d6ff01e..907575ba82 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7913,6 +7913,11 @@ system and gives an overview of their function and contents.
>         image), compared to just using the :ref:`ref-classes-create-spdx` class
>         with no option.
>   
> +   :term:`SPDX_NAMESPACE_PREFIX`
> +      This option could be used in order to change the prefix of ``spdxDocument``
> +      and the prefix of ``documentNamespace``. It is set by default to:
> +      ``https://spdx.org/spdxdocs`` .
> +


This looks good to me, thanks!
However, I have to wait for your first patch to be merged to merge this 
one, otherwise the default value is incorrect.
Don't hesitate to ping me if necessary.

As a separate patch, you may also mention this variable in the 
description of the "create-spdx" class (ref-manual/classes.rst). 
Otherwise, people may overlook this variable, if it's not referred to 
from any other place.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


