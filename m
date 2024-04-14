Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F27C001CC
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.6161.1713127414030031329
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 25E7716A6D;
	Sun, 14 Apr 2024 16:43:33 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id C4D9F16AE0;
	Sun, 14 Apr 2024 16:43:32 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/9] Updates for the 5.0 release
Date: Sun, 14 Apr 2024 13:43:09 -0700
Message-Id: <cover.1713127068.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 20:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5135

Updates for the 5.0 release on top of master-next, including release
notes and migration guide, as well as adjustments for the rest of the
documentation. I think we are still missing a few changes but
unfortunately I've run out of time. Thanks to all who added content
ahead of me though!


The following changes since commit 4b839c460867d685584134dbd322cd9b20f2ae=
6d:

  release-notes-5.0: various additions and improvements (2024-04-12 15:08=
:40 +0200)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib paule/5.0-release
  https://git.yoctoproject.org/poky-contrib/log/?h=3Dpaule/5.0-release

Paul Eggleton (9):
  ref-manual: Add virtual-slash QA check
  ref-manual: add new python classes
  classes: cve_check: add note about remote patches
  variables: add TARGET_DBGSRC_DIR
  dev-manual: update reference to sstate-cache-management script
  dev-manual: update custom distribution section
  release-notes: Add CVEs, recipe upgrades and contributors for 5.0
  migration: Extend migration guide for 5.0
  release-notes: additional features and one known issue for 5.0

 .../dev-manual/custom-distribution.rst        |  34 +-
 documentation/dev-manual/disk-space.rst       |   2 +-
 .../migration-guides/migration-5.0.rst        |  62 +-
 .../migration-guides/release-notes-5.0.rst    | 635 +++++++++++++++++-
 documentation/ref-manual/classes.rst          |  31 +
 documentation/ref-manual/qa-checks.rst        |   8 +
 documentation/ref-manual/variables.rst        |   4 +
 7 files changed, 757 insertions(+), 19 deletions(-)

--=20
2.25.1


