Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE3FC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:44:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.81776.1749545060383520612
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MFhA+cDd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B638743290;
	Tue, 10 Jun 2025 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dN11n2N462q/SIDBw8aG4NkeGoQeVFih3jCx+ns0vbU=;
	b=MFhA+cDdhFsLPb4uyP58w2Z2gG/Oycb7ts7y4pQsZLFfltk7tznfYFjxwJ8kBxS75TRSHt
	qeJYKp28P9i7Vw1W2CBlF3jQvyhfNKecOflNWP+h8qaY4giD2fZP0rsQqmjcVA9CgEXU73
	3EOT7MOfHJXLm5VYOEp8IvqKWJ00h35Yc7MxlfvqXPnB/TetL5brmeWtUjz/SkI2f4safB
	O9lcKfHY+952O521DCCCZvD9PleFrFTX7euXK+Bauad0tvgF/0kcAeZ6vIqb4UbzTakWHQ
	JbyC8QV+5MTLB+ZWlMhOkRDs8eiXRjuWctPTMgMYymR/cH3uadbQ7YnUFBezRQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] README: fix contribution instructions when included in poky
Date: Tue, 10 Jun 2025 10:43:49 +0200
Message-ID: <174954493842.20869.9096483405894671299.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250605-readme-contrib-v1-0-c51b8cc57b7a@cherry.de>
References: <20250605-readme-contrib-v1-0-c51b8cc57b7a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehfohhsshdohihotghtohestdhlvghilhdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7040


On Thu, 05 Jun 2025 16:10:22 +0200, Quentin Schulz wrote:
> While trying to explain how to figure out which mailing list to
> contribute to based on the changed files in poky, I discovered a few
> things:
> 
> - the contribution instructions in documentation/README point to
>   "top-level README", but
> - yocto-docs's top-level README isn't copied in poky and poky doesn't
>   have one,
> 
> [...]

Applied, thanks!

[1/2] docs: README: specify how to contribute instead of pointing at another file
      commit: 0298318cea2947e65754eab97255164e64a862de
[2/2] deduplicate README
      commit: a2ca09160520ebae493f6d546041cbe5dbd22325

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

