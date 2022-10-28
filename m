Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3199FA3744
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 10:19:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.4513.1666952384070135051
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 03:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pnT0pnxf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 23924C0004;
	Fri, 28 Oct 2022 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666952382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5jc7JYKhTj4yM1kycgYDaMzRMRv5q9q1z2rbTzxy4+M=;
	b=pnT0pnxfrJDcr5lWJMmCIG/MjSXTMf6mqCW3KRx6lQX7p5Q/V43hCTMzseO+HcgR/HxBNp
	4ZB22uopOXqm48gf9rMcRj89t9mj7f+fmODwvmP34Nu8TQHeF6CPcNMdX4AcP1AqDZ6U19
	LWVkkEUwSmTylNDSGkdDMEDUZSXZknIa/O4medhGOWCJHU7oTv4M7LYrJh4nHk9jHS6EPH
	bGE2juwhVqAQhnteYhupz3tNitpFxRmpeUPIRlVHByFcrKnpl+nIUAahakdY6NQIuKTpr7
	QAkyxzICS9AY4h3jvOikSR/rAa00C8B3StDpnyA/82O9gXEJxdrgg36WPlKSnw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/5] manuals: add documentation about SBOM/SPDX generation
Date: Fri, 28 Oct 2022 12:19:34 +0200
Message-Id: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 10:19:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3431

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Even though the create-spdx class has been available
for several versions, it wasn't documented at all
until very recently.

This is a first version, which could be expanded
thanks to your feedback or later.

In particular, I'd be interested in references
to outside SPDX tools to consume (in particular
browsing or analysing) the SPDX we generate.

I wouldn't be surprised if there are inaccuracies,
so thank you in advance for your reviews!

Michael Opdenacker (5):
  ref-manual: terms.rst: add SBOM and SPDX terms
  ref-manual: variables.rst: document spdx-create class variables
  dev-manual: common-tasks.rst: add section about SPDX / SBOM generation
  ref-manual: classes.rst: expand documentation of create-spdx class
  ref-manual: terms.rst: add reference to new SBOM/SPDX section in dev
    manual

 documentation/dev-manual/common-tasks.rst | 96 ++++++++++++++---------
 documentation/ref-manual/classes.rst      | 20 ++++-
 documentation/ref-manual/terms.rst        | 28 +++++++
 documentation/ref-manual/variables.rst    | 79 +++++++++++++++++++
 4 files changed, 186 insertions(+), 37 deletions(-)

-- 
2.34.1


