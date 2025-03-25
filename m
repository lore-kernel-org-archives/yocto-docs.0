Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3ABC36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:01:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.61514.1742893265516050020
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CBBBh6Do;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 711164436B;
	Tue, 25 Mar 2025 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742893263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1mNh7sukkenj5YrqeqfkKsuRt2GluiYGfBMTWlv+dA=;
	b=CBBBh6DotaBsdPccxNV6SOohMQBkeKs5Kk/UfCV2P6FQhLkzCUhR01ALcKdMz4q03/avHo
	d1V2JtN6TBG1ffLj5D53gOQxlhiPMxNxax8WPO/B+3aEfB8PweTtBm8MeRNkATB8LeusRz
	kvK4qgNnoO0p8N4k9J7RTmQZiIr2/WwBu6AjAhcapvPIUR4mWnyQRCgLy4B419iwCnGMc/
	/6S7l0Qds3QlKWGXQ2QhQxfdNezL62dcktdRpT4p1d7Y62lnpl6l/ywv36l+SJuwAgZFlD
	3lJZGtpGPIOoKjVBW4LY+AfGiDL5/gtrMrEz5Rpp5TGbC7UARr4/R1hbTiOwgA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v6] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Tue, 25 Mar 2025 10:00:18 +0100
Message-ID: <174289319827.1738162.7384102844759967122.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250317173501.965049-1-adrian.freihofer@siemens.com>
References: <20250317173501.965049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:01:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6609


On Mon, 17 Mar 2025 18:35:01 +0100, Adrian Freihofer wrote:
> Incorporate the lessons learned from a regression introduced with commit
>   OE-Core rev: 259bfa86f384206f0d0a96a5b84887186c5f689e
>                u-boot: kernel-fitimage: Fix dependency loop if
>                UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
> and fixed with commit
>   OE-Core rev: 0106e5efab99c8016836a2ab71e2327ce58a9a9d
>                u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
>                behavior
> into the documentation.
> 
> [...]

Applied, thanks!

[1/1] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
      commit: d34e1d4e3f229bcd6560fe7df544869b0cd9875f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

