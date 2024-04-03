Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD57CCD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:37:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12716.1712155075341946356
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 07:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IDrOajYa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65DA31C0006;
	Wed,  3 Apr 2024 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712155073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QNR6KjydQ2I4lpS7vzWaiQiK93pLpQ1xbPGVpsWBt6I=;
	b=IDrOajYaruHipDzPAntFU0UI1HH7X+HfwlfSfUxzBIaVGareTBbhmOGnVi9NDxCC7cj83n
	KrVuerpFE5Ch3FZVvMoSCvIXviOrqJixk+kW6V9JPlbIWZ1lI2JWngGFYLZPphdL99qW6G
	DVPI4vZVaiB4kWPGhGiTqB3vjlBn8jTMn4UY0JB89SI6uTrpIByMfjxZTsaqkNjAT/5te6
	G2SdZXE+R3fE3BICcI1zwwOFJmHgN4LiOfh1aiuFSRQfwDvMdMErkw8m7g93MFqnLQG689
	URldPZTIY7E+TUqbwR3EyIhdEdyeZkiiicRptrxLH/evn9SoxjHn90GlPD3ACg==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/5] Update migration-guides and release-notes
Date: Wed,  3 Apr 2024 16:37:19 +0200
Message-ID: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Apr 2024 14:37:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5050

Hello,

I started inspecting the changes since Nanbield to come out with a bit of
documentation for the upcoming release. Here are my first writings, and I count
on doing some more, as WIC enhancements, testing and scripts' enhancements, Go
language, etc.

Best regards,

Joao Marcos Costa (5):
  migration-guides: list removed recipes
  migration-guides: leave Removed classes empty
  migration-guides: leave Deprecated variables empty
  migration-guides: list systemd changes
  release-notes: list systemd changes

 documentation/migration-guides/migration-5.0.rst  | 15 +++++++++++++--
 .../migration-guides/release-notes-5.0.rst        | 11 +++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.43.0


