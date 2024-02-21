Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C25C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 08:59:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.9113.1708505966523743143
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 00:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H9w2bUuS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7287F1BF20A;
	Wed, 21 Feb 2024 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708505964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7n07ii5tIGtBt+bE6EIqbhYG0kfbR9Ez4QdsGzLoy7s=;
	b=H9w2bUuSdEQWTUNSMsEJhEW4MoFyRgj04RY6TG+4UjToQVtzE+RhiP3sCgrbvOvESmiQbf
	dvONQraDHi2HR0OXL+277P65+Q4nKxZ3awhVidr+cjRttD3c9fJv4iIgZzg1a9wGO5mxXd
	3GSWHpJDNu9jI/+9vUU8a/lvt8ou8jmzO/quJwUB0o51ekHwqwQ5rt+zntP25kbMK8SipT
	yO97u65fDdBDZ+xbrvZ+MU/toSB2u7ksfe5n7HpVec2/mbTdN/cTcPPhCeZVCSFHh/AuHm
	yWuZGpIchk6ntR9DdjBLeeUT4ST3ACkZsOJHKI6sxoo6fut7UhI/jKme9G0XyA==
Message-ID: <9db0dadc-4de8-46a2-b5f5-266c35dfd4d4@bootlin.com>
Date: Wed, 21 Feb 2024 09:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: kernel-dev: Fix BSP in recipe space
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
References: <20240221072612.79402-1-uvv.mail@gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240221072612.79402-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 Feb 2024 08:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4853

Hi Slava

On 2/21/24 at 08:26, Vyacheslav Yurkov wrote:
> File fetcher doesn't have destsuffix parameter.
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>   documentation/kernel-dev/advanced.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
> index bcaaaeed1..bddff1158 100644
> --- a/documentation/kernel-dev/advanced.rst
> +++ b/documentation/kernel-dev/advanced.rst
> @@ -718,7 +718,7 @@ If the BSP description is in recipe space, you cannot simply list the
>   form from your kernel append file::
>   
>      SRC_URI:append:myplatform = " \
> -       file://myplatform;type=kmeta;destsuffix=myplatform \
> +       file://myplatform;type=kmeta;subdir=myplatfrom \


Many thanks for this fix.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


