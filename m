Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83E1C6379F
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 15:47:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.17717.1676303223311153602
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 07:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hvubQWoU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EDD041BF20C;
	Mon, 13 Feb 2023 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676303220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbtmvSSfv3Bs3ruRf2jLqK/t8sILOE3eTW9Sdev+pQY=;
	b=hvubQWoUGL4U3Atb1GVdkmadBR9zIkMu1gBUhHCH/RLiuArpnI+VnFMc44mSR9i1wuOS/N
	Sh67wfmShBrMpYM/LF/oCley7/ZcHI3JWAkzjTosvy4rcwTmdKFmZQJ9DDGsn31ifpI9f3
	HUliJ0u4tLIU/iX4t7GIGI8LZCZQGFRQQ5jOgUkJ8c7os6Jfiv2NwH/WANOnqrASGE4TFr
	tIj/m4Kgm60vp+M/gYHAxX0sXeCfHP2K74SgXccFGKynsmxq61muo/4lknkXaevHS6TiSp
	61k9HntlNsKq1oQr+ljWcao6DSuZxpDS0IA59f/UHDcZI8oo0snhddRuqljFGA==
Message-ID: <5919f8db-4b33-28ee-e8ec-be1ee8c4fd60@bootlin.com>
Date: Mon, 13 Feb 2023 16:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: Yocto Project Documentation <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/3] kernel-dev,ref-manual: fix old override syntax
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com,
 =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20230213143557.766119-1-u.oelmann@pengutronix.de>
 <82ab49fe-25ec-6a8a-39b3-6c853a88232b@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <82ab49fe-25ec-6a8a-39b3-6c853a88232b@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Feb 2023 15:47:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3674

Ulrich,
Many thanks for the patches!

Quentin, Peter,
Thanks for the reviews!

On 13.02.23 at 15:59, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Ulrich,
>
> Thanks for the patches.
>
> For the whole series:
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Merged into "master-next".
Never too late for further comments, if any, of course.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


