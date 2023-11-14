Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B951C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:32:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.13904.1699972364638497687
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 06:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o7urwGql;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3DE14000F;
	Tue, 14 Nov 2023 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699972362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BchmmKBgiT8AiagvY/9Tj9jnOY/YD9syoloTXJmD4tY=;
	b=o7urwGqlnO4+sTI298LeoMt0TPMS6NB0o/cYzOfpe49GYe7xOCTyeLCW9UDKkH8gckkTRm
	tbzwRhMxxh1k5lfsTc/vkMc5qcgwIubS+NDjDtnMruXjoEJK4b78Z3PzOORgv9M35x+P9f
	kC5cjQm3dP6E5pQS0gMR53VNoBudVpopoVXEDubPNY/pxwVpfhlZrFnE/YmnDcbAHonNJI
	GEzYsVyWIQq/QFFPs7NTN0uTqigxbSv03z0FomCi6PPypXXmKcgTdO1rN64t2S4twEjmeB
	kuyTblfjRo+OnKYowsAAbXtfKfHfWXZjL63cez2Y4g+j5vjpmbl4n/rybUnD0Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 0/2] Nanbield backports
Date: Tue, 14 Nov 2023 15:32:36 +0100
Message-Id: <20231114143238.116960-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 14:32:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4617

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Lee Chee Yang (1):
  release-notes-4.3: add Repositories / Downloads section

Michael Halstead (1):
  docs: add support for nanbield (4.3) release

 .../migration-guides/release-notes-4.3.rst    | 60 +++++++++++++++++++
 documentation/poky.yaml.in                    | 12 ++--
 documentation/set_versions.py                 |  6 +-
 3 files changed, 70 insertions(+), 8 deletions(-)

-- 
2.34.1


