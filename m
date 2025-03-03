Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55647C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 13:26:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.52717.1741008395374279157
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 05:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dLzk5zgO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66D9620457;
	Mon,  3 Mar 2025 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741008393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=syPPIufP7KenbZTgsjBN9rDPIwwdqzAOMfAzcaR0QQQ=;
	b=dLzk5zgOKO349XEqhvlVYqXp7Z0h6RN1h1zpBkwJqRTpl9rb6lc1cU6baAy3qq8ngGjzV1
	0bAIZ9vM7QU1YaBom646jE8Za3V+f2P2Yxf87TAi7kMrCvYgjjrFsmsk7tOpvNRQ/fBjUO
	HP9OQWueJ0rdwFcR1aXiFIGq7wpjEutMLvv58IXRWIfYXMN525bbVBsvD2aQTC3rKkrLB+
	Cj/V4pdhTmoBqF01qnp2OwIjXPERGM8ymL7/QBLiANUP4ZFOtgOL0LjcH2laQ65QZdBGGR
	ZXze38SQbdanrO3jkjnF06yDrn6piTjzfJSYCofnmIvLd1SV+0E5CNk+Uujo9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Mar 2025 14:26:32 +0100
Message-Id: <D86NYU2LCQQL.1Z2582IJ4S7Q@bootlin.com>
Subject: Re: [docs] [PATCH v1] ref-manual: uboot-sign: Add how to enable ATF
 and TEE for U-Boot FIT image
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20241118062113.269253-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20241118062113.269253-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelledvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehvdeuteegkeetgfejtdfhfffhjeduhfetudegffdvteejheffieetudfhheffkeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehtrhhoh
 igplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 13:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6478

Hi Jamin,

On Mon Nov 18, 2024 at 7:21 AM CET, Jamin Lin via lists.yoctoproject.org wr=
ote:
> Add how to enable ATF and TEE for U-Boot FIT image
> and Image Tree Source generation.

Could you tell me if this patch still up-to-date with regards to the merged
patches on OE-Core?

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

