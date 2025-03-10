Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF92C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:20:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.37480.1741612855437225468
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 06:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f34HK0+X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B198F20489;
	Mon, 10 Mar 2025 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741612853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/t2eqDkPdGI/PUDRqMH4HpyyAgQy+JlIy8HuCsWXD8w=;
	b=f34HK0+XniJpAcv7DCzNOSZLg1OBUjDFiytImw2OutsNo6lsyPy07jQDeM236Rh204Xt+/
	BgePLL9wpcrnDRAkXUMc7TzCH99C/6bKFSYYkON6UN07HvXInyuSD3CiPB1+LJg/bnbw34
	951YJ0nWFmsXET+zPARPtqVDcHGDoZjd27wg/vux52kRJqGGUxOU/SCOy/J1M6yK6smzt1
	LvYXEvChdFwoiIIGix0FrexeJWSOHjKI/crzqKcwUFxX0BrLVC9ctviz/vR4kJzVLkL3Jc
	jyLTUZ1zBxaZjE373CdwasZ2g9B5VdSGcUgNwf/WN+nej3NKOgJ/iPIeXiVqkw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2 1/2] Remove all mention of core-image-lsb
Date: Mon, 10 Mar 2025 14:20:04 +0100
Message-ID: <174161278502.647951.14902338156459681428.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250303172022.775243-1-ross.burton@arm.com>
References: <20250303172022.775243-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 13:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6522


On Mon, 03 Mar 2025 17:20:21 +0000, Ross Burton wrote:
> core-image-lsb was removed in 2019[1], so remove all of the  incredibly
> obsolete references in the documentation.
> 
> [1] oe-core fb064356af615d67d85b65942103bf943d84d290
> 
> 

Applied, thanks!

[1/2] Remove all mention of core-image-lsb
      commit: 062445a49919eff117b5478c1fb18d125c1f895c
[2/2] ref-manual: don't refer to poky-lsb
      commit: 7f7f6570befdda280c174a5f9776b20f53f3ea0d

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

