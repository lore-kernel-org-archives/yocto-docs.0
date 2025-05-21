Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726CAC54EE3
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3845.1747845901175655994
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rd6uBE1y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A721C43A49;
	Wed, 21 May 2025 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1/6pjLnILHYMnNSfbjDnn8vpBe4uueqLsXnksIibNk=;
	b=Rd6uBE1ycxxHvajXXpw8evvUeNWpf8Z9ypCwGm1FRkJyMtARkJ2/6Q+AH1QrT6BU2nPINk
	Iu/vHoW1caW5ivLpQd1uyAYjca+MnCViQn7skhk9NMA6mXlrTES2mbfgYOYvcQrYCaHYV0
	uBeUAX3qVc9Vfq0EaR9PXF3RdAGuM50+oFcXpgTZxWH62xK+SgBQmvC9BjgwCAf9WZRLC4
	jF1Ap8qyvs5Hd24nDCuX4mc+NeAp19yDSu9V0Wp8/+3ct8TfJY9wm41fc+wgsWxeXHIdAu
	+Gm827AyHKJhyE3hRD1v5YW++SeYGcJr3jecKFtN03nSfin7gSGwGktPHwPh0w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] sbom.rst: how to disable SPDX generation
Date: Wed, 21 May 2025 18:42:29 +0200
Message-ID: <174784571483.218104.12377594758063772151.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250310153108.40579-1-mikko.rapeli@linaro.org>
References: <20250310153108.40579-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehth
 hhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6869


On Mon, 10 Mar 2025 17:31:08 +0200, Mikko Rapeli wrote:
> Generating SPDX is enabled by default in poky but
> it can take a lot of build time resources so document
> how to disable it.
> 
> 

Applied, thanks!

[1/1] sbom.rst: how to disable SPDX generation
      commit: bcd58b7a9455fbb0ea5944089d663e327f0eb38f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

