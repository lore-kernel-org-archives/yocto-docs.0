Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A2AC7EE3A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:36 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.2919.1750749814933122976
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MjQjRmgy;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E3C444A14;
	Tue, 24 Jun 2025 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UINc9x6ut5UHSORF3Ot0PnQsuiTrSLXLh6U391wglhg=;
	b=MjQjRmgyccBQFiHIKvC0zpY1963qv8y09DFzRTU1r2MarEcMdUMBYyVpFPM09DS7g3H5nQ
	IsEOLi2LcFVDKUe2NHFFfqMkYZjLgKTxJiDVUvOE+ZV1vk483pok2QE1ZQWCa7HqdUyOrP
	abcJVo+VjUxY5ql1zbik/7Ektc3+t76YgCiZU9XVag7/ILPzqU+2O0O2zf40OKCWwkJ11W
	inNelUlFznn9FJtw+Ib95O09kGPzeMWRt5bPr+AAkfmnvDvGNgpSIRhd6R0OZ0yPvO5kBD
	I6qKWSJHGBagQfRD7Qrx+tqmJCid20sKGPjqrWL06sZRGBlAsfO8Q54I/Whuxw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] be consistent across all local :doc: references
Date: Tue, 24 Jun 2025 09:22:51 +0200
Message-ID: <175074974636.298373.8697668915720048667.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
References: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehfohhsshdohihotghtohestdhlvghilhdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7177


On Wed, 18 Jun 2025 17:13:34 +0200, Quentin Schulz wrote:
> The doc directive[1] allows multiple paths:
>  - relative to the current document
>  - relative to the current document going through the parent directory
>    (e.g. via ../)
>  - "absolute" (paths starting with /), relative to the root directory
>    (which is documentation/ for yocto-docs),
> 
> [...]

Applied, thanks!

[1/2] tree-wide: make the :doc: directive use absolute paths
      commit: b9457f2005b0bea49c54e9727eb30e9458084886
[2/2] document how to use :doc: directive
      commit: 2729250bf1068814e5106d1e71796e8a505963d7

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

