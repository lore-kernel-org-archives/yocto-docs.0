Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696DBC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 09:38:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.15958.1738316319404426348
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 01:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FQVQCiJ7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C93BF4330F;
	Fri, 31 Jan 2025 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738316318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0npwH2Jsd4UQSd6II+XjC+kJ9NX9F96+RrqRMpRdc80=;
	b=FQVQCiJ7p1GrzkZTcTTAcdSoP21nNAybEcxVGjEwWCv/rVk04wCAQMfwuF/9LEpDysCwmT
	3i5kxFBTM1tDTXVLVLj0iLfYs8RTFqlOuUktKMrjBTnZGK2XcTHb7Yc4iP2+ZU0Qe+CZIX
	ljvOHrzL9/aQoaPV/JgoZE0hy4QfBcIF+crhyaKkxn2VzZVgtRW0C86URA1a53TMkfWoLN
	ZkOW858nCmo47/fBVIQZhFt2ArqdiQ5rnemnJjx8MmM5Q3c7+Ncv0sgK1YZNeBnYFidmTN
	AvP1juHPCakrB63xHBZub8s30ybHrymYtEFtzLkO3AoVGxfdM8SZAloe9o/Edw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] ref-manual: variables: fix spurious parenthesis
Date: Fri, 31 Jan 2025 10:38:21 +0100
Message-ID: <173831621369.33004.16022159019468586997.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0.dirty
In-Reply-To: <20250123-spurious-parenthesis-v1-1-8bfe09dbe895@cherry.de>
References: <20250123-spurious-parenthesis-v1-1-8bfe09dbe895@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepfhhoshhsodihohgtthhosedtlhgvihhlrdhnvghtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgto
 hhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 09:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6220


On Thu, 23 Jan 2025 15:33:24 +0100, Quentin Schulz wrote:
> There's no opening parenthesis, so let's remove the spurious closing
> parenthesis.
> 
> 

Applied, thanks!

[1/1] ref-manual: variables: fix spurious parenthesis
      commit: 6f0e150179db2a2a8e9ad879167e0d84137190dc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

