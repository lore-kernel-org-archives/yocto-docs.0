Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE78CC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:20:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14587.1711711219267908171
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 04:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SGRplU2d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 165C21BF205;
	Fri, 29 Mar 2024 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711711217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfcVkdsS+E8NaCqvONT1MYm7SZXVoLiJh/kCGdNu6/E=;
	b=SGRplU2dwp+w7HPetmODX9ctod7RzjpswQyL6mF8aEQMA2oVJCZIcvVpYkHCYh39BBt+9S
	Lq5qcRrdlHxIxjVkk+p0NZ1Zcz3e4X321l1g3+kVPQvSF2FZKdPHTK/xhkcQwg4hD/5/wW
	PKtFAe+dUMhvsagAM0jibkorED9s4s63DLYNBiOexATXE6xHrp6X6NUb9B67INRgec89Rb
	vxIc9JkHlhTn91kj5CzMtf/nroOFtUJfs/Vi8u1W2LDIJ0DscPfjfJlUZPidobgI/pqShm
	rkKHPKgZUi0TF34hAxupNf5/rkqLdPMQ/nTPdwX4ZvvRT0BCx08NKxUZdUbOAQ==
Message-ID: <c2a33f6d-9755-46a0-bb73-0c7dd36c7843@bootlin.com>
Date: Fri, 29 Mar 2024 12:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/3] refer to new yocto-patches mailing list
 wherever appropriate
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
 <20240328-yocto-patches-v1-2-1124fa0bc532@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240328-yocto-patches-v1-2-1124fa0bc532@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Mar 2024 11:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5029

Hi Quentin

Thanks for the patch!

On 3/28/24 at 16:07, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> There's a new yocto-patches mailing list available for all layers that
> do not have their own mailing list.
>
> c.f. https://lists.yoctoproject.org/g/yocto/topic/105197684
>
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   documentation/contributor-guide/submit-changes.rst | 2 +-
>   documentation/ref-manual/resources.rst             | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> index 95728c25c..b5a6e4240 100644
> --- a/documentation/contributor-guide/submit-changes.rst
> +++ b/documentation/contributor-guide/submit-changes.rst
> @@ -407,7 +407,7 @@ varies by component:
>   
>   For changes to other layers and tools hosted in the Yocto Project source
>   repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
> -:yocto_lists:`yocto </g/yocto/>` general mailing list.
> +:yocto_lists:`yocto-patches </g/yocto-patches/>` general mailing list.
>   
>   For changes to other layers hosted in the OpenEmbedded source
>   repositories (i.e. :oe_git:`git.openembedded.org <>`), use
> diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
> index 8e54ac87c..8ffc4ca1e 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -66,6 +66,9 @@ instructions:
>   -  :yocto_lists:`/g/yocto` --- general Yocto Project
>      discussion mailing list.
>   
> +-  :yocto_lists:`/g/yocto-patches` --- patch contibrution mailing list for Yocto


s/contibrution/contribution/
I fixed this by myself.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.
Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


