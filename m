Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F96EC28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:20:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.37062.1741612854354929262
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 06:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=em5L4LxY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A88D020485;
	Mon, 10 Mar 2025 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741612852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H23zjKP/YqKj4Z/ewbpXlB5qrCDLvxAy3Ir1+8DhTSo=;
	b=em5L4LxYha18VRXLBwFPR9cbEsKdjuUUEHL8A+lbxhUEQl9IkVQrg+nEguUXESM+PMopRO
	4ohF+gwI0uGPMs8Az+ifn1leCApcvG2JadsAdtTAnWZjnt8cWYJruD83qNuD2Fvyh2alzZ
	MnYACrus8J8NQXSwjLgvP6yVjEA6sqJZSrW64s1Ewr8ahdOEGcHtJ+WW/4lbB2oqWyF7U1
	IbJnGmoM/t2Arr3pQcUCfnajlCEZLr3YnZM8YEuxMsZDxXWre76PIl+ge+AmdTvL67fNoc
	l1VH4WxyYDPGZYMcK68I1HsnIboCCDe5+nsUp3eklbtl85Xz775yB7l7PnzkIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 4.0.25
Date: Mon, 10 Mar 2025 14:20:01 +0100
Message-ID: <174161278500.647951.12215720672502361168.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250228045826.1904323-1-chee.yang.lee@intel.com>
References: <20250228045826.1904323-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptghhvggvrdihrghnghdrlhgvvgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 13:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6519


Applied, thanks!

[1/1] migration-guides: add release notes for 4.0.25
      commit: 4649514cdfae496f43711d6b830a0a835c3a1534

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

