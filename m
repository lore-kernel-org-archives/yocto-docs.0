Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F71DCD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:04:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.7338.1712311453200362346
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 03:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A6PqJa4O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C15D9C000B;
	Fri,  5 Apr 2024 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712311450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h333+ql/fk7J02VHeuzf1K/WwwBpmF7A5Z+82cgJdKg=;
	b=A6PqJa4OOOPCXNwyOztCSoat/QG6cGyzgVcTJb4kFu+vdM3XpAIeXWoDGoy91R+bWZUw07
	nJYQYSBg8R6MP/caVNICXnEDBQzJf5fG5+c2ii9S3VHfgt0ISPKRFyzWqZIJI6bnTbfTZj
	ooIyUaScGchPWghIzOb2JR8j+uf/jwt7LQ9zN52+4utcCiOpwwIfIgL4TONnlNJk52hr1r
	a77cVTIlC4KqBjHjhearUQ1IQgPHPhlD1wEKgkSw6G8sEeaG9yma61z+sghO5gDgIV5aNv
	ryXZo0Y61awEoaTUoDmgdV1sEpwmvkk/oBsnr5fhx248ESFlc3j1fO2UpPQaqA==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/3] Add missing parts to Go language changes
Date: Fri,  5 Apr 2024 12:03:51 +0200
Message-ID: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 10:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5068

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Hello,

I am (re)sending the patches that needed some rework, but not as a v2 since some
patches from the previous series were already merged. Plus, a new patch to
document the go-vendor class in ref-manual/classes.rst was included.

Best regards,

Joao Marcos Costa (3):
  classes: document new go-vendor class
  release-notes: add changes to Go language
  migration: add Go language changes

 documentation/migration-guides/migration-5.0.rst    |  4 ++++
 .../migration-guides/release-notes-5.0.rst          |  4 ++++
 documentation/ref-manual/classes.rst                | 13 +++++++++++++
 3 files changed, 21 insertions(+)

-- 
2.43.0


