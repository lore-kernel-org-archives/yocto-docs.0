Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E1CC5AD49
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45184.1748327704670672677
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AEa8VUde;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DFF3443BA;
	Tue, 27 May 2025 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skSnJud936jEcSdDzcrQyM+yOFvZW10xNFCbmAtHIIg=;
	b=AEa8VUde3qCfUvbglCWQXvIkC4T2apqxDK6dOQALT+qAnokKh+XlSUdOYQLOGxYqm8hRc2
	buZyrYqvy2Dmo+qpgEJmZOZr5zweKglxqq+T2VTkKQa1R05IRNMFeNrnUSm9lJUR74sjnM
	J93TqBFx4pk0Sg438BZbjPzo617pvlbFX9u7rx5jNYjfPr/Mj4fB9c+k1nhDSv4j8db2jk
	3pkD6/mGu8PojSfv7lFoR94Bll2LtlHu1UYECAZ8sGt66pEa3znZLML0qN+wZjhHPP6cFP
	oodyQ3Vz3GdYw9QW5beVVAGnAORmOPi0CRx8HjoyFPV3sftau6Z7jtpCcsBW6Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH][kirkstone 1/3] sphinx-lint: trailing whitespace
Date: Tue, 27 May 2025 08:33:55 +0200
Message-ID: <174832723404.222026.12450802462048638226.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250524200630.4299-1-twoerner@gmail.com>
References: <20250524200630.4299-1-twoerner@gmail.com>
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
 <docs@lists.yoctoproject.org>; Tue, 27 May 2025 06:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6936


On Sat, 24 May 2025 16:06:28 -0400, Trevor Woerner wrote:
> Fix all instances of trailing-whitespace as reported by 'make sphinx-lint'.
> 
> 

Applied, thanks!

[1/3] sphinx-lint: trailing whitespace
      commit: 7776550a190060221a8cc913e470edf5349b6829
[2/3] sphinx-lint: role missing opening tag colon
      commit: 255bfc8c195bbc84a78a4985cf2775c87e525794
[3/3] sphinx-lint: unbalanced inline literal markup
      commit: 2c1e5b080ad5e62d8283d332cbc473fd2d59c6e6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

