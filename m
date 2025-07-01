Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D99C83F09
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5581.1751359518321779519
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Cq7n/Gud;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A57B04321F;
	Tue,  1 Jul 2025 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAGGgVmHcGFVhIjyTPx9vxWnYg51eu8skOwiYfYkuXQ=;
	b=Cq7n/GudopAA0DOMX8VbsOEU1PAx/ajzTRIL6w93WMAMJaQrH4zjzD0heB1zO+WCxkvr/F
	PDDFlS+x0Sy1MNOoeM/AOSsxqY4+f25cSWUdHp1J/j5mbWqNTSHh4A6yNyRshDvYHZSa6O
	9xFBE+Yz60+n5ZBhIi527mnLiP8f2rvmuUUWcHVBSaDAewBvE4muVdNGN0r/jz1EooA0q4
	YIFyc6AKMQxlDH81WyXMkXOh7brhwGiofrqoKQEyTl24m/ZU6i+xRWDfxardpBDpHYPYNn
	rVEweTzQHuGYfkKQLrKOoTy3QtKZB4jwPE2RDTfXEVAWvRAFOBguLgLgHATD4g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Dixit Parmar <dixitparmar19@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Tue,  1 Jul 2025 10:37:22 +0200
Message-ID: <175135901842.368044.4596685673859221394.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250608104459.1888510-1-dixitparmar19@gmail.com>
References: <20250608104459.1888510-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeguihigihhtphgrrhhmrghrudelsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7240


On Sun, 08 Jun 2025 16:14:54 +0530, Dixit Parmar wrote:
> This variable controls the kernel module spliting.
> 
> 

Applied, thanks!

[1/1] ref-manual: document KERNEL_SPLIT_MODULES variable
      commit: 198179d9c6231b5934d4fb6ede716d1dcb1442bb

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

