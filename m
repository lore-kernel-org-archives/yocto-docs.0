Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3275AC352AA
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.2117.1650388072157526648
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id C4663E000A;
	Tue, 19 Apr 2022 17:07:49 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH yocto-autobuilder-helper 2/6] scripts: run-docs-build: allow
 to pass buildtools script and docbook tarball paths
Date: Tue, 19 Apr 2022 19:07:26 +0200
Message-Id: <20220419170730.124287-3-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419170730.124287-1-foss+yocto@0leil.net>
References: <20220419170730.124287-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2791

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Currently, the path to buildtools script and docbook tarball are
hardcoded to work on Yocto Project Autobuilder. However, this makes it
harder to contribute to this script because it is very unlikely those
paths exist on a developer PC.

Instead, let's allow to override variables by using the environment and
make the current hardcoded values the default ones.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 6e25549..6569928 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -2,6 +2,12 @@
 # Called with $1 as the build directory
 #             $2 as the path to yocto-docs
 #             $3 as the path to bitbake
+#
+# Environment variables:
+#   - docs_buildtools as the path to buildtools script for the docs.
+#                     Can be found here: https://autobuilder.yocto.io/pub/buildtools/
+#   - docbookarchive as the path to old (pre 3.1.5 and Sphinx migration) docs tarball
+#                     Can be found here: https://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-archives-20201105.tar.xz
 
 set -e
 set -u
@@ -11,7 +17,7 @@ set -x
 builddir=$(realpath "$1")
 ypdocs=$(realpath "$2/documentation/")
 bbdocs=$(realpath "$3/doc/")
-docs_buildtools=/srv/autobuilder/autobuilder.yocto.io/pub/buildtools/x86_64-buildtools-docs-nativesdk-standalone-3.2+snapshot-20201105.sh
+docs_buildtools=${docs_buildtools:-/srv/autobuilder/autobuilder.yocto.io/pub/buildtools/x86_64-buildtools-docs-nativesdk-standalone-3.2+snapshot-20201105.sh}
 outputdir=$builddir/output
 scriptdir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
 
@@ -23,7 +29,7 @@ $docs_buildtools -y -d $builddir/buildtools
 
 # Getting the old docbook built docs from an archive. Not rebuilding them.
 #wget https://downloads.yoctoproject.org/mirror/docbook-mirror/docbook-archives-20201105.tar.xz
-docbookarchive=/srv/autobuilder/autobuilder.yocto.io/pub/docbook-mirror/docbook-archives-20201105.tar.xz
+docbookarchive=${docbookarchive:-/srv/autobuilder/autobuilder.yocto.io/pub/docbook-mirror/docbook-archives-20201105.tar.xz}
 mkdir $outputdir
 cd $outputdir
 echo Extracing old content from archive
-- 
2.35.1


