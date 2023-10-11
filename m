Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54EACD6E72
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 14:00:41 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.17272.1697032834516610132
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 07:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TThuI5Uz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35E8E24000A;
	Wed, 11 Oct 2023 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697032832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zw4hUVntUPfdNLaPdaNXQeGm/aOiieVtri+E7YHdsVc=;
	b=TThuI5Uz0o4FQeAqUYZJWPDnf+1iieW5406Z9lW8+82JQn+8Y/qPGJtWGu+O8h/l9XVxYb
	i3TieXQn76V7fQyS1u12fTTaan/diK9N1+h71/AVTWQHEcK5dElZL66QbHv2dxotgdyH/E
	ZAPthN7n/U4gOB7aIDg8Hm6TJSpUoIJA1JBUbEszTek5ZrF65Z8aSv99AhxzoS3jcYJZbc
	BVFT95KAJUnTRohddKhaR/hgTSLGQFcR5krkOP4HKBpzwiqBlPMbm7NsW6FtZcpjd5Ie2/
	c8S/sI/rgRvlAIF4Gs1kzxhsVMvIxea7k/KREKIGy332BBiHz/RQraBF8NvkYQ==
Message-ID: <c51aa19c-a5d0-4bbe-98ee-be68e4a1a3df@bootlin.com>
Date: Wed, 11 Oct 2023 16:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: Warn about COMPATIBLE_MACHINE skipping
 native recipes
Content-Language: en-US
To: Arne Schwerdt <arne.schwerdt@elbbits.com>
References: <20231011084804.154987-1-arne.schwerdt@elbbits.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231011084804.154987-1-arne.schwerdt@elbbits.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 14:00:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4350

Hi Arne

On 11.10.23 at 10:48, Arne Schwerdt wrote:
> ---
> A recipe inherits from the native.bbclass is always skipped when the COMPATIBLE_MACHINE is set. This behavior has been introduced with daisy (poky/meta/classes/native.bbclass:107). It should be at least mentioned in the documentation.
>
>   documentation/ref-manual/variables.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 11523bb9e..a6f7ea03a 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1358,6 +1358,12 @@ system and gives an overview of their function and contents.
>         speed since the build system skips parsing recipes not compatible
>         with the current machine.
>   
> +      .. note::
> +
> +         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits from native, the recipe is always skipped.
> +         All native recipes must be entirely target independent and should not rely on :term:`MACHINE`.
> +
> +
>      :term:`COMPLEMENTARY_GLOB`
>         Defines wildcards to match when installing a list of complementary
>         packages for all the packages explicitly (or implicitly) installed in


Thanks for the patch!
Oops, you forget to sign-off your patch. Next time you should use "git 
commit -s" (see 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#creating-patches).
I fixed this by myself.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
and merged into "master-next".

Thanks again!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


