Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12903C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 09:32:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.49377.1740994328887590125
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 01:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TnPgJkXX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F22C432FD;
	Mon,  3 Mar 2025 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740994327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRK2ChjLX1RhvD/2XcyhJhd4GThmhr1hl//LG8wkrqQ=;
	b=TnPgJkXXTP9j83BOjxJJNeMzrCamv+PknCQLotKkhWfDvSfyx5zQt/hxS2nAdyzPb7cnqS
	8togjDvVkCfcjFxeSgvdrQMsffF55oZNJpQVV1HjJeKAvb40+6MRXgiR8/7+KXxNWPSwQZ
	Y60mzNeOUFDvSzJxdA2CdNQaow1p1hfCnrLRVvCvYhwwVHddcgXmVBAO+cT0upBHdUBCA4
	SlvK347PpNEm71rGq2fqao+/QP7I4ahi2Uxl9wRlbU55x1p5j2Bvc/Vit0qxD9J083vEjU
	2lH/jStVNI8tNwpJKA6K9b6Bqb/YognPIhIaGgOTadmYyYLYFImx09awqoNYPQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Yoann Congal <yoann.congal@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Mon,  3 Mar 2025 10:31:32 +0100
Message-ID: <174099426450.179139.5512695442983532436.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250217220618.1999362-1-yoann.congal@smile.fr>
References: <20250217220618.1999362-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhuihhllhgruhhmvgdrshifrggvnhgvphhovghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 09:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6473


On Mon, 17 Feb 2025 23:06:15 +0100, Yoann Congal wrote:
> This documents the variable used in the "automate testing a single
> recipe's reproducibility" feature [YOCTO #15701]
> 
> 

Applied, thanks!

[1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
      commit: 417b423ea3d2ba9903d21d930c1982ff2ac6f596
[2/4] reproducible-builds: change/add titles in the "How" section
      commit: 0ff459c273704a281419a44ae5670068ac47f1b9
[3/4] reproducible-builds: add a "How to" section with OEQA* variables
      commit: 78cf8b1ff1cdfbc863033f267da8fb60419b50fc
[4/4] release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
      commit: eec44e4daf414be414e9fd0471b0381b980d6fab

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

