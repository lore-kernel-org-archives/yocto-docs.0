Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EA0C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:22:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15169.1712330537221479843
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 08:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g4bJllae;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D646E0002;
	Fri,  5 Apr 2024 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712330535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6ZkhN/MYRuZE5/AG5ZjMnqYOs5Tyd63d+H4HCxeoDZU=;
	b=g4bJllaeom0MvEAqbr9YEYF0lCMsWEkqg13S92Y4lxispsX2LNEkcxjOuM/YyiYnqo/IHM
	iiDtxQrhRiGmNs3/+Bw1q3O0yBtNG+RV0DAvONNKfV6UTLDKPfAST4tR3PTKwawcu+TqHN
	UJ5ZePWyfNMbY59Fm6iHI29I5KdM6jdJ9vO6ZAHx9dLVyJ5rlOZxKeAC8P+bYB6ngQtoN8
	H52OYTiuOT+xksnW6CldJMlW73xhN9MWM8u1EQuz/3nalZkNJmP3gRrBuILyqatWO/n+gn
	wDWXLL29JmFRvI+iSZfzqUn4EoVq8u8kQ9tHGIJ/ANbkgOIQAv7Tq+Om18UFkQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/4] Add Miscellaneous changes and QEMU changes
Date: Fri,  5 Apr 2024 17:22:08 +0200
Message-ID: <20240405152211.2285650-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 15:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5083

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Hello,

The first patch, concerning the removed variables, should have been sent in the
first series, but I overlooked that. Regarding the others, they address the
remaining sections and, unless I'm mistaken, the migration doc is complete.

Best regards,

Changes in v2:
- Squashed commits fixing formatting issues
- Removed the 5/6 patch

Joao Marcos Costa (4):
  migration-guides: list removed variables
  migration: add QEMU changes
  migration: add Miscellaneous changes
  migration: add a second space after the items

 .../migration-guides/migration-5.0.rst        | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.43.0


