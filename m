Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BECC352B6
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.2097.1650388073471337346
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 19106E000B;
	Tue, 19 Apr 2022 17:07:50 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH yocto-autobuilder-helper 3/6] scripts: run-docs-build: add
 option to skip upstream rsync
Date: Tue, 19 Apr 2022 19:07:27 +0200
Message-Id: <20220419170730.124287-4-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419170730.124287-1-foss+yocto@0leil.net>
References: <20220419170730.124287-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2792

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The rsync only makes sense for the Autobuilder as most people don't have
access to docs@docs.yoctoproject.org. Therefore, to allow for easier
contribution to this script, let's allow to skip the rsync so the script
can continue to run.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 6569928..a060a31 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -8,6 +8,7 @@
 #                     Can be found here: https://autobuilder.yocto.io/pub/buildtools/
 #   - docbookarchive as the path to old (pre 3.1.5 and Sphinx migration) docs tarball
 #                     Can be found here: https://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-archives-20201105.tar.xz
+#   - PUBLISH (0/1) for whether the files should be rsync'ed to docs.yoctoproject.org
 
 set -e
 set -u
@@ -20,6 +21,7 @@ bbdocs=$(realpath "$3/doc/")
 docs_buildtools=${docs_buildtools:-/srv/autobuilder/autobuilder.yocto.io/pub/buildtools/x86_64-buildtools-docs-nativesdk-standalone-3.2+snapshot-20201105.sh}
 outputdir=$builddir/output
 scriptdir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
+PUBLISH=${PUBLISH:-1}
 
 
 cd $builddir
@@ -68,10 +70,12 @@ for branch in 1.46 $(git branch --remote --contains "$first_sphinx_commit" --for
     git reset --hard
 done
 
-# only sync bitbake folder for now. We need bitbake to be published first
-# since the bitbake intersphinx index will be downloaded to build yocto-docs
-cd $outputdir
-rsync -irlp --checksum --ignore-times --delete bitbake docs@docs.yoctoproject.org:docs/
+if [ "$PUBLISH" -ne 0 ]; then
+    # only sync bitbake folder for now. We need bitbake to be published first
+    # since the bitbake intersphinx index will be downloaded to build yocto-docs
+    cd $outputdir
+    rsync -irlp --checksum --ignore-times --delete bitbake docs@docs.yoctoproject.org:docs/
+fi
 
 cd $ypdocs
 
@@ -142,5 +146,7 @@ ln -s $tag $outputdir/current
 cd $outputdir/bitbake
 find . -name switchers.js -exec cp $outputdir/current/_static/switchers.js {} \;
 
-cd $outputdir
-rsync -irlp --checksum --ignore-times --delete . docs@docs.yoctoproject.org:docs/
+if [ "$PUBLISH" -ne 0 ]; then
+    cd $outputdir
+    rsync -irlp --checksum --ignore-times --delete . docs@docs.yoctoproject.org:docs/
+fi
-- 
2.35.1


