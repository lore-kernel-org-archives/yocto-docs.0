Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B5FEB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:55:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.49490.1691776533714774513
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 10:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kMNY68YL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A03F40005;
	Fri, 11 Aug 2023 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691776531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1yw9ZZKpXYHSKv65oBpTRjRklWIphNSvFzZGzoZk2KE=;
	b=kMNY68YLiVLd41xQRhCtskzn02+oesgeLS8ByI+hIgCVYP03iK2xAN2TK42Tqr/1Hgl0yF
	2wpg7ovWPyecnZ66RWr8CER8BsyA4rwG87u0nFdMw/0cFV7pJsGXaBkERuNySeOipVlPlO
	h7+I25MJDM8xIx96ISLNxwtMGl9zXD4MFMQQfYGVRvJdF/xj8Zi2ZjIBnGmD93y1LxjSOm
	GzRigHyJ7Ct8nlD7GlerwIifh3zhJZU348OeMMZJcTxtq5109zNkuVZoJN0+nOZo9GIC26
	wUsrb+AfCPTcjwu1a/bc/NoZFzVs7k+m6/hVXjBz+DMdj2AXuqOAUBH4MjDkjw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/5] Contributor Guide updates
Date: Fri, 11 Aug 2023 19:55:22 +0200
Message-Id: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 17:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4145

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Work in progress to update and improve the instructions
for contributors.

Note that these commits are part of an incremental
process. More useful details (such as configuring
Git for git send-email) will be sent through later
patches.

Michael Opdenacker (5):
  contributor guide: call section "Reporting a defect"
  contributor-guide: remove obsolete pkg-config guidelines
  contributor guide: remove unnecessary information about mailing lists
  contributor-guide: clarification about patchtest
  contributor guide: update instructions for making and sharing changes

 documentation/bsp-guide/bsp.rst               |   2 +-
 documentation/contributor-guide/index.rst     |   4 +-
 .../contributor-guide/recipe-style-guide.rst  |   5 -
 .../{submit-defect.rst => report-defect.rst}  |   2 +-
 .../{submit-change.rst => submit-changes.rst} | 145 +++++++++---------
 documentation/dev-manual/debugging.rst        |   4 +-
 documentation/dev-manual/start.rst            |   4 +-
 documentation/dev-manual/vulnerabilities.rst  |   2 +-
 .../development-environment.rst               |   6 +-
 documentation/ref-manual/resources.rst        |   2 +-
 .../ref-manual/system-requirements.rst        |   2 +-
 11 files changed, 87 insertions(+), 91 deletions(-)
 rename documentation/contributor-guide/{submit-defect.rst => report-defect.rst} (98%)
 rename documentation/contributor-guide/{submit-change.rst => submit-changes.rst} (83%)

-- 
2.34.1


