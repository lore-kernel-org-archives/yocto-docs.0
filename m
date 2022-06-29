Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EE6C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 07:56:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.8898.1656489401899995993
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jun 2022 00:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jGzhsVSx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A8E24C0004;
	Wed, 29 Jun 2022 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656489400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FPy+H4Abznbn/QhETLOJI3mYTTFQdm6ODg6aeTBgLw=;
	b=jGzhsVSx1k/b9R/Zi3B996N7kY/QMaFkE8QKSAzJA3hY+DKo7KsDePLGxdzMjwZ7GV0+fV
	VJglI8MxgqDiNpnL8Mel8tj/uG9AgXIbfbU7gwhUrc8YW0XmeWxCFZ6nBwkbKGKra/ViqG
	ocya2n11wwakkFFDpu9loUe76LJJtyNZyL2QiYkYVckNjIVYFwaiq3x9ptI92fe1qZUbE6
	oyyTGrsuKLCixs5FQy2BXr1agZ+n4VZ7MEcPQDjV5362pRUFSriTjKOXLnTsOqylDH4Nmh
	ONTaKC7eaN67hsarIKsJ8+GkJIHWT07+gOgWjkh1n7ImwmQGUosuTKhG3xoCJQ==
Message-ID: <15ce677c-3d06-a6ff-edce-742bf4c2e8a7@bootlin.com>
Date: Wed, 29 Jun 2022 09:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [docs] [PATCH] docs: add CONVERSION_CMD definition
Content-Language: en-US
To: aatir <aatrapps@gmail.com>, docs@lists.yoctoproject.org
References: <20220628183143.31627-1-aatrapps@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220628183143.31627-1-aatrapps@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jun 2022 07:56:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3041

Hi Aatir

On 6/28/22 20:31, aatir wrote:
> Signed-off-by Aatir Manzur <aatrapps@gmail.com>
> ---
>   documentation/migration-guides/migration-2.2.rst | 2 +-
>   documentation/migration-guides/migration-2.4.rst | 2 +-
>   documentation/migration-guides/migration-3.4.rst | 2 +-
>   documentation/ref-manual/variables.rst           | 9 +++++++++
>   4 files changed, 12 insertions(+), 3 deletions(-)


Many thanks for this update. I just made a few tweaks (mainly fixing a 
typo with "exmple" and introducing the example with "::" and leading 
spaces).
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


