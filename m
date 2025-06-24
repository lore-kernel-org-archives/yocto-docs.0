Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF77C7EE33
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:46 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.3078.1750749817076641473
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kZLmPE4L;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80B5C44A46;
	Tue, 24 Jun 2025 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+ziodxN4Qv3Dx3NuQHar5tfEHE7KXvpxx+oiUyhKw0=;
	b=kZLmPE4LRjACzDwaDfSqPifwRYpB+WYYBdiAd1oZdVPq49+k1hPeD1Dpq+ycJizA2CK5aP
	40n5DutzR9E3o1uqVJc8vTb9q4vRGqAe0edS8V4cLin/xdp+Wk7+pD56YLqRaQz0DZb/Yq
	MzRGKinCtBumNg34tIA5Mk0nCJqkvp5orUqTva5V6VzoERnYX/teX93YBcKC+M0RcAQo+M
	iCo4QD07foGWgUV+DGLNsiDW/Vu5o+/kh9YFUp9m0WyELhvvoSKloFv0rZ0snDtLTUFVbW
	Qm8F7ki/8kEhr6nCeUrqFvZJ7mWqNZUNFJVJj3SXdKG8xTXZ4qnvJ07lNVdIdA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] yp-intro: new doc reference is missing leading slash
Date: Tue, 24 Jun 2025 09:22:57 +0200
Message-ID: <175074974635.298373.7916877512587368717.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <b08ac36e-51de-71b6-53ad-a2f05b0d31ae@crashcourse.ca>
References: <b08ac36e-51de-71b6-53ad-a2f05b0d31ae@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7183


On Wed, 18 Jun 2025 03:47:41 -0400, Robert P. J. Day wrote:
> The new ":doc:" reference for yocto-project-supported-features appears
> to be missing a leading slash, causing HTML generation to fail.
> 
> 

Applied, thanks!

[1/1] yp-intro: new doc reference is missing leading slash
      commit: 4114399711ff82893a10c9eba0ff66c9af7b1c9e

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

