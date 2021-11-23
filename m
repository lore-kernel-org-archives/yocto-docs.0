Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79186C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 18:12:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.15243.1637691173020033655
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 10:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8D52C0005;
	Tue, 23 Nov 2021 18:12:44 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/3] Add further class references
Date: Tue, 23 Nov 2021 19:12:36 +0100
Message-Id: <20211123181239.2057168-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Nov 2021 18:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2183

These patches add missing references to the reference
descriptions of classes.

Such references will also be useful to detect obsolete
references to classes that have been removed.

As the code contains multiple references to the paths
or contents of .bbclass files, I also plan to
create a new "extlinks" macro to have hyperlinks
to the corresponding code.

Michael Opdenacker (3):
  migration-guides: add more class references
  ref-manual: add more class references
  misc manuals: add further class references

 documentation/dev-manual/common-tasks.rst     | 32 ++++++-------
 .../migration-guides/migration-1.5.rst        |  3 +-
 .../migration-guides/migration-1.7.rst        |  6 ++-
 .../migration-guides/migration-2.1.rst        |  6 +--
 .../migration-guides/migration-2.2.rst        |  2 +-
 .../migration-guides/migration-2.3.rst        |  2 +-
 .../migration-guides/migration-2.4.rst        |  2 +-
 .../migration-guides/migration-2.5.rst        |  8 ++--
 .../migration-guides/migration-3.0.rst        |  4 +-
 .../migration-guides/migration-3.1.rst        |  4 +-
 .../migration-guides/migration-3.2.rst        |  2 +-
 .../migration-guides/migration-3.3.rst        |  2 +-
 documentation/overview-manual/concepts.rst    |  2 +-
 documentation/ref-manual/classes.rst          |  4 +-
 documentation/ref-manual/structure.rst        |  2 +-
 documentation/ref-manual/tasks.rst            |  4 +-
 documentation/ref-manual/variables.rst        | 48 +++++++++----------
 documentation/test-manual/intro.rst           |  2 +-
 18 files changed, 67 insertions(+), 68 deletions(-)

-- 
2.25.1


