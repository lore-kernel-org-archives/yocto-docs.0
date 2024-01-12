Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3325C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:51:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12330.1705078271194790136
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R00mAXwH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EE001BF203;
	Fri, 12 Jan 2024 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N32IPu+biwuGgajW5SFS7F4E5gPTmK/62ccJKH4l1io=;
	b=R00mAXwH4LtL29G02imwJ4uTeddy2t0RZzKN9yhJexhZli4d03l52X5mchzthomEjCAbmS
	nHWKw+kmNBxoq0H8pEf5AdIgM4v6NkBWySfBtqKLeqYK4EJiC0vGfZ9h0qT5xpshjbRJBg
	EbQOwc2X4biRjHWXGgI1IO6luDBvTQY9yhkaxw3cvC4Zl4ytFekjRCJ6mtPnIood67xTQO
	BUwnrnYh/pXIDsliaByuuABZSErUcL0b+PEJtOnUwatgpJM17e7/WxJn8xEw76EXb7GX12
	ulgMFBpFCAn/Ne2GZRcGYZajX5XJbakaihoCioRtDzzF9Nooi87u7ELDZajAZg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 0/7] documentation backports
Date: Fri, 12 Jan 2024 17:50:52 +0100
Message-Id: <20240112165059.3553847-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:51:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4765

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Enguerrand de Ribaucourt (1):
  manuals: document VSCode extension

Ilya A. Kriveshko (1):
  dev-manual: update license manifest path

Jörg Sommer (1):
  documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG

Lee Chee Yang (1):
  migration-guide: add release notes for 4.3.2

Maxin B. John (1):
  ref-manual: classes: remove insserv bbclass

Michael Opdenacker (1):
  contributor-guide: use "apt" instead of "aptitude"

Simone Weiß (1):
  dev-manual: start.rst: Update use of Download page

 .../contributor-guide/submit-changes.rst      |   2 +-
 documentation/dev-manual/building.rst         |   4 +
 documentation/dev-manual/licenses.rst         |   2 +-
 documentation/dev-manual/start.rst            |  34 ++-
 .../migration-guides/release-4.3.rst          |   1 +
 .../migration-guides/release-notes-4.3.2.rst  | 247 ++++++++++++++++++
 .../development-environment.rst               |   8 +
 documentation/overview-manual/yp-intro.rst    |  20 ++
 documentation/ref-manual/classes.rst          |  12 +-
 documentation/ref-manual/resources.rst        |   5 +
 documentation/ref-manual/variables.rst        |  39 +--
 documentation/what-i-wish-id-known.rst        |   7 +
 12 files changed, 340 insertions(+), 41 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.3.2.rst

-- 
2.34.1


