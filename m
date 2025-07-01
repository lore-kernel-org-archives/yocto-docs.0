Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F528C83033
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5737.1751359522162375505
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gPw75wMq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D23543905;
	Tue,  1 Jul 2025 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMDlgIO1c1kdWSl5nze+jo50YYHFDBj84aVUHmk/9gw=;
	b=gPw75wMqjZv7iwDpwo0gK4hb1BcG7M1+HtvXYy/EQS0orUaBLg5tKqllmWd4LYV/wYelNa
	sU4UjzVg/ZvG0AsIICn9Tcl5puVRJoPI/3Lfe4bJVxPf/BXI2uP63JAfmmJC1xZQ7e+Cu0
	XXF5hOTvFSIbLerTsiyewD5OePQwWVEMlF1Vp6O9RtwVe02+9NKZD2Ycrp1zUW4Huk7gHl
	qeBgNak2b41LPJhteUjFNkWTg7Om6I7edgXdcbJ4iaeKhktKxMYZ7S2VCWeNn8GsSzWjVc
	5tqrQVhjAl2N6fZjF3c9jhsZEjoF5tdRwMysqZNKv1SZTIUMfeNgyakw+b2YVA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] dev-manual: correct statements that source is always tarballs
Date: Tue,  1 Jul 2025 10:37:34 +0200
Message-ID: <175135901847.368044.11224809622150906835.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <82eb83e2-a1ac-ce34-d680-7e4e50caf5a3@crashcourse.ca>
References: <82eb83e2-a1ac-ce34-d680-7e4e50caf5a3@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7252


On Tue, 24 Jun 2025 04:16:08 -0400, Robert P. J. Day wrote:
> Correct two occurrences that imply source is always fetched as
> tarballs.
> 
> 

Applied, thanks!

[1/1] dev-manual: correct statements that source is always tarballs
      commit: 57490852e6446672fd2cd0f3ee0befd9714c909f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

