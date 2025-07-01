Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EAEC83F04
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5586.1751359519958401031
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DQeM0AWv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4A4431D7;
	Tue,  1 Jul 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c02rWHlKOSc5pdp5PmanBS19VIzgfsxzGAZZi80o65M=;
	b=DQeM0AWvmCz/LlLgKAb4EKMKxN8UbgeYKBHsVKEcikYjVzeZfw8jpF7XnTFR9cviILlxK2
	27clzACFe+MWPUKLl6hwFAr7b7e0PlOCc2Gh/IqzkMgECXmwupSqXM8W8kSSJxAl84Ha/2
	CwQmbvFZXMDnQRSdlGzbpaokeX11JpldEAAW+6A5CtIkH80lS4CWoklXDcMWGdBvv7A7ap
	gq18s2W0vWXPUS9xDgfijjP9MzXL5NfEnjubknkRlpa/J51ga6p/uu8yDLF+cQsZOjOEkl
	FYo7EzHv7jBVLPPtT5gZzIaYtHt29nfsbDdh2tmjyCEmMNAG9hYeiD1sBDGXIg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: fix rendering of ${PN}
Date: Tue,  1 Jul 2025 10:37:27 +0200
Message-ID: <175135901848.368044.1541944442636534689.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <27fe44b9-6e5f-9fed-9878-de50ffa72910@crashcourse.ca>
References: <27fe44b9-6e5f-9fed-9878-de50ffa72910@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7245


On Tue, 24 Jun 2025 04:41:06 -0400, Robert P. J. Day wrote:
> Current markup generates italic, not monospaced.
> 
> 

Applied, thanks!

[1/1] dev-manual: fix rendering of ${PN}
      commit: 859ba2ea1014c351a43a59c481c4498d79f30139

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

