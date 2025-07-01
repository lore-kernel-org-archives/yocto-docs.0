Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB00C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5733.1751359520321157964
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WLtdn2or;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B69CB4321F;
	Tue,  1 Jul 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSnAd6Cln37RnLuqr5uGBiFqvVcGNXOETt8ey9YJFnw=;
	b=WLtdn2orVJo5r3tnmb3c/U/Y5f4zXqYK10sRsOT5h/WbjjhhwpEDbjJIX1Y8VfOO4mkirX
	8UGl3MD6dBfSyA4tMSwUofgaXL4Z3sB7MPDUvAvB0EF3rATisZbXLbC15Vd4NdBkkC/6Ju
	4/Hf0rSQaYyOJ4ZYnfsCCFrY/mudwEJPKnQW2jugZdTMnSq8tzKuVdXooO/ChzuzxDF+Tn
	OOevA1gzIQpZes8QLkHj543rkAMv0/C4gVoS8AbQ60YBkF/bLkQ056qUebeFbKUHAT9PHS
	I1+yy+/sEXETv8ic9eyaaLHlnAgkEGWa3uo4nKqHM+fZSNvk3TN31uMxDD4hiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: minor grammar correction
Date: Tue,  1 Jul 2025 10:37:28 +0200
Message-ID: <175135901845.368044.12888557238574827750.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <47e13a94-0ba3-cd70-4086-897143f7ff61@crashcourse.ca>
References: <47e13a94-0ba3-cd70-4086-897143f7ff61@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7246


On Sun, 22 Jun 2025 05:12:21 -0400, Robert P. J. Day wrote:
> 


Applied, thanks!

[1/1] dev-manual: minor grammar correction
      commit: 4e06c7f08a36c54a7f14760e609058468fab112f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

