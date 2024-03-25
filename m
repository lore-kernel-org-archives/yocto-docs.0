Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778A9CD11BF
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.52011.1711373369714360183
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VNrU2BWQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 463B61BF207;
	Mon, 25 Mar 2024 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lsZZJiqUFpEMs24KmESncq6P4KW3wI9kbHGvmtMc9ks=;
	b=VNrU2BWQyMPhO5aWkYc2qJb0MtHe4SMEKK2iUOk26OJm0J18mdy+GJ8ZvMeOWDo/lHqErT
	ezt7yZc7mQn/eoyhh/LmLJU/8E25oV4SKN7tA6wlJQm6QkHW8NN/KfzRiVgVi6cQ1wbmXa
	zdRnASoPRL9YNIqZUrIWq0kqhOsJbNh2jTDi5zKrWzB/F8RqqUjPnRhKLhf5A2H0Dz14Ag
	45a1FZblBYraTc6dqitwNng7Xve+t2r3LFvdoEQtEkSEyKoWwT4k+P/RVBwktKMkmHQoam
	tPO+ilz3UrD9LCVb1/dlrKnvAYV/8t+8rXgasF+v1+w5aWdqArZvFt0emmYbGQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 00/11] documentation backports
Date: Mon, 25 Mar 2024 14:29:15 +0100
Message-Id: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5008

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Apply relevant patches from the "master" branch.

Alexander Kanavin (2):
  sdk-manual: correctly describe separate build-sysroots tasks in direct
    sdk workflows
  dev-manual: improve descriptions of 'bitbake -S printdiff'

BELOUARGA Mohamed (1):
  ref-manual: add documentation of the variable SPDX_NAMESPACE_PREFIX

Lee Chee Yang (1):
  migration-guides: add release notes for 4.0.17

Martin Jansa (1):
  contributor-guide: be more specific about meta-* trees

Michael Opdenacker (6):
  manuals: add initial stylechecks with Vale
  profile-manual: usage.rst: formatting fixes
  manuals: use "manual page(s)"
  profile-manual: usage.rst: fix reference to bug report
  documentation: Makefile: remove releases.rst in "make clean"
  profile-manual: usage.rst: further style improvements

 documentation/.gitignore                      |   2 +
 documentation/.vale.ini                       |   7 +
 documentation/Makefile                        |  15 +-
 documentation/README                          |  14 +
 .../contributor-guide/submit-changes.rst      |   2 +-
 documentation/dev-manual/building.rst         |   7 +-
 documentation/dev-manual/debugging.rst        |  13 +-
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.17.rst | 238 ++++++
 documentation/profile-manual/usage.rst        | 734 +++++++++---------
 documentation/ref-manual/classes.rst          |   2 +-
 documentation/ref-manual/variables.rst        |   7 +-
 documentation/sdk-manual/extensible.rst       |   8 +-
 documentation/standards.md                    |  15 +
 .../config/vocabularies/OpenSource/accept.txt |  20 +
 .../config/vocabularies/Yocto/accept.txt      |   5 +
 16 files changed, 709 insertions(+), 381 deletions(-)
 create mode 100644 documentation/.vale.ini
 create mode 100644 documentation/migration-guides/release-notes-4.0.17.rst
 create mode 100644 documentation/styles/config/vocabularies/OpenSource/accept.txt
 create mode 100644 documentation/styles/config/vocabularies/Yocto/accept.txt

-- 
2.34.1


