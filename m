Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D9CC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 21:09:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4983.1722028172580708016
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 14:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TFaRh8Uu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 900A240002;
	Fri, 26 Jul 2024 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722028170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=SFI0quI+hj7GiaoCjFfPhzSN8mQ0kyTHGstfVe9ve0U=;
	b=TFaRh8Uu7JYa69sQLvESgLL1qrpo/D/5KT+PpAZdRT9SLyqbUyfFzomvAQCucXYTJTDSMJ
	HuC2e5dcbDGPovs3TVYoruIIY0wrZlimRejl1hwJEImod0nfl9r4cidJwfNXRXzlklapOD
	0dz3VbZE4iJFXJ2RNmiMFuQy5hkTdzg0drJiToFbquidhBoNj9AHn69+1xTNhnUdcoh7x7
	2if4/0LI7kfEAdI71B1maldmsJpcJUYe6LNjTXgEsKhgZ+ffuDXXodX6vMAXBKRTTC//V1
	r2yceyooe7+JItTkGzrIdHDtCD8LzXMWrAEfGySU4Azacp1I4oXV3B7onpmX0Q==
Date: Fri, 26 Jul 2024 23:09:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <20240726210930273630dc@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jul 2024 21:09:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5330

Hello Richard,

The following changes since commit 48f8eaf956e6897d714a9f628295bf0a320b3547:

  docs: modify reference from python2.py to python.py (2024-06-27 18:37:36 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/master-next

for you to fetch changes up to 8424f7688343dfe5685e3f6ff4513d26f69430e9:

  migration-guide: add release notes for 4.0.20 (2024-07-26 22:53:01 +0200)

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

