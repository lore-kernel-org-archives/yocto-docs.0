Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D309C5B549
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45183.1748327704358898609
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I5L2cpUx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7025443B1;
	Tue, 27 May 2025 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xPXLgg5PAkKPTDHheMj+VuE8uAAJwPUUW2QuHFyu4w=;
	b=I5L2cpUxEVtdTUCPeTrY1MmLOC62slvUP4XcpzHAPncwGTN+wEJvoQbi+8JbwK1m/7oIXW
	PgcEO7vfTZzJb9dsFKVoCKwdRoXIYMuJdXkGzZK9V1kGWaA1yVVCaR+yheFLeZ2Gfuy/fJ
	O4FW9o9d4BTVCXW5wFIteD2ksmVevNRrylmq75XxSr3ZsNZMVjl18LtUFOIhK9nVB+Ofa9
	dCZO+pDMQMEU/pGnnHqSsb+XSspywamKSiIf719j0yFB6FFgnDIakdJVkDohHrCLVz2D0G
	xWeCUBHGBKuEvVIzaeg2Yi94bikRbkg4ld0bPNwIVi+1Jj9dzfg2OusK6SoDGw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] sphinx-lint: superfluous backtick in front of role
Date: Tue, 27 May 2025 08:33:54 +0200
Message-ID: <174832723404.222026.11818566241930508830.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250524014902.35467-1-twoerner@gmail.com>
References: <20250524014902.35467-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehtfihovghrnhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhom
 hgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6935


On Fri, 23 May 2025 21:49:01 -0400, Trevor Woerner wrote:
> Fix all instances of backtick-before-role as reported by 'make sphinx-lint'.
> 
> 

Applied, thanks!

[1/2] sphinx-lint: superfluous backtick in front of role
      commit: d38f9b25c0bd095fe1158f14226fb74f8645496a
[2/2] sphinx-lint: unbalanced inline literal markup
      commit: 3460177c46d360b0f2f852cdab23f21bd4ec6d5a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

