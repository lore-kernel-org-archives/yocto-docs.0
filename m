Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F68C021A4
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:11:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10893.1739351482396425937
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lfDlqZ/9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC0614427C;
	Wed, 12 Feb 2025 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739351481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgxnhp0EdAc+uCBMSZJnGem/JGrRpDFCIefqvmPzw5g=;
	b=lfDlqZ/9H5cIBC7uofoDwJRpFx6L38MLjyqmkfGMVZsY2xWWO2FN7X7skejB7wRnVOPQGT
	/gA4EVTRR0WiV3yTuMwiZRXSDSBAtj7Bmk1ublKe6btV4r/V+C8Q/kKmnUg9rch+DuMeeE
	b4/wp+VwWVqLabuM3eYv8Hgh1IEjeWLxvZlu359fpeN8t0Ls7FvzJpQBZpvfrVenDWnigu
	Fn3CjAqmWTpJASUsd7Far3nQFjT8yxOOoi0tlw6VdpVCVPshxY4T8otqO1kZdndPzVZVA3
	BfCYUA1i1fADkUpT5/HWVTEYuIr/j/YxzYRATawYanT2OTVqWCy/V5EIVXB/fQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Simon A. Eugster" <simon.eu@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	quentin.schulz@cherry.de
Subject: Re: [PATCH v4] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
Date: Wed, 12 Feb 2025 10:09:16 +0100
Message-ID: <173935134326.2046854.6345120417266299453.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250131121705.88535-1-simon.eu@gmail.com>
References: <20250131121705.88535-1-simon.eu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehsihhmohhnrdgvuhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 09:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6353


On Fri, 31 Jan 2025 13:17:05 +0100, Simon A. Eugster wrote:
> This patch describes how to use overrides for grub-efi-cfg because that
> is otherwise only clear after reading the .bbclass file. It also adds
> a description for GRUB_TITLE.

Applied, thanks!

[1/1] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
      commit: b9ec7d124c9cbaf6c05415277fa028a39ce9e02f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

