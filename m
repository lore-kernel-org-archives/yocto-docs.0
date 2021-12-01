Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99A0C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:00:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.92098.1638367203059259016
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A616A40007;
	Wed,  1 Dec 2021 13:59:54 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH yocto-autobuilder-helper] scripts/run-docs-build: stop using
 the "transition" branch
Date: Wed,  1 Dec 2021 14:59:49 +0100
Message-Id: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:00:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2210

No longer necessary now that the transition from DocBook to Sphinx is over

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/run-docs-build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 4451018..724d709 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -58,12 +58,6 @@ make clean
 make publish
 cp -r ./_build/final/* $outputdir
 
-cd $ypdocs
-git checkout transition
-make clean
-make publish
-cp -r ./_build/final/* $outputdir/
-
 cd $ypdocs
 git checkout master-next
 make clean
-- 
2.25.1


