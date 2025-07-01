Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F072C83039
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5730.1751359517219419758
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pxHQNpGc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7963C43217;
	Tue,  1 Jul 2025 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIfwiEMOjv7bxep9R+2/sUmHVK7FiEfRhDKkDoKDOo4=;
	b=pxHQNpGcqJj9zKAwqWQkbg7wD3gTqhxg+TySDuCeibTn74UgQqd/KHCL33+dI1lnAyTYNC
	ZBlGpCWXL5weK9QJIm0evT/TsFtLAsFRrOSScyxzSUjrnXgcXGb8SDLwFFh7Nz9sKFoxci
	OFTcjqVtWQSAhYel5zI01qWTVyBbnbh1XUVp5D2JHvdJ09P9wbDq/IjiAlv/sAsS9xzNGe
	VkRNu1QZbo3QUc9IsBXh7/b60U3JnUgA+2dE5A0+uAp7uWiJjInh618mE6t1BstRXZo0aF
	pB30bixKTveNmqW/PYePVFQL72KAOPfFMltKLs5hkEx3X7jfws+DjWVFzx6lzA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [PATCH 1/6] overview-manual: correct value of UNPACKDIR and put S under it
Date: Tue,  1 Jul 2025 10:37:19 +0200
Message-ID: <175135901845.368044.2696336633313152097.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623124257.1544615-1-alex.kanavin@gmail.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhin
 hdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7237


On Mon, 23 Jun 2025 14:42:52 +0200, Alexander Kanavin wrote:
> 


Applied, thanks!

[1/6] overview-manual: correct value of UNPACKDIR and put S under it
      commit: ec38f3c5a51887175a2cf3397c07c13c17ca2e9d
[2/6] ref-manual: drop a sentence about a 'legacy way' to specify UNPACKDIR
      commit: a880d94d70c7ed1da8e40a02dae43ff1699941a6
[3/6] dev-manual: replace WORKDIR with UNPACKDIR where appropriate
      commit: 25ea8e2a0428b6cb66402283e64144d5ce61daf6
[5/6] ref-manual: correct references to WORKDIR to account for recent do_unpack changes
      commit: 2e83260484c102fe7b788585cbdd7ca91ba91d85
[6/6] migration-guides/migration-5.1.rst: correct S/UNPACKDIR patterns for file-only recipes
      commit: e69144a2420cf412ff62a394583acc3f82413c69

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

