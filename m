Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEAFC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 09:10:10 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11976.1710321000227515803
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 02:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WaTPyYWj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A196DE0004;
	Wed, 13 Mar 2024 09:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710320998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7WnnPsgJPz86+vjWfprRnxmSWrTDTmFJ1rp1TyTq2Gg=;
	b=WaTPyYWjWZpbxn4DNeJfiKaSRhtH9bB8bvionb0QSfxIUnBdXuWkhN9Xp71kum1ATFfr6K
	g+dUrFV1oRMqJ+YbWG5rQ0RUNHmBDRMDrbSgVSwqnkKh8iCEcuajUbicygz4A4PW7fJ7N5
	mD0ouWfK9kWQA7Sd5XUcF3svGestg1D6lQphJA/BZiv/01g9WmbAsv3yPHKOZMvSXPG51H
	nzRt+fbyt1Q+lANoiVhqLEJ31iVUM9wRounw+UYD4eBuE47+ZqOdqDSJedcrYKD9aV4Dfa
	5Yd8Dp94f99AiqYu/q/l/GWLJPvBHw81k2IiouTyuWkz1JSxZCOfsBoTIkI+Gw==
Message-ID: <df0b53b8-49f2-4c83-b875-90290fe2ddda@bootlin.com>
Date: Wed, 13 Mar 2024 10:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yocto@pengutronix.de,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: classes: update description of class
 'image_types'
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
References: <20240312203807.1646308-1-u.oelmann@pengutronix.de>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240312203807.1646308-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 09:10:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4946

Hi Ulrich

On 3/12/24 at 21:38, Ulrich Ölmann wrote:
> Cite usage of IMGCLASSES variable in class 'image' as found in OE-Core's
> commit [1].
>
> [1] 451363438d38 ("classes/recipes: Switch to use inherit_defer")
>
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   documentation/ref-manual/classes.rst | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 5aaf8ecc0c24..412dc5ca2fe5 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1184,13 +1184,17 @@ enables the :ref:`ref-classes-image_types` class. The :ref:`ref-classes-image` c
>   ``IMGCLASSES`` variable as follows::
>   
>      IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
> -   IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
> +   # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
> +   # in the non-Linux SDK_OS case, such as mingw32
> +   inherit populate_sdk_base
> +   IMGCLASSES += "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
>      IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
>      IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
>      IMGCLASSES += "image_types_wic"
>      IMGCLASSES += "rootfs-postcommands"
>      IMGCLASSES += "image-postinst-intercepts"
> -   inherit ${IMGCLASSES}
> +   IMGCLASSES += "overlayfs-etc"
> +   inherit_defer ${IMGCLASSES}
>   
>   The :ref:`ref-classes-image_types` class also handles conversion and compression of images.


Many thanks for this update!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Do you think we should add the IMGCLASSES variable to the variable index 
too?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


