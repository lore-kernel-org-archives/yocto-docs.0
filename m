Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F38C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:36 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.2917.1750749814239169331
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CDpY1Jjq;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B13A844A41;
	Tue, 24 Jun 2025 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9vkBqpRgJr4m29w9OggfEVpzP/oau/3ZUalJXFJKGo=;
	b=CDpY1JjqOgtSc2f1aID0afC4f9ZLX0+WxEyj1RCTrq0C/ZRClV6LsPaSOdmO1DCf4S+tyI
	BB46wDEMjXm7mDtnyND+3iBE2sigigyjSiWUQ+4lpipb7Qz4z9ZEygX7uCCMicofyCT/Sh
	xV5/PJTIs9Q79D9bz7VIlaT0hTPJS37EaYPLDUAHiVJo80PTU4/t0U526TRl7yvAbtKTwy
	2qcbMVHg63bo4aPEYl4KbbuKFpvBMlTv1//B/EHMa9kkVqA4KAPS7TlmVVGXOdI4zg15Ns
	QEZgWq5hclERZ2Laekh817BB3oRNFnyjCoz7tD0nQk1NITGcZDjL/fXXA587kA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	daniel.turull@ericsson.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
Date: Tue, 24 Jun 2025 09:22:50 +0200
Message-ID: <175074974638.298373.11629214301955185431.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619132257.2050864-1-daniel.turull@ericsson.com>
References: <20250619132257.2050864-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegurghnihgvlhdrthhurhhulhhlsegvrhhitghsshhonhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7175


On Thu, 19 Jun 2025 15:22:57 +0200, daniel.turull@ericsson.com wrote:
> Adding documentation for the new feature to store in SPDX
> only the compiled sources.
> 
> Merged in oe-core: c6a2f1fca76fae4c3ea471a0c63d0b453beea968
>  - spdx: add option to include only compiled sources
> 
> 
> [...]

Applied, thanks!

[1/1] Add SPDX_INCLUDE_COMPILED_SOURCES documentation
      commit: 4dbc63ed1381fe47723d6ba5b7baf2a3b7fd19aa

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

