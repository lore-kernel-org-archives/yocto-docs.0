Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D851DC8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5588.1751359521068536571
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iU4XUNla;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96983438F0;
	Tue,  1 Jul 2025 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lntkSiHOoSJZCtqR2wIT02v5qdxnJDXlV+6Vscb3bAk=;
	b=iU4XUNlakNdllLyWYmaR388B/CSJgUTA40Oc4tm4yv3hc6QJ6mw9e8yy4NCcoQXG6UZzUk
	KHiCa8/OuCAZw/SiU7fN0wpNjmuCrhbebnqCVegCQlBpFGCNKHIRt/ades4DwPD1Hjvr8H
	QBuKbHGaF14uO/nfdIK5GqKv3Rr2RPWHAhp3ku0jwvUJvMkWuMMwtGWG6dDexiskiIKcho
	Wy8PyVxGNePDNNg1mKTapFdADb372B00NxoFQoEpQng5uhAIYYp0l3VseI+l8xEbhak/YV
	XBuSGuPUXfAwBQhPzchpjaaTlQEZAV91t4vxttuSSOIpuBkFvYjW+TsH79d5dg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: show bin_package example wireless-regdb recipe
Date: Tue,  1 Jul 2025 10:37:31 +0200
Message-ID: <175135901847.368044.13979759547884632500.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <0639bb4b-2e1c-2dde-098d-ac99d62bb646@crashcourse.ca>
References: <0639bb4b-2e1c-2dde-098d-ac99d62bb646@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7249


On Mon, 23 Jun 2025 13:40:54 -0400, Robert P. J. Day wrote:
> Add a snippet from the wireless-regdb recipe to demonstrate a simple
> example of a bin_package recipe.
> 
> 

Applied, thanks!

[1/1] dev-manual: show bin_package example wireless-regdb recipe
      commit: cbe3e272965cb706a73de36af01e1e0c65ea4efa

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

