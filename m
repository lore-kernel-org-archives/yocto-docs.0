Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8DEC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:45:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3209.1702935893296345970
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ux+ADRm/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 575F040004;
	Mon, 18 Dec 2023 21:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CePGB6XN9Ut4ovuJzM89Qk5+Oak0iOFp4wAaLkaRST4=;
	b=Ux+ADRm/EmCZPMXMcdZJlG4Lqcfc0c0zzG3jkO4e0WRpyTDpddZh6yxifIIeHD3jX4tYN8
	7g7XW0e2cuohMFlOj1YTMoazS2E5viODh176jltCyQnmWqF5AKtSqI3msMgQFISv2oalMT
	WTkvEwOeQrpRklCYidZxew7k5S46yO5Mhodolgu/OzWVjDTMjV7Pw4QSFo1sBGUfKaRQpM
	Uaaf+PFaQK1y9NU3Tsa8twAEj5TXDMlLVkSd7vERQPcPlSzlBBVDkByUt+Jrk8lsn7AV0x
	r64GhXOYKvv5pWwZk0WbWhks8PNeRzs9jtXQBbgFwyLIR9/2MdwOJMjxr1TpqQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 00/18] Documentation backports
Date: Mon, 18 Dec 2023 22:44:24 +0100
Message-Id: <20231218214442.147385-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4707

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Aatir Manzur (1):
  docs: add CONVERSION_CMD definition

Justin Bronder (1):
  contributor-guide: add License-Update tag

Lee Chee Yang (1):
  migration-guides: add release notes for 4.0.15

Michael Opdenacker (12):
  manuals: fix URL
  ref-manual: releases.svg: update nanbield release status
  dev-manual: layers: update link to YP Compatible form
  contributor-guide: fix command option
  migration-guides: release 3.5 is actually 4.0
  test-manual: text and formatting fixes
  test-manual: resource updates
  test-manual: add links to python unittest
  test-manual: explicit or fix file paths
  test-manual: add or improve hyperlinks
  dev-manual: runtime-testing: fix test module name
  test-manual: use working example

Paul Barker (1):
  ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults

Peter Kjellerstedt (1):
  dev-manual: Discourage the use of SRC_URI[md5sum]

Simone Weiß (1):
  manuals: brief-yoctoprojectqs: align variable order with default
    local.conf

 documentation/brief-yoctoprojectqs/index.rst  |   4 +-
 .../contributor-guide/recipe-style-guide.rst  |  12 ++
 .../contributor-guide/submit-changes.rst      |   2 +-
 documentation/dev-manual/debugging.rst        |   2 +-
 documentation/dev-manual/layers.rst           |   4 +-
 documentation/dev-manual/new-recipe.rst       |  27 ++-
 documentation/dev-manual/runtime-testing.rst  |   2 +-
 .../migration-guides/migration-2.2.rst        |   4 +-
 .../migration-guides/migration-2.4.rst        |   2 +-
 .../migration-guides/migration-3.0.rst        |   2 +-
 .../migration-guides/migration-3.4.rst        |   4 +-
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.15.rst | 189 ++++++++++++++++++
 documentation/ref-manual/svg/releases.svg     |  32 +--
 documentation/ref-manual/variables.rst        |  23 ++-
 documentation/test-manual/intro.rst           | 119 +++++------
 documentation/test-manual/test-process.rst    |  44 ++--
 .../test-manual/understand-autobuilder.rst    |  64 +++---
 documentation/what-i-wish-id-known.rst        |   5 +-
 19 files changed, 383 insertions(+), 159 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.15.rst

-- 
2.34.1


