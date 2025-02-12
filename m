Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5744FC021A1
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:11:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10919.1739351482300577060
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Oh2epDdL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14F9241D11;
	Wed, 12 Feb 2025 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739351480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+iYDpfrl4+eKn8y2T19b8iAm3fE0qVPXRwPVY/2rpM=;
	b=Oh2epDdLz5Amk4up9M9lM2aE7dt/UbN/1LJ51ibOHYBZL03rd5QV65DuFnj9QgFYsqsM4h
	06f3nOVjfJDzUhKLjLbXXr/UaDvD+G3Y3C+UKsSbDGdiZfj9+XtIGT9ue8tj7+VNB+b1w8
	snASZmgdZghkMDrrRZl8faVWsqT/mrP8qnXeNIQiNjojAwdekHfAs0KfzwEVEC7C+6C8Jr
	jUyFQpi1OlsYMWZxtAUJTAZGkeO0uJyyCgaYeDLDwbS7yLARy3UXy00Gvtn2eLurD3HqgW
	fHdXEe+SwSJH4qctWj88pWAulEmfjqyDFPSArgU4vNkhB3RXsEdqxV7SNSItvA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] migration-guides: add release notes for 5.1.2
Date: Wed, 12 Feb 2025 10:09:14 +0100
Message-ID: <173935134323.2046854.14311039607930499329.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250207065359.3067423-1-chee.yang.lee@intel.com>
References: <20250207065359.3067423-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegthhgvvgdrhigrnhhgrdhlvggvsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 09:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6352

Applied, thanks!

[1/1] migration-guides: add release notes for 5.1.2
      commit: ba80f0cdeea9e2e3bbfecfeae8c3be9a2cb36297

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

