Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1166EC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45176.1748327701702243904
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lxwLZHf7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72B73443A0;
	Tue, 27 May 2025 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+J1lpZ78N/3gYiM6SCPcK404EXr9dP+Ndvp6LpYTWJo=;
	b=lxwLZHf7Pa5hhKB9ZgqggQp4adqCGlwsi0MfHjiUJBFF5bg6qO/5aNTL6MJOn23+VZ4nrv
	yAqshLAJJA6hgi89d9lOrtWVyD2WyGVAIuKTbjMn49R15hmRyh9TPIG85pgVR1mnfa0nJl
	odWJAEtgT53MUwTkTVrgqOEpVRpQThrFxbsNqHqXHIxN0zD+Gz5/bilOh/yweOOx3i3mHn
	xaxm9F00RRQ7g7b3rfnv4JcpYOgt+TNsbSb8Wjp6AHOH8Gby7eySFtk4IH2sAES2mLNR5j
	c90JeTcDbQzP10YT2/BAEwhDdpjPxic0vTxJnZx+Kv5XPPDY/hH5hrCmvEqcIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Alper Ak <alperyasinak1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS
Date: Tue, 27 May 2025 08:33:47 +0200
Message-ID: <174832723402.222026.41464221413738680.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250522180903.109356-1-alperyasinak1@gmail.com>
References: <20250522180903.109356-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrlhhpvghrhigrshhinhgrkhdusehgmhgrihhlrdgtohhmpdhrtghpthhto
 hepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6928


On Thu, 22 May 2025 21:09:03 +0300, Alper Ak wrote:
> Fix [YOCTO #15753]
> 
> 

Applied, thanks!

[1/1] ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS
      commit: 5f5a406d4acdfcbf655ac014d0d2807056f95291

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

