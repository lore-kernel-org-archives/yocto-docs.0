Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BDDC47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:53:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12399.1705078404039604190
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SfRAbzph;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 205821C0007;
	Fri, 12 Jan 2024 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FYatKpPkGnv9qLdvAiyKod1mSBCE6qs68/VlAlXIMsA=;
	b=SfRAbzph6SZPxXkWaoN0aF5hb0tFMB8ichhjxIcb7ZmzvtoU7fkJHiBm7NtuQfyrxwpdXG
	Rh7e/BwJEoiTWLMWNkUdL+lLE3srSOna0T3VFshKV8y4T4VbGKhdX+roMpPP7jmXQrHe98
	XZ5vcKVFHEmyhZYc/a91EApJZ9I8yVIxskzcWxk2mNQWyXac0Y/30Y17OePtjHER0lTWFG
	xaQIpt2QQum363MU0SVhpDZdF6EeNQTKDgqwI6j6cBVuXe+meEEllvJEc96mIyFYLWyBox
	oT1scKScL061HSmJUAlP453KoJ7M6GfK+kecQFNfjprSmluTD91lQX6xkeVAiA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/6] documentation backports
Date: Fri, 12 Jan 2024 17:53:05 +0100
Message-Id: <20240112165311.3554201-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:53:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4773

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Enguerrand de Ribaucourt (1):
  manuals: document VSCode extension

Jörg Sommer (1):
  documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG

Maxin B. John (1):
  ref-manual: classes: remove insserv bbclass

Michael Opdenacker (2):
  contributor-guide: use "apt" instead of "aptitude"
  ref-manual: resources: sync with master branch

Simone Weiß (1):
  dev-manual: start.rst: update use of Download page

 .../contributor-guide/submit-changes.rst      |  2 +-
 documentation/dev-manual/building.rst         |  4 ++
 documentation/dev-manual/start.rst            | 33 ++++++---
 .../development-environment.rst               |  8 +++
 documentation/overview-manual/yp-intro.rst    | 20 ++++++
 documentation/ref-manual/classes.rst          | 12 +---
 documentation/ref-manual/resources.rst        | 71 ++++++++++---------
 documentation/ref-manual/variables.rst        | 39 +++++-----
 documentation/what-i-wish-id-known.rst        |  7 ++
 9 files changed, 124 insertions(+), 72 deletions(-)

-- 
2.34.1


