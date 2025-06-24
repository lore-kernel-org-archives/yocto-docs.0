Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76737C7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:36 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.2918.1750749814251397638
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=akz5FWrG;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14A6244A39;
	Tue, 24 Jun 2025 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjKY0BEYkMSCVUVPzA2UVzSFyErSPQNj76AhTwyD8G8=;
	b=akz5FWrGgeRLs2BG2ih22Law2JXlS6n7kgq3MHYlHPwVM2WHpjsmTGSCcDEpms+zncM4Ly
	dnI3DLUPryQ7oDdujQsAWbVHyYlEBPZvANdCLX37VWC15DhazEWoLVW5+Y0EseudMm1Br3
	B1SazWMjOETc8FzQwVFNqNlMY4sOF5KOhj47TVucWcNl2veiuDyL5EgC4O5oBgXYLdI8Rt
	Sa+xqu9rIU5EY3qEWEDrsolY6Pt1xSrkbLjrQgX00fypjZDboZ/yZCdpXECdCIUsddpG5e
	B0kRHPv1wU4TMXyf6DkoIU2RMLBnV2xVmKYrVZCcxAGu4Ka33f1m3Zma2Jl+vg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2 0/3] FIT image improvements documentation
Date: Tue, 24 Jun 2025 09:22:48 +0200
Message-ID: <175074974633.298373.6865985380474531685.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616204135.1388643-1-adrian.freihofer@siemens.com>
References: <20250616204135.1388643-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7174


On Mon, 16 Jun 2025 22:36:46 +0200, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Changes from v1 to v2:
> 
> * Findings from Antonin
>   * Add examples
>   * all suggested wording improvements
>   * link to bugzilla
>   * Enumeration with #.
> * Taking into account discussions related to meta-ti and meta-rockchip
> 
> [...]

Applied, thanks!

[1/3] ref-manual: replace kernel-fitimage by kernel-fit-image
      commit: 93c92dd2837708ba00a4ca47667e60d7bb09430b
[2/3] release-notes: drop references to kernel-fitimage
      commit: 3610cfd76d1491d9ecff9816ab36df8d1b2a83c6
[3/3] migration-5.3: replace kernel-fitimage by kernel-fit-image
      commit: 4c3552940a6ff89824845473317b7f5d741d4635

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

