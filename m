Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C784AC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:44:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.82275.1749545060720434090
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d1tZSiS9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 282CA432B9;
	Tue, 10 Jun 2025 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UN0MPK5kw9JEo5FJPQFg6sPdFJfuNgnEkF7H5zgbZ8=;
	b=d1tZSiS9eHgs57Mr00NKs3KR3MADQvHAuqaVdX59l5lvk0BATu6MjqYC4sB5mrWCK0Dvu3
	DdaPgvTp+U1mGur/SVQNCAKC854R3sefE9T+A+pJb/oImysznLsCkvueqrf+sNO6mLjNPr
	DsIcxP2i2o/53fQzFiHt6ZE3o3/7Ghjnspf9hZXNktJ5YjYhDa+ajCeAMwuD9pGNxcO+7i
	J0ICKHZz9uSQXHxHv0urydZLd8okgbdqo9+/lvVcQVpyXhGOe7BsOa5868g3QTyINNEerU
	dca3KbRZwdzbPu3g8yO+802bJcQI1aEIb1yXHyx90yNfUhvddPN6ULBlabOJdg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	=?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] docs: conf.py: silence SyntaxWarning on js_splitter_code
Date: Tue, 10 Jun 2025 10:43:50 +0200
Message-ID: <174954493843.20869.2649978297368888137.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250606-conf-syntax-warning-v1-1-4ebc90ae7d69@cherry.de>
References: <20250606-conf-syntax-warning-v1-1-4ebc90ae7d69@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehfohhsshdohihotghtohestdhlvghilhdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7041


On Fri, 06 Jun 2025 16:21:33 +0200, Quentin Schulz wrote:
> The js_splitter_code string contains backslashes that Python tries to
> use as escape sequence but doesn't manage to, hence the following
> SyntaxWarning message:
> 
> documentation/conf.py:188: SyntaxWarning: invalid escape sequence '\p'
>   .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}-]+/gu)
> 
> [...]

Applied, thanks!

[1/1] docs: conf.py: silence SyntaxWarning on js_splitter_code
      commit: c1056672ef45b197136eb8815728d426337a5901

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

