Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6F8D2B928
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:27:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.17991.1730813231713965357
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 05:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lDt+1FDm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2D5160002;
	Tue,  5 Nov 2024 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730813230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBRN7BUAzLVO1Ml4FKJ3hiQZWS/OfbbYOo+ftOWwvYw=;
	b=lDt+1FDmLXNpnDoDDjVW2C43BRsiPnRfx7BAdgVQlGjWeRYiwg7cCXHzSCpH70P+jkAJAT
	nL2pfg6HY2sVFYSHyOtXzk/M3X82KiXZWNmtXIo4G2MEZE1BC5zmrH9WDymPQGPs5C14gG
	15jAwSCXyL6QHaKI60UqQJQh+JrKtJaA4yuN75K7CB3AebOFUMngtRjjyqQq49oGoKIggf
	/LKR/Gn1aVyZkkv0s7VyYcdFSM0kSCoTy8m6XelaN8oTLpzLBxjVcWJgmemsBeOaF51whk
	S2BNMwtBSvacLMsU5croxg1Z9uMhdYy+qn+CiPEjg0LvP1xWnXNliRecCSZrVw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Nov 2024 14:27:09 +0100
Message-Id: <D5EA30PTOQXJ.3CMF3M4B07K5R@bootlin.com>
Subject: Re: [docs] [PATCH v2 0/2] Add bblock documentation
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Julien Stephan"
 <jstephan@baylibre.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com> <D5E9RNX36GZW.10MSD4UHMX2LR@bootlin.com> <2a77885c-43ff-4574-bf1c-d35ed77935d5@cherry.de>
In-Reply-To: <2a77885c-43ff-4574-bf1c-d35ed77935d5@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 13:27:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5680

Hi Quentin

On Tue Nov 5, 2024 at 2:14 PM CET, Quentin Schulz wrote:
[...]
>
> There's a v3 already BTW, so maybe take/review that one instead?
>
> Cheers,
> Quentin

The original series was split in two, and only the other half was sent as a=
 v3 I
believe. Thanks for your vigilance! :)

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


