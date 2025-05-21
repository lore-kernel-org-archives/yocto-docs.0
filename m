Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8473BC54F2E
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3913.1747845902225639843
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S8s8cnH7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9778343A46;
	Wed, 21 May 2025 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZ7IR5bYBc1PPhTjcMmpwUp+j95qk+eaijytxVhVyog=;
	b=S8s8cnH7Q23HTbDwqiJygJOoLmDrqifOk2q1TpJ5YvpJacReybBad7ZQ+V+JslmC4KyQr5
	Tiz1Y809WRaEhnfpEFQi9rQ9U9xdd81asB2ReJIAb+Lrdi7iFJVtAD7tBR9l6Z11nCKUXm
	rSwKQT79u9lXZuu5arUtY+plV+vDy4t7mXxDxALMDmcILTVSkVK5b6ITDo7T/iWPaMOkcj
	DcoH8r8CQ797UXcGZ+gFLFklqC0vv5rvu9sQsjFf+KUirr4TDuxJDOCt9BK9SQJgXv05m1
	ES4wdR3xpBvjv9LVmK1x4F5DmvJzdHkOqfj7CAgqIchKHn5g5OPg4qWrBObpwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v4] ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS
Date: Wed, 21 May 2025 18:42:32 +0200
Message-ID: <174784571491.218104.3353211377766380875.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250513165839.31473-1-twoerner@gmail.com>
References: <20250513165839.31473-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthifohgvrhhnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6872


On Tue, 13 May 2025 12:58:38 -0400, Trevor Woerner wrote:
> Fixes [YOCTO #15509]
> 
> 

Applied, thanks!

[1/1] ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS
      commit: f1cdecb6da91dbfac59359c83038cb4a4c36ad0a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

