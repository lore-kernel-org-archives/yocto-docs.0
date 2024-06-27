Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38521C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 16:39:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.12675.1719506352631959585
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 09:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E2WCngpR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39DDAFF802;
	Thu, 27 Jun 2024 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719506351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KRQbFY9CFJLqvnQeSlnv6HskpEPhSpXQXSiWAZeq5VI=;
	b=E2WCngpRNEcMYvNz/MKoky07djeBBy9pYMXbYiotB9SCFePma9h4087jk9C2lLJcChhMCG
	icrTD9t23qzJh9NpeRCU+iVkXxVTr35CErxQ3v/NDwWt6e2nUy8byyn1JZ5rErWe6ehucy
	X+BDF7zVl90YN3la8mSTLQ8V/eKLB4XdJNWDwCAqmqGrsXMNi3vk4HXg0Tu2j6LqgKcbVS
	4pjkNiNnKzOPRY8Tpbkg+glMPhvTYHENW8dQX3aFrRVG2JDC1/CKMLSq9mM0kEPpP7Cffi
	uQon88FBmVak3IfI4Rk41sqK3Qr49/Iorbf9as6XBfJRaripm8UD0wCs6Q9dDw==
Date: Thu, 27 Jun 2024 18:39:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <2024062716391154cf8317@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Jun 2024 16:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5311

Hello Richard,

The following changes since commit 9cc4e395571dcef58d9d8545c08d9fdf8070bb32:

  ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable (2024-06-16 22:49:19 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/master-next

for you to fetch changes up to 48f8eaf956e6897d714a9f628295bf0a320b3547:

  docs: modify reference from python2.py to python.py (2024-06-27 18:37:36 +0200)

----------------------------------------------------------------
Jon Mason (1):
      docs: modify reference from python2.py to python.py

J�rg Sommer (1):
      ref-manual: add DEFAULT_TIMEZONE variable

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.19
      migration-guides: add release notes for 5.0.2

 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.19.rst      | 159 +++++++++++++
 .../migration-guides/release-notes-5.0.2.rst       | 245 +++++++++++++++++++++
 documentation/ref-manual/variables.rst             |   7 +
 documentation/test-manual/intro.rst                |   2 +-
 6 files changed, 414 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.19.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.2.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

