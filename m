Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118BFC282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 09:32:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.49693.1740994328539578032
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 01:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eZmEm6/T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FF61432F4;
	Mon,  3 Mar 2025 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740994326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cxkqiq03cE1RchunDKYMRPMZk81lc8FvBc2BL3dHAz0=;
	b=eZmEm6/TbINdVbPJ/Bwws4Tz7olsx3aIwQwvH/wVVDl2/BS9KHNRZTyf6Z0WHbPn3TBtr9
	TyQbN4sAyAssiPh0bnlfugQYv5O+LKUxQL7bria2MQDpkM8bjvyWKvbkUJJo5OrfHE6+e/
	3y3OD3CED5HMMrFeoW/3CsuAqx7tHRBDicAxOrPoq02C1hRQE9lcT/r07joHDw7o/YrYlq
	JripprSY7tkaQb3Fs4CnqOWTqaIpVqlWQRyS/eqrgAne0YLHsFPcQFIEuDvhRRR8L6oFPr
	RUqgJ0kYwQ2lfL2pQOcTMQcjqp93ilvSju4UpjDVlQm58XcV4oHTmSaJbPL28Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v4] ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE
Date: Mon,  3 Mar 2025 10:31:30 +0100
Message-ID: <174099426451.179139.10819449851857283301.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250207095540.186588-1-pascal.weisser.ext@karlstorz.com>
References: <20250207095540.186588-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehprghstggrlhdrfigvihhsshgvrhdrvgigtheskhgrrhhlshhtohhriidrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiio
 hhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 09:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6471


On Fri, 07 Feb 2025 10:55:40 +0100, Weisser, Pascal wrote:
> This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZE
> to the reference manual.

Applied, thanks!

[1/1] ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE
      commit: 1dcc8cf7c49da449b324a7bd6bb22effe1d53d70

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

