Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433C6CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:56:45 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.43817.1712249804441989132
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 09:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Bg7GYI4F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4230340007;
	Thu,  4 Apr 2024 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712249802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5uutSODtA2z25OEIdY4oNnSLkCOWZfr8647NqQtW6t4=;
	b=Bg7GYI4FGv6GiIJ350AGJ4BrWUXQPq9OWEdkkyZJlUcrh8STxBZ6ke5VBTsYaZDDJlmDM9
	XVqXRpd/hpWooBSyLfbOoNChZyrp9ilwqna0G8iQ31KtH3hiBEX0pWF4X6NWltEyO7j9rv
	Te5C/K+KOiQj52o2VZ/VRNyHngQW60/2N7UUPHFUYA7bHOkB0YF2SWtZCKSPegAKIzExB0
	rBxMsA8719+Unl3692EhMD69uDn7h0WhZpYxmnN/Ew8y6iwjhHoXpZWmwXY3HMgZID2l05
	FS7soYqlQYN3Bm9ssPTFy+tSaySr6yrwUccv3J/0nlxZSphgSaWo0JulwGwBYQ==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/5] Document changes in WIC and Go language
Date: Thu,  4 Apr 2024 18:56:15 +0200
Message-ID: <20240404165620.2248838-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Apr 2024 16:56:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5057

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Hello,

This series targets the enhancements in WIC Image Creator, as well as the
changes in Go language. The latter spread into multiple sections.

Best regards,

Joao Marcos Costa (5):
  release-notes: add changes to wic
  release-notes: add changes to Go language
  release-notes: add Go language upgrade
  migration: add Go language changes
  release-notes: add create_go.py to script changes

 .../migration-guides/migration-5.0.rst        |  4 ++++
 .../migration-guides/release-notes-5.0.rst    | 22 +++++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.43.0


