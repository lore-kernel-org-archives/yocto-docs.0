Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C56EC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:25:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.24127.1707233102787402408
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DLIupyeI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C240D240012;
	Tue,  6 Feb 2024 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GheYXyjr1lTM4t9AqSQDw9oy/utRZtleraRk75oe5No=;
	b=DLIupyeIKEj2AHiH2bByryJkBOvW6A32x7F6CFM+ZUxYOUK4wI1jnJ0svd/dxeqGW4TQgF
	CA/RfcTEAQte1cRyTJXLqOWxLhR2QpTqjbiKgavh7Gg3CMZjBRJjuh1xgg1Rl/pyVAzvq4
	++EGCLSjfRPwmH3s3oUSwYGfIR6x6iSKoxas3MymsRrzrS3d8vJcIXwBe/UgAl6cOSL1D7
	sW+lrhvMux2rfQMhY856l9qpaT2DgdzbZgHYY+GV2/2pmRu0xavZT22wEm1mTDnk4mImt5
	+AQKDMQt71gspPpfZaTWX6r8rWvKaQXHH+gy5l/oEVcGBQDL7pHjcNPnPCvC6Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 0/3] documentation backports
Date: Tue,  6 Feb 2024 16:24:48 +0100
Message-Id: <20240206152451.76368-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:25:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4815

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Corresponding to applicable changes merged into "master"

Michael Opdenacker (1):
  release-notes-4.3: fix spacing

Simone Weiß (1):
  dev-manual: gen-tapdevs need iptables installed

baruch@tkos.co.il (1):
  contributor-guide: fix lore URL

 documentation/contributor-guide/submit-changes.rst   | 2 +-
 documentation/dev-manual/runtime-testing.rst         | 2 ++
 documentation/migration-guides/release-notes-4.3.rst | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1


