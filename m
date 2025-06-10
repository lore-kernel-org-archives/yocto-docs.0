Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C671CC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:44:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.82274.1749545060105109914
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IfIR9hVf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 733C943253;
	Tue, 10 Jun 2025 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3f9HsZY9ruXq2m0s0ylx9SYkLmdhD5vaue+7ZYKIcQo=;
	b=IfIR9hVfYp3AXcsd3tcZn6BxIQpPXFoMsHCirLQbmZtNbE/IcgZLd/XGc8fW528rO9MMom
	uFHztYsRw707xDWKPuqFMcdSYMGRwc+tpu4keZ2gPjvyFVH3ptY2zzahhgifyiBn2+hfw1
	h6Ei/hwR6wd/JJnVpJ7ooRD4xT+3VfqGZS0olskcxmhAdC1jlIM+ARqGEoo1Qv54vHulXe
	0oVGt230QfshPH3FoSBtknUePvPGFHOx+tdgwT9HekIQ+NhWVoyCG90ceVZ/IdnfO1ie8s
	OhCRj9pALNOm29izq6A6Lvw8qYwVJLlv3lM1Ypaz3h2DHbZ1Hqp5mQ4KMktbeg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Carlos=20S=C3=A1nchez=20de=20La=20Lama?= <csanchezdll@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: clarify KCONFIG_MODE default behaviour
Date: Tue, 10 Jun 2025 10:43:48 +0200
Message-ID: <174954493840.20869.5933231385377609395.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250528181524.2797025-1-csanchezdll@gmail.com>
References: <20250528181524.2797025-1-csanchezdll@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegtshgrnhgthhgviigulhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7039


On Wed, 28 May 2025 20:15:24 +0200, Carlos Sánchez de La Lama wrote:
> KCONFIG_MODE defaults to 'allnoconfig' when not set, regardless of whether
> KBUILD_DEFCONFIG points to an in-tree or a meta-layer defconfig.
> 
> 

Applied, thanks!

[1/1] ref-manual: clarify KCONFIG_MODE default behaviour
      commit: f374b9c426f6c10710e011a4ad660231ee26efb8

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

