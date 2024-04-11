Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0FDCD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 07:57:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.12193.1712822268972882692
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 00:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cYghcCyM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3B926000A;
	Thu, 11 Apr 2024 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712822267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/EUqIPOxUnBSHaNGGmpbRv0QCOdAY/tWXIUMkiqqVM4=;
	b=cYghcCyM2RMioIXPCcZ8LupU+A5MUHS1u/ay0s2qQEe1kdESswhhh3DwHnHj8k0wmF5MO9
	3Oq/Nunr607ON4lVDZyhhOe917ywqNLpYEJYspWwEIOe3KeV92DK50LvOZNeOk+rVWFDBh
	3ULRu/4sFlJX17krUCwEDfgeGwGU0gYyhThwk9IWM7Iz9z7gNsx9PB2ACU6wnizW53VPlL
	jhUGQM7pPiqaHE/cE9sqD5IJobDXqErMPXQJExmUPf4zluGLwx364I7WPNNT0eENXRJL/D
	dT/fmGvjxlHqMJ6qVOph4X1SuEdBvIUuewE+eQSKhl+b6ndke9s3oBxBP9ohpA==
Message-ID: <a4f81086-3fa6-4079-b9c9-f0e5e3bc0a65@bootlin.com>
Date: Thu, 11 Apr 2024 09:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: adrian.freihofer@gmail.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v1] release-notes: mention cmake-qemu.bbclass
To: joaomarcos.costa@bootlin.com
References: <20240410145136.2994587-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240410145136.2994587-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Apr 2024 07:57:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5109

Hi João

On 4/10/24 at 16:51, Joao Marcos Costa via lists.yoctoproject.org wrote:
> From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
>
> Mention this new class in QEMU section.
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>   documentation/migration-guides/release-notes-5.0.rst | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
> index 1898b537a..c9d7a09c3 100644
> --- a/documentation/migration-guides/release-notes-5.0.rst
> +++ b/documentation/migration-guides/release-notes-5.0.rst
> @@ -106,6 +106,9 @@ New Features / Enhancements in 5.0
>      -  ``runqemu``: match ".rootfs." in addition to "-image-" for the root
>         filesystem.
>   
> +   -  :ref:`ref-classes-cmake-qemu`: a new class allowing to execute cross-compiled
> +      binaries using QEMU user-mode emulation.
> +


Thanks for this update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


