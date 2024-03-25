Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5FACD11BF
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.51969.1711373265011640487
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GxR+2mZB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E094EE000E;
	Mon, 25 Mar 2024 13:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XvEsb7buMuSIETzc7n0TzFtAWTYN6tBsJ7dczt9NJAo=;
	b=GxR+2mZB2Z8XoHWV5GG8hbt7JtfifO1JxaQFIFvB8wJm9qhbKNZiUqjks75ggPxRPxZU4M
	gOCwcr+MVzsz7RC5FKvz7uhp8I8Gi4jJ3sd26UPU4mMqAfqouI9uiqfaZQGxJVJIW2BQdu
	c5AxZOjUwXsddDHu2uhSnIFyYik+dQJpJfv5HJ0F83a4sjWxXsRS5EX8HPpFQMjYtd4rWU
	1hOjfqP2J6xh2pHp64104zrYLO85TyPp5Tf1ngsFZBG3DLvou06MykugLzdu39/qMaqipn
	YeHAH427irgaDgOF+lHbKfsDNfpQOUin+Yyep0DWnCN/G0svItOlEFFEpGPZfg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/9] documentation backports
Date: Mon, 25 Mar 2024 14:27:28 +0100
Message-Id: <20240325132737.3018073-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4998

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Apply relevant patches from the "master" branch.

Alexander Kanavin (1):
  dev-manual: improve descriptions of 'bitbake -S printdiff'

BELOUARGA Mohamed (1):
  ref-manual: add documentation of the variable SPDX_NAMESPACE_PREFIX

Lee Chee Yang (1):
  migration-guides: add release notes for 4.0.17

Martin Jansa (1):
  contributor-guide: be more specific about meta-* trees

Michael Opdenacker (5):
  manuals: add initial stylechecks with Vale
  profile-manual: usage.rst: formatting fixes
  manuals: use "manual page(s)"
  profile-manual: usage.rst: fix reference to bug report
  profile-manual: usage.rst: further style improvements

 documentation/.gitignore                      |   2 +
 documentation/.vale.ini                       |   7 +
 documentation/Makefile                        |  13 +-
 documentation/README                          |  14 +
 .../contributor-guide/submit-changes.rst      |   2 +-
 documentation/dev-manual/building.rst         |   7 +-
 documentation/dev-manual/debugging.rst        |  13 +-
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.17.rst | 238 ++++++
 documentation/profile-manual/usage.rst        | 738 +++++++++---------
 documentation/ref-manual/classes.rst          |   2 +-
 documentation/ref-manual/variables.rst        |   7 +-
 documentation/standards.md                    |  15 +
 .../config/vocabularies/OpenSource/accept.txt |  20 +
 .../config/vocabularies/Yocto/accept.txt      |   5 +
 15 files changed, 704 insertions(+), 380 deletions(-)
 create mode 100644 documentation/.vale.ini
 create mode 100644 documentation/migration-guides/release-notes-4.0.17.rst
 create mode 100644 documentation/styles/config/vocabularies/OpenSource/accept.txt
 create mode 100644 documentation/styles/config/vocabularies/Yocto/accept.txt

-- 
2.34.1


