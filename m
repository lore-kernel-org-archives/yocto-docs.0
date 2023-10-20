Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A65CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:28:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.50521.1697794109444024547
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oZC1YiyC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ACCC20007;
	Fri, 20 Oct 2023 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697794107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUL1Xy2Cvc+uIsDPQo4WEP5V8je8GkWCfcfkbhW14ws=;
	b=oZC1YiyCIY3O3wb/0qlzuUouJZTmLcG39uzDhXoSm6HjW82YKxmNolfAcAnwP9CEFImShh
	WZPziY7YGbivOum7HhnH7WTmUTGmXAPmDdnhf69i1Nw/0+MvL8elRwx2O+xChaIc2dT1qg
	xSaRdWhkPbuU/7H26/kf+NA0mog796y20NkDDIbd2RL69Oin3OH10UxkPUpj1k69hzvJs/
	F/MwmB2TV2zquzpzbvk+qe0OklbOEjbMMy7htBH1J4wMFPt8rOOIxeUz2Gc5WzihsXdjxM
	LTRL3JKx0bHfKH684mDHn5zV6GU9oMQRcCmUZPJM37jJVfeTKJILw/KRmV74Ig==
Message-ID: <31f06229-46de-460d-bba4-1e86d64a19f8@bootlin.com>
Date: Fri, 20 Oct 2023 11:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] ref-manual: variables: Add example for
 SYSROOT_DIRS variable
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
 <20231019214827.405886-3-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231019214827.405886-3-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:28:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4436


On 19.10.23 at 23:48, BELHADJ SALEM Talel wrote:
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 958b98fd6..8f1abf43a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8474,6 +8474,35 @@ system and gives an overview of their function and contents.
>                /sysroot-only \
>                "
>   
> +      Consider the following example in which you need to manipulate this variable.
> +      Assume you have a recipe ``A`` that provides a shared library ``.so.*`` that is
> +      installed into a custom folder other than "``${libdir}``"
> +      or "``${base_libdir}``", let's say "``/opt/lib``".
> +
> +      .. note::
> +
> +         This is not a recommended way to deal with shared libraries, but this
> +         is just to show the usefulness of setting :term:`SYSROOT_DIRS`.
> +
> +      When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
> +      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
> +      into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
> +
> +      Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS`, it will never be copied to
> +      ``A``'s :term:`RECIPE_SYSROOT`, which is "``${WORKDIR}/recipe-sysroot``". So,
> +      the linking process will still fail.


s/still fail/fail/
I meant to use "still fail" in the second part.

> +
> +      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
> +
> +         SYSROOT_DIRS:append = " /opt/lib"
> +
> +      .. note::
> +         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will fail


s/will fail/will still fail/


> +         because the linker does not know that location since :term:`TARGET_LDFLAGS` (if your recipe
> +         is for the target) doesn't contain it. Therefore, so you should add::


I'd actually tweak this sentence a bit to make it easier to read:

because the linker does not know that location, since :term:`TARGET_LDFLAGS`
doesn't contain it (if your recipe is for the target). Therefore, so you should add::

We are very close too!
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


