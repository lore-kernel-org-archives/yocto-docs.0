Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE9BC8303D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5582.1751359518718294511
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kXFxWIyD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0499743220;
	Tue,  1 Jul 2025 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZyG72mqwargvpCHlzakao9Icw5r5yK1d/cHC4tMTO0Q=;
	b=kXFxWIyD//3r8N4W0VKUJeuSMMmvlycpz6fAQIq8uSqX52ndTt90IZ10ygyfP/4piptA07
	LhabLhTw1rCboOqzVkNP3Xvfk/IHPbw+MMDTuKTGH+JOyyDDzgBqSmKTE18Afq5s4u6qqL
	gAlF1cW4QQ3s/ljhJbw7NdzLb6P1D3THMj3IZ56pCEf9aU0yDCoeGqZknr2sPeCiBhloWR
	6ikT1LOC+mYrvspFE3mQgngbG5ugoH9SqAC8YJQDTTpZ5mLvdJ6QriYFwFltIdYfQst4L+
	TFzK2fJMB2GHwJtTQVPsgI3+wbsRqQ2S0uIo/W0Ri0v++9nLAw8512sImXLwbQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Dixit Parmar <dixitparmar19@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Tue,  1 Jul 2025 10:37:23 +0200
Message-ID: <175135901844.368044.258646181442021999.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250621071434.46558-1-dixitparmar19@gmail.com>
References: <20250621071434.46558-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7241


On Sat, 21 Jun 2025 12:44:34 +0530, Dixit Parmar wrote:
> This variable controls the kernel module spliting.
> 
> [YOCTO #15771]
> 
> 

Applied, thanks!

[1/1] ref-manual: document KERNEL_SPLIT_MODULES variable
      commit: 198179d9c6231b5934d4fb6ede716d1dcb1442bb

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

