Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437DCEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 21:09:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.22930.1687468149285893690
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 14:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UkcmBiAo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0GnToQM1I7TNeGAqfbo9ZZn2K76cocVKzQsMiuFrMs=;
	b=UkcmBiAo3t26OA5u26YIVr/7eXDU4agAoGoCr2JVKfl6ad8bhAHcGcfKaNTDej0EUqmFL5
	izdg0D4GSJp+OUB9G5PfuOLfe2yyxUB5UmCG27kVlHpXI6FI1+XGZFFS/qaQ8x1uWY3Vlh
	ktED1C8uKl7q+Z8BmYeWuSVXx63NhvdhThyupfqHt4mp7mwZeXBuLHmWhe8VCgItterpSX
	lVpd75hmsbo4serfjR6QhvNV1ei1/pp16DesTbx3NBSYD+G2cHTyxoogsi/txCmlYlWYOu
	HLvDy72zt+if55AhAG6Hp48C6ldpz6aWkbG/Fjjx7P9brnUJxSmy2VSF8ckiug==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AF0740002;
	Thu, 22 Jun 2023 21:09:06 +0000 (UTC)
Message-ID: <2fcc7aff-d4b3-10cf-a8a7-d61ed971df57@bootlin.com>
Date: Thu, 22 Jun 2023 23:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [docs] [PATCH 0/4] fix some doc typos
Content-Language: en-US
To: Quentin Schulz <foss@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
References: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 21:09:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4035

Hi Quentin,

On 22.06.23 at 18:51, Quentin Schulz wrote:
> Fix a few typos or bad formatting in the docs.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> Quentin Schulz (4):
>        docs: sdk-manual: appendix-obtain: fix literal block content
>        docs: ref-manual: terms: fix typos in SPDX term
>        docs: fix unnecessary double white space
>        docs: ref-manual: terms: fix incorrect note directive

Thanks for the fixes!
For 2, 3 and 3:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Will be happy to fix 1 if you lack time...

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


