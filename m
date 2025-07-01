Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D871CC83F01
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5583.1751359519074510022
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EwS6QlZY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5219F4321C;
	Tue,  1 Jul 2025 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=172KxceTgpq5AYdi+TkjjeGhtPUzgpVyzcdpt1UjyA8=;
	b=EwS6QlZYNjAYuGWzu6IFVMwWfWxYYOik9wBuiFuTx0wCxFfdKkmbLbUoKe7j5oV+yaN9V1
	J6yg7uB0vqF4esySAJNvxe5Wtlj5j3fOQBjoQFRb/7KiP5lR8E6lqM9bxiNewuyjUraS57
	kHxdVEGh06pGM5vYjApN+sKlu9Z7+ObSYnHjNOVhbJIBVYP1pP/yPpnH8y1d2nkCQRjrhz
	9YYhwiaSAW6aVBfmnBW1e0gxRYlQ5fw2ya3R989yPyhznSMwh5fDewZ2ljapk7yIGytVCO
	Hd1h+QPHBwYfEu3DxpGj3K7V9sRZAMTI7HGWSCWVkOoQ/o368neqqitBfg7Xcw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: CH 2, small number of clarifications
Date: Tue,  1 Jul 2025 10:37:24 +0200
Message-ID: <175135901846.368044.14056354687534733823.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <bf003426-3d6b-c35b-769e-a09af45b05e1@crashcourse.ca>
References: <bf003426-3d6b-c35b-769e-a09af45b05e1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7242


On Fri, 20 Jun 2025 06:28:46 -0400, Robert P. J. Day wrote:
>   - drop reference to "opkg", just refer in general to packagers
>   - correct what "QEMU" stands for (missing space)
>   - correct version conditional
>   - add a couple extra steps to typical workflow
>   - drop implication that one can modify local poky checkout
> 
> 
> [...]

Applied, thanks!

[1/1] dev-manual: CH 2, small number of clarifications
      commit: 4fea81e42c41fc42548dd9e2b42f836daba5ac6b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

