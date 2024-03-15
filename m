Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68518C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 12:56:20 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.21625.1710507371595302072
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Mar 2024 05:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ohAcMIfV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9B41C0005;
	Fri, 15 Mar 2024 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710507370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+aeeNS9DVYdlgu5azmzGvhZ1HmoVb4Y0CjFkf3FMSY=;
	b=ohAcMIfVHbBTU2UKIrRhGZ8sYTcCl5LLGbpXSyAGJ8lR1FqozRp5Tg2D0WrsXkYkB/Yb4o
	TpUkw5+nMDaFZwE8lXq2zIb8ncuzAsZviUMVvWt/SpniSE/4nWms2QVtcNpNTkf2z0QDPL
	1qo0pkBGisNVtO2LUb0rWSKI73/RQPgfGEMsJKOSPVrxtzcm6IrA75Nx39qRJdwVhT4sBP
	gOHn+OtarTuKGPnVQfwmV+YxcHXFXnJXTnwVv+zOgLtNd9BsICLJBBEPxCo8nJ7hpaMI9A
	5/AHe60kO9Fi6T0imCvcSnI8cyrPJwKUkVBVUR+roNnwsRc3hkxUQHARTNISiw==
Message-ID: <4001494e-d3b9-47ad-85a6-9ffd70660246@bootlin.com>
Date: Fri, 15 Mar 2024 13:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide: be more specific about meta-*
 trees
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
References: <20240315094805.2990394-1-martin.jansa@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240315094805.2990394-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Mar 2024 12:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4981

Hi Martin

On 3/15/24 at 10:48, Martin Jansa wrote:
> * this is often confused to apply for e.g. meta-oe as well
>    where it doesn't apply as meta-oe has own ML mentioned
>    in README.
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>


Thanks for this clarification.
After a quick formatting fix, Reviewed-by: Michael Opdenacker 
<michael.opdenacker@bootlin.com>
Merged into master-next.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


