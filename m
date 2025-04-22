Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AE3C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 06:57:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.34191.1745305033110848900
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Apr 2025 23:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LTFFLr9T;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D58371FD44;
	Tue, 22 Apr 2025 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745305031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQhhT4C4H4Kj3AczZT3TMXcXOBEYzcZyzHOZaNjEpkE=;
	b=LTFFLr9TmAOTy65EyaQgMHq6j2CWMxzTlmN7DzrYZ6biEPy9pGgZtr4ApzDHia9L0/8IRe
	CJsSSk4K2r8l/EFHcCjVWYy3c9Qs6tLR6WCbkYEBILBHlTjMIm2QXryTgy2WDXV7cs1AY0
	FQC5juTKmIdXSgtER6n9+qKjziZUvodXjHAA1FSqlL8WfdBqnscsQRfRR0MHme9KwqYcMf
	MX6suC+tdjQu6uLmXmPcRGX+cFGT6Ow+W8URMlDeqkMdy7YB3idnI8ri7Vpow2ORtEsfFo
	Sk2zh03L2QgFHw+AiRhfDOqkM0W6aQ23cd1KLE7pOv88rFx++DEvMkOwwckiog==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Andrew Kreimer <algonell@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] manuals: remove repeated word
Date: Tue, 22 Apr 2025 08:56:17 +0200
Message-ID: <174530487325.730280.11149836487743952578.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408113128.12973-1-algonell@gmail.com>
References: <20250408113128.12973-1-algonell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghlghhonhgvlhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 06:57:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6766


On Tue, 08 Apr 2025 14:31:26 +0300, Andrew Kreimer wrote:
> The word "modern" appears twice, remove the extra one.

Applied, thanks!

[1/1] manuals: remove repeated word
      commit: 8a2169431551ea29bf45b2eb120a13f0e444e1ea

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

