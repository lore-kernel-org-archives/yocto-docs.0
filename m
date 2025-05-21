Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B68FC54F32
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3907.1747845899754995387
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CL3W464h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D38143A10;
	Wed, 21 May 2025 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqPJ1tVQHdtIFWydEhNFOioZUde6UptcVyK3W0ip1AU=;
	b=CL3W464hVPpz/Mh00f06yMSG0Emk3FQ2F5eaZHOTbNLSe7Fi25cNHWUZJlOIkIynN7pt+k
	buV9P/5Q1WpmHpaIlnpOXYPlq9IP06SZSt+aEc5OBMNokgdyjQ6ZmY0gnNbdorewLHXd03
	YTxIVXHvi6buG7Htxt/TAFIbgrXWsV7jSd6Y1C1UTr+n3aRtnPrVDSWdLLQMt7gzbaVxug
	5zuyPG+m8P32/GB8ppcwBz9Pr42v+yIuVrVTCAwSBaE4Cv7QUWJVKB4/fWH1JPslKTLCRa
	MC2tbSaFg+LqhKUlgeUcHh7hsgJFOrCL3KTY7MSe2OVN6MzmlDv3j8RYNtAubw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.0.9
Date: Wed, 21 May 2025 18:42:25 +0200
Message-ID: <174784571489.218104.8926925565137139379.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250502072444.3764883-1-chee.yang.lee@intel.com>
References: <20250502072444.3764883-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptghhvggvrdihrghnghdrlhgvvgesihhnthgvlhdrtghomhdprhgtphhtthhopehth
 hhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6865


Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.9
      commit: 0d070439259d72f66a71c148f6c7926f6f233b6d

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

