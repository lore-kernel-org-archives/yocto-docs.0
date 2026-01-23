Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927D9D72371
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 10:36:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64568.1769164612734176018
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 02:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Fcht6tcB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3F94C21ABB;
	Fri, 23 Jan 2026 10:36:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 846056070A;
	Fri, 23 Jan 2026 10:36:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DBDD119A8709;
	Fri, 23 Jan 2026 11:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769164610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vkDVcEt3J8xEhz4wI3xkGbFp3g71gnHxinMtqZKbaF4=;
	b=Fcht6tcB29ZBz9uRris2KfMhCqvPNa9lfUQpyUyq5DnAN9IU+uQ34pUpCvTOF5Ws09ypuY
	hcBQ2/DMVm0ho4STG/EBuJ1Whuqv+VrgAtcvuykEiFFUBe8fmUIBrJ4yY+WfMAEPAkRwqB
	ZPWlH0IvL+EBoybVpBzCmfULzv/N2LwKX0/CE5LKxH+apamQf032yP66EtWdIuzmS/OT9F
	v9JAb5qqrOfN2hU7JuwfbdL9b/wa4pvp02wXj6xTeQeH/6mbWFcUyuPw86NH57v9lewi/K
	/L1Hpttt8bGFEGgn36PzLR7h7ba+ORoC62FTiT2+kK7xPdKD2ypCjGBZUIU7IQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 11:36:48 +0100
Message-Id: <DFVWIH163MXO.37KABX5HJK2L@bootlin.com>
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 00/12] sdk-manual: fix code-blocks, migrate
 one PNG to SVG, remove unused PNG
References: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
In-Reply-To: <20260121-code-block-misc-20260114-v2-0-fdd4bb5c2e68@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 10:36:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8634

Hi,

On Wed Jan 21, 2026 at 2:31 PM CET, Quentin Schulz wrote:
> This migrates literal and code blocks to an explicit lexer in
> sdk-manual.
>
> It also migrate one PNG to SVG (one that was "easy enough" for me to
> quickly do), as well as deleting an unused PNG.
>
> In addition, this removes two PNGs in favor of simple parsed literal
> blocks when listing the directory layout as it doesn't bring anything
> valuable and makes accessibility worse.
>
> Finally, it also fixes some improper indent that resulted in
> explanations unintentionally being part of a code-block.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v2:
> - used parsed-literal blocks instead of code-blocks for directory
>   layout,

It looks really good IMO! That's neat way to make some text stand-out in a =
code
block. I also think this would be a good way to make text diagrams.

Thanks for taking the time to do this,

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


