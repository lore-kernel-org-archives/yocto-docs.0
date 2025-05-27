Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135EBC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.45320.1748327702163250011
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iXB22bso;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FC40443B9;
	Tue, 27 May 2025 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSoVpaBzIkCUkpjcB+jb/yaqXKkmBZIZXFq7lOAjU8c=;
	b=iXB22bso4VUZaqSwMYnyNluGyekSCIXTyCSkblzWSU0CPuNLpLroZy5utgEzzDnRYbLIoS
	4eSg4zTpl3+nIiQul6GX4NuNFty7MElsCfkZGaISQxxbTsVUL1VFy7fF4kae79k6URwfQG
	CHP/nYex+d1JhHKjEfPtlGuvrbRWttB9vcAetZ+B3T4RMk/YF9WV57Jr2hJGOAGnAs/BZz
	fkN3ugEsagfDwgk2HsBUY5T1H34IlVl3QPsiy1Jive1g/DyBRHLQccZFKjqZOSa1apbYuO
	aX0eOe03COPbqW0RhzVUsc94SCVSgMtP3ubEEGE1x2p2BomJZcv5KZHW5OGvcg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	yocto@pengutronix.de
Subject: Re: [PATCH v2] conf.py: tweak SearchEnglish to be hyphen-friendly
Date: Tue, 27 May 2025 08:33:50 +0200
Message-ID: <174832723400.222026.10568324371758606417.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250520094514.2672646-1-ejo@pengutronix.de>
References: <20250520094514.2672646-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegvjhhosehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehthhhom
 hgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihohgtthhosehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6930


On Tue, 20 May 2025 11:45:14 +0200, Enrico Jörns wrote:
> This modifies the default indexer split() and js splitQuery()
> methods to support searching for words with hyphens.
> 
> While this might not be an ideal, rock solid, and fully future-proof
> solution, it allows at least to search for strings inlcuding hyphens,
> such as 'bitbake-layers', 'send-error-report', or 'oe-core'.
> 
> [...]

Applied, thanks!

[1/1] conf.py: tweak SearchEnglish to be hyphen-friendly
      commit: d4a98ee19e0cbd6be96923dc72faee143a6b294b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

