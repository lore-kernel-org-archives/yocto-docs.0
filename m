Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71290C83F1D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:38:26 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3504.1752568704591074326
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 01:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L53mKon2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74E604315B;
	Tue, 15 Jul 2025 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752568702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoXkpSKq2h7F8OLEbL0RhDOX6meLW6Nk2txIhHb3nF0=;
	b=L53mKon23RcIwxqVTTxrTtTHe20en2YCZhT2cZwE3MAAGTdknQ5vFwFBJ8J0ANErxc8Ot3
	EK+oPtDGLcRrV0Kvd2Er9ww4iJaD5kKrxmTcX8wJIzileIlUqVMAKijXMbcMdEqV4xnUtT
	tpUB53ZBe56HJCELdF4JI3GoHIUh9Ule5mFiU3GZpXEcO2TkzKM3rnzVjH7i1CJJyKwOzs
	RyeFVZaHCWk65+11S5eDT4T3iEfpG4Qgh+dfY7bPwmOLN/liG5ICi4i0At24o00I730p76
	7YK9o8DUp+sibDJjAiROpMcSzQQF0Szi9AOkw5s/5x23hVJIsC/li18bUo5a7A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 4.0.28
Date: Tue, 15 Jul 2025 10:38:06 +0200
Message-ID: <175256866290.43278.1076256060208083764.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711034159.883958-1-chee.yang.lee@intel.com>
References: <20250711034159.883958-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptghhvggvrdihrghnghdrlhgvvgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 08:38:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7331


Applied, thanks!

[1/1] migration-guides: add release notes for 4.0.28
      commit: 6959193fddb039c34384fcc391195fdd7fd3dbb8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

