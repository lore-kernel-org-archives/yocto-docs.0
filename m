Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D798C83F07
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5735.1751359521486922438
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eLImPF/Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E485243227;
	Tue,  1 Jul 2025 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI/a4kYyVsIzIpfwKeW8kS4VCYYdRl8hrNTAiNo07qM=;
	b=eLImPF/QcT1EyzzzO1oXdmTnXh8LzEwwXoD+zfTCwp0zh4qHjWjpDVomZvM8h8xM+EpyC2
	BQuP4L5zjApw26ClpP3EPmU+dCKn5dLucHGNcowd2BV9TxdLiodXzKMp1aUVtcErjhxJIR
	T2FCvySCs4+gU26CcvkmL/T6eyja2RdKLFrRVeqTVigxXKAt9C/pcdvhXIRhGxSHMQOjfl
	pN6+D8n/HY1YthxgVvUcFWcmli6HBHXo75qfiNPuDmcbkGNOA562Fj8VaJcxq5h7qYpHqz
	ddnmYWi5NGOOJQ5SROP7b88VC06rLeR+QEEturPVP2IAojxEQVBSCUhtEq5aug==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: simplify recipe names to use "oe_git" links
Date: Tue,  1 Jul 2025 10:37:32 +0200
Message-ID: <175135901850.368044.16614187722751110064.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <5c8eda5e-5bcf-b5d2-9d12-73922ead8d14@crashcourse.ca>
References: <5c8eda5e-5bcf-b5d2-9d12-73922ead8d14@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7250


On Wed, 25 Jun 2025 05:23:56 -0400, Robert P. J. Day wrote:
> Shorten a small number of cumbersome recipe names by replacing them
> with :oe_git: markup to link to their repositories.
> 
> 

Applied, thanks!

[1/1] dev-manual: simplify recipe names to use "oe_git" links
      commit: bdcc97d4d605c3de9682b9cb055c253547397f13

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

