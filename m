Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24ACCD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13740.1712327704975670713
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hj1HkJrt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EF1BC0008;
	Fri,  5 Apr 2024 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CuyJg4rOoxRCu7o5BEH/5CWb4pwVkbwuOZ9dvFKDGGY=;
	b=Hj1HkJrt6QbSZTEvVzUoRKTcTTRqeUH4yRfU99UbErvpowlPci90Gom7hevplB9fGToqYT
	piOojMYlFOQUp/qtQ+Qo/YPNZnIhmNcK1MOM3ersGaIiWkVu5g5OzGaBsqk7WraYN2jKg3
	pdEGSrpGtWkaMVkE7Yhi9PASJxFBZH0PcyEd9ysBgEBCz/HBK8lyR1erkxwgSO+jKn1Q54
	3VszqUNC3FhLghTN2721Yk3nV8bwAFruZJr3YD2D99y92VZ2DRuIgEzy6EXBvBw5tRA3c/
	x3mpDH9SUBE9w/wxIFTYtAYo4H0nJZL9VF5AyFmgCCPmKR0jsIVCFnyljccvjA==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/6] Add Miscellaneous changes and QEMU changes
Date: Fri,  5 Apr 2024 16:34:47 +0200
Message-ID: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5075

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Hello,

The first patch, concerning the removed variables, should have been sent in the
first series, but I overlooked that. Regarding the others, they address the
remaining sections and, unless I'm mistaken, the migration doc is complete.

Best regards,

Joao Marcos Costa (6):
  migration-guides: list removed variables
  migration: add QEMU changes
  migration: add Miscellaneous changes
  migration: end sentences with a dot
  migration: add a second space after the items
  migration: replace dashes by colons

 .../migration-guides/migration-5.0.rst        | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.43.0


