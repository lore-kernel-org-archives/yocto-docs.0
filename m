Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7297C5B549
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.45322.1748327703091873202
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IzKHi4NL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1E4E443BB;
	Tue, 27 May 2025 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9U5NgAsn9W7MqwVOpZUE3G8Q5uuwpgKmkh/36OsU/Ys=;
	b=IzKHi4NL2g4BLJG8NFdfqKpdNItFbVBnB6wbw6iqr2bAJyUghQ/0qN7bJSTcZhsnieHjw1
	Jv0TmmjABc+/nS+BpBaJTTkMB976G4hoUeCdT7qBC5CLwK/eCysBRWZoEwCD2G2nvRoFhB
	2xtu5f54Xyi8kRLf83LNjS4G6E1oD9ORjWIWuUIaLgmwjPrD+Lckw9f7N/mVLCdIBd4gU5
	HMIzXSc56ZCDA0U2MQgubGiI0qyZuWdXNjyPCnUhdmH+UdBMsymM8VtRSwQJ7Jfy+k4OP7
	M0tACC/Ir+y9jA1z4+Twl8GEVHpLpNnDPjLCW9HNMVlfFZEfHbScSA7UNv1r7Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Christos Gavros <gavrosc@yahoo.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] ref-manual/variables.rst: document the IMAGE_ROOTFS_MAXSIZE variable
Date: Tue, 27 May 2025 08:33:51 +0200
Message-ID: <174832723398.222026.17820449231148130081.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250517144845.5384-1-gavrosc@yahoo.com>
References: <20250517144845.5384-1-gavrosc.ref@yahoo.com> <20250517144845.5384-1-gavrosc@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehgrghvrhhoshgtseihrghhohhordgtohhmpdhrtghpthhtohepthhhohhmr
 ghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6932


On Sat, 17 May 2025 16:48:45 +0200, Christos Gavros wrote:
> This variable specifies the maximum allowed size
> of the generated image in kilobytes.
> 
> 

Applied, thanks!

[1/1] ref-manual/variables.rst: document the IMAGE_ROOTFS_MAXSIZE variable
      commit: f3ddc92081363aa7ef7d4fc2c3b918f32f7bda05

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

