Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DFCD41C12
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 07:54:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.6648.1731484471940185050
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 23:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SLp/AFw/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 617F61C0004;
	Wed, 13 Nov 2024 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731484469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZgeQLM9MX1bgk1MyktBo9be1N0yFJYl7q58mS/kfy4=;
	b=SLp/AFw/h462tFuM3EPsMFI09WcCUe1TxYT0MA1FHgNjM2KzhDsTuhjVCWYA0VFNZwUGhH
	vd5A4PnZRXB2HZgXm8zVDugBBGWdQDh1oqg3cfUnyMtiHMdhoK4mtCYE+XAO467j+z6p7m
	ua5ckC331HKeDz09Oxcb2nmmFgBNiTbIJeFM1Y0PeMjekuTP7dGoGMgfvy0fdV9sPh1IkZ
	tXStBM8wjuOdg5LQ3auP9IVaUrN4SEJyMmpUmoeAj/sBEiUAtn7oGPQQnAk8lERkOtqI/7
	cw0hv/aRWJVaX4uxMTg3fZo3BUPWHlbHrzg2A0LJ9IA2NybKtD9uXIOIjRoqvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 08:54:28 +0100
Message-Id: <D5KW0NVNO5JZ.1SI8DN34VECJG@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs PATCH] migration-guides: 5.1: fix titles
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241112-release-note-5-1-fixes-v1-1-6f4eac19810c@bootlin.com>
 <fb9965bd-d904-4052-8286-329195bd5bfa@cherry.de>
In-Reply-To: <fb9965bd-d904-4052-8286-329195bd5bfa@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 07:54:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5721

Hi Quentin,

On Tue Nov 12, 2024 at 6:18 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 11/12/24 5:48 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> - fix title underline
>> - add anchor for workdir changes
>> - supported-kernel-versions was misplaced, move it
>> - "Miscellaneous changes" anchor was wrong
>>=20
>
> The old refs aren't used yet so fine to only modify where they are define=
d.
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thank you!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

