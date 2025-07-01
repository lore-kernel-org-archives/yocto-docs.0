Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993A0C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5587.1751359520974415530
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kf0xKd3Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F15043220;
	Tue,  1 Jul 2025 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO7Wo/WMc/806XvsNuRoAJdlXbuxMU9/spJ/SoPX4Fg=;
	b=kf0xKd3Zs0zjSnjm2JwiTxjodD1HL76VBGJgxWcRWfd7XqRIlOF+EmVKoTV8+ofY+K95ji
	4CPAPew8IQURSrJI7UJkS8Bq0K2iKbp25Dx7ekDSOz01J1yLTFlFd3w7Q8ztpqjvpoOBpW
	C0EeMgtZqW+rNrAnFGbxID7a9r27r9DlikVG6nFOyqJ6MH1Zdc0M4mFs3Jz1OhXzh8HNIP
	jttarKiCMd1Pcqyjepa8R6U8vYo+Ct77gr29vYIAS7YTV/aC+GezmDXCv8o80h3dMr2zQg
	Ey+91l5Y5Z45XWRwIqldDb9n6CGNRES9HarmerkrMc/gz2BqWoy64wvgcj5/YA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: shorten bitbake.conf snippet related to static libs
Date: Tue,  1 Jul 2025 10:37:30 +0200
Message-ID: <175135901846.368044.1172248333164515842.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <477dfe1c-8042-4038-f154-6b7459435283@crashcourse.ca>
References: <477dfe1c-8042-4038-f154-6b7459435283@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7248


On Sun, 22 Jun 2025 05:38:40 -0400, Robert P. J. Day wrote:
> Much of the reproduced bitbake.conf has nothing to do with showing how
> the ${PN}-staticdev is defined, so delete most of it.
> 
> 

Applied, thanks!

[1/1] dev-manual: shorten bitbake.conf snippet related to static libs
      commit: e235ae40db8f4e7088b2e99e678cdf31b5e216c8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

