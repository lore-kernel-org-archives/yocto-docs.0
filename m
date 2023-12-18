Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC21DC46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 21:33:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.2893.1702935231786520996
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 13:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RZG9BsDD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 443CB240004;
	Mon, 18 Dec 2023 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702935229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vnO5kyGFSJXj/lVjIfpEAKu6ap15VjhhXpFm7VP74Wk=;
	b=RZG9BsDDtYXZOY5DRfjsq9JKINQe9LlKqzRipP8fLUJYHor/JdbnGt1RTl2EexakPgt3yg
	zy7v7xJMo1vDiiMvrsk+mKoKgFj6jfEYF/XTT63U8UzZBehupPX0O4mxRfDSVKXVCUApSE
	0fAtnM6fGY8Curbp/o/Yp2J0dnsWeziS0CGItGm9Ioh8UGPXogNoU24xzj04oL1A8aA+Aw
	5Hy6iKNYJYLWaDXQro+lNhfFq7DyOoh88dOP5AcPOhc71iPASYS0gHFoRLiLMBxX1zS02l
	6z98QJp4GWmscMO/OFnuqTx6I3i7iB/RnbJmyc9m8Tvq0kt66E8NKlVoL9YuWw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 00/20] Documentation backports
Date: Mon, 18 Dec 2023 22:33:14 +0100
Message-Id: <20231218213334.146370-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Dec 2023 21:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4686

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Justin Bronder (1):
  contributor-guide: add License-Update tag

Lee Chee Yang (4):
  migration-guide: add release notes for 4.2.4
  migration-guide: add release notes for 4.0.14
  migration-guides: reword fix in release-notes-4.3.1
  migration-guides: add release notes for 4.0.15

Michael Opdenacker (12):
  migration-guides: release 3.5 is actually 4.0
  contributor-guide: fix command option
  dev-manual: layers: update link to YP Compatible form
  ref-manual: releases.svg: update nanbield release status
  manuals: fix URL
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
 .../contributor-guide/recipe-style-guide.rst  |  12 +
 .../contributor-guide/submit-changes.rst      |   2 +-
 documentation/dev-manual/debugging.rst        |   2 +-
 documentation/dev-manual/layers.rst           |   4 +-
 documentation/dev-manual/new-recipe.rst       |  27 +-
 documentation/dev-manual/runtime-testing.rst  |   2 +-
 .../migration-guides/migration-2.2.rst        |   2 +-
 .../migration-guides/migration-3.0.rst        |   2 +-
 .../migration-guides/migration-3.4.rst        |   2 +-
 .../migration-guides/release-4.0.rst          |   2 +
 .../migration-guides/release-4.2.rst          |   1 +
 .../migration-guides/release-notes-4.0.14.rst | 227 +++++++++++
 .../migration-guides/release-notes-4.0.15.rst | 189 +++++++++
 .../migration-guides/release-notes-4.2.4.rst  | 364 ++++++++++++++++++
 .../migration-guides/release-notes-4.3.1.rst  |   2 +-
 documentation/ref-manual/svg/releases.svg     |  32 +-
 documentation/ref-manual/variables.rst        |  10 +-
 documentation/test-manual/intro.rst           | 112 +++---
 documentation/test-manual/test-process.rst    |  44 +--
 .../test-manual/understand-autobuilder.rst    |  62 +--
 documentation/what-i-wish-id-known.rst        |   5 +-
 22 files changed, 954 insertions(+), 155 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.14.rst
 create mode 100644 documentation/migration-guides/release-notes-4.0.15.rst
 create mode 100644 documentation/migration-guides/release-notes-4.2.4.rst

-- 
2.34.1


