Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BF0EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 21:02:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.22886.1687467763842711874
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 14:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H/o3t1om;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687467761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzK/qHJ+Iad7rGPDSR31lSDLv/m/jv1JEbOq30l2vjU=;
	b=H/o3t1ommMb3uHjaarxa1o+KSPms2ulbjLSoCaSMnZl+n8ELPvtuBZ9HR7kRYsFtex5CS5
	e83NqsnHvZ1TA9aylTviCi4aRS07zvmKo6SVOMPnxi1qLu5ZzJfQUUVQt2Xt4k46pOXK19
	wX7qEmlul0izbzhwFnnbv6bCeVIT6W3VJgLCiHv7U4I/oCEP2w3W4CW99/ySe5PK0gYTzr
	Afc3gL0iCcZsMKeqbKsVGUntKEyZdqJZTATsZOGbjauqIU4F/PkAHAbK0vyHz6mPBWEwPo
	ywB+c68HJccROHIV78cFhdcLg6ssw4nKf1RBjTbvYcp5lZm+x2xhIB8fhKhV+g==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 724C4FF802;
	Thu, 22 Jun 2023 21:02:40 +0000 (UTC)
Message-ID: <3abb9990-047d-fb77-962b-2b5e80dbd95a@bootlin.com>
Date: Thu, 22 Jun 2023 23:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 1/4] docs: sdk-manual: appendix-obtain: fix literal
 block content
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
 <20230622-typos-202306-v1-1-68489d7f23f2@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230622-typos-202306-v1-1-68489d7f23f2@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 21:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4034

Hi Quentin

On 22.06.23 at 18:51, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> The literal block renders its content verbatim so a term role (`:term:`)
> would appear as :term: string in there and `---` as --- string instead
> of the expected hyphen.
>
> While at it, surround the former-term roles with `` to highlight them.
>
> Fixes: e319b3bf4eb6 ("manuals: add missing references to SDKMACHINE and SDK_ARCH")
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/sdk-manual/appendix-obtain.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
> index ba844507d..e16017de7 100644
> --- a/documentation/sdk-manual/appendix-obtain.rst
> +++ b/documentation/sdk-manual/appendix-obtain.rst
> @@ -140,8 +140,8 @@ build the SDK installer. Follow these steps:
>         message similar to the following::
>   
>            The extensible SDK can currently only be built for the same
> -         architecture as the machine being built on --- :term:`SDK_ARCH`
> -         is set to ``i686`` (likely via setting :term:`SDKMACHINE`) which is
> +         architecture as the machine being built on --- ``SDK_ARCH``
> +         is set to ``i686`` (likely via setting ``SDKMACHINE`` which is
>            different from the architecture of the build machine (``x86_64``).


Thanks, but actually, we should return to what the message should be like:

- "-" instead of "---"

- "SDKMACHINE" instead of "``SDKMACHINE`` and the same for SDK_ARCH.

Originally, the message was:
"The extensible SDK can currently only be built for the same 
architecture as the machine being built on - SDK_ARCH is
  set to i686 (likely via setting SDKMACHINE) which is different from 
the architecture of the build machine (x86_64).
Unable to continue."

Would you have time to correct this? I can do it too :)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


