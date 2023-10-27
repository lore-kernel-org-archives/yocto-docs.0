Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E10C25B70
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 12:10:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.5338.1698408625529958725
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 05:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=of+a8gd4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64425240011;
	Fri, 27 Oct 2023 12:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698408623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvydJ2HTsxXupq3fe0L1zFgaGdiZEVnWUMxoy3jJNuA=;
	b=of+a8gd4IUujU7gyI3ZH1hbcXf6ZVfPwwKBUluw/jZJixjnj5vcPskD95OIZu8xk6pTDoO
	BkJ7ihgEqyOP72YJQFs8R73Bbh6lZfxDIAY22TzqF35IDEk/JWDiU/w69N/k5l6nFrGjsx
	SjfQsHvVfPrI+03nYMPhW/BKwpz4DG9sZ1kxkr9ZJBWf/gELjQtR5n+AA1YwhWJXBehzMt
	xzA6Cd1zcAXwoyaoOygido7RfrIz6CgqVCiyYCyFAxpURuitgegr6nRMbA2LU+qlBP1Krp
	2j3CSPz/SChoHFI7Jv8OXpzZfmv0CxlgxBpkyQEhKmGCvqEQmeChFNPRIVrLIQ==
Message-ID: <e3ad6981-b0cb-4d91-9ee6-c9b4df114bff@bootlin.com>
Date: Fri, 27 Oct 2023 14:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Paul Eggleton <bluelightning@bluelightning.org>
Subject: Re: [docs] [PATCH] migration-guides: updates for 4.3
To: docs@lists.yoctoproject.org
References: <1791F57D905EEBD5.3183@lists.yoctoproject.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1791F57D905EEBD5.3183@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 12:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4511


On 27.10.23 at 14:07, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Paul Eggleton <bluelightning@bluelightning.org>
> ---
>   .../migration-guides/migration-4.3.rst        |  6 ++++
>   .../migration-guides/release-notes-4.3.rst    | 30 +++++++++++++++++--


By the way, I'm checking commits one by one. Currently at:
2023-06-17 selftest/reproducible: Allow chose the package manager
<https://git.yoctoproject.org/poky/commit/?h=nanbield&id=88abdec715ed0c1f613c9b5132cd45db741d5c65>(https://git.yoctoproject.org/poky/log/?h=nanbield&ofs=1350)

1350 to go ;-)
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


