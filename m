Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724D3C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10003.1741856497817499400
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 02:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SFI74WFt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A5674322D;
	Thu, 13 Mar 2025 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741856495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bT45fMJtpXB+oBN26HYNJPRQQPvSa9ouuHF2RKDbTTE=;
	b=SFI74WFtHdPATaAdEY/DqYpWeK5kHe4Y/ulEOxwc8MUxNtsQvUD/LuLDnUaTylvip9MOnV
	whs1U+PEbvharObg3XkRa1gDM+ycDAgkQVI037NXB+NlnGJT4gwMXVmiNBHRGxhYLP0y+l
	psPQrH0PE42vTlJh54+p8s+/CAsp01RBWz8TcpBQxq7Udvl3d0h3PXYkac5BjDx1l+yc8k
	rBbNJVseQ7eLj6slEWDIvvFXRsT6EW+lQ14yagwA2vPePuntS0tw1njZmmntcQKy/IpWJ8
	/9t3XMd/3I01vbTEapXC61NkHQERauhnlMNJMUzCJsII4Ftw6L6b4Mod5Rkw+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 10:01:32 +0100
Message-Id: <D8F0LDVA69Y3.KCX1FO1IU3XB@bootlin.com>
Subject: Re: [PATCH v5] ref-manual: uboot-sign: Add how to enable ATF, TEE
 and User defined snippet ITS for U-Boot FIT image
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250313020253.2785661-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250313020253.2785661-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhedtteetheefgfejleeiledvieevleduffejgeeufedujeeufeefjeefveegudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohept
 hhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 09:01:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6551

Hi Jamin,

On Thu Mar 13, 2025 at 3:02 AM CET, Jamin Lin wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image gene=
ration.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Thanks for working on this,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

