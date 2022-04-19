Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFDFC352A8
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.2116.1650388071464754803
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 89D83E0006;
	Tue, 19 Apr 2022 17:07:48 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH yocto-autobuilder-helper 1/6] scripts: run-docs-build:
 transform argument paths into absolute paths
Date: Tue, 19 Apr 2022 19:07:25 +0200
Message-Id: <20220419170730.124287-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419170730.124287-1-foss+yocto@0leil.net>
References: <20220419170730.124287-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2790

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The script is written in such a way that absolute paths are expected.
Instead of failing weirdly at some point in the script, let's just make
all paths passed to this script absolute by calling realpath on them.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 scripts/run-docs-build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index c501feb..6e25549 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -8,9 +8,9 @@ set -u
 set -o pipefail
 set -x
 
-builddir=$1
-ypdocs=$2/documentation/
-bbdocs=$3/doc/
+builddir=$(realpath "$1")
+ypdocs=$(realpath "$2/documentation/")
+bbdocs=$(realpath "$3/doc/")
 docs_buildtools=/srv/autobuilder/autobuilder.yocto.io/pub/buildtools/x86_64-buildtools-docs-nativesdk-standalone-3.2+snapshot-20201105.sh
 outputdir=$builddir/output
 scriptdir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
-- 
2.35.1


