Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA1CC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:46:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.28801.1754495170423029136
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 08:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HSqwqk4L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C2F41F6BE;
	Wed,  6 Aug 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754495168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wsggL73U12JxaAL/erEll+qK95dohYCnEJz88ynwYj0=;
	b=HSqwqk4LGoLhM5rFYShaErP5iYotG8wnzHM9+IFqqIdrbtqqajSIR5b07dJcR1Zt/qA4K0
	JOBHkkNKBweMCQglu3sa2Iv1ZNm31DPYZthMdkpx/6bKBbc00CPczILrB2KO6LIk5f1vUX
	FMLs6oedrn3nPTbYx5bKBAk3vKBmkUxRUghwEQv3TfI3VV4bjRCfYiCphC+fY+HyBAOUca
	rH4b0O6LeXX9ZF5cP8LWJUkYQ2Su4MaW7ZqL/KI1qNAVCnwAp8VHRXwAkj7BCcOOYZZubU
	YK1RjKnbk6qCsmohawZSZicBak/n2I/Q6QWfKLKfwLYhZ18zozaPe2q5Vtpi0w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Update supported distributions
Date: Wed,  6 Aug 2025 17:04:44 +0200
Message-ID: <20250806154546.719832-1-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdehveehudevfedutefgtddugfevffejvedutdejudejgeevvdeigffhvdekgeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghlohepthgrhhhomhgrpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhni
 hhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Aug 2025 15:46:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7437

This series updates the supported distributions on each branch of the
documentation to match:

- What is listed in poky.conf in meta-poky (SANITY_TESTED_DISTROS)
- Which distros are currently EOL.
- Which distros were previously tested on the Autobuilder but are not tested
  anymore.

It used the yocto-supported-distros script in yocto-autobuilder-helper, after
the following updates:
https://lore.kernel.org/r/20250806-check-worker-statuses-v2-0-59dd990d22e7@bootlin.com

