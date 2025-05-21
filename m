Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C11C54F47
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.3846.1747845901834124138
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l678cbyK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B3CE43A42;
	Wed, 21 May 2025 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bk2KfH2wqLlp/hw8O6RGl8iNXyy6NI5lJunsh2/ZX8Q=;
	b=l678cbyKTJ08m1BbdSFUb5nYGwR569+aEAHLAn2cw2YgNPLQj0aQaaU3IqVjQxdwd9uHOQ
	XvNNgue6zwUJ2njLzL/ZPK8/qS9nBxh7bFfJYeM6SQRqTQ4E7Iq5iVwBZc7rxUZn8IvkOY
	bPrVGvYMygp4OY0GLWDyRiKd1RvgdGiPYm+eYgsCPli4rlzEuf1SYPBCloveqrUmLt5scw
	bGGKh4BaB5uPp9/myFquznBkeSGHWJU+i4yHHtf5tvcGmXEFUrHPMG36v14r3i1BXfjVD8
	W2eLUX7pv0oJJEv+T9Qx/tMYYCFS/pu/OV9v6GOYYhb74CzIF++n6ND5rmwF8w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] contributor-guide/submit-changes: encourage patch version changelogs
Date: Wed, 21 May 2025 18:42:31 +0200
Message-ID: <174784571490.218104.17681974311682128383.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250502172143.31713-1-twoerner@gmail.com>
References: <20250502172143.31713-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6871


On Fri, 02 May 2025 13:21:43 -0400, Trevor Woerner wrote:
> Add a section after the 'git format-patch' information encouraging developers
> to add patch version changelogs to their patch updates.
> 
> 

Applied, thanks!

[1/1] contributor-guide/submit-changes: encourage patch version changelogs
      commit: 2e3a37c4607b296956993e557d1786c4876e5722

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

