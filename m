Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C633C83F03
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5584.1751359519313424544
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OSnWAj8R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEFA5431D9;
	Tue,  1 Jul 2025 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rQFYTZ9+DIhRhQL7KtX4JFVuFWBoFPjpF8SrslPAEs=;
	b=OSnWAj8RW61Mf0Xy2H/5D1uS8F5AZth92huHCeKPyRjbpqKZcOKyjvVRvgRp/hw2cVJIbc
	GO4GSLiiee4cJM1Y5/T4vsJbWI8XKgZYH6FCza8L1K9Ur8Czr//97W9PHw+ckIllQEV+lU
	eV1kIk+e60OYYdv2zuxQUYCK5osHH+8sdv51lK2xd0qqUDzc0kpiiDYHHg3+cA2+AXZDP6
	+VJnhYd20jjSN5xX/wlazvJDX9ecIQ0Q1DIsHaRV6gmTswxeAC37CLATPMl2yFasd42wOd
	BvvwBsCPNmoKGhEF6gJJqq8Az5vSAM3QxLc401AGqUXbnysspVNyUE188TIW4g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: correct misspelled reference to sstate-cache-management.py
Date: Tue,  1 Jul 2025 10:37:25 +0200
Message-ID: <175135901845.368044.10673206064090095192.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <bca142bb-16d5-d893-5d4b-a0538b38720c@crashcourse.ca>
References: <bca142bb-16d5-d893-5d4b-a0538b38720c@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7243


On Sun, 22 Jun 2025 10:34:41 -0400, Robert P. J. Day wrote:
> 


Applied, thanks!

[1/1] dev-manual: correct misspelled reference to sstate-cache-management.py
      commit: 3728eea352f8b326ff411aa0f20bfd433ccc7cfa

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

