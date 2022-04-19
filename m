Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52582C388F3
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.2098.1650388077052368012
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id ECEBAE0004;
	Tue, 19 Apr 2022 17:07:54 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [RFC PATCH yocto-autobuilder-helper 6/6] scripts: run-docs-build:
 reuse logic to link to latest tag
Date: Tue, 19 Apr 2022 19:07:30 +0200
Message-Id: <20220419170730.124287-7-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419170730.124287-1-foss+yocto@0leil.net>
References: <20220419170730.124287-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2795

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since the latest tag already has a specific handling in the forloop,
let's just move the symlink creation inside the forloop.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index faba0fe..ecc5332 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -142,6 +142,8 @@ for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --
         branch=""
         mkdir $outputdir/$latest_tag
         cp -r ./_build/final/* $outputdir/$latest_tag
+        echo Linking to $latest_tag as current
+        ln -s $latest_tag $outputdir/current
     elif [ "$branch" = "transition" ]; then
         branch=""
     else
@@ -153,11 +155,6 @@ for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --
     git clean -f
 done
 
-# get current release (e.g. most recent tag), and add a 'current' link
-tag=$(git tag --list 'yocto-*' | sort --version-sort | tail -1 | cut -c7-)
-echo Linking to $tag as current
-ln -s $tag $outputdir/current
-
 # Update bitbake switchers.js with the copy from master ypdocs
 cd $outputdir/bitbake
 find . -name switchers.js -exec cp $outputdir/current/_static/switchers.js {} \;
-- 
2.35.1


