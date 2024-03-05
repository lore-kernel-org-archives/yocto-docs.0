Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91408C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 09:11:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18118.1709629887244986149
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 01:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mkQw3Esa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE1AC0009;
	Tue,  5 Mar 2024 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709629885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClZsserYipxupqtDnZ09gKbEWeoX4de2IJyziEdz8k=;
	b=mkQw3EsaXjMb8RqzCHV+iMXJpkhKnKh0zJvBXwFD1HAcBgaq3EGWRain/4n8k8eozYEbPu
	pyRWk4tB8syTQwN8rt1/EBm3rOVU2qpfeCUTqJ8mPYzjo3uJMxG1JNJE6sgOrrgiBae818
	rqp0BNsHJYn54E+Y7IaTIFDvFFHzJhFBgcdj0BcDMpU1fLjdnWKfcNAXUYM+eLUrqNV3ZX
	UYjoCZsV+TW1fg54YbmPMtjGNzY1mYFBbpxXluYMmM6LscPDNkRJSB/9mFrYLPvVWfW/yD
	F7w8dKETjtCmEzkSv/NTNeAeQz4AzsP51orjatcFTG4y+nqIk5KPs5Od0OfLzg==
Message-ID: <07b6b326-bee8-442e-ae5f-4cfd1fadb0bc@bootlin.com>
Date: Tue, 5 Mar 2024 10:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: classes: Add the kernel-module-dirs
 class
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20240304160044.2325620-1-pkj@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240304160044.2325620-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 09:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4930

Hi Peter

On 3/4/24 at 17:00, Peter Kjellerstedt wrote:
> ---
>
> This is of course pending the actual addition of the new bbclass to
> OE-Core.
>
>   documentation/ref-manual/classes.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 7300020ef1..d61be8e4bc 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1705,6 +1705,14 @@ The :ref:`ref-classes-kernel-grub` class updates the boot area and the boot menu
>   the kernel as the priority boot mechanism while installing a RPM to
>   update the kernel on a deployed target.
>   
> +.. _ref-classes-kernel-module-dirs:
> +
> +``kernel-module-dirs``
> +=======================
> +
> +The :ref:`ref-classes-kernel-module-dirs` class provides path variables related
> +to kernel modules.
> +
>   .. _ref-classes-kernel-module-split:
>   
>   ``kernel-module-split``


This looks good, many thanks for the update!
Don't hesitate to ping me if needed when the code is merged.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


