Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069A5C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:39:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10903.1710841153014708856
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 02:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jxV6v/1t;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D09F260011;
	Tue, 19 Mar 2024 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710841151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xrl03fq7hYGs8cdmlffiBjLLQl+uUP/AWxPg6lfwM3g=;
	b=jxV6v/1tBmFokU/gZvA5xj5njCLa0RRcyGCFsHl+Sg1abBYedIUaX1xD9ftbmWuzdY+F6n
	GJVB1WGfgVwNHY5hNVROcQsQ/dPo1VHzu17KbyqJlKNsDn9WVioEISkIrUTfAJy2lfzccs
	rps2nr8C5XP3a92hx689jzRA2RQFOhGEchHpe+oA5QTICV6cfn1PvIuIrHSsh+1fyASbvq
	qV8Vz1qMngTOa6PRT3DaW5Dh6c1MZ2Pn4m7ZdUj/eSeWQEzXgAWAthyyLb14QD4MKYTB4P
	43zzmjKEf2z0pPv1NCQ9FhHL9V7EILh3ptkdPCJBSATSj1FN/svSpm+/odQKVg==
Message-ID: <05a90b20-5919-4a09-aa3e-e39ada04a45e@bootlin.com>
Date: Tue, 19 Mar 2024 10:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] dev/ref-manual: document conf-summary.txt
 together with conf-notes.txt
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240318150211.1192651-1-alex@linutronix.de>
 <20240318150211.1192651-3-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240318150211.1192651-3-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Mar 2024 09:39:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4993

Hi again Alex
Thanks for the update!

On 3/18/24 at 16:02, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../dev-manual/custom-template-configuration-directory.rst | 6 +++---
>   documentation/ref-manual/structure.rst                     | 7 ++++---
>   2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
> index 9bffef35b46..06fcada822d 100644
> --- a/documentation/dev-manual/custom-template-configuration-directory.rst
> +++ b/documentation/dev-manual/custom-template-configuration-directory.rst
> @@ -42,11 +42,11 @@ would be::
>      TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf/templates/default}
>   
>   If you look at a configuration template directory, you will
> -see the ``bblayers.conf.sample``, ``local.conf.sample``, and
> +see the ``bblayers.conf.sample``, ``local.conf.sample``, ``conf-summary.txt`` and
>   ``conf-notes.txt`` files. The build system uses these files to form the
>   respective ``bblayers.conf`` file, ``local.conf`` file, and show
> -users a note about the build they're setting up
> +users usage information about the build they're setting up
>   when running the ``oe-init-build-env`` setup script. These can be
>   edited further if needed to improve or change the build configurations
> -available to the users.
> +available to the users, and provide useful summaries and detailed usage notes.
>   
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index acadd5efa3c..9f26319c327 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -172,10 +172,11 @@ targets to build. Here is an example::
>      You can also run generated QEMU images with a command like 'runqemu qemux86-64'
>   
>   The default output of the ``oe-init-build-env`` script is from the
> -``conf-notes.txt`` file, which is found in the ``meta-poky`` directory
> +``conf-summary.txt`` and ``conf-notes.txt`` files, which are found in the ``meta-poky`` directory
>   within the :term:`Source Directory`. If you design a
> -custom distribution, you can include your own version of this
> -configuration file to mention the targets defined by your distribution.
> +custom distribution, you can include your own versions of these
> +configuration files where you can provide a brief summary and detailed useage

s/useage/usage/

I fixed that.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next"
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


