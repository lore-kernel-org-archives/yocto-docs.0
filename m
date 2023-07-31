Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A757DC04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 18:44:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.264.1690829083774053737
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 11:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yfo+2Rdo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5250E1C0004;
	Mon, 31 Jul 2023 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690829081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjxyCGt6u93XixCuiQUbSJ5N8Bappt4vDhaley7lEuc=;
	b=Yfo+2RdoEIHZUcITP4Uf95pnNCh3SuEhAInr0MxNcVBMWdZ9Uxx5rVugNYfxw1KCT43XsF
	mDL+yQmc3NV+dglhEA9vljYP/b6lH/8ZO2W771fiMEGnG7+fKoRQLFeaP76mwsnievyOON
	/9zI1mjeesIDTNI5N1r0Upv2p6XmVnMTpt9mJ8FzoUBsZKUB/0zigl2gFUVkJBTbrN9ccc
	xR+2ls2fNTywYYmAj9WeQPvZDshjZD8AUnB8Za4Zk6yr5fGQTvLST7ShzeWVjqZ87+MMBb
	8rPdfNy5vTRchaSm1uEgm6rbzdZGgZ/HBxpvYVRl3iDdZaXYy99YsPzIyPqJqQ==
Message-ID: <c6441937-5b6f-14b3-d50e-2dce662bf6c6@bootlin.com>
Date: Mon, 31 Jul 2023 20:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: docs@lists.yoctoproject.org, Alexander Kanavin <alex@linutronix.de>
Subject: Re: [docs] [PATCH] [kirkstone] ref-manual: document image-specific
 variant of INCOMPATIBLE_LICENSE
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20230731175836.51755-1-michael.opdenacker@bootlin.com>
 <CANNYZj9EKMEu6-9_YvKNaicsJia5ixoJuZOy7C8V-ZfK3mPTxA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CANNYZj9EKMEu6-9_YvKNaicsJia5ixoJuZOy7C8V-ZfK3mPTxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 18:44:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4094


On 31.07.23 at 20:10, Alexander Kanavin wrote:
> Just in case, dunfell can get this too, with old-style override syntax.
>
> Alex


Done. I also removed the mention of meta-gpl2 which is still supported 
with Dunfell.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


