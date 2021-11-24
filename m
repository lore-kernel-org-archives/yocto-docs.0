Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B51C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:16:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.954.1637774190716447415
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 09:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BCCDAC000B;
	Wed, 24 Nov 2021 17:16:28 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH yocto-autobuilder-helper] scripts/run-docs-build: remove
 gatesgarth
Date: Wed, 24 Nov 2021 18:16:17 +0100
Message-Id: <20211124171617.2088604-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 17:16:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2192

Together with the corresponding Bitbake version, which are no
longer supported.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/run-docs-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 3db4a97..5e1d649 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -35,7 +35,7 @@ mkdir $outputdir/bitbake/next
 cp -r ./_build/final/* $outputdir/bitbake/next
 
 # stable branches
-for branch in 1.46 1.48 1.50 1.52; do
+for branch in 1.46 1.50 1.52; do
     git checkout $branch
     make clean
     make publish
@@ -68,7 +68,7 @@ mkdir $outputdir/next
 cp -r ./_build/final/* $outputdir/next
 
 # stable branches
-for branch in dunfell gatesgarth hardknott honister; do
+for branch in dunfell hardknott honister; do
     cd $ypdocs
     git checkout $branch
     make clean
-- 
2.25.1


