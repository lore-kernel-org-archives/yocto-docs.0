Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F001DC6FA8B
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 08:08:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.4679.1663834091561468118
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 01:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=myB2jZOG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8263C1C0006;
	Thu, 22 Sep 2022 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663834089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OHmOtMyiLLvqTEzIO+GYalQSqlVfk4jbUGRfdPTSl0=;
	b=myB2jZOGNKbe8wegh12OUBC9DdPdC188Jz2V+24Ttj4HaV/0SjaqLlMPCoDd3bVbo5MNIf
	fD++tGWCvZhBcpgS5bwyYqtbvOu50i/17ciRZPb41H7QPKetxQLANWuYdU0nGFPQbJaH49
	ZqxFp42oV3QTASEMwQ45WvtwvftZLOZHsrd8Rqkz+Ot9BJePnojxLsBWrBQgGl1V4TXn3p
	Xsmkk8ijSWO4cEuIBFGEKQFxAewA25zx9Hbjy+XwPhipUPOhWm4WftV447uZgd0F8o+vd9
	dG0znTLx2EiubSHBPYbm7gUzFMwZD1jgUFCdfxCHe9rjZ/OamKjxwmlx1d2+Sw==
Message-ID: <0c84794a-68a2-bcf8-51fc-721934fac761@bootlin.com>
Date: Thu, 22 Sep 2022 10:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: refer to BBPATH in the
 BitBake User Manual
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <17171FA1D41FFAAE.30869@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17171FA1D41FFAAE.30869@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Sep 2022 08:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3203


On 22.09.22 09:56, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> As reported in [YOCTO #14502], the description of BBPATH in the
> Yocto Project Manual is redundant with its description in the
> BitBake User Manual.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Quentin Schulz <foss@0leil.net>
>
> ---
>
> Without this redirection, the references to BBPATH would still
> work, as it this the case for terms only definited in the BitBake
> User Manual, but BBPATH would no longer appear in the variable index.
>
> This would probably be a bad thing.
> ---
>   documentation/ref-manual/variables.rst | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index fe845bf375..f6cc66e2c4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -729,20 +729,7 @@ system and gives an overview of their function and contents.
>         section in the Yocto Project Development Tasks Manual.
>   
>      :term:`BBPATH`
> -      Used by BitBake to locate ``.bbclass`` and configuration files. This
> -      variable is analogous to the ``PATH`` variable.
> -
> -      .. note::
> -
> -         If you run BitBake from a directory outside of the
> -         :term:`Build Directory`, you must be sure to set :term:`BBPATH`
> -         to point to the Build Directory. Set the variable as you would any
> -         environment variable and then run BitBake::
> -
> -                 $ BBPATH = "build_directory"
> -                 $ export BBPATH
> -                 $ bitbake target
> -
> +      See :term:`bitbake:BBPATH` in the BitBake User Manual.


As I mentioned in the description, the main issue here is that we don't 
know how to include the terms only defined in the BitBake manual in the 
variable index of the Yocto Project manual.

That's why we have a redirection here.

Another solution could be to highlight this constraint at the beginning 
of the variable index and point to the BitBake variable index, but I'm 
sure people will overlook this warning and will get confused anyway.

Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


