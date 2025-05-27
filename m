Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012D2C5B54E
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45182.1748327703989651194
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B37fPH9W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C94F443A0;
	Tue, 27 May 2025 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHzrnS0vf9dfDpFSJAFO7zGj0Wv49VznqvzNFDbHzZc=;
	b=B37fPH9WB3UhAy1MDoAOkGFFTOI6B0OB5KbVfo/17iharbbiNMKJoxLrgL7qDD33gwJ6tE
	lDuvInyYEwrPQfj9/qtqUgt9LEaVCngSGoerowFrD573BLSxUfvYAgv8zkTZ9PjmDCH6KH
	MkkPzmeMEcGis1VR+feU7KOFrE7+2OsqwEPtMOuV9JK4+3RRG2PdoWjcn2dbC0HIksnP0H
	UhW83Ddn4F1moS/GU52x1zHB5Ua+PMkyYpWFCz4W+IOveod8EtVKiX8WNOYj7A5QYLUrF8
	FtzV0za+ogVpNs0y9GBOYwFMY0+XpISJKl0+nB2KtrmPPFbOokR0srUW8CaenQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	troy_lee@aspeedtech.com
Subject: Re: [PATCH v3] ref-manual: uboot-sign: Support firmware property in FIT config
Date: Tue, 27 May 2025 08:33:53 +0200
Message-ID: <174832723408.222026.11131080925666618678.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250526072601.1766915-1-jamin_lin@aspeedtech.com>
References: <20250526072601.1766915-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtt
 hhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6934


On Mon, 26 May 2025 15:26:01 +0800, Jamin Lin wrote:
> Add documentation for the UBOOT_FIT_CONF_FIRMWARE variable, which allows
> users to specify an image to be assigned to the "firmware" property of
> the FIT configuration node. This explicitly defines the primary image
> to boot, instead of relying on the first entry in the "loadables" list.
> 
> 

Applied, thanks!

[1/1] ref-manual: uboot-sign: Support firmware property in FIT config
      commit: f72fc69e2d2a074d5eaf1cc36b30726de58e3ab5

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

