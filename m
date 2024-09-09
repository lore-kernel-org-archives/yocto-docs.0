Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B442CD4F4C
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 07:17:42 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.47275.1725866257702901057
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 00:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JalPaw9m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05E6240008;
	Mon,  9 Sep 2024 07:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725866255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vp5Fn1Pyo/UcA5VARqg8BOB4H227R5CfeFXJSwiUjyo=;
	b=JalPaw9msq4PfprU1hopRxjDyTLBT9VZQORnJUK/PiP7PaM2mz5DasjgKQFK7DF6bdmJWT
	BaxL1pP6y/1RDReKsc4x5IRn4cPG3F3DPhjMbGQ383R7imNjkTfBKyEYJjFVrKOpZByYui
	lv4aMAh2HLE4XhPG8/fkBrYBZWd+Sk8af88CbXVpMOksaQGOtMeJi9lX3hAcTU/CEFjYp+
	c3IztbDRjvd9iRcFKDwZN1efKXoXXfONSIZHb7EziELUynIbEM2joBiq+2MZcIVbOQbMMQ
	4OUTRRke0cKcg96gAIfoyRNwH/ZxM2+26zZ5+i2V720TBVyuzG45YWP6P7O8lw==
Date: Mon, 9 Sep 2024 09:17:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [scarthgap] Pull request
Message-ID: <202409090717358d0d8d44@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Sep 2024 07:17:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5354

The following changes since commit fd4654df2d9eb36cae872dca4d23341ed5f9be91:

  migration-guides: add release notes for 5.0.3 (2024-08-22 11:33:00 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/scarthgap-next

for you to fetch changes up to d71081dd14a9d75ace4d1c62472374f37b4a888d:

  doc/features: describe distribution feature pni-name (2024-09-03 10:36:35 +0200)

----------------------------------------------------------------
J�rg Sommer (2):
      doc/features: remove duplicate word in distribution feature ext2
      doc/features: describe distribution feature pni-name

 documentation/ref-manual/features.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

