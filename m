Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB224CCA481
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 08:12:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.38177.1658218354300844768
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 01:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 542F24000A;
	Tue, 19 Jul 2022 08:12:32 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org,
	yocto@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH yocto-autobuilder-helper 1/2] scripts: run-docs-build: use
 latest version of set_versions.py script
Date: Tue, 19 Jul 2022 10:12:13 +0200
Message-Id: <20220719081214.1924835-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719081214.1924835-1-foss+yocto@0leil.net>
References: <20220719081214.1924835-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 08:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3065

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

`git checkout <pathspec>` without <tree-ish> only undo the changes made
to pathspec compared to HEAD. It is not guaranteed that HEAD is on
latest commit of master branch from upstream when running this script,
therefore let's add the <tree-ish> argument to specify which branch to
use to make sure set_versions.py is the latest, otherwise getlatest
might return the wrong information.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 489fa78..6a71d54 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -97,7 +97,7 @@ cd $ypdocs
 first_sphinx_commit=01dd5af7954e24552aca022917669b27bb0541ed
 first_dunfell_sphinx_commit=c25fe058b88b893b0d146f3ed27320b47cdec236
 
-git checkout set_versions.py
+git checkout origin/master set_versions.py
 #latest_tag=$(git tag --contains "$first_sphinx_commit" --contains "$first_dunfell_sphinx_commit" --sort="version:refname" 'yocto-*' | tail -1 | sed 's/yocto-//')
 latest_tag=$(./set_versions.py getlatest)
 git reset --hard
-- 
2.36.1


