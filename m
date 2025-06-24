Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A14DC7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:36 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.3075.1750749815563852989
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=md9omZNL;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACA2D44A3D;
	Tue, 24 Jun 2025 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGivqyTBCoKTA9/4OWJ+shL92oow5WxZgrVyL3xW5mU=;
	b=md9omZNLVTzq5KLuBVBhhRdCBit6cBDGJ+JuB73vWYAZm+P9BmGA4cVRosuzrB1WaUbOpo
	NxL87hcle0chKcWmc9HwKOhUVnflEBY+lIbXP5ywhxg/2IjilIzRSqWc5zISM/HXq23wQf
	Q8qHliYc2WWuqj4mdPd6DO8DCzvINGgXwGTeCTtV9TSZeL+psje21JPx8KcMEuQUHHUKCT
	C0t3DWen/uNE6CbE2wiSo1UFLg3wkBBcTHsTybCWriBJK3wx0w+f4MPpJ1TRNPHREdBIb8
	oK0YCDnVUWnz1woHOFhQLVoR9ge+7LlEwLwhLbBjXX6FUcZaeDrBu1izSCAlSw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Joseph Maniaci <joseph.maniaci@seagate.com>,
	Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] ref-manual: classes: clarify native/nativesdk classes exclusive options
Date: Tue, 24 Jun 2025 09:22:52 +0200
Message-ID: <175074974633.298373.8406710312227226474.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
References: <20250606-native-options-v1-0-2ad99a184f90@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehfohhsshdohihotghtohestdhlvghilhdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjohhsvghphhdrmhgrnhhirggtihesshgvrghgrghtvgdrtghomhdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7178


On Fri, 06 Jun 2025 17:01:46 +0200, Quentin Schulz wrote:
> Someone recently misread the documentation and did both options, that
> is name the recipe with -native and add BBCLASSEXTEND = "native" to it.
> 
> So this hopefully make it clearer by rewording the second item in the
> bullet list.
> 
> At the same time, put the nativesdk note about the filename for the
> first bullet point within the first bullet point, like for the similar
> native note.
> 
> [...]

Applied, thanks!

[1/2] ref-manual: classes: reword to clarify that native/nativesdk options are exclusive
      commit: 6d0d338a5f2686ddeee5eed7b6e05f3db800d33a
[2/2] ref-manual: classes: nativesdk: move note to appropriate section
      commit: 15fe239e1e62b9add737aa732dd7f5e9948ee03d

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

