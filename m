Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD771C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:44:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.81777.1749545061077436391
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hFfv7mUw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 851F4432B8;
	Tue, 10 Jun 2025 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXY3MhhR9lCqkWt/xpCOjLkZaoOJmk7oeupCLAC/AeM=;
	b=hFfv7mUw/XDiGC3FX03VSpgjSfvITitocbkBKE/xEfvaBCRNG2r7oFd6miludZFv1rUsKa
	VSt0KLlRswSg/coCHMDap6y5PpEh47ZDXaMhuh2CzECvTUIUT+v3E1IJg/8QrQkxCYOi8Q
	l2SEEHN7pZZQkG3GUjmtrJ8ixexqNBHAZ3EP9sTvGo6lQZ9PK6YUagPI4E2Cq64MzkTvDU
	g+SL1iSzWn/e8HVx2IDRToYQo3l2Dr6dEW0JbFzpi1YJaPWmfq5wxFfBPiDAUBUuPR8prT
	XrFoJsv/7GJzSsSjjJFsdl5mi4JjKyLPh1GjWtuA7IujMCBov6QbzfxZ3tL+EA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] docs: remove lz4 from required packages
Date: Tue, 10 Jun 2025 10:43:51 +0200
Message-ID: <174954493843.20869.8087472669078399910.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250606-lz4-v1-1-0cc017274b37@cherry.de>
References: <20250606-lz4-v1-1-0cc017274b37@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehfohhsshdohihotghtohestdhlvghilhdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7042


On Fri, 06 Jun 2025 16:09:20 +0200, Quentin Schulz wrote:
> Since commit b13654a4fc2f ("bitbake.conf: Drop lz4 from HOSTTOOLS") in
> OE-Core, lz4 isn't an expected host dependency anymore so let's drop it
> from the list of required packages.
> 
> 

Applied, thanks!

[1/1] docs: remove lz4 from required packages
      commit: 040556cc9bc998970eb6152f8748d359b15b4bf9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

