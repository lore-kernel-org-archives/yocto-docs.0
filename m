Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D103C5AD49
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 06:35:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.45185.1748327704914942544
 for <docs@lists.yoctoproject.org>;
 Mon, 26 May 2025 23:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dOIJg0Cl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AB23443B9;
	Tue, 27 May 2025 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjZq+p17ghR9TA6Ndpn5gCGGq3twrzS9Qb8QKGTwHbA=;
	b=dOIJg0ClbeG5YUaTIY7CanVRAPF3yUxEJyElfprr0qWECgDFTLOdcX3Vpjm/GrDow++T7R
	hIVz4YnjlFujVpPmBCf3tX17CjE6P5fpgtZC8fwxrGHQXz9b9j5E39ZjremVKXUMoQNwbZ
	HDE79aXBhfX4DElGv2GbjNvK0MG2SdoXdlwDSwk0+Tbp2SauQFyHd9FkYS8HILWCSdwo9O
	9zFhwZwG0Enyptda5Wb59ycMFw0ePSn/H3PoRuftLOwqzCAWeKHyhMewFoiQFYDbXC0oKM
	3JMbV1YwNdu74LHJp6VK9vAhTGcYT88TdvAfnnqB66XH8r3QKxbz8CdNzvEaBQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH][scarthgap 1/3] sphinx-lint: trailing whitespace
Date: Tue, 27 May 2025 08:33:56 +0200
Message-ID: <174832723403.222026.9230949120082629201.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250524011032.19679-1-twoerner@gmail.com>
References: <20250524011032.19679-1-twoerner@gmail.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6937


On Fri, 23 May 2025 21:10:30 -0400, Trevor Woerner wrote:
> Fix all instances of trailing-whitespace as reported by 'make sphinx-lint'.
> 
> 

Applied, thanks!

[1/3] sphinx-lint: trailing whitespace
      commit: d754df8f2084ad45305cfd9c1cf35da727240aa4
[2/3] sphinx-lint: missing space after literal
      commit: b562ea5563adc744703b10e0c9a530ed7476d51a
[3/3] sphinx-lint: unbalanced inline literal markup
      commit: 0ba5429953dfa0cdc983ed13ddd06351116031c7

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

