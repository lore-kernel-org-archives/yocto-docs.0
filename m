Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922D7EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:51:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16871.1687452681150242287
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 09:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8350C1BF207;
	Thu, 22 Jun 2023 16:51:18 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/4] fix some doc typos
Date: Thu, 22 Jun 2023 18:51:02 +0200
Message-ID: <20230622-typos-202306-v1-0-68489d7f23f2@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jun 2023 16:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4027

Fix a few typos or bad formatting in the docs.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
Quentin Schulz (4):
      docs: sdk-manual: appendix-obtain: fix literal block content
      docs: ref-manual: terms: fix typos in SPDX term
      docs: fix unnecessary double white space
      docs: ref-manual: terms: fix incorrect note directive

 documentation/dev-manual/init-manager.rst              | 2 +-
 documentation/dev-manual/new-recipe.rst                | 2 +-
 documentation/dev-manual/upgrading-recipes.rst         | 2 +-
 documentation/migration-guides/migration-3.4.rst       | 2 +-
 documentation/migration-guides/release-notes-4.0.9.rst | 2 +-
 documentation/overview-manual/concepts.rst             | 2 +-
 documentation/ref-manual/release-process.rst           | 2 +-
 documentation/ref-manual/terms.rst                     | 8 ++++----
 documentation/ref-manual/variables.rst                 | 4 ++--
 documentation/sdk-manual/appendix-obtain.rst           | 4 ++--
 10 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: c74928b1a7b2f285ed70999539f0c630316ad364
change-id: 20230622-typos-202306-1c52d06a7150

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>


