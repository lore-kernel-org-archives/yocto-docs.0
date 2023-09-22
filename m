Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0CAE6FE28
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:14:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.21313.1695388469643710876
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 06:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A1QjsWEr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B36D20005;
	Fri, 22 Sep 2023 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695388467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjEzQuV/6dywHrGSIBj4J0yoKnH2g7NSfnMAqA3Z894=;
	b=A1QjsWEreiE5hZoHYeKK6WPxFwpZnPhFpZ77EcdVfMm0AD7eStg6AB8tJy8X7UOek1kXa6
	Y+PYczCikNDtjpvQg20VzypOUp7qcSm+cdF0PtWg+pQW9hq47wPr/9zkl3kxzMaThZaz7G
	iXSFR5gyssBXn9kC/zrEOCFkqTg2YQBzleN2obuFlBtsdzfd+ThFlgXkm9fwsmyhhKJMMu
	TqSIB8WBMtDauudpYFK4tdZatk8LM6ZjqO/UpG03umz8ZfDVLpVdhW7vyftvG1y0ikN7l4
	fDpMXLVcAaUKARciScFt/Gxh93xVBN12fPkhb10qBN+RvcbhmUATpcNnAAp+vg==
Message-ID: <65e503d6-5609-c8d4-6be2-6c9635445f2d@bootlin.com>
Date: Fri, 22 Sep 2023 15:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [docs] [PATCH v2 5/5] contributor-guide: style-guide: discourage
 using Pending patch status
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, docs@lists.yoctoproject.org
References: <20230922100006.756477-1-rhi@pengutronix.de>
 <20230922100006.756477-5-rhi@pengutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230922100006.756477-5-rhi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Sep 2023 13:14:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4296

Hi Roland

On 22.09.23 at 12:00, Roland Hieber wrote:
> Suggested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
> PATCH v2:
>   * new patch in v2, based on feedback by Michael Opdenacker in v1
>     https://lore.kernel.org/yocto-docs/12ef125b-5466-408c-ec8c-c5bef1510bc7@bootlin.com/
>     and Alexander Kanavin in
>     https://lore.kernel.org/yocto-docs/CANNYZj-7C_DeNgVCyRuHRCXZNX-2JPcnysKLn7gQq8w-4aAkNA@mail.gmail.com/
> ---
>   documentation/contributor-guide/recipe-style-guide.rst | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)


Many thanks for these updates!
For all of them: Reviewed-by: Michael Opdenacker 
<michael.opdenacker@bootlin.com>
Merged into "master-next".

Thanks to you, the Contributor Guide has made nice progress this week, 
and we now have a better and up to date reference for people adding 
patches to recipes.

Come back anytime :)

Cheers
Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


