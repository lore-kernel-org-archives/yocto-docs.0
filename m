Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F039C83033
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5729.1751359517097386620
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g1R8fpla;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27BC2431D9;
	Tue,  1 Jul 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yi9r09omw3iIrPJ1FvGEctep0Hjil/iO9XsX+6g1T30=;
	b=g1R8fplaw4S2B0hY8tU8CMy10NQ08mSdRcBqYoz9s7Hc4E8/z/S1PDdNt6fKl5F8zBwQTc
	QQF3bOnPB3PyfViMdoE4o7aeRRK63AKvfHnJYYpFdZq0j07J1aHYMDy6yRpikeee35DXEB
	/IqNjFeXBEgkkr1dbd53SvQrj8Z0/qRl375iDHQGkZL1vi7ImKubK1I2yTCXXXl1Eg2ybf
	EFKf/JUvwMlEfgthTbG3pF/uQSGpkErhpuXJtzbxstB340OpWYWTrVkkEGWMVEuyGqag+m
	w1/AkoGxb+yiypDg1Y5mB9U642dknusJEWOisiIrhH9N6pXC9M02Y4iK3oUV/A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/yocto-project-supported-features: add ppc maintainers
Date: Tue,  1 Jul 2025 10:37:18 +0200
Message-ID: <175135901850.368044.2493174453219023671.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624172439.1667237-1-adrian.freihofer@siemens.com>
References: <20250624172439.1667237-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7236


On Tue, 24 Jun 2025 19:24:39 +0200, AdrianF wrote:
> PowerPC (32-bit) remains relevant for our use cases, and we aim to
> maintain support as long as it is feasible with reasonable effort.
> 
> For transparency, our primary focus is on maintaining
> core-image-minimal. Support for more complex images may be limited
> unless additional contributors join, as ongoing testing and maintenance
> of these images may not be feasible otherwise.
> 
> [...]

Applied, thanks!

[1/1] ref-manual/yocto-project-supported-features: add ppc maintainers
      commit: 63f0053f0f0201529bfad3e3f1b0211ac40ad1c2

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

