Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1439DC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:36:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.9533.1724319381379297388
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Aug 2024 02:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lk5zMYHA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33193E0003;
	Thu, 22 Aug 2024 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724319379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YLbxSSrDusS1vDWOLRKLuXlDKWegf7rhSi2n5fDeKSA=;
	b=Lk5zMYHAX4A8Y8Zx+m/APF8qNqjntigLfKoWgqzUo8MKKdL4bDG51jjaDjc5Ll9HYWp9Ft
	YeZcwe2uFJfDBtE9r6cJuuj5Oa7pEeLbg+r74RCvIVJR8FeHJGJ0FRT5EIQ4U53CHbYOqD
	AY6K7i5EMEBkjHbJRQrGCIaNV+m7t6mgBPOPsT4fkFj0OVr/dY21CoeHoZGvi/zXPu33zp
	oue4aNc6c7yJsylY6faWXiom7uxIsz4YOg0OSSRem7qvZaC39ExwpnbBh2jUgp8MWoFFln
	QjniooIh5d0NSwatUaJLvzYXF/+LriGzZZGgfasZY64Xvpm1jMojwPWsj0Iy7w==
Date: Thu, 22 Aug 2024 11:36:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [scarthgap] Pull request
Message-ID: <2024082209361875d31de6@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Aug 2024 09:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5339

The following changes since commit 09e321d7cbd5bd7071a0c138e6d0c424fb086269:

  migration-guides: add release notes for 5.0.2 (2024-06-27 18:22:27 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/scarthgap-next

for you to fetch changes up to fd4654df2d9eb36cae872dca4d23341ed5f9be91:

  migration-guides: add release notes for 5.0.3 (2024-08-22 11:33:00 +0200)

----------------------------------------------------------------
Lee Chee Yang (2):
      migration-guide: add release notes for 4.0.20
      migration-guides: add release notes for 5.0.3

Matthias Pritschet (1):
      ref-manual: fix typo and move SYSROOT_DIRS example

 documentation/migration-guides/release-4.0.rst     |   2 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.20.rst      | 130 +++++++++
 .../migration-guides/release-notes-5.0.3.rst       | 314 +++++++++++++++++++++
 documentation/ref-manual/variables.rst             |  48 ++--
 5 files changed, 471 insertions(+), 24 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.20.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.3.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

