Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A97C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:01:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.61094.1742893266132368789
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fANohh1M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD3144364;
	Tue, 25 Mar 2025 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742893264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFVw3oQm5TgUl5GelNBotfsqaxKjKL0D/CTziIqy6es=;
	b=fANohh1M4gEleqI5a8ZJVo2mSm2KeNnWopX5nsjTYEW7RMAaZkJ3AT6PmoUUSxzdvf/z37
	72G8MT+o/Lj0qARkai9r9s7FbZLOgjvJVw8Y7oidRalPoXmf1eIIdH4du+Ya1kUnGku6TJ
	ZHDHgTQzCGJ6tXqqfvsXBvrbB8YiXywV1MW1lP9uzVnSbb63P7d1T6GqvPIISkX4TQf7nr
	JZE3CfeHqxy/LEvqWES+Cdww+RCKQWqsNp+tTy1AgpjWYyP/bxJg48loKGODkK932hLwxJ
	QStjKekMBlUv6GZSvajm1qk7IZl9WMLh88OU2TVYeDXE0keouj2w4A/1h4A2ug==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: remove qemu machine name list in runqemu invocation
Date: Tue, 25 Mar 2025 10:00:20 +0100
Message-ID: <174289319824.1738162.2927409649852605873.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250311123025.1915242-1-ross.burton@arm.com>
References: <20250311123025.1915242-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:01:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6611


On Tue, 11 Mar 2025 12:30:25 +0000, Ross Burton wrote:
> This list of "valid" qemu machine names is obsolete and incorrect, so
> just remove it as it serves no real purpose.

Applied, thanks!

[1/1] dev-manual: remove qemu machine name list in runqemu invocation
      commit: ee8839480fe574598b4d52a8fd6c11bb301ad3d9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

