Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBFFC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 14:18:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.10373.1634653112187760554
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6799F4001A;
	Tue, 19 Oct 2021 14:18:30 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/3] Improve reproducible build documentation
Date: Tue, 19 Oct 2021 16:18:21 +0200
Message-Id: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 14:18:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1999

This adds documentation for the BUILD_REPRODUCIBLE_BINARIES (mentioned
in the 3.4 migration notes) and SOURCE_DATE_EPOCH variables,
as well as for the "reproducible_build" class.

Let me know if you wish to extend the description of SOURCE_DATE_EPOCH
to give more details about how the value is computed by reproducible_build.bbclass.
Should we extract the comments from reproducible_build.bbclass?

I could also mention REPRODUCIBLE_TIMESTAMP_ROOTFS, but since it's not
overriden in any recipe in Poky, my first choice is not to mention it,
not to add to many details to the documentation.

Your opinion?

Michael Opdenacker (3):
  ref-manual: document BUILD_REPRODUCIBLE_BINARIES
  ref-manual: document "reproducible_build" class and SOURCE_DATE_EPOCH
  test-manual: how to enable reproducible builds

 .../migration-guides/migration-3.1.rst        |  5 ++--
 .../migration-guides/migration-3.4.rst        |  2 +-
 documentation/ref-manual/classes.rst          | 12 ++++++++
 documentation/ref-manual/variables.rst        | 30 +++++++++++++++++++
 .../test-manual/reproducible-builds.rst       | 12 ++++++++
 5 files changed, 58 insertions(+), 3 deletions(-)

-- 
2.25.1


