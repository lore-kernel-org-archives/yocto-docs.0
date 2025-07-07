Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD669C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:14:06 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.55331.1751876044722773935
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 01:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gTMzz8sQ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 880E1438CC;
	Mon,  7 Jul 2025 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751876042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qKaABAoc7KQsUqNuxwsyIirVjDYZ6WP+3fAX06R+AfQ=;
	b=gTMzz8sQgKYhTxXWxSv2w3SiPGhVwv+vyTufwNl41qQjcgaewGKJGTszv3Cz3I5dDp2gm6
	giXR6VA9EqYWDpeFEG9bwMJ2VW5/Kepr7B+byBBwmVFT4TmyLHiH35Wy/H9pshX+4VGl57
	56DaswchCSxYcbLaFOKePcS/eI1uafHohicyGJ+mILkWYwvepQuVGZmFIKh5d4t01j/YPt
	an8UJukAzze5ycyeL1+y77S+P9o6oJRp/lzHqTV3blzAcnfc8FYjjy8LGOSQM0MJQiQtki
	68y2C07fCDCyLyOuGFSXZGmFWAGaL5uIE+Q1IgdOUwqyX5rB1HH/QNrspfXi4w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Bo Sun <bo@mboxify.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] bsp-guide: fix README link for meta-intel layer
Date: Mon,  7 Jul 2025 10:13:35 +0200
Message-ID: <175187600749.33933.12486762728726418042.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701124143.1756426-1-bo@mboxify.com>
References: <20250701124143.1756426-1-bo@mboxify.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefuddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegsohesmhgsohigihhfhidrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Jul 2025 08:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7265


On Tue, 01 Jul 2025 20:41:42 +0800, Bo Sun wrote:
> Update the meta-intel BSP layer reference to point to README.md
> instead of README, reflecting the actual file name in the repository.
> 
> 

Applied, thanks!

[1/2] bsp-guide: fix README link for meta-intel layer
      commit: 32eb132ad69a0722e0075404f809bfe9df06adee
[2/2] bsp-guide: fix branch listing command
      commit: 46aa3bb398c50af0f29acd2c1a05ee232d0de5b9

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

