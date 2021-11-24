Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7351CC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 18:59:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.2428.1637780396699371226
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 10:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C891B60006;
	Wed, 24 Nov 2021 18:59:54 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH yocto-autobuilder-helper] scripts/run-docs-build: add comments
Date: Wed, 24 Nov 2021 19:59:52 +0100
Message-Id: <20211124185952.2091223-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16BA90194929E9A2.15594@lists.yoctoproject.org>
References: <16BA90194929E9A2.15594@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Nov 2021 18:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2197

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/run-docs-build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 3db4a97..4451018 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -15,6 +15,7 @@ mkdir buildtools
 $docs_buildtools -y -d $builddir/buildtools
 . $builddir/buildtools/environment-setup*
 
+# Getting the old docbook built docs from an archive. Not rebuilding them.
 #wget https://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-archives-20201105.tar.xz
 docbookarchive=/srv/autobuilder/autobuilder.yoctoproject.org/pub/docbook-mirror/docbook-archives-20201105.tar.xz
 mkdir $outputdir
@@ -35,6 +36,9 @@ mkdir $outputdir/bitbake/next
 cp -r ./_build/final/* $outputdir/bitbake/next
 
 # stable branches
+# A decision was made to keep updating all the Sphinx generated docs for the moment,
+# even the ones corresponding to no longer supported releases
+# https://lists.yoctoproject.org/g/docs/message/2193
 for branch in 1.46 1.48 1.50 1.52; do
     git checkout $branch
     make clean
@@ -68,6 +72,7 @@ mkdir $outputdir/next
 cp -r ./_build/final/* $outputdir/next
 
 # stable branches
+# Again, keeping even the no longer supported releases (see above comment)
 for branch in dunfell gatesgarth hardknott honister; do
     cd $ypdocs
     git checkout $branch
-- 
2.25.1


