Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463A2C47084
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.2026.1650388074715798100
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 71A27E0009;
	Tue, 19 Apr 2022 17:07:52 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH yocto-autobuilder-helper 4/6] scripts: run-docs-build: use
 set_versions.py and switchers.js.in from master
Date: Tue, 19 Apr 2022 19:07:28 +0200
Message-Id: <20220419170730.124287-5-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419170730.124287-1-foss+yocto@0leil.net>
References: <20220419170730.124287-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2793

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

set_versions.py and switchers.js.in need to be up-to-date so that a
consistent behavior is kept between different branches and tags of the
documentation.

Right now, kirkstone branch is lagging behind master and therefore does
not have the latest changes from master (e.g. the new obsolete
algorithm, which obviously isn't an issue right now, but will be in two
years). Using master version for those scripts also lightens the
maintenance burden.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index a060a31..8044b60 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -102,11 +102,9 @@ for branch in dunfell $(git branch --remote --contains "$first_sphinx_commit" --
         git am "${scriptdir}/docs-build-patches/${branch}/"000*
     fi
 
-    git checkout master releases.rst
+    git checkout master releases.rst sphinx-static/switchers.js.in set_versions.py
     if [ -e poky.yaml ]; then
-        git checkout master sphinx-static/switchers.js.in
         cp poky.yaml poky.yaml.in
-        git checkout master set_versions.py
         case $branch in
             yocto-*)
                 ./set_versions.py $(echo "$branch" | sed 's/yocto-//')
-- 
2.35.1


