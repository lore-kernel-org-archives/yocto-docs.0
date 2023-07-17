Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F3CEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 18:21:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2331.1689618071958410415
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 11:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GVgw21BK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C3141C0003
	for <docs@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689618070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rb6xzivAHb+Ml5zNjbaEzPAVEa8lGAyHj3BaiT/S1o0=;
	b=GVgw21BKaCXWiUvtZFiXgpN6SxnvBWjoNiUWwhHjMJrsWu5jboWApo7MzHxWYtWirOvFL5
	4Wlc2oWnMVhVe92TLrTvp/zciK+ZtEl0D4K5r5FrR41P4at9fpSK+I8XRuBJTcyD9pRJpE
	Gwwt80kTKA1WTa6Kvb7SgkJMn2aXuu9Qkdh3MxjYAALat2xxzPK2xPZwS14TnI9ryrk3dp
	CEptZr0W8M5vsRtKIVYwkHuU5pIgqCYge3hlTGcugvqUyq1q2netmEvZf5qPIdRdX4Jfk4
	/8ANQGduuAGy7CtUalKn7BkdYZETxvHr+0i3Uw5oYFaiqIOEHom5ZZ5fuPjFkw==
Message-ID: <f6a999d0-4a77-427a-351b-395b141ef8e2@bootlin.com>
Date: Mon, 17 Jul 2023 20:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [docs] [PATCH] ref-manual: releases.svg: updates
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <1772BA9EE09CE036.13333@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1772BA9EE09CE036.13333@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4054

Greetings,

On 17.07.23 at 20:19, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> - Kirkstone is now a 4 year LTS
> - Add future Scarthgap LTS
> - Update document metadata: license, title

Here's a link to make the update easier to review:
https://docs.yoctoproject.org/next/_images/releases.svg

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


