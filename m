Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE28DCCA47F
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 08:12:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.38160.1658218354995267339
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 01:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 3594140004;
	Tue, 19 Jul 2022 08:12:33 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org,
	yocto@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH yocto-autobuilder-helper 2/2] scripts/run-docs-build: do not
 checkout releases.rst from master anymore
Date: Tue, 19 Jul 2022 10:12:14 +0200
Message-Id: <20220719081214.1924835-3-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719081214.1924835-1-foss+yocto@0leil.net>
References: <20220719081214.1924835-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 08:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3066

Master branch of the yocto-docs now autogenerates the releases.rst file
and the file therefore does not exist anymore.

Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
---
 scripts/run-docs-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 6a71d54..c6b3965 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -122,7 +122,7 @@ for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --
         git am "${scriptdir}/docs-build-patches/${branch}/"000*
     fi
 
-    git checkout origin/master releases.rst sphinx-static/switchers.js.in set_versions.py
+    git checkout origin/master sphinx-static/switchers.js.in set_versions.py
     if [ -e poky.yaml ]; then
         cp poky.yaml poky.yaml.in
         case $branch in
-- 
2.36.1


