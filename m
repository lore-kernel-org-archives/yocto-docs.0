Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6316C8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5579.1751359517469949924
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oxuTuid0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D59DB4321D;
	Tue,  1 Jul 2025 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktKT+KEHhFXNtegc3vOBRQ+TsGN44ZfWNRBXIhX+ik8=;
	b=oxuTuid0IdecHATOu+ldFh/JzgjpsuBTd8KVSbNyxQm5t6RYvq57fChSSXW4UBOys8+wEJ
	j9WPy5QshfXV/rMheoY+kdnbmknL7ZHqcEReDtDyN5qFOnkx84npeejr6Y0R68TtdRvz1o
	I6Z5MqgB+TlBkaC3GkdJuRSPYrCLT5khJohbAyr1+LVKxVTmza4sFxtQ27H5XwieRlEFjt
	gG2bcgRjPXY0tEpfBnxzcSaoelQvfjGTpeuTvVxQTYVyvrkJPbTErdJ3UnO2WjCjvtP+ZG
	XoVqKC/9yLDk+fdrEoPggHj6o1cRXLerR1Vh6VULAPJ85RnGm0UpHun6xZyD5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [PATCH] migration-guides/migration-5.3.rst: add guidance for breaking WORKDIR changes
Date: Tue,  1 Jul 2025 10:37:20 +0200
Message-ID: <175135901848.368044.8629051646293557440.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624091152.1939195-1-alex.kanavin@gmail.com>
References: <20250624091152.1939195-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7238


On Tue, 24 Jun 2025 11:11:52 +0200, Alexander Kanavin wrote:
> 


Applied, thanks!

[1/1] migration-guides/migration-5.3.rst: add guidance for breaking WORKDIR changes
      commit: f59504d8706a817e0b5a6235ebb69cb3b3ebb277

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

