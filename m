Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1F5C5472C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.9384.1724319328280528292
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Aug 2024 02:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hrZiUXu5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AD30C0003;
	Thu, 22 Aug 2024 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724319326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=e/8zX+Q9gmDCYGn1yCeE3/+bHCfbKWURahzh76KzXGA=;
	b=hrZiUXu5iMcvKdwYivwPg+8dRZOXQ4FbZI3dtUhg7DAnSEFSlkbD0VKpZSTUIjcA+RH/kq
	Ls+oZGhj5TCXUoggTd09hVh6p1OXU+2eSzbwANoCFfCTdZWjIZ4Rzmh+S4yEIa/QXYGHA1
	KN0656UxsoXEitYUVhoidN3tMsFiVCNaNhYO9RW7ZDVKbEX6VC41jSJlU0+mqJeoRDWVl5
	Og0kx/HlusNKihmG3utJn2NI2It2ir9ThAI50NaqKU8M1gVYJ8YdO4aDhgz9Z1uMVWcDHp
	jrXwsAsRuenQlrf8H0iu3TDUqxxlpqVk8uhvthibaWYrTWidM6OfJQYDMQN1tQ==
Date: Thu, 22 Aug 2024 11:35:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [kirkstone] Pull request
Message-ID: <2024082209352514f05c80@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Aug 2024 09:35:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5338

The following changes since commit b15b1d369edf33cd91232fefa0278e7e89653a01:

  migration-guides: add release notes for 4.0.19 (2024-06-15 14:28:39 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/kirkstone-next

for you to fetch changes up to 512025edd9b3b6b8d0938b35bb6188c9f3b7f17d:

  migration-guide: add release notes for 4.0.20 (2024-07-26 22:53:45 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.20

Matthias Pritschet (1):
      ref-manual: fix typo and move SYSROOT_DIRS example

 documentation/migration-guides/release-4.0.rst     |   2 +
 .../migration-guides/release-notes-4.0.20.rst      | 130 +++++++++++++++++++++
 documentation/ref-manual/variables.rst             |  48 ++++----
 3 files changed, 156 insertions(+), 24 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.20.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

