Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46014C38162
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.2196.1650388075989292167
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id A59C1E0008;
	Tue, 19 Apr 2022 17:07:53 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [RFC PATCH yocto-autobuilder-helper 5/6] scripts: run-docs-build:
 make latest documentation tag the default version
Date: Tue, 19 Apr 2022 19:07:29 +0200
Message-Id: <20220419170730.124287-6-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419170730.124287-1-foss+yocto@0leil.net>
References: <20220419170730.124287-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2794

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Currently, the master branch is the default branch being displayed by
default when reaching the Yocto docs website. When big changes are
implemented for the next release, these are shown immediately to the
user, even though there is currently no release available for those
changes. This is an issue when e.g. behaviors are changed, new features
are added, variables get renamed or some syntaxes change because the
user might try to use things that aren't available to them yet.

I believe more people are using released version of Yocto
Project/Bitbake than people working on latest master. So let's make the
default version of the docs the latest tag (in terms of version number,
not date of tagging) to avoid too much confusion.

The master branch of the docs is now available at /dev subpath.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 8044b60..faba0fe 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -46,6 +46,9 @@ mkdir $outputdir/bitbake
 # We copy the releases.rst file from master so that all versions of the docs
 # see the latest releases.
 first_sphinx_commit=84ccba0f4aff91528f764523fe1205a354c889ed
+
+latest_branch=$(git branch --remote --contains "$first_sphinx_commit" --format '%(refname:lstrip=3)' --sort='-version:refname' | grep --max-count=1 "[0-9]*\.[0-9]*")
+
 for branch in 1.46 $(git branch --remote --contains "$first_sphinx_commit" --format '%(refname:lstrip=3)'); do
     if [ "$branch" = "HEAD" ]; then
         continue
@@ -61,7 +64,12 @@ for branch in 1.46 $(git branch --remote --contains "$first_sphinx_commit" --for
         branch="next"
 	mkdir $outputdir/bitbake/$branch
     elif [ "$branch" = "master" ]; then
+        branch="dev"
+        mkdir $outputdir/bitbake/$branch
+    elif [ "$branch" = "$latest_branch" ]; then
         branch=""
+        mkdir $outputdir/bitbake/$latest_branch
+        cp -r ./_build/final/* $outputdir/bitbake/$latest_branch
     else
 	mkdir $outputdir/bitbake/$branch
     fi
@@ -83,6 +91,9 @@ cd $ypdocs
 # Again, keeping even the no longer supported releases (see above comment)
 first_sphinx_commit=01dd5af7954e24552aca022917669b27bb0541ed
 first_dunfell_sphinx_commit=c25fe058b88b893b0d146f3ed27320b47cdec236
+
+latest_tag=$(git tag --contains "$first_sphinx_commit" --contains "$first_dunfell_sphinx_commit" --sort="version:refname" 'yocto-*' | tail -1 | sed 's/yocto-//')
+
 for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --format '%(refname:lstrip=3)') $(git tag --contains "$first_sphinx_commit" --contains "$first_dunfell_sphinx_commit" 'yocto-*') transition; do
     if [ "$branch" = "HEAD" ]; then
         continue
@@ -124,7 +135,14 @@ for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --
     if [ "$branch" = "master-next" ]; then
         branch="next"
 	mkdir $outputdir/$branch
-    elif [ "$branch" = "master" ] || [ "$branch" = "transition" ]; then
+    elif [ "$branch" = "master" ]; then
+        branch="dev"
+        mkdir $outputdir/$branch
+    elif [ "$branch" = "$latest_tag" ]; then
+        branch=""
+        mkdir $outputdir/$latest_tag
+        cp -r ./_build/final/* $outputdir/$latest_tag
+    elif [ "$branch" = "transition" ]; then
         branch=""
     else
 	mkdir $outputdir/$branch
-- 
2.35.1


