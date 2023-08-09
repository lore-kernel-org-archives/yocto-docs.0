Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E98AC04A94
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 17:36:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.94459.1691602580149722191
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Aug 2023 10:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UO0yYNZa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0155640008;
	Wed,  9 Aug 2023 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691602578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pug85AJaJat8TY8Zsl6GuSguRojuP/It2/oDF6K/aNM=;
	b=UO0yYNZa7dVawOK8vab+4cdfGXDgOx3NxRYEukd9gyYv8yV0wGDOctu5YcPZA289BJt7LD
	wU8K5I/hpwZN2Qn4o/mxfl5ukabzcziXjZph0TUDMOZ5z4k7Sw2TNnWU4291LJes0eCbPj
	mlyDtIikXVGia7T0k5HPhEZT9RGYn5b+DBHgGZjRe1NlCRG2tK06NBgaycwvxe4r9T6IdA
	v/NEIlv20aoZC/hZPnRstOtCW7oj1W6pE2g0orYGCBrKmnSbf9SrXZ/mDk/1VQLaEEWIYI
	zX3EdJOsY0GzCPBkNxyC+TAH8IlwKkaAG3ZzenF1zoRk2CaIUpll8KlQxIzKKA==
Message-ID: <7f67ee29-7ceb-47cb-ae98-034ba3c19407@bootlin.com>
Date: Wed, 9 Aug 2023 19:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] dev-manual: wic.rst: Update native tools build
 command
Content-Language: en-US
To: Daniel Semkowicz <dse@thaumatec.com>
References: <20230808084945.24457-1-dse@thaumatec.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230808084945.24457-1-dse@thaumatec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 17:36:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4124

Hi Daniel

Many thanks for the patch!

On 08.08.23 at 10:49, Daniel Semkowicz wrote:
> Requirements list seems to be outdated. It is not possible to follow
> instructions for Raw Mode as not all of the native tools are available.
> All wic dependencies are gathered under wic-tools package. Some commands
> in the instruction already use wic-tools native sysroot, but this
> dependency is not specified in the requirements.
> Update the command for building native tools to use wic-tools instead
> of the seperate packages.
>
> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> ---
>   documentation/dev-manual/wic.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
> index 2a4408cdb..664f07a21 100644
> --- a/documentation/dev-manual/wic.rst
> +++ b/documentation/dev-manual/wic.rst
> @@ -92,7 +92,7 @@ system needs to meet the following requirements:
>   -  You must build several native tools, which are built to run on the
>      build system::
>   
> -      $ bitbake parted-native dosfstools-native mtools-native
> +      $ bitbake wic-tools
>   
>   -  Include "wic" as part of the
>      :term:`IMAGE_FSTYPES`


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next in yocto-docs.

Do you think the change also applies to Mickledore and Kirkstone?
Thanks again
Cheers
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


