Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4172C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 16:20:33 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.42.1634833232571691034
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id F360C200006;
	Thu, 21 Oct 2021 16:20:29 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: paul@pbarker.dev,
	bitbake-devel@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/1] Document BB_GIT_SHALLOW and friends
Date: Thu, 21 Oct 2021 18:20:15 +0200
Message-Id: <20211021162016.2141153-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 16:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2028

An update to a patch previously sent for inclusion in the
yocto-docs repository.

Changes since V1:
- Adapt source paths to the Bitbake manual
- Add a missing reference as suggested by Quentin Schulz
- Add a reference to what are shallow git clones, as suggested
  by Quentin Schulz
- Add a link to the source code of "git-make-shallow" in git

Paul Barker (1):
  doc: bitbake-user-manual: Document BB_GIT_SHALLOW and friends

 .../bitbake-user-manual-ref-variables.rst     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

-- 
2.25.1


