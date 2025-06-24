Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEFDC7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:46 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.3077.1750749816467440990
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fs1FK2n4;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1E1544A41;
	Tue, 24 Jun 2025 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=so3/XNzZTSCqECaAjiouK6HLkWVQ6ULmSH+U9dFUGOI=;
	b=Fs1FK2n4F1OWIN1X8guAiuiaF18QCNznjePMoydksE4RnuPZY97n4H608muYS5dz8ZwCER
	ZSDkKpXY45zt4vaM4Us4clEMFIHT+Q7CnfwtwGRfb+jvG0VoJBK7Ar+2RRSAWOLNGnz5l2
	sQgKnIUXYQxMnc2KP8WDXm+pB3cd/kGKAzyWbp8SzqPQT3hYF+Nwp4O/9mtjZzSrDFrz2X
	8G+njWNsCSBw8y7HE+gTYsw35gqC+pk6S7DRSrJwqcWUojSXUsNAM0FnOCeT7nmGo7abdS
	5bLsMBEh9r3wNfEQHhx8jkAdEU1YTi321S0iI+gJCuo3iuC5qAS1YpLdTneEyQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] bsp-guide: update lonely "4.12" kernel reference to "6.12"
Date: Tue, 24 Jun 2025 09:22:55 +0200
Message-ID: <175074974637.298373.3975804804280117361.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <48a03c30-a5d4-0710-efd3-579de1698cc3@crashcourse.ca>
References: <48a03c30-a5d4-0710-efd3-579de1698cc3@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7181


On Wed, 18 Jun 2025 13:44:11 -0400, Robert P. J. Day wrote:
> To accompany earlier updating of kernel version, update this lonely
> reference to be consistent.
> 
> 

Applied, thanks!

[1/1] bsp-guide: update lonely "4.12" kernel reference to "6.12"
      commit: e26c2018cd663de91ee08e0cba55eda1a4c30210

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

