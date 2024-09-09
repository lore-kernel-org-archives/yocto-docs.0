Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271E6CE7AB0
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 07:18:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.47224.1725866318070481787
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 00:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VETha4vt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0687E40002;
	Mon,  9 Sep 2024 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725866316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IfoAqfiYExmw9eUB0ZjpKkHR0dziBd/6qTxlLVatpK4=;
	b=VETha4vt3P/pLdN4OZJlgmrYb/EggqTmPGax2KUSXnhvo50gjDNUhUbP08MCd4dczKjxrI
	bFyiefYDYZQJxzdpnfEgUcaRmi3BxlcD++EkG3Q/wDNaYZEVOKHFMwF5gvqBxftE9G4652
	zubutcKzd2L3GZek32xOSlzh58LuFeeRr2QsrSJsNT4aCwpHA+kBDisNqhIhbwc0Tdv7j3
	Nm2/JQ0QcwrpQ7wzksWi4UDHM94zM7TbacB1BDJRp3RxbCakSnL9m5RQvjAOYxrAjg7QaL
	JKcEHRTVyTbyFaX+d6lJlni8DFcWieXU5r/2z9wwWbdcpw/uuAtdNpTwn9FT7w==
Date: Mon, 9 Sep 2024 09:18:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [kirkstone] Pull request
Message-ID: <2024090907183582f7ae25@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Sep 2024 07:18:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5355

The following changes since commit 512025edd9b3b6b8d0938b35bb6188c9f3b7f17d:

  migration-guide: add release notes for 4.0.20 (2024-07-26 22:53:45 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/kirkstone-next

for you to fetch changes up to fa846606014a85154b63794a17ff1d9aacc1a7bc:

  doc/features: remove duplicate word in distribution feature ext2 (2024-09-03 10:37:33 +0200)

----------------------------------------------------------------
J�rg Sommer (1):
      doc/features: remove duplicate word in distribution feature ext2

 documentation/ref-manual/features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

