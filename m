Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7F8C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 13:49:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.92327.1638366582455939236
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 05:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 90E2920002;
	Wed,  1 Dec 2021 13:49:40 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH yocto-autobuilder-helper] scripts/run-docs-build: make all
 versions list releases known to master
Date: Wed,  1 Dec 2021 14:49:31 +0100
Message-Id: <20211201134931.193455-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Dec 2021 13:49:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2209

This allows all versions of Bitbake and Yocto Project manuals
to see the manuals for the latest versions.

This also simplifies the release process, not having to update the
releases.rst file for all releases every time a new release is made.

Note that such synchronization is already done for the
switchers.js file (but in a different way). This way, advertised
releases are in sync with switchers.js.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/run-docs-build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 4451018..5d6d24a 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -39,8 +39,11 @@ cp -r ./_build/final/* $outputdir/bitbake/next
 # A decision was made to keep updating all the Sphinx generated docs for the moment,
 # even the ones corresponding to no longer supported releases
 # https://lists.yoctoproject.org/g/docs/message/2193
+# We copy the releases.rst file from master so that all versions of the docs
+# see the latest releases.
 for branch in 1.46 1.48 1.50 1.52; do
     git checkout $branch
+    git checkout master doc/releases.rst
     make clean
     make publish
     mkdir $outputdir/bitbake/$branch
@@ -76,6 +79,7 @@ cp -r ./_build/final/* $outputdir/next
 for branch in dunfell gatesgarth hardknott honister; do
     cd $ypdocs
     git checkout $branch
+    git checkout master documentation/releases.rst
     make clean
     make publish
     mkdir $outputdir/$branch
@@ -97,6 +101,7 @@ for tag in $(git tag --list 'yocto-*'); do
         if [ "$tag" = "yocto-3.3" ] || [ "$tag" = "yocto-3.4" ]; then
             git am "${scriptdir}/${tag}/0001-conf-update-for-release.patch"
         fi
+        git checkout master documentation/releases.rst
         make clean
         make publish
         version=$(echo $tag | cut -c7-)
-- 
2.25.1


