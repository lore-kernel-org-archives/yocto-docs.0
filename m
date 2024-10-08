Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00452CEF177
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:50:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9738.1728395423674026611
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 06:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A+22xeL4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E2354000C;
	Tue,  8 Oct 2024 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728395421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bKKF5DCyRgS0ul4JgR+1dJdCibGqMY9sgjsmP69d+rs=;
	b=A+22xeL4I4eDizFLPflNQkhcdWrdqQwkd668YYyka90YoWiwGHUmULEsd1gQZQ8zMdQkDy
	b4TmmvHYeDXYlM+M3hgewpyvsQsO3vWA0OR0BSnIOSD1Bpvv/BHaio19J0irzir3pGDz/S
	n9YK44+gGbYhRqhzfy5nOcV0vjf9PiKsJ2YIt8otLTUmJcrsBRVJ+uIH6Ztk5pue89RNol
	0nNvBA7K8SutxLXJJ/N1zfDyQwTzCeG7aqxAVsljMuXOwIGOCuqP9FfeamLbJlhVxajwgO
	9HylNvay4esxuIwo8h2YAgwx4PJE5Fi15Vx4AUJf50pJbpt9PufdDiKWFsttbA==
Date: Tue, 8 Oct 2024 15:50:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [kirkstone] Pull request
Message-ID: <20241008135021033c6b33@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Oct 2024 13:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5406

The following changes since commit fa846606014a85154b63794a17ff1d9aacc1a7bc:

  doc/features: remove duplicate word in distribution feature ext2 (2024-09-03 10:37:33 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/kirkstone-next

for you to fetch changes up to 2169a52a24ebd1906039c42632bae6c4285a3aca:

  migration-guide: add release notes for 4.0.21 (2024-09-25 17:24:14 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.21

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.21.rst      | 166 +++++++++++++++++++++
 2 files changed, 167 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.21.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

