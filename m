Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BCCC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:12:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1466.1710349926693126610
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 10:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OEKSe7fY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B63251BF20B;
	Wed, 13 Mar 2024 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710349924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5+kgFXmBS9K78hoI+c4wVGF8sEmRAo7E1ojvCCZj9GE=;
	b=OEKSe7fY+IbfvNtp7WWN01yz0zKOnVrsXs2UHhPyx0sBi0Piag01j5oXl/A2iNKVmrkWw2
	WdLg4qWSNv1K+3lQX2xMNl4PveTrId/2VhvJJyDlc4OIGJcX8/SEYhM9FDR6AOwDV++8ER
	EjDZamnbE0PCqeWbXIXFOETEVvgw8/UDsOF308jhLMeN/aBupetSI9oSi5DXWblWyQkTwV
	iugXa8ezl/ToVfN/rIeWCB4MUiSitdycuxU6b5d/wwyWk+2mexhXsl7QLkC1ksI7DJ51dm
	NZ5hMXu33yt3ARe9uB96zWwazrsmU/EsWBh+w79PCVH9H5Ey7r9cXXf4lm40UA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/3] misc style and formatting fixes
Date: Wed, 13 Mar 2024 18:11:52 +0100
Message-Id: <20240313171155.64710-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 17:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4955

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Identified by running the new "make stylecheck"
and going through the source files with issues.

Michael Opdenacker (3):
  profile-manual: usage.rst: formatting fixes
  manuals: use "manual page(s)"
  profile-manual: usage.rst: fix reference to bug report

 documentation/profile-manual/usage.rst | 499 +++++++++++++------------
 documentation/ref-manual/classes.rst   |   2 +-
 documentation/ref-manual/variables.rst |   2 +-
 3 files changed, 253 insertions(+), 250 deletions(-)

-- 
2.34.1


