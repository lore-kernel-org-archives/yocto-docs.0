Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F03C3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:01:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.61093.1742893265708207934
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FbdTSY8X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF31B4436F;
	Tue, 25 Mar 2025 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742893264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ms6Uv82CsnSTlP/V3auuAlB7nvXe/E0dE6/KMyHf4ZE=;
	b=FbdTSY8XykXzNcCaRB16wUybhh2AmaG8ngkumOWthdBcSO2DDNY/Q/x2AeudaOYOwHDQEE
	ry1Y516UDkgNXZHTBLfpthR6RYyY03XdL7VvxbgbaKppJ4zk3y7yAAohf2PKjzlBQ8Ghc8
	U5XNZaRdS4VIpwihH5AkhMtO5RsFi289BXOlCHOc2C5W2QZtXuYrthmtz/Is6Tz0QbXReQ
	1MXsJJvhmTZ+nH7qhsz6JWy3v+n+M82S7GUjQ2x082eEmU/Qtl4E/tk/mfAv2CicOAWG7x
	WXocWLguDOn3cQw2mNzY4q08URXy4W5pon0sY7T3OOaChvJvyaSMP8JSNUdkKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	troy_lee@aspeedtech.com
Subject: Re: [PATCH v7] ref-manual: uboot-sign: Add how to enable ATF, TEE and User defined snippet ITS for U-Boot FIT image
Date: Tue, 25 Mar 2025 10:00:19 +0100
Message-ID: <174289319830.1738162.7668974414009820429.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250318031040.307730-1-jamin_lin@aspeedtech.com>
References: <20250318031040.307730-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:01:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6610


On Tue, 18 Mar 2025 11:10:40 +0800, Jamin Lin wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image generation.

Applied, thanks!

[1/1] ref-manual: uboot-sign: Add how to enable ATF, TEE and User defined snippet ITS for U-Boot FIT image
      commit: ee6b3698da044e290dbc4fbb852f3cc37638e689

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

