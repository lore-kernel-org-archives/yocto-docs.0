Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE40FC83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:14:06 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.54807.1751876044939184290
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 01:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mKC2e7+K;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 668F84388E;
	Mon,  7 Jul 2025 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751876043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/Vyjb4AgBUQAjtDxAfSuScDmCURQxbLQ8z8G+AVY1s=;
	b=mKC2e7+KeW/JQBm1QdekaYJ7Cw4VOcKoaRnf9jS8OWUoIJFQjZr7fQiP1WFb+JTHfDzeVV
	C8HOamFUmpmLfhIsA8f89PHZQ+iVx7FeWw4ywLa3THU0FuCKfiSyEeLqmSK/WuMyxLJNrc
	LFhbn9D+Z5rM18VUWNnwq1ZjheeppgKJyOvAI/5yZfT37Wk2iusmvFP2umk48p5qUaAVUi
	efsD4rwDZAeohC3DX4rsElnB4Vu8i9WZ/JG6Po0+vkcs3ez0xdnkWflankxr6IyQ4h4WyP
	nWQmMQgJywdV+potHqzawe1Gq+iRPQC9w7QeKPpDCv4tDhwSArRkHA0O2j1mrQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	yocto@pengutronix.de
Subject: Re: [PATCH] conf.py: improve SearchEnglish to handle terms with dots
Date: Mon,  7 Jul 2025 10:13:37 +0200
Message-ID: <175187600751.33933.9737488921915930787.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703102301.3566750-1-ejo@pengutronix.de>
References: <20250703102301.3566750-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefuddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihohgtthhosehpvghnghhuthhrohhnihigrdguvg
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Jul 2025 08:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7267


On Thu, 03 Jul 2025 12:23:01 +0200, Enrico Jörns wrote:
> While search queries already handled words with hyphens correctly, they
> did not do so for words with dots.
> 
> To fix this, we
> 
> - enhance the word tokenizer to treat both dots ('.') and hyphens ('-')
>   as valid characters within words.
>   (For robustness, explicitly exclude dots/hyphens at the start or end
>   of a word from indexing.)
> - adjust query processing to avoid splitting on dots in search input
> 
> [...]

Applied, thanks!

[1/1] conf.py: improve SearchEnglish to handle terms with dots
      commit: 80084a4cabdf7f61c7e93eda8ddbd5bc7d54e041

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

