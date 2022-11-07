Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A5FC4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:22:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.285.1667838146644164997
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 08:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 7506360007;
	Mon,  7 Nov 2022 16:22:23 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH 0/2] fix a couple of inconsistencies
Date: Mon,  7 Nov 2022 17:22:04 +0100
Message-Id: <20221107-upstream-misc-fixes-v1-0-532ba173fc6f@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Nov 2022 16:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3461

Fix some section naming inconsistency and a missing closing parenthesis.

Cheers,
Quentin

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

---
Quentin Schulz (2):
      docs: ref-manual: classes: fix section name for github-releases
      docs: ref-manual: classes: add missing closing parenthesis

 documentation/ref-manual/classes.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: dce50679242d39f133e0cde5c8483b5e69f3eb54
change-id: 20221107-upstream-misc-fixes-2ccb722bc994

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

