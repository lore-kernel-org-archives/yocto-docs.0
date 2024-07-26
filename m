Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB56C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 21:08:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4965.1722028124156412481
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 14:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HYv/g7tA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00FA0FF802;
	Fri, 26 Jul 2024 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722028122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=9sHnTo1BO+6t9ux8c4ntmgD0Pr/OZsUSnapqFxvrb0A=;
	b=HYv/g7tAbTGzRhNMeCbf9KDxICM3TRhnGqvQd6/vA6GQrymUAZa26b+dBIzPH4AdFwy0gb
	JvRzDWCT5V9EJ7SJuMMg7x5yWrAS9eMvX1G1Ax5URPqgETxNdeUoi7g5Z6BJNstbtOXQNB
	6Pj9h5INR0g7p0tqnk6iQXEhQ/xV7wdCGh7wOarrDixS4/Rpvd+i6oLzdQ9LntaY5AuhmY
	hRnezY/DbmvI3/zLbDtU8erZQsrUWk8fDhM2WsBZQessSc3TxdqUTZO/WhHCbP1QlFjtLj
	9cIJSXOT6YSPYko0r5CxjU/K0Hll16t5u3yqDetxJB7HLFVh6NYY/3KkwerjBg==
Date: Fri, 26 Jul 2024 23:08:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [scarthgap] Pull request
Message-ID: <202407262108413c372ae4@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jul 2024 21:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5329

Hello Richard,

The following changes since commit 09e321d7cbd5bd7071a0c138e6d0c424fb086269:

  migration-guides: add release notes for 5.0.2 (2024-06-27 18:22:27 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/scarthgap-next

for you to fetch changes up to 9b822bab8d351a120ebcdbc0d43d709921b88dca:

  migration-guide: add release notes for 4.0.20 (2024-07-26 22:53:28 +0200)

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

