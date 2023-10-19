Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC6FCDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 17:39:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.34287.1697737134778667157
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 10:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fk2wNH2N;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9975E1C0006;
	Thu, 19 Oct 2023 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697737132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjyy1yTARqOD7UAEgE+sTtXNmi/L/BR+7aXVkL/Ei78=;
	b=Fk2wNH2NzLhbrO2Gd2d2k0PWpKcQAZYPXQpDyTX4cq9OlFO+jdNNSBzC+KtSWWmITpF8mq
	RZFW/HTJgZJ5JcJYWoErPLlSdLKY+x+QyVcrRgL4t4DGcuHP2SoAxRGfTwKVH1ycNhjtOW
	Z/ACl0/PLBsGfWkHMNld4FnF4NdXjRVOFBT6WzWGGLiERswcEM31tK4RCB1qdVQaX+2MU8
	8s4x9o6J/OXZWz+wUS5jDROQHKAl6yjMbFewLhw5SGpMC/J4stbyUUxQ8rLTQFmFdV5J12
	L9jeXkHHIN/YlrWEyqNlXmqde7OTEfRtXTeUb+H0o6wLgdWc+7XJs2ZqJuXBUA==
Message-ID: <11ad77ad-2fa9-4000-a053-dc9a91c59034@bootlin.com>
Date: Thu, 19 Oct 2023 19:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] ref-manual: Add example for SYSROOT_DIRS
Content-Language: en-US
To: BELHADJ SALEM Talel <bhstalel@gmail.com>
References: <20231016215524.3090203-1-bhstalel@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231016215524.3090203-1-bhstalel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 17:39:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4425

Hi Talel

Thanks for the patch!

On 16.10.23 at 23:55, BELHADJ SALEM Talel wrote:
> Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 29 ++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c52271e8b..a6e550aa5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8414,6 +8414,35 @@ system and gives an overview of their function and contents.
>                /sysroot-only \
>                "
>   
> +      Consider the following example in which you need to manipulate this variable.
> +      If you have a recipe ``A`` that provides a shared library ``.so.*`` with all
> +      required symbolic links for it, specially the ``.so`` link, into custom folder


s/links for it/links to it/ ?
s/into custom folder/into a custom folder/

> +      other than "``${libdir}``", or "``${base_libdir}``" (example: "``/opt/lib``").

Hey, that sentence is incomplete! That's like saying...

"If you have a recipe that provides a shared library."

Did you mean "Assume you have a recipe..."?

> +
> +      .. note::
> +
> +         This is not recommended when working with provided shared libraries,
> +         but this is for the goal of understanding an example for :term:`SYSROOT_DIRS`.


I would rephrase this a little... What about
"This is not a recommended way to deal with shared libraries, but this 
is just to show the usefulness of setting :term:`SYSROOT_DIR`."?

> +
> +      When a recipe ``B`` :term:`DEPENDS` on ``A`` it means what is in


I'd add ", " before "it means" (easier to read)

> +      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe ``B``
> +      into ``B``'s :term:`SYSROOT_DESTDIR` that is "``${WORKDIR}/sysroot-destdir``".
> +
> +      Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS` it will never be copied to
> +      ``A``'s :term:`RECIPE_SYSROOT` which is "``${WORKDIR}/recipe-sysroot``". So,

Hey, your patches are out of order here ;-)
I need to apply your second patch first to get the first one to compile.

So the patch defining :term:`RECIPE_SYSROOT` should come first ;-)

> +      the linking process will fail.

I'd also add ", " before "it will" and "which is".

> +
> +      To fix this, you need to add ``/opt/lib`` to :term:`SYSROOT_DIRS`::
> +
> +         SYSROOT_DIRS:append = " /opt/lib"
> +
> +      .. note::
> +         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the linking process will fail
s/will fail/will still fail/
> +         because the linker does not know that location since :term:`TARGET_LDFLAGS` (if your recipe
> +         is for target) doesn't contain it, so you should add that::

s/for target/for the target/
s/, so you should add that::/. Therefore, you should add::/

> +
> +            TARGET_LDFLAGS:append = " -L${RECIPE_SYSROOT}/opt/lib"
> +


Thanks in advance for a V2 ;-)
These are mostly style issues, and documenting this is much appreciated :)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


